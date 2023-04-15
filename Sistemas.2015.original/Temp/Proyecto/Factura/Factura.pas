unit Factura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, DBCtrls, Mask;

type
  TfrmFactura = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Table: TTable;
    Panel4: TPanel;
    TableIdFactura: TSmallintField;
    TableNumeroFactura: TStringField;
    TableFecha: TDateTimeField;
    TableIdProveedor: TSmallintField;
    TablePagado: TBooleanField;
    TableObservaciones: TStringField;
    TableTipo: TStringField;
    TableIdObra: TSmallintField;
    Label1: TLabel;
    edtNumero: TDBEdit;
    DataSource1: TDataSource;
    dtpFecha: TDateTimePicker;
    Label2: TLabel;
    PROV: TTable;
    PROVIdProveedor: TSmallintField;
    PROVRazonSocial: TStringField;
    TableProveedor: TStringField;
    Label3: TLabel;
    cmbProveedor: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    rgTipo: TDBRadioGroup;
    OBRA: TTable;
    OBRAIdObra: TSmallintField;
    OBRANombre: TStringField;
    TableObra: TStringField;
    Label4: TLabel;
    cmbObra: TDBLookupComboBox;
    btnBuscarObra: TSpeedButton;
    btnBuscarProveedor: TSpeedButton;
    dsDatos: TDataSource;
    Panel5: TPanel;
    btnAgregar: TBitBtn;
    btnEliminar: TBitBtn;
    grdDatos: TDBGrid;
    ITEM_MAT_: TTable;
    ITEM_SERV_: TTable;
    ITEM_MAT_IdItemFactura: TIntegerField;
    ITEM_MAT_IdMaterial: TSmallintField;
    ITEM_MAT_Cantidad: TSmallintField;
    ITEM_MAT_PrecioUnitario: TFloatField;
    ITEM_SERV_IdItemFactura: TIntegerField;
    ITEM_SERV_IdServicio: TSmallintField;
    ITEM_SERV_Precio: TFloatField;
    MAT: TTable;
    SERV: TTable;
    MATIdMaterial: TSmallintField;
    MATDescrip: TStringField;
    SERVIdServicio: TSmallintField;
    SERVDescrip: TStringField;
    ITEM_MAT_Material: TStringField;
    ITEM_SERV_Servicio: TStringField;
    ITEM_SERV_IdFactura: TSmallintField;
    ITEM_MAT_IdFactura: TSmallintField;
    ITEM_MAT_Parcial: TCurrencyField;
    txtTotal: TStaticText;
    lblRemitos: TLabel;
    ComboRemito: TComboBox;
    btnElegirRemito: TBitBtn;
    REM: TTable;
    qryItemsRemito: TQuery;
    qryItemsRemitoIdMaterial: TSmallintField;
    qryItemsRemitoCantidad: TSmallintField;
    REMIdRemito: TSmallintField;
    REMIdFactura: TSmallintField;
    qryRemitos: TQuery;
    qryRemitosProveedor: TStringField;
    qryRemitosNumero: TStringField;
    dtpFechaPrev: TDateTimePicker;
    Label5: TLabel;
    TableFechaPrevista: TDateTimeField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarObraClick(Sender: TObject);
    procedure btnBuscarProveedorClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure ITEM_MAT_CalcFields(DataSet: TDataSet);
    procedure ITEM_AfterEdit(DataSet: TDataSet);
    procedure btnElegirRemitoClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gIdFactura: Word;
    gTotal: Currency;
    procedure PrepararFormulario(M: Byte; Id: Word);
    procedure AbrirTablaItems(IdFactura: Word);
    procedure AgregarMaterial;
    procedure AgregarServicio;
    procedure EliminarMaterial;
    procedure EliminarServicio;
    procedure MostrarTotal;
    procedure SetDataSet(DS: TDataSet);
    function DatosValidos: Boolean;
    function GuardoFacturaOK: Boolean;
    procedure AgregarItemsRemito(IdRemito: Smallint);
    procedure AbrirQryRemitosAsociados;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmFactura: TfrmFactura;

implementation

uses Comunes, Util, MessagesDataSets, ElecObra, ElecProveedor, PoolQuerys,
  ElecMaterial, ElecServicio, ElecRemito, DataBases, PoolMovimientos;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmFactura.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmFactura.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  try
    Existe(Table, 'IdFactura', Id);
    Table.Delete;
    Table.Close;
    except on EDBEngineError do
    begin
      MsjError('Se produjo un error al intentar eliminar. ' +
               'Compruebe que el ítem que desea borrar no haya sido utilizado.');
      Exit;
    end;
  end;

  Result := True;
end;

function TfrmFactura.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmFactura.PrepararFormulario(M: Byte; Id: Word);
begin
  if not dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.StartTransaction;

  if M = 0 then //Alta
  begin
    Table.Open;
    Table.Append;
    dtpFecha.Date := Date;
    dtpFechaPrev.Date := Date + 30;
    Table.FieldByName('Tipo').AsString := 'MATERIALES';
    Table.FieldByName('Pagado').AsBoolean := False;

    //En este punto no se puede abrir la tabla de ítems correspondiente debido
    //a que no se conoce que Id tendrá la factura. Se hace abrir la tabla de
    //ítems para la factura 0 (inexistente) para que las columnas muestren un titulo
    gIdFactura := 0;
  end
  else //Modificación
  begin
    Existe(Table, 'IdFactura', Id);
    dtpFecha.Date := Table.FieldByName('Fecha').AsDateTime;
    dtpFechaPrev.Date := Table.FieldByName('FechaPrevista').AsDateTime;
    Table.Edit;
    gIdFactura := Table.FieldByName('IdFactura').AsInteger;
    AbrirQryRemitosAsociados;
  end;
  AbrirTablaItems(gIdFactura);
  ActiveControl := edtNumero;
end;

function TfrmFactura.DatosValidos: Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 0 to Table.Fields.Count - 1 do
    if (Table.Fields[i].Visible) and (Table.Fields[i].FieldKind <> fkCalculated) then
    begin
      if Table.Fields[i].FieldKind = fkData then
      begin
        if (Table.Fields[i].Required) and (Table.Fields[i].IsNull) then
        begin
          MsjError('El campo ' + #39 + Table.Fields[i].DisplayLabel + #39 + ' debe tener un valor.');
          Exit;
        end;
      end
      else if Table.Fields[i].FieldKind = fkLookup then
      begin
        if (Table.FieldByName(Table.Fields[i].LookupKeyFields).Required) and
           (Table.FieldByName(Table.Fields[i].LookupKeyFields).IsNull) then
        begin
          MsjError('El campo ' + #39 + Table.Fields[i].DisplayLabel + #39 + ' debe tener un valor.');
          Exit;
        end;
      end;
    end;

  Result := True;
end;

procedure TfrmFactura.AbrirTablaItems(IdFactura: Word);
var
  T: TTable;
begin
  if Table.FieldByName('Tipo').AsString = 'MATERIALES' then
    T := ITEM_MAT_
  else
    T := ITEM_SERV_;

  T.Filtered := False;
  Filtrar(T, 'IdFactura=' + IntToStr(IdFactura));
  //El tipo de factura solo se puede cambiar si no hay ítem cargados.
  rgTipo.Enabled := T.RecordCount = 0;
  btnEliminar.Enabled := T.RecordCount > 0;
  MostrarTotal;
  SetDataSet(T);
end;

procedure TfrmFactura.MostrarTotal;
var
  T: TTable;
  Campo: String;
begin
  if Table.FieldByName('Tipo').AsString = 'MATERIALES' then
  begin
    T := ITEM_MAT_;
    Campo := 'Parcial';
  end
  else
  begin
    T := ITEM_SERV_;
    Campo := 'Precio';
  end;

  gTotal := SumaColumna(T, Campo);
  txtTotal.Caption := 'Total: ' + CurrToStrF(gTotal, ffCurrency, 2);
end;

function TfrmFactura.GuardoFacturaOK: Boolean;
begin
  Result := False;

  Table.FieldByName('Fecha').AsDateTime := dtpFecha.Date;
  Table.FieldByName('FechaPrevista').AsDateTime := dtpFechaPrev.Date;
  if not DatosValidos then Exit;

  try
    Table.Post;
    Table.Close;
    except on E: EDBEngineError do
    begin
      MsjError('Se produjo un error concerniente a los datos del panel superior.');
      Table.Cancel;
      Exit;
    end;
  end;

  if gIdFactura = 0 then
    gIdFactura := dmQuerys.GetMaxIntValue('Factura', 'IdFactura');
  Existe(Table, 'IdFactura', gIdFactura);
  Table.Edit;
  Result := True;
end;

procedure TfrmFactura.AgregarMaterial;
var
  form: TfrmElecMateriales;
  Id: Word;
  R: Boolean;
begin
  if GuardoFacturaOK then
  begin
    form := TfrmElecMateriales.Create(nil);
    R := form.GetId(Id);
    form.Release;

    if R then
    begin
      ITEM_MAT_.Open;
      ITEM_MAT_.Append;
      ITEM_MAT_IdFactura.Value := gIdFactura;
      ITEM_MAT_IdMaterial.Value := Id;
      ITEM_MAT_Cantidad.Value := 1;
      ITEM_MAT_PrecioUnitario.Value := 0;
      ITEM_MAT_.Post;
      grdDatos.Refresh;
    end;
  end;
end;

procedure TfrmFactura.AgregarServicio;
var
  form: TfrmElecServicios;
  Id: Word;
  R: Boolean;
begin
  if GuardoFacturaOK then
  begin
    form := TfrmElecServicios.Create(nil);
    R := form.GetId(Id);
    form.Release;

    if R then
    begin
      ITEM_SERV_.Open;
      ITEM_SERV_.Append;
      ITEM_SERV_IdFactura.Value := gIdFactura;
      ITEM_SERV_IdServicio.Value := Id;
      ITEM_SERV_Precio.Value := 0;
      ITEM_SERV_.Post;
      grdDatos.Refresh;
    end;
  end;
end;

procedure TfrmFactura.EliminarMaterial;
begin
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
    ITEM_MAT_.Delete;
end;

procedure TfrmFactura.EliminarServicio;
begin
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
    ITEM_SERV_.Delete;
end;

procedure TfrmFactura.SetDataSet(DS: TDataSet);
var
  i: Byte;
begin
  if dsDatos.DataSet <> nil then
  begin
    GuardarEstadoGrilla(dsDatos.DataSet.Name + '.col', grdDatos);
    grdDatos.Columns.Clear;
  end;

  RecuperarEstadoGrilla(DS.Name + '.col', grdDatos );
  dsDatos.DataSet := DS;

  for i := 0 to grdDatos.Columns.Count - 1 do
    if grdDatos.Columns[i].Width > 450 then grdDatos.Columns[i].Width := 450;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmFactura.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmFactura.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmFactura.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmFactura.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmFactura.btnAceptarClick(Sender: TObject);
begin
  MostrarTotal;
  if GuardoFacturaOK then
  begin
    if Editando(ITEM_MAT_) then ITEM_MAT_.Post;
    if Editando(ITEM_SERV_) then ITEM_SERV_.Post;
    if dmDataBases.RavierDB.InTransaction then
       dmDataBases.RavierDB.Commit;
    ModalResult := mrOk;
  end;
end;

procedure TfrmFactura.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  if Editando(Table) then Table.Cancel;
  if Editando(ITEM_MAT_) then ITEM_MAT_.Cancel;
  if Editando(ITEM_SERV_) then ITEM_SERV_.Cancel;
  if dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.Rollback;
  ModalResult := mrCancel;
end;

procedure TfrmFactura.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmFactura.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
  GuardarEstadoGrilla(dsDatos.DataSet.Name + '.col', grdDatos);
end;

procedure TfrmFactura.btnBuscarObraClick(Sender: TObject);
var
  form: TfrmElecObra;
  Id: Smallint;
  R: Boolean;
begin
  form := TfrmElecObra.Create(nil);
  R := form.GetId(Id);
  form.Release;
  if R then Table.FieldByName('IdObra').AsInteger := Id;
end;

procedure TfrmFactura.btnBuscarProveedorClick(Sender: TObject);
var
  form: TfrmElecProveedor;
  Id: Word;
  R: Boolean;
begin
  form := TfrmElecProveedor.Create(nil);
  R := form.GetId(Id);
  form.Release;
  if R then Table.FieldByName('IdProveedor').AsInteger := Id;
end;

procedure TfrmFactura.btnAgregarClick(Sender: TObject);
begin
  if Table.FieldByName('Tipo').AsString = 'MATERIALES' then
    AgregarMaterial
  else
    AgregarServicio;

  AbrirTablaItems(gIdFactura);
end;

procedure TfrmFactura.btnEliminarClick(Sender: TObject);
begin
  if Table.FieldByName('Tipo').AsString = 'MATERIALES' then
    EliminarMaterial
  else
    EliminarServicio;

  AbrirTablaItems(gIdFactura);
end;

procedure TfrmFactura.ITEM_MAT_CalcFields(DataSet: TDataSet);
begin
  ITEM_MAT_Parcial.Value := ITEM_MAT_PrecioUnitario.Value * ITEM_MAT_Cantidad.Value;
end;

procedure TfrmFactura.ITEM_AfterEdit(DataSet: TDataSet);
begin
  MostrarTotal;
end;

procedure TfrmFactura.btnElegirRemitoClick(Sender: TObject);
var
  Id: Smallint;
  Num: String;
  Fecha: TDate;
  R: Boolean;
  form: TfrmElecRemito;
begin
  if GuardoFacturaOK then
  begin
    form := TfrmElecRemito.Create(nil);
    R := form.GetRemito(Table.FieldByName('IdObra').AsInteger,
                       Table.FieldByName('IdProveedor').AsInteger, Id, Num, Fecha);
    form.Release;

    if R then
    begin
      ComboRemito.Items.Add(DateToStr(Fecha) + ' - ' + Num);
      ComboRemito.Text := DateToStr(Fecha) + ' - ' + Num;

      Existe(REM, 'IdRemito', Id);
      REM.Edit;
      REMIdFactura.Value := gIdFactura;
      REM.Post;
      REM.Close;

      AgregarItemsRemito(Id);
    end;
  end;
end;

procedure TfrmFactura.AgregarItemsRemito(IdRemito: Smallint);
begin
  qryItemsRemito.ParamByName('R').AsInteger := IdRemito;
  qryItemsRemito.Open;
  qryItemsRemito.First;
  while not qryItemsRemito.Eof do
  begin
    if Existe(ITEM_MAT_, 'IdFactura', 'IdMaterial', VarArrayOf([gIdFactura, qryItemsRemitoIdMaterial.Value])) then
    begin
      ITEM_MAT_.Edit;
      ITEM_MAT_Cantidad.Value := ITEM_MAT_Cantidad.Value + qryItemsRemitoCantidad.Value;
    end
    else
    begin
      ITEM_MAT_.Append;
      ITEM_MAT_IdFactura.Value := gIdFactura;
      ITEM_MAT_IdMaterial.Value := qryItemsRemitoIdMaterial.Value;
      ITEM_MAT_Cantidad.Value := qryItemsRemitoCantidad.Value;
    end;
    ITEM_MAT_.Post;
    qryItemsRemito.Next;
  end;
  qryItemsRemito.Close;
  AbrirTablaItems(gIdFactura);
end;

procedure TfrmFactura.rgTipoClick(Sender: TObject);
begin
  lblRemitos.Visible := (rgTipo.ItemIndex = 0);
  ComboRemito.Visible := (rgTipo.ItemIndex = 0);
  btnElegirRemito.Visible := (rgTipo.ItemIndex = 0);
end;

procedure TfrmFactura.AbrirQryRemitosAsociados;
begin
  ComboRemito.Clear;
  qryRemitos.ParamByName('F').AsInteger := gIdFactura;
  qryRemitos.Open;
  qryRemitos.First;
  while not qryRemitos.Eof do
  begin
    ComboRemito.Items.Add(qryRemitosProveedor.Text + ' - ' + qryRemitosNumero.Text);
    qryRemitos.Next;
  end;
  qryRemitos.Close;
end;

end.

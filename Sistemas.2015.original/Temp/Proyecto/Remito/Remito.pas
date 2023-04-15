unit Remito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, DBCtrls, Mask;

type
  TfrmRemito = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Table: TTable;
    Panel4: TPanel;
    Label1: TLabel;
    edtNumero: TDBEdit;
    DataSource1: TDataSource;
    dtpFecha: TDateTimePicker;
    Label2: TLabel;
    PROV: TTable;
    PROVIdProveedor: TSmallintField;
    PROVRazonSocial: TStringField;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    OBRA: TTable;
    OBRAIdObra: TSmallintField;
    OBRANombre: TStringField;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    btnBuscarObra: TSpeedButton;
    btnBuscarProveedor: TSpeedButton;
    dsDatos: TDataSource;
    Panel5: TPanel;
    btnAgregar: TBitBtn;
    btnEliminar: TBitBtn;
    grdDatos: TDBGrid;
    EMP: TTable;
    MAT: TTable;
    MATIdMaterial: TSmallintField;
    MATDescrip: TStringField;
    Label7: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    btnBuscarRecibe: TSpeedButton;
    EMPIdEmpleado: TSmallintField;
    EMPApellido: TStringField;
    EMPNombres: TStringField;
    EMPNombreEmpleado: TStringField;
    ITEM: TTable;
    TableIdRemito: TSmallintField;
    TableIdRecibe: TSmallintField;
    TableIdFactura: TSmallintField;
    TableIdProveedor: TSmallintField;
    TableIdObra: TSmallintField;
    TableFecha: TDateTimeField;
    TableRecibe: TStringField;
    TableProveedor: TStringField;
    TableObra: TStringField;
    ITEMIdRemito: TSmallintField;
    ITEMIdMaterial: TSmallintField;
    ITEMCantidad: TSmallintField;
    ITEMMaterial: TStringField;
    TableNumero: TStringField;
    qryItemsPedido: TQuery;
    qryItemsPedidoIdMaterial: TSmallintField;
    qryItemsPedidoCantidad: TSmallintField;
    PED: TTable;
    PEDIdPedido: TSmallintField;
    PEDIdRemito: TSmallintField;
    Label5: TLabel;
    ComboPedido: TComboBox;
    btnElegirPedido: TBitBtn;
    qryPedidos: TQuery;
    qryPedidosNumero: TStringField;
    qryPedidosProveedor: TStringField;
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
    procedure EMPCalcFields(DataSet: TDataSet);
    procedure btnBuscarEmpleadoClick(Sender: TObject);
    procedure btnElegirPedidoClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gIdRemito: Word;
    procedure PrepararFormulario(M: Byte; Id: Word);
    procedure AbrirTablaItems(IdRemito: Word);
    procedure AgregarMaterial;
    procedure EliminarMaterial;
    procedure SetDataSet(DS: TDataSet);
    function DatosValidos: Boolean;
    function GuardoRemitoOK: Boolean;
    procedure AgregarItemsPedido(IdPedido: Smallint);
    procedure AbrirQryPedidosAsociados;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmRemito: TfrmRemito;

implementation

uses Comunes, Util, MessagesDataSets, ElecObra, ElecProveedor, PoolQuerys,
  ElecMaterial, ElecServicio, ElecEmpleado, ElecPedido, DataBases;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmRemito.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmRemito.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  try
    Existe(Table, 'IdRemito', Id);
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

function TfrmRemito.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmRemito.PrepararFormulario(M: Byte; Id: Word);
begin
  if not dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.StartTransaction;

  ComboPedido.Clear;
  if M = 0 then //Alta
  begin
    Table.Open;
    Table.Append;
    dtpFecha.Date := Date;

    gIdRemito := 0;
  end
  else //Modificación
  begin
    Existe(Table, 'IdRemito', Id);
    dtpFecha.Date := Table.FieldByName('Fecha').AsDateTime;
    Table.Edit;
    gIdRemito := Table.FieldByName('IdRemito').AsInteger;
    AbrirQryPedidosAsociados;
  end;
  AbrirTablaItems(gIdRemito);
  ActiveControl := edtNumero;
end;

function TfrmRemito.DatosValidos: Boolean;
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
        if (Table.FieldByName(Table.Fields[i].KeyFields).Required) and
           (Table.FieldByName(Table.Fields[i].KeyFields).IsNull) then
        begin
          MsjError('El campo ' + #39 + Table.Fields[i].DisplayLabel + #39 + ' debe tener un valor.');
          Exit;
        end;
      end;
    end;

  Result := True;
end;

procedure TfrmRemito.AbrirTablaItems(IdRemito: Word);
var
  T: TTable;
begin
  T := ITEM;

  T.Filtered := False;
  Filtrar(T, 'IdRemito=' + IntToStr(IdRemito));
  btnEliminar.Enabled := T.RecordCount > 0;
  SetDataSet(T);
end;

function TfrmRemito.GuardoRemitoOK: Boolean;
begin
  Result := False;

  Table.FieldByName('Fecha').AsDateTime := dtpFecha.Date;
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

  if gIdRemito = 0 then
    gIdRemito := dmQuerys.GetMaxIntValue('Remito', 'IdRemito');
  Existe(Table, 'IdRemito', gIdRemito);
  Table.Edit;
  Result := True;
end;

procedure TfrmRemito.AgregarMaterial;
var
  form: TfrmElecMateriales;
  Id: Word;
  R: Boolean;
begin
  if GuardoRemitoOK then
  begin
    form := TfrmElecMateriales.Create(nil);
    R := form.GetId(Id);
    form.Release;

    if R then
    begin
      ITEM.Open;
      ITEM.Append;
      ITEMIdRemito.Value := gIdRemito;
      ITEMIdMaterial.Value := Id;
      ITEMCantidad.Value := 1;
      ITEM.Post;
      grdDatos.Refresh;
    end;
  end;
end;

procedure TfrmRemito.EliminarMaterial;
begin
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
    ITEM.Delete;
end;

procedure TfrmRemito.SetDataSet(DS: TDataSet);
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

procedure TfrmRemito.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmRemito.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmRemito.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmRemito.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmRemito.btnAceptarClick(Sender: TObject);
begin
  if GuardoRemitoOK then
  begin
    if Editando(ITEM) then ITEM.Post;
    if dmDataBases.RavierDB.InTransaction then
      dmDataBases.RavierDB.Commit;
    ModalResult := mrOk;
  end;
end;

procedure TfrmRemito.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  if Editando(Table) then Table.Cancel;
  if Editando(ITEM) then ITEM.Cancel;
  if dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.Rollback;
  ModalResult := mrCancel;
end;

procedure TfrmRemito.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmRemito.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
  GuardarEstadoGrilla(dsDatos.DataSet.Name + '.col', grdDatos);
end;

procedure TfrmRemito.btnBuscarObraClick(Sender: TObject);
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

procedure TfrmRemito.btnBuscarProveedorClick(Sender: TObject);
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

procedure TfrmRemito.btnAgregarClick(Sender: TObject);
begin
  AgregarMaterial;
  AbrirTablaItems(gIdRemito);
end;

procedure TfrmRemito.btnEliminarClick(Sender: TObject);
begin
  EliminarMaterial;

  AbrirTablaItems(gIdRemito);
end;

procedure TfrmRemito.EMPCalcFields(DataSet: TDataSet);
begin
  EMPNombreEmpleado.Text := EMPApellido.Text + ', ' + EMPNombres.Text;
end;

procedure TfrmRemito.btnBuscarEmpleadoClick(Sender: TObject);
var
  Id: Smallint;
  R: Boolean;
  form: TfrmElecEmpleado;
begin
  form := TfrmElecEmpleado.Create(nil);
  R := form.GetId(Id);
  form.Release;

  if R then
    Table.FieldByName('IdRecibe').AsInteger := Id;
end;

procedure TfrmRemito.btnElegirPedidoClick(Sender: TObject);
var
  Id: Smallint;
  Num: String;
  Fecha: TDate;
  R: Boolean;
  form: TfrmElecPedido;
begin
  if GuardoRemitoOK then
  begin
    form := TfrmElecPedido.Create(nil);
    R := form.GetPedido(Table.FieldByName('IdObra').AsInteger,
                        Table.FieldByName('IdProveedor').AsInteger, Id, Num, Fecha);
    form.Release;

    if R then
    begin
      ComboPedido.Items.Add(DateToStr(Fecha) + ' - ' + Num);
      ComboPedido.Text := DateToStr(Fecha) + ' - ' + Num;

      Existe(PED, 'IdPedido', Id);
      PED.Edit;
      PEDIdRemito.Value := gIdRemito;
      PED.Post;
      PED.Close;

      AgregarItemsPedido(Id);
    end;
  end;
end;

procedure TfrmRemito.AgregarItemsPedido(IdPedido: Smallint);
begin
  qryItemsPedido.ParamByName('P').AsInteger := IdPedido;
  qryItemsPedido.Open;
  qryItemsPedido.First;
  while not qryItemsPedido.Eof do
  begin
    if Existe(ITEM, 'IdRemito', 'IdMaterial', VarArrayOf([gIdRemito, qryItemsPedidoIdMaterial.Value])) then
    begin
      ITEM.Edit;
      ITEMCantidad.Value := ITEMCantidad.Value + qryItemsPedidoCantidad.Value;
    end
    else
    begin
      ITEM.Append;
      ITEMIdRemito.Value := gIdRemito;
      ITEMIdMaterial.Value := qryItemsPedidoIdMaterial.Value;
      ITEMCantidad.Value := qryItemsPedidoCantidad.Value;
    end;
    ITEM.Post;
    qryItemsPedido.Next;
  end;
  qryItemsPedido.Close;
  AbrirTablaItems(gIdRemito);
end;

procedure TfrmRemito.AbrirQryPedidosAsociados;
begin
  ComboPedido.Clear;
  qryPedidos.ParamByName('R').AsInteger := gIdRemito;
  qryPedidos.Open;
  qryPedidos.First;
  while not qryPedidos.Eof do
  begin
    ComboPedido.Items.Add(qryPedidosProveedor.Text + ' - ' + qryPedidosNumero.Text);
    qryPedidos.Next;
  end;
  qryPedidos.Close;
end;

end.

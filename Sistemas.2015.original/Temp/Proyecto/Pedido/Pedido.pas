unit Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, DBCtrls, Mask;

type
  TfrmPedido = class(TForm)
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
    TableIdPedido: TSmallintField;
    TableNumero: TStringField;
    TableIdSolicitante: TSmallintField;
    TableIdProcesa: TSmallintField;
    TableIdAutoriza: TSmallintField;
    TableIdProveedor: TSmallintField;
    TableIdObra: TSmallintField;
    TableIdRemito: TSmallintField;
    TableFecha: TDateTimeField;
    TableMedio: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    btnBuscarAutorizado: TSpeedButton;
    btnBuscarProcesa: TSpeedButton;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label7: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    btnBuscarSolicitante: TSpeedButton;
    EMPIdEmpleado: TSmallintField;
    EMPApellido: TStringField;
    EMPNombres: TStringField;
    EMPNombreEmpleado: TStringField;
    TableSolicitante: TStringField;
    TableAutoriza: TStringField;
    TableProcesa: TStringField;
    ITEM: TTable;
    ITEMIdPedido: TSmallintField;
    ITEMIdMaterial: TSmallintField;
    ITEMCantidad: TSmallintField;
    ITEMMaterial: TStringField;
    TableObra: TStringField;
    TableProveedor: TStringField;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
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

  private
    Teclas, Modo: Byte;
    gIdPedido: Word;
    procedure PrepararFormulario(M: Byte; Id: Word);
    procedure AbrirTablaItems(IdPedido: Word);
    procedure AgregarMaterial;
    procedure EliminarMaterial;
    procedure SetDataSet(DS: TDataSet);
    function DatosValidos: Boolean;
    function GuardoPedidoOK: Boolean;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmPedido: TfrmPedido;

implementation

uses Comunes, Util, MessagesDataSets, ElecObra, ElecProveedor, PoolQuerys,
  ElecMaterial, ElecServicio, ElecEmpleado, DataBases;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmPedido.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmPedido.Eliminar(Id: Word): Boolean;
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

function TfrmPedido.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmPedido.PrepararFormulario(M: Byte; Id: Word);
begin
  if not dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.StartTransaction;

  if M = 0 then //Alta
  begin
    Table.Open;
    Table.Append;
    dtpFecha.Date := Date;

    gIdPedido := 0;
  end
  else //Modificación
  begin
    Existe(Table, 'IdPedido', Id);
    dtpFecha.Date := Table.FieldByName('Fecha').AsDateTime;
    Table.Edit;
    gIdPedido := Table.FieldByName('IdPedido').AsInteger;
  end;
  AbrirTablaItems(gIdPedido);
  ActiveControl := edtNumero;
end;

function TfrmPedido.DatosValidos: Boolean;
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

procedure TfrmPedido.AbrirTablaItems(IdPedido: Word);
var
  T: TTable;
begin
  T := ITEM;

  T.Filtered := False;
  Filtrar(T, 'IdPedido=' + IntToStr(IdPedido));
  btnEliminar.Enabled := T.RecordCount > 0;
  SetDataSet(T);
end;

function TfrmPedido.GuardoPedidoOK: Boolean;
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

  if gIdPedido = 0 then
    gIdPedido := dmQuerys.GetMaxIntValue('Pedido', 'IdPedido');
  Existe(Table, 'IdPedido', gIdPedido);
  Table.Edit;
  Result := True;
end;

procedure TfrmPedido.AgregarMaterial;
var
  form: TfrmElecMateriales;
  Id: Word;
  R: Boolean;
begin
  if GuardoPedidoOK then
  begin
    form := TfrmElecMateriales.Create(nil);
    R := form.GetId(Id);
    form.Release;

    if R then
    begin
      ITEM.Open;
      ITEM.Append;
      ITEMIdPedido.Value := gIdPedido;
      ITEMIdMaterial.Value := Id;
      ITEMCantidad.Value := 1;
      ITEM.Post;
      grdDatos.Refresh;
    end;
  end;
end;

procedure TfrmPedido.EliminarMaterial;
begin
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
    ITEM.Delete;
end;

procedure TfrmPedido.SetDataSet(DS: TDataSet);
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

procedure TfrmPedido.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmPedido.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmPedido.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmPedido.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmPedido.btnAceptarClick(Sender: TObject);
begin
  if GuardoPedidoOK then
  begin
    if Editando(ITEM) then ITEM.Post;
    if dmDataBases.RavierDB.InTransaction then
      dmDataBases.RavierDB.Commit;
    ModalResult := mrOk;
  end;
end;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  if Editando(Table) then Table.Cancel;
  if Editando(ITEM) then ITEM.Cancel;
  if dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.Rollback;
  ModalResult := mrCancel;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmPedido.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
  GuardarEstadoGrilla(dsDatos.DataSet.Name + '.col', grdDatos);
end;

procedure TfrmPedido.btnBuscarObraClick(Sender: TObject);
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

procedure TfrmPedido.btnBuscarProveedorClick(Sender: TObject);
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

procedure TfrmPedido.btnAgregarClick(Sender: TObject);
begin
  AgregarMaterial;
  AbrirTablaItems(gIdPedido);
end;

procedure TfrmPedido.btnEliminarClick(Sender: TObject);
begin
  EliminarMaterial;

  AbrirTablaItems(gIdPedido);
end;

procedure TfrmPedido.EMPCalcFields(DataSet: TDataSet);
begin
  EMPNombreEmpleado.Text := EMPApellido.Text + ', ' + EMPNombres.Text;
end;

procedure TfrmPedido.btnBuscarEmpleadoClick(Sender: TObject);
var
  Id: Smallint;
  R: Boolean;
  form: TfrmElecEmpleado;
begin
  form := TfrmElecEmpleado.Create(nil);
  R := form.GetId(Id);
  form.Release;

  if R then
  begin
    if Sender = btnBuscarSolicitante then
      Table.FieldByName('IdSolicitante').AsInteger := Id
    else if Sender = btnBuscarAutorizado then
      Table.FieldByName('IdAutoriza').AsInteger := Id
    else Table.FieldByName('IdProcesa').AsInteger := Id;
  end;
end;

end.

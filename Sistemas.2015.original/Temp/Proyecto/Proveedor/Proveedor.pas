unit Proveedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, DBCtrls, DB, Grids,
  DBGrids, DBTables;

type
  TfrmProv = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    dsPROV: TDataSource;
    PROV: TTable;
    PROVIdProveedor: TSmallintField;
    PROVRazonSocial: TStringField;
    PROVDomicilio: TStringField;
    PROVTelefono: TStringField;
    PROVEmail: TStringField;
    PROVCuit: TStringField;
    PROVCodigo: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tsRubros: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    edtRazon: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    grdDatos: TDBGrid;
    btnAgregar: TButton;
    btnEliminar: TButton;
    DataSource1: TDataSource;
    qryRubroProveedor: TQuery;
    qryRubroProveedorIdProveedor: TSmallintField;
    qryRubroProveedorIdRubro: TSmallintField;
    qryRubroProveedorRubro: TStringField;
    RP: TTable;
    RPIdProveedor: TSmallintField;
    RPIdRubro: TSmallintField;
    PROVFax: TStringField;
    PROVContacto: TStringField;
    PROVTelefonoContacto: TStringField;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    PROVLocalidad: TStringField;
    PROVCodigoPostal: TStringField;
    PROVPaginaWeb: TStringField;
    PROVMovilContacto: TStringField;
    PROVEmailContacto: TStringField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gIdProv: Word;
    procedure PrepararFormulario(M: Byte; Id: Word);
    procedure AbrirQryRubroProveedor(Id: Word);
    function Guardar: Boolean;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmProv: TfrmProv;

implementation

uses Comunes, Util, MessagesDataSets, ElecEnt, DataBases, PoolQuerys;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmProv.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmProv.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el proveedor elegido?') then Exit;

  try
    Existe(PROV, 'IdProveedor', Id);
    PROV.Delete;
    PROV.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error al intentar eliminar el proveedor. ' +
                 'Compruebe que no haya sido utilizado.');
      Exit;
    end;
  end;

  Result := True;
end;

function TfrmProv.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult=mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmProv.PrepararFormulario(M: Byte; Id: Word);
begin
  if not dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.StartTransaction;
  with PROV do
  begin
    Open;
    if M = 0 then  // Alta
    begin
      Append;
      tsRubros.TabVisible := False;
    end
    else // Modificación
    begin
      Existe(PROV,'IdProveedor',Id);
      gIdProv := Id;
      Edit;
      pnlTitulo.Caption := PROVRazonSocial.Text;
      tsRubros.TabVisible := True;
      AbrirQryRubroProveedor(Id);
    end;
  end;
  PageControl1.ActivePageIndex := 0;
  ActiveControl := edtCodigo;
end;

procedure TfrmProv.AbrirQryRubroProveedor(Id: Word);
begin
  qryRubroProveedor.Close;
  qryRubroProveedor.ParamByName('P').AsInteger := Id;
  qryRubroProveedor.Open;
  btnEliminar.Enabled := (qryRubroProveedor.RecordCount > 0);
end;

function TfrmProv.Guardar: Boolean;
begin
  Result := False;

  if PROVRazonSocial.IsNull then
  begin
    MsjError('El campo ' + #39 + 'Nombre de la empresa' + #39 + ' no puede quedar vacío.');
    Exit;
  end;

  try
    PROV.Post;
    except on E: EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar guardar el proveedor.');
      Exit;
    end;
  end;
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmProv.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmProv.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmProv.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmProv.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);

  if (Sender = grdDatos) or (Sender = btnAgregar) or (Sender = btnEliminar) then
  begin
    if Key = '+' then btnAgregarClick(nil)
    else if Key = '-' then btnEliminarClick(nil);
  end;
end;

procedure TfrmProv.btnAceptarClick(Sender: TObject);
begin
  if not Guardar then Exit;

  ModalResult := mrOk;
  if dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.Commit;
end;

procedure TfrmProv.btnCancelarClick(Sender: TObject);
begin
  if Editando(PROV) then PROV.Cancel;

  ModalResult := mrCancel;
  if dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.Rollback;
end;

procedure TfrmProv.FormCreate(Sender: TObject);
begin
  {}
end;

procedure TfrmProv.FormDestroy(Sender: TObject);
begin
  qryRubroProveedor.Close;
  PROV.Close;
  RP.Close;
end;

procedure TfrmProv.btnAgregarClick(Sender: TObject);
var
  Id: Word;
  R: Boolean;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getId('Rubro', Id);
    Release;
  end;

  if R then
  try
    RP.Open;
    RP.Append;
    RPIdProveedor.Value := gIdProv;
    RPIdRubro.Value := Id;
    RP.Post;
    RP.Close;
    AbrirQryRubroProveedor(gIdProv);
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar agregar el rubro.');
      RP.Cancel;
      Exit;
    end;
  end;
end;

procedure TfrmProv.btnEliminarClick(Sender: TObject);
begin
  if Confirmar('¿Está seguro de eliminar el rubro elegido?') then
  begin
    Existe(RP, 'IdProveedor', 'IdRubro',
    VarArrayOf([qryRubroProveedorIdProveedor.Value, qryRubroProveedorIdRubro.Value]));
    try
      RP.Delete;
      RP.Close;
      AbrirQryRubroProveedor(gIdProv);
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar eliminar el rubro.');
        Exit;
      end;
    end;
  end;
end;

end.

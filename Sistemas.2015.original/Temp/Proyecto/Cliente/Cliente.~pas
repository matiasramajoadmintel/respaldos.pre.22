unit Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Mask, DBCtrls,
  DBTables, Grids, DBGrids;

type
  TfrmCliente = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    CLI: TTable;
    CLIIdCliente: TSmallintField;
    CLIRazonSocial: TStringField;
    CLIDomicilio: TStringField;
    CLIEmail: TStringField;
    DataSource1: TDataSource;
    CLILocalidad: TStringField;
    CLICodigoPostal: TStringField;
    CLIFechaNacimiento: TDateTimeField;
    CLIDNI: TStringField;
    CLICUIT: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtRazonSocial: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Panel3: TPanel;
    grdDatos: TDBGrid;
    Panel4: TPanel;
    btnAgregar: TButton;
    btnEliminar: TButton;
    qryTelefonos: TQuery;
    qryTelefonosTelefono: TStringField;
    TELCLI: TTable;
    TELCLIIdCliente: TSmallintField;
    TELCLITelefono: TStringField;
    Label3: TLabel;
    DataSource2: TDataSource;
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
    gId: Smallint;
    procedure PrepararFormulario(M: Byte; Id: Word);
    function DatosValidos: Boolean;
    procedure AbrirQry(Id: Word);

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmCliente: TfrmCliente;

implementation

uses Comunes, Util, MessagesDataSets, Input, DataBases;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmCliente.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmCliente.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el propietario elegido?') then Exit;

  try
    Existe(CLI, 'IdCliente', Id);
    CLI.Delete;
    CLI.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error al intentar eliminar el propietario. ' +
                 'Compruebe que no haya sido utilizado.');
      Exit;
    end;
  end;

  Result := True;
end;

function TfrmCliente.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  gId := Id;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmCliente.PrepararFormulario(M: Byte; Id: Word);
begin
  if not dmDataBases.RavierDB.InTransaction then
    dmDataBases.RavierDB.StartTransaction;

  if M = 0 then //Alta
  begin
    CLI.Open;
    CLI.Append;
  end
  else //Modificación
  begin
    Existe(CLI, 'IdCliente', Id);
    pnlTitulo.Caption := CLIRazonSocial.Text;
    CLI.Edit;
    AbrirQry(Id);
  end;

  ActiveControl := edtRazonSocial;
end;

function TfrmCliente.DatosValidos: Boolean;
begin
  Result := True;
end;

procedure TfrmCliente.AbrirQry(Id: Word);
begin
  qryTelefonos.Close;
  qryTelefonos.ParamByName('N').AsInteger := Id;
  qryTelefonos.Open;
  btnEliminar.Enabled := (qryTelefonos.RecordCount > 0);
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmCliente.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmCliente.Salida_de_Campo(Sender: TObject);
begin
  if Sender = edtRazonSocial then
    pnlTitulo.Caption := edtRazonSocial.Text;

  SalidaDeCampo(self,Sender);
end;

procedure TfrmCliente.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmCliente.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmCliente.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;

  try
    CLI.Post;
    CLI.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error interno de la base de datos.');
      CLI.Cancel;
      Exit;
    end;
  end;

  if dmDataBases.RavierDB.InTransaction then dmDataBases.RavierDB.Commit;
  ModalResult := mrOk;
end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  if dmDataBases.RavierDB.InTransaction then dmDataBases.RavierDB.Rollback;  
  ModalResult := mrCancel;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmCliente.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmCliente.btnAgregarClick(Sender: TObject);
var
  Tel: String;
begin
  if IngresarTexto(Tel, 'Teléfono cliente', TELCLITelefono.Size) then
  begin
    TELCLI.Open;
    TELCLI.Append;
    TELCLIIdCliente.Value := gId;
    TELCLITelefono.Text := Tel;
    TELCLI.Post;
    TELCLI.Close;
    AbrirQry(gId);
  end;
end;

procedure TfrmCliente.btnEliminarClick(Sender: TObject);
begin
  if Confirmar('¿Está seguro de eliminar el teléfono elegido?') then
  begin
    Existe(TELCLI, 'IdCliente', 'Telefono', VarArrayOf([gId, qryTelefonosTelefono.Text]));
    TELCLI.Delete;
    TELCLI.Close;
    AbrirQry(gId);
  end;
end;

end.



unit Empleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Mask,
  DBCtrls;

type
  TfrmEmpleado = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Table: TTable;
    TableIdEmpleado: TSmallintField;
    TableApellido: TStringField;
    TableNombres: TStringField;
    TableDomicilio: TStringField;
    TableEmail: TStringField;
    Label1: TLabel;
    edtApellido: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    edtNombres: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(M: Byte; Id: Word);
    function DatosValidos: Boolean;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmEmpleado: TfrmEmpleado;

implementation

uses Comunes, Util, MessagesDataSets;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmEmpleado.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmEmpleado.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  try
    Existe(Table, 'IdEmpleado', Id);
    Table.Delete;
    Table.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error al intentar eliminar. ' +
                 'Compruebe que el ítem que desea borrar no haya sido utilizado.');
      Exit;
    end;
  end;

  Result := True;
end;

function TfrmEmpleado.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmEmpleado.PrepararFormulario(M: Byte; Id: Word);
begin
  if M = 0 then //Alta
  begin
    Table.Open;
    Table.Append;
  end
  else //Modificación
  begin
    Existe(Table, 'IdEmpleado', Id);
    pnlTitulo.Caption := Table.FieldByName('Apellido').AsString + ', ' + Table.FieldByName('Nombres').AsString;
    Table.Edit;
  end;
  ActiveControl := edtApellido;
end;
function TfrmEmpleado.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmEmpleado.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmEmpleado.Salida_de_Campo(Sender: TObject);
begin
  if (Sender = edtApellido) or (Sender = edtNombres) then
    pnlTitulo.Caption := Table.FieldByName('Apellido').AsString + ', ' + Table.FieldByName('Nombres').AsString;

  SalidaDeCampo(self,Sender);
end;

procedure TfrmEmpleado.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmEmpleado.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmEmpleado.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;

  try
    Table.Post;
    Table.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error interno de la base de datos.');
      Table.Cancel;
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmEmpleado.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmEmpleado.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmEmpleado.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

end.

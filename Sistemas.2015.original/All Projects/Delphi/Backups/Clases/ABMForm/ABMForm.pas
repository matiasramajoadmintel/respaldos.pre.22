unit ABMForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables;

type
  TABMForm = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Table: TTable;
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
  ABMForm: TABMForm;

implementation

uses Comunes, Util, MessagesDataSets;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TABMForm.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TABMForm.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  try
    Existe(Table, 'Id'+Table.TableName, Id);
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

function TABMForm.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TABMForm.PrepararFormulario(M: Byte; Id: Word);
begin
  if M = 0 then //Alta
  begin
    Table.Open;
    Table.Append;
  end
  else //Modificación
  begin
    Existe(Table, 'Id'+Table.TableName, Id);
    pnlTitulo.Caption := Table.FieldByName('Descrip').AsString;
    Table.Edit;
  end;
end;
function TABMForm.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TABMForm.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TABMForm.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TABMForm.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TABMForm.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TABMForm.btnAceptarClick(Sender: TObject);
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

procedure TABMForm.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TABMForm.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TABMForm.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

end.

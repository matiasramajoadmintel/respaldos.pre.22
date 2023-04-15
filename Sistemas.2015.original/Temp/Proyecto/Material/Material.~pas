unit Material;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Mask,
  DBCtrls;

type
  TfrmMaterial = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Table: TTable;
    RUBRO: TTable;
    RUBROIdRubro: TSmallintField;
    RUBRODescrip: TStringField;
    TableIdMaterial: TSmallintField;
    TableDescrip: TStringField;
    TableIdRubro: TSmallintField;
    TableRubro: TStringField;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    btnBuscarRubro: TSpeedButton;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarRubroClick(Sender: TObject);

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
  frmMaterial: TfrmMaterial;

implementation

uses Comunes, Util, MessagesDataSets, ElecEnt;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmMaterial.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmMaterial.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  try
    Existe(Table, 'IdMaterial', Id);
    Table.Delete;
    Table.Close;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar eliminar. ' +
               'Compruebe que el ítem que desea borrar no haya sido utilizado.');
      Exit;
    end;
  end;

  Result := True;
end;

function TfrmMaterial.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmMaterial.PrepararFormulario(M: Byte; Id: Word);
begin
  if M = 0 then //Alta
  begin
    Table.Open;
    Table.Append;
  end
  else //Modificación
  begin
    Existe(Table, 'IdMaterial', Id);
    pnlTitulo.Caption := Table.FieldByName('Descrip').AsString;
    Table.Edit;
  end;
  ActiveControl := DBLookupComboBox1;
end;
function TfrmMaterial.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmMaterial.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmMaterial.Salida_de_Campo(Sender: TObject);
begin
  pnlTitulo.Caption := Table.FieldByName('Descrip').AsString;
  SalidaDeCampo(self,Sender);
end;

procedure TfrmMaterial.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmMaterial.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmMaterial.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;

  try
    Table.Post;
    Table.Close;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error interno de la base de datos.');
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmMaterial.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmMaterial.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmMaterial.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmMaterial.btnBuscarRubroClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getId('Rubro', Id);
    Release;
  end;

  if R then Table.FieldByName('IdRubro').AsInteger := Id;
end;

end.

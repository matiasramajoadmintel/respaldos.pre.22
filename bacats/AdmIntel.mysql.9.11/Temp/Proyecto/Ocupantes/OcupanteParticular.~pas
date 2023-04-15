unit OcupanteParticular;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables;

type
  TfrmOcupanteParticular = class(TForm)
    pnlTitulo: TPanel;
    pnlDatos: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    edtParentezco: TDBEdit;
    edtGarante: TEdit;
    btnElegirGarante: TBitBtn;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    PER_: TTable;
    DataSource1: TDataSource;
    OP_: TTable;
    edtCostoAlq: TDBEdit;
    PER_IDPERSONA: TIntegerField;
    PER_NOMBRE: TStringField;
    PER_APELLIDO: TStringField;
    OP_IDPERSONA: TIntegerField;
    OP_IDGARANTE: TIntegerField;
    OP_PARENTEZCO: TStringField;
    OP_COSTOALQUILER: TFloatField;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirGaranteClick(Sender: TObject);

  private
    teclas: Byte;
    procedure PrepararForm(IdPersona: Integer);

  public
    gModo: Byte;
    procedure Mostrar(IdPersona: Integer);
    function Eliminar(IdPersona: Integer): Boolean;
    function Insertar:integer;
    function Actualizar (IdPersona:integer) :integer;
    function Consultar (IdPersona:integer):integer;

  end;

var
  frmOcupanteParticular: TfrmOcupanteParticular;

implementation

uses Util, Comunes, Tablas, ElecOcupante, PoolDatos;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmOcupanteParticular.PrepararForm(IdPersona: Integer);
begin
  if gModo = MODE_UPDATE then
  begin
    if not Existe(OP_, 'IDPERSONA', IdPersona) then
      gModo := MODE_INSERT
    else
    begin
      OP_.Edit;
      Existe(PER_, 'IDPERSONA', OP_IDGARANTE.Value);
      edtGarante.Text := PER_APELLIDO.Text + ', ' + PER_NOMBRE.Text;
    end;
  end;

  if gModo = MODE_INSERT then
  begin
    OP_.Open;
    OP_.Append;
    OP_IDPERSONA.Value := IdPersona;
    edtGarante.Text := '';
  end;

  Existe(PER_, 'IDPERSONA', IdPersona);
  pnlTitulo.Caption := PER_APELLIDO.Text + ', ' + PER_NOMBRE.Text;

  pnlDatos.Enabled := (gModo <> MODE_SELECT);
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmOcupanteParticular.Mostrar(IdPersona: Integer);
begin
  PrepararForm(IdPersona);

  ShowModal;
end;

function TfrmOcupanteParticular.Eliminar(IdPersona: Integer): Boolean;
begin
  try
    Existe(OP_, 'IDPERSONA', IdPersona);
    OP_.Delete;
    Result := True;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el ocupante');
      Result := False;
    end;
  end;
end;

function TfrmOcupanteParticular.Insertar:integer;
begin
{        gModo:=0;
        if not Database.InTransaction then
                Database.StartTransaction;
        if not Editando(Table2) then
                Table2.Append;
        PrepararForm;
        ShowModal;
        case ModalResult of
                mrOk: Result:=1;
                mrCancel: Result:=2;
        else
                Result:=3;
        end;}
end;

function TfrmOcupanteParticular.Actualizar (IdPersona:integer):integer;
begin
{        if not Existe(Table2,'IDPERSONA',IdPersona) then
                MsjError('No se encontró el Ocupante')
        else
        begin
                gModo:=1;
                Table2.Edit;
                PrepararForm;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        case ModalResult of
        mrOk: Result:=1;
        mrCancel: Result:=2;
        else
                Result:=3;
        end;}
end;

function TfrmOcupanteParticular.Consultar (IdPersona:integer):integer;
begin
{        if not Existe(Table2,'IDPERSONA',IdPersona) then
                MsjError('No se encontró el Ocupante')
        else
        begin
                gModo:=3;
                Table2.Edit;
                PrepararForm;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        case ModalResult of
        mrOk: Result:=1;
        mrCancel: Result:=2;
        else
                Result:=3;
        end;}
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmOcupanteParticular.btnAceptarClick(Sender: TObject);
begin
  try
    OP_.Post;
    if dmDatos.ADB.InTransaction then
      dmDatos.ADB.Commit;
    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el ocupante');
  end;
end;

procedure TfrmOcupanteParticular.btnCancelarClick(Sender: TObject);
begin
  OP_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;
end;

procedure TfrmOcupanteParticular.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmOcupanteParticular.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmOcupanteParticular.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmOcupanteParticular.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCostoAlq then
    if (Key = ',') or (Key = '.') then Key := DecimalSeparator;

  if key = #13 then
  begin
    key := chr(0);
    Perform(WM_NEXTDLGCTL, Teclas, 0);
  end;
end;

procedure TfrmOcupanteParticular.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmOcupanteParticular.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmOcupanteParticular.btnElegirGaranteClick(Sender: TObject);
var
  IdOcupante:integer;
  Ocupante:String;
begin
  with TfrmElecOcupante.Create(nil) do
  begin
    IdOcupante:=GetId(Ocupante,2);
    if IdOcupante<>0 then
    begin
      OP_IDGARANTE.Value := IdOcupante;
      edtGarante.Text:=Ocupante;
    end;
    Release;
  end;
end;

end.

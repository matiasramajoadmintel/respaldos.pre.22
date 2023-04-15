unit OcupanteCivil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables, Principal,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TfrmOcupanteCivil = class(TForm)
    pnlTitulo: TPanel;
    pnlDatos: TPanel;
    Label9: TLabel;
    Label4: TLabel;
    edtCategoria: TDBEdit;
    edtLegajo: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label10: TLabel;
    OC_: TTable;
    DataSource1: TDataSource;
    edtSueldo: TDBEdit;
    OC_IDPERSONA: TIntegerField;
    OC_CATEGORIA: TStringField;
    OC_LEGAJO: TStringField;
    OC_SUELDO: TFloatField;
    PER_: TTable;
    PER_IDPERSONA: TIntegerField;
    PER_NOMBRE: TStringField;
    PER_APELLIDO: TStringField;
    OC_DESTINO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    ztblPER_: TZTable;
    ztblOC_: TZTable;
    ztblPER_idpersona: TIntegerField;
    ztblPER_nombre: TStringField;
    ztblPER_apellido: TStringField;
    ztblOC_idpersona: TIntegerField;
    ztblOC_categoria: TStringField;
    ztblOC_legajo: TStringField;
    ztblOC_sueldo: TFloatField;
    ztblOC_destino: TStringField;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);

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
  frmOcupanteCivil: TfrmOcupanteCivil;

implementation

uses Util, Comunes, Tablas, PoolDatos;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmOcupanteCivil.PrepararForm(IdPersona: Integer);
begin
  if gModo = MODE_UPDATE then
  begin
    if not Existe(ztblOC_, 'IDPERSONA', IdPersona) then
      gModo := MODE_INSERT
    else
      ztblOC_.Edit;
  end;

  if gModo = MODE_INSERT then
  begin
    ztblOC_.Open;
    ztblOC_.Append;
    ztblOC_IDPERSONA.Value := IdPersona;
  end;

  Existe(ztblPER_, 'IDPERSONA', IdPersona);
  pnlTitulo.Caption := ztblPER_APELLIDO.Text + ', ' + ztblPER_NOMBRE.Text;

  pnlDatos.Enabled := (gModo <> MODE_SELECT);
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmOcupanteCivil.Mostrar(IdPersona: Integer);
begin
  PrepararForm(IdPersona);

  ShowModal;
end;

function TfrmOcupanteCivil.Eliminar(IdPersona: Integer): Boolean;
begin
  try
    Existe(OC_, 'IDPERSONA', IdPersona);
    ztblOC_.Delete;
    Result := True;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el ocupante');
      Result := False;
    end;
  end;
end;

function TfrmOcupanteCivil.Insertar:integer;
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

function TfrmOcupanteCivil.Actualizar (IdPersona:integer):integer;
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

function TfrmOcupanteCivil.Consultar (IdPersona:integer):integer;
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

procedure TfrmOcupanteCivil.btnAceptarClick(Sender: TObject);
begin
  try
    ztblOC_.Post;
    if dmDatos.ADB.InTransaction then
      dmDatos.ADB.Commit;
    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el ocupante');
  end;
end;

procedure TfrmOcupanteCivil.btnCancelarClick(Sender: TObject);
begin
  ztblOC_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;
end;

procedure TfrmOcupanteCivil.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmOcupanteCivil.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmOcupanteCivil.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmOcupanteCivil.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtSueldo then
    if (Key = ',') or (Key = '.') then Key := DecimalSeparator;

  if key = #13 then
  begin
    key := chr(0);
    Perform(WM_NEXTDLGCTL, Teclas, 0);
  end;
end;

procedure TfrmOcupanteCivil.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmOcupanteCivil.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

end.

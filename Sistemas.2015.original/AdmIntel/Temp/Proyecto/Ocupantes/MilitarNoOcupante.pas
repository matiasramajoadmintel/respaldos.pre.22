unit MilitarNoOcupante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables;

type
  TfrmMilitarNoOcupante = class(TForm)
    pnlTitulo: TPanel;
    pnlDatos: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    edtMatricula: TDBEdit;
    edtGrado: TEdit;
    btnElegirGrado: TBitBtn;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    PER_: TTable;
    MNO_: TTable;
    DataSource1: TDataSource;
    PER_IDPERSONA: TIntegerField;
    PER_NOMBRE: TStringField;
    PER_APELLIDO: TStringField;
    MNO_IDPERSONA: TIntegerField;
    MNO_IDGRADO: TIntegerField;
    MNO_MATRICULA: TStringField;
    GR_: TTable;
    GR_IDGRADO: TIntegerField;
    GR_DESCRIPCION: TStringField;
    OM_: TTable;
    OM_IDPERSONA: TIntegerField;
    OM_MATRICULA: TStringField;
    OM_IDGRADO: TIntegerField;
    OM_Grado: TStringField;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirGradoClick(Sender: TObject);

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
  frmMilitarNoOcupante: TfrmMilitarNoOcupante;

implementation

uses Util, Comunes, Tablas, ElecGrado, PoolDatos;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmMilitarNoOcupante.PrepararForm(IdPersona: Integer);
begin
  if gModo = MODE_UPDATE then
  begin
    if not Existe(MNO_, 'IDPERSONA', IdPersona) then
      gModo := MODE_INSERT
    else
    begin
      MNO_.Edit;
      Existe(GR_, 'IDGRADO', MNO_IDGRADO.Value);
      edtGrado.Text := GR_DESCRIPCION.Text;
    end;
  end;

  if gModo = MODE_INSERT then
  begin
    MNO_.Open;
    MNO_.Append;
    MNO_IDPERSONA.Value := IdPersona;

    if Existe(OM_, 'IDPERSONA', IdPersona) then
    begin
      MNO_IDGRADO.Value := OM_IDGRADO.Value;
      MNO_MATRICULA.Text := OM_MATRICULA.Text;
      edtGrado.Text := OM_Grado.Text;
    end
    else
      edtGrado.Text := '';
  end;

  Existe(PER_, 'IDPERSONA', IdPersona);
  pnlTitulo.Caption := PER_APELLIDO.Text + ', ' + PER_NOMBRE.Text;

  pnlDatos.Enabled := (gModo <> MODE_SELECT);
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmMilitarNoOcupante.Mostrar(IdPersona: Integer);
begin
  PrepararForm(IdPersona);

  ShowModal;
end;

function TfrmMilitarNoOcupante.Eliminar(IdPersona: Integer): Boolean;
begin
  try
    Existe(MNO_, 'IDPERSONA', IdPersona);
    MNO_.Delete;
    Result := True;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el ocupante');
      Result := False;
    end;
  end;
end;

function TfrmMilitarNoOcupante.Insertar:integer;
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

function TfrmMilitarNoOcupante.Actualizar (IdPersona:integer):integer;
begin
{        if not Existe(Table2,'IDPERSONA',IdPersona) then
                MsjError('No se encontr� el Ocupante')
        else
        begin
                gModo:=1;
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

function TfrmMilitarNoOcupante.Consultar (IdPersona:integer):integer;
begin
{        if not Existe(Table2,'IDPERSONA',IdPersona) then
                MsjError('No se encontr� el Ocupante')
        else
        begin
                gModo:=3;
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

procedure TfrmMilitarNoOcupante.btnAceptarClick(Sender: TObject);
begin
  try
    MNO_.Post;
    if dmDatos.ADB.InTransaction then
      dmDatos.ADB.Commit;
    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el ocupante');
  end;
end;

procedure TfrmMilitarNoOcupante.btnCancelarClick(Sender: TObject);
begin
  MNO_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;
end;

procedure TfrmMilitarNoOcupante.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmMilitarNoOcupante.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmMilitarNoOcupante.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmMilitarNoOcupante.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmMilitarNoOcupante.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmMilitarNoOcupante.btnElegirGradoClick(Sender: TObject);
var
  Id:Byte;
  Descrip:String;
  R: Boolean;
begin
  with TfrmElecGrado.Create(nil) do
  begin
    R := GetEnt(Id,Descrip);
    Release;
  end;
  MNO_IDGRADO.Value := Id;
  edtGrado.Text := Descrip;
end;

end.

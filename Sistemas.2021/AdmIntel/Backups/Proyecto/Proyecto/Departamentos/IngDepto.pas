unit IngDepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable;

type
  TfrmIngDepto = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    edtCantAmb: TDBEdit;
    cmbLlaveTerm: TDBComboBox;
    edtDescripcion: TDBEdit;
    cmbDisyuntor: TDBComboBox;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edtEdificio: TEdit;
    cmbTipo: TDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    memObservaciones: TDBMemo;
    dsDEPTO: TDataSource;
    DBEdit2: TDBEdit;
    DEPTO: TTable;
    EDIF: TTable;
    EDIFIDEDIFICIO: TIntegerField;
    EDIFDESCRIPCION: TStringField;
    DEPTOIDEDIFICIO: TIntegerField;
    DEPTOCANTAMB: TIntegerField;
    DEPTOLLAVETERMICA: TStringField;
    DEPTODISYUNTOR: TStringField;
    DEPTOTIPO: TStringField;
    DEPTOOBSERVACIONES: TStringField;
    DEPTOCOEFICIENTE: TFloatField;
    DEPTODESCRIPCION: TStringField;
    DEPTOIDDEPARTAMENTO: TIntegerField;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    teclas: Byte;
    procedure PrepararForm(const IdEdificio:integer);

  public
    function Insertar(const IdEdificio:integer; var IdDepartamento:integer):Boolean;
    function Actualizar(IdDepartamento:integer):Boolean;
    function Eliminar(IdDepartamento:integer):Boolean;

  end;

var
  frmIngDepto: TfrmIngDepto;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngDepto.PrepararForm(const IdEdificio:integer);
begin
  Existe (EDIF,'IdEdificio',IdEdificio);
  edtEdificio.Text := EDIFDESCRIPCION.Text;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngDepto.Insertar(const IdEdificio:integer; var IdDepartamento:integer):Boolean;
begin
  if not dmDatos.ADB.InTransaction then
    dmDatos.ADB.StartTransaction;

  DEPTO.Append;
  DEPTOIDEDIFICIO.Value := IdEdificio;
  PrepararForm(IdEdificio);

  ShowModal;

  Result := (ModalResult=mrOk);
end;

function TfrmIngDepto.Actualizar(IdDepartamento:integer):Boolean;
begin
  if not Existe(DEPTO,'IdDepartamento',idDepartamento) then
  begin
    MsjError('No se encontr� el departamento');
    Exit;
  end;

  PrepararForm(DEPTOIDEDIFICIO.Value);
  if not dmDatos.ADB.InTransaction then
    dmDatos.ADB.StartTransaction;
  DEPTO.Edit;

  ShowModal;

  Result := (ModalResult=mrOk);
end;

function TfrmIngDepto.Eliminar(IdDepartamento:integer):Boolean;
begin
  if Confirmar('�Est� seguro de eliminar el departamento elegido?') then
    try
      Existe(DEPTO,'IdDepartamento',idDepartamento);
      if not dmDatos.ADB.InTransaction then
        dmDatos.ADB.StartTransaction;
      DEPTO.Delete;
      dmDatos.ADB.Commit;
      Result := true;
      except on EDatabaseError do
      begin
        MsjError ('Ha ocurrido un error al intentar eliminar el departamento');
        Result := false;
      end;
  end
  else
    Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngDepto.btnAceptarClick(Sender: TObject);
begin
        try
                Limpiar_Edit(cmbLlaveTerm);
                Limpiar_Edit(cmbDisyuntor);
                if Editando(DEPTO) then DEPTO.Post;
                if dmDatos.ADB.InTransaction then
                        dmDatos.ADB.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Departamento');
        end;
end;

procedure TfrmIngDepto.btnCancelarClick(Sender: TObject);
begin
        if Editando(DEPTO) then
                DEPTO.Cancel;
        if dmDatos.ADB.InTransaction then
                dmDatos.ADB.Rollback;
end;

procedure TfrmIngDepto.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngDepto.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngDepto.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngDepto.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngDepto.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmIngDepto.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngDepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DEPTO.Close;
end;

procedure TfrmIngDepto.FormCreate(Sender: TObject);
begin
  DEPTO.Open;
end;

end.

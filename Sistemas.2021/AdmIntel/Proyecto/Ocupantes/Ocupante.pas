unit Ocupante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, scExcelExport;

type
  TfrmOcupante = class(TForm)
    pnlDatos: TPanel;
    Panel2: TPanel;
    btnSiguiente: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    edtApellido: TDBEdit;
    Label2: TLabel;
    edtNombre: TDBEdit;
    Label3: TLabel;
    cmbTipoDoc: TDBComboBox;
    Label6: TLabel;
    edtNroDoc: TDBEdit;
    Label4: TLabel;
    edtTelefono: TDBEdit;
    Label7: TLabel;
    edtEMail: TDBEdit;
    DataSource1: TDataSource;
    grbTipoOcupante: TDBRadioGroup;
    PER_: TTable;
    PER_IDPERSONA: TIntegerField;
    PER_NRODOCUMENTO: TIntegerField;
    PER_TIPODOCUMENTO: TStringField;
    PER_NOMBRE: TStringField;
    PER_APELLIDO: TStringField;
    PER_TELEFONO: TStringField;
    PER_EMAIL: TStringField;
    PER_TIPO: TStringField;
    PER_OBS: TBlobField;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    scExcelExport1: TscExcelExport;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure PER_NewRecord(DataSet: TDataSet);
    procedure btn1Click(Sender: TObject);

  private
    gModo, teclas: Byte;
    gTipoAnterior: String;
    _IdPersona: Integer;
    _FormSiguiente: TForm;
    procedure PrepararForm;
    function DatosValidos: Boolean;
    function Guardar: Boolean;

  public
    function Agregar(var IdPersona: Integer): Boolean;
    function Modificar(IdPersona: Integer; FormSiguiente: TForm): Boolean;
    function Eliminar (IdPersona: Integer):Boolean;
    function Consultar(IdPersona:integer):Boolean;

  end;

const
  OCUP_MIL = 'OCUP_MIL';
  OCUP_CIV = 'OCUP_CIV';
  OCUP_PART = 'OCUP_PART';
  MIL_NO_OCUP = 'MIL_NO_OCUP';

var
  frmOcupante: TfrmOcupante;

implementation

uses Comunes, Util, PoolDatos, OcupanteMilitar, StoreProcs, OcupanteCivil,
  OcupanteParticular, MilitarNoOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmOcupante.PrepararForm;
begin
  if not dmDatos.ADB.InTransaction then
    dmDatos.ADB.StartTransaction;

  if gModo = MODE_INSERT then  //Alta
  begin
    PER_.Open;
    PER_.Append;
    PER_TIPO.Text := OCUP_MIL;
  end
  else if gModo = MODE_UPDATE then //Modificación
  begin
    gTipoAnterior := PER_TIPO.Text;
    PER_.Edit;
  end;

  pnlDatos.Enabled := (gModo <> MODE_SELECT);
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmOcupante.Agregar(var IdPersona: Integer): Boolean;
begin
  gModo := MODE_INSERT;
  PrepararForm;

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    PER_.Last;
    IdPersona := PER_IDPERSONA.Value
  end;
end;

function TfrmOcupante.Modificar(IdPersona: Integer; FormSiguiente: TForm): Boolean;
begin
  if not Existe(PER_, 'IDPERSONA', IdPersona) then
  begin
    MsjError('No se encontró la persona');
    Exit;
  end;
  Self._FormSiguiente := FormSiguiente;
  gModo := MODE_UPDATE;
  PrepararForm;

  ShowModal;

  Result := (ModalResult=mrOk);
end;

function TfrmOcupante.Consultar(IdPersona:integer):Boolean;
begin
{        if not Existe(dmTablas.tblPersona, 'IdPersona', IdPersona) then
                MsjError('No se encontró el Ocupante')
        else
        begin
                gModo := 3;
                PrepararForm;
                ShowModal;
        end;
        Result := (ModalResult=mrOk);}
end;

function TfrmOcupante.Eliminar(IdPersona: Integer):Boolean;
var
  form: TForm;
begin
  if Confirmar('¿Está seguro de eliminar el ocupante elegido?') then
    try
      Existe (PER_, 'IdPersona', IdPersona);
      if not dmDatos.ADB.InTransaction then
        dmDatos.ADB.StartTransaction;

      {if PER_TIPO.Text = OCUP_MIL then
      begin
        form := TfrmOcupanteMilitar.Create(nil);
        TfrmOcupanteMilitar(form).Eliminar(IdPersona);
      end
      else if PER_TIPO.Text = OCUP_CIV then
      begin
        form := TfrmOcupanteCivil.Create(nil);
        TfrmOcupanteCivil(form).Eliminar(IdPersona);
      end
      else if PER_TIPO.Text = OCUP_PART then
      begin
        form := TfrmOcupanteParticular.Create(nil);
        TfrmOcupanteParticular(form).Eliminar(IdPersona);
      end
      else
      begin
        form := TfrmMilitarNoOcupante.Create(nil);
        TfrmMilitarNoOcupante(form).Eliminar(IdPersona);
      end;
      form.Release;}

      PER_.Delete;

      dmDatos.ADB.Commit;
      Result := True;
      except on EDatabaseError do
      begin
        MsjError('Ha ocurrido un error al intentar eliminar el ocupante');
        Result := False;
      end;
    end
  else
    Result := False;
end;

function TfrmOcupante.DatosValidos: Boolean;
begin
  Result := False;

  if PER_TIPODOCUMENTO.IsNull or PER_NRODOCUMENTO.IsNull then
  begin
    MsjError('Tipo y/o número de documento incompletos');
    Exit;
  end;

  Result := True;
end;

function TfrmOcupante.Guardar: Boolean;
begin
  if not DatosValidos then Exit;
  try
    PER_.Post;
    Result := True;
    if gModo = MODE_INSERT then
      PER_.Last;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar guardar los datos personales ' +
               'del ocupante');
      Result := False;
    end;
  end;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmOcupante.FormCreate(Sender: TObject);
begin
  Self._FormSiguiente := nil;
end;

procedure TfrmOcupante.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmOcupante.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmOcupante.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmOcupante.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmOcupante.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmOcupante.btnCancelarClick(Sender: TObject);
begin
  PER_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;
end;

procedure TfrmOcupante.btnSiguienteClick(Sender: TObject);
var
  IdPersona: Integer;
begin
  IdPersona := PER_IDPERSONA.Value;
  if Guardar then
  begin
    if gModo = MODE_INSERT then
       IdPersona := PER_IDPERSONA.Value;

    if Self._FormSiguiente = nil then
    begin
      if PER_TIPO.Value = OCUP_MIL then
      begin
        Self._FormSiguiente := TfrmOcupanteMilitar.Create(nil);
        TfrmOcupanteMilitar(Self._FormSiguiente).gModo := Self.gModo;
        TfrmOcupanteMilitar(Self._FormSiguiente).Mostrar(IdPersona, Self);
      end;

      if PER_TIPO.Value = OCUP_CIV then
      begin
        Self._FormSiguiente := TfrmOcupanteCivil.Create(nil);
        TfrmOcupanteCivil(Self._FormSiguiente).gModo := Self.gModo;
        TfrmOcupanteCivil(Self._FormSiguiente).Mostrar(IdPersona);
      end;

      if PER_TIPO.Value = OCUP_PART then
      begin
        Self._FormSiguiente := TfrmOcupanteParticular.Create(nil);
        TfrmOcupanteParticular(Self._FormSiguiente).gModo := Self.gModo;
        TfrmOcupanteParticular(Self._FormSiguiente).Mostrar(IdPersona);
      end;

      if PER_TIPO.Value = MIL_NO_OCUP then
      begin
        Self._FormSiguiente := TfrmMilitarNoOcupante.Create(nil);
        TfrmMilitarNoOcupante(Self._FormSiguiente).gModo := Self.gModo;
        TfrmMilitarNoOcupante(Self._FormSiguiente).Mostrar(IdPersona);
      end;
    end
    else
      Self._FormSiguiente.ShowModal;

    ModalResult := mrOk;
  end;
end;

procedure TfrmOcupante.PER_NewRecord(DataSet: TDataSet);
begin
  PER_IDPERSONA.Value := dmStoreProc.getId('IDPERSONA') + 1;
end;

procedure TfrmOcupante.btn1Click(Sender: TObject);
begin
scExcelExport1.Dataset:=PER_;
scExcelExport1.ExportDataset;
scExcelExport1.Disconnect;
end;

end.

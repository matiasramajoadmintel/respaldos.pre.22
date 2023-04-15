unit PersonaDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, PersonaClass, Admintel_Util, Comunes, Util,
  PoolDatos, StoreProcs, OcupanteCivil, OcupanteParticular, MilitarNoOcupante,
  PersonalMilitarDetail;

type
  TfrmPersonaDetail = class(TForm)
    pnlDatos: TPanel;
    Panel2: TPanel;
    btnSiguiente: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtApellido: TEdit;
    edtNombre: TEdit;
    cmbTipoDoc: TComboBox;
    edtNroDoc: TEdit;
    edtTelefono: TEdit;
    edtEmail: TEdit;
    rgTipoPersona: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure PER_NewRecord(DataSet: TDataSet);

  private
    _Persona: TPersona;

    gModo, teclas: Byte;
    gTipoAnterior: String;
    _IdPersona: Integer;
    _FormSiguiente: TForm;
    procedure PrepararForm;
    function DatosValidos: Boolean;
    function Guardar: Boolean;

  public
    function ShowForm(var Persona: TPersona): TModalResult;
    procedure Load;

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
  frmPersonaDetail: TfrmPersonaDetail;

implementation

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmPersonaDetail.PrepararForm;
begin
{  if not dmDatos.ADB.InTransaction then
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

  pnlDatos.Enabled := (gModo <> MODE_SELECT);}
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmPersonaDetail.ShowForm(var Persona: TPersona): TModalResult;
begin
  Self._Persona := Persona;
  Load;

  ShowModal;

  Result := ModalResult;
end;

procedure TfrmPersonaDetail.Load;
begin
{  edtApellido.Text := Self._Persona.Apellido;
  edtNombre.Text := Self._Persona.Nombre;
  cmbTipoDoc.Text := TipoDocToStr(Self._Persona.TipoDocumento);
  edtNroDoc.Text := IntToStr(Self._Persona.NroDocumento);
  edtTelefono.Text := Self._Persona.Telefono;
  edtEmail.Text := Self._Persona.Email;
  rgTipoPersona.ItemIndex := Ord(Self._Persona.Tipo);}
end;

function TfrmPersonaDetail.Agregar(var IdPersona: Integer): Boolean;
begin
{  gModo := MODE_INSERT;
  PrepararForm;

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    PER_.Last;
    IdPersona := PER_IDPERSONA.Value
  end;}
end;

function TfrmPersonaDetail.Modificar(IdPersona: Integer; FormSiguiente: TForm): Boolean;
begin
{  if not Existe(PER_, 'IDPERSONA', IdPersona) then
  begin
    MsjError('No se encontró la persona');
    Exit;
  end;
  Self._FormSiguiente := FormSiguiente;
  gModo := MODE_UPDATE;
  PrepararForm;

  ShowModal;

  Result := (ModalResult=mrOk);}
end;

function TfrmPersonaDetail.Consultar(IdPersona:integer):Boolean;
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

function TfrmPersonaDetail.Eliminar(IdPersona: Integer):Boolean;
var
  form: TForm;
begin
{  if Confirmar('¿Está seguro de eliminar el ocupante elegido?') then
    try
      Existe (PER_, 'IdPersona', IdPersona);
      if not dmDatos.ADB.InTransaction then
        dmDatos.ADB.StartTransaction;

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
    Result := False;}
end;

function TfrmPersonaDetail.DatosValidos: Boolean;
begin
{  Result := False;

  if PER_TIPODOCUMENTO.IsNull or PER_NRODOCUMENTO.IsNull then
  begin
    MsjError('Tipo y/o número de documento incompletos');
    Exit;
  end;

  Result := True;}
end;

function TfrmPersonaDetail.Guardar: Boolean;
begin
{  if not DatosValidos then Exit;
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
  end;}
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmPersonaDetail.FormCreate(Sender: TObject);
begin
  Self._FormSiguiente := nil;
end;

procedure TfrmPersonaDetail.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmPersonaDetail.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmPersonaDetail.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmPersonaDetail.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmPersonaDetail.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmPersonaDetail.btnCancelarClick(Sender: TObject);
begin
{  PER_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;}
end;

procedure TfrmPersonaDetail.btnSiguienteClick(Sender: TObject);
var
  form: TfrmPersonalMilitarDetail;
begin
  form := TfrmPersonalMilitarDetail.Create;
  form.ShowForm(_Persona);

{  IdPersona := PER_IDPERSONA.Value;
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
  end;}
end;

procedure TfrmPersonaDetail.PER_NewRecord(DataSet: TDataSet);
begin
//  PER_IDPERSONA.Value := dmStoreProc.getId('IDPERSONA') + 1;
end;

end.

unit PersonalMilitarDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, IBDatabase, ComCtrls, UtilCollections, GradoClass,
  EspecialidadClass, PersonalMilitarClass, PersonaClass;

type
  TfrmPersonalMilitarDetail = class(TForm)
    pnlDatos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edtDestino: TDBEdit;
    edtMatricula: TDBEdit;
    edtAntGrado: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnElegirGrado: TBitBtn;
    btnElegirEspecialidad: TBitBtn;
    Label4: TLabel;
    dtpFecIng: TDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    cmbGrado: TComboBox;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirGradoClick(Sender: TObject);
    procedure btnElegirEspecialidadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    _PersonalMilitar: TPersonalMilitar;

    gModo: Byte;
    teclas: Byte;
    _FormAnterior: TForm;

    procedure Load;

    procedure PrepararForm(IdPersona: Integer);

  public
    constructor Create;
    function ShowForm(var Persona: TPersona): TModalResult;

    procedure Mostrar(IdPersona: Integer; FormAnterior: TForm);
    function Eliminar(IdPersona: Integer): Boolean;
    function Actualizar (IdPersona:integer):integer;
    function Consultar (IdPersona:integer):integer;

  end;

var
  frmPersonalMilitarDetail: TfrmPersonalMilitarDetail;

implementation

uses Util, Comunes, ElecEspecialidad, ElecGrado, StoreProcs, PoolDatos;

{$R *.dfm}

constructor TfrmPersonalMilitarDetail.Create;
var
  GradosList, EspecialidadesList: TList;
  G: TGrado;
  E: TEspecialidad;
  i: Byte;
begin
  GradosList := dmUtilCollections.GetGrados;
  for i := 0 to GradosList.Count - 1 do
  begin
    G := GradosList.Items[i];
    cmbGrado.AddItem(G.Descripcion, G);
  end;
end;

function TfrmPersonalMilitarDetail.ShowForm(var Persona: TPersona): TModalResult;
begin
//  _PersonalMilitar := t
  Load;

  ShowModal;

  Result := ModalResult;
end;

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmPersonalMilitarDetail.Load;
begin
{  edtApellido.Text := Self._Persona.Apellido;
  edtNombre.Text := Self._Persona.Nombre;
  cmbTipoDoc.Text := TipoDocToStr(Self._Persona.TipoDocumento);
  edtNroDoc.Text := IntToStr(Self._Persona.NroDocumento);
  edtTelefono.Text := Self._Persona.Telefono;
  edtEmail.Text := Self._Persona.Email;
  rgTipoPersona.ItemIndex := Ord(Self._Persona.Tipo);}
end;

procedure TfrmPersonalMilitarDetail.PrepararForm(IdPersona: Integer);
begin
{  if gModo = MODE_UPDATE then
  begin
    if not Existe(OM_, 'IDPERSONA', IdPersona) then
      gModo := MODE_INSERT
    else
    begin
      dtpFecIng.Checked := not OM_FECHA_INGRESO.IsNull;
      if dtpFecIng.Checked then
        dtpFecIng.Date := OM_FECHA_INGRESO.Value;
      OM_.Edit;
    end;
  end;

  if gModo = MODE_INSERT then
  begin
    OM_.Open;
    OM_.Append;
    OM_IDPERSONA.Value := IdPersona;
    dtpFecIng.Checked := False;

    if Existe(MNO_, 'IDPERSONA', IdPersona) then
    begin
      OM_IDGRADO.Value := MNO_IDGRADO.Value;
      OM_MATRICULA.Text := MNO_MATRICULA.Text;
    end;
  end;

  pnlDatos.Enabled := (gModo <> MODE_SELECT);}
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmPersonalMilitarDetail.Mostrar(IdPersona: Integer; FormAnterior: TForm);
begin
{  Self._IdPersona := IdPersona;
  Self._FormAnterior := FormAnterior;
  PrepararForm(IdPersona);

  ShowModal;}
end;

function TfrmPersonalMilitarDetail.Eliminar(IdPersona: Integer): Boolean;
begin
{  try
    Existe(OM_, 'IDPERSONA', IdPersona);
    OM_.Delete;
    Result := True;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el ocupante');
      Result := False;
    end;
  end;}
end;

function TfrmPersonalMilitarDetail.Actualizar (IdPersona:integer):integer;
begin
{        if not Existe(dmTablas.tblOcupanteMilitar, 'IDPERSONA', IdPersona) then
                MsjError('No se encontr� el Ocupante')
        else
        begin
                gModo:=1;
                dtpFecIng.Date := dmTablas.tblOcupanteMilitarFECHA_INGRESO.Value;
                dmTablas.tblOcupanteMilitar.Edit;
                PrepararForm;
                if not dmTablas.Database.InTransaction then
                        dmTablas.Database.StartTransaction;
                ShowModal;
        end;
        case ModalResult of
        mrOk: Result:=1;
        mrCancel: Result:=2;
        else
                Result:=3;
        end;}
end;

function TfrmPersonalMilitarDetail.Consultar (IdPersona:integer):integer;
begin
{        if not Existe(dmTablas.tblOcupanteMilitar, 'IDPERSONA', IdPersona) then
                MsjError('No se encontr� el Ocupante')
        else
        begin
                gModo:=3;
                dtpFecIng.Date := dmTablas.tblOcupanteMilitarFECHA_INGRESO.Value;
                dmTablas.tblOcupanteMilitar.Edit;
                PrepararForm;
                if not dmTablas.Database.InTransaction then
                        dmTablas.Database.StartTransaction;
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

procedure TfrmPersonalMilitarDetail.btnAceptarClick(Sender: TObject);
begin
{  try
    if dtpFecIng.Checked then
      OM_FECHA_INGRESO.Value := dtpFecIng.Date
    else
      OM_FECHA_INGRESO.Clear;
    OM_.Post;
    if dmDatos.ADB.InTransaction then
      dmDatos.ADB.Commit;
    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el ocupante');
  end;}
end;

procedure TfrmPersonalMilitarDetail.btnCancelarClick(Sender: TObject);
begin
{  OM_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;}
end;

procedure TfrmPersonalMilitarDetail.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmPersonalMilitarDetail.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmPersonalMilitarDetail.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmPersonalMilitarDetail.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmPersonalMilitarDetail.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmPersonalMilitarDetail.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmPersonalMilitarDetail.btnElegirGradoClick(Sender: TObject);
var
  Id:Byte;
  Descrip:String;
  R: Boolean;
begin
{  with TfrmElecGrado.Create(nil) do
  begin
    R := GetEnt(Id,Descrip);
    Release;
  end;

  if R then
    OM_IDGRADO.Value := Id;}
end;

procedure TfrmPersonalMilitarDetail.btnElegirEspecialidadClick(Sender: TObject);
var
  IdEspecialidad:integer;
  Descripcion:String;
begin
{  with TfrmElecEspecialidad.Create(nil) do
  begin
    IdEspecialidad := GetId(Descripcion);
    if IdEspecialidad <> 0 then
      OM_IDESPECIALIDAD.Value := IdEspecialidad;
    Release;
  end;}
end;

procedure TfrmPersonalMilitarDetail.FormDestroy(Sender: TObject);
begin
{  if modalResult= mrCancel then
    dmTablas.tblOcupanteMilitar.Close;;}
end;

procedure TfrmPersonalMilitarDetail.BitBtn1Click(Sender: TObject);
begin
{  TfrmOcupante(Self._FormAnterior).Modificar(Self._IdPersona, Self);
  ModalResult := mrOk;}
end;

end.

unit OcupanteMilitar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, IBDatabase, ComCtrls, Principal,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TfrmOcupanteMilitar = class(TForm)
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
    OM_: TTable;
    OM_IDPERSONA: TIntegerField;
    OM_IDESPECIALIDAD: TIntegerField;
    OM_ANTGRADO: TIntegerField;
    OM_DESTINO: TStringField;
    OM_MATRICULA: TStringField;
    OM_IDGRADO: TIntegerField;
    OM_RENTAPROPIA: TFloatField;
    OM_FECHA_INGRESO: TDateTimeField;
    OM_ANT_SERVICIO: TIntegerField;
    GR_: TTable;
    GR_IDGRADO: TIntegerField;
    GR_DESCRIPCION: TStringField;
    ES_: TTable;
    ES_IDESPECIALIDAD: TIntegerField;
    ES_DESCRIPCION: TStringField;
    OM_Grado: TStringField;
    OM_Especialidad: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    cmbEspecialidad: TDBLookupComboBox;
    MNO_: TTable;
    MNO_IDPERSONA: TIntegerField;
    MNO_IDGRADO: TIntegerField;
    MNO_MATRICULA: TStringField;
    BitBtn1: TBitBtn;
    OM_TELEFONO_DESTINO: TStringField;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    ztblES_: TZTable;
    ztblGR_: TZTable;
    ztblMNO_: TZTable;
    ztblOM_: TZTable;
    ztblGR_idgrado: TIntegerField;
    ztblGR_descripcion: TStringField;
    ztblES_idespecialidad: TIntegerField;
    ztblES_descripcion: TStringField;
    ztblOM_idpersona: TIntegerField;
    ztblOM_idespecialidad: TIntegerField;
    ztblOM_antgrado: TIntegerField;
    ztblOM_destino: TStringField;
    ztblOM_matricula: TStringField;
    ztblOM_idgrado: TIntegerField;
    ztblOM_rentapropia: TFloatField;
    ztblOM_fecha_ingreso: TDateTimeField;
    ztblOM_ant_servicio: TIntegerField;
    ztblOM_telefono_destino: TStringField;
    ztblMNO_idpersona: TIntegerField;
    ztblMNO_idgrado: TIntegerField;
    ztblMNO_matricula: TStringField;
    pnl1: TPanel;
    ztblOM_GRADO: TStringField;
    ztblOM_ESPECIALIDAD: TStringField;
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
    teclas: Byte;
    _IdPersona: Integer;
    _FormAnterior: TForm;
    procedure PrepararForm(IdPersona: Integer);

  public
    gModo: Byte;
    procedure Mostrar(IdPersona: Integer; FormAnterior: TForm);
    function Eliminar(IdPersona: Integer): Boolean;
    function Actualizar (IdPersona:integer):integer;
    function Consultar (IdPersona:integer):integer;

  end;

var
  frmOcupanteMilitar: TfrmOcupanteMilitar;

implementation

uses Util, Comunes, ElecEspecialidad, ElecGrado, StoreProcs, PoolDatos,
  Ocupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmOcupanteMilitar.PrepararForm(IdPersona: Integer);
begin
  if gModo = MODE_UPDATE then
  begin
    if not Existe(ztblOM_, 'IDPERSONA', IdPersona) then
      gModo := MODE_INSERT
    else
    begin
      dtpFecIng.Checked := not ztblOM_.IsEmpty; // OM_.IsNull;
      if dtpFecIng.Checked then
        dtpFecIng.Date := ztblOM_FECHA_INGRESO.Value;
      ztblOM_.Edit;
    end;
  end;

  if gModo = MODE_INSERT then
  begin
    ztblOM_.Open;
    ztblOM_.Append;
    ztblOM_IDPERSONA.Value := IdPersona;
    dtpFecIng.Checked := False;

    if Existe(ztblMNO_, 'IDPERSONA', IdPersona) then
    begin
      ztblOM_IDGRADO.Value := ztblMNO_IDGRADO.Value;
      ztblOM_MATRICULA.Text := ztblMNO_MATRICULA.Text;
    end;
  end;

  pnlDatos.Enabled := (gModo <> MODE_SELECT);
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmOcupanteMilitar.Mostrar(IdPersona: Integer; FormAnterior: TForm);
begin
  Self._IdPersona := IdPersona;
  Self._FormAnterior := FormAnterior;
  PrepararForm(IdPersona);

  ShowModal;
end;

function TfrmOcupanteMilitar.Eliminar(IdPersona: Integer): Boolean;
begin
  try
    Existe(ztblOM_, 'IDPERSONA', IdPersona);
    ztblOM_.Delete;
    Result := True;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el ocupante');
      Result := False;
    end;
  end;
end;

function TfrmOcupanteMilitar.Actualizar (IdPersona:integer):integer;
begin
{        if not Existe(dmTablas.tblOcupanteMilitar, 'IDPERSONA', IdPersona) then
                MsjError('No se encontró el Ocupante')
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

function TfrmOcupanteMilitar.Consultar (IdPersona:integer):integer;
begin
{        if not Existe(dmTablas.tblOcupanteMilitar, 'IDPERSONA', IdPersona) then
                MsjError('No se encontró el Ocupante')
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

procedure TfrmOcupanteMilitar.btnAceptarClick(Sender: TObject);
begin
  try
    if dtpFecIng.Checked then
      ztblOM_FECHA_INGRESO.Value := dtpFecIng.Date
    else
      ztblOM_FECHA_INGRESO.Clear;
    ztblOM_.Post;
    if dmDatos.ADB.InTransaction then
      dmDatos.ADB.Commit;
    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el ocupante');
  end;
end;

procedure TfrmOcupanteMilitar.btnCancelarClick(Sender: TObject);
begin
  ztblOM_.Cancel;
  if dmDatos.ADB.InTransaction then
    dmDatos.ADB.Rollback;
end;

procedure TfrmOcupanteMilitar.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
  if (Sender = cmbEspecialidad) then
    ES_.IndexFieldNames := 'DESCRIPCION';
end;

procedure TfrmOcupanteMilitar.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
  if (Sender = cmbEspecialidad) then
    ES_.IndexFieldNames := '';
end;

procedure TfrmOcupanteMilitar.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmOcupanteMilitar.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmOcupanteMilitar.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmOcupanteMilitar.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmOcupanteMilitar.btnElegirGradoClick(Sender: TObject);
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

  if R then
    ztblOM_IDGRADO.Value := Id;
end;

procedure TfrmOcupanteMilitar.btnElegirEspecialidadClick(Sender: TObject);
var
  IdEspecialidad:integer;
  Descripcion:String;
begin
  with TfrmElecEspecialidad.Create(nil) do
  begin
    IdEspecialidad := GetId(Descripcion);
    if IdEspecialidad <> 0 then
      ztblOM_IDESPECIALIDAD.Value := IdEspecialidad;
    Release;
  end;
end;

procedure TfrmOcupanteMilitar.FormDestroy(Sender: TObject);
begin
{  if modalResult= mrCancel then
    dmTablas.tblOcupanteMilitar.Close;;}
end;

procedure TfrmOcupanteMilitar.BitBtn1Click(Sender: TObject);
begin
  TfrmOcupante(Self._FormAnterior).Modificar(Self._IdPersona, Self);
  ModalResult := mrOk;
end;

end.

unit IngOcupante2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, IBDatabase, ComCtrls;

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
    DataSource1: TDataSource;
    Label4: TLabel;
    dtpFecIng: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
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
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

  private
    gModo, teclas: Byte;
    procedure PrepararForm;


  public
    procedure Agregar(IdPersona: Integer);
    function Actualizar (IdPersona:integer):integer;
    function Consultar (IdPersona:integer):integer;

  end;

var
  frmOcupanteMilitar: TfrmOcupanteMilitar;

implementation

uses Util, Comunes, ElecEspecialidad, ElecGrado, StoreProcs;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmOcupanteMilitar.PrepararForm;
begin
{        if gModo=0 then
                pnlTitulo.Caption:='Ocupante Militar'
        else
                pnlTitulo.Caption := 'Ocupante Militar: ' +
                                     dmTablas.tblPersonaAPELLIDO.Text + ', ' +
                                     dmTablas.tblPersonaNOMBRE.Text;
        pnlDatos.Enabled := (gModo <> 3);}
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmOcupanteMilitar.Agregar(IdPersona: Integer);
begin
  gModo := MODE_INSERT;
  PrepararForm;

  ShowModal;

{  case ModalResult of
        mrOk: Result:=1;
        mrCancel: Result:=2;
        else
                Result:=3;
        end;}
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
var
  NuevoIdPersona: Longint;
begin
{  NuevoIdPersona := dmStoreProc.getId('IDPERSONA') + 1;
  try
    if Editando(dmTablas.tblPersona) then
    begin
      dmTablas.tblPersona.Post;
//      PERS.Refresh;
    end;
    if gModo=0 then
      dmTablas.tblOcupanteMilitarIDPERSONA.Value := NuevoIdPersona;
    dmTablas.tblOcupanteMilitarFECHA_INGRESO.Value := dtpFecIng.Date;
    dmTablas.tblOcupanteMilitar.Post;
    if dmTablas.Database.InTransaction then
      dmTablas.Database.Commit;
    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el ocupante');
  end;}
end;

procedure TfrmOcupanteMilitar.FormCreate(Sender: TObject);
begin
//  dmTablas.tblOcupanteMilitar.Open;;
end;

procedure TfrmOcupanteMilitar.btnCancelarClick(Sender: TObject);
begin
{  if Editando(dmTablas.tblOcupanteMilitar)then
    dmTablas.tblOcupanteMilitar.Cancel;
  if dmTablas.Database.InTransaction then
    dmTablas.Database.Rollback;}
end;

procedure TfrmOcupanteMilitar.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmOcupanteMilitar.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
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
{        with TfrmElecGrado.Create(nil) do
        begin
                R := GetEnt(Id,Descrip);
                Release;
        end;

        dmTablas.tblOcupanteMilitarIDGRADO.Value := Id;}
end;

procedure TfrmOcupanteMilitar.btnElegirEspecialidadClick(Sender: TObject);
var
  IdEspecialidad:integer;
  Descripcion:String;
begin
{  with TfrmElecEspecialidad.Create(nil) do
  begin
    IdEspecialidad := GetId(Descripcion);
    if IdEspecialidad <> 0 then
      dmTablas.tblOcupanteMilitarIDESPECIALIDAD.Value := IdEspecialidad;
    Release;
  end;}
end;

procedure TfrmOcupanteMilitar.FormDestroy(Sender: TObject);
begin
{  if modalResult= mrCancel then
    dmTablas.tblOcupanteMilitar.Close;;}
end;

end.

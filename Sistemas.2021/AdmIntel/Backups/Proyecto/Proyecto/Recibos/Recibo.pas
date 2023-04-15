unit Recibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, DBCtrls;

type
  TfrmRecibo = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    REC: TTable;
    RECIDRECIBO: TIntegerField;
    RECFECHA_EMISION: TDateTimeField;
    RECIDPERSONA: TIntegerField;
    RECFECHA_INICIO: TDateTimeField;
    RECFECHA_FIN: TDateTimeField;
    RECMONTO_MANTENIMIENTO: TFloatField;
    RECMONTO_EXPENSAS: TFloatField;
    RECIDEDIFICIO: TIntegerField;
    RECIDDEPARTAMENTO: TIntegerField;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    PERS: TTable;
    PERSIDPERSONA: TIntegerField;
    PERSNOMBRE: TStringField;
    PERSAPELLIDO: TStringField;
    PERSApeNom: TStringField;
    RECPersona: TStringField;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    DEPTO: TTable;
    EDIF: TTable;
    DEPTOIDEDIFICIO: TIntegerField;
    DEPTOIDDEPARTAMENTO: TIntegerField;
    DEPTODESCRIPCION: TStringField;
    EDIFIDEDIFICIO: TIntegerField;
    EDIFDESCRIPCION: TStringField;
    DEPTODescEdif: TStringField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PERSCalcFields(DataSet: TDataSet);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(const M: Byte);
    function DatosValidos: Boolean;

  public
    procedure Mostrar(const M: Byte);

  end;

var
  frmRecibo: TfrmRecibo;

implementation

uses Comunes, Util;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmRecibo.Mostrar(const M: Byte);
begin
  Modo := M;
  PrepararFormulario(M);

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmRecibo.PrepararFormulario(const M: Byte);
begin
{}
end;

function TfrmRecibo.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmRecibo.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmRecibo.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmRecibo.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmRecibo.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmRecibo.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmRecibo.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmRecibo.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmRecibo.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmRecibo.PERSCalcFields(DataSet: TDataSet);
begin
  PERSApeNom.Text := PERSAPELLIDO.Text + ' ' + PERSNOMBRE.Text;
end;

end.

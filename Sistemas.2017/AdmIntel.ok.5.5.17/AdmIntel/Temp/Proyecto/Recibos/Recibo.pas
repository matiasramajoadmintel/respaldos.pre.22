unit Recibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, DBCtrls,
  Mask, DateUtils;

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
    dtpEmision: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ComboOcupante: TDBLookupComboBox;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    dtpInicio: TDateTimePicker;
    Label4: TLabel;
    dtpFin: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    Bevel2: TBevel;
    Label11: TLabel;
    RECPersona: TStringField;
    RECNRO_RECIBO: TStringField;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    RA: TTable;
    RAIDRECIBO_ANULADO: TIntegerField;
    RANRO_RECIBO: TIntegerField;
    RAFECHA: TDateTimeField;
    qryOcup: TQuery;
    qryOcupIDOCUPANTE: TIntegerField;
    qryOcupOCUPANTE: TStringField;
    DBEdit4: TDBEdit;
    qryOcupLOCACION: TStringField;
    RECVivienda: TStringField;
    qryOcupIDEDIFICIO: TIntegerField;
    qryOcupIDDEPARTAMENTO: TIntegerField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboOcupanteClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    _Id: Longword;
    procedure PrepararFormulario(const M: Byte);
    function DatosValidos: Boolean;

  public
    function Agregar(var Id: Longword): Boolean;
    function Anular(Id: Longword): Boolean;
    function Modificar(Id: Longword): Boolean;

  end;

var
  frmRecibo: TfrmRecibo;

implementation

uses Comunes, Util;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmRecibo.Agregar(var Id: Longword): Boolean;
begin
  Modo := 0;
  PrepararFormulario(0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmRecibo.Anular(Id: Longword): Boolean;
begin
  Result := False;
  if Confirmar('¿Está seguro de anular al recibo elegido?') then
    try
      if Existe(RA, 'IDRECIBO_ANULADO', Id) then
        RA.Delete
      else
      begin
        Existe(REC, 'IDRECIBO', Id);
        RA.Append;
        RAIDRECIBO_ANULADO.Value := RECIDRECIBO.Value;
        RANRO_RECIBO.Text := RECNRO_RECIBO.Text;
        RAFECHA.Value := Date;
        RA.Post;
      end;
      REC.Close;
      RA.Close;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar anular el recibo.');
        Exit;
      end;
    end;

  Result := True;
end;

function TfrmRecibo.Modificar(Id: Longword): Boolean;
begin
  Modo := 2;
  Self._Id := Id;
  PrepararFormulario(2);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmRecibo.PrepararFormulario(const M: Byte);
var
  Dias, Mes, Anio: Word;
begin
  if M = 0 then //Alta
  begin
    Mes := MonthOf(Date) - 1;
    Anio := YearOf(Date);
    if Mes = 0 then
    begin
      Mes := 12;
      Anio := Anio - 1;
    end;
    Dias := DaysInAMonth(Anio, Mes);
    dtpEmision.Date := Date;
    dtpInicio.Date := StrToDate('01/' + IntToStr(Mes) + '/' + IntToStr(Anio));
    dtpFin.Date := StrToDate(IntToStr(Dias) + '/' + IntToStr(Mes) + '/' + IntToStr(Anio));

    REC.Open;
    REC.Append;
  end
  else //Modificación
  begin
    Existe(REC, 'IDRECIBO', Self._Id);
    dtpEmision.Date := RECFECHA_EMISION.Value;
    dtpInicio.Date := RECFECHA_INICIO.Value;
    dtpFin.Date := RECFECHA_FIN.Value;
    REC.Edit;
  end;
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

  try
    RECFECHA_EMISION.Value := dtpEmision.Date;
    RECFECHA_INICIO.Value := dtpInicio.Date;
    RECFECHA_FIN.Value := dtpFin.Date;
    REC.Post;
    REC.Close;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar agregar/modificar el recibo.');
      Exit;
    end;
  end;

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

procedure TfrmRecibo.ComboOcupanteClick(Sender: TObject);
begin
  RECIDEDIFICIO.Value := qryOcupIDEDIFICIO.Value;
  RECIDDEPARTAMENTO.Value := qryOcupIDDEPARTAMENTO.Value;
end;

end.

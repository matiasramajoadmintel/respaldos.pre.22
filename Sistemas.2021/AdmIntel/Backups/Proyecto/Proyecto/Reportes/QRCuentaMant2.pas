unit QRCuentaMant2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRCuentaMant2 = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qryTrab: TQuery;
    qryTrabNRO_PEDIDO: TIntegerField;
    qryTrabIDDEPARTAMENTO: TIntegerField;
    qryTrabDepto: TStringField;
    qryTrabFECHA_FIN: TDateTimeField;
    qryTrabRAZON_SOCIAL: TStringField;
    qryTrabCOSTO: TFloatField;
    qryTrabIMPUTACION: TStringField;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    qryTrabDESCRIP: TStringField;
    QRGroup2: TQRGroup;
    qryTrabIDEDIF: TIntegerField;
    qryTrabEdificio: TStringField;
    QRDBText3: TQRDBText;
    qryTrabTIPO_PAGO: TStringField;
    qryTrabEfectivo: TCurrencyField;
    qryTrabCheque: TCurrencyField;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr5: TQRExpr;
    procedure qryTrabCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const FechaIni, FechaFin: TDateTime);

  public
    procedure VistaPrevia(const FechaIni, FechaFin: TDateTime);
    procedure Imprimir(const FechaIni, FechaFin: TDateTime);

  end;

var
  frmQRCuentaMant2: TfrmQRCuentaMant2;

implementation

uses PoolQuerys, PoolAlcaldia;

{$R *.dfm}

procedure TfrmQRCuentaMant2.VistaPrevia(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaMant2.Imprimir(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaMant2.qryTrabCalcFields(DataSet: TDataSet);
begin
  if qryTrabTIPO_PAGO.Text = 'E' then
    qryTrabEfectivo.Value := qryTrabCOSTO.Value
  else
    qryTrabCheque.Value := qryTrabCOSTO.Value
end;

procedure TfrmQRCuentaMant2.AbrirQry(const FechaIni, FechaFin: TDateTime);
var
  FI,FF: String;
begin
  FI := DateToStr(FechaIni);
  FF := DateToStr(FechaFin);
  qryTrab.Filtered := False;
  qryTrab.Filter := 'FECHA_FIN >= ' + #39 + FI + #39 +
                ' AND FECHA_FIN <= ' + #39 + FF + #39;
  qryTrab.Open;
  qryTrab.Filtered := True;

  rptTrab.ReportTitle := 'Trabajos finalizados desde ' + FI + ' hasta ' + FF;
end;

end.

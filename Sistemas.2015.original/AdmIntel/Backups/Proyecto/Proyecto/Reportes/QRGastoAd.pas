unit QRGastoAd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRGastoAd = class(TForm)
    rpt: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    qry: TQuery;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qryFECHA_PAGO: TDateTimeField;
    qryCOSTO: TFloatField;
    qryDESCRIP: TStringField;
    qryTIPO_PAGO: TStringField;
    qryEfectivo: TCurrencyField;
    qryCheque: TCurrencyField;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    procedure qryCalcFields(DataSet: TDataSet);

  private
    procedure SumarImportes;
    procedure AbrirQry(const FechaIni, FechaFin: TDateTime);

  public
    procedure VistaPrevia(const FechaIni, FechaFin: TDateTime);
    procedure Imprimir(const FechaIni, FechaFin: TDateTime);

  end;

var
  frmQRGastoAd: TfrmQRGastoAd;

implementation

uses PoolQuerys, PoolAlcaldia, Comunes;

{$R *.dfm}

procedure TfrmQRGastoAd.VistaPrevia(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  SumarImportes;
  rpt.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRGastoAd.Imprimir(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  SumarImportes;
  rpt.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRGastoAd.SumarImportes;
var
  TE, TC, Tot: Currency;
begin
  TE := SumaColumna(qry,'Efectivo');
  TC := SumaColumna(qry,'Cheque');
  Tot := TE + TC;
  QRLabel5.Caption := CurrToStrF(TE,ffCurrency ,2);
  QRLabel6.Caption := CurrToStrF(TC,ffCurrency ,2);
  QRLabel8.Caption := CurrToStrF(Tot,ffCurrency ,2);
end;

procedure TfrmQRGastoAd.qryCalcFields(DataSet: TDataSet);
begin
  if qryTIPO_PAGO.Text = 'E' then
    qryEfectivo.Value := qryCOSTO.Value
  else
    qryCheque.Value := qryCOSTO.Value;
end;

procedure TfrmQRGastoAd.AbrirQry(const FechaIni, FechaFin: TDateTime);
var
  FI,FF: String;
begin
  FI := DateToStr(FechaIni);
  FF := DateToStr(FechaFin);
  qry.Filtered := False;
  qry.Filter := 'FECHA_PAGO >= ' + #39 + FI + #39 +
                ' AND FECHA_PAGO <= ' + #39 + FF + #39;
  qry.Open;
  qry.Filtered := True;

  rpt.ReportTitle := 'Gastos administrativos desde ' + FI + ' hasta ' + FF;
end;

end.

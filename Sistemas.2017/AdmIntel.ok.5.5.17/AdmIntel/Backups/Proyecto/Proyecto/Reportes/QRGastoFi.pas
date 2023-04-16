unit QRGastoFi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRGastoFi = class(TForm)
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
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    qryFECHA_PAGO: TDateTimeField;
    qryCOSTO: TFloatField;
    qryDESCRIP: TStringField;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;

  private
    procedure SumarImportes;
    procedure AbrirQry(const FechaIni, FechaFin: TDateTime);

  public
    procedure VistaPrevia(const FechaIni, FechaFin: TDateTime);
    procedure Imprimir(const FechaIni, FechaFin: TDateTime);

  end;

var
  frmQRGastoFi: TfrmQRGastoFi;

implementation

uses PoolQuerys, PoolAlcaldia, Comunes;

{$R *.dfm}

procedure TfrmQRGastoFi.VistaPrevia(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  SumarImportes;
  rpt.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRGastoFi.Imprimir(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  SumarImportes;
  rpt.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRGastoFi.SumarImportes;
var
  Tot: Currency;
begin
  Tot := SumaColumna(qry,'COSTO');
  QRLabel8.Caption := CurrToStrF(Tot,ffCurrency ,2);
end;

procedure TfrmQRGastoFi.AbrirQry(const FechaIni, FechaFin: TDateTime);
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

  rpt.ReportTitle := 'Gastos financieros desde ' + FI + ' hasta ' + FF;
end;

end.

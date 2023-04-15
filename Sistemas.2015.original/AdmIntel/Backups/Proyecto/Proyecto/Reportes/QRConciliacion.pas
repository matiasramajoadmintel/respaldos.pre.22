unit QRConciliacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRConciliacion = class(TForm)
    rpt: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;

  private
    procedure SumarImportes;
    procedure AbrirQry(const FechaIni, FechaFin: TDateTime);

  public
    procedure VistaPrevia(const FechaIni, FechaFin: TDateTime);
    procedure Imprimir(const FechaIni, FechaFin: TDateTime);

  end;

var
  frmQRConciliacion: TfrmQRConciliacion;

implementation

uses PoolQuerys, PoolAlcaldia, Comunes, Conciliacion;

{$R *.dfm}

procedure TfrmQRConciliacion.VistaPrevia(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  SumarImportes;
  rpt.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRConciliacion.Imprimir(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  SumarImportes;
  rpt.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRConciliacion.SumarImportes;
var
  Tot: Currency;
begin
{  Tot := SumaColumna(qry,'IMPORTE');
  QRLabel8.Caption := CurrToStrF(Tot,ffCurrency ,2);}
end;

procedure TfrmQRConciliacion.AbrirQry(const FechaIni, FechaFin: TDateTime);
var
  FI,FF: String;
begin
{  FI := DateToStr(FechaIni);
  FF := DateToStr(FechaFin);
  qry.Filtered := False;
  qry.Filter := 'FECHA_PAGO >= ' + #39 + FI + #39 +
                ' AND FECHA_PAGO <= ' + #39 + FF + #39;}
//  qry.Open;
//  qry.Filtered := True;

  rpt.ReportTitle := 'Conciliación bancaria al ' + DateToStr(Date);
end;

end.

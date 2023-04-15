unit QRLstGastoAd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRLstGastoAd = class(TForm)
    rpt: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    lblT: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
  private
    procedure SumarImportes;

  public
    procedure VistaPrevia;
    procedure Imprimir;

  end;

var
  frmQRLstGastoAd: TfrmQRLstGastoAd;

implementation

uses PoolQuerys, Comunes;

{$R *.dfm}

procedure TfrmQRLstGastoAd.VistaPrevia;
begin
  SumarImportes;
  rpt.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRLstGastoAd.Imprimir;
begin
  SumarImportes;
  rpt.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRLstGastoAd.SumarImportes;
var
  Total: Currency;

begin
  Total := SumaColumna(dmQuerys.qryGastoAd,'COSTO');
  lblT.Caption := CurrToStrF(Total,ffCurrency ,2);
  rpt.ReportTitle := 'Gastos administrativos';
end;

end.





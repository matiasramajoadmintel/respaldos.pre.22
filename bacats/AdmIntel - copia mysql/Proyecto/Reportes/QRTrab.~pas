unit QRTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRTrab = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    lblT: TQRLabel;
    QRLabel8: TQRLabel;
  private
    procedure SumarImportes;

  public
    procedure VistaPrevia;
    procedure Imprimir;

  end;

var
  frmQRTrab: TfrmQRTrab;

implementation

uses PoolQuerys, Comunes;

{$R *.dfm}

procedure TfrmQRTrab.VistaPrevia;
begin
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRTrab.Imprimir;
begin
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRTrab.SumarImportes;
var
  Total: Currency;
begin
  Total := SumaColumna(dmQuerys.qryTrab,'COSTO');
  lblT.Caption := CurrToStrF(Total,ffCurrency ,2);

  rptTrab.ReportTitle := 'Trabajos en departamentos';
end;

end.

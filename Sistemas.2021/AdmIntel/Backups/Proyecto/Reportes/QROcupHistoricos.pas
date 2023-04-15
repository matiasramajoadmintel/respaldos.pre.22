unit QROcupHistoricos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQROcupHistoricos = class(TForm)
    Report: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    txtMatricula: TQRDBText;
    txtOcupante: TQRDBText;
    txtFechaIni: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    txtFechaFin: TQRDBText;
    txtTipo: TQRDBText;
    QRLabel4: TQRLabel;
    txtLocacion: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;

  private

  public
    procedure Execute;

  end;

var
  frmQROcupHistoricos: TfrmQROcupHistoricos;

implementation

uses PoolQuerys, Comunes, Util;

{$R *.dfm}

procedure TfrmQROcupHistoricos.Execute;
begin
  Report.Preview;
  Application.ProcessMessages;
end;

end.

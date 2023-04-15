unit QROcupActuales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQROcupActuales = class(TForm)
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

  private

  public
    procedure Execute;

  end;

var
  frmQROcupActuales: TfrmQROcupActuales;

implementation

uses PoolQuerys, Comunes, Util;

{$R *.dfm}

procedure TfrmQROcupActuales.Execute;
begin
  Report.Preview;
  Application.ProcessMessages;
end;

end.

unit QRIngresos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRIngresos = class(TForm)
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
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    lblTotalMant: TQRLabel;
    lblTotalServ: TQRLabel;

  private

  public
    procedure Execute;

  end;

var
  frmQRIngresos: TfrmQRIngresos;

implementation

uses PoolQuerys;

{$R *.dfm}

procedure TfrmQRIngresos.Execute;
var
  TotalMant, TotalServ: Currency;
begin
  TotalMant := 0;
  TotalServ := 0;
  dmQuerys.qryIngresos.DisableControls;
  dmQuerys.qryIngresos.First;
  while not dmQuerys.qryIngresos.Eof do
  begin
    TotalMant := TotalMant + dmQuerys.qryIngresosIMPORTE_MANT.Value;
    TotalServ := TotalServ + dmQuerys.qryIngresosIMPORTE_SERV.Value;
    dmQuerys.qryIngresos.Next;
  end;
  lblTotalMant.Caption := '$ ' + CurrToStrF(TotalMant, ffFixed ,2);
  lblTotalServ.Caption := '$ ' + CurrToStrF(TotalServ, ffFixed ,2);

  Report.Preview;
  Application.ProcessMessages;
end;

end.

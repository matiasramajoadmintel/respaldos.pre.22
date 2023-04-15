unit QRServicios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRServicios = class(TForm)
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
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
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
    qryIDEDIFICIO: TIntegerField;
    qryFECHA_PAGO: TDateTimeField;
    qryCOSTO: TFloatField;
    qryDESCRIP: TStringField;
    qryTIPO_PAGO: TStringField;
    qryEdificio: TStringField;
    qryEfectivo: TCurrencyField;
    qryCheque: TCurrencyField;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    procedure qryCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const FechaIni, FechaFin: TDateTime);

  public
    procedure VistaPrevia(const FechaIni, FechaFin: TDateTime);
    procedure Imprimir(const FechaIni, FechaFin: TDateTime);

  end;

var
  frmQRServicios: TfrmQRServicios;

implementation

uses PoolQuerys, PoolAlcaldia;

{$R *.dfm}

procedure TfrmQRServicios.VistaPrevia(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  rpt.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRServicios.Imprimir(const FechaIni, FechaFin: TDateTime);
begin
  AbrirQry(FechaIni,FechaFin);
  rpt.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRServicios.qryCalcFields(DataSet: TDataSet);
begin
  if qryTIPO_PAGO.Text = 'E' then
    qryEfectivo.Value := qryCOSTO.Value
  else
    qryCheque.Value := qryCOSTO.Value
end;

procedure TfrmQRServicios.AbrirQry(const FechaIni, FechaFin: TDateTime);
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

  rpt.ReportTitle := 'Gastos de expensas desde ' + FI + ' hasta ' + FF;
end;

end.

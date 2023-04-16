unit QRCuentaMant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRCuentaMant = class(TForm)
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
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    qryTrab: TQuery;
    qryTrabFECHA: TDateTimeField;
    qryTrabRUBRO: TStringField;
    qryTrabNROTRABAJO: TIntegerField;
    qryTrabPROVEEDOR: TStringField;
    qryTrabTIPOPAGO: TStringField;
    qryTrabNROCHEQUE: TStringField;
    qryTrabIDEDIF: TIntegerField;
    qryTrabEfectivo: TCurrencyField;
    qryTrabCheque: TCurrencyField;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    lblCh: TQRLabel;
    lblE: TQRLabel;
    lblT: TQRLabel;
    QRSysData1: TQRSysData;
    qryTrabCOSTO: TFloatField;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    qryTrabNROFACTURA: TIntegerField;
    qryTrabEDIFICIO: TStringField;
    qryTrabDESCRIP: TStringField;
    procedure qryTrabCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const Mes, Anio: Word);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const Mes, Anio: Word);
    procedure Imprimir(const Mes, Anio: Word);

  end;

var
  frmQRCuentaMant: TfrmQRCuentaMant;

implementation

uses PoolQuerys, Util;

{$R *.dfm}

procedure TfrmQRCuentaMant.VistaPrevia(const Mes, Anio: Word);
begin
  AbrirQry(Mes,Anio);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaMant.Imprimir(const Mes, Anio: Word);
begin
  AbrirQry(Mes,Anio);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaMant.qryTrabCalcFields(DataSet: TDataSet);
begin
  if qryTrabTIPOPAGO.Text = 'E' then
    qryTrabEfectivo.Value := qryTrabCOSTO.Value
  else
    qryTrabCheque.Value := qryTrabCOSTO.Value
end;

procedure TfrmQRCuentaMant.AbrirQry(const Mes, Anio: Word);
var
  D: String;
begin
  D := IntToStr(DaysInAMonth(Anio,Mes));

  qryTrab.Filtered := False;
  qryTrab.Filter := 'FECHA >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                 IntToStr(Anio) + #39 + ' AND FECHA <= ' + #39 + D + '/' +
                 IntToStr(Mes) + '/' + IntToStr(Anio) + #39;
  qryTrab.Open;
  qryTrab.Filtered := True;

  rptTrab.ReportTitle := 'Cuenta Mantenimiento - ' + MesComoStr(Mes) + ' de ' +
                          IntToStr(Anio);
end;

procedure TfrmQRCuentaMant.SumarImportes;
var
  TE, TC: Currency;
begin
  with qryTrab do
  begin
    First;
    TE := 0;
    TC := 0;
    while not Eof do
    begin
      if qryTrabTIPOPAGO.Text = 'E' then TE := TE + qryTrabCOSTO.Value
      else TC := TC + qryTrabCOSTO.Value;
      Next;
    end;
  end;

  lblE.Caption := CurrToStrF(TE,ffFixed ,2);
  lblCh.Caption := CurrToStrF(TC,ffFixed ,2);
  lblT.Caption := CurrToStrF(TE+TC,ffFixed ,2);
end;

end.

unit QRCobrosPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRCobrosPart = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    lblMes: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    qryCobrosPart: TQuery;
    qryCobrosPartIDPERSONA: TIntegerField;
    qryCobrosPartOCUPANTE: TStringField;
    qryCobrosPartDOCUMENTO: TStringField;
    qryCobrosPartLOCACION: TStringField;
    qryCobrosPartMES: TStringField;
    qryCobrosPartANIO: TIntegerField;
    qryCobrosPartEXPENSAS: TFloatField;
    qryCobrosPartRAE: TFloatField;
    qryCobrosPartALQUILER: TFloatField;
    qryCobrosPartTotal: TCurrencyField;
    qryCobrosPartDEPTO: TStringField;
    qryCobrosPartEDIFICIO: TStringField;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    qryCobrosPartAlqExp: TCurrencyField;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    procedure qryCobrosPartCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const Mes: String; Anio: Word);

  public
    procedure Execute(const Mes: String; Anio: Word);

  end;

var
  frmQRCobrosPart: TfrmQRCobrosPart;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRCobrosPart.Execute(const Mes: String; Anio: Word);
begin
  AbrirQry(Mes, Anio);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCobrosPart.AbrirQry(const Mes: String; Anio: Word);
begin
  Filtrar(qryCobrosPart, '(MES=' + #39 + Mes + #39 + ' AND Anio=' +
          IntToStr(Anio) + ') OR (MES IS NULL)');

  lblMes.Caption := 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRCobrosPart.qryCobrosPartCalcFields(DataSet: TDataSet);
begin
  qryCobrosPartAlqExp.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartALQUILER.Value;

  qryCobrosPartTotal.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartALQUILER.Value +
                              qryCobrosPartRAE.Value;
end;

end.

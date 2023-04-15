unit QRCobrosCiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRCobrosCiv = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
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
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    qryCobrosPart: TQuery;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    qryCobrosPartOCUPANTE: TStringField;
    qryCobrosPartMR: TStringField;
    qryCobrosPartMES: TStringField;
    qryCobrosPartANIO: TIntegerField;
    qryCobrosPartALQUILER: TFloatField;
    qryCobrosPartRAE: TFloatField;
    qryCobrosPartEXPENSAS: TFloatField;
    qryCobrosPartTotal: TCurrencyField;
    qryCobrosPartGRADO: TStringField;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    procedure qryCobrosPartCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const Mes: String; Anio: Word);

  public
    procedure Execute(const Mes: String; Anio: Word);

  end;

var
  frmQRCobrosCiv: TfrmQRCobrosCiv;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRCobrosCiv.Execute(const Mes: String; Anio: Word);
begin
  AbrirQry(Mes, Anio);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCobrosCiv.AbrirQry(const Mes: String; Anio: Word);
begin
  Filtrar(qryCobrosPart, 'MES=' + #39 + Mes + #39 + ' AND Anio=' + IntToStr(Anio));

  lblMes.Caption := 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRCobrosCiv.qryCobrosPartCalcFields(DataSet: TDataSet);
begin
  qryCobrosPartTotal.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartALQUILER.Value +
                              qryCobrosPartRAE.Value;
end;

end.

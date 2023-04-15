unit QRFormularioPagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRFormularioPago = class(TForm)
    rptTrab: TQuickRep;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
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
    qryCobrosPartAlqExp: TCurrencyField;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    lblMes: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure qryCobrosPartCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const Mes: String; Anio: Word);

  public
    procedure Execute(const Mes: String; Anio: Word);

  end;

var
  frmQRFormularioPago: TfrmQRFormularioPago;

implementation

uses PoolQuerys, Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRFormularioPago.Execute(const Mes: String; Anio: Word);
begin
  AbrirQry(Mes, Anio);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRFormularioPago.AbrirQry(const Mes: String; Anio: Word);
begin
  Filtrar(qryCobrosPart, '(MES=' + #39 + Mes + #39 + ' AND Anio=' +
          IntToStr(Anio) + ') OR (MES IS NULL)');

  lblMes.Caption := Mes + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRFormularioPago.qryCobrosPartCalcFields(DataSet: TDataSet);
begin
  qryCobrosPartTotal.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartALQUILER.Value +
                              qryCobrosPartRAE.Value;
end;

end.

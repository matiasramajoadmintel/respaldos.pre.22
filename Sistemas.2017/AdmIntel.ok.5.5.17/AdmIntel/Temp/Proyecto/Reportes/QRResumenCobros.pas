unit QRResumenCobros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRResumenCobros = class(TForm)
    rptTrab: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    lblMes: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData5: TQRSysData;
    lblTotAlq: TQRLabel;
    lblTotExp: TQRLabel;
    lbl418: TQRLabel;
    lbl375: TQRLabel;
    lblVTotAlq: TQRLabel;
    lblVTotExp: TQRLabel;
    lblV418: TQRLabel;
    lblV375: TQRLabel;
    qry: TQuery;
    qryDESCRIPCION: TStringField;
    qryMES: TStringField;
    qryANIO: TIntegerField;
    qryMONTO: TFloatField;
    qryIDTIPODESCUENTO: TIntegerField;
    qryMR: TStringField;
    qryCODDESC: TIntegerField;
    qryEDIFICIO: TStringField;
    qryTIPOPAGO: TStringField;
    qryGRADO: TStringField;
    qryESPECIALIDAD: TStringField;
    qryAPENOM: TStringField;
    qryDEPTO: TStringField;
    qryTIPOPERS: TStringField;

  private
    procedure AbrirQry(const Mes: String; Anio: Word);

  public
    procedure Execute(const Mes: String; Anio: Word);

  end;

var
  frmQRResumenCobros: TfrmQRResumenCobros;

implementation

uses PoolQuerys, Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRResumenCobros.Execute(const Mes: String; Anio: Word);
begin
  AbrirQry(Mes, Anio);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRResumenCobros.AbrirQry(const Mes: String; Anio: Word);
var
  TotAlq, TotExp: Currency;
begin
  //Alquiler
  qry.Close;
  qry.ParamByName('D').AsInteger := 418;
  qry.ParamByName('M').AsString := Mes;
  qry.ParamByName('A').AsInteger := Anio;
  qry.ParamByName('P').AsString := '01';
  qry.Open;
  TotAlq := SumaColumna(qry, 'MONTO');
  lblVTotAlq.Caption := CurrToStrF(TotAlq, ffCurrency, 2);

  //Expensas
  qry.Close;
  qry.ParamByName('D').AsInteger := 418;
  qry.ParamByName('M').AsString := Mes;
  qry.ParamByName('A').AsInteger := Anio;
  qry.ParamByName('P').AsString := '03';
  qry.Open;
  TotExp := SumaColumna(qry, 'MONTO');
  lblVTotExp.Caption := CurrToStrF(TotExp, ffCurrency, 2);
  lblV418.Caption := CurrToStrF(TotExp + TotAlq, ffCurrency, 2);

  //RAE
  qry.Close;
  qry.ParamByName('D').AsInteger := 375;
  qry.ParamByName('M').AsString := Mes;
  qry.ParamByName('A').AsInteger := Anio;
  qry.ParamByName('P').AsString := '01';
  qry.Open;
  lblV375.Caption := CurrToStrF(SumaColumna(qry, 'MONTO'), ffCurrency, 2);

  lblMes.Caption := 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
end;

end.

unit QRCuentaServVacios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils, Variants;

type
  TfrmQRCuentaSerVacios = class(TForm)
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
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    lblCh: TQRLabel;
    lblE: TQRLabel;
    lblT: TQRLabel;
    QRSysData4: TQRSysData;
    qry: TQuery;
    qryIDEDIFICIO: TIntegerField;
    qryFECHA_PAGO: TDateTimeField;
    qryCOSTO: TFloatField;
    qryDESCRIP: TStringField;
    qryTIPO_PAGO: TStringField;
    qryEdificio: TStringField;
    qryEfectivo: TCurrencyField;
    qryCheque: TCurrencyField;
    qryRAZON_SOCIAL: TStringField;
    qryNRO_CHEQUE: TStringField;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel11: TQRLabel;
    lblNroDeci: TQRLabel;
    QRShape1: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    qryNRO_ORDEN: TIntegerField;
    QRDBText2: TQRDBText;
    qryNRO_DECI: TIntegerField;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    qryNRO_FACT: TIntegerField;
    QRLabel16: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBTextCute: TQRDBText;
    qryCute: TFloatField;
    lblR: TQRLabel;
    procedure qryTrabCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure AbrirQry(const Mes, Anio: Word);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const Mes, Anio: Word);
    procedure Imprimir(const Mes, Anio: Word);

  end;

var
  frmQRCuentaSerVacios: TfrmQRCuentaSerVacios;

implementation

uses PoolQuerys, Comunes, PoolDatos, Util;

{$R *.dfm}

procedure TfrmQRCuentaSerVacios.VistaPrevia(const Mes, Anio: Word);
begin
  AbrirQry(Mes,Anio);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaSerVacios.Imprimir(const Mes, Anio: Word);
begin
  AbrirQry(Mes,Anio);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaSerVacios.qryTrabCalcFields(DataSet: TDataSet);
begin
if qryTIPO_PAGO.Text = 'E' then
    qryEfectivo.Value := qryCOSTO.Value;

  if qryTIPO_PAGO.Text = 'R' then
    qryCute.Value := qryCOSTO.Value;

  if qryTIPO_PAGO.Text = 'C' then
    qryCheque.Value := qryCOSTO.Value


{  if qryTIPO_PAGO.Text = 'E' then
    qryEfectivo.Value := qryCOSTO.Value
  else
    qryCheque.Value := qryCOSTO.Value; }
end;

procedure TfrmQRCuentaSerVacios.AbrirQry(const Mes, Anio: Word);
var
  D: String;
begin
  D := IntToStr(DaysInAMonth(Anio,Mes));
  Existe(dmDatos.DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([-3, Mes, Anio]));
  lblNroDeci.Caption := 'DECI Nº ' + dmDatos.DECINRO_SERV.Text;

  qry.Close;
  qry.Filtered := False;
  qry.Filter := 'FECHA_PAGO >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                 IntToStr(Anio) + #39 + ' AND FECHA_PAGO <= ' + #39 + D + '/' +
                 IntToStr(Mes) + '/' + IntToStr(Anio) + #39;
  qry.Open;
  qry.Filtered := True;

  rptTrab.ReportTitle := 'Cuenta de servicios en departamentos vacios - ' +
                         MesComoStr(Mes) + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRCuentaSerVacios.SumarImportes;
var
  TE, TC, TR: Currency;
begin
with qry do
  begin
    First;
    TE := 0;
    TC := 0;
    TR := 0;
    while not Eof do
    begin
      if qryTIPO_PAGO.Text = 'E' then TE := TE + qryCOSTO.Value
      else
      if qryTIPO_PAGO.Text = 'C' then TC := TC + qryCOSTO.Value
       else TR := TR + qryCOSTO.Value;
    Next;
    end;
    end;


  lblE.Caption := CurrToStrF(TE,ffFixed ,2);
  lblCh.Caption := CurrToStrF(TC,ffFixed ,2);
  lblT.Caption := CurrToStrF(TE+TC+TR,ffFixed ,2);
  lblR.Caption := CurrToStrF(TR,ffFixed ,2);




{  with qry do
  begin
    First;
    TE := 0;
    TC := 0;
    while not Eof do
    begin
      if qryTIPO_PAGO.Text = 'E' then TE := TE + qryCOSTO.Value
      else TC := TC + qryCOSTO.Value;
      Next;
    end;
  end;

  lblE.Caption := CurrToStrF(TE,ffFixed ,2);
  lblCh.Caption := CurrToStrF(TC,ffFixed ,2);
  lblT.Caption := CurrToStrF(TE+TC,ffFixed ,2);}
end;

procedure TfrmQRCuentaSerVacios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatos.DECI.Filter := '';
  dmDatos.DECI.Filtered := False;
  dmDatos.DECI.Close;
end;

end.

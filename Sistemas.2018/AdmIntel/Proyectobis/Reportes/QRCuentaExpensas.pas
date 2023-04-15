unit QRCuentaExpensas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls;

type
  TfrmQRCuentaExpensas = class(TForm)
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
    QRSysData3: TQRSysData;
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
    procedure qryTrabCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const FechaIni, FechaFin: TDateTime;
                       const IdEdif: Integer; const Desc: String);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const FechaIni, FechaFin: TDateTime;
                          const IdEdif: Integer; const Desc: String);
    procedure Imprimir(const FechaIni, FechaFin: TDateTime;
                       const IdEdif: Integer; const Desc: String);

  end;

var
  frmQRCuentaExpensas: TfrmQRCuentaExpensas;

implementation

uses PoolQuerys, PoolAlcaldia, Comunes, PoolDatos;

{$R *.dfm}

procedure TfrmQRCuentaExpensas.VistaPrevia(const FechaIni, FechaFin: TDateTime;
                                        const IdEdif: Integer; const Desc: String);
begin
  AbrirQry(FechaIni,FechaFin,IdEdif,Desc);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaExpensas.Imprimir(const FechaIni, FechaFin: TDateTime;
                                     const IdEdif: Integer; const Desc: String);
begin
  AbrirQry(FechaIni,FechaFin,IdEdif,Desc);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaExpensas.qryTrabCalcFields(DataSet: TDataSet);
begin
  if qryTIPO_PAGO.Text = 'E' then
    qryEfectivo.Value := qryCOSTO.Value
  else
    qryCheque.Value := qryCOSTO.Value;
end;

procedure TfrmQRCuentaExpensas.AbrirQry(const FechaIni, FechaFin: TDateTime;
                                     const IdEdif: Integer; const Desc: String);
var
  FI,FF: String;
begin
  FI := DateToStr(FechaIni);
  FF := DateToStr(FechaFin);
  qry.Close;
  qry.ParamByName('N').AsInteger := IdEdif;
  qry.Filtered := False;
  qry.Filter := 'FECHA_PAGO >= ' + #39 + FI + #39 +
                ' AND FECHA_PAGO <= ' + #39 + FF + #39;
  qry.Open;
  qry.Filtered := True;

  rptTrab.ReportTitle := 'Cuenta Servicios - Edificio: ' + Desc +
                         ' -  del ' + FI + ' al ' + FF;

  Existe(dmDatos.DECI,'IDEDIFICIO',IdEdif);
  lblNroDeci.Caption := 'DECI Nº ' + dmDatos.DECINRO_SERV.Text;
end;

procedure TfrmQRCuentaExpensas.SumarImportes;
var
  TE, TC: Currency;
begin
  with qry do
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

  lblE.Caption := CurrToStrF(TE,ffCurrency ,2);
  lblCh.Caption := CurrToStrF(TC,ffCurrency ,2);
  lblT.Caption := CurrToStrF(TE+TC,ffCurrency ,2);
end;

end.

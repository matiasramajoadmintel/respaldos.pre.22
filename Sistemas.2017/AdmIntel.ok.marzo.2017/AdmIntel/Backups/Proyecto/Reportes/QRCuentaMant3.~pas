unit QRCuentaMant3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils, Variants;

type
  TfrmQRCuentaMant3 = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
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
    qryTrab: TQuery;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    qryTrabFECHA: TDateTimeField;
    qryTrabRUBRO: TStringField;
    qryTrabNROTRABAJO: TIntegerField;
    qryTrabPROVEEDOR: TStringField;
    qryTrabTIPOPAGO: TStringField;
    qryTrabIDEDIF: TIntegerField;
    qryTrabConcepto: TStringField;
    qryTrabEfectivo: TCurrencyField;
    lblCh: TQRLabel;
    lblE: TQRLabel;
    lblT: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel4: TQRLabel;
    lblNroDeci: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    qryTrabNRO_ORDEN: TIntegerField;
    QRDBText2: TQRDBText;
    qryTrabCOSTO: TFloatField;
    qryTrabNROFACTURA: TIntegerField;
    QRLabel16: TQRLabel;
    qryTrabCute: TCurrencyField;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    procedure qryTrabCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure AbrirQry(const Mes, Anio: Word;
                       const IdEdif: Integer; const Desc: String);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const Mes, Anio: Word;
                          const IdEdif: Integer; const Desc: String);
    procedure Imprimir(const Mes, Anio: Word;
                       const IdEdif: Integer; const Desc: String);

  end;

var
  frmQRCuentaMant3: TfrmQRCuentaMant3;

implementation

uses PoolQuerys, PoolDatos, Comunes, Util;

{$R *.dfm}

procedure TfrmQRCuentaMant3.VistaPrevia(const Mes, Anio: Word;
                                        const IdEdif: Integer; const Desc: String);
begin
  AbrirQry(Mes,Anio,IdEdif,Desc);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaMant3.Imprimir(const Mes, Anio: Word;
                                     const IdEdif: Integer; const Desc: String);
begin
  AbrirQry(Mes,Anio,IdEdif,Desc);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRCuentaMant3.qryTrabCalcFields(DataSet: TDataSet);
begin
  qryTrabConcepto.Text := qryTrabRUBRO.Text;

  if qryTrabTIPOPAGO.Text = 'E' then
    qryTrabEfectivo.Value := qryTrabCOSTO.Value;

  if qryTrabTIPOPAGO.Text = 'R' then
    qryTrabCute.Value := qryTrabCOSTO.Value;
end;

procedure TfrmQRCuentaMant3.AbrirQry(const Mes, Anio: Word;
                                     const IdEdif: Integer; const Desc: String);
var
  D: String;
begin
  D := IntToStr(DaysInAMonth(Anio,Mes));
Existe(dmDatos.DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([IdEdif, Mes, Anio]));
  lblNroDeci.Caption := 'DECI Nº ' + dmDatos.DECINRO_MANT.Text;

  qryTrab.Close;
  qryTrab.Filtered := False;
  qryTrab.Filter := 'FECHA >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                 IntToStr(Anio) + #39 + ' AND FECHA <= ' + #39 + D + '/' +
                 IntToStr(Mes) + '/' + IntToStr(Anio) + #39;
  qryTrab.ParamByName('E').AsInteger := IdEdif;
  qryTrab.Open;
  qryTrab.Filtered := True;

  rptTrab.ReportTitle := 'Cuenta Mantenimiento - Edificio: ' + Desc +
                         ' - ' + MesComoStr(Mes) + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRCuentaMant3.SumarImportes;
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

procedure TfrmQRCuentaMant3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatos.DECI.Filter := '';
  dmDatos.DECI.Filtered := False;
  dmDatos.DECI.Close;
end;

end.

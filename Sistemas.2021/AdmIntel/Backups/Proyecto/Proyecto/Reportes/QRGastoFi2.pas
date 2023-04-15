unit QRGastoFi2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRGastoFi2 = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    lblT: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    qry: TQuery;
    qryCOSTO: TFloatField;
    qryDESCRIP: TStringField;
    QRDBText2: TQRDBText;
    qryNRO_HOJA: TIntegerField;
    lblNroDeci: TQRLabel;
    QRShape1: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    qryFECHA: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure AbrirQry(const Mes, Anio: Word);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const Mes, Anio: Word);
    procedure Imprimir(const Mes, Anio: Word);


  end;

var
  frmQRGastoFi2: TfrmQRGastoFi2;

implementation

uses PoolQuerys, Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRGastoFi2.VistaPrevia(const Mes, Anio: Word);
begin
  AbrirQry(Mes,Anio);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRGastoFi2.Imprimir(const Mes, Anio: Word);
begin
  AbrirQry(Mes, Anio);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRGastoFi2.AbrirQry(const Mes, Anio: Word);
var
  D: String;
begin
  D := IntToStr(DaysInAMonth(Anio,Mes));

  qry.Close;
  qry.Filtered := False;
  qry.Filter := 'FECHA >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                 IntToStr(Anio) + #39 + ' AND FECHA <= ' + #39 + D + '/' +
                 IntToStr(Mes) + '/' + IntToStr(Anio) + #39;
  qry.Open;
  qry.Filtered := True;

  rptTrab.ReportTitle := 'Cuenta Gastos Financieros' +
                         ' - ' + MesComoStr(Mes) + ' de ' + IntToStr(Anio);

  Filtrar(dmDatos.DECI,'MES=' + IntToStr(Mes));
  Existe(dmDatos.DECI,'IDEDIFICIO',-2);
  lblNroDeci.Caption := 'DECI Nº ' + IntToStr(dmDatos.DECINRO_SERV.Value);
end;

procedure TfrmQRGastoFi2.SumarImportes;
var
  TE: Currency;
begin
  TE := SumaColumna(qry,'COSTO');
  lblT.Caption := CurrToStrF(TE,ffCurrency ,2);
end;

procedure TfrmQRGastoFi2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatos.DECI.Filter := '';
  dmDatos.DECI.Filtered := False;
  dmDatos.DECI.Close;
end;

end.

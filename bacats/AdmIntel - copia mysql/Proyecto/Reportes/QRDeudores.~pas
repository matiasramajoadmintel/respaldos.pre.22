unit QRDeudores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRDeudores = class(TForm)
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
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    qry: TQuery;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    lblConcepto: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    qryCOSTO: TFloatField;
    qryNRO_FACT: TIntegerField;
    qryIDPERSONA: TIntegerField;
    qryOCUPANTE: TStringField;
    qryTIPO: TStringField;
    qryMATRICULA: TStringField;
    qryFECHA_PAGO: TDateTimeField;
    qryDESCRIP: TStringField;
    QRLabel6: TQRLabel;

  private
    procedure AbrirQry(const FI, FF: TDateTime);

  public
    procedure VistaPrevia(const FI, FF: TDateTime);
    procedure Imprimir(const FI, FF: TDateTime);

  end;

var
  frmQRDeudores: TfrmQRDeudores;

implementation

uses PoolQuerys, Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRDeudores.VistaPrevia(const FI, FF: TDateTime);
begin
  AbrirQry(FI, FF);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRDeudores.Imprimir(const FI, FF: TDateTime);
begin
  AbrirQry(FI, FF);
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRDeudores.AbrirQry(const FI, FF: TDateTime);
begin
  qry.Close;
  qry.ParamByName('F1').AsDate := FI;
  qry.ParamByName('F2').AsDate := FF;
  qry.Open;

  lblConcepto.Caption := 'Desde ' + DateToStr(FI) + ' hasta ' + DateToStr(FF);
end;

end.

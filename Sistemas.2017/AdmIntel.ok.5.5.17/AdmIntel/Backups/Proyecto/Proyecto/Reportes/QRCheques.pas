unit QRCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRCheques = class(TForm)
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
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    lblT: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    qry: TQuery;
    qryFECHA_PAGO: TDateTimeField;
    qryIMPORTE: TFloatField;
    qryNRO_CHEQUE: TStringField;
    qryCOBRADO: TStringField;
    qryRAZON_SOCIAL: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    lblCob: TQRLabel;
    lblNoCob: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;

  private
    procedure AbrirQry(const FI, FF: TDateTime; const Orden: String);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const FI, FF: TDateTime; const Orden: String);
    procedure Imprimir(const FI, FF: TDateTime; const Orden: String);


  end;

var
  frmQRCheques: TfrmQRCheques;

implementation

uses PoolQuerys, Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRCheques.VistaPrevia(const FI, FF: TDateTime; const Orden: String);
begin
  AbrirQry(FI,FF,Orden);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCheques.Imprimir(const FI, FF: TDateTime; const Orden: String);
begin
  AbrirQry(FI,FF,Orden);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRCheques.AbrirQry(const FI, FF: TDateTime; const Orden: String);
begin
  with qry do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_PAGADOS WHERE TIPO_PAGO = ' + #39 + 'C' + #39);
    SQL.Add('ORDER BY ' + Orden);
    Filtered := False;
    Filter := 'FECHA_PAGO >= ' + #39 + DateToStr(FI) + #39 +
                ' AND FECHA_PAGO <= ' + #39 + DateToStr(FF) + #39;
    Open;
    Filtered := True;
  end;

  rptTrab.ReportTitle := 'Listado de Cheques Emitidos' +
                         ' - del ' + DateToStr(FI) + ' al ' + DateToStr(FF);
end;

procedure TfrmQRCheques.SumarImportes;
var
  TE, TC, TN: Currency;
begin
  with qry do
  begin
    First;
    TE := 0;
    TC := 0;
    TN := 0;
    while not Eof do
    begin
      TE := TE + qryIMPORTE.Value;
      if qryCOBRADO.Value = 'Sí' then TC := TC + qryIMPORTE.Value
      else TN := TN + qryIMPORTE.Value;
      Next;
    end;
  end;

  lblT.Caption := CurrToStrF(TE,ffCurrency ,2);
  lblCob.Caption := CurrToStrF(TC,ffCurrency ,2);
  lblNoCob.Caption := CurrToStrF(TN,ffCurrency ,2);
end;

end.

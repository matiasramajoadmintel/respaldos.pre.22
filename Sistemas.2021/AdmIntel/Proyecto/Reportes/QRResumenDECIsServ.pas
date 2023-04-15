unit QRResumenDECIsServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRResumenDECIsServ = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    lblTotal: TQRLabel;
    lblTotalRAE: TQRLabel;
    lblTotalEfec: TQRLabel;
    QRSysData4: TQRSysData;
    qry: TQuery;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText3: TQRDBText;
    qryEDIFICIO: TStringField;
    qryIMPORTE_EFEC: TFloatField;
    qryIMPORTE_CHEQUE: TFloatField;
    qryTOTAL: TFloatField;
    qryIMPORTE_RAE: TFloatField;
    lblTotalCheque: TQRLabel;
    QRDBTextIMPORTE_CHEQUE: TQRDBText;
    lbl1: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure AbrirQry(const Mes, Anio: Word);
    procedure SumarImportes;

  public
    procedure VistaPrevia(const Mes, Anio: Word);
    procedure Imprimir(const Mes, Anio: Word);


  end;

var
  frmQRResumenDECIsServ: TfrmQRResumenDECIsServ;

implementation

uses PoolQuerys, Comunes, PoolDatos, Util;

{$R *.dfm}

procedure TfrmQRResumenDECIsServ.VistaPrevia(const Mes, Anio: Word);
begin
  AbrirQry(Mes, Anio);
  SumarImportes;
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRResumenDECIsServ.Imprimir(const Mes, Anio: Word);
begin
  AbrirQry(Mes,Anio);
  SumarImportes;
  rptTrab.Print;
  Application.ProcessMessages;
end;

procedure TfrmQRResumenDECIsServ.AbrirQry(const Mes, Anio: Word);
var
  Script: String;
  D: Word;
  F1, F2: TDateTime;
begin
  D := DaysInAMonth(Anio,Mes);

  Script := 'SELECT EDIFICIO, SUM(IMPORTE_EFEC) IMPORTE_EFEC, ' +
            'SUM(IMPORTE_CHEQUE) IMPORTE_CHEQUE, ' +  'SUM(IMPORTE_RAE) IMPORTE_RAE, ' +
            'SUM(IMPORTE_EFEC+IMPORTE_CHEQUE+IMPORTE_RAE) TOTAL ' +
            'FROM VW_RESUMEN_DECI_SERV2 ' +
            'WHERE FECHA >= ' + #39 + IntToStr(Mes) + '/1/' + IntToStr(Anio) +
            #39 + ' AND FECHA <= ' + #39 + IntToStr(Mes) + '/' + IntToStr(D) +
            '/' + IntToStr(Anio) + #39 +
            'GROUP BY EDIFICIO ' +
            'ORDER BY EDIFICIO';

  qry.Close;
  qry.SQL.Add(Script);
  qry.Open;

  rptTrab.ReportTitle := MesComoStr(Mes) + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRResumenDECIsServ.SumarImportes;
var
  TE, TR, TC, TT: Currency;
begin
  with qry do
  begin
    First;
    TE := 0;
    TR := 0;
    TC := 0;
    while not Eof do
    begin
      TE := TE + qryIMPORTE_EFEC.Value;
      TR := TR + qryIMPORTE_RAE.Value;
      TC := TC + qryIMPORTE_CHEQUE.Value;
      Next;
    end;
  end;

  lblTotalEfec.Caption := CurrToStrF(TE,ffFixed ,2);
  lblTotalRAE.Caption := CurrToStrF(TR,ffFixed ,2);
  lblTotal.Caption := CurrToStrF(TE+TR+TC,ffFixed ,2);
  lblTotalCheque.Caption := CurrToStrF(TC,ffFixed ,2);
end;

procedure TfrmQRResumenDECIsServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatos.DECI.Filter := '';
  dmDatos.DECI.Filtered := False;
  dmDatos.DECI.Close;
end;

end.

unit QRTitulares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRTitulares = class(TForm)
    Report: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    txtMatricula: TQRDBText;
    txtOcupante: TQRDBText;
    txtFechaIni: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    txtFechaFin: TQRDBText;
    txtTipo: TQRDBText;
    QRLabel4: TQRLabel;
    txtLocacion: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    lblPersonal: TQRLabel;
    lblZonaNaval: TQRLabel;
    lblLocalidad: TQRLabel;
    lblClasificacion: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    lblDireccion: TQRLabel;
    lblViviendaTipo: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    qry: TQuery;
    qryOCUPANTE: TStringField;
    qryTIPO: TStringField;
    qryIDEDIFICIO: TIntegerField;
    qryMATRICULA: TStringField;
    qryUNIDAD: TStringField;
    qryTEL_UNIDAD: TStringField;
    qryGRADO: TStringField;
    qryDESTINO: TStringField;
    qryTEL_DESTINO: TStringField;
    QRSysData1: TQRSysData;
    EDI: TTable;
    EDIIDEDIFICIO: TIntegerField;
    EDIDIRECCION: TStringField;

  private
    procedure PrepararForm(Personal: Byte; IdEdificio: Integer);
    procedure AbrirQry(Personal: Byte; IdEdificio: Integer);

  public
    procedure Execute(Personal: Byte; IdEdificio: Integer);
    //Personal = 1 -> Superior
    //Personal = 2 -> Subalterno
    //Personal = 3 -> Civil
    //Personal = 4 -> Remanente
  end;

var
  frmQRTitulares: TfrmQRTitulares;

implementation

uses PoolQuerys, Comunes, Util;

{$R *.dfm}

procedure TfrmQRTitulares.Execute(Personal: Byte; IdEdificio: Integer);
begin
  AbrirQry(Personal, IdEdificio);
  PrepararForm(Personal, IdEdificio);
  Report.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRTitulares.PrepararForm(Personal: Byte; IdEdificio: Integer);
begin
  case Personal of
    1: lblPersonal.Caption := 'SUPERIOR';
    2: lblPersonal.Caption := 'SUBALTERNO';
    3: lblPersonal.Caption := 'CIVIL';
    4: lblPersonal.Caption := 'REMANENTES';
  end;

  lblZonaNaval.Caption := 'ATLANTICA';
  lblLocalidad.Caption := 'MAR DEL PLATA';
  Existe(EDI, 'IDEDIFICIO', IdEdificio);
  lblDireccion.Caption := EDIDIRECCION.Text;
  lblClasificacion.Caption := 'EDIFICIO';
  lblViviendaTipo.Caption := 'DEPARTAMENTO';

end;

procedure TfrmQRTitulares.AbrirQry(Personal: Byte; IdEdificio: Integer);
begin
  qry.Close;
  qry.ParamByName('E').AsInteger := IdEdificio;
  case Personal of
    1: qry.ParamByName('T').AsString := 'Personal militar';
    2: qry.ParamByName('T').AsString := 'Personal militar';
    3: qry.ParamByName('T').AsString := 'Personal civil';
    4: qry.ParamByName('T').AsString := 'Particular';
  end;
  qry.Open;
end;

end.

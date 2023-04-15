unit QRCobrosPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComObj,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRCobrosPart = class(TForm)
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
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData4: TQRSysData;
    lblMes: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
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
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    qryCobrosPartAlqRAE: TCurrencyField;
    procedure qryCobrosPartCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const Mes: String; Anio: Word);

  public
    procedure Execute(const Mes: String; Anio: Word);

  end;

var
  frmQRCobrosPart: TfrmQRCobrosPart;
  xml:TextFile;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

procedure TfrmQRCobrosPart.Execute(const Mes: String; Anio: Word);
begin
  AbrirQry(Mes, Anio);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCobrosPart.AbrirQry(const Mes: String; Anio: Word);

var
  Excel, Libro : Variant;
  i:integer;

begin
  Filtrar(qryCobrosPart, '(MES=' + #39 + Mes + #39 + ' AND Anio=' + IntToStr(Anio) + ') OR (MES IS NULL)');

  // Crea una aplicacion Excel.
    Excel := CreateOleObject ('Excel.Application');
    // La muestra (vas a ver un Excel como si lo hubieras ejecutado)
    Excel.Visible := True;
    // Agrega un libro.
    Excel.WorkBooks.Add (-4167);
    // Le asigna un nombre al libro
    Excel.WorkBooks[1].WorkSheets[1].Name := 'Reporte';
    // Hace un puntero al libro del Excel.
    Libro := Excel.WorkBooks[1].WorkSheets['Reporte'];

    qryCobrosPart.Open;
    i:=1;
    while not qryCobrosPart.EOF do
    begin

    // encabezado
    Libro.Cells [1,1] := 'COBROS A PARTICULARES';
    Libro.Cells [1,1].Font.Bold:=True;
    Libro.Cells [1,1].Font.Size:=13;
    Libro.Cells [2,1] := 'ARMADA ARGENTINA - ALCALDIA BNMDP';
    Libro.Cells [2,1].Font.Bold:=True;
    Libro.Cells [4,1]:= 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
    Libro.Cells [4,1].Font.Bold:=True;
    Libro.Cells [5,1]:= 'FECHA: '+DateToStr(Date);
    Libro.Cells [5,1].Font.Bold:=True;

    // aqui le ponemos nombre a los campos
    Libro.Cells [7,1] := 'APELLIDO Y NOMBRE';
    Libro.Cells [7,1].Font.Bold:=True;
    Libro.Cells [7,2] := 'DOCUMENTO';
    Libro.Cells [7,2].Font.Bold:=True;
    Libro.Cells [7,3] := 'EDIFICIO Y DEPTO';
    Libro.Cells [7,3].Font.Bold:=True;
    Libro.Cells [7,4] := 'ALQUILER';
    Libro.Cells [7,4].Font.Bold:=True;
    Libro.Cells [7,5] := 'RAE';
    Libro.Cells [7,5].Font.Bold:=True;
    Libro.Cells [7,6] := 'ALQ+RAE';
    Libro.Cells [7,6].Font.Bold:=True;
    Libro.Cells [7,7] := 'EXPENSAS';
    Libro.Cells [7,7].Font.Bold:=True;
    Libro.Cells [7,8] := 'TOTAL';
    Libro.Cells [7,8].Font.Bold:=True;



    i:=i+1;
    Libro.Cells [i+6,1] := qryCobrosPart.FieldByName ('OCUPANTE').AsString;
    Libro.Cells [i+6,2] := qryCobrosPart.FieldByName ('DOCUMENTO').AsString;
    Libro.Cells [i+6,3] := qryCobrosPart.FieldByName ('LOCACION').AsString;
    Libro.Cells [i+6,4] := Format('%n', [qryCobrosPart.FieldByName ('ALQUILER').AsFloat]);
    Libro.Cells [i+6,5] := Format('%n', [qryCobrosPart.FieldByName ('RAE').AsFloat]);
    Libro.Cells [i+6,6] := Format('%n', [qryCobrosPart.FieldByName ('RAE').AsFloat + qryCobrosPart.FieldByName('ALQUILER').AsFloat]);
    Libro.Cells [i+6,7] := Format('%n', [qryCobrosPart.FieldByName ('EXPENSAS').AsFloat]);
    Libro.Cells [i+6,8] := Format('%n', [qryCobrosPart.FieldByName ('EXPENSAS').AsFloat + qryCobrosPart.FieldByName ('RAE').AsFloat + qryCobrosPart.FieldByName ('ALQUILER').AsFloat]);

    qryCobrosPart.Next;
    end;

  lblMes.Caption := 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
end;

procedure TfrmQRCobrosPart.qryCobrosPartCalcFields(DataSet: TDataSet);
begin
  qryCobrosPartAlqRAE.Value := qryCobrosPartRAE.Value +
                              qryCobrosPartALQUILER.Value;

  qryCobrosPartTotal.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartALQUILER.Value +
                              qryCobrosPartRAE.Value;
end;

end.

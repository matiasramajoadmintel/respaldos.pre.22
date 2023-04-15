unit QRCobrosCiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComObj,
  DB, DBTables, QRCTRLS, QUICKRPT, ExtCtrls, DateUtils;

type
  TfrmQRCobrosCiv = class(TForm)
    rptTrab: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
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
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    qryCobrosPart: TQuery;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    qryCobrosPartOCUPANTE: TStringField;
    qryCobrosPartMR: TStringField;
    qryCobrosPartMES: TStringField;
    qryCobrosPartANIO: TIntegerField;
    qryCobrosPartALQUILER: TFloatField;
    qryCobrosPartRAE: TFloatField;
    qryCobrosPartEXPENSAS: TFloatField;
    qryCobrosPartGRADO: TStringField;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    qryCobrosPartFR: TFloatField;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr2: TQRExpr;
    qryCobrosPartExpFR: TFloatField;
    QRLabel7: TQRLabel;
    qryCobrosPartTotal: TFloatField;
    QRDBTextTotal: TQRDBText;
    QRExpr5: TQRExpr;
    procedure qryCobrosPartCalcFields(DataSet: TDataSet);

  private
    procedure AbrirQry(const Mes: String; Anio: Word);

  public
    procedure Execute(const Mes: String; Anio: Word);

  end;

var
  frmQRCobrosCiv: TfrmQRCobrosCiv;
   xml:TextFile;
   linea:string;

implementation

uses Comunes, Util, PoolDatos, Ing2Textos;

{$R *.dfm}

procedure TfrmQRCobrosCiv.Execute(const Mes: String; Anio: Word);
begin
  AbrirQry(Mes, Anio);
  rptTrab.Preview;
  Application.ProcessMessages;
end;

procedure TfrmQRCobrosCiv.AbrirQry(const Mes: String; Anio: Word);

var
  Excel, Libro : Variant;
  i:integer;


begin
    Filtrar(qryCobrosPart, 'MES=' + #39 + Mes + #39 + ' AND Anio=' + IntToStr(Anio));

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
      Libro.Cells [1,1] := 'DESCUENTOS A PERSONAL CIVIL';
    Libro.Cells [1,1].Font.Bold:=True;
    Libro.Cells [1,1].Font.Size:=13;
    Libro.Cells [2,1] := 'ARMADA ARGENTINA - ALCALDIA BNMDP';
    Libro.Cells [2,1].Font.Bold:=True;
    Libro.Cells [4,1]:= 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
    Libro.Cells [4,1].Font.Bold:=True;
    Libro.Cells [5,1]:= 'FECHA: '+DateToStr(Date);
    Libro.Cells [5,1].Font.Bold:=True;

    // aqui le ponemos nombre a los campos
    Libro.Cells [7,1] := 'MR';
    Libro.Cells [7,1].Font.Bold:=True;
    Libro.Cells [7,2] := 'GRADO';
    Libro.Cells [7,2].Font.Bold:=True;
    Libro.Cells [7,3] := 'APELLIDO Y NOMBRE';
    Libro.Cells [7,3].Font.Bold:=True;
    Libro.Cells [7,4] := 'ALQUILER (418)';
    Libro.Cells [7,4].Font.Bold:=True;
    Libro.Cells [7,5] := 'EXP+FR (420)';
    Libro.Cells [7,5].Font.Bold:=True;
    Libro.Cells [7,6] := 'RAE (375)';
    Libro.Cells [7,6].Font.Bold:=True;
    Libro.Cells [7,7] := 'FR';
    Libro.Cells [7,7].Font.Bold:=True;
    Libro.Cells [7,8] := 'TOTAL';
    Libro.Cells [7,8].Font.Bold:=True;

    i:=i+1;
    Libro.Cells [i+6,1] := qryCobrosPart.FieldByName ('MR').AsString;
    Libro.Cells [i+6,2] := qryCobrosPart.FieldByName ('GRADO').AsString;
    Libro.Cells [i+6,3] := qryCobrosPart.FieldByName ('OCUPANTE').AsString;
    Libro.Cells [i+6,4] := Format('%n', [qryCobrosPart.FieldByName ('ALQUILER').AsFloat]);
    Libro.Cells [i+6,5] := Format('%n', [qryCobrosPart.FieldByName ('EXPENSAS').AsFloat + qryCobrosPart.FieldByName ('FR').AsFloat]);
    Libro.Cells [i+6,6] := Format('%n', [qryCobrosPart.FieldByName ('RAE').AsFloat]);
    Libro.Cells [i+6,7] := Format('%n', [qryCobrosPart.FieldByName ('FR').AsFloat]);
    Libro.Cells [i+6,8] := Format('%n', [qryCobrosPartTotal.Value]);

    qryCobrosPart.Next;
    end;
    lblMes.Caption := 'PERIODO: ' + Mes + ' de ' + IntToStr(Anio);
end;





procedure TfrmQRCobrosCiv.qryCobrosPartCalcFields(DataSet: TDataSet);
begin
  qryCobrosPartExpFR.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartFR.Value;
  qryCobrosPartTotal.Value := qryCobrosPartExpFR.Value +
                              qryCobrosPartALQUILER.Value + qryCobrosPartRAE.Value;
end;

end.



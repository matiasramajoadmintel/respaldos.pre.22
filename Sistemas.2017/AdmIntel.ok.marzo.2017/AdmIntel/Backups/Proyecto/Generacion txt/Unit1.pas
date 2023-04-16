unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Buttons, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Database1: TDatabase;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    qry375: TQuery;
    qry418: TQuery;
    qry375MATRICULA: TStringField;
    qry375IMPORTE: TFloatField;
    qry375MES: TStringField;
    qry375CODIGO: TStringField;
    qry418MATRICULA: TStringField;
    qry418IMPORTE: TFloatField;
    qry418MES: TStringField;
    qry418CODIGO: TStringField;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    qry418Resto: TQuery;
    qry418RestoMATRICULA: TStringField;
    qry418RestoIMPORTE: TIntegerField;
    qry418RestoMES: TStringField;
    qry418RestoCODIGO: TStringField;
    qry299: TQuery;
    qry299MATRICULA: TStringField;
    qry299MONTO: TFloatField;
    qry299CODIGO: TStringField;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);

  private
    FileName: String;

  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

uses Util, Comunes;

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  Linea, ImpStr: String;
  ImpCurr: Currency;
  i: Word;
begin
  Memo1.Lines.Clear;
  i := 0;
  with qry375 do
  begin
    Open;
    First;
    while not Eof do
    begin
      ImpCurr := TruncarReal(qry375IMPORTE.Value) * 100;
      ImpStr := CurrToStr(ImpCurr);
      while Length(ImpStr) < 8 do
        ImpStr := '0' + ImpStr;
      Linea := '01' + '      ' + qry375MATRICULA.Text + '3752A3155A2' +
               '          ' + ImpStr + '   ' + qry375MES.Text + '  ' +
               qry375CODIGO.Text;
      Memo1.Lines.Add(Linea);
      i := i + 1;
      Next;
    end;
    Close;
  end;
  FileName := 'Cod375.txt';
  Label1.Caption := 'Cod. 375: ' + IntToStr(i) + ' registros';
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(ExtractFileDir(Application.ExeName) + '\' + FileName);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Halt;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  Linea, ImpStr: String;
  ImpCurr: Currency;
  i: Word;
begin
  Memo1.Lines.Clear;
  i := 0;

  with qry418 do
  begin
    Open;
    First;
    while not Eof do
    begin
      ImpCurr := TruncarReal(qry418IMPORTE.Value) * 100;
      ImpStr := CurrToStr(ImpCurr);
      while Length(ImpStr) < 8 do
        ImpStr := '0' + ImpStr;
      Linea := '01' + '      ' + qry418MATRICULA.Text + '4182A3155A2' +
               '          ' + ImpStr + '   ' + qry418MES.Text + '  ' +
               qry418CODIGO.Text;
      Memo1.Lines.Add(Linea);
      i := i + 1;
      Next;
    end;
    Close;
  end;

  with qry418Resto do
  begin
    Open;
    First;
    while not Eof do
    begin
      ImpStr := qry418RestoIMPORTE.Text;
      while Length(ImpStr) < 8 do
        ImpStr := '0' + ImpStr;
      Linea := '01' + '      ' + qry418RestoMATRICULA.Text + '4182A3155A2' +
               '          ' + ImpStr + '   ' + qry418RestoMES.Text + '  ' +
               qry418RestoCODIGO.Text;
      Memo1.Lines.Add(Linea);
      i := i + 1;
      Next;
    end;
    Close;
  end;

  FileName := 'Cod418.txt';
  Label2.Caption := 'Cod. 418: ' + IntToStr(i) + ' registros';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Label1.Caption := 'Cod. 375: 0 registros';
  Label2.Caption := 'Cod. 418: 0 registros';
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var
  T01, T03, T04, T375, T299: Currency;
  R01, R03, R04, R375, R299: Word;
begin
  Memo1.Lines.Clear;

  T01 := TruncarReal(SumaColumna(qry418,'IMPORTE'));
  R01 := qry418.RecordCount;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('          TOTAL CODIGO    01 ' + CurrToStr(T01));
  Memo1.Lines.Add('          TOTAL REGISTROS 01     ' + IntToStr(R01));

  Filtrar(qry418Resto,'CODIGO='+#39+'03'+#39);
  T03 := TruncarReal(SumaColumna(qry418Resto,'IMPORTE')/100);
  R03 := qry418Resto.RecordCount;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('          TOTAL CODIGO    03 ' + CurrToStr(T03));
  Memo1.Lines.Add('          TOTAL REGISTROS 03     ' + IntToStr(R03));

  Filtrar(qry418Resto,'CODIGO='+#39+'04'+#39);
  T04 := TruncarReal(SumaColumna(qry418Resto,'IMPORTE')/100);
  R04 := qry418Resto.RecordCount;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('          TOTAL CODIGO    04  ' + CurrToStr(T04));
  Memo1.Lines.Add('          TOTAL REGISTROS 04       ' + IntToStr(R04));

  T375 := TruncarReal(SumaColumna(qry375,'IMPORTE'));
  R375 := qry375.RecordCount;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('          TOTAL CODIGO    375 ' + CurrToStr(T375));
  Memo1.Lines.Add('          TOTAL REGISTROS 375     ' + IntToStr(R375));

  T299 := TruncarReal(SumaColumna(qry299,'MONTO'));
  R299 := qry299.RecordCount;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('          TOTAL CODIGO    299 ' + CurrToStr(T299));
  Memo1.Lines.Add('          TOTAL REGISTROS 299      ' + IntToStr(R299));

  Memo1.Lines.Add('');
  Memo1.Lines.Add('    ******************************************');
  Memo1.Lines.Add('          TOTAL GENERAL       ' + CurrToStr(T01+T03+T04+T375+T299));
  Memo1.Lines.Add('          TOTAL REGISTROS          ' + IntToStr(R01+R03+R04+R299));
  Memo1.Lines.Add('    ******************************************');

  FileName := 'Totales.txt';
  SumaColumna(qry418Resto,'IMPORTE');
end;

end.

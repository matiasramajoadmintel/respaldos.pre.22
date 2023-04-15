unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ComObj , ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    DataSource1: TDataSource;
    Query1: TQuery;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    tbl1: TTable;
    tbl2: TTable;
    bm1: TBatchMove;
    Button2: TButton;
    btn1: TButton;
    btn2: TButton;
    Edit2: TEdit;
    btn3: TButton;
    Edit3: TEdit;
    Query2: TQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Query1.Close;
Query1.SQL.Clear;
Query1.SQL.Add ('SELECT  * FROM ' + Edit1.Text);
Query1.RequestLive:= True;
Query1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
bm1.Execute;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  Excel, Libro : Variant;
var
 i:integer;
  begin
    // Crea una aplicacion Excel.
    Excel := CreateOleObject ('Excel.Application');
    // La muestra (vas a ver un Excel como si lu ubieras ejecutado)
    Excel.Visible := True;
    // Agrega un libro.
    Excel.WorkBooks.Add (-4167);
    // Le asigna un nombre al libro
    Excel.WorkBooks[1].WorkSheets[1].Name := 'Reporte';
    // Hace un puntero al libro del Excel.
    Libro := Excel.WorkBooks[1].WorkSheets['Reporte'];

    //Query.SQL.Add (�Consulta�);
    Query1.Open;
    i:=1;
    while not Query1.EOF do
    begin
    // aqui le ponemos nombre a los campos
    Libro.Cells [1,1] := 'Socioid';
    Libro.Cells [1,2] := 'Nombre';
    Libro.Cells [1,3] := 'Cedula';
    Libro.Cells [1,4] := 'CodEmpleado';
    i:=i+1;
    Libro.Cells [i,1] := Query1.FieldByName ('Socioid').AsString;
    Libro.Cells [i,2] := Query1.FieldByName ('Nombre').AsString;
    Libro.Cells [i,3] := Query1.FieldByName ('Cedula').AsString;
    Libro.Cells [i,4] := Query1.FieldByName ('CodEmpleado').AsString;

    Query1.Next;
    end;

    Query1.Close;
  end;
procedure TForm1.btn3Click(Sender: TObject);
var
  cuenta: Integer;
  begin
    cuenta:=22;
    Edit3.Text:= FloatToStr(cuenta);
    Query2.Close;
    Query2.SQL.Clear;
    cuenta:= Query2.SQL.Add ('SELECT COUNT(TIPO) FROM DEPARTAMENTO ');   //Query2.SQL.Add ('SELECT COUNT('+Edit2.Text+' ) FROM ' +Edit1.Text);
    Query2.RequestLive:= True;
    Edit3.Text:= FloatToStr(cuenta);
  end;

procedure TForm1.FormActivate(Sender: TObject);
var
  cuenta: Integer;
begin
  cuenta:= 33;
  Edit3.Text:= FloatToStr(cuenta);
end;

end.

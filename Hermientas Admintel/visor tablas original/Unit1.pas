unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  ZAbstractTable;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Query1: TQuery;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    tbl1: TTable;
    tbl2: TTable;
    bm1: TBatchMove;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    pnl1: TPanel;
    btn1: TButton;
    Edit1: TEdit;
    btn2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ZTable1: TZTable;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Unit2;

{$R *.dfm}

{procedure TForm1.btn2Click(Sender: TObject);
begin


  ZTable1.Open;
  ZTable1.Last;
 //
  ZTable1.Append;
  ZQuery1.SQL.Clear;
 // ZQuery1.SQL.Add ('INSERT INTO grado VALUES (77, JJ, JJ, 7, 777, 777, 77)');
  ZQuery1.SQL.Add ('INSERT INTO ' + Edit1.Text+ ' grado VALUES ("'+Edit2.Text+'", "'+Edit3.Text+'", "'+Edit4.Text+'" , "'+Edit5.Text+'" , "'+Edit6.Text+'" , "'+Edit7.Text+'" , "'+Edit8.Text+'")');
  Zquery1.ExecSQL;
  ZTable1.Refresh;
  //ZQuery1.Close;

 // INSERT INTO `grado` (`IDGRADO`, `DESCRIPCION`, `ABREVIATURA`, `TIEMPO_MINIMO`, `COD201`, `COD209`, `ORDEN`) VALUES ('44', 'RR', 'RR', '55', '555', '555', '55');
  //ZQuery1.Open; esta linea tira error de llamado a la query segun entiendo
  ShowMessage(ZQuery1.SQL.Text);
    ZTable1.Edit;
  ZTable1.Post
end;     }

procedure TForm1.btn2Click(Sender: TObject);
begin
  //bm1.Execute;

  ZTable1.Open;
  ZTable1.Last;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('INSERT INTO grado VALUES (null , "'+Edit2.Text+'" , "'+Edit3.Text+'" , "'+Edit4.Text+'" , "'+Edit5.Text+'" , "'+Edit6.Text+'" , "'+Edit7.Text+'")');
  ShowMessage(ZQuery1.SQL.Text);
  Zquery1.ExecSQL;
end;


procedure TForm1.btn1Click(Sender: TObject);
begin

Query1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add ('SELECT * FROM ' + Edit1.Text + ' ORDER BY idgrado' );
ZQuery1.RequestLive:= True;
ZQuery1.Open;

end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  //with TForm2.Create(nil) do
  Form2.Show;
end;

end.



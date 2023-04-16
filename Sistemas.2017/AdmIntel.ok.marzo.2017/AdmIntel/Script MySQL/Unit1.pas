unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  StdCtrls, DB, DBTables, Grids, DBGrids;

type
  TForm1 = class(TForm)
    tbl1: TTable;
    Button1: TButton;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    tbl1IDCOSTO_DEPTO_VACIO: TIntegerField;
    tbl1IDLOCACION: TIntegerField;
    tbl1MES: TStringField;
    tbl1ANIO: TIntegerField;
    tbl1MONTO_ADMIN: TFloatField;
    tbl1MONTO_EXP: TFloatField;
    tbl1IDTIPO_LOCACION: TIntegerField;
    tbl1MONTO_EXP_EDIF: TFloatField;
    procedure Button1Click(Sender: TObject);
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
   tbl1.First;
   while not tbl1.Eof do
     begin
       ZQuery1.SQL.Clear;
       ZQuery1.SQL.Text:='INSERT INTO coeficiente_alquiler values (null,"'+tbl1IDLOCACION.AsString+
       ',"'+tbl1MES.AsString+'",'+tbl1ANIO.AsString+','+tbl1MONTO_ADMIN.AsString+
       ','+tbl1MONTO_EXP.AsString+','+tbl1IDTIPO_LOCACION.AsString+','+tbl1MONTO_EXP_EDIF.AsString+
       ')';
     ZQuery1.ExecSQL;
     //ShowMessage(ZQuery1.SQL.Text);
     tbl1.Next;
     end;
     //ShowMessage(tbl1DESCRIP.AsString);
     
     end;

end.

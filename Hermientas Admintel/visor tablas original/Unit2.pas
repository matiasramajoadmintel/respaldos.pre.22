unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZDataset, DB, ZAbstractRODataset, ZAbstractDataset, Unit1,
  ZAbstractTable;

type
  TForm2 = class(TForm)
    btn1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ZTable1: TZTable;
    ZQuery1: TZQuery;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
  ZTable1.Open;
  ZTable1.Last;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('INSERT INTO grado VALUES (null , "'+Edit2.Text+'" , "'+Edit3.Text+'" , "'+Edit4.Text+'" , "'+Edit5.Text+'" , "'+Edit6.Text+'" , "'+Edit7.Text+'")');
  ShowMessage(ZQuery1.SQL.Text);
  Zquery1.ExecSQL;
end;

end.

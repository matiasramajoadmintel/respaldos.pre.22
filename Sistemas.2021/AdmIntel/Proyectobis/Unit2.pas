unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Table1: TTable;
    Table1NRO_FACTURA: TStringField;
    Table1NRO_FACT: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  with Table1 do
  begin
    Open;
    First;
    while not eof do
    begin
      Edit;
      if not Table1NRO_FACTURA.IsNull then Table1NRO_FACT.Value := StrToInt(Table1NRO_FACTURA.Text);
      Next;
    end;
  end;
end;

end.

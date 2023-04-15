unit PoolQuerys;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmQuerys = class(TDataModule)
    Q: TQuery;

  private
    { Private declarations }

  public
    function GetMaxIntValue(TableName, FieldName: String): Longint;

  end;

var
  dmQuerys: TdmQuerys;

implementation

{$R *.dfm}

function TdmQuerys.GetMaxIntValue(TableName, FieldName: String): Longint;
begin
  Q.SQL.Clear;
  Q.SQL.Add('SELECT MAX(' + FieldName + ') FROM ' + TableName);
  Q.Open;
  Result := Q.Fields[0].Value;
  Q.Close;
end;

end.

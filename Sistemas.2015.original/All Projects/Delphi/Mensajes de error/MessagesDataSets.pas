unit MessagesDataSets;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmMessages = class(TDataModule)
    spGetMessage: TStoredProc;

  private
    { Private declarations }

  public
    function ShowMessage(Error: Integer): Boolean;

  end;

var
  dmMessages: TdmMessages;

implementation

uses Util;

{$R *.dfm}

function TdmMessages.ShowMessage(Error: Integer): Boolean;
var
  Mensaje: String;
begin
  Result := False;
  if Error >= 50000 then //Mensajes definidos por el usuario
  begin
    spGetMessage.ParamByName('@Error').AsInteger := Error;
    spGetMessage.Prepare;
    spGetMessage.ExecProc;
    MsjError(spGetMessage.ParamByName('@Description').AsString);
    Result := True;
  end;
  spGetMessage.Close;
end;

end.

unit StoreProcs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmStoreProc = class(TDataModule)
    spGetGenId: TStoredProc;
    spGetId: TStoredProc;

  private
    { Private declarations }

  public
    function getId(NombreGen: String): Integer;

  end;

var
  dmStoreProc: TdmStoreProc;

implementation

{$R *.DFM}

{***************************  PUBLICOS  ***************************************}

function TdmStoreProc.getId(NombreGen: String): Integer;
begin
  with spGetGenId do
  begin
    Close;
    ParamByName('NOMBRE_GEN').AsString := NombreGen;
    Prepare;
    ExecProc;
    Result := ParamByName('GENID').AsInteger;
  end;
end;

end.

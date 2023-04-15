unit StoredProcs;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmStoredProcs = class(TDataModule)
    spGetId: TStoredProc;

  private
    { Private declarations }

  public
    {}

  end;

var
  dmStoredProcs: TdmStoredProcs;

implementation

{$R *.dfm}

end.

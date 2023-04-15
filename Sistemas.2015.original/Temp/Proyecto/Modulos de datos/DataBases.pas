unit DataBases;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmDataBases = class(TDataModule)
    RavierDB: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDataBases: TdmDataBases;

implementation

{$R *.dfm}

end.

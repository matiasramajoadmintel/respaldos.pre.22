unit PoolAux;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmAux = class(TDataModule)
    TRAB: TTable;
    TRABIDPROVEEDOR: TIntegerField;
    TRABIDTRABAJO: TIntegerField;
    TRABNRO_FACT: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAux: TdmAux;

implementation

{$R *.dfm}

end.

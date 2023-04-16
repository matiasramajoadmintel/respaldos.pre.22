unit PoolAlcaldia;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmAlcaldia = class(TDataModule)
    ALCDB: TDatabase;
    qryDeptos: TQuery;
    qryDeptosDescrip: TStringField;
    qryDeptosIdDepartamento: TIntegerField;
    qryEdificios: TQuery;
    qryDeptosIdEdificio: TIntegerField;
    qryDeptosDescDepto: TStringField;
    qryEdificiosIdEdificio: TIntegerField;
    qryEdificiosDescrip: TStringField;

  private
    { Private declarations }

  public


  end;

var
  dmAlcaldia: TdmAlcaldia;

implementation

{$R *.dfm}

end.

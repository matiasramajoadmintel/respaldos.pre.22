unit ChequeDataSets;

interface

uses
  SysUtils, Classes, DB, DBTables, Comunes;

type
  TdmCheques = class(TDataModule)
    CHEQUE: TTable;
    CHEQUEIdCheque: TSmallintField;
    CHEQUENumeroCheque: TStringField;
    CHEQUEIdBanco: TSmallintField;
    CHEQUEMonto: TFloatField;

  private
    { Private declarations }

  public
    function Add(Numero: String; Monto: Currency): Smallint;
    function GetFields(IdCheque: Smallint): TFields;

  end;

var
  dmCheques: TdmCheques;

implementation

uses PoolQuerys;

{$R *.dfm}

function TdmCheques.Add(Numero: String; Monto: Currency): Smallint;
begin
  CHEQUE.Open;
  CHEQUE.Append;
  CHEQUENumeroCheque.Text := Numero;
  CHEQUEMonto.Value := Monto;
  CHEQUE.Post;
  CHEQUE.Close;

  Result := dmQuerys.GetMaxIntValue('Cheque', 'IdCheque');
end;

function TdmCheques.GetFields(IdCheque: Smallint): TFields;
begin
  Existe(CHEQUE, 'IdCheque', IdCheque);
  Result := CHEQUE.Fields;
end;

end.

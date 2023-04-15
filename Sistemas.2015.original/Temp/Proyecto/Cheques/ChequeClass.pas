unit ChequeClass;

interface

uses ChequeDataSets, DB;

Type
  TCheque = Class

  public
    IdCheque: Smallint;
    Numero: String;
//    Banco: TBanco;
    Monto: Currency;
    constructor Create(Id: Smallint);

  private
  {}

end;

implementation

constructor TCheque.Create(Id: Smallint);
var
  Fields: TFields;
begin
  Fields := dmCheques.GetFields(Id);
  IdCheque := Fields.FieldByName('IdCheque').AsInteger;
  Numero := Fields.FieldByName('NumeroCheque').AsString;
  Monto := Fields.FieldByName('Monto').AsCurrency;
end;

end.

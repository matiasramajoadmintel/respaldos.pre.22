unit ObraClass;

interface

uses PropietarioClass, DB, ObraDataSets;

Type
  TObra = Class

  public
    IdObra: Smallint;
    Nombre: String;
    Propietario: TPropietario;
    Presupuesto: Currency;
    Honorarios: Currency;
    Moneda: String;
    constructor Create(Id: Smallint);
    function GetSaldoObra: Currency;
    function GetSaldoHonorarios: Currency;

  private
    {}

end;

implementation

constructor TObra.Create(Id: Smallint);
var
  Fields: TFields;
begin
  Fields := dmObras.GetFields(Id);
  IdObra := Fields.FieldByName('IdObra').AsInteger;
  Nombre := Fields.FieldByName('Nombre').AsString;
  Propietario := TPropietario.Create(Fields.FieldByName('IdCliente').AsInteger);
  Presupuesto := Fields.FieldByName('Presupuesto').AsCurrency;
  Honorarios := Fields.FieldByName('Honorarios').AsCurrency;
  Moneda := Fields.FieldByName('Moneda').AsString;
end;

function TObra.GetSaldoObra: Currency;
begin
  Result := Presupuesto - dmObras.GetMontoPagadoObra(IdObra);
end;

function TObra.GetSaldoHonorarios: Currency;
begin
  Result := Honorarios - dmObras.GetMontoPagadoHonorarios(IdObra);
end;

end.

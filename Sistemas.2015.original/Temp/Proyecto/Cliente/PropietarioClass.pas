unit PropietarioClass;

interface

uses PropietarioDataSets, DB;

Type
  TPropietario = Class

  public
    IdPropietario: Smallint;
    Nombre: String;
    constructor Create(Id: Smallint);

  private
   {}

end;

implementation

constructor TPropietario.Create(Id: Smallint);
var
  Fields: TFields;
begin
  Fields := dmPropietario.GetFields(Id);
  IdPropietario := Fields.FieldByName('IdCliente').AsInteger;
  Nombre := Fields.FieldByName('RazonSocial').AsString;
end;

end.

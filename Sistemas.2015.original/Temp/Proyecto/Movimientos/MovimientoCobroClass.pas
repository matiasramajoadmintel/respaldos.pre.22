unit MovimientoCobroClass;

interface

uses ObraClass;

Type
  TMovimientoCobro = Class

  public
    IdMovimiento: Smallint;
    Obra: TObra;
    Tipo: String;
    constructor Create(O: TObra; T: String);

  private
  {}

end;

implementation

constructor TMovimientoCobro.Create(O: TObra; T: String);
begin
  Obra := O;
  Tipo := T;
end;

end.

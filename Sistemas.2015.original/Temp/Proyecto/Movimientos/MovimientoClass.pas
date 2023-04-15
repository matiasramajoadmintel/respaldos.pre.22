unit MovimientoClass;

interface

Type
  TMovimiento = Class

    public
      IdMovimiento: Smallint;
      FechaEfectuada: TDateTime;
      Monto: Currency;
      Moneda: String;
      FormaPago: String;
      Tipo: String;
      constructor Create;

    protected
      {}

    private
      {}

end;

implementation

constructor TMovimiento.Create;
begin
end;

end.

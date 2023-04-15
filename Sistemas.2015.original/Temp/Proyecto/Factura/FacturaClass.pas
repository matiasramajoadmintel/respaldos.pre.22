unit FacturaClass;

interface

uses FacturaDataSets, DB;

Type
  TFactura = Class

    public
      IdFactura: Smallint;
      Numero: String;
      Fecha: TDateTime;
      Proveedor: String;
      Obra: String;
      Monto: Currency;
      Tipo: String;
      Pagado: Boolean;
      constructor Create; overload;
      constructor Create(Id: Smallint); overload;
      function GetSaldo: Currency;
      procedure SetPagado(Value: Boolean);

    protected
      {}

    private
      {}

end;

implementation

constructor TFactura.Create;
begin
{}
end;

constructor TFactura.Create(Id: Smallint);
var
  Fields: TFields;
begin
  Fields := dmFactura.GetFields(Id);
  IdFactura := Fields.FieldByName('IdFactura').AsInteger;
  Numero := Fields.FieldByName('Numero').AsString;
  Fecha := Fields.FieldByName('Fecha').AsDateTime;
  Proveedor := Fields.FieldByName('Proveedor').AsString;
  Obra := Fields.FieldByName('Obra').AsString;
  Monto := Fields.FieldByName('Monto').AsCurrency;
  Tipo := Fields.FieldByName('Tipo').AsString;
  Pagado := Fields.FieldByName('Pagado').AsBoolean;
end;

function TFactura.GetSaldo: Currency;
begin
  Result := Monto - dmFactura.GetMontoPagado(IdFactura);
end;

procedure TFactura.SetPagado(Value: Boolean);
begin
  dmFactura.SetPagado(IdFactura, Value);
  Pagado := Value;
end;

end.

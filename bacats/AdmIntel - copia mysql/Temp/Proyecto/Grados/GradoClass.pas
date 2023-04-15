unit GradoClass;

interface

uses Comunes, PoolDatos;

Type
  TGrado = Class

  public
    IdGrado: Integer;
    Descripcion: String;
    Abreviatura: String;
    TiempoMinimo: Byte;
    Cod201: Currency;
    Cod209: Currency;
    Orden: Integer;

    constructor Create(Id: Integer);

  private
    {}

end;

implementation

constructor TGrado.Create(Id: Integer);
begin
  if Existe(dmDatos.tblGrado_, 'IDGRADO', Id) then
  begin
    IdGrado := dmDatos.tblGrado_IDGRADO.Value;
    Descripcion := dmDatos.tblGrado_DESCRIPCION.Value;
    Abreviatura := dmDatos.tblGrado_ABREVIATURA.Value;
    TiempoMinimo := dmDatos.tblGrado_TIEMPO_MINIMO.Value;
    Cod201 := dmDatos.tblGrado_COD201.Value;
    Cod209 := dmDatos.tblGrado_COD209.Value;
    Orden := dmDatos.tblGrado_ORDEN.Value;
  end;
end;

end.

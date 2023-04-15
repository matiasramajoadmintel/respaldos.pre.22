unit EspecialidadClass;

interface

uses Comunes, PoolDatos;

type
  TEspecialidad = Class

  public
    IdEspecialidad: Integer;
    Descripcion: String;
    Abreviatura: String;

    constructor Create(Id: Integer);

  private
    {}

end;

implementation

constructor TEspecialidad.Create(Id: Integer);
begin
  if Existe(dmDatos.tblEspecialidad_, 'IDESPECIALIDAD', Id) then
  begin
    IdEspecialidad := dmDatos.tblEspecialidad_IDESPECIALIDAD.Value;
    Descripcion := dmDatos.tblEspecialidad_DESCRIPCION.Value;
    Abreviatura := dmDatos.tblEspecialidad_ABREV.Value;
  end;
end;

end.

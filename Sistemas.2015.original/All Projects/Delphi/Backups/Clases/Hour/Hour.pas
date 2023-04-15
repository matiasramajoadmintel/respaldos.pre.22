unit Hour;

interface

Type
  THour = Class

    public
      //Estas propiedades son reales por conveniencia debido a que al intentar
      //obtener la hora y minutos de un turno desde la grilla de asignación, los
      //valores obtenidos son reales inexorablemente...(una cagada)
      Hours, Minutes: Real;
      constructor Create(H, M: Real);
      function ToReal: Real;

    protected
      {}

    private
      {}

end;

implementation

uses Util;

constructor THour.Create(H, M: Real);
begin
  if (Frac(H) <> 0) or (Frac(M) <> 0) then
  begin
    MsjError('Parte fraccionaria inválida.');
    Exit;
  end;

  if (H < 0) or (H > 23) then
  begin
    MsjError('El valor de la hora está fuera de rango.');
    Exit;
  end;

  if (M < 0) or (M > 59) then
  begin
    MsjError('El valor de los minutos está fuera de rango.');
    Exit;
  end;

  Hours := H;
  Minutes := M;
end;

function THour.ToReal: Real;
begin
  Result := Hours + Minutes / 60;
end;

end.

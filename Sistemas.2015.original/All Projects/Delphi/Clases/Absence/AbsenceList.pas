unit AbsenceList;

interface

uses Classes, Absence, Controls, Hour;

Type
  TAbsenceList = class(TList)

    public
      function IsIncluded(IdProf: Word; Fecha: TDate; Hora: THour): Boolean;

    protected
      {}

    private
      {}

end;

implementation

//Indica si una fecha y horario estan incluidos dentro de la lista de ausencias
//para un profesional dado.
function TAbsenceList.IsIncluded(IdProf: Word; Fecha: TDate; Hora: THour): Boolean;
var
  Lista: TAbsenceList;
  Ausencia: TAbsence;
  i: Byte;
begin
  Result := False;
  Lista := TAbsenceList(self);
  i := 0;
  while (i < Lista.Count) and not Result do
  begin
    Ausencia := Lista[i];
    Result := (IdProf = Ausencia.IdProfesional) and
              (Fecha >= Ausencia.FechaInicio) and
              (Fecha <= Ausencia.FechaFin) and
              (Hora.ToReal >= Ausencia.HoraInicio.ToReal) and
              (Hora.ToReal <= Ausencia.HoraFin.ToReal);
    i := i + 1;
  end;
end;

end.

unit Absence;

interface

uses Controls, Hour, Util;

Type
  TAbsence = Class

    public
      IdProfesional: Word;
      FechaInicio, FechaFin: TDate;
      HoraInicio, HoraFin: THour;
      constructor Create(IdProf: Word; FI, FF: TDate; HI, HF: THour);

    protected
      {}

    private
      {}

end;

implementation

constructor TAbsence.Create(IdProf: Word; FI, FF: TDate; HI, HF: THour);
begin
  if (HI.ToReal >= HF.ToReal) then
  begin
    MsjError('La hora de finalización no es mayor o igual a la hora de inicio.');
    Exit;
  end;

  if (FI > FF) then
  begin
    MsjError('La fecha de finalización no es mayor a la fecha de inicio.');
    Exit;
  end;

  IdProfesional := IdProf;
  FechaInicio := FI;
  FechaFin := FF;
  HoraInicio := HI;
  HoraFin := HF;
end;

end.

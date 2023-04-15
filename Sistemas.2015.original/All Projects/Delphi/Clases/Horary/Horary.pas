unit Horary;

interface

uses Controls, Hour, Util;

Type
  THorary = Class

    public
      IdProfesional: Word;
      Dia: Byte; //Válido entre 1 y 7 donde el 1 corresponde al Lunes.
      HoraInicio, HoraFin: THour;
      constructor Create(IdProf: Word; D: Byte; HI, HF: THour);

    protected
      {}

    private
      {}

end;

implementation

constructor THorary.Create(IdProf: Word; D: Byte; HI, HF: THour);
begin
  if (D < 0) or (D > 7) then
  begin
    MsjError('Día de la semana incorrecto.');
    Exit;
  end;

  IdProfesional := IdProf;
  Dia := D;
  HoraInicio := HI;
  HoraFin := HF;
end;

end.

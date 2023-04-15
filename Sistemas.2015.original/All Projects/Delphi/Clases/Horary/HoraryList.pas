unit HoraryList;

interface

uses Classes, Horary, Controls, Hour;

Type
  THoraryList = class(TList)

    public
      function IsIncluded(IdProf: Word; Dia: Byte; Hora: THour): Boolean;
      function IsSuperposed(Horario: THorary): Boolean;

    protected
      {}

    private
      {}

end;

implementation

//Indica si el horario formado por la hora "Hora", el día de la semana "Dia" y
//el profesional "IdProf" está iuncluido en la lista de horarios.
function THoraryList.IsIncluded(IdProf: Word; Dia: Byte; Hora: THour): Boolean;
var
  Lista: THoraryList;
  Horario: THorary;
  i: Byte;
begin
  Result := False;
  Lista := THoraryList(self);
  i := 0;
  while (i < Lista.Count) and not Result do
  begin
    Horario := Lista[i];
    Result := (IdProf = Horario.IdProfesional) and (Dia = Horario.Dia) and
              (Hora.ToReal >= Horario.HoraInicio.ToReal) and
              (Hora.ToReal <= Horario.HoraFin.ToReal);
    i := i + 1;
  end;
end;

//Indica si un horario se superpone con algún otro de le lista.
function THoraryList.IsSuperposed(Horario: THorary): Boolean;
var
  Lista: THoraryList;
  HoraAux: THorary;
  i: Byte;
begin
  Result := False;
  Lista := THoraryList(self);
  i := 0;
  while (i < Lista.Count) and not Result do
  begin
    HoraAux := Lista[i];
    Result := (Horario.IdProfesional = HoraAux.IdProfesional) and
              (Horario.Dia = HoraAux.Dia) and
              (((Horario.HoraInicio.ToReal >= HoraAux.HoraInicio.ToReal) and
              (Horario.HoraInicio.ToReal <= HoraAux.HoraFin.ToReal)) or
              ((Horario.HoraFin.ToReal >= HoraAux.HoraInicio.ToReal) and
              (Horario.HoraFin.ToReal <= HoraAux.HoraFin.ToReal)));
    i := i + 1;
  end;
end;


end.

unit ReportManager;

interface

uses DB, QROcupActuales, Forms, QROcupHistoricos, QRIngresos, QRCobrosPart,
     Input, SysUtils, Util;

procedure Execute(Consulta: Integer);

const
  INGRESOS = 1;
  COBROS_PART = 2;
  RESUMEN_COBROS = 3;
  DESCUENTOS = 4;
  OCUPANTES_ACTUALES = 5;
  OCUPANTES_HISTORICOS = 6;
  PAGOS_EFECTUADOS = 7;
  GASTOS_ADMIN = 8;
  GASTOS_FINAN = 9;
  TRAB_DEPTO = 10;
  TRAB_EDIF = 11;
  GASTOS_SERV = 12;
  RECIBOS_EMITIDOS = 13;
  DET_TAREAS = 14;
  RES_TAREAS_DEPTO = 15;
  RES_TAREAS_GRAL = 16;
  MAT_USADOS = 17;

implementation

uses QRResumenCobros;

procedure Execute(Consulta: Integer);
var
  form: TForm;
  M, A: Word;
begin
  case Consulta of

    INGRESOS: begin
                form := TfrmQRIngresos.Create(nil);
                TfrmQRIngresos(form).Execute;
              end;

    COBROS_PART: begin
                   if IngresarMes(M, A) then
                   begin
                     form := TfrmQRCobrosPart.Create(nil);
                     TfrmQRCobrosPart(form).Execute(UpperCase(MesComoStr(M)), A);
                   end;
                 end;

    RESUMEN_COBROS: begin
                    if IngresarMes(M, A) then
                    begin
                      form := TfrmQRResumenCobros.Create(nil);
                      TfrmQRResumenCobros(form).Execute(UpperCase(MesComoStr(M)), A);
                    end;
                  end;

    OCUPANTES_ACTUALES: begin
                          form := TfrmQROcupActuales.Create(nil);
                          TfrmQROcupActuales(form).Execute;
                        end;

    OCUPANTES_HISTORICOS: begin
                            form := TfrmQROcupHistoricos.Create(nil);
                            TfrmQROcupHistoricos(form).Execute;
                          end;
  end;

  form.Release;
end;

end.

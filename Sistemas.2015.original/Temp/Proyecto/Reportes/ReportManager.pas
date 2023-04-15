unit ReportManager;

interface

uses DB, QROcupActuales, Forms, QROcupHistoricos, QRIngresos, QRCobrosPart,
     Input, SysUtils, Util;

procedure Execute(Consulta: Integer);

const
  INGRESOS = 1;
  COBROS_PART = 2;
  RESUMEN_COBROS = 3;
  FORMULARIO_PAGOS = 4;
  OCUPANTES_ACTUALES = 500;
  OCUPANTES_HISTORICOS = 501;

implementation

uses QRResumenCobros, QRFormularioPagos;

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

    FORMULARIO_PAGOS: begin
                   if IngresarMes(M, A) then
                   begin
                     form := TfrmQRFormularioPago.Create(nil);
                     TfrmQRFormularioPago(form).Execute(UpperCase(MesComoStr(M)), A);
                   end;
                 end;
  end;

  form.Release;
end;

end.

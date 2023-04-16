drop VIEW VW_COBROS_PART;

CREATE VIEW VW_COBROS_PART (
  IDPERSONA,
  OCUPANTE,
  DOCUMENTO,
  MES,
  ANIO,
  EXPENSAS,
  RAE,
  ALQUILER,
  EDIFICIO,
  DEPTO,
  LOCACION
) AS

SELECT Persona.IDPERSONA, Persona.APELLIDO || ' ' || Persona.NOMBRE AS OCUPANTE,
Persona.TIPODOCUMENTO || ' ' || Persona.NRODOCUMENTO AS DOCUMENTO, Descuento.MES, Descuento.ANIO,
Descuento.MONTO,  Ocupante_particular.COSTOALQUILER * 0.1 ,  Ocupante_particular.COSTOALQUILER * 0.9,
EDIFICIO.DESCRIPCION, DEPARTAMENTO.DESCRIPCION, EDIFICIO.DESCRIPCION || ' ' || DEPARTAMENTO.DESCRIPCION
FROM PERSONA Persona
   LEFT OUTER JOIN DESCUENTO Descuento
   ON  (Persona.IDPERSONA = Descuento.IDOCUPANTE)
   INNER JOIN OCUPANTE_PARTICULAR Ocupante_particular
   ON  (Persona.IDPERSONA = Ocupante_particular.IDPERSONA)
   INNER JOIN OCUPACION Ocupacion
   ON  (Persona.IDPERSONA = Ocupacion.IDOCUPANTE)
   INNER JOIN EDIFICIO Edificio
   ON  (Ocupacion.IDEDIFICIO = Edificio.IDEDIFICIO)
   INNER JOIN DEPARTAMENTO Departamento
   ON  (Ocupacion.IDDEPARTAMENTO = Departamento.IDDEPARTAMENTO)
WHERE  Persona.TIPO = 'OCUP_PART' AND OCUPACION.FECHARETIRO IS NULL
;

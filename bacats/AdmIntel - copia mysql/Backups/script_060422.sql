DROP VIEW VW_OCUPANTES_ACTUALES;

CREATE VIEW VW_OCUPANTES_ACTUALES (
  IDOCUPANTE,
  OCUPANTE,
  TIPO,
  LOCACION,
  FECHAINI,
  FECHAFIN,
  IDEDIFICIO,
  IDDEPARTAMENTO,
  MATRICULA,
  UNIDAD,
  TEL_UNIDAD,
  GRADO,
  DESTINO,
  TEL_DESTINO,
  IDGARANTE,
  PARENTEZCO,
  GARANTE,
  DNI
) AS
SELECT Ocupacion.IDOCUPANTE, Persona.APELLIDO || ' ' || Persona.NOMBRE as OCUPANTE,
cast('Personal militar' as varchar(20)) as TIPO, Edificio.DESCRIPCION || ' ' || Departamento.DESCRIPCION AS LOCACION,
Ocupacion.FECHAINI, Ocupacion.FECHAFIN, Ocupacion.IDEDIFICIO,
Ocupacion.IDDEPARTAMENTO, cast(Ocupante_militar.MATRICULA as varchar(10)) as matricula, Departamento.DESCRIPCION, Departamento.TELEFONO,
CAST(Grado.ABREVIATURA AS VARCHAR(10)), Ocupante_militar.DESTINO, Ocupante_militar.TELEFONO_DESTINO, 0 AS IDGARANTE, cast('' as varchar(15)) as parentezco,
cast('' as varchar(15)) || ' ' || cast('' as varchar(25)) as nombre, PERSONA.NRODOCUMENTO
FROM OCUPACION Ocupacion
   INNER JOIN PERSONA Persona
   ON  (Ocupacion.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN EDIFICIO Edificio
   ON  (Ocupacion.IDEDIFICIO = Edificio.IDEDIFICIO)
   INNER JOIN DEPARTAMENTO Departamento
   ON  (Ocupacion.IDDEPARTAMENTO = Departamento.IDDEPARTAMENTO)
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
   INNER JOIN GRADO Grado
   ON  (Ocupante_militar.IDGRADO = Grado.IDGRADO)
WHERE FECHARETIRO IS NULL AND PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Ocupacion.IDOCUPANTE, Persona.APELLIDO || ' ' || Persona.NOMBRE as OCUPANTE,
cast('Personal civil' as varchar(20)), Edificio.DESCRIPCION || ' ' || Departamento.DESCRIPCION AS LOCACION,
Ocupacion.FECHAINI, Ocupacion.FECHAFIN, Ocupacion.IDEDIFICIO,
Ocupacion.IDDEPARTAMENTO, Ocupante_civil.legajo, Departamento.DESCRIPCION, Departamento.TELEFONO,
OCUPANTE_CIVIL.CATEGORIA, OCUPANTE_CIVIL.DESTINO, OCUPANTE_CIVIL.TELEFONO_DESTINO, 0 AS IDGARANTE, cast('' as varchar(15)) as parentezco,
cast('' as varchar(15)) || ' ' || cast('' as varchar(25)) as nombre, PERSONA.NRODOCUMENTO
FROM OCUPACION Ocupacion
   INNER JOIN PERSONA Persona
   ON  (Ocupacion.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN EDIFICIO Edificio
   ON  (Ocupacion.IDEDIFICIO = Edificio.IDEDIFICIO)
   INNER JOIN DEPARTAMENTO Departamento
   ON  (Ocupacion.IDDEPARTAMENTO = Departamento.IDDEPARTAMENTO)
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE FECHARETIRO IS NULL AND PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Ocupacion.IDOCUPANTE, Persona1.APELLIDO || ' ' || Persona1.NOMBRE as OCUPANTE,
cast('Particular' as varchar(20)), Edificio.DESCRIPCION || ' ' || Departamento.DESCRIPCION AS LOCACION,
Ocupacion.FECHAINI, Ocupacion.FECHAFIN, Ocupacion.IDEDIFICIO,
Ocupacion.IDDEPARTAMENTO, CAST('' AS VARCHAR(10)) AS MATRICULA, Departamento.DESCRIPCION, Departamento.TELEFONO,
CAST('' AS VARCHAR(10)) AS GRADO, CAST('' AS VARCHAR(30)) AS DESTINO, CAST('' AS VARCHAR(6)) AS TEL_DESTINO,
ocupante_particular.idgarante, ocupante_particular.parentezco, persona2.apellido || ' ' || persona2.nombre as garante, PERSONA1.NRODOCUMENTO
FROM OCUPACION Ocupacion
   INNER JOIN PERSONA Persona1
   ON  (Ocupacion.IDOCUPANTE = Persona1.IDPERSONA)
   INNER JOIN EDIFICIO Edificio
   ON  (Ocupacion.IDEDIFICIO = Edificio.IDEDIFICIO)
   INNER JOIN DEPARTAMENTO Departamento
   ON  (Ocupacion.IDDEPARTAMENTO = Departamento.IDDEPARTAMENTO)
   INNER JOIN OCUPANTE_particular Ocupante_particular
   ON  (Persona1.IDPERSONA = Ocupante_particular.IDPERSONA)
   left OUTER JOIN PERSONA Persona2
   ON  (Ocupante_particular.IDGARANTE = Persona2.IDPERSONA)
WHERE FECHARETIRO IS NULL AND PERSONA1.TIPO = 'OCUP_PART'
;
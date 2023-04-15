CREATE VIEW VW_DESCUENTOS_MILITARES (
  OCUPANTE,
  MR,
  GRADO,
  IDTIPODESCUENTO,
  MES,
  ANIO,
  ALQUILER,
  RAE,
  EXPENSAS
) AS

SELECT Persona.APELLIDO || ' ' || Persona.NOMBRE AS NOMBRE, Ocupante_militar.MATRICULA, Grado.ABREVIATURA,
Descuento.IDTIPODESCUENTO, Descuento.MES, Descuento.ANIO, Descuento.MONTO AS ALQUILER, CAST(0 AS FLOAT) AS RAE, CAST(0 AS FLOAT) AS EXPENSAS
FROM DESCUENTO Descuento
   INNER JOIN PERSONA Persona
   ON  (Descuento.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
   INNER JOIN GRADO Grado
   ON  (Ocupante_militar.IDGRADO = Grado.IDGRADO)
WHERE IDTIPODESCUENTO = 1 AND PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Persona.APELLIDO || ' ' || Persona.NOMBRE AS NOMBRE, Ocupante_militar.MATRICULA, Grado.ABREVIATURA,
Descuento.IDTIPODESCUENTO, Descuento.MES, Descuento.ANIO, CAST(0 AS FLOAT) AS ALQUILER, Descuento.MONTO AS RAE, CAST(0 AS FLOAT) AS EXPENSAS
FROM DESCUENTO Descuento
   INNER JOIN PERSONA Persona
   ON  (Descuento.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
   INNER JOIN GRADO Grado
   ON  (Ocupante_militar.IDGRADO = Grado.IDGRADO)
WHERE IDTIPODESCUENTO = 2 AND PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Persona.APELLIDO || ' ' || Persona.NOMBRE AS NOMBRE, Ocupante_militar.MATRICULA, Grado.ABREVIATURA,
Descuento.IDTIPODESCUENTO, Descuento.MES, Descuento.ANIO, CAST(0 AS FLOAT) AS ALQUILER, CAST(0 AS FLOAT) AS RAE, Descuento.MONTO AS EXPENSAS
FROM DESCUENTO Descuento
   INNER JOIN PERSONA Persona
   ON  (Descuento.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
   INNER JOIN GRADO Grado
   ON  (Ocupante_militar.IDGRADO = Grado.IDGRADO)
WHERE IDTIPODESCUENTO = 3 AND PERSONA.TIPO = 'OCUP_MIL'
;
CREATE VIEW VW_RESUMEN_DESC_MIL (
OCUPANTE,
MR,
GRADO,
MES,
ANIO,
ALQUILER,
RAE,
EXPENSAS) AS
SELECT OCUPANTE, MR, GRADO, MES, ANIO, SUM(ALQUILER), SUM(RAE), SUM(EXPENSAS)
FROM VW_DESCUENTOS_MILITARES
GROUP BY OCUPANTE, MR,GRADO, MES, ANIO
;

CREATE VIEW VW_DESCUENTOS_CIVILES
(OCUPANTE,
IDTIPODESCUENTO,
MES,
ANIO,
ALQUILER,
RAE,
EXPENSAS,
MR,
GRADO) AS
SELECT Persona.APELLIDO || ' ' || Persona.NOMBRE, Descuento.IDTIPODESCUENTO, Descuento.MES, Descuento.ANIO,
Descuento.MONTO, CAST(0 AS FLOAT), CAST(0 AS FLOAT), Ocupante_civil.LEGAJO, Ocupante_civil.CATEGORIA
FROM DESCUENTO Descuento
   INNER JOIN PERSONA Persona
   ON  (Descuento.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE IDTIPODESCUENTO = 1 AND PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Persona.APELLIDO || ' ' || Persona.NOMBRE, Descuento.IDTIPODESCUENTO, Descuento.MES, Descuento.ANIO,
CAST(0 AS FLOAT), Descuento.MONTO, CAST(0 AS FLOAT), Ocupante_civil.LEGAJO, Ocupante_civil.CATEGORIA
FROM DESCUENTO Descuento
   INNER JOIN PERSONA Persona
   ON  (Descuento.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE IDTIPODESCUENTO = 2 AND PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Persona.APELLIDO || ' ' || Persona.NOMBRE, Descuento.IDTIPODESCUENTO, Descuento.MES, Descuento.ANIO,
CAST(0 AS FLOAT), CAST(0 AS FLOAT), Descuento.MONTO, Ocupante_civil.LEGAJO, Ocupante_civil.CATEGORIA
FROM DESCUENTO Descuento
   INNER JOIN PERSONA Persona
   ON  (Descuento.IDOCUPANTE = Persona.IDPERSONA)
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE IDTIPODESCUENTO = 3 AND PERSONA.TIPO = 'OCUP_CIV'
;

CREATE VIEW VW_RESUMEN_DESC_CIV (
OCUPANTE,
MR,
GRADO,
MES,
ANIO,
ALQUILER,
RAE,
EXPENSAS) AS
SELECT OCUPANTE, MR, GRADO, MES, ANIO, SUM(ALQUILER), SUM(RAE), SUM(EXPENSAS)
FROM VW_DESCUENTOS_CIVILES
GROUP BY OCUPANTE, MR, GRADO, MES, ANIO
;
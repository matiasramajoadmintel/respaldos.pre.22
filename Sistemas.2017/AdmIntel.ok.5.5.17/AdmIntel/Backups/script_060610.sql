DROP VIEW VW_DESCUENTO;

CREATE VIEW VW_DESCUENTO (
  APELLIDO,
  NOMBRE,
  DESCRIPCION,
  MES,
  ANIO,
  MONTO,
  IDOCUPANTE,
  IDTIPODESCUENTO,
  IDDESCUENTO,
  MR,
  CODDESC,
  IDEDIFICIO,
  EDIFICIO,
  TIPOPAGO,
  GRADO,
  ESPECIALIDAD,
  APENOM,
  DEPTO,
  TIPOPERS
) AS

SELECT P.Apellido, P.Nombre, TD.Descripcion, D.Mes, D.Anio, D.Monto, D.IdOcupante,
D.IdTipoDescuento, D.IdDescuento, CAST(Ocupante_militar.MATRICULA AS VARCHAR(10)) AS MR, TD.CODDESC CodDesc,
Vw_ocup_mil_actuales.IDEDIFICIO, Vw_ocup_mil_actuales.EDIFICIO, TD.TIPOPAGO,
Grado.ABREVIATURA Grado, Especialidad.ABREV Especialidad, P.Apellido || ' ' || P.Nombre AS ApeNom, Vw_ocup_mil_actuales.DEPTO,
P.TIPO
FROM DESCUENTO D
   INNER JOIN PERSONA P
   ON  (D.IdOcupante = P.IdPersona)
   INNER JOIN TIPO_DESCUENTO TD
   ON  (D.IdTipoDescuento = TD.IdTipoDescuento)
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Ocupante_militar.IDPERSONA = P.IdPersona)
   INNER JOIN VW_OCUP_MIL_ACTUALES Vw_ocup_mil_actuales
   ON  (Vw_ocup_mil_actuales.IDPERSONA = P.IdPersona)
   INNER JOIN GRADO Grado
   ON  (Ocupante_militar.IDGRADO = Grado.IDGRADO)
   LEFT OUTER JOIN ESPECIALIDAD Especialidad
   ON  (Ocupante_militar.IDESPECIALIDAD = Especialidad.IDESPECIALIDAD)
WHERE (P.TIPO = 'OCUP_MIL')
UNION
SELECT Persona.APELLIDO, Persona.NOMBRE, Tipo_descuento.DESCRIPCION,
Descuento.MES, Descuento.ANIO, Descuento.MONTO, Descuento.IDOCUPANTE,
Descuento.IDTIPODESCUENTO, Descuento.IDDESCUENTO, Ocupante_civil.LEGAJO,
Tipo_descuento.CODDESC, Ocupacion.IDEDIFICIO, Edificio.DESCRIPCION, Tipo_descuento.TIPOPAGO,
CAST('PC' AS VARCHAR(2) ) Grado, CAST( '' AS VARCHAR(3) ) Especialidad,   (Persona.APELLIDO || ' ')  || Persona.NOMBRE  ApeNom, Departamento.DESCRIPCION DEPTO,
PERSONA.TIPO
FROM PERSONA Persona
   INNER JOIN DESCUENTO Descuento
   ON  (Persona.IDPERSONA = Descuento.IDOCUPANTE)
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
   INNER JOIN TIPO_DESCUENTO Tipo_descuento
   ON  (Descuento.IDTIPODESCUENTO = Tipo_descuento.IDTIPODESCUENTO)
   INNER JOIN OCUPACION Ocupacion
   ON  (Ocupante_civil.IDPERSONA = Ocupacion.IDOCUPANTE)
   INNER JOIN EDIFICIO Edificio
   ON  (Ocupacion.IDEDIFICIO = Edificio.IDEDIFICIO)
   INNER JOIN DEPARTAMENTO Departamento
   ON  (Ocupacion.IDDEPARTAMENTO = Departamento.IDDEPARTAMENTO)
WHERE   (Ocupacion.FECHARETIRO IS NULL)
   AND  (Persona.TIPO = 'OCUP_CIV')
;

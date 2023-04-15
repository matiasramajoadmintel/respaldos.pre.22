/*
Alias: ADB
LiveAnswer: FALSE

*/

SELECT COUNT(*) FROM persona



VW_CANT_ACTIVOS_X_EDIF
VW_CANT_OCUPADOS_X_EDIF
VW_EDIFICIOS



CREATE VIEW VW_PERSONAS_2 (
  IDOCUPANTE, 
  OCUPANTE, 
  TIPO, 
  MATRICULA
) AS

SELECT Persona.IdPersona, concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Personal militar' as TIPO,
Ocupante_militar.MATRICULA as matricula
FROM PERSONA Persona
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Persona.IdPersona, concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Personal civil',
Ocupante_civil.legajo
FROM PERSONA Persona
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Persona.IdPersona,concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Particular',
'' AS MATRICULA
FROM PERSONA Persona
WHERE PERSONA.TIPO = 'OCUP_PART'
UNION
SELECT Persona.IdPersona,concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Militar no ocupante' as TIPO,
Militar_No_Ocupante.MATRICULA as matricula
FROM PERSONA Persona
   INNER JOIN MILITAR_NO_OCUPANTE
   ON  (Persona.IDPERSONA = MILITAR_NO_OCUPANTE.IDPERSONA)
WHERE PERSONA.TIPO = 'MIL_NO_OCUP'


//con matricula varchar

CREATE VIEW VW_PERSONAS_2 (
  IDOCUPANTE, 
  OCUPANTE, 
  TIPO, 
  MATRICULA
) AS

SELECT Persona.IdPersona, concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Personal militar' as TIPO,
cast(Ocupante_militar.MATRICULA as char(20)) AS matricula
FROM PERSONA Persona
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Persona.IdPersona, concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Personal civil',
Ocupante_civil.legajo
FROM PERSONA Persona
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Persona.IdPersona,concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Particular',
'' AS MATRICULA
FROM PERSONA Persona
WHERE PERSONA.TIPO = 'OCUP_PART'
UNION
SELECT Persona.IdPersona,concat (Persona.APELLIDO,' ',Persona.NOMBRE) as OCUPANTE,
'Militar no ocupante' as TIPO,
cast(Militar_No_Ocupante.MATRICULA as char(20)) AS matricula
FROM PERSONA Persona
   INNER JOIN MILITAR_NO_OCUPANTE
   ON  (Persona.IDPERSONA = MILITAR_NO_OCUPANTE.IDPERSONA)
WHERE PERSONA.TIPO = 'MIL_NO_OCUP'


CREATE VIEW VW_PERSONAS_2 (
  IDOCUPANTE, 
  OCUPANTE, 
  TIPO, 
  MATRICULA
) AS

SELECT Persona.IdPersona, concat (Persona.APELLIDO, ' ', Persona.NOMBRE) as OCUPANTE,
cast('Personal militar' as char(20)) as TIPO,
cast(Ocupante_militar.MATRICULA as char(8)) as matricula
FROM PERSONA Persona
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Persona.IdPersona, concat (Persona.APELLIDO, ' ', Persona.NOMBRE) as OCUPANTE,
cast('Personal civil' as char(20)),
cast(Ocupante_civil.legajo as char(8)) as matricula
FROM PERSONA Persona
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Persona.IdPersona,  concat (Persona.APELLIDO, ' ', Persona.NOMBRE) as OCUPANTE,
cast('Particular' as char(20)),
CAST('Particular' as char (8)) AS MATRICULA
FROM PERSONA Persona
WHERE PERSONA.TIPO = 'OCUP_PART'
UNION
SELECT Persona.IdPersona, concat (Persona.APELLIDO, ' ', Persona.NOMBRE) as OCUPANTE,
cast('Militar no ocupante' as char(20)) as TIPO,
cast(Militar_No_Ocupante.MATRICULA as char(8)) as matricula
FROM PERSONA Persona
   INNER JOIN MILITAR_NO_OCUPANTE
   ON  (Persona.IDPERSONA = MILITAR_NO_OCUPANTE.IDPERSONA)
WHERE PERSONA.TIPO = 'MIL_NO_OCUP'
;


CREATE VIEW VW_OCUPACION (
  NOMBRE, 
  APELLIDO, 
  DESCRIPCIONED, 
  DESCRIPCIONDEPT, 
  FECHAINI, 
  FECHAFIN, 
  FECHARETIRO, 
  IDEDIFICIO, 
  IDDEPARTAMENTO, 
  IDOCUPANTE, 
  IDOCUPACION, 
  OCUPANTE, 
  LOCACION
) AS

SELECT P.Nombre, P.Apellido, cast(E.Descripcion as char), cast(D.Descripcion as char), Oc.FechaIni, Oc.FechaFin,
       Oc.FechaRetiro, Oc.IdEdificio, Oc.IdDepartamento, Oc.IdOcupante,
       Oc.IdOcupacion, CONCAT(P.APELLIDO,' ',P.NOMBRE), CONCAT (E.DESCRIPCION,'  ',D.DESCRIPCION) AS LOCACION


FROM OCUPACION Oc
 INNER JOIN DEPARTAMENTO D ON ((Oc.IdDepartamento=D.IdDepartamento) AND
                                    (Oc.IdEdificio=D.IdEdificio))
      INNER JOIN EDIFICIO E ON (D.IdEdificio=E.IdEdificio)
      INNER JOIN PERSONA P ON (Oc.IdOcupante=P.IdPersona)



CREATE VIEW VW_OCUPACION (
  NOMBRE, 
  APELLIDO, 
  DESCRIPCIONED, 
  DESCRIPCIONDEPT, 
  FECHAINI, 
  FECHAFIN, 
  FECHARETIRO, 
  IDEDIFICIO, 
  IDDEPARTAMENTO, 
  IDOCUPANTE, 
  IDOCUPACION, 
  OCUPANTE, 
  LOCACION
) AS

SELECT P.Nombre, P.Apellido, cast(E.Descripcion as char(50)), cast(D.Descripcion as char(60)), Oc.FechaIni, Oc.FechaFin,
       Oc.FechaRetiro, Oc.IdEdificio, Oc.IdDepartamento, Oc.IdOcupante,
       Oc.IdOcupacion, CONCAT(P.APELLIDO,' ',P.NOMBRE) as OCUPANTE, cast(CONCAT(E.DESCRIPCION,'  ',D.DESCRIPCION) as char(30)) AS LOCACION 


FROM OCUPACION Oc
 INNER JOIN DEPARTAMENTO D ON ((Oc.IdDepartamento=D.IdDepartamento) AND
                                    (Oc.IdEdificio=D.IdEdificio))
      INNER JOIN EDIFICIO E ON (D.IdEdificio=E.IdEdificio)
      INNER JOIN PERSONA P ON (Oc.IdOcupante=P.IdPersona)
DROP VIEW VW_PERSONAS_2;

CREATE VIEW VW_PERSONAS_2 (
  IDOCUPANTE,
  OCUPANTE,
  TIPO,
  MATRICULA
) AS

SELECT Persona.IdPersona, Persona.APELLIDO || ' ' || Persona.NOMBRE as OCUPANTE,
cast('Personal militar' as varchar(20)) as TIPO,
cast(Ocupante_militar.MATRICULA as varchar(10)) as matricula
FROM PERSONA Persona
   INNER JOIN OCUPANTE_MILITAR Ocupante_militar
   ON  (Persona.IDPERSONA = Ocupante_militar.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_MIL'
UNION
SELECT Persona.IdPersona, Persona.APELLIDO || ' ' || Persona.NOMBRE as OCUPANTE,
cast('Personal civil' as varchar(20)),
Ocupante_civil.legajo
FROM PERSONA Persona
   INNER JOIN OCUPANTE_CIVIL Ocupante_civil
   ON  (Persona.IDPERSONA = Ocupante_civil.IDPERSONA)
WHERE PERSONA.TIPO = 'OCUP_CIV'
UNION
SELECT Persona.IdPersona, Persona.APELLIDO || ' ' || Persona.NOMBRE as OCUPANTE,
cast('Particular' as varchar(20)),
CAST('' AS VARCHAR(10)) AS MATRICULA
FROM PERSONA Persona
WHERE PERSONA.TIPO = 'OCUP_PART'
UNION
SELECT Persona.IdPersona, Persona.APELLIDO || ' ' || Persona.NOMBRE as OCUPANTE,
cast('Militar no ocupante' as varchar(20)) as TIPO,
cast(Militar_No_Ocupante.MATRICULA as varchar(10)) as matricula
FROM PERSONA Persona
   INNER JOIN MILITAR_NO_OCUPANTE
   ON  (Persona.IDPERSONA = MILITAR_NO_OCUPANTE.IDPERSONA)
WHERE PERSONA.TIPO = 'MIL_NO_OCUP'
;

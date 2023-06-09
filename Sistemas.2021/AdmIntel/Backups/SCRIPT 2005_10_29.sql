drop VIEW VW_PAGADOS;

CREATE VIEW VW_PAGADOS (
  IDPROVEEDOR,
  FECHA_PAGO,
  IMPORTE,
  TIPO_PAGO,
  NRO_CHEQUE,
  COBRADO,
  IDPAGO,
  RAZON_SOCIAL,
  PERSONAL,
  IDPERSONAL
) AS

SELECT Vw_pago_prov_SINFACT.IDPROVEEDOR, Pago.FECHA_PAGO, Pago.IMPORTE, Pago.TIPO_PAGO, Pago.NRO_CHEQUE, Pago.COBRADO, Pago.IDPAGO, Proveedor.RAZON_SOCIAL, Personal.APELLIDO ||', '|| Personal.NOMBRE, PAGO.IDPERSONAL
FROM PAGO Pago
   INNER JOIN VW_PAGO_PROV_SINFACT Vw_pago_prov_SINFACT
   ON  (Pago.IDPAGO = Vw_pago_prov_SINFACT.IDPAGO)
   LEFT OUTER JOIN PERSONAL Personal
   ON  (Pago.IDPERSONAL = Personal.IDPERSONAL)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Vw_pago_prov_SINFACT.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
;


drop VIEW VW_TRAB_PAGADOS;

CREATE VIEW VW_TRAB_PAGADOS (
  IDTRABAJO,
  IDPAGO,
  DESCRIP,
  IMPORTE,
  FECHA,
  IDEDIFICIO,
  TIPO_TRAB,
  NRO_DECI,
  NRO_ORDEN,
  RAZON_SOCIAL,
  TIPO_PAGO,
  NRO_CHEQUE
) AS
SELECT Trabajo.IDTRABAJO, Trabajo.IDPAGO,   ( ('Factura N� ' || CAST(Trabajo.NRO_FACT AS VARCHAR(10))) || ' - ')  || Categoria.DESCRIP , Trabajo.COSTO, Trabajo.FECHA_FIN, DEPARTAMENTO.IDEDIFICIO, Trabajo.TIPO_TRAB, Trabajo.NRO_DECI, TRABAJO.NRO_ORDEN, Proveedor.RAZON_SOCIAL, Pago.TIPO_PAGO, Pago.NRO_CHEQUE
FROM TRABAJO Trabajo
   INNER JOIN CATEGORIA Categoria
   ON  (Trabajo.IDCATEGORIA = Categoria.IDCATEGORIA)
   INNER JOIN TRAB_DEPTO Trab_depto
   ON  (Trabajo.IDTRABAJO = Trab_depto.IDTRABAJO)
   INNER JOIN PAGO Pago
   ON  (Trabajo.IDPAGO = Pago.IDPAGO)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
   INNER JOIN DEPARTAMENTO DEPARTAMENTO
   ON  (Trab_depto.IDDEPARTAMENTO = DEPARTAMENTO.IDDEPARTAMENTO)
WHERE  Trabajo.PAGADO = 'S�'
UNION
SELECT Trabajo.IDTRABAJO, Trabajo.IDPAGO,   ( ('Factura N� ' || CAST(Trabajo.NRO_FACT AS VARCHAR(10))) || ' - ')  || Categoria.DESCRIP , Trabajo.COSTO, Trabajo.FECHA_FIN, Trab_edif.IDEDIFICIO, Trabajo.TIPO_TRAB, Trabajo.NRO_DECI, TRABAJO.NRO_ORDEN, Proveedor.RAZON_SOCIAL, Pago.TIPO_PAGO, Pago.NRO_CHEQUE
FROM TRABAJO Trabajo
   INNER JOIN CATEGORIA Categoria
   ON  (Trabajo.IDCATEGORIA = Categoria.IDCATEGORIA)
   INNER JOIN TRAB_EDIF Trab_edif
   ON  (Trabajo.IDTRABAJO = Trab_edif.IDTRABAJO)
   INNER JOIN PAGO Pago
   ON  (Trabajo.IDPAGO = Pago.IDPAGO)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
WHERE  Trabajo.PAGADO = 'S�';

CREATE VIEW VW_IMPORTE_POR_IDPAGO
(IDPAGO,
IDPROVEEDOR,
IMPORTE)
AS
SELECT IDPAGO, IDPROVEEDOR, SUM( COSTO ) IMPORTE
FROM TRABAJO Trabajo
GROUP BY IDPAGO, IDPROVEEDOR

UNION

SELECT IDPAGO, IDPROVEEDOR, SUM( COSTO ) IMPORTE
FROM SERV_EDIF Serv_edif
GROUP BY IDPAGO, IDPROVEEDOR

UNION

SELECT IDPAGO, IDPROVEEDOR, SUM( COSTO ) IMPORTE
FROM GASTO_AD Gasto_ad
GROUP BY IDPAGO, IDPROVEEDOR;

CREATE VIEW VW_IMPORTE_POR_IDPAGO_TOTAL
(IDPAGO,
IDPROVEEDOR,
IMPORTE) AS
SELECT IDPAGO, IDPROVEEDOR, SUM(IMPORTE)
FROM VW_IMPORTE_POR_IDPAGO
GROUP BY IDPAGO, IDPROVEEDOR;

CREATE VIEW VW_PAGOS_EFECTUADOS
(IDPAGO,
FECHA_PAGO,
IMPORTE,
TIPO_PAGO,
NRO_CHEQUE,
COBRADO,
PROVEEDOR,
APELLIDO,
NOMBRE) AS
SELECT Pago.IDPAGO, Pago.FECHA_PAGO, Pago.IMPORTE, Pago.TIPO_PAGO, Pago.NRO_CHEQUE, Pago.COBRADO, Proveedor.RAZON_SOCIAL, Personal.APELLIDO, Personal.NOMBRE
FROM PAGO Pago
   INNER JOIN VW_IMPORTE_POR_IDPAGO_TOTAL Vw_importe_por_idpago_total
   ON  (Pago.IDPAGO = Vw_importe_por_idpago_total.IDPAGO)
   LEFT OUTER JOIN PERSONAL Personal
   ON  (Pago.IDPERSONAL = Personal.IDPERSONAL)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Vw_importe_por_idpago_total.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
   ;
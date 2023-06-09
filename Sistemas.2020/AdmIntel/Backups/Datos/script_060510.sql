DROP VIEW VW_CUENTA_MANT;

CREATE VIEW VW_CUENTA_MANT (
  FECHA,
  RUBRO,
  NROTRABAJO,
  PROVEEDOR,
  TIPOPAGO,
  IMPORTE,
  NROCHEQUE,
  IDEDIF,
  NRO_DECI,
  NRO_ORDEN,
  NROFACTURA,
  COSTO,
  EDIFICIO,
  DESCRIP,
  IMPUTACION
) AS

SELECT Pago.FECHA_PAGO, Categoria.DESCRIP, Trabajo.NRO_PEDIDO, Proveedor.RAZON_SOCIAL, Pago.TIPO_PAGO, Pago.IMPORTE, Pago.NRO_CHEQUE, Trab_edif.IDEDIFICIO, Trabajo.NRO_DECI, Trabajo.NRO_ORDEN, Trabajo.NRO_FACT, Trabajo.COSTO, EDIFICIO.DESCRIPCION, Tipo_espacio.DESCRIP, TRABAJO.IMPUTACION
FROM TRABAJO Trabajo
   INNER JOIN PAGO Pago
   ON  (Trabajo.IDPAGO = Pago.IDPAGO)
   INNER JOIN CATEGORIA Categoria
   ON  (Trabajo.IDCATEGORIA = Categoria.IDCATEGORIA)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
   LEFT OUTER JOIN TRAB_EDIF Trab_edif
   ON  (Trabajo.IDTRABAJO = Trab_edif.IDTRABAJO)
   INNER JOIN EDIFICIO EDIFICIO
   ON  (Trab_edif.IDEDIFICIO = EDIFICIO.IDEDIFICIO)
   INNER JOIN TIPO_ESPACIO Tipo_espacio
   ON  (Trab_edif.IDTIPO_ESPACIO = Tipo_espacio.IDTIPO_ESPACIO)
UNION
SELECT Pago.FECHA_PAGO, Categoria.DESCRIP, Trabajo.NRO_PEDIDO, Proveedor.RAZON_SOCIAL, Pago.TIPO_PAGO, Pago.IMPORTE, Pago.NRO_CHEQUE, DEPARTAMENTO.IDEDIFICIO, Trabajo.NRO_DECI, Trabajo.NRO_ORDEN, Trabajo.NRO_FACT, Trabajo.COSTO, EDIFICIO.DESCRIPCION, DEPARTAMENTO.DESCRIPCION, TRABAJO.IMPUTACION
FROM TRABAJO Trabajo
   INNER JOIN TRAB_DEPTO Trab_depto
   ON  (Trabajo.IDTRABAJO = Trab_depto.IDTRABAJO)
   INNER JOIN PAGO Pago
   ON  (Trabajo.IDPAGO = Pago.IDPAGO)
   INNER JOIN CATEGORIA Categoria
   ON  (Trabajo.IDCATEGORIA = Categoria.IDCATEGORIA)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
   INNER JOIN DEPARTAMENTO DEPARTAMENTO
   ON  (Trab_depto.IDDEPARTAMENTO = DEPARTAMENTO.IDDEPARTAMENTO)
   INNER JOIN EDIFICIO EDIFICIO
   ON  (DEPARTAMENTO.IDEDIFICIO = EDIFICIO.IDEDIFICIO)
;

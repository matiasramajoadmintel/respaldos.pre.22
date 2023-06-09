drop VIEW VW_RESUMEN_DECI_SERV;
drop VIEW VW_SERV_EDIF ;

CREATE VIEW VW_SERV_EDIF (
  IDEDIFICIO,
  FECHA,
  COSTO,
  DESCRIP,
  IDSERVICIO,
  IDPROVEEDOR,
  RAZON_SOCIAL,
  IDSERV_EDIF,
  PAGADO,
  TIPO_PAGO,
  NRO_CHEQUE,
  IDPAGO,
  NRO_DECI,
  NRO_ORDEN,
  VACIOS,
  FECHA_PAGO,
  EDIFICIO,
  NRO_FACT,
  A_PAGAR_OCUPANTE
) AS

SELECT Serv_edif.IDEDIFICIO, Serv_edif.FECHA_PAGO, Serv_edif.COSTO, Servicio.DESCRIP, Serv_edif.IDSERVICIO, Serv_edif.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, Serv_edif.IDSERV_EDIF, Serv_edif.PAGADO, Pago.TIPO_PAGO, Pago.NRO_CHEQUE, Serv_edif.IDPAGO, Serv_edif.NRO_DECI, Serv_edif.NRO_ORDEN, Serv_edif.VACIOS, Pago.FECHA_PAGO, Edificio.DESCRIPCION, SERV_EDIF.NRO_FACT, serv_edif.A_PAGAR_OCUPANTE
FROM SERV_EDIF Serv_edif
   INNER JOIN SERVICIO Servicio
   ON  (Serv_edif.IDSERVICIO = Servicio.IDSERVICIO)
   LEFT OUTER JOIN PROVEEDOR Proveedor
   ON  (Serv_edif.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
   LEFT OUTER JOIN PAGO Pago
   ON  (Serv_edif.IDPAGO = Pago.IDPAGO)
   INNER JOIN EDIFICIO Edificio
   ON  (Serv_edif.IDEDIFICIO = Edificio.IDEDIFICIO)
;

CREATE VIEW VW_RESUMEN_DECI_SERV (
  EDIFICIO,
  FECHA,
  IMPORTE_EFEC,
  IMPORTE_CHEQUE
) AS

SELECT EDIFICIO, FECHA, SUM(COSTO) IMPORTE_EFEC, CAST(0 AS FLOAT) AS IMPORTE_CHEQUE FROM VW_SERV_EDIF
WHERE TIPO_PAGO = 'E' and VACIOS = 'No'
GROUP BY EDIFICIO, FECHA
UNION
SELECT EDIFICIO, FECHA, CAST(0 AS FLOAT) AS IMPORTE_EFEC, SUM(COSTO) IMPORTE_CHEQUE FROM VW_SERV_EDIF
WHERE TIPO_PAGO = 'C' and VACIOS = 'No'
GROUP BY EDIFICIO, FECHA
;

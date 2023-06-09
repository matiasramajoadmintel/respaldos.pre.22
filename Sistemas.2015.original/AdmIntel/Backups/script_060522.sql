ALTER TABLE DEPARTAMENTO ADD ACTIVO BOOLEAN DEFAULT "SI";

UPDATE DEPARTAMENTO SET ACTIVO = 'SI' WHERE IDEDIFICIO = 3;

CREATE VIEW VW_CHEQUES_DEVUELTOS (
  PROVEEDOR,
  FECHA_PAGO,
  TIPO,
  NRO_CHEQUE
) AS
SELECT DISTINCT Proveedor.RAZON_SOCIAL, Pago.FECHA_PAGO, Cheque_devuelto.TIPO, Cheque_devuelto.NRO_CHEQUE, Pago.IMPORTE
FROM CHEQUE_DEVUELTO Cheque_devuelto
   INNER JOIN PAGO Pago
   ON  (Pago.NRO_CHEQUE = Cheque_devuelto.NRO_CHEQUE)
   INNER JOIN VW_PAGO_PROV Vw_pago_prov
   ON  (Vw_pago_prov.IDPAGO = Pago.IDPAGO)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Vw_pago_prov.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
;

CREATE VIEW VW_CHEQUES_NO_COBRADOS (
FECHA_PAGO,
IMPORTE,
  PROVEEDOR,

  NRO_CHEQUE

) AS
SELECT DISTINCT Pago.FECHA_PAGO, Pago.IMPORTE, Proveedor.RAZON_SOCIAL, Pago.NRO_CHEQUE, Pago.COBRADO
FROM VW_PAGO_PROV Vw_pago_prov
   INNER JOIN PAGO Pago
   ON  (Vw_pago_prov.IDPAGO = Pago.IDPAGO)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Vw_pago_prov.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
WHERE  Pago.COBRADO = 'No';
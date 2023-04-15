DROP VIEW IF EXISTS `vw_cant_activos_x_edif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cant_activos_x_edif` AS select edificio.IDEDIFICIO AS IDEDIFICIO,count(departamento.IDDEPARTAMENTO) AS CANT_ACTIVOS from (edificio left join departamento on(((edificio.IDEDIFICIO = departamento.IDEDIFICIO) and (departamento.ACTIVO = _utf8'SI')))) group by edificio.IDEDIFICIO,edificio.IDOCUPANTEJEFE,edificio.DIRECCION,edificio.ADMFISCAL,edificio.OBSERVACIONES,edificio.DESCRIPCION,edificio.JEFEMILITAR,edificio.ECONOMO,edificio.COEFICIENTE ;


-- Dumping structure for view zzz.vw_cant_ocupados_x_edif
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cant_ocupados_x_edif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cant_ocupados_x_edif` AS select edificio.IDEDIFICIO AS IDEDIFICIO,count(departamento.IDDEPARTAMENTO) AS CANT_OCUPADOS from ((edificio join departamento on((departamento.IDEDIFICIO = edificio.IDEDIFICIO))) join ocupacion on(((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO) and isnull(ocupacion.FECHARETIRO)))) group by edificio.IDEDIFICIO ;


-- Dumping structure for view zzz.vw_cheques_dep
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cheques_dep`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cheques_dep` AS select ingreso.FECHA_PAGO AS FECHA_PAGO,ingreso.NRO_CHEQUE AS NRO_CHEQUE,ingreso.IMPORTE_MANT AS IMPORTE_MANT,ingreso.IMPORTE_SERV AS IMPORTE_SERV from ingreso where (ingreso.TIPO_PAGO = _utf8'C') ;


-- Dumping structure for view zzz.vw_cheques_devueltos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cheques_devueltos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cheques_devueltos` AS select distinct proveedor.RAZON_SOCIAL AS PROVEEDOR,pago.FECHA_PAGO AS FECHA_PAGO,cheque_devuelto.TIPO AS TIPO,cheque_devuelto.NRO_CHEQUE AS NRO_CHEQUE,pago.IMPORTE AS IMPORTE from (((cheque_devuelto join pago on((pago.NRO_CHEQUE = cheque_devuelto.NRO_CHEQUE))) join vw_pago_prov on((vw_pago_prov.IDPAGO = pago.IDPAGO))) join proveedor on((vw_pago_prov.IDPROVEEDOR = proveedor.IDPROVEEDOR))) ;


-- Dumping structure for view zzz.vw_cheques_emitidos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cheques_emitidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cheques_emitidos` AS select distinct pago.IDPAGO AS IDPAGO,pago.FECHA_PAGO AS FECHA,pago.IMPORTE AS IMPORTE,pago.NRO_CHEQUE AS NROCHEQUE,pago.COBRADO AS COBRADO,proveedor.RAZON_SOCIAL AS PROVEEDOR from ((pago join vw_pago_prov on((vw_pago_prov.IDPAGO = pago.IDPAGO))) join proveedor on((vw_pago_prov.IDPROVEEDOR = proveedor.IDPROVEEDOR))) where (pago.TIPO_PAGO = _utf8'C') ;


-- Dumping structure for view zzz.vw_cheques_no_cobrados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cheques_no_cobrados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cheques_no_cobrados` AS select distinct pago.FECHA_PAGO AS FECHA_PAGO,pago.IMPORTE AS IMPORTE,proveedor.RAZON_SOCIAL AS PROVEEDOR,pago.NRO_CHEQUE AS NRO_CHEQUE,pago.COBRADO AS COBRADO from ((vw_pago_prov join pago on((vw_pago_prov.IDPAGO = pago.IDPAGO))) join proveedor on((vw_pago_prov.IDPROVEEDOR = proveedor.IDPROVEEDOR))) where (pago.COBRADO = _utf8'No') ;


-- Dumping structure for view zzz.vw_cobros_part
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cobros_part`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cobros_part` AS select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,(persona.TIPODOCUMENTO or _utf8' ' or persona.NRODOCUMENTO) AS DOCUMENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,descuento.MONTO AS EXPENSAS,(ocupante_particular.COSTOALQUILER * 0.1) AS RAE,(ocupante_particular.COSTOALQUILER * 0.9) AS ALQUILER,edificio.DESCRIPCION AS EDIFICIO,departamento.DESCRIPCION AS DEPTO,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS LOCACION from (((((persona left join descuento on((persona.IDPERSONA = descuento.IDOCUPANTE))) join ocupante_particular on((persona.IDPERSONA = ocupante_particular.IDPERSONA))) join ocupacion on((persona.IDPERSONA = ocupacion.IDOCUPANTE))) join edificio on((ocupacion.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) where ((persona.TIPO = _utf8'OCUP_PART') and isnull(ocupacion.FECHARETIRO)) ;


-- Dumping structure for view zzz.vw_creditos_bancarios
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_creditos_bancarios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_creditos_bancarios` AS select credito_bancario.FECHA_PAGO AS FECHA_PAGO,credito_bancario.DESCRIP AS DESCRIP,credito_bancario.COSTO AS COSTO,credito_bancario.IDCREDITO_BANCARIO AS IDCREDITO_BANCARIO from credito_bancario ;


-- Dumping structure for view zzz.vw_cuenta_mant
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_cuenta_mant`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_cuenta_mant` AS select pago.FECHA_PAGO AS FECHA,categoria.DESCRIP AS RUBRO,trabajo.NRO_PEDIDO AS NROTRABAJO,proveedor.RAZON_SOCIAL AS PROVEEDOR,pago.TIPO_PAGO AS TIPOPAGO,pago.IMPORTE AS IMPORTE,pago.NRO_CHEQUE AS NROCHEQUE,trab_edif.IDEDIFICIO AS IDEDIF,trabajo.NRO_DECI AS NRO_DECI,trabajo.NRO_ORDEN AS NRO_ORDEN,trabajo.NRO_FACT AS NROFACTURA,trabajo.COSTO AS COSTO,edificio.DESCRIPCION AS EDIFICIO,tipo_espacio.DESCRIP AS DESCRIP,trabajo.IMPUTACION AS IMPUTACION from ((((((trabajo join pago on((trabajo.IDPAGO = pago.IDPAGO))) join categoria on((trabajo.IDCATEGORIA = categoria.IDCATEGORIA))) join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) left join trab_edif on((trabajo.IDTRABAJO = trab_edif.IDTRABAJO))) join edificio on((trab_edif.IDEDIFICIO = edificio.IDEDIFICIO))) join tipo_espacio on((trab_edif.IDTIPO_ESPACIO = tipo_espacio.IDTIPO_ESPACIO))) union select pago.FECHA_PAGO AS FECHA_PAGO,categoria.DESCRIP AS DESCRIP,trabajo.NRO_PEDIDO AS NRO_PEDIDO,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,pago.TIPO_PAGO AS TIPO_PAGO,pago.IMPORTE AS IMPORTE,pago.NRO_CHEQUE AS NRO_CHEQUE,departamento.IDEDIFICIO AS IDEDIFICIO,trabajo.NRO_DECI AS NRO_DECI,trabajo.NRO_ORDEN AS NRO_ORDEN,trabajo.NRO_FACT AS NRO_FACT,trabajo.COSTO AS COSTO,edificio.DESCRIPCION AS DESCRIPCION,departamento.DESCRIPCION AS DESCRIPCION,trabajo.IMPUTACION AS IMPUTACION from ((((((trabajo join trab_depto on((trabajo.IDTRABAJO = trab_depto.IDTRABAJO))) join pago on((trabajo.IDPAGO = pago.IDPAGO))) join categoria on((trabajo.IDCATEGORIA = categoria.IDCATEGORIA))) join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) join departamento on((trab_depto.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join edificio on((departamento.IDEDIFICIO = edificio.IDEDIFICIO))) ;


-- Dumping structure for view zzz.vw_deptosvacios
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_deptosvacios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_deptosvacios` AS select departamento.IDDEPARTAMENTO AS IDDEPARTAMENTO,departamento.IDEDIFICIO AS IDEDIFICIO,departamento.TIPO AS TIPO,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS DESCRIPLARGA,departamento.DESCRIPCION AS DESCRIPCORTA from (departamento join edificio on((departamento.IDEDIFICIO = edificio.IDEDIFICIO))) where (not(departamento.IDDEPARTAMENTO in (select vw_ocupacion.IDDEPARTAMENTO AS iddepartamento from vw_ocupacion where isnull(vw_ocupacion.FECHARETIRO)))) ;


-- Dumping structure for view zzz.vw_descuento
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_descuento`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_descuento` AS select p.APELLIDO AS APELLIDO,p.NOMBRE AS NOMBRE,td.DESCRIPCION AS DESCRIPCION,d.MES AS MES,d.ANIO AS ANIO,d.MONTO AS MONTO,d.IDOCUPANTE AS IDOCUPANTE,d.IDTIPODESCUENTO AS IDTIPODESCUENTO,d.IDDESCUENTO AS IDDESCUENTO,ocupante_militar.MATRICULA AS MR,td.CODDESC AS CODDESC,vw_ocup_mil_actuales.IDEDIFICIO AS IDEDIFICIO,vw_ocup_mil_actuales.EDIFICIO AS EDIFICIO,td.TIPOPAGO AS TIPOPAGO,grado.ABREVIATURA AS GRADO,especialidad.ABREV AS ESPECIALIDAD,(p.APELLIDO or _utf8' ' or p.NOMBRE) AS APENOM,vw_ocup_mil_actuales.DEPTO AS DEPTO,p.TIPO AS TIPOPERS from ((((((descuento d join persona p on((d.IDOCUPANTE = p.IDPERSONA))) join tipo_descuento td on((d.IDTIPODESCUENTO = td.IDTIPODESCUENTO))) join ocupante_militar on((ocupante_militar.IDPERSONA = p.IDPERSONA))) join vw_ocup_mil_actuales on((vw_ocup_mil_actuales.IDPERSONA = p.IDPERSONA))) join grado on((ocupante_militar.IDGRADO = grado.IDGRADO))) left join especialidad on((ocupante_militar.IDESPECIALIDAD = especialidad.IDESPECIALIDAD))) where (p.TIPO = _utf8'OCUP_MIL') union select persona.APELLIDO AS APELLIDO,persona.NOMBRE AS NOMBRE,tipo_descuento.DESCRIPCION AS DESCRIPCION,descuento.MES AS MES,descuento.ANIO AS ANIO,descuento.MONTO AS MONTO,descuento.IDOCUPANTE AS IDOCUPANTE,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.IDDESCUENTO AS IDDESCUENTO,ocupante_civil.LEGAJO AS LEGAJO,tipo_descuento.CODDESC AS CODDESC,ocupacion.IDEDIFICIO AS IDEDIFICIO,edificio.DESCRIPCION AS DESCRIPCION,tipo_descuento.TIPOPAGO AS TIPOPAGO,_utf8'PC' AS Grado,_utf8'' AS Especialidad,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS ApeNom,departamento.DESCRIPCION AS DEPTO,persona.TIPO AS TIPO from ((((((persona join descuento on((persona.IDPERSONA = descuento.IDOCUPANTE))) join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) join tipo_descuento on((descuento.IDTIPODESCUENTO = tipo_descuento.IDTIPODESCUENTO))) join ocupacion on((ocupante_civil.IDPERSONA = ocupacion.IDOCUPANTE))) join edificio on((ocupacion.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) where (isnull(ocupacion.FECHARETIRO) and (persona.TIPO = _utf8'OCUP_CIV')) ;


-- Dumping structure for view zzz.vw_descuentos_civiles
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_descuentos_civiles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_descuentos_civiles` AS select (persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,descuento.MONTO AS ALQUILER,0 AS RAE,0 AS EXPENSAS,ocupante_civil.LEGAJO AS MR,ocupante_civil.CATEGORIA AS GRADO from ((descuento join persona on((descuento.IDOCUPANTE = persona.IDPERSONA))) join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) where ((descuento.IDTIPODESCUENTO = 1) and (persona.TIPO = _utf8'OCUP_CIV')) union select (persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS `Persona.APELLIDO || ' ' || Persona.NOMBRE`,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,0 AS FLOATA,descuento.MONTO AS MONTO,0 AS FLOATE,ocupante_civil.LEGAJO AS LEGAJO,ocupante_civil.CATEGORIA AS CATEGORIA from ((descuento join persona on((descuento.IDOCUPANTE = persona.IDPERSONA))) join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) where ((descuento.IDTIPODESCUENTO = 2) and (persona.TIPO = _utf8'OCUP_CIV')) union select (persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS `Persona.APELLIDO || ' ' || Persona.NOMBRE`,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,0 AS FLOATA,0 AS FLOATE,descuento.MONTO AS MONTO,ocupante_civil.LEGAJO AS LEGAJO,ocupante_civil.CATEGORIA AS CATEGORIA from ((descuento join persona on((descuento.IDOCUPANTE = persona.IDPERSONA))) join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) where ((descuento.IDTIPODESCUENTO = 3) and (persona.TIPO = _utf8'OCUP_CIV')) ;


-- Dumping structure for view zzz.vw_descuentos_militares
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_descuentos_militares`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_descuentos_militares` AS select (persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,ocupante_militar.MATRICULA AS MR,grado.ABREVIATURA AS GRADO,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,descuento.MONTO AS ALQUILER,0 AS RAE,0 AS EXPENSAS from (((descuento join persona on((descuento.IDOCUPANTE = persona.IDPERSONA))) join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) join grado on((ocupante_militar.IDGRADO = grado.IDGRADO))) where ((descuento.IDTIPODESCUENTO = 1) and (persona.TIPO = _utf8'OCUP_MIL')) union select (persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,ocupante_militar.MATRICULA AS MATRICULA,grado.ABREVIATURA AS ABREVIATURA,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,0 AS ALQUILER,descuento.MONTO AS RAE,0 AS EXPENSAS from (((descuento join persona on((descuento.IDOCUPANTE = persona.IDPERSONA))) join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) join grado on((ocupante_militar.IDGRADO = grado.IDGRADO))) where ((descuento.IDTIPODESCUENTO = 2) and (persona.TIPO = _utf8'OCUP_MIL')) union select (persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,ocupante_militar.MATRICULA AS MATRICULA,grado.ABREVIATURA AS ABREVIATURA,descuento.IDTIPODESCUENTO AS IDTIPODESCUENTO,descuento.MES AS MES,descuento.ANIO AS ANIO,0 AS ALQUILER,0 AS RAE,descuento.MONTO AS EXPENSAS from (((descuento join persona on((descuento.IDOCUPANTE = persona.IDPERSONA))) join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) join grado on((ocupante_militar.IDGRADO = grado.IDGRADO))) where ((descuento.IDTIPODESCUENTO = 3) and (persona.TIPO = _utf8'OCUP_MIL')) ;


-- Dumping structure for view zzz.vw_det_pagados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_det_pagados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_det_pagados` AS select gasto_ad.IDGASTO_AD AS ID,gasto_ad.IDPAGO AS IDPAGO,gasto_ad.FECHA_PAGO AS FECHA,tipo_gasto_ad.DESCRIP AS DESCRIP,gasto_ad.COSTO AS IMPORTE,gasto_ad.NRO_DECI AS NRO_DECI,gasto_ad.NRO_ORDEN AS NRO_ORDEN,gasto_ad.NRO_FACT AS NRO_FACT,_utf8'A' AS TIPO from (gasto_ad join tipo_gasto_ad on((gasto_ad.IDTIPO_GASTO_AD = tipo_gasto_ad.IDTIPO_GASTO_AD))) where (gasto_ad.PAGADO = _utf8'Sí') union select serv_edif.IDSERV_EDIF AS idserv_edif,serv_edif.IDPAGO AS IDPAGO,serv_edif.FECHA_PAGO AS FECHA_PAGO,servicio.DESCRIP AS DESCRIP,serv_edif.COSTO AS COSTO,serv_edif.NRO_DECI AS NRO_DECI,serv_edif.NRO_ORDEN AS NRO_ORDEN,serv_edif.NRO_FACT AS NRO_FACT,_utf8'S' AS TIPO from (serv_edif join servicio on((serv_edif.IDSERVICIO = servicio.IDSERVICIO))) where (serv_edif.PAGADO = _utf8'Sí') union select trabajo.IDTRABAJO AS idtrabajo,trabajo.IDPAGO AS IDPAGO,trabajo.FECHA_FIN AS FECHA_FIN,categoria.DESCRIP AS DESCRIP,trabajo.COSTO AS COSTO,trabajo.NRO_DECI AS NRO_DECI,trabajo.NRO_ORDEN AS NRO_ORDEN,trabajo.NRO_FACT AS NRO_FACT,_utf8'T' AS TIPO from (trabajo join categoria on((trabajo.IDCATEGORIA = categoria.IDCATEGORIA))) where (trabajo.PAGADO = _utf8'Sí') ;


-- Dumping structure for view zzz.vw_det_tareas
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_det_tareas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_det_tareas` AS select tarea.DESCRIP AS DESCRIP,vw_trabajos_completa.FECHA_FIN AS FECHA_FIN,vw_trabajos_completa.PROVEEDOR AS RAZON_SOCIAL,vw_trabajos_completa.EDIFICO AS EDIFICO,vw_trabajos_completa.IDEDIFICIO AS IDEDIFICIO,vw_trabajos_completa.LUGAR AS LUGAR from ((trab_tarea join tarea on((trab_tarea.IDTAREA = tarea.IDTAREA))) join vw_trabajos_completa on((trab_tarea.IDTRABAJO = vw_trabajos_completa.IDTRABAJO))) ;


-- Dumping structure for view zzz.vw_deudas
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_deudas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_deudas` AS select gasto_ad.IDPROVEEDOR AS IDPROVEEDOR,proveedor.RAZON_SOCIAL AS PROVEEDOR,sum(gasto_ad.COSTO) AS IMPORTE from (gasto_ad left join proveedor on((gasto_ad.IDPROVEEDOR = proveedor.IDPROVEEDOR))) where (gasto_ad.PAGADO = _utf8'No') group by gasto_ad.IDPROVEEDOR,proveedor.RAZON_SOCIAL union select serv_edif.IDPROVEEDOR AS IDPROVEEDOR,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,sum(serv_edif.COSTO) AS `SUM( SERV_EDIF.COSTO )` from (serv_edif left join proveedor on((serv_edif.IDPROVEEDOR = proveedor.IDPROVEEDOR))) where (serv_edif.PAGADO = _utf8'No') group by serv_edif.IDPROVEEDOR,proveedor.RAZON_SOCIAL union select trabajo.IDPROVEEDOR AS IDPROVEEDOR,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,sum(trabajo.COSTO) AS `SUM( TRABAJO.COSTO )` from (trabajo left join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) where (trabajo.PAGADO = _utf8'No') group by trabajo.IDPROVEEDOR,proveedor.RAZON_SOCIAL ;


-- Dumping structure for view zzz.vw_deudores
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_deudores`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_deudores` AS select serv_edif.COSTO AS COSTO,serv_edif.NRO_FACT AS NRO_FACT,serv_edif.IDPERSONA AS IDPERSONA,vw_personas_2.OCUPANTE AS OCUPANTE,vw_personas_2.TIPO AS TIPO,vw_personas_2.MATRICULA AS MATRICULA,serv_edif.FECHA_PAGO AS FECHA_PAGO,servicio.DESCRIP AS DESCRIP from ((serv_edif left join vw_personas_2 on((serv_edif.IDPERSONA = vw_personas_2.IDOCUPANTE))) join servicio on((serv_edif.IDSERVICIO = servicio.IDSERVICIO))) where (serv_edif.A_PAGAR_OCUPANTE = _utf8'Si') ;


-- Dumping structure for view zzz.vw_edificios
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_edificios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_edificios` AS select edificio.IDEDIFICIO AS IDEDIFICIO,edificio.IDOCUPANTEJEFE AS IDOCUPANTEJEFE,edificio.DIRECCION AS DIRECCION,edificio.ADMFISCAL AS ADMFISCAL,edificio.OBSERVACIONES AS OBSERVACIONES,edificio.DESCRIPCION AS DESCRIPCION,edificio.JEFEMILITAR AS JEFEMILITAR,edificio.ECONOMO AS ECONOMO,edificio.COEFICIENTE AS COEFICIENTE,count(departamento.IDDEPARTAMENTO) AS CANT_DEPTOS from (edificio left join departamento on((edificio.IDEDIFICIO = departamento.IDEDIFICIO))) group by edificio.IDEDIFICIO,edificio.IDOCUPANTEJEFE,edificio.DIRECCION,edificio.ADMFISCAL,edificio.OBSERVACIONES,edificio.DESCRIPCION,edificio.JEFEMILITAR,edificio.ECONOMO,edificio.COEFICIENTE ;


-- Dumping structure for view zzz.vw_espacios_comunes
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_espacios_comunes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_espacios_comunes` AS select espacio_comun.IDTIPO_ESPACIO AS IDTIPO_ESPACIO,espacio_comun.IDEDIFICIO AS IDEDIFICIO,tipo_espacio.DESCRIP AS DESCRIP from (espacio_comun join tipo_espacio on((espacio_comun.IDTIPO_ESPACIO = tipo_espacio.IDTIPO_ESPACIO))) ;


-- Dumping structure for view zzz.vw_gasto_ad
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_gasto_ad`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_gasto_ad` AS select gasto_ad.IDGASTO_AD AS IDGASTO_AD,gasto_ad.FECHA_PAGO AS FECHA,gasto_ad.COSTO AS COSTO,tipo_gasto_ad.DESCRIP AS DESCRIP,gasto_ad.IDTIPO_GASTO_AD AS IDTIPO_GASTO_AD,gasto_ad.IDPROVEEDOR AS IDPROVEEDOR,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,gasto_ad.PAGADO AS PAGADO,pago.TIPO_PAGO AS TIPO_PAGO,pago.NRO_CHEQUE AS NRO_CHEQUE,gasto_ad.IDPAGO AS IDPAGO,gasto_ad.NRO_DECI AS NRO_DECI,gasto_ad.NRO_ORDEN AS NRO_ORDEN,pago.FECHA_PAGO AS FECHA_PAGO,gasto_ad.NRO_FACT AS NRO_FACT from (((gasto_ad join tipo_gasto_ad on((gasto_ad.IDTIPO_GASTO_AD = tipo_gasto_ad.IDTIPO_GASTO_AD))) left join proveedor on((gasto_ad.IDPROVEEDOR = proveedor.IDPROVEEDOR))) left join pago on((gasto_ad.IDPAGO = pago.IDPAGO))) ;


-- Dumping structure for view zzz.vw_gasto_fi
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_gasto_fi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_gasto_fi` AS select gasto_fi.IDGASTO_FI AS IDGASTO_FI,gasto_fi.FECHA_PAGO AS FECHA,gasto_fi.COSTO AS COSTO,tipo_gasto_fi.DESCRIP AS DESCRIP,gasto_fi.IDTIPO_GASTO_FI AS IDTIPO_GASTO_FI,gasto_fi.NRO_HOJA AS NRO_HOJA from (gasto_fi join tipo_gasto_fi on((gasto_fi.IDTIPO_GASTO_FI = tipo_gasto_fi.IDTIPO_GASTO_FI))) ;


-- Dumping structure for view zzz.vw_importe_por_idpago
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_importe_por_idpago`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_importe_por_idpago` AS select trabajo.IDPAGO AS IDPAGO,trabajo.IDPROVEEDOR AS IDPROVEEDOR,sum(trabajo.COSTO) AS IMPORTE from trabajo group by trabajo.IDPAGO,trabajo.IDPROVEEDOR union select serv_edif.IDPAGO AS IDPAGO,serv_edif.IDPROVEEDOR AS IDPROVEEDOR,sum(serv_edif.COSTO) AS IMPORTE from serv_edif group by serv_edif.IDPAGO,serv_edif.IDPROVEEDOR union select gasto_ad.IDPAGO AS IDPAGO,gasto_ad.IDPROVEEDOR AS IDPROVEEDOR,sum(gasto_ad.COSTO) AS IMPORTE from gasto_ad group by gasto_ad.IDPAGO,gasto_ad.IDPROVEEDOR ;


-- Dumping structure for view zzz.vw_importe_por_idpago_total
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_importe_por_idpago_total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_importe_por_idpago_total` AS select vw_importe_por_idpago.IDPAGO AS IDPAGO,vw_importe_por_idpago.IDPROVEEDOR AS IDPROVEEDOR,sum(vw_importe_por_idpago.IMPORTE) AS IMPORTE from vw_importe_por_idpago group by vw_importe_por_idpago.IDPAGO,vw_importe_por_idpago.IDPROVEEDOR ;


-- Dumping structure for view zzz.vw_ingresos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ingresos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ingresos` AS select ingreso.IDINGRESO AS IDINGRESO,ingreso.IDTIPO_INGRESO AS IDTIPO_INGRESO,tipo_ingreso.DESCRIP AS CONCEPTO,ingreso.FECHA_PAGO AS FECHA,ingreso.TIPO_PAGO AS TIPO_PAGO,ingreso.NRO_CHEQUE AS NRO_CHEQUE,ingreso.NRO_RECIBO AS NRO_RECIBO,ingreso.IMPORTE_MANT AS IMPORTE_MANT,ingreso.SR AS SR,ingreso.IMPORTE_SERV AS IMPORTE_SERV from (ingreso join tipo_ingreso on((ingreso.IDTIPO_INGRESO = tipo_ingreso.IDTIPO_INGRESO))) ;


-- Dumping structure for view zzz.vw_mat_usados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_mat_usados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_mat_usados` AS select mat_usado.IDTRABAJO AS IDTRABAJO,mat_usado.CANTIDAD AS CANTIDAD,mat_usado.IDMATERIAL AS IDMATERIAL,material.DESCRIP AS DESCRIP,vw_trabajos_completa.NROPEDIDO AS NROPEDIDO,unidad.ABREV AS ABREV,vw_trabajos_completa.FECHA_FIN AS FECHA_FIN,vw_trabajos_completa.EDIFICO AS EDIFICO,vw_trabajos_completa.IDEDIFICIO AS IDEDIFICIO,vw_trabajos_completa.LUGAR AS LUGAR,vw_trabajos_completa.PROVEEDOR AS PROVEEDOR,vw_trabajos_completa.NROFACTURA AS NROFACTURA,mat_usado.IDUNIDAD AS IDUNIDAD from (((mat_usado join material on((mat_usado.IDMATERIAL = material.IDMATERIAL))) join unidad on((mat_usado.IDUNIDAD = unidad.IDUNIDAD))) join vw_trabajos_completa on((mat_usado.IDTRABAJO = vw_trabajos_completa.IDTRABAJO))) ;


-- Dumping structure for view zzz.vw_ocupacion
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupacion` AS select p.NOMBRE AS NOMBRE,p.APELLIDO AS APELLIDO,e.DESCRIPCION AS DESCRIPCIONED,d.DESCRIPCION AS DESCRIPCIONDEPT,oc.FECHAINI AS FECHAINI,oc.FECHAFIN AS FECHAFIN,oc.FECHARETIRO AS FECHARETIRO,oc.IDEDIFICIO AS IDEDIFICIO,oc.IDDEPARTAMENTO AS IDDEPARTAMENTO,oc.IDOCUPANTE AS IDOCUPANTE,oc.IDOCUPACION AS IDOCUPACION,(p.APELLIDO or _utf8' ' or p.NOMBRE) AS OCUPANTE,(e.DESCRIPCION or _utf8' ' or d.DESCRIPCION) AS LOCACION from (((ocupacion oc join departamento d on(((oc.IDDEPARTAMENTO = d.IDDEPARTAMENTO) and (oc.IDEDIFICIO = d.IDEDIFICIO)))) join edificio e on((d.IDEDIFICIO = e.IDEDIFICIO))) join persona p on((oc.IDOCUPANTE = p.IDPERSONA))) ;


-- Dumping structure for view zzz.vw_ocupantes
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupantes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupantes` AS select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Personal civil' AS TIPO,ocupante_civil.LEGAJO AS MATRICULA from (persona join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) union select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Personal militar' AS TIPO,ocupante_militar.MATRICULA AS MATRICULA from (persona join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) union select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Particular' AS TIPO,_utf8' ' AS MATRICULA from (persona join ocupante_particular on((persona.IDPERSONA = ocupante_particular.IDPERSONA))) union select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Militar no ocupante' AS TIPO,militar_no_ocupante.MATRICULA AS MATRICULA from (persona join militar_no_ocupante on((persona.IDPERSONA = militar_no_ocupante.IDPERSONA))) ;


-- Dumping structure for view zzz.vw_ocupantes_actuales
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupantes_actuales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupantes_actuales` AS select ocupacion.IDOCUPANTE AS IDOCUPANTE,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,_utf8'Personal militar' AS TIPO,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS LOCACION,ocupacion.FECHAINI AS FECHAINI,ocupacion.FECHAFIN AS FECHAFIN,ocupacion.IDEDIFICIO AS IDEDIFICIO,ocupacion.IDDEPARTAMENTO AS IDDEPARTAMENTO,ocupante_militar.MATRICULA AS MATRICULA,departamento.DESCRIPCION AS UNIDAD,departamento.TELEFONO AS TEL_UNIDAD,grado.ABREVIATURA AS GRADO,ocupante_militar.DESTINO AS DESTINO,ocupante_militar.TELEFONO_DESTINO AS TEL_DESTINO,0 AS IDGARANTE,_utf8'' AS PARENTEZCO,_utf8'' AS GARANTE,persona.NRODOCUMENTO AS DNI from (((((ocupacion join persona on((ocupacion.IDOCUPANTE = persona.IDPERSONA))) join edificio on((ocupacion.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) join grado on((ocupante_militar.IDGRADO = grado.IDGRADO))) where (isnull(ocupacion.FECHARETIRO) and (persona.TIPO = _utf8'OCUP_MIL')) union select ocupacion.IDOCUPANTE AS IDOCUPANTE,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,_utf8'Personal civil' AS `Personal civil`,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS LOCACION,ocupacion.FECHAINI AS FECHAINI,ocupacion.FECHAFIN AS FECHAFIN,ocupacion.IDEDIFICIO AS IDEDIFICIO,ocupacion.IDDEPARTAMENTO AS IDDEPARTAMENTO,ocupante_civil.LEGAJO AS legajo,departamento.DESCRIPCION AS DESCRIPCION,departamento.TELEFONO AS TELEFONO,ocupante_civil.CATEGORIA AS CATEGORIA,ocupante_civil.DESTINO AS DESTINO,ocupante_civil.TELEFONO_DESTINO AS TELEFONO_DESTINO,0 AS IDGARANTE,_utf8'' AS parentezco,_utf8'' AS nombre,persona.NRODOCUMENTO AS NRODOCUMENTO from ((((ocupacion join persona on((ocupacion.IDOCUPANTE = persona.IDPERSONA))) join edificio on((ocupacion.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) where (isnull(ocupacion.FECHARETIRO) and (persona.TIPO = _utf8'OCUP_CIV')) union select ocupacion.IDOCUPANTE AS IDOCUPANTE,(persona1.APELLIDO or _utf8' ' or persona1.NOMBRE) AS OCUPANTE,_utf8'Particular' AS Particular,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS LOCACION,ocupacion.FECHAINI AS FECHAINI,ocupacion.FECHAFIN AS FECHAFIN,ocupacion.IDEDIFICIO AS IDEDIFICIO,ocupacion.IDDEPARTAMENTO AS IDDEPARTAMENTO,_utf8'' AS MATRICULA,departamento.DESCRIPCION AS DESCRIPCION,departamento.TELEFONO AS TELEFONO,_utf8'' AS GRADO,_utf8'' AS DESTINO,_utf8'' AS TEL_DESTINO,ocupante_particular.IDGARANTE AS idgarante,ocupante_particular.PARENTEZCO AS parentezco,(persona2.APELLIDO or _utf8' ' or persona2.NOMBRE) AS garante,persona1.NRODOCUMENTO AS NRODOCUMENTO from (((((ocupacion join persona persona1 on((ocupacion.IDOCUPANTE = persona1.IDPERSONA))) join edificio on((ocupacion.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join ocupante_particular on((persona1.IDPERSONA = ocupante_particular.IDPERSONA))) left join persona persona2 on((ocupante_particular.IDGARANTE = persona2.IDPERSONA))) where (isnull(ocupacion.FECHARETIRO) and (persona1.TIPO = _utf8'OCUP_PART')) ;


-- Dumping structure for view zzz.vw_ocupantes_civiles
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupantes_civiles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupantes_civiles` AS select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Personal civil' AS TIPO,ocupante_civil.LEGAJO AS MATRICULA from (persona join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) ;


-- Dumping structure for view zzz.vw_ocupantes_historicos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupantes_historicos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupantes_historicos` AS select vw_ocupacion.IDOCUPANTE AS IDOCUPANTE,vw_ocupacion.OCUPANTE AS OCUPANTE,vw_personas.TIPO AS TIPO,vw_ocupacion.LOCACION AS LOCACION,vw_ocupacion.FECHAINI AS FECHAINI,vw_ocupacion.FECHAFIN AS FECHAFIN,vw_ocupacion.FECHARETIRO AS FECHARETIRO,vw_ocupacion.IDEDIFICIO AS IDEDIFICIO,vw_ocupacion.IDDEPARTAMENTO AS IDDEPARTAMENTO from (vw_ocupacion join vw_personas on((vw_ocupacion.IDOCUPANTE = vw_personas.IDPERSONA))) ;


-- Dumping structure for view zzz.vw_ocupantes_militares
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupantes_militares`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupantes_militares` AS select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Personal militar' AS TIPO,ocupante_militar.MATRICULA AS MATRICULA from (persona join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) ;


-- Dumping structure for view zzz.vw_ocupantes_particulares
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocupantes_particulares`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocupantes_particulares` AS select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,_utf8'Particular' AS TIPO,_utf8' ' AS MATRICULA from (persona join ocupante_particular on((persona.IDPERSONA = ocupante_particular.IDPERSONA))) ;


-- Dumping structure for view zzz.vw_ocup_civ_actuales
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocup_civ_actuales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocup_civ_actuales` AS select ocupacion.IDOCUPANTE AS IDOCUPANTE,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS LOCACION,ocupacion.FECHAINI AS FECHAINI,ocupacion.FECHAFIN AS FECHAFIN,ocupacion.IDEDIFICIO AS IDEDIFICIO,ocupacion.IDDEPARTAMENTO AS IDDEPARTAMENTO,ocupante_civil.LEGAJO AS LEGAJO,ocupante_civil.SUELDO AS SUELDO from ((((ocupacion join persona on((ocupacion.IDOCUPANTE = persona.IDPERSONA))) join edificio on((ocupacion.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) where (isnull(ocupacion.FECHARETIRO) and (persona.TIPO = _utf8'OCUP_CIV')) ;


-- Dumping structure for view zzz.vw_ocup_mil_actuales
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_ocup_mil_actuales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_ocup_mil_actuales` AS select ocupante_militar.IDPERSONA AS IDPERSONA,departamento.TIPO AS TIPO,departamento.CANTAMB AS CANTAMB,ocupante_militar.MATRICULA AS MATRICULA,ocupante_militar.IDGRADO AS IDGRADO,ocupante_militar.ANTGRADO AS ANTGRADO,ocupante_militar.FECHA_INGRESO AS FECHA_INGRESO,ocupante_militar.RENTAPROPIA AS RENTAPROPIA,ocupante_militar.ANT_SERVICIO AS ANT_SERVICIO,departamento.IDEDIFICIO AS IDEDIFICIO,edificio.DESCRIPCION AS EDIFICIO,departamento.DESCRIPCION AS DEPTO from ((((ocupacion join ocupante_militar on((ocupacion.IDOCUPANTE = ocupante_militar.IDPERSONA))) join departamento on((ocupacion.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join persona on((ocupante_militar.IDPERSONA = persona.IDPERSONA))) join edificio on((departamento.IDEDIFICIO = edificio.IDEDIFICIO))) where (isnull(ocupacion.FECHARETIRO) and (persona.TIPO = _utf8'OCUP_MIL')) ;


-- Dumping structure for view zzz.vw_pagados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_pagados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_pagados` AS select vw_pago_prov_sinfact.IDPROVEEDOR AS IDPROVEEDOR,pago.FECHA_PAGO AS FECHA_PAGO,pago.IMPORTE AS IMPORTE,pago.TIPO_PAGO AS TIPO_PAGO,pago.NRO_CHEQUE AS NRO_CHEQUE,pago.COBRADO AS COBRADO,pago.IDPAGO AS IDPAGO,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,(personal.APELLIDO or _utf8', ' or personal.NOMBRE) AS PERSONAL,pago.IDPERSONAL AS IDPERSONAL from (((pago join vw_pago_prov_sinfact on((pago.IDPAGO = vw_pago_prov_sinfact.IDPAGO))) left join personal on((pago.IDPERSONAL = personal.IDPERSONAL))) join proveedor on((vw_pago_prov_sinfact.IDPROVEEDOR = proveedor.IDPROVEEDOR))) ;


-- Dumping structure for view zzz.vw_pagos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_pagos`;
CREATE VIEW `vw_pagos` AS SELECT GASTO_AD.IDGASTO_AD, GASTO_AD.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, SUM( Gasto_ad.COSTO )
FROM GASTO_AD Gasto_ad
   LEFT OUTER JOIN PROVEEDOR Proveedor
   ON  (Gasto_ad.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
WHERE  Gasto_ad.PAGADO = 'No'
GROUP BY GASTO_AD.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, GASTO_AD.IDGASTO_AD
UNION
SELECT SERV_EDIF.IDSERV_EDIF, SERV_EDIF.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, SUM( SERV_EDIF.COSTO )
FROM SERV_EDIF
   LEFT OUTER JOIN PROVEEDOR Proveedor
   ON  (SERV_EDIF.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
WHERE  SERV_EDIF.PAGADO = 'No'
GROUP BY SERV_EDIF.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, SERV_EDIF.IDSERV_EDIF
UNION
SELECT TRABAJO.IDTRABAJO, TRABAJO.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, SUM( TRABAJO.COSTO )
FROM TRABAJO
   LEFT OUTER JOIN PROVEEDOR Proveedor
   ON  (TRABAJO.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
WHERE  TRABAJO.PAGADO = 'No' AND NOT FECHA_FIN IS NULL
GROUP BY TRABAJO.IDPROVEEDOR, Proveedor.RAZON_SOCIAL, TRABAJO.IDTRABAJO ;


-- Dumping structure for view zzz.vw_pagos_efectuados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_pagos_efectuados`;
CREATE VIEW `vw_pagos_efectuados` AS SELECT Pago.IDPAGO, Pago.FECHA_PAGO, Pago.IMPORTE, Pago.TIPO_PAGO, Pago.NRO_CHEQUE, Pago.COBRADO, Proveedor.RAZON_SOCIAL, Personal.APELLIDO || ' ' || Personal.NOMBRE
FROM PAGO Pago
   INNER JOIN VW_IMPORTE_POR_IDPAGO_TOTAL Vw_importe_por_idpago_total
   ON  (Pago.IDPAGO = Vw_importe_por_idpago_total.IDPAGO)
   LEFT OUTER JOIN PERSONAL Personal
   ON  (Pago.IDPERSONAL = Personal.IDPERSONAL)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Vw_importe_por_idpago_total.IDPROVEEDOR = Proveedor.IDPROVEEDOR) ;


-- Dumping structure for view zzz.vw_pago_prov
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_pago_prov`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_pago_prov` AS select distinct trabajo.IDPAGO AS IDPAGO,trabajo.IDPROVEEDOR AS IDPROVEEDOR,trabajo.NRO_FACT AS NRO_FACT from trabajo where (trabajo.IDPAGO is not null) union select distinct gasto_ad.IDPAGO AS IDPAGO,gasto_ad.IDPROVEEDOR AS IDPROVEEDOR,gasto_ad.NRO_FACT AS NRO_FACT from gasto_ad where (gasto_ad.IDPAGO is not null) union select distinct serv_edif.IDPAGO AS IDPAGO,serv_edif.IDPROVEEDOR AS IDPROVEEDOR,serv_edif.NRO_FACT AS NRO_FACT from serv_edif where (serv_edif.IDPAGO is not null) ;


-- Dumping structure for view zzz.vw_pago_prov_sinfact
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_pago_prov_sinfact`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_pago_prov_sinfact` AS select distinct trabajo.IDPAGO AS IDPAGO,trabajo.IDPROVEEDOR AS IDPROVEEDOR from trabajo where (trabajo.IDPAGO is not null) union select distinct gasto_ad.IDPAGO AS IDPAGO,gasto_ad.IDPROVEEDOR AS IDPROVEEDOR from gasto_ad where (gasto_ad.IDPAGO is not null) union select distinct serv_edif.IDPAGO AS IDPAGO,serv_edif.IDPROVEEDOR AS IDPROVEEDOR from serv_edif where (serv_edif.IDPAGO is not null) ;


-- Dumping structure for view zzz.vw_personas
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_personas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_personas` AS select persona.IDPERSONA AS IDPERSONA,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS NOMBRE,persona.TIPO AS TIPO,persona.TIPODOCUMENTO AS TIPODOCUMENTO,persona.NRODOCUMENTO AS NRODOCUMENTO from persona ;


-- Dumping structure for view zzz.vw_personas_2
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_personas_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_personas_2` AS select persona.IDPERSONA AS IDOCUPANTE,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,_utf8'Personal militar' AS TIPO,ocupante_militar.MATRICULA AS MATRICULA from (persona join ocupante_militar on((persona.IDPERSONA = ocupante_militar.IDPERSONA))) where (persona.TIPO = _utf8'OCUP_MIL') union select persona.IDPERSONA AS IdPersona,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,_utf8'Personal civil' AS `Personal civil`,ocupante_civil.LEGAJO AS legajo from (persona join ocupante_civil on((persona.IDPERSONA = ocupante_civil.IDPERSONA))) where (persona.TIPO = _utf8'OCUP_CIV') union select persona.IDPERSONA AS IdPersona,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,_utf8'Particular' AS Particular,_utf8'' AS MATRICULA from persona where (persona.TIPO = _utf8'OCUP_PART') union select persona.IDPERSONA AS IdPersona,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,_utf8'Militar no ocupante' AS TIPO,militar_no_ocupante.MATRICULA AS matricula from (persona join militar_no_ocupante on((persona.IDPERSONA = militar_no_ocupante.IDPERSONA))) where (persona.TIPO = _utf8'MIL_NO_OCUP') ;


-- Dumping structure for view zzz.vw_recibos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_recibos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_recibos` AS select recibo.IDRECIBO AS IDRECIBO,recibo.FECHA_EMISION AS FECHA_EMISION,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS OCUPANTE,recibo.FECHA_INICIO AS FECHA_INICIO,recibo.FECHA_FIN AS FECHA_FIN,recibo.MONTO_MANTENIMIENTO AS MONTO_MANT,recibo.MONTO_EXPENSAS AS MONTO_EXP,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS DEPTO,_utf8'No' AS ANULADO,recibo.NRO_RECIBO AS NRO_RECIBO from (((recibo join edificio on((recibo.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((recibo.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join persona on((recibo.IDPERSONA = persona.IDPERSONA))) where (not(recibo.IDRECIBO in (select recibo_anulado.IDRECIBO_ANULADO AS IDRECIBO_ANULADO from recibo_anulado))) union select recibo.IDRECIBO AS IDRECIBO,recibo.FECHA_EMISION AS FECHA_EMISION,(persona.APELLIDO or _utf8' ' or persona.NOMBRE) AS `(Persona.APELLIDO || ' ')  || Persona.NOMBRE`,recibo.FECHA_INICIO AS FECHA_INICIO,recibo.FECHA_FIN AS FECHA_FIN,recibo.MONTO_MANTENIMIENTO AS MONTO_MANTENIMIENTO,recibo.MONTO_EXPENSAS AS MONTO_EXPENSAS,(edificio.DESCRIPCION or _utf8' ' or departamento.DESCRIPCION) AS `(Edificio.DESCRIPCION || ' ')  || Departamento.DESCRIPCION`,_utf8'Si' AS ANULADO,recibo.NRO_RECIBO AS nro_recibo from (((recibo join edificio on((recibo.IDEDIFICIO = edificio.IDEDIFICIO))) join departamento on((recibo.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join persona on((recibo.IDPERSONA = persona.IDPERSONA))) where recibo.IDRECIBO in (select recibo_anulado.IDRECIBO_ANULADO AS IDRECIBO_ANULADO from recibo_anulado) ;


-- Dumping structure for view zzz.vw_resumen_deci_mant
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_resumen_deci_mant`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_resumen_deci_mant` AS select vw_cuenta_mant.EDIFICIO AS EDIFICIO,vw_cuenta_mant.FECHA AS FECHA,sum(vw_cuenta_mant.COSTO) AS IMPORTE_EFEC,0 AS IMPORTE_RAE from vw_cuenta_mant where (vw_cuenta_mant.TIPOPAGO = _utf8'E') group by vw_cuenta_mant.EDIFICIO,vw_cuenta_mant.FECHA union select vw_cuenta_mant.EDIFICIO AS EDIFICIO,vw_cuenta_mant.FECHA AS FECHA,0 AS IMPORTE_EFEC,sum(vw_cuenta_mant.COSTO) AS IMPORTE_RAE from vw_cuenta_mant where (vw_cuenta_mant.TIPOPAGO = _utf8'R') group by vw_cuenta_mant.EDIFICIO,vw_cuenta_mant.FECHA ;


-- Dumping structure for view zzz.vw_resumen_deci_serv
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_resumen_deci_serv`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_resumen_deci_serv` AS select vw_serv_edif.EDIFICIO AS EDIFICIO,vw_serv_edif.FECHA AS FECHA,sum(vw_serv_edif.COSTO) AS IMPORTE_EFEC,0 AS IMPORTE_CHEQUE from vw_serv_edif where ((vw_serv_edif.TIPO_PAGO = _utf8'E') and (vw_serv_edif.VACIOS = _utf8'No')) group by vw_serv_edif.EDIFICIO,vw_serv_edif.FECHA union select vw_serv_edif.EDIFICIO AS EDIFICIO,vw_serv_edif.FECHA AS FECHA,0 AS IMPORTE_EFEC,sum(vw_serv_edif.COSTO) AS IMPORTE_CHEQUE from vw_serv_edif where ((vw_serv_edif.TIPO_PAGO = _utf8'C') and (vw_serv_edif.VACIOS = _utf8'No')) group by vw_serv_edif.EDIFICIO,vw_serv_edif.FECHA ;


-- Dumping structure for view zzz.vw_resumen_desc_civ
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_resumen_desc_civ`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_resumen_desc_civ` AS select vw_descuentos_civiles.OCUPANTE AS OCUPANTE,vw_descuentos_civiles.MR AS MR,vw_descuentos_civiles.GRADO AS GRADO,vw_descuentos_civiles.MES AS MES,vw_descuentos_civiles.ANIO AS ANIO,sum(vw_descuentos_civiles.ALQUILER) AS ALQUILER,sum(vw_descuentos_civiles.RAE) AS RAE,sum(vw_descuentos_civiles.EXPENSAS) AS EXPENSAS from vw_descuentos_civiles group by vw_descuentos_civiles.OCUPANTE,vw_descuentos_civiles.MR,vw_descuentos_civiles.GRADO,vw_descuentos_civiles.MES,vw_descuentos_civiles.ANIO ;


-- Dumping structure for view zzz.vw_resumen_desc_mil
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_resumen_desc_mil`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_resumen_desc_mil` AS select vw_descuentos_militares.OCUPANTE AS OCUPANTE,vw_descuentos_militares.MR AS MR,vw_descuentos_militares.GRADO AS GRADO,vw_descuentos_militares.MES AS MES,vw_descuentos_militares.ANIO AS ANIO,sum(vw_descuentos_militares.ALQUILER) AS ALQUILER,sum(vw_descuentos_militares.RAE) AS RAE,sum(vw_descuentos_militares.EXPENSAS) AS EXPENSAS from vw_descuentos_militares group by vw_descuentos_militares.OCUPANTE,vw_descuentos_militares.MR,vw_descuentos_militares.GRADO,vw_descuentos_militares.MES,vw_descuentos_militares.ANIO ;


-- Dumping structure for view zzz.vw_serv_edif
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_serv_edif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_serv_edif` AS select serv_edif.IDEDIFICIO AS IDEDIFICIO,serv_edif.FECHA_PAGO AS FECHA,serv_edif.COSTO AS COSTO,servicio.DESCRIP AS DESCRIP,serv_edif.IDSERVICIO AS IDSERVICIO,serv_edif.IDPROVEEDOR AS IDPROVEEDOR,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,serv_edif.IDSERV_EDIF AS IDSERV_EDIF,serv_edif.PAGADO AS PAGADO,pago.TIPO_PAGO AS TIPO_PAGO,pago.NRO_CHEQUE AS NRO_CHEQUE,serv_edif.IDPAGO AS IDPAGO,serv_edif.NRO_DECI AS NRO_DECI,serv_edif.NRO_ORDEN AS NRO_ORDEN,serv_edif.VACIOS AS VACIOS,pago.FECHA_PAGO AS FECHA_PAGO,edificio.DESCRIPCION AS EDIFICIO,serv_edif.NRO_FACT AS NRO_FACT,serv_edif.A_PAGAR_OCUPANTE AS A_PAGAR_OCUPANTE from ((((serv_edif join servicio on((serv_edif.IDSERVICIO = servicio.IDSERVICIO))) left join proveedor on((serv_edif.IDPROVEEDOR = proveedor.IDPROVEEDOR))) left join pago on((serv_edif.IDPAGO = pago.IDPAGO))) join edificio on((serv_edif.IDEDIFICIO = edificio.IDEDIFICIO))) ;


-- Dumping structure for view zzz.vw_trabajos
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_trabajos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_trabajos` AS select trabajo.IDTRABAJO AS IDTRABAJO,trabajo.NRO_PEDIDO AS NRO_PEDIDO,trab_depto.IDDEPARTAMENTO AS IDDEPARTAMENTO,trabajo.FECHA_INI AS FECHA_INI,trabajo.FECHA_FIN AS FECHA_FIN,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,trabajo.COSTO AS COSTO,trabajo.IMPUTACION AS IMPUTACION,categoria.DESCRIP AS DESCRIP,dapartamento.IDEDIFICIO AS IDEDIF,pago.TIPO_PAGO AS TIPO_PAGO,pago.NRO_CHEQUE AS NRO_CHEQUE,trabajo.PAGADO AS PAGADO,trabajo.NRO_FACT AS NRO_FACTURA,edificio.DESCRIPCION AS EDIFICIO,(edificio.DESCRIPCION or _utf8'  ' or dapartamento.DESCRIPCION) AS DESC_DEPTO,trabajo.NRO_DECI AS NRO_DECI,trabajo.NRO_ORDEN AS NRO_ORDEN from ((((((trabajo join trab_depto on((trabajo.IDTRABAJO = trab_depto.IDTRABAJO))) left join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) left join categoria on((trabajo.IDCATEGORIA = categoria.IDCATEGORIA))) left join pago on((trabajo.IDPAGO = pago.IDPAGO))) join departamento dapartamento on((trab_depto.IDDEPARTAMENTO = dapartamento.IDDEPARTAMENTO))) join edificio on((dapartamento.IDEDIFICIO = edificio.IDEDIFICIO))) ;


-- Dumping structure for view zzz.vw_trabajos_completa
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_trabajos_completa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_trabajos_completa` AS select trabajo.IDTRABAJO AS IDTRABAJO,trabajo.NRO_PEDIDO AS NROPEDIDO,trabajo.FECHA_FIN AS FECHA_FIN,edificio.DESCRIPCION AS EDIFICO,edificio.IDEDIFICIO AS IDEDIFICIO,departamento.DESCRIPCION AS LUGAR,proveedor.RAZON_SOCIAL AS PROVEEDOR,trabajo.NRO_FACT AS NROFACTURA from ((((edificio join departamento on((departamento.IDEDIFICIO = edificio.IDEDIFICIO))) join trab_depto on((trab_depto.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) join trabajo on((trab_depto.IDTRABAJO = trabajo.IDTRABAJO))) join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) union select trabajo.IDTRABAJO AS IDTRABAJO,trabajo.NRO_PEDIDO AS NroPedido,trabajo.FECHA_FIN AS FECHA_FIN,edificio.DESCRIPCION AS Edifico,edificio.IDEDIFICIO AS IDEDIFICIO,tipo_espacio.DESCRIP AS Lugar,proveedor.RAZON_SOCIAL AS Proveedor,trabajo.NRO_FACT AS NroFactura from ((((trab_edif join edificio on((trab_edif.IDEDIFICIO = edificio.IDEDIFICIO))) join tipo_espacio on((trab_edif.IDTIPO_ESPACIO = tipo_espacio.IDTIPO_ESPACIO))) join trabajo on((trab_edif.IDTRABAJO = trabajo.IDTRABAJO))) join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) ;


-- Dumping structure for view zzz.vw_trab_edif
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_trab_edif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_trab_edif` AS select trabajo.IDTRABAJO AS IDTRABAJO,trabajo.NRO_PEDIDO AS NRO_PEDIDO,trabajo.FECHA_INI AS FECHA_INI,trabajo.FECHA_FIN AS FECHA_FIN,trabajo.COSTO AS COSTO,trabajo.IMPUTACION AS IMPUTACION,trab_edif.IDEDIFICIO AS IDEDIFICIO,tipo_espacio.DESCRIP AS ESPACIO,proveedor.RAZON_SOCIAL AS RAZON_SOCIAL,trabajo.NRO_FACT AS NRO_FACTURA,categoria.DESCRIP AS DESCRIP,edificio.DESCRIPCION AS EDIFICIO,trabajo.PAGADO AS PAGADO,trabajo.NRO_DECI AS NRO_DECI,trabajo.NRO_ORDEN AS NRO_ORDEN,pago.TIPO_PAGO AS TIPO_PAGO from ((((((trabajo join trab_edif on((trabajo.IDTRABAJO = trab_edif.IDTRABAJO))) left join proveedor on((trabajo.IDPROVEEDOR = proveedor.IDPROVEEDOR))) left join categoria on((trabajo.IDCATEGORIA = categoria.IDCATEGORIA))) left join pago on((trabajo.IDPAGO = pago.IDPAGO))) join tipo_espacio on((trab_edif.IDTIPO_ESPACIO = tipo_espacio.IDTIPO_ESPACIO))) join edificio on((trab_edif.IDEDIFICIO = edificio.IDEDIFICIO))) ;


-- Dumping structure for view zzz.vw_trab_no_pagados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_trab_no_pagados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_trab_no_pagados` AS select trabajo.IDTRABAJO AS IDTRABAJO,trabajo.NRO_PEDIDO AS NRO_PEDIDO,trabajo.FECHA_FIN AS FECHA,trabajo.COSTO AS COSTO,trabajo.IDPROVEEDOR AS IDPROVEEDOR,departamento.IDEDIFICIO AS IDEDIFICIO,trabajo.TIPO_TRAB AS TIPO_TRAB from ((trabajo join trab_depto on((trabajo.IDTRABAJO = trab_depto.IDTRABAJO))) join departamento on((trab_depto.IDDEPARTAMENTO = departamento.IDDEPARTAMENTO))) where (trabajo.PAGADO = _utf8'No') union select trabajo.IDTRABAJO AS IDTRABAJO,trabajo.NRO_PEDIDO AS NRO_PEDIDO,trabajo.FECHA_FIN AS FECHA_FIN,trabajo.COSTO AS COSTO,trabajo.IDPROVEEDOR AS IDPROVEEDOR,trab_edif.IDEDIFICIO AS IDEDIFICIO,trabajo.TIPO_TRAB AS TIPO_TRAB from (trabajo join trab_edif on((trabajo.IDTRABAJO = trab_edif.IDTRABAJO))) where (trabajo.PAGADO = _utf8'No') ;


-- Dumping structure for view zzz.vw_trab_pagados
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_trab_pagados`;
CREATE VIEW `vw_trab_pagados` AS SELECT Trabajo.IDTRABAJO, Trabajo.IDPAGO,   ( ('Factura Nº ' || Trabajo.NRO_FACT ) || ' - ')  || Categoria.DESCRIP , Trabajo.COSTO, Trabajo.FECHA_FIN, DEPARTAMENTO.IDEDIFICIO, Trabajo.TIPO_TRAB, Trabajo.NRO_DECI, TRABAJO.NRO_ORDEN, Proveedor.RAZON_SOCIAL, Pago.TIPO_PAGO, Pago.NRO_CHEQUE
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
WHERE  Trabajo.PAGADO = 'Sí'
UNION
SELECT Trabajo.IDTRABAJO, Trabajo.IDPAGO,   ( ('Factura Nº ' || Trabajo.NRO_FACT ) || ' - ')  || Categoria.DESCRIP , Trabajo.COSTO, Trabajo.FECHA_FIN, Trab_edif.IDEDIFICIO, Trabajo.TIPO_TRAB, Trabajo.NRO_DECI, TRABAJO.NRO_ORDEN, Proveedor.RAZON_SOCIAL, Pago.TIPO_PAGO, Pago.NRO_CHEQUE
FROM TRABAJO Trabajo
   INNER JOIN CATEGORIA Categoria
   ON  (Trabajo.IDCATEGORIA = Categoria.IDCATEGORIA)
   INNER JOIN TRAB_EDIF Trab_edif
   ON  (Trabajo.IDTRABAJO = Trab_edif.IDTRABAJO)
   INNER JOIN PAGO Pago
   ON  (Trabajo.IDPAGO = Pago.IDPAGO)
   INNER JOIN PROVEEDOR Proveedor
   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)
WHERE  Trabajo.PAGADO = 'Sí' ;


-- Dumping structure for view zzz.vw_trab_tareas
-- Removing temporary table and create final VIEW structure
DROP VIEW IF EXISTS `vw_trab_tareas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vw_trab_tareas` AS select trab_tarea.IDTRABAJO AS IDTRABAJO,tarea.IDTAREA AS IDTAREA,tarea.DESCRIP AS DESCRIP from (trab_tarea join tarea on((trab_tarea.IDTAREA = tarea.IDTAREA))) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2017 a las 23:05:47
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admintel_bones`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cant_activos_x_edif`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cant_activos_x_edif` (
`IDEDIFICIO` int(11)
,`CANT_ACTIVOS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cant_ocupados_x_edif`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cant_ocupados_x_edif` (
`IDEDIFICIO` int(11)
,`CANT_OCUPADOS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cheques_dep`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cheques_dep` (
`FECHA_PAGO` timestamp
,`NRO_CHEQUE` varchar(20)
,`IMPORTE_MANT` float
,`IMPORTE_SERV` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cheques_devueltos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cheques_devueltos` (
`PROVEEDOR` varchar(45)
,`FECHA_PAGO` timestamp
,`TIPO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`IMPORTE` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cheques_emitidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cheques_emitidos` (
`IDPAGO` int(11)
,`FECHA` timestamp
,`IMPORTE` float
,`NROCHEQUE` varchar(20)
,`COBRADO` varchar(2)
,`PROVEEDOR` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cheques_no_cobrados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cheques_no_cobrados` (
`FECHA_PAGO` timestamp
,`IMPORTE` float
,`PROVEEDOR` varchar(45)
,`NRO_CHEQUE` varchar(20)
,`COBRADO` varchar(2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cobros_part`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cobros_part` (
`IDPERSONA` int(11)
,`OCUPANTE` int(1)
,`DOCUMENTO` int(1)
,`MES` varchar(10)
,`ANIO` int(11)
,`EXPENSAS` float
,`RAE` double
,`ALQUILER` double
,`EDIFICIO` varchar(50)
,`DEPTO` varchar(60)
,`LOCACION` int(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_creditos_bancarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_creditos_bancarios` (
`FECHA_PAGO` timestamp
,`DESCRIP` varchar(50)
,`COSTO` float
,`IDCREDITO_BANCARIO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_cuenta_mant`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_cuenta_mant` (
`FECHA` timestamp
,`RUBRO` varchar(45)
,`NROTRABAJO` int(11)
,`PROVEEDOR` varchar(45)
,`TIPOPAGO` varchar(1)
,`IMPORTE` float
,`NROCHEQUE` varchar(20)
,`IDEDIF` int(11)
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
,`NROFACTURA` int(11)
,`COSTO` float
,`EDIFICIO` varchar(50)
,`DESCRIP` varchar(60)
,`IMPUTACION` varchar(2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_deptosvacios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_deptosvacios` (
`IDDEPARTAMENTO` int(11)
,`IDEDIFICIO` int(11)
,`TIPO` varchar(5)
,`DESCRIPLARGA` int(1)
,`DESCRIPCORTA` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_descuento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_descuento` (
`APELLIDO` varchar(15)
,`NOMBRE` varchar(25)
,`DESCRIPCION` varchar(25)
,`MES` varchar(10)
,`ANIO` int(11)
,`MONTO` float
,`IDOCUPANTE` int(11)
,`IDTIPODESCUENTO` int(11)
,`IDDESCUENTO` int(11)
,`MR` varchar(10)
,`CODDESC` int(11)
,`IDEDIFICIO` int(11)
,`EDIFICIO` varchar(50)
,`TIPOPAGO` varchar(2)
,`GRADO` varchar(2)
,`ESPECIALIDAD` varchar(3)
,`APENOM` bigint(20)
,`DEPTO` varchar(60)
,`TIPOPERS` varchar(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_descuentos_civiles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_descuentos_civiles` (
`OCUPANTE` bigint(20)
,`IDTIPODESCUENTO` int(11)
,`MES` varchar(10)
,`ANIO` int(11)
,`ALQUILER` float
,`RAE` double
,`EXPENSAS` double
,`MR` varchar(10)
,`GRADO` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_descuentos_militares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_descuentos_militares` (
`OCUPANTE` bigint(20)
,`MR` varchar(8)
,`GRADO` varchar(2)
,`IDTIPODESCUENTO` int(11)
,`MES` varchar(10)
,`ANIO` int(11)
,`ALQUILER` float
,`RAE` double
,`EXPENSAS` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_det_pagados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_det_pagados` (
`ID` int(11)
,`IDPAGO` int(11)
,`FECHA` timestamp
,`DESCRIP` varchar(60)
,`IMPORTE` float
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
,`NRO_FACT` int(11)
,`TIPO` varchar(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_det_tareas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_det_tareas` (
`DESCRIP` varchar(150)
,`FECHA_FIN` timestamp
,`RAZON_SOCIAL` varchar(45)
,`EDIFICO` varchar(50)
,`IDEDIFICIO` int(11)
,`LUGAR` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_deudas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_deudas` (
`IDPROVEEDOR` int(11)
,`PROVEEDOR` varchar(45)
,`IMPORTE` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_deudores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_deudores` (
`COSTO` float
,`NRO_FACT` int(11)
,`IDPERSONA` int(11)
,`OCUPANTE` bigint(20)
,`TIPO` varchar(19)
,`MATRICULA` varchar(10)
,`FECHA_PAGO` timestamp
,`DESCRIP` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_edificios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_edificios` (
`IDEDIFICIO` int(11)
,`IDOCUPANTEJEFE` int(11)
,`DIRECCION` varchar(45)
,`ADMFISCAL` tinyint(1)
,`OBSERVACIONES` varchar(200)
,`DESCRIPCION` varchar(50)
,`JEFEMILITAR` int(11)
,`ECONOMO` int(11)
,`COEFICIENTE` decimal(9,2)
,`CANT_DEPTOS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_espacios_comunes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_espacios_comunes` (
`IDTIPO_ESPACIO` int(11)
,`IDEDIFICIO` int(11)
,`DESCRIP` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_gasto_ad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_gasto_ad` (
`IDGASTO_AD` int(11)
,`FECHA` timestamp
,`COSTO` float
,`DESCRIP` varchar(60)
,`IDTIPO_GASTO_AD` int(11)
,`IDPROVEEDOR` int(11)
,`RAZON_SOCIAL` varchar(45)
,`PAGADO` varchar(2)
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`IDPAGO` int(11)
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
,`FECHA_PAGO` timestamp
,`NRO_FACT` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_gasto_fi`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_gasto_fi` (
`IDGASTO_FI` int(11)
,`FECHA` timestamp
,`COSTO` float
,`DESCRIP` varchar(60)
,`IDTIPO_GASTO_FI` int(11)
,`NRO_HOJA` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_importe_por_idpago`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_importe_por_idpago` (
`IDPAGO` int(11)
,`IDPROVEEDOR` int(11)
,`IMPORTE` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_importe_por_idpago_total`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_importe_por_idpago_total` (
`IDPAGO` int(11)
,`IDPROVEEDOR` int(11)
,`IMPORTE` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ingresos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ingresos` (
`IDINGRESO` int(11)
,`IDTIPO_INGRESO` int(11)
,`CONCEPTO` varchar(60)
,`FECHA` timestamp
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`NRO_RECIBO` int(11)
,`IMPORTE_MANT` float
,`SR` varchar(45)
,`IMPORTE_SERV` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_mat_usados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_mat_usados` (
`IDTRABAJO` int(11)
,`CANTIDAD` float
,`IDMATERIAL` int(11)
,`DESCRIP` varchar(45)
,`NROPEDIDO` int(11)
,`ABREV` varchar(15)
,`FECHA_FIN` timestamp
,`EDIFICO` varchar(50)
,`IDEDIFICIO` int(11)
,`LUGAR` varchar(60)
,`PROVEEDOR` varchar(45)
,`NROFACTURA` int(11)
,`IDUNIDAD` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupacion` (
`NOMBRE` varchar(25)
,`APELLIDO` varchar(15)
,`DESCRIPCIONED` varchar(50)
,`DESCRIPCIONDEPT` varchar(60)
,`FECHAINI` timestamp
,`FECHAFIN` timestamp
,`FECHARETIRO` timestamp
,`IDEDIFICIO` int(11)
,`IDDEPARTAMENTO` int(11)
,`IDOCUPANTE` int(11)
,`IDOCUPACION` int(11)
,`OCUPANTE` int(1)
,`LOCACION` int(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupantes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupantes` (
`IDPERSONA` int(11)
,`NOMBRE` bigint(20)
,`TIPO` varchar(19)
,`MATRICULA` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupantes_actuales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupantes_actuales` (
`IDOCUPANTE` int(11)
,`OCUPANTE` bigint(20)
,`TIPO` varchar(16)
,`LOCACION` bigint(20)
,`FECHAINI` timestamp
,`FECHAFIN` timestamp
,`IDEDIFICIO` int(11)
,`IDDEPARTAMENTO` int(11)
,`MATRICULA` varchar(10)
,`UNIDAD` varchar(60)
,`TEL_UNIDAD` varchar(20)
,`GRADO` varchar(10)
,`DESTINO` varchar(30)
,`TEL_DESTINO` varchar(6)
,`IDGARANTE` bigint(20)
,`PARENTEZCO` varchar(15)
,`GARANTE` varchar(20)
,`DNI` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupantes_civiles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupantes_civiles` (
`IDPERSONA` int(11)
,`NOMBRE` int(1)
,`TIPO` varchar(14)
,`MATRICULA` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupantes_historicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupantes_historicos` (
`IDOCUPANTE` int(11)
,`OCUPANTE` int(1)
,`TIPO` enum('OCUP_CIV','OCUP_MIL','OCUP_PART','MIL_NO_OCUP')
,`LOCACION` int(1)
,`FECHAINI` timestamp
,`FECHAFIN` timestamp
,`FECHARETIRO` timestamp
,`IDEDIFICIO` int(11)
,`IDDEPARTAMENTO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupantes_militares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupantes_militares` (
`IDPERSONA` int(11)
,`NOMBRE` int(1)
,`TIPO` varchar(16)
,`MATRICULA` varchar(8)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocupantes_particulares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocupantes_particulares` (
`IDPERSONA` int(11)
,`NOMBRE` int(1)
,`TIPO` varchar(10)
,`MATRICULA` varchar(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocup_civ_actuales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocup_civ_actuales` (
`IDOCUPANTE` int(11)
,`OCUPANTE` int(1)
,`LOCACION` int(1)
,`FECHAINI` timestamp
,`FECHAFIN` timestamp
,`IDEDIFICIO` int(11)
,`IDDEPARTAMENTO` int(11)
,`LEGAJO` varchar(10)
,`SUELDO` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_ocup_mil_actuales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_ocup_mil_actuales` (
`IDPERSONA` int(11)
,`TIPO` varchar(5)
,`CANTAMB` int(11)
,`MATRICULA` varchar(8)
,`IDGRADO` int(11)
,`ANTGRADO` int(11)
,`FECHA_INGRESO` timestamp
,`RENTAPROPIA` float
,`ANT_SERVICIO` int(11)
,`IDEDIFICIO` int(11)
,`EDIFICIO` varchar(50)
,`DEPTO` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pagados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pagados` (
`IDPROVEEDOR` int(11)
,`FECHA_PAGO` timestamp
,`IMPORTE` float
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`COBRADO` varchar(2)
,`IDPAGO` int(11)
,`RAZON_SOCIAL` varchar(45)
,`PERSONAL` int(1)
,`IDPERSONAL` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pagos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pagos` (
`ID` int(11)
,`IDPROVEEDOR` int(11)
,`PROVEEDOR` varchar(45)
,`IMPORTE` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pagos_efectuados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pagos_efectuados` (
`IDPAGO` int(11)
,`FECHA_PAGO` timestamp
,`IMPORTE` float
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`COBRADO` varchar(2)
,`PROVEEDOR` varchar(45)
,`COBRADOR` int(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pago_prov`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pago_prov` (
`IDPAGO` int(11)
,`IDPROVEEDOR` int(11)
,`NRO_FACT` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pago_prov_sinfact`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pago_prov_sinfact` (
`IDPAGO` int(11)
,`IDPROVEEDOR` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_personas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_personas` (
`IDPERSONA` int(11)
,`NOMBRE` int(1)
,`TIPO` enum('OCUP_CIV','OCUP_MIL','OCUP_PART','MIL_NO_OCUP')
,`TIPODOCUMENTO` varchar(5)
,`NRODOCUMENTO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_personas_2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_personas_2` (
`IDOCUPANTE` int(11)
,`OCUPANTE` bigint(20)
,`TIPO` varchar(19)
,`MATRICULA` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_recibos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_recibos` (
`IDRECIBO` int(11)
,`FECHA_EMISION` timestamp
,`OCUPANTE` bigint(20)
,`FECHA_INICIO` timestamp
,`FECHA_FIN` timestamp
,`MONTO_MANT` float
,`MONTO_EXP` float
,`DEPTO` bigint(20)
,`ANULADO` varchar(2)
,`NRO_RECIBO` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_deci_mant`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_deci_mant` (
`EDIFICIO` varchar(50)
,`FECHA` timestamp
,`IMPORTE_EFEC` double
,`IMPORTE_RAE` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_deci_serv`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_deci_serv` (
`EDIFICIO` varchar(50)
,`FECHA` timestamp
,`IMPORTE_EFEC` double
,`IMPORTE_CHEQUE` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_desc_civ`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_desc_civ` (
`OCUPANTE` bigint(20)
,`MR` varchar(10)
,`GRADO` varchar(10)
,`MES` varchar(10)
,`ANIO` int(11)
,`ALQUILER` double
,`RAE` double
,`EXPENSAS` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_desc_mil`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_desc_mil` (
`OCUPANTE` bigint(20)
,`MR` varchar(8)
,`GRADO` varchar(2)
,`MES` varchar(10)
,`ANIO` int(11)
,`ALQUILER` double
,`RAE` double
,`EXPENSAS` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_serv_edif`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_serv_edif` (
`IDEDIFICIO` int(11)
,`FECHA` timestamp
,`COSTO` float
,`DESCRIP` varchar(60)
,`IDSERVICIO` int(11)
,`IDPROVEEDOR` int(11)
,`RAZON_SOCIAL` varchar(45)
,`IDSERV_EDIF` int(11)
,`PAGADO` varchar(2)
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`IDPAGO` int(11)
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
,`VACIOS` varchar(2)
,`FECHA_PAGO` timestamp
,`EDIFICIO` varchar(50)
,`NRO_FACT` int(11)
,`A_PAGAR_OCUPANTE` varchar(2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_trabajos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_trabajos` (
`IDTRABAJO` int(11)
,`NRO_PEDIDO` int(11)
,`IDDEPARTAMENTO` int(11)
,`FECHA_INI` timestamp
,`FECHA_FIN` timestamp
,`RAZON_SOCIAL` varchar(45)
,`COSTO` float
,`IMPUTACION` varchar(2)
,`DESCRIP` varchar(45)
,`IDEDIF` int(11)
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
,`PAGADO` varchar(2)
,`NRO_FACTURA` int(11)
,`EDIFICIO` varchar(50)
,`DESC_DEPTO` int(1)
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_trabajos_completa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_trabajos_completa` (
`IDTRABAJO` int(11)
,`NROPEDIDO` int(11)
,`FECHA_FIN` timestamp
,`EDIFICO` varchar(50)
,`IDEDIFICIO` int(11)
,`LUGAR` varchar(60)
,`PROVEEDOR` varchar(45)
,`NROFACTURA` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_trab_edif`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_trab_edif` (
`IDTRABAJO` int(11)
,`NRO_PEDIDO` int(11)
,`FECHA_INI` timestamp
,`FECHA_FIN` timestamp
,`COSTO` float
,`IMPUTACION` varchar(2)
,`IDEDIFICIO` int(11)
,`ESPACIO` varchar(60)
,`RAZON_SOCIAL` varchar(45)
,`NRO_FACTURA` int(11)
,`DESCRIP` varchar(45)
,`EDIFICIO` varchar(50)
,`PAGADO` varchar(2)
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
,`TIPO_PAGO` varchar(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_trab_no_pagados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_trab_no_pagados` (
`IDTRABAJO` int(11)
,`NRO_PEDIDO` int(11)
,`FECHA` timestamp
,`COSTO` float
,`IDPROVEEDOR` int(11)
,`IDEDIFICIO` int(11)
,`TIPO_TRAB` varchar(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_trab_pagados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_trab_pagados` (
`IDTRABAJO` int(11)
,`IDPAGO` int(11)
,`DESCRIP` bigint(20)
,`IMPORTE` float
,`FECHA` timestamp
,`IDEDIFICIO` int(11)
,`TIPO_TRAB` varchar(1)
,`NRO_DECI` int(11)
,`NRO_ORDEN` int(11)
,`RAZON_SOCIAL` varchar(45)
,`TIPO_PAGO` varchar(1)
,`NRO_CHEQUE` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cant_activos_x_edif`
--
DROP TABLE IF EXISTS `vw_cant_activos_x_edif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cant_activos_x_edif`  AS  select `edificio`.`IDEDIFICIO` AS `IDEDIFICIO`,count(`departamento`.`IDDEPARTAMENTO`) AS `CANT_ACTIVOS` from (`edificio` left join `departamento` on(((`edificio`.`IDEDIFICIO` = `departamento`.`IDEDIFICIO`) and (`departamento`.`ACTIVO` = _utf8'SI')))) group by `edificio`.`IDEDIFICIO`,`edificio`.`IDOCUPANTEJEFE`,`edificio`.`DIRECCION`,`edificio`.`ADMFISCAL`,`edificio`.`OBSERVACIONES`,`edificio`.`DESCRIPCION`,`edificio`.`JEFEMILITAR`,`edificio`.`ECONOMO`,`edificio`.`COEFICIENTE` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cant_ocupados_x_edif`
--
DROP TABLE IF EXISTS `vw_cant_ocupados_x_edif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cant_ocupados_x_edif`  AS  select `edificio`.`IDEDIFICIO` AS `IDEDIFICIO`,count(`departamento`.`IDDEPARTAMENTO`) AS `CANT_OCUPADOS` from ((`edificio` join `departamento` on((`departamento`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `ocupacion` on(((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`) and isnull(`ocupacion`.`FECHARETIRO`)))) group by `edificio`.`IDEDIFICIO` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cheques_dep`
--
DROP TABLE IF EXISTS `vw_cheques_dep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cheques_dep`  AS  select `ingreso`.`FECHA_PAGO` AS `FECHA_PAGO`,`ingreso`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`ingreso`.`IMPORTE_MANT` AS `IMPORTE_MANT`,`ingreso`.`IMPORTE_SERV` AS `IMPORTE_SERV` from `ingreso` where (`ingreso`.`TIPO_PAGO` = _utf8'C') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cheques_devueltos`
--
DROP TABLE IF EXISTS `vw_cheques_devueltos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cheques_devueltos`  AS  select distinct `proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,`pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`cheque_devuelto`.`TIPO` AS `TIPO`,`cheque_devuelto`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`pago`.`IMPORTE` AS `IMPORTE` from (((`cheque_devuelto` join `pago` on((`pago`.`NRO_CHEQUE` = `cheque_devuelto`.`NRO_CHEQUE`))) join `vw_pago_prov` on((`vw_pago_prov`.`IDPAGO` = `pago`.`IDPAGO`))) join `proveedor` on((`vw_pago_prov`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cheques_emitidos`
--
DROP TABLE IF EXISTS `vw_cheques_emitidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cheques_emitidos`  AS  select distinct `pago`.`IDPAGO` AS `IDPAGO`,`pago`.`FECHA_PAGO` AS `FECHA`,`pago`.`IMPORTE` AS `IMPORTE`,`pago`.`NRO_CHEQUE` AS `NROCHEQUE`,`pago`.`COBRADO` AS `COBRADO`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR` from ((`pago` join `vw_pago_prov` on((`vw_pago_prov`.`IDPAGO` = `pago`.`IDPAGO`))) join `proveedor` on((`vw_pago_prov`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`pago`.`TIPO_PAGO` = _utf8'C') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cheques_no_cobrados`
--
DROP TABLE IF EXISTS `vw_cheques_no_cobrados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cheques_no_cobrados`  AS  select distinct `pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`pago`.`IMPORTE` AS `IMPORTE`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`pago`.`COBRADO` AS `COBRADO` from ((`vw_pago_prov` join `pago` on((`vw_pago_prov`.`IDPAGO` = `pago`.`IDPAGO`))) join `proveedor` on((`vw_pago_prov`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`pago`.`COBRADO` = _utf8'No') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cobros_part`
--
DROP TABLE IF EXISTS `vw_cobros_part`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cobros_part`  AS  select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,((`persona`.`TIPODOCUMENTO` <> 0) or _utf8' ' or (`persona`.`NRODOCUMENTO` <> 0)) AS `DOCUMENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,`descuento`.`MONTO` AS `EXPENSAS`,(`ocupante_particular`.`COSTOALQUILER` * 0.1) AS `RAE`,(`ocupante_particular`.`COSTOALQUILER` * 0.9) AS `ALQUILER`,`edificio`.`DESCRIPCION` AS `EDIFICIO`,`departamento`.`DESCRIPCION` AS `DEPTO`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `LOCACION` from (((((`persona` left join `descuento` on((`persona`.`IDPERSONA` = `descuento`.`IDOCUPANTE`))) join `ocupante_particular` on((`persona`.`IDPERSONA` = `ocupante_particular`.`IDPERSONA`))) join `ocupacion` on((`persona`.`IDPERSONA` = `ocupacion`.`IDOCUPANTE`))) join `edificio` on((`ocupacion`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) where ((`persona`.`TIPO` = _utf8'OCUP_PART') and isnull(`ocupacion`.`FECHARETIRO`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_creditos_bancarios`
--
DROP TABLE IF EXISTS `vw_creditos_bancarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_creditos_bancarios`  AS  select `credito_bancario`.`FECHA_PAGO` AS `FECHA_PAGO`,`credito_bancario`.`DESCRIP` AS `DESCRIP`,`credito_bancario`.`COSTO` AS `COSTO`,`credito_bancario`.`IDCREDITO_BANCARIO` AS `IDCREDITO_BANCARIO` from `credito_bancario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_cuenta_mant`
--
DROP TABLE IF EXISTS `vw_cuenta_mant`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_cuenta_mant`  AS  select `pago`.`FECHA_PAGO` AS `FECHA`,`categoria`.`DESCRIP` AS `RUBRO`,`trabajo`.`NRO_PEDIDO` AS `NROTRABAJO`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,`pago`.`TIPO_PAGO` AS `TIPOPAGO`,`pago`.`IMPORTE` AS `IMPORTE`,`pago`.`NRO_CHEQUE` AS `NROCHEQUE`,`trab_edif`.`IDEDIFICIO` AS `IDEDIF`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN`,`trabajo`.`NRO_FACT` AS `NROFACTURA`,`trabajo`.`COSTO` AS `COSTO`,`edificio`.`DESCRIPCION` AS `EDIFICIO`,`tipo_espacio`.`DESCRIP` AS `DESCRIP`,`trabajo`.`IMPUTACION` AS `IMPUTACION` from ((((((`trabajo` join `pago` on((`trabajo`.`IDPAGO` = `pago`.`IDPAGO`))) join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) left join `trab_edif` on((`trabajo`.`IDTRABAJO` = `trab_edif`.`IDTRABAJO`))) join `edificio` on((`trab_edif`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `tipo_espacio` on((`trab_edif`.`IDTIPO_ESPACIO` = `tipo_espacio`.`IDTIPO_ESPACIO`))) union select `pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`categoria`.`DESCRIP` AS `DESCRIP`,`trabajo`.`NRO_PEDIDO` AS `NRO_PEDIDO`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`IMPORTE` AS `IMPORTE`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`departamento`.`IDEDIFICIO` AS `IDEDIFICIO`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN`,`trabajo`.`NRO_FACT` AS `NRO_FACT`,`trabajo`.`COSTO` AS `COSTO`,`edificio`.`DESCRIPCION` AS `DESCRIPCION`,`departamento`.`DESCRIPCION` AS `DESCRIPCION`,`trabajo`.`IMPUTACION` AS `IMPUTACION` from ((((((`trabajo` join `trab_depto` on((`trabajo`.`IDTRABAJO` = `trab_depto`.`IDTRABAJO`))) join `pago` on((`trabajo`.`IDPAGO` = `pago`.`IDPAGO`))) join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) join `departamento` on((`trab_depto`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `edificio` on((`departamento`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_deptosvacios`
--
DROP TABLE IF EXISTS `vw_deptosvacios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_deptosvacios`  AS  select `departamento`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`departamento`.`IDEDIFICIO` AS `IDEDIFICIO`,`departamento`.`TIPO` AS `TIPO`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `DESCRIPLARGA`,`departamento`.`DESCRIPCION` AS `DESCRIPCORTA` from (`departamento` join `edificio` on((`departamento`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) where (not(`departamento`.`IDDEPARTAMENTO` in (select `vw_ocupacion`.`IDDEPARTAMENTO` AS `iddepartamento` from `vw_ocupacion` where isnull(`vw_ocupacion`.`FECHARETIRO`)))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_descuento`
--
DROP TABLE IF EXISTS `vw_descuento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_descuento`  AS  select `p`.`APELLIDO` AS `APELLIDO`,`p`.`NOMBRE` AS `NOMBRE`,`td`.`DESCRIPCION` AS `DESCRIPCION`,`d`.`MES` AS `MES`,`d`.`ANIO` AS `ANIO`,`d`.`MONTO` AS `MONTO`,`d`.`IDOCUPANTE` AS `IDOCUPANTE`,`d`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`d`.`IDDESCUENTO` AS `IDDESCUENTO`,`ocupante_militar`.`MATRICULA` AS `MR`,`td`.`CODDESC` AS `CODDESC`,`vw_ocup_mil_actuales`.`IDEDIFICIO` AS `IDEDIFICIO`,`vw_ocup_mil_actuales`.`EDIFICIO` AS `EDIFICIO`,`td`.`TIPOPAGO` AS `TIPOPAGO`,`grado`.`ABREVIATURA` AS `GRADO`,`especialidad`.`ABREV` AS `ESPECIALIDAD`,((`p`.`APELLIDO` <> 0) or _utf8' ' or (`p`.`NOMBRE` <> 0)) AS `APENOM`,`vw_ocup_mil_actuales`.`DEPTO` AS `DEPTO`,`p`.`TIPO` AS `TIPOPERS` from ((((((`descuento` `d` join `persona` `p` on((`d`.`IDOCUPANTE` = `p`.`IDPERSONA`))) join `tipo_descuento` `td` on((`d`.`IDTIPODESCUENTO` = `td`.`IDTIPODESCUENTO`))) join `ocupante_militar` on((`ocupante_militar`.`IDPERSONA` = `p`.`IDPERSONA`))) join `vw_ocup_mil_actuales` on((`vw_ocup_mil_actuales`.`IDPERSONA` = `p`.`IDPERSONA`))) join `grado` on((`ocupante_militar`.`IDGRADO` = `grado`.`IDGRADO`))) left join `especialidad` on((`ocupante_militar`.`IDESPECIALIDAD` = `especialidad`.`IDESPECIALIDAD`))) where (`p`.`TIPO` = _utf8'OCUP_MIL') union select `persona`.`APELLIDO` AS `APELLIDO`,`persona`.`NOMBRE` AS `NOMBRE`,`tipo_descuento`.`DESCRIPCION` AS `DESCRIPCION`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,`descuento`.`MONTO` AS `MONTO`,`descuento`.`IDOCUPANTE` AS `IDOCUPANTE`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`IDDESCUENTO` AS `IDDESCUENTO`,`ocupante_civil`.`LEGAJO` AS `LEGAJO`,`tipo_descuento`.`CODDESC` AS `CODDESC`,`ocupacion`.`IDEDIFICIO` AS `IDEDIFICIO`,`edificio`.`DESCRIPCION` AS `DESCRIPCION`,`tipo_descuento`.`TIPOPAGO` AS `TIPOPAGO`,_utf8'PC' AS `Grado`,_utf8'' AS `Especialidad`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `ApeNom`,`departamento`.`DESCRIPCION` AS `DEPTO`,`persona`.`TIPO` AS `TIPO` from ((((((`persona` join `descuento` on((`persona`.`IDPERSONA` = `descuento`.`IDOCUPANTE`))) join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) join `tipo_descuento` on((`descuento`.`IDTIPODESCUENTO` = `tipo_descuento`.`IDTIPODESCUENTO`))) join `ocupacion` on((`ocupante_civil`.`IDPERSONA` = `ocupacion`.`IDOCUPANTE`))) join `edificio` on((`ocupacion`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) where (isnull(`ocupacion`.`FECHARETIRO`) and (`persona`.`TIPO` = _utf8'OCUP_CIV')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_descuentos_civiles`
--
DROP TABLE IF EXISTS `vw_descuentos_civiles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_descuentos_civiles`  AS  select ((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,`descuento`.`MONTO` AS `ALQUILER`,0 AS `RAE`,0 AS `EXPENSAS`,`ocupante_civil`.`LEGAJO` AS `MR`,`ocupante_civil`.`CATEGORIA` AS `GRADO` from ((`descuento` join `persona` on((`descuento`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where ((`descuento`.`IDTIPODESCUENTO` = 1) and (`persona`.`TIPO` = _utf8'OCUP_CIV')) union select ((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `Persona.APELLIDO || ' ' || Persona.NOMBRE`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,0 AS `FLOATA`,`descuento`.`MONTO` AS `MONTO`,0 AS `FLOATE`,`ocupante_civil`.`LEGAJO` AS `LEGAJO`,`ocupante_civil`.`CATEGORIA` AS `CATEGORIA` from ((`descuento` join `persona` on((`descuento`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where ((`descuento`.`IDTIPODESCUENTO` = 2) and (`persona`.`TIPO` = _utf8'OCUP_CIV')) union select ((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `Persona.APELLIDO || ' ' || Persona.NOMBRE`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,0 AS `FLOATA`,0 AS `FLOATE`,`descuento`.`MONTO` AS `MONTO`,`ocupante_civil`.`LEGAJO` AS `LEGAJO`,`ocupante_civil`.`CATEGORIA` AS `CATEGORIA` from ((`descuento` join `persona` on((`descuento`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where ((`descuento`.`IDTIPODESCUENTO` = 3) and (`persona`.`TIPO` = _utf8'OCUP_CIV')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_descuentos_militares`
--
DROP TABLE IF EXISTS `vw_descuentos_militares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_descuentos_militares`  AS  select ((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,`ocupante_militar`.`MATRICULA` AS `MR`,`grado`.`ABREVIATURA` AS `GRADO`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,`descuento`.`MONTO` AS `ALQUILER`,0 AS `RAE`,0 AS `EXPENSAS` from (((`descuento` join `persona` on((`descuento`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) join `grado` on((`ocupante_militar`.`IDGRADO` = `grado`.`IDGRADO`))) where ((`descuento`.`IDTIPODESCUENTO` = 1) and (`persona`.`TIPO` = _utf8'OCUP_MIL')) union select ((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,`ocupante_militar`.`MATRICULA` AS `MATRICULA`,`grado`.`ABREVIATURA` AS `ABREVIATURA`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,0 AS `ALQUILER`,`descuento`.`MONTO` AS `RAE`,0 AS `EXPENSAS` from (((`descuento` join `persona` on((`descuento`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) join `grado` on((`ocupante_militar`.`IDGRADO` = `grado`.`IDGRADO`))) where ((`descuento`.`IDTIPODESCUENTO` = 2) and (`persona`.`TIPO` = _utf8'OCUP_MIL')) union select ((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,`ocupante_militar`.`MATRICULA` AS `MATRICULA`,`grado`.`ABREVIATURA` AS `ABREVIATURA`,`descuento`.`IDTIPODESCUENTO` AS `IDTIPODESCUENTO`,`descuento`.`MES` AS `MES`,`descuento`.`ANIO` AS `ANIO`,0 AS `ALQUILER`,0 AS `RAE`,`descuento`.`MONTO` AS `EXPENSAS` from (((`descuento` join `persona` on((`descuento`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) join `grado` on((`ocupante_militar`.`IDGRADO` = `grado`.`IDGRADO`))) where ((`descuento`.`IDTIPODESCUENTO` = 3) and (`persona`.`TIPO` = _utf8'OCUP_MIL')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_det_pagados`
--
DROP TABLE IF EXISTS `vw_det_pagados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_det_pagados`  AS  select `gasto_ad`.`IDGASTO_AD` AS `ID`,`gasto_ad`.`IDPAGO` AS `IDPAGO`,`gasto_ad`.`FECHA_PAGO` AS `FECHA`,`tipo_gasto_ad`.`DESCRIP` AS `DESCRIP`,`gasto_ad`.`COSTO` AS `IMPORTE`,`gasto_ad`.`NRO_DECI` AS `NRO_DECI`,`gasto_ad`.`NRO_ORDEN` AS `NRO_ORDEN`,`gasto_ad`.`NRO_FACT` AS `NRO_FACT`,_utf8'A' AS `TIPO` from (`gasto_ad` join `tipo_gasto_ad` on((`gasto_ad`.`IDTIPO_GASTO_AD` = `tipo_gasto_ad`.`IDTIPO_GASTO_AD`))) where (`gasto_ad`.`PAGADO` = _utf8'Sí') union select `serv_edif`.`IDSERV_EDIF` AS `idserv_edif`,`serv_edif`.`IDPAGO` AS `IDPAGO`,`serv_edif`.`FECHA_PAGO` AS `FECHA_PAGO`,`servicio`.`DESCRIP` AS `DESCRIP`,`serv_edif`.`COSTO` AS `COSTO`,`serv_edif`.`NRO_DECI` AS `NRO_DECI`,`serv_edif`.`NRO_ORDEN` AS `NRO_ORDEN`,`serv_edif`.`NRO_FACT` AS `NRO_FACT`,_utf8'S' AS `TIPO` from (`serv_edif` join `servicio` on((`serv_edif`.`IDSERVICIO` = `servicio`.`IDSERVICIO`))) where (`serv_edif`.`PAGADO` = _utf8'Sí') union select `trabajo`.`IDTRABAJO` AS `idtrabajo`,`trabajo`.`IDPAGO` AS `IDPAGO`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`categoria`.`DESCRIP` AS `DESCRIP`,`trabajo`.`COSTO` AS `COSTO`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN`,`trabajo`.`NRO_FACT` AS `NRO_FACT`,_utf8'T' AS `TIPO` from (`trabajo` join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) where (`trabajo`.`PAGADO` = _utf8'Sí') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_det_tareas`
--
DROP TABLE IF EXISTS `vw_det_tareas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_det_tareas`  AS  select `tarea`.`DESCRIP` AS `DESCRIP`,`vw_trabajos_completa`.`FECHA_FIN` AS `FECHA_FIN`,`vw_trabajos_completa`.`PROVEEDOR` AS `RAZON_SOCIAL`,`vw_trabajos_completa`.`EDIFICO` AS `EDIFICO`,`vw_trabajos_completa`.`IDEDIFICIO` AS `IDEDIFICIO`,`vw_trabajos_completa`.`LUGAR` AS `LUGAR` from ((`trab_tarea` join `tarea` on((`trab_tarea`.`IDTAREA` = `tarea`.`IDTAREA`))) join `vw_trabajos_completa` on((`trab_tarea`.`IDTRABAJO` = `vw_trabajos_completa`.`IDTRABAJO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_deudas`
--
DROP TABLE IF EXISTS `vw_deudas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_deudas`  AS  select `gasto_ad`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,sum(`gasto_ad`.`COSTO`) AS `IMPORTE` from (`gasto_ad` left join `proveedor` on((`gasto_ad`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`gasto_ad`.`PAGADO` = _utf8'No') group by `gasto_ad`.`IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` union select `serv_edif`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,sum(`serv_edif`.`COSTO`) AS `SUM( SERV_EDIF.COSTO )` from (`serv_edif` left join `proveedor` on((`serv_edif`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`serv_edif`.`PAGADO` = _utf8'No') group by `serv_edif`.`IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` union select `trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,sum(`trabajo`.`COSTO`) AS `SUM( TRABAJO.COSTO )` from (`trabajo` left join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`trabajo`.`PAGADO` = _utf8'No') group by `trabajo`.`IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_deudores`
--
DROP TABLE IF EXISTS `vw_deudores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_deudores`  AS  select `serv_edif`.`COSTO` AS `COSTO`,`serv_edif`.`NRO_FACT` AS `NRO_FACT`,`serv_edif`.`IDPERSONA` AS `IDPERSONA`,`vw_personas_2`.`OCUPANTE` AS `OCUPANTE`,`vw_personas_2`.`TIPO` AS `TIPO`,`vw_personas_2`.`MATRICULA` AS `MATRICULA`,`serv_edif`.`FECHA_PAGO` AS `FECHA_PAGO`,`servicio`.`DESCRIP` AS `DESCRIP` from ((`serv_edif` left join `vw_personas_2` on((`serv_edif`.`IDPERSONA` = `vw_personas_2`.`IDOCUPANTE`))) join `servicio` on((`serv_edif`.`IDSERVICIO` = `servicio`.`IDSERVICIO`))) where (`serv_edif`.`A_PAGAR_OCUPANTE` = _utf8'Si') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_edificios`
--
DROP TABLE IF EXISTS `vw_edificios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_edificios`  AS  select `edificio`.`IDEDIFICIO` AS `IDEDIFICIO`,`edificio`.`IDOCUPANTEJEFE` AS `IDOCUPANTEJEFE`,`edificio`.`DIRECCION` AS `DIRECCION`,`edificio`.`ADMFISCAL` AS `ADMFISCAL`,`edificio`.`OBSERVACIONES` AS `OBSERVACIONES`,`edificio`.`DESCRIPCION` AS `DESCRIPCION`,`edificio`.`JEFEMILITAR` AS `JEFEMILITAR`,`edificio`.`ECONOMO` AS `ECONOMO`,`edificio`.`COEFICIENTE` AS `COEFICIENTE`,count(`departamento`.`IDDEPARTAMENTO`) AS `CANT_DEPTOS` from (`edificio` left join `departamento` on((`edificio`.`IDEDIFICIO` = `departamento`.`IDEDIFICIO`))) group by `edificio`.`IDEDIFICIO`,`edificio`.`IDOCUPANTEJEFE`,`edificio`.`DIRECCION`,`edificio`.`ADMFISCAL`,`edificio`.`OBSERVACIONES`,`edificio`.`DESCRIPCION`,`edificio`.`JEFEMILITAR`,`edificio`.`ECONOMO`,`edificio`.`COEFICIENTE` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_espacios_comunes`
--
DROP TABLE IF EXISTS `vw_espacios_comunes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_espacios_comunes`  AS  select `espacio_comun`.`IDTIPO_ESPACIO` AS `IDTIPO_ESPACIO`,`espacio_comun`.`IDEDIFICIO` AS `IDEDIFICIO`,`tipo_espacio`.`DESCRIP` AS `DESCRIP` from (`espacio_comun` join `tipo_espacio` on((`espacio_comun`.`IDTIPO_ESPACIO` = `tipo_espacio`.`IDTIPO_ESPACIO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_gasto_ad`
--
DROP TABLE IF EXISTS `vw_gasto_ad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_gasto_ad`  AS  select `gasto_ad`.`IDGASTO_AD` AS `IDGASTO_AD`,`gasto_ad`.`FECHA_PAGO` AS `FECHA`,`gasto_ad`.`COSTO` AS `COSTO`,`tipo_gasto_ad`.`DESCRIP` AS `DESCRIP`,`gasto_ad`.`IDTIPO_GASTO_AD` AS `IDTIPO_GASTO_AD`,`gasto_ad`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`gasto_ad`.`PAGADO` AS `PAGADO`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`gasto_ad`.`IDPAGO` AS `IDPAGO`,`gasto_ad`.`NRO_DECI` AS `NRO_DECI`,`gasto_ad`.`NRO_ORDEN` AS `NRO_ORDEN`,`pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`gasto_ad`.`NRO_FACT` AS `NRO_FACT` from (((`gasto_ad` join `tipo_gasto_ad` on((`gasto_ad`.`IDTIPO_GASTO_AD` = `tipo_gasto_ad`.`IDTIPO_GASTO_AD`))) left join `proveedor` on((`gasto_ad`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) left join `pago` on((`gasto_ad`.`IDPAGO` = `pago`.`IDPAGO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_gasto_fi`
--
DROP TABLE IF EXISTS `vw_gasto_fi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_gasto_fi`  AS  select `gasto_fi`.`IDGASTO_FI` AS `IDGASTO_FI`,`gasto_fi`.`FECHA_PAGO` AS `FECHA`,`gasto_fi`.`COSTO` AS `COSTO`,`tipo_gasto_fi`.`DESCRIP` AS `DESCRIP`,`gasto_fi`.`IDTIPO_GASTO_FI` AS `IDTIPO_GASTO_FI`,`gasto_fi`.`NRO_HOJA` AS `NRO_HOJA` from (`gasto_fi` join `tipo_gasto_fi` on((`gasto_fi`.`IDTIPO_GASTO_FI` = `tipo_gasto_fi`.`IDTIPO_GASTO_FI`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_importe_por_idpago`
--
DROP TABLE IF EXISTS `vw_importe_por_idpago`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_importe_por_idpago`  AS  select `trabajo`.`IDPAGO` AS `IDPAGO`,`trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR`,sum(`trabajo`.`COSTO`) AS `IMPORTE` from `trabajo` group by `trabajo`.`IDPAGO`,`trabajo`.`IDPROVEEDOR` union select `serv_edif`.`IDPAGO` AS `IDPAGO`,`serv_edif`.`IDPROVEEDOR` AS `IDPROVEEDOR`,sum(`serv_edif`.`COSTO`) AS `IMPORTE` from `serv_edif` group by `serv_edif`.`IDPAGO`,`serv_edif`.`IDPROVEEDOR` union select `gasto_ad`.`IDPAGO` AS `IDPAGO`,`gasto_ad`.`IDPROVEEDOR` AS `IDPROVEEDOR`,sum(`gasto_ad`.`COSTO`) AS `IMPORTE` from `gasto_ad` group by `gasto_ad`.`IDPAGO`,`gasto_ad`.`IDPROVEEDOR` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_importe_por_idpago_total`
--
DROP TABLE IF EXISTS `vw_importe_por_idpago_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_importe_por_idpago_total`  AS  select `vw_importe_por_idpago`.`IDPAGO` AS `IDPAGO`,`vw_importe_por_idpago`.`IDPROVEEDOR` AS `IDPROVEEDOR`,sum(`vw_importe_por_idpago`.`IMPORTE`) AS `IMPORTE` from `vw_importe_por_idpago` group by `vw_importe_por_idpago`.`IDPAGO`,`vw_importe_por_idpago`.`IDPROVEEDOR` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ingresos`
--
DROP TABLE IF EXISTS `vw_ingresos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ingresos`  AS  select `ingreso`.`IDINGRESO` AS `IDINGRESO`,`ingreso`.`IDTIPO_INGRESO` AS `IDTIPO_INGRESO`,`tipo_ingreso`.`DESCRIP` AS `CONCEPTO`,`ingreso`.`FECHA_PAGO` AS `FECHA`,`ingreso`.`TIPO_PAGO` AS `TIPO_PAGO`,`ingreso`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`ingreso`.`NRO_RECIBO` AS `NRO_RECIBO`,`ingreso`.`IMPORTE_MANT` AS `IMPORTE_MANT`,`ingreso`.`SR` AS `SR`,`ingreso`.`IMPORTE_SERV` AS `IMPORTE_SERV` from (`ingreso` join `tipo_ingreso` on((`ingreso`.`IDTIPO_INGRESO` = `tipo_ingreso`.`IDTIPO_INGRESO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_mat_usados`
--
DROP TABLE IF EXISTS `vw_mat_usados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_mat_usados`  AS  select `mat_usado`.`IDTRABAJO` AS `IDTRABAJO`,`mat_usado`.`CANTIDAD` AS `CANTIDAD`,`mat_usado`.`IDMATERIAL` AS `IDMATERIAL`,`material`.`DESCRIP` AS `DESCRIP`,`vw_trabajos_completa`.`NROPEDIDO` AS `NROPEDIDO`,`unidad`.`ABREV` AS `ABREV`,`vw_trabajos_completa`.`FECHA_FIN` AS `FECHA_FIN`,`vw_trabajos_completa`.`EDIFICO` AS `EDIFICO`,`vw_trabajos_completa`.`IDEDIFICIO` AS `IDEDIFICIO`,`vw_trabajos_completa`.`LUGAR` AS `LUGAR`,`vw_trabajos_completa`.`PROVEEDOR` AS `PROVEEDOR`,`vw_trabajos_completa`.`NROFACTURA` AS `NROFACTURA`,`mat_usado`.`IDUNIDAD` AS `IDUNIDAD` from (((`mat_usado` join `material` on((`mat_usado`.`IDMATERIAL` = `material`.`IDMATERIAL`))) join `unidad` on((`mat_usado`.`IDUNIDAD` = `unidad`.`IDUNIDAD`))) join `vw_trabajos_completa` on((`mat_usado`.`IDTRABAJO` = `vw_trabajos_completa`.`IDTRABAJO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupacion`
--
DROP TABLE IF EXISTS `vw_ocupacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupacion`  AS  select `p`.`NOMBRE` AS `NOMBRE`,`p`.`APELLIDO` AS `APELLIDO`,`e`.`DESCRIPCION` AS `DESCRIPCIONED`,`d`.`DESCRIPCION` AS `DESCRIPCIONDEPT`,`oc`.`FECHAINI` AS `FECHAINI`,`oc`.`FECHAFIN` AS `FECHAFIN`,`oc`.`FECHARETIRO` AS `FECHARETIRO`,`oc`.`IDEDIFICIO` AS `IDEDIFICIO`,`oc`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`oc`.`IDOCUPANTE` AS `IDOCUPANTE`,`oc`.`IDOCUPACION` AS `IDOCUPACION`,((`p`.`APELLIDO` <> 0) or _utf8' ' or (`p`.`NOMBRE` <> 0)) AS `OCUPANTE`,((`e`.`DESCRIPCION` <> 0) or _utf8' ' or (`d`.`DESCRIPCION` <> 0)) AS `LOCACION` from (((`ocupacion` `oc` join `departamento` `d` on(((`oc`.`IDDEPARTAMENTO` = `d`.`IDDEPARTAMENTO`) and (`oc`.`IDEDIFICIO` = `d`.`IDEDIFICIO`)))) join `edificio` `e` on((`d`.`IDEDIFICIO` = `e`.`IDEDIFICIO`))) join `persona` `p` on((`oc`.`IDOCUPANTE` = `p`.`IDPERSONA`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupantes`
--
DROP TABLE IF EXISTS `vw_ocupantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupantes`  AS  select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Personal civil' AS `TIPO`,`ocupante_civil`.`LEGAJO` AS `MATRICULA` from (`persona` join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) union select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Personal militar' AS `TIPO`,`ocupante_militar`.`MATRICULA` AS `MATRICULA` from (`persona` join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) union select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Particular' AS `TIPO`,_utf8' ' AS `MATRICULA` from (`persona` join `ocupante_particular` on((`persona`.`IDPERSONA` = `ocupante_particular`.`IDPERSONA`))) union select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Militar no ocupante' AS `TIPO`,`militar_no_ocupante`.`MATRICULA` AS `MATRICULA` from (`persona` join `militar_no_ocupante` on((`persona`.`IDPERSONA` = `militar_no_ocupante`.`IDPERSONA`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupantes_actuales`
--
DROP TABLE IF EXISTS `vw_ocupantes_actuales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupantes_actuales`  AS  select `ocupacion`.`IDOCUPANTE` AS `IDOCUPANTE`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Personal militar' AS `TIPO`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `LOCACION`,`ocupacion`.`FECHAINI` AS `FECHAINI`,`ocupacion`.`FECHAFIN` AS `FECHAFIN`,`ocupacion`.`IDEDIFICIO` AS `IDEDIFICIO`,`ocupacion`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`ocupante_militar`.`MATRICULA` AS `MATRICULA`,`departamento`.`DESCRIPCION` AS `UNIDAD`,`departamento`.`TELEFONO` AS `TEL_UNIDAD`,`grado`.`ABREVIATURA` AS `GRADO`,`ocupante_militar`.`DESTINO` AS `DESTINO`,`ocupante_militar`.`TELEFONO_DESTINO` AS `TEL_DESTINO`,0 AS `IDGARANTE`,_utf8'' AS `PARENTEZCO`,_utf8'' AS `GARANTE`,`persona`.`NRODOCUMENTO` AS `DNI` from (((((`ocupacion` join `persona` on((`ocupacion`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `edificio` on((`ocupacion`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) join `grado` on((`ocupante_militar`.`IDGRADO` = `grado`.`IDGRADO`))) where (isnull(`ocupacion`.`FECHARETIRO`) and (`persona`.`TIPO` = _utf8'OCUP_MIL')) union select `ocupacion`.`IDOCUPANTE` AS `IDOCUPANTE`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Personal civil' AS `Personal civil`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `LOCACION`,`ocupacion`.`FECHAINI` AS `FECHAINI`,`ocupacion`.`FECHAFIN` AS `FECHAFIN`,`ocupacion`.`IDEDIFICIO` AS `IDEDIFICIO`,`ocupacion`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`ocupante_civil`.`LEGAJO` AS `legajo`,`departamento`.`DESCRIPCION` AS `DESCRIPCION`,`departamento`.`TELEFONO` AS `TELEFONO`,`ocupante_civil`.`CATEGORIA` AS `CATEGORIA`,`ocupante_civil`.`DESTINO` AS `DESTINO`,`ocupante_civil`.`TELEFONO_DESTINO` AS `TELEFONO_DESTINO`,0 AS `IDGARANTE`,_utf8'' AS `parentezco`,_utf8'' AS `nombre`,`persona`.`NRODOCUMENTO` AS `NRODOCUMENTO` from ((((`ocupacion` join `persona` on((`ocupacion`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `edificio` on((`ocupacion`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where (isnull(`ocupacion`.`FECHARETIRO`) and (`persona`.`TIPO` = _utf8'OCUP_CIV')) union select `ocupacion`.`IDOCUPANTE` AS `IDOCUPANTE`,((`persona1`.`APELLIDO` <> 0) or _utf8' ' or (`persona1`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Particular' AS `Particular`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `LOCACION`,`ocupacion`.`FECHAINI` AS `FECHAINI`,`ocupacion`.`FECHAFIN` AS `FECHAFIN`,`ocupacion`.`IDEDIFICIO` AS `IDEDIFICIO`,`ocupacion`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,_utf8'' AS `MATRICULA`,`departamento`.`DESCRIPCION` AS `DESCRIPCION`,`departamento`.`TELEFONO` AS `TELEFONO`,_utf8'' AS `GRADO`,_utf8'' AS `DESTINO`,_utf8'' AS `TEL_DESTINO`,`ocupante_particular`.`IDGARANTE` AS `idgarante`,`ocupante_particular`.`PARENTEZCO` AS `parentezco`,((`persona2`.`APELLIDO` <> 0) or _utf8' ' or (`persona2`.`NOMBRE` <> 0)) AS `garante`,`persona1`.`NRODOCUMENTO` AS `NRODOCUMENTO` from (((((`ocupacion` join `persona` `persona1` on((`ocupacion`.`IDOCUPANTE` = `persona1`.`IDPERSONA`))) join `edificio` on((`ocupacion`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `ocupante_particular` on((`persona1`.`IDPERSONA` = `ocupante_particular`.`IDPERSONA`))) left join `persona` `persona2` on((`ocupante_particular`.`IDGARANTE` = `persona2`.`IDPERSONA`))) where (isnull(`ocupacion`.`FECHARETIRO`) and (`persona1`.`TIPO` = _utf8'OCUP_PART')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupantes_civiles`
--
DROP TABLE IF EXISTS `vw_ocupantes_civiles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupantes_civiles`  AS  select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Personal civil' AS `TIPO`,`ocupante_civil`.`LEGAJO` AS `MATRICULA` from (`persona` join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupantes_historicos`
--
DROP TABLE IF EXISTS `vw_ocupantes_historicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupantes_historicos`  AS  select `vw_ocupacion`.`IDOCUPANTE` AS `IDOCUPANTE`,`vw_ocupacion`.`OCUPANTE` AS `OCUPANTE`,`vw_personas`.`TIPO` AS `TIPO`,`vw_ocupacion`.`LOCACION` AS `LOCACION`,`vw_ocupacion`.`FECHAINI` AS `FECHAINI`,`vw_ocupacion`.`FECHAFIN` AS `FECHAFIN`,`vw_ocupacion`.`FECHARETIRO` AS `FECHARETIRO`,`vw_ocupacion`.`IDEDIFICIO` AS `IDEDIFICIO`,`vw_ocupacion`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO` from (`vw_ocupacion` join `vw_personas` on((`vw_ocupacion`.`IDOCUPANTE` = `vw_personas`.`IDPERSONA`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupantes_militares`
--
DROP TABLE IF EXISTS `vw_ocupantes_militares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupantes_militares`  AS  select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Personal militar' AS `TIPO`,`ocupante_militar`.`MATRICULA` AS `MATRICULA` from (`persona` join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupantes_particulares`
--
DROP TABLE IF EXISTS `vw_ocupantes_particulares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocupantes_particulares`  AS  select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,_utf8'Particular' AS `TIPO`,_utf8' ' AS `MATRICULA` from (`persona` join `ocupante_particular` on((`persona`.`IDPERSONA` = `ocupante_particular`.`IDPERSONA`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocup_civ_actuales`
--
DROP TABLE IF EXISTS `vw_ocup_civ_actuales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocup_civ_actuales`  AS  select `ocupacion`.`IDOCUPANTE` AS `IDOCUPANTE`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `LOCACION`,`ocupacion`.`FECHAINI` AS `FECHAINI`,`ocupacion`.`FECHAFIN` AS `FECHAFIN`,`ocupacion`.`IDEDIFICIO` AS `IDEDIFICIO`,`ocupacion`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`ocupante_civil`.`LEGAJO` AS `LEGAJO`,`ocupante_civil`.`SUELDO` AS `SUELDO` from ((((`ocupacion` join `persona` on((`ocupacion`.`IDOCUPANTE` = `persona`.`IDPERSONA`))) join `edificio` on((`ocupacion`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where (isnull(`ocupacion`.`FECHARETIRO`) and (`persona`.`TIPO` = _utf8'OCUP_CIV')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocup_mil_actuales`
--
DROP TABLE IF EXISTS `vw_ocup_mil_actuales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_ocup_mil_actuales`  AS  select `ocupante_militar`.`IDPERSONA` AS `IDPERSONA`,`departamento`.`TIPO` AS `TIPO`,`departamento`.`CANTAMB` AS `CANTAMB`,`ocupante_militar`.`MATRICULA` AS `MATRICULA`,`ocupante_militar`.`IDGRADO` AS `IDGRADO`,`ocupante_militar`.`ANTGRADO` AS `ANTGRADO`,`ocupante_militar`.`FECHA_INGRESO` AS `FECHA_INGRESO`,`ocupante_militar`.`RENTAPROPIA` AS `RENTAPROPIA`,`ocupante_militar`.`ANT_SERVICIO` AS `ANT_SERVICIO`,`departamento`.`IDEDIFICIO` AS `IDEDIFICIO`,`edificio`.`DESCRIPCION` AS `EDIFICIO`,`departamento`.`DESCRIPCION` AS `DEPTO` from ((((`ocupacion` join `ocupante_militar` on((`ocupacion`.`IDOCUPANTE` = `ocupante_militar`.`IDPERSONA`))) join `departamento` on((`ocupacion`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `persona` on((`ocupante_militar`.`IDPERSONA` = `persona`.`IDPERSONA`))) join `edificio` on((`departamento`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) where (isnull(`ocupacion`.`FECHARETIRO`) and (`persona`.`TIPO` = _utf8'OCUP_MIL')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pagados`
--
DROP TABLE IF EXISTS `vw_pagados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_pagados`  AS  select `vw_pago_prov_sinfact`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`pago`.`IMPORTE` AS `IMPORTE`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`pago`.`COBRADO` AS `COBRADO`,`pago`.`IDPAGO` AS `IDPAGO`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,((`personal`.`APELLIDO` <> 0) or _utf8', ' or (`personal`.`NOMBRE` <> 0)) AS `PERSONAL`,`pago`.`IDPERSONAL` AS `IDPERSONAL` from (((`pago` join `vw_pago_prov_sinfact` on((`pago`.`IDPAGO` = `vw_pago_prov_sinfact`.`IDPAGO`))) left join `personal` on((`pago`.`IDPERSONAL` = `personal`.`IDPERSONAL`))) join `proveedor` on((`vw_pago_prov_sinfact`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pagos`
--
DROP TABLE IF EXISTS `vw_pagos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pagos`  AS  select `gasto_ad`.`IDGASTO_AD` AS `ID`,`gasto_ad`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,sum(`gasto_ad`.`COSTO`) AS `IMPORTE` from (`gasto_ad` left join `proveedor` on((`gasto_ad`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`gasto_ad`.`PAGADO` = 'No') group by `gasto_ad`.`IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL`,`gasto_ad`.`IDGASTO_AD` union select `serv_edif`.`IDSERV_EDIF` AS `IDSERV_EDIF`,`serv_edif`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,sum(`serv_edif`.`COSTO`) AS `SUM( SERV_EDIF.COSTO )` from (`serv_edif` left join `proveedor` on((`serv_edif`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`serv_edif`.`PAGADO` = 'No') group by `serv_edif`.`IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL`,`serv_edif`.`IDSERV_EDIF` union select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,sum(`trabajo`.`COSTO`) AS `SUM( TRABAJO.COSTO )` from (`trabajo` left join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where ((`trabajo`.`PAGADO` = 'No') and (`trabajo`.`FECHA_FIN` is not null)) group by `trabajo`.`IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL`,`trabajo`.`IDTRABAJO` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pagos_efectuados`
--
DROP TABLE IF EXISTS `vw_pagos_efectuados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pagos_efectuados`  AS  select `pago`.`IDPAGO` AS `IDPAGO`,`pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`pago`.`IMPORTE` AS `IMPORTE`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`pago`.`COBRADO` AS `COBRADO`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,((`personal`.`APELLIDO` <> 0) or ' ' or (`personal`.`NOMBRE` <> 0)) AS `COBRADOR` from (((`pago` join `vw_importe_por_idpago_total` on((`pago`.`IDPAGO` = `vw_importe_por_idpago_total`.`IDPAGO`))) left join `personal` on((`pago`.`IDPERSONAL` = `personal`.`IDPERSONAL`))) join `proveedor` on((`vw_importe_por_idpago_total`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pago_prov`
--
DROP TABLE IF EXISTS `vw_pago_prov`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_pago_prov`  AS  select distinct `trabajo`.`IDPAGO` AS `IDPAGO`,`trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`trabajo`.`NRO_FACT` AS `NRO_FACT` from `trabajo` where (`trabajo`.`IDPAGO` is not null) union select distinct `gasto_ad`.`IDPAGO` AS `IDPAGO`,`gasto_ad`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`gasto_ad`.`NRO_FACT` AS `NRO_FACT` from `gasto_ad` where (`gasto_ad`.`IDPAGO` is not null) union select distinct `serv_edif`.`IDPAGO` AS `IDPAGO`,`serv_edif`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`serv_edif`.`NRO_FACT` AS `NRO_FACT` from `serv_edif` where (`serv_edif`.`IDPAGO` is not null) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pago_prov_sinfact`
--
DROP TABLE IF EXISTS `vw_pago_prov_sinfact`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_pago_prov_sinfact`  AS  select distinct `trabajo`.`IDPAGO` AS `IDPAGO`,`trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR` from `trabajo` where (`trabajo`.`IDPAGO` is not null) union select distinct `gasto_ad`.`IDPAGO` AS `IDPAGO`,`gasto_ad`.`IDPROVEEDOR` AS `IDPROVEEDOR` from `gasto_ad` where (`gasto_ad`.`IDPAGO` is not null) union select distinct `serv_edif`.`IDPAGO` AS `IDPAGO`,`serv_edif`.`IDPROVEEDOR` AS `IDPROVEEDOR` from `serv_edif` where (`serv_edif`.`IDPAGO` is not null) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_personas`
--
DROP TABLE IF EXISTS `vw_personas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_personas`  AS  select `persona`.`IDPERSONA` AS `IDPERSONA`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `NOMBRE`,`persona`.`TIPO` AS `TIPO`,`persona`.`TIPODOCUMENTO` AS `TIPODOCUMENTO`,`persona`.`NRODOCUMENTO` AS `NRODOCUMENTO` from `persona` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_personas_2`
--
DROP TABLE IF EXISTS `vw_personas_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_personas_2`  AS  select `persona`.`IDPERSONA` AS `IDOCUPANTE`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Personal militar' AS `TIPO`,`ocupante_militar`.`MATRICULA` AS `MATRICULA` from (`persona` join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) where (`persona`.`TIPO` = _utf8'OCUP_MIL') union select `persona`.`IDPERSONA` AS `IdPersona`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Personal civil' AS `Personal civil`,`ocupante_civil`.`LEGAJO` AS `legajo` from (`persona` join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where (`persona`.`TIPO` = _utf8'OCUP_CIV') union select `persona`.`IDPERSONA` AS `IdPersona`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Particular' AS `Particular`,_utf8'' AS `MATRICULA` from `persona` where (`persona`.`TIPO` = _utf8'OCUP_PART') union select `persona`.`IDPERSONA` AS `IdPersona`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,_utf8'Militar no ocupante' AS `TIPO`,`militar_no_ocupante`.`MATRICULA` AS `matricula` from (`persona` join `militar_no_ocupante` on((`persona`.`IDPERSONA` = `militar_no_ocupante`.`IDPERSONA`))) where (`persona`.`TIPO` = _utf8'MIL_NO_OCUP') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_recibos`
--
DROP TABLE IF EXISTS `vw_recibos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_recibos`  AS  select `recibo`.`IDRECIBO` AS `IDRECIBO`,`recibo`.`FECHA_EMISION` AS `FECHA_EMISION`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `OCUPANTE`,`recibo`.`FECHA_INICIO` AS `FECHA_INICIO`,`recibo`.`FECHA_FIN` AS `FECHA_FIN`,`recibo`.`MONTO_MANTENIMIENTO` AS `MONTO_MANT`,`recibo`.`MONTO_EXPENSAS` AS `MONTO_EXP`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `DEPTO`,_utf8'No' AS `ANULADO`,`recibo`.`NRO_RECIBO` AS `NRO_RECIBO` from (((`recibo` join `edificio` on((`recibo`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`recibo`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `persona` on((`recibo`.`IDPERSONA` = `persona`.`IDPERSONA`))) where (not(`recibo`.`IDRECIBO` in (select `recibo_anulado`.`IDRECIBO_ANULADO` AS `IDRECIBO_ANULADO` from `recibo_anulado`))) union select `recibo`.`IDRECIBO` AS `IDRECIBO`,`recibo`.`FECHA_EMISION` AS `FECHA_EMISION`,((`persona`.`APELLIDO` <> 0) or _utf8' ' or (`persona`.`NOMBRE` <> 0)) AS `(Persona.APELLIDO || ' ')  || Persona.NOMBRE`,`recibo`.`FECHA_INICIO` AS `FECHA_INICIO`,`recibo`.`FECHA_FIN` AS `FECHA_FIN`,`recibo`.`MONTO_MANTENIMIENTO` AS `MONTO_MANTENIMIENTO`,`recibo`.`MONTO_EXPENSAS` AS `MONTO_EXPENSAS`,((`edificio`.`DESCRIPCION` <> 0) or _utf8' ' or (`departamento`.`DESCRIPCION` <> 0)) AS `(Edificio.DESCRIPCION || ' ')  || Departamento.DESCRIPCION`,_utf8'Si' AS `ANULADO`,`recibo`.`NRO_RECIBO` AS `nro_recibo` from (((`recibo` join `edificio` on((`recibo`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `departamento` on((`recibo`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `persona` on((`recibo`.`IDPERSONA` = `persona`.`IDPERSONA`))) where `recibo`.`IDRECIBO` in (select `recibo_anulado`.`IDRECIBO_ANULADO` AS `IDRECIBO_ANULADO` from `recibo_anulado`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_deci_mant`
--
DROP TABLE IF EXISTS `vw_resumen_deci_mant`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_resumen_deci_mant`  AS  select `vw_cuenta_mant`.`EDIFICIO` AS `EDIFICIO`,`vw_cuenta_mant`.`FECHA` AS `FECHA`,sum(`vw_cuenta_mant`.`COSTO`) AS `IMPORTE_EFEC`,0 AS `IMPORTE_RAE` from `vw_cuenta_mant` where (`vw_cuenta_mant`.`TIPOPAGO` = _utf8'E') group by `vw_cuenta_mant`.`EDIFICIO`,`vw_cuenta_mant`.`FECHA` union select `vw_cuenta_mant`.`EDIFICIO` AS `EDIFICIO`,`vw_cuenta_mant`.`FECHA` AS `FECHA`,0 AS `IMPORTE_EFEC`,sum(`vw_cuenta_mant`.`COSTO`) AS `IMPORTE_RAE` from `vw_cuenta_mant` where (`vw_cuenta_mant`.`TIPOPAGO` = _utf8'R') group by `vw_cuenta_mant`.`EDIFICIO`,`vw_cuenta_mant`.`FECHA` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_deci_serv`
--
DROP TABLE IF EXISTS `vw_resumen_deci_serv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_resumen_deci_serv`  AS  select `vw_serv_edif`.`EDIFICIO` AS `EDIFICIO`,`vw_serv_edif`.`FECHA` AS `FECHA`,sum(`vw_serv_edif`.`COSTO`) AS `IMPORTE_EFEC`,0 AS `IMPORTE_CHEQUE` from `vw_serv_edif` where ((`vw_serv_edif`.`TIPO_PAGO` = 'E') and (`vw_serv_edif`.`VACIOS` = 'No')) group by `vw_serv_edif`.`EDIFICIO`,`vw_serv_edif`.`FECHA` union select `vw_serv_edif`.`EDIFICIO` AS `EDIFICIO`,`vw_serv_edif`.`FECHA` AS `FECHA`,0 AS `IMPORTE_EFEC`,sum(`vw_serv_edif`.`COSTO`) AS `IMPORTE_CHEQUE` from `vw_serv_edif` where ((`vw_serv_edif`.`TIPO_PAGO` = 'C') and (`vw_serv_edif`.`VACIOS` = 'No')) group by `vw_serv_edif`.`EDIFICIO`,`vw_serv_edif`.`FECHA` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_desc_civ`
--
DROP TABLE IF EXISTS `vw_resumen_desc_civ`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_resumen_desc_civ`  AS  select `vw_descuentos_civiles`.`OCUPANTE` AS `OCUPANTE`,`vw_descuentos_civiles`.`MR` AS `MR`,`vw_descuentos_civiles`.`GRADO` AS `GRADO`,`vw_descuentos_civiles`.`MES` AS `MES`,`vw_descuentos_civiles`.`ANIO` AS `ANIO`,sum(`vw_descuentos_civiles`.`ALQUILER`) AS `ALQUILER`,sum(`vw_descuentos_civiles`.`RAE`) AS `RAE`,sum(`vw_descuentos_civiles`.`EXPENSAS`) AS `EXPENSAS` from `vw_descuentos_civiles` group by `vw_descuentos_civiles`.`OCUPANTE`,`vw_descuentos_civiles`.`MR`,`vw_descuentos_civiles`.`GRADO`,`vw_descuentos_civiles`.`MES`,`vw_descuentos_civiles`.`ANIO` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_desc_mil`
--
DROP TABLE IF EXISTS `vw_resumen_desc_mil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_resumen_desc_mil`  AS  select `vw_descuentos_militares`.`OCUPANTE` AS `OCUPANTE`,`vw_descuentos_militares`.`MR` AS `MR`,`vw_descuentos_militares`.`GRADO` AS `GRADO`,`vw_descuentos_militares`.`MES` AS `MES`,`vw_descuentos_militares`.`ANIO` AS `ANIO`,sum(`vw_descuentos_militares`.`ALQUILER`) AS `ALQUILER`,sum(`vw_descuentos_militares`.`RAE`) AS `RAE`,sum(`vw_descuentos_militares`.`EXPENSAS`) AS `EXPENSAS` from `vw_descuentos_militares` group by `vw_descuentos_militares`.`OCUPANTE`,`vw_descuentos_militares`.`MR`,`vw_descuentos_militares`.`GRADO`,`vw_descuentos_militares`.`MES`,`vw_descuentos_militares`.`ANIO` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_serv_edif`
--
DROP TABLE IF EXISTS `vw_serv_edif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_serv_edif`  AS  select `serv_edif`.`IDEDIFICIO` AS `IDEDIFICIO`,`serv_edif`.`FECHA_PAGO` AS `FECHA`,`serv_edif`.`COSTO` AS `COSTO`,`servicio`.`DESCRIP` AS `DESCRIP`,`serv_edif`.`IDSERVICIO` AS `IDSERVICIO`,`serv_edif`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`serv_edif`.`IDSERV_EDIF` AS `IDSERV_EDIF`,`serv_edif`.`PAGADO` AS `PAGADO`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`serv_edif`.`IDPAGO` AS `IDPAGO`,`serv_edif`.`NRO_DECI` AS `NRO_DECI`,`serv_edif`.`NRO_ORDEN` AS `NRO_ORDEN`,`serv_edif`.`VACIOS` AS `VACIOS`,`pago`.`FECHA_PAGO` AS `FECHA_PAGO`,`edificio`.`DESCRIPCION` AS `EDIFICIO`,`serv_edif`.`NRO_FACT` AS `NRO_FACT`,`serv_edif`.`A_PAGAR_OCUPANTE` AS `A_PAGAR_OCUPANTE` from ((((`serv_edif` join `servicio` on((`serv_edif`.`IDSERVICIO` = `servicio`.`IDSERVICIO`))) left join `proveedor` on((`serv_edif`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) left join `pago` on((`serv_edif`.`IDPAGO` = `pago`.`IDPAGO`))) join `edificio` on((`serv_edif`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_trabajos`
--
DROP TABLE IF EXISTS `vw_trabajos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_trabajos`  AS  select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`NRO_PEDIDO` AS `NRO_PEDIDO`,`trab_depto`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`trabajo`.`FECHA_INI` AS `FECHA_INI`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`trabajo`.`COSTO` AS `COSTO`,`trabajo`.`IMPUTACION` AS `IMPUTACION`,`categoria`.`DESCRIP` AS `DESCRIP`,`dapartamento`.`IDEDIFICIO` AS `IDEDIF`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE`,`trabajo`.`PAGADO` AS `PAGADO`,`trabajo`.`NRO_FACT` AS `NRO_FACTURA`,`edificio`.`DESCRIPCION` AS `EDIFICIO`,((`edificio`.`DESCRIPCION` <> 0) or _utf8'  ' or (`dapartamento`.`DESCRIPCION` <> 0)) AS `DESC_DEPTO`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN` from ((((((`trabajo` join `trab_depto` on((`trabajo`.`IDTRABAJO` = `trab_depto`.`IDTRABAJO`))) left join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) left join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) left join `pago` on((`trabajo`.`IDPAGO` = `pago`.`IDPAGO`))) join `departamento` `dapartamento` on((`trab_depto`.`IDDEPARTAMENTO` = `dapartamento`.`IDDEPARTAMENTO`))) join `edificio` on((`dapartamento`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_trabajos_completa`
--
DROP TABLE IF EXISTS `vw_trabajos_completa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_trabajos_completa`  AS  select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`NRO_PEDIDO` AS `NROPEDIDO`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`edificio`.`DESCRIPCION` AS `EDIFICO`,`edificio`.`IDEDIFICIO` AS `IDEDIFICIO`,`departamento`.`DESCRIPCION` AS `LUGAR`,`proveedor`.`RAZON_SOCIAL` AS `PROVEEDOR`,`trabajo`.`NRO_FACT` AS `NROFACTURA` from ((((`edificio` join `departamento` on((`departamento`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `trab_depto` on((`trab_depto`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) join `trabajo` on((`trab_depto`.`IDTRABAJO` = `trabajo`.`IDTRABAJO`))) join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) union select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`NRO_PEDIDO` AS `NroPedido`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`edificio`.`DESCRIPCION` AS `Edifico`,`edificio`.`IDEDIFICIO` AS `IDEDIFICIO`,`tipo_espacio`.`DESCRIP` AS `Lugar`,`proveedor`.`RAZON_SOCIAL` AS `Proveedor`,`trabajo`.`NRO_FACT` AS `NroFactura` from ((((`trab_edif` join `edificio` on((`trab_edif`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) join `tipo_espacio` on((`trab_edif`.`IDTIPO_ESPACIO` = `tipo_espacio`.`IDTIPO_ESPACIO`))) join `trabajo` on((`trab_edif`.`IDTRABAJO` = `trabajo`.`IDTRABAJO`))) join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_trab_edif`
--
DROP TABLE IF EXISTS `vw_trab_edif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_trab_edif`  AS  select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`NRO_PEDIDO` AS `NRO_PEDIDO`,`trabajo`.`FECHA_INI` AS `FECHA_INI`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`trabajo`.`COSTO` AS `COSTO`,`trabajo`.`IMPUTACION` AS `IMPUTACION`,`trab_edif`.`IDEDIFICIO` AS `IDEDIFICIO`,`tipo_espacio`.`DESCRIP` AS `ESPACIO`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`trabajo`.`NRO_FACT` AS `NRO_FACTURA`,`categoria`.`DESCRIP` AS `DESCRIP`,`edificio`.`DESCRIPCION` AS `EDIFICIO`,`trabajo`.`PAGADO` AS `PAGADO`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO` from ((((((`trabajo` join `trab_edif` on((`trabajo`.`IDTRABAJO` = `trab_edif`.`IDTRABAJO`))) left join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) left join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) left join `pago` on((`trabajo`.`IDPAGO` = `pago`.`IDPAGO`))) join `tipo_espacio` on((`trab_edif`.`IDTIPO_ESPACIO` = `tipo_espacio`.`IDTIPO_ESPACIO`))) join `edificio` on((`trab_edif`.`IDEDIFICIO` = `edificio`.`IDEDIFICIO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_trab_no_pagados`
--
DROP TABLE IF EXISTS `vw_trab_no_pagados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_trab_no_pagados`  AS  select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`NRO_PEDIDO` AS `NRO_PEDIDO`,`trabajo`.`FECHA_FIN` AS `FECHA`,`trabajo`.`COSTO` AS `COSTO`,`trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`departamento`.`IDEDIFICIO` AS `IDEDIFICIO`,`trabajo`.`TIPO_TRAB` AS `TIPO_TRAB` from ((`trabajo` join `trab_depto` on((`trabajo`.`IDTRABAJO` = `trab_depto`.`IDTRABAJO`))) join `departamento` on((`trab_depto`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) where (`trabajo`.`PAGADO` = _utf8'No') union select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`NRO_PEDIDO` AS `NRO_PEDIDO`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`trabajo`.`COSTO` AS `COSTO`,`trabajo`.`IDPROVEEDOR` AS `IDPROVEEDOR`,`trab_edif`.`IDEDIFICIO` AS `IDEDIFICIO`,`trabajo`.`TIPO_TRAB` AS `TIPO_TRAB` from (`trabajo` join `trab_edif` on((`trabajo`.`IDTRABAJO` = `trab_edif`.`IDTRABAJO`))) where (`trabajo`.`PAGADO` = _utf8'No') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_trab_pagados`
--
DROP TABLE IF EXISTS `vw_trab_pagados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_trab_pagados`  AS  select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`IDPAGO` AS `IDPAGO`,('Factura Nº ' or (`trabajo`.`NRO_FACT` <> 0) or ' - ' or (`categoria`.`DESCRIP` <> 0)) AS `DESCRIP`,`trabajo`.`COSTO` AS `IMPORTE`,`trabajo`.`FECHA_FIN` AS `FECHA`,`departamento`.`IDEDIFICIO` AS `IDEDIFICIO`,`trabajo`.`TIPO_TRAB` AS `TIPO_TRAB`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE` from (((((`trabajo` join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) join `trab_depto` on((`trabajo`.`IDTRABAJO` = `trab_depto`.`IDTRABAJO`))) join `pago` on((`trabajo`.`IDPAGO` = `pago`.`IDPAGO`))) join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) join `departamento` on((`trab_depto`.`IDDEPARTAMENTO` = `departamento`.`IDDEPARTAMENTO`))) where (`trabajo`.`PAGADO` = 'Sí') union select `trabajo`.`IDTRABAJO` AS `IDTRABAJO`,`trabajo`.`IDPAGO` AS `IDPAGO`,('Factura Nº ' or (`trabajo`.`NRO_FACT` <> 0) or ' - ' or (`categoria`.`DESCRIP` <> 0)) AS `Name_exp_3`,`trabajo`.`COSTO` AS `COSTO`,`trabajo`.`FECHA_FIN` AS `FECHA_FIN`,`trab_edif`.`IDEDIFICIO` AS `IDEDIFICIO`,`trabajo`.`TIPO_TRAB` AS `TIPO_TRAB`,`trabajo`.`NRO_DECI` AS `NRO_DECI`,`trabajo`.`NRO_ORDEN` AS `NRO_ORDEN`,`proveedor`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`pago`.`TIPO_PAGO` AS `TIPO_PAGO`,`pago`.`NRO_CHEQUE` AS `NRO_CHEQUE` from ((((`trabajo` join `categoria` on((`trabajo`.`IDCATEGORIA` = `categoria`.`IDCATEGORIA`))) join `trab_edif` on((`trabajo`.`IDTRABAJO` = `trab_edif`.`IDTRABAJO`))) join `pago` on((`trabajo`.`IDPAGO` = `pago`.`IDPAGO`))) join `proveedor` on((`trabajo`.`IDPROVEEDOR` = `proveedor`.`IDPROVEEDOR`))) where (`trabajo`.`PAGADO` = 'Sí') ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

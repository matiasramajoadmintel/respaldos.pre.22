-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2017 a las 22:10:11
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test_fede`
--

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_ocupacion`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ocupacion`  AS  select `p`.`NOMBRE` AS `NOMBRE`,`p`.`APELLIDO` AS `APELLIDO`,`e`.`DESCRIPCION` AS `DESCRIPCIONED`,`d`.`DESCRIPCION` AS `DESCRIPCIONDEPT`,`oc`.`FECHAINI` AS `FECHAINI`,`oc`.`FECHAFIN` AS `FECHAFIN`,`oc`.`FECHARETIRO` AS `FECHARETIRO`,`oc`.`IDEDIFICIO` AS `IDEDIFICIO`,`oc`.`IDDEPARTAMENTO` AS `IDDEPARTAMENTO`,`oc`.`IDOCUPANTE` AS `IDOCUPANTE`,`oc`.`IDOCUPACION` AS `IDOCUPACION`,concat(`p`.`APELLIDO`,' ',`p`.`NOMBRE`) AS `OCUPANTE`,concat(`e`.`DESCRIPCION`,' ',`d`.`DESCRIPCION`) AS `LOCACION` from (((`ocupacion` `oc` join `departamento` `d` on(((`oc`.`IDDEPARTAMENTO` = `d`.`IDDEPARTAMENTO`) and (`oc`.`IDEDIFICIO` = `d`.`IDEDIFICIO`)))) join `edificio` `e` on((`d`.`IDEDIFICIO` = `e`.`IDEDIFICIO`))) join `persona` `p` on((`oc`.`IDOCUPANTE` = `p`.`IDPERSONA`))) ;

--
-- VIEW  `vw_ocupacion`
-- Datos: Ninguna
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

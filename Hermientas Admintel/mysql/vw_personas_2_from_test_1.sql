-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2017 a las 21:31:22
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test_1`
--

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_personas_2`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_personas_2`  AS  select `persona`.`IDPERSONA` AS `IDOCUPANTE`,concat(`persona`.`APELLIDO`,' ',`persona`.`NOMBRE`) AS `OCUPANTE`,cast('Personal militar' as char(20) charset utf8mb4) AS `TIPO`,cast(`ocupante_militar`.`MATRICULA` as char(8) charset utf8mb4) AS `MATRICULA` from (`persona` join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) where (`persona`.`TIPO` = 'OCUP_MIL') union select `persona`.`IDPERSONA` AS `IdPersona`,concat(`persona`.`APELLIDO`,' ',`persona`.`NOMBRE`) AS `OCUPANTE`,cast('Personal civil' as char(20) charset utf8mb4) AS `cast('Personal civil' as char(20))`,cast(`ocupante_civil`.`LEGAJO` as char(8) charset utf8mb4) AS `matricula` from (`persona` join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where (`persona`.`TIPO` = 'OCUP_CIV') union select `persona`.`IDPERSONA` AS `IdPersona`,concat(`persona`.`APELLIDO`,' ',`persona`.`NOMBRE`) AS `OCUPANTE`,cast('Particular' as char(20) charset utf8mb4) AS `cast('Particular' as char(20))`,cast('Particular' as char(8) charset utf8mb4) AS `MATRICULA` from `persona` where (`persona`.`TIPO` = 'OCUP_PART') union select `persona`.`IDPERSONA` AS `IdPersona`,concat(`persona`.`APELLIDO`,' ',`persona`.`NOMBRE`) AS `OCUPANTE`,cast('Militar no ocupante' as char(20) charset utf8mb4) AS `TIPO`,cast(`militar_no_ocupante`.`MATRICULA` as char(8) charset utf8mb4) AS `matricula` from (`persona` join `militar_no_ocupante` on((`persona`.`IDPERSONA` = `militar_no_ocupante`.`IDPERSONA`))) where (`persona`.`TIPO` = 'MIL_NO_OCUP') ;

--
-- VIEW  `vw_personas_2`
-- Datos: Ninguna
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

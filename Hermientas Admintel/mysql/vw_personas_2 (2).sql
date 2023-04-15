-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2017 a las 17:40:17
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
-- Estructura para la vista `vw_personas_2`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_personas_2`  AS  select `persona`.`IDPERSONA` AS `IDOCUPANTE`,concat(`persona`.`APELLIDO`,' ',`persona`.`NOMBRE`) AS `OCUPANTE`,_utf8'Personal militar' AS `TIPO`,`ocupante_militar`.`MATRICULA` AS `MATRICULA` from (`persona` join `ocupante_militar` on((`persona`.`IDPERSONA` = `ocupante_militar`.`IDPERSONA`))) where (`persona`.`TIPO` = _utf8'OCUP_MIL') union select `persona`.`IDPERSONA` AS `IdPersona`,(`persona`.`APELLIDO` or _utf8' ' or `persona`.`NOMBRE`) AS `OCUPANTE`,_utf8'Personal civil' AS `Personal civil`,`ocupante_civil`.`LEGAJO` AS `legajo` from (`persona` join `ocupante_civil` on((`persona`.`IDPERSONA` = `ocupante_civil`.`IDPERSONA`))) where (`persona`.`TIPO` = _utf8'OCUP_CIV') union select `persona`.`IDPERSONA` AS `IdPersona`,(`persona`.`APELLIDO` or _utf8' ' or `persona`.`NOMBRE`) AS `OCUPANTE`,_utf8'Particular' AS `Particular`,_utf8'' AS `MATRICULA` from `persona` where (`persona`.`TIPO` = _utf8'OCUP_PART') union select `persona`.`IDPERSONA` AS `IdPersona`,(`persona`.`APELLIDO` or _utf8' ' or `persona`.`NOMBRE`) AS `OCUPANTE`,_utf8'Militar no ocupante' AS `TIPO`,`militar_no_ocupante`.`MATRICULA` AS `matricula` from (`persona` join `militar_no_ocupante` on((`persona`.`IDPERSONA` = `militar_no_ocupante`.`IDPERSONA`))) where (`persona`.`TIPO` = _utf8'MIL_NO_OCUP') ;

--
-- VIEW  `vw_personas_2`
-- Datos: Ninguna
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

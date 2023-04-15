-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2017 a las 21:24:34
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admintel_test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupante_civil`
--

CREATE TABLE `ocupante_civil` (
  `idpersona` int(11) NOT NULL,
  `categoria` varchar(10) DEFAULT NULL,
  `legajo` varchar(10) DEFAULT NULL,
  `sueldo` double DEFAULT NULL,
  `destino` varchar(30) DEFAULT NULL,
  `telefono_destino` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ocupante_civil`
--

INSERT INTO `ocupante_civil` (`idpersona`, `categoria`, `legajo`, `sueldo`, `destino`, `telefono_destino`) VALUES
(215, '', '007493-2', NULL, '', ''),
(279, '', '105708-3', NULL, '', ''),
(284, '', '225074-9', NULL, '', ''),
(286, '', '234797-6', NULL, '', ''),
(288, '', '259863-9', NULL, '', ''),
(291, '', '269487-1', NULL, '', ''),
(406, '', '717987-9', NULL, '', ''),
(407, '0902 14', '721089-2', 1806.6, 'ARMP', ''),
(408, '0804 16', '721557-3', 1339.61, 'BNMP', ''),
(410, '080117', '726850-6', 1393.33, 'BNMP', ''),
(413, '070214', '727131-5', 783.13, '', ''),
(414, '0701 16', '728878-0', 808.05, '', ''),
(415, '070116', '735826-5', 1309.02, 'ARMP', ''),
(416, '090313', '738415-9', 1092.1, 'BNMP', ''),
(417, '0901 15', '739434-4', 767.86, '', ''),
(418, '0701 10', '741307-7', 987.6, 'ARMP', ''),
(419, '0901 15', '743040-5', 987.6, 'BNMP', ''),
(420, '070110', '743043-3', 1309.02, 'ARMP', ''),
(421, '070305', '743235-7', 450, 'BNMP', ''),
(422, '0703 11', '743339-7', 768.12, 'ANAT', ''),
(423, '040406', '743744-0', 511.5, '', ''),
(424, '0807 12', '743844-7', 690.63, '', ''),
(425, '', '744248-4', NULL, '', ''),
(453, '', '729926-7', NULL, '', ''),
(479, '0804 05', '743745-3', 510.9, '', ''),
(481, '050116', '740841-5', 1146.19, 'ARMP', ''),
(482, '070214', '727131-5', 1243.27, 'BNMP', ''),
(515, '030703', '743010-7', 0, 'Portero HI 1249', ''),
(538, '070307', '743039-8', NULL, '', ''),
(516, 'Policia N', '743781-7', 477.4, '', ''),
(521, 'Polcia Na', '743499-4', 531.07, '', ''),
(523, 'Pol. Nava', '743361-0', 619.64, '', ''),
(614, '070116', '733719-6', 1318.65, 'BNMP', ''),
(616, '050119', '825693-6', 1571.66, 'ARMP', ''),
(624, '246400', '747725-8', 240.44, 'ESSB', ''),
(556, '070307', '742859-8', 492.5, '', ''),
(625, '070313', '737671-7', 1148.05, 'BNMP', ''),
(642, '030116', '743742-5', 720.72, 'ARMP', ''),
(643, '050209', '743651-8', 671.68, 'ARMP', ''),
(651, '081004', '743915-0', 544.78, 'ARMP', ''),
(672, '030115', '744671-6', 963.29, 'BNMP', ''),
(746, '040407', '742912-8', 492.5, 'BNMP', ''),
(750, '070713', '000000', 1015, 'ANAT', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ocupante_civil`
--
ALTER TABLE `ocupante_civil`
  ADD PRIMARY KEY (`idpersona`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

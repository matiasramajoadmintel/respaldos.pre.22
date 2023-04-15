-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2017 a las 22:10:34
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
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idespecialidad` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `abrev` varchar(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idespecialidad`, `descripcion`, `abrev`) VALUES
(1, 'Aeronautico', 'AE'),
(2, 'Armamento', 'AM'),
(46, 'Tropa Voluntaria', 'TV'),
(4, 'Artillero', 'AR'),
(5, 'Armas Submarinas', 'AS'),
(6, 'Auditor', 'AU'),
(7, 'Bioquímico', 'BQ'),
(8, 'Buzo Táctico', 'BT'),
(9, 'Buzo Salvamentista', 'BU'),
(10, 'Control de Averias', 'CA'),
(11, 'Comando', 'CD'),
(12, 'Contador', 'CO'),
(13, 'Cuerpo Profesional', 'CP'),
(14, 'Control Tiro', 'CT'),
(47, 'Retiro efectivo', 'RE'),
(16, 'Ejecutivo', 'EJ'),
(17, 'Electricista', 'EL'),
(18, 'Enfermero', 'EN'),
(19, 'Electrónico', 'ET'),
(48, 'Médico', 'Me'),
(21, 'Farmacia y Bioquímica', 'FB'),
(22, 'Furriel', 'FU'),
(23, 'General', 'GE'),
(24, 'Informaciones', 'IF'),
(25, 'Infante de Marina', 'IM'),
(26, 'Informática', 'IN'),
(27, 'Mar', 'MA'),
(28, 'Mecánico Electricista', 'ME'),
(29, 'Maquinista', 'MQ'),
(30, 'Mecanico Sistemas', 'MW'),
(31, 'Músico', 'MU'),
(34, 'Odontólogo', 'OD'),
(35, 'Operaciones', 'OP'),
(36, 'Personal Civil', 'PC'),
(37, 'Servicios Generales', 'SG'),
(38, 'Servicios Hidrográficos', 'SH'),
(39, 'Sonarista', 'SO'),
(40, 'Servicios Varios', 'SV'),
(41, 'Técnico', 'TE'),
(44, 'Arsenales', 'AN'),
(45, 'Comunicaciones', 'CO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `IDGRADO` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `ABREVIATURA` varchar(2) DEFAULT NULL,
  `TIEMPO_MINIMO` int(11) DEFAULT NULL,
  `COD201` float DEFAULT NULL,
  `COD209` float DEFAULT NULL,
  `ORDEN` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`IDGRADO`, `DESCRIPCION`, `ABREVIATURA`, `TIEMPO_MINIMO`, `COD201`, `COD209`, `ORDEN`) VALUES
(1, 'Almirante', 'AL', 4, 33896, 0, 1),
(2, 'Vicealmirante', 'VL', 3, 30228, 0, 2),
(3, 'Contraalmirante', 'CL', 8, 27236, 0, 3),
(4, 'Capitán de Navío', 'CN', 4, 24067, 0, 4),
(5, 'Capitán de Fragata', 'CF', 4, 21218, 0, 5),
(6, 'Capitán de Corbeta', 'CC', 4, 16999, 0, 6),
(7, 'Teniente de Navío', 'TN', 4, 14482, 0, 7),
(8, 'Teniente de Fragata', 'TF', 2, 12952, 0, 8),
(9, 'Teniente de Corbeta', 'TC', 2, 11677, 0, 9),
(10, 'Guardiamarina', 'GM', 2, 10599, 0, 10),
(11, 'Suboficial Mayor', 'SM', 4, 17388, 0, 11),
(12, 'Suboficial Principal', 'SP', 3, 15665, 0, 12),
(13, 'Suboficial Primero', 'SI', 3, 13962, 0, 13),
(14, 'Suboficial Segundo', 'SS', 3, 12365, 0, 14),
(15, 'Cabo Principal', 'CP', 2, 11101, 0, 15),
(16, 'Cabo Primero', 'CI', 2, 10036, 0, 16),
(17, 'Cabo Segundo', 'CS', 2, 9289, 0, 17),
(18, 'Marinero de Primera', 'MI', 1, 8461, 0, 18),
(19, 'Marinero de Segunda', 'MS', 1, 7939, 0, 19),
(22, 'Agente Policial ', 'AP', NULL, NULL, NULL, 20),
(23, 'Capitán FAE', 'Cp', NULL, 14482, NULL, 7),
(25, 'Prefectura Naval', 'PN', NULL, 333, NULL, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idespecialidad`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD UNIQUE KEY `IDGRADO` (`IDGRADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `IDGRADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

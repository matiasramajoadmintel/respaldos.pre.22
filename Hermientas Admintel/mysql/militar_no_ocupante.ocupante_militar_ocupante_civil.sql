-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2017 a las 21:56:22
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
-- Estructura de tabla para la tabla `militar_no_ocupante`
--

CREATE TABLE `militar_no_ocupante` (
  `idpersona` int(11) NOT NULL,
  `idgrado` int(11) NOT NULL,
  `matricula` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `militar_no_ocupante`
--

INSERT INTO `militar_no_ocupante` (`idpersona`, `idgrado`, `matricula`) VALUES
(457, 5, 'RE'),
(472, 26, '--'),
(544, 5, 'RE'),
(619, 5, '0000000'),
(547, 4, '0'),
(548, 5, 'RE'),
(212, 4, '004544-'),
(628, 6, '--'),
(648, 13, '365081-'),
(655, 3, '0000000'),
(657, 12, '0000000'),
(665, 6, '000000'),
(667, 7, '012609-'),
(673, 4, '0000000'),
(712, 4, '006819-'),
(733, 6, '000000'),
(741, 15, '0000000');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupante_militar`
--

CREATE TABLE `ocupante_militar` (
  `idpersona` int(11) NOT NULL,
  `idespecialidad` int(11) DEFAULT NULL,
  `antgrado` int(11) NOT NULL,
  `destino` varchar(30) DEFAULT NULL,
  `matricula` varchar(8) NOT NULL,
  `idgrado` int(11) NOT NULL,
  `rentapropia` double DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `ant_servicio` int(11) DEFAULT NULL,
  `telefono_destino` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ocupante_militar`
--

INSERT INTO `ocupante_militar` (`idpersona`, `idespecialidad`, `antgrado`, `destino`, `matricula`, `idgrado`, `rentapropia`, `fecha_ingreso`, `ant_servicio`, `telefono_destino`) VALUES
(203, 11, 1, 'PREF', '000000-', 6, NULL, '1986-01-01 23:41:10', 18, ''),
(204, 11, 1, 'BNMP', '000000-', 4, NULL, '1974-01-01 00:00:00', 30, ''),
(205, 12, 1, 'CTGN', '000000-', 4, NULL, '1980-01-01 23:41:10', 24, ''),
(206, 11, 1, 'RETIRADO', '000000-', 5, NULL, '1980-01-01 23:41:10', 24, ''),
(207, 11, 1, 'BNMP', '000111-', 4, NULL, '1974-01-01 00:00:00', 30, ''),
(208, 11, 1, 'BS.AS.', '001063-', 4, NULL, '1974-01-01 23:41:10', 30, ''),
(209, 47, 1, 'Retirado', '002234-', 6, NULL, '1986-01-01 23:41:10', 18, ''),
(210, 11, 1, 'ESBU', '003585-', 4, NULL, '1974-01-01 00:00:00', 30, ''),
(211, 11, 1, 'BNMP', '003606-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(212, 11, 1, '', '004544-', 4, NULL, '1980-01-01 23:41:10', 30, ''),
(213, 12, 13, 'DGPN  ', '006135-', 5, NULL, '1970-02-03 23:41:10', 37, ''),
(214, 26, 1, 'BNPB', '006413-', 5, NULL, '1980-01-01 23:41:10', 24, ''),
(216, 11, 1, 'BSAS', '007650-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(217, 11, 1, 'BHPD', '008997-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(218, 11, 5, 'EMCO', '009031-', 5, NULL, '1978-01-16 23:41:10', 29, ''),
(219, 11, 7, 'ANAT', '009355-', 5, NULL, '1979-01-15 23:41:10', 28, ''),
(220, 11, 3, 'ESSB  5053', '009452-', 5, NULL, '1979-01-15 23:41:10', 26, ''),
(221, 11, 1, '', '009517-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(222, 10, 1, 'AVGU', '009862-', 6, NULL, '1986-01-01 00:00:00', 18, ''),
(223, 11, 1, 'APBH', '009900-', 5, NULL, '1980-01-21 23:41:10', 27, ''),
(224, 11, 5, 'LGPA  7580', '010270-', 6, NULL, '1981-01-19 23:41:10', 24, ''),
(225, 11, 1, 'BNMP', '010310-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(226, 11, 1, 'BNMP', '010352-', 6, NULL, '1986-01-01 00:00:00', 18, ''),
(227, 11, 1, 'APBT', '010423-', 6, NULL, '1986-01-01 00:00:00', 18, ''),
(228, 11, 1, 'Retirado', '011111-', 4, NULL, '1947-01-20 23:41:10', 24, ''),
(229, 21, 1, 'DGPN', '011125-', 5, NULL, '1983-08-02 23:41:10', 25, ''),
(230, 11, 2, 'CBGR  5131', '011221-', 6, NULL, '1983-01-17 23:41:10', 23, ''),
(231, 11, 5, 'SUSC', '011473-', 6, NULL, '1984-01-23 23:41:10', 21, '5119'),
(232, 11, 1, 'CBGR', '011956-', 6, NULL, '1986-01-01 00:00:00', 18, ''),
(233, 11, 1, 'BNMP  5002', '012149-', 6, NULL, '1987-02-02 23:41:10', 18, ''),
(234, 11, 2, 'SUSL', '012219-', 6, NULL, '1987-02-02 23:41:10', 19, '5032'),
(235, 12, 1, 'BHPD', '012266-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(236, 11, 1, 'COFS  5040', '012406-', 6, NULL, '1988-01-25 23:41:10', 18, ''),
(237, 11, 1, 'SUSC', '012701-', 6, NULL, '1989-01-24 23:41:10', 19, ''),
(238, 11, 1, 'BHPD', '012885-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(239, 11, 1, 'BHPD', '012901-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(240, 11, 5, 'COFS', '012924-', 7, NULL, '1990-01-23 23:41:10', 17, ''),
(241, 11, 1, 'SUSA', '012986-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(242, 11, 1, 'ESBU', '013118-', 8, NULL, '1996-01-01 00:00:00', 8, ''),
(243, 12, 1, 'IBMP', '013222-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(244, 11, 1, 'SUSA', '013320-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(245, 11, 2, 'AVGU  5139', '013355-', 7, NULL, '1992-01-28 23:41:10', 13, ''),
(246, 11, 1, 'CBGU', '013377-', 7, NULL, '1992-01-01 23:41:10', 12, ''),
(247, 11, 2, 'ESOA', '013520-', 7, NULL, '1993-02-02 23:41:10', 14, ''),
(248, 11, 1, 'APBT', '013579-', 7, NULL, '1993-02-02 23:41:10', 15, '5008'),
(249, 11, 1, 'CBGR', '013593-', 7, NULL, '1993-02-02 23:41:10', 13, ''),
(250, 12, 1, 'BHPD  ', '013611-', 7, NULL, '1993-02-02 23:41:10', 14, ''),
(251, 11, 1, 'ESSB', '013686-', 8, NULL, '1996-01-01 00:00:00', 8, ''),
(252, 11, 1, 'ESOA', '013691-', 7, NULL, '1994-01-02 23:41:10', 13, ''),
(253, 11, 1, 'AVSC', '013765-', 8, NULL, '1996-01-01 00:00:00', 8, ''),
(254, 11, 1, 'SUSA', '013767-', 7, NULL, '1994-01-02 23:41:10', 13, ''),
(255, 11, 1, 'SUSC', '013907-', 7, NULL, '1995-01-02 23:41:10', 13, ''),
(256, 11, 1, 'CBGU', '013958-', 9, NULL, '2000-01-01 00:00:00', 4, ''),
(257, 11, 1, 'SUSA', '013984-', 8, NULL, '1995-02-01 23:41:10', 12, '5032'),
(258, 12, 2, 'CDGU', '014014-', 8, NULL, '1995-01-02 23:41:10', 12, ''),
(259, 11, 2, 'CBGR', '014154-', 8, NULL, '1996-01-27 23:41:10', 11, '5138'),
(260, 11, 1, 'LPPM', '014194-', 8, NULL, '1993-01-18 23:41:10', 13, '5297'),
(261, 11, 1, '', '014208-', 9, NULL, '2000-01-01 00:00:00', 4, ''),
(262, 12, 2, 'BNMP', '014216-', 9, NULL, '1996-01-27 23:41:10', 8, ''),
(263, 11, 1, 'AVSC', '014224-', 9, NULL, '2000-01-01 00:00:00', 4, ''),
(264, 11, 5, 'CBGR  5121', '014248-', 9, NULL, '1996-01-27 23:41:10', 9, ''),
(265, 11, 1, 'MPCZ', '014427-', 8, NULL, '1997-03-02 23:41:10', 10, ''),
(266, 11, 1, 'LPPM', '014631-', 9, NULL, '2000-01-01 00:00:00', 4, ''),
(267, 11, 1, 'ESSB', '014733-', 9, NULL, '2000-01-01 00:00:00', 4, ''),
(268, 11, 4, 'TRHE', '014764-', 7, NULL, '1999-02-03 23:41:10', 8, ''),
(269, 11, 1, 'COFS', '014951-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(270, 11, 1, 'BNMP', '022005-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(271, 13, 1, 'ARMP', '022018-', 8, NULL, '1996-01-01 00:00:00', 8, ''),
(272, 21, 1, 'INMP  5044', '022198-', 7, NULL, '2000-03-07 23:41:10', 9, ''),
(273, 13, 1, 'BNMP  5204', '022208-', 7, NULL, '2000-03-07 23:41:10', 9, ''),
(274, 11, 1, 'BNMP', '044444-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(275, 1, 1, 'Base Aerea MDP', '044448-', 23, NULL, '1996-01-01 23:41:10', 8, ''),
(276, 47, 1, 'Retirado', '051584-', 4, NULL, '1974-01-01 23:41:10', 30, ''),
(277, 11, 1, 'ANAT', '105174-', 4, NULL, '1974-01-01 23:41:10', 30, ''),
(278, 11, 1, 'BNMP', '105670-', 4, NULL, '1974-01-01 00:00:00', 30, ''),
(280, 11, 1, 'BNMP', '111111-', 7, NULL, '1992-01-01 23:41:10', 12, ''),
(281, 11, 1, 'BNMP', '143960-', 4, NULL, '1974-01-01 23:41:10', 30, ''),
(282, 47, 1, 'BNMP', '155272-', 8, NULL, '1980-01-01 23:41:10', 24, ''),
(283, 11, 1, 'BNMP', '216703-', 4, NULL, '1974-01-01 23:41:10', 30, ''),
(285, 11, 1, 'ESSB', '232658-', 9, NULL, '2000-01-01 00:00:00', 4, ''),
(287, 11, 1, 'BNMP', '236280-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(289, 10, 1, 'BNMP', '263463-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(290, 10, 1, 'BNMP', '268433-', 11, NULL, '1971-01-01 00:00:00', 33, ''),
(292, 11, 1, 'BNMP', '310149-', 5, NULL, '1980-01-01 00:00:00', 24, ''),
(293, 11, 1, 'BNMP', '333065-', 12, NULL, '1976-01-01 00:00:00', 28, ''),
(294, 11, 1, 'BNMP', '333643-', 12, NULL, '1976-01-01 00:00:00', 28, ''),
(295, 11, 1, 'DQY1', '338929-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(296, 22, 1, 'BSAS', '340336-', 12, NULL, '1976-01-01 23:41:10', 28, ''),
(297, 31, 1, 'ANAT', '343759-', 12, NULL, '1976-01-01 23:41:10', 28, ''),
(298, 31, 6, 'BNMP  5011', '343774-', 13, NULL, '1973-01-01 23:41:10', 32, ''),
(299, 31, 1, 'BNMP', '345852-', 12, NULL, '1973-01-10 23:41:10', 33, ''),
(300, 19, 1, 'DVPM', '346970-', 12, NULL, '1982-01-01 23:41:10', 22, ''),
(301, 29, 1, 'BNMP', '347231-', 11, NULL, '1974-01-10 23:41:10', 32, ''),
(302, 38, 1, 'ANAT 5217', '347736-', 11, NULL, '1974-01-23 23:41:10', 31, ''),
(303, 24, 1, 'ANAT', '349456-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(304, 35, 5, 'ANAT', '351713-', 12, NULL, '1976-01-29 23:41:10', 30, '5040'),
(305, 38, 1, 'BASE', '353493-', 12, NULL, '1976-01-14 23:41:10', 30, ''),
(306, 22, 2, 'ANAT  5196', '353554-', 12, NULL, '1976-01-01 23:41:10', 29, ''),
(307, 30, 1, 'DLMP', '353987-', 12, NULL, '1976-01-14 23:41:10', 30, ''),
(308, 30, 8, 'BNMP', '354032-', 13, NULL, '1976-01-29 23:41:10', 28, ''),
(309, 35, 1, 'COFS', '354166-', 12, 0, '1982-01-01 23:41:10', 22, ''),
(310, 40, 1, 'ANAT', '354820-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(311, 35, 1, 'ESSB  5211', '355203-', 12, NULL, '1977-02-01 23:41:10', 28, ''),
(312, 12, 1, 'BNMP', '355235-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(313, 22, 1, 'ANAT', '355320-', 12, NULL, '1978-01-09 23:41:10', 29, ''),
(314, 11, 1, 'BNMP', '355384-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(315, 27, 1, 'BNMP', '355586-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(316, 40, 1, 'ANAT', '356359-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(317, 29, 1, 'CBGU', '356684-', 12, NULL, '1976-01-01 23:41:10', 28, ''),
(318, 27, 1, 'CBGU', '357643-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(319, 27, 1, 'ARMP', '359083-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(320, 40, 1, '', '359162-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(321, NULL, 1, 'DVPM', '359259-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(322, NULL, 1, 'ARMP', '360960-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(323, 40, 1, 'BNMP  5013', '360968-', 13, NULL, '1979-01-31 23:41:10', 26, ''),
(324, 8, 5, 'APBT  5166', '361267-', 13, NULL, '1979-01-31 23:41:10', 26, ''),
(325, 27, 1, 'BHCR', '364496-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(326, 30, 1, 'ARMP', '365328-', 12, NULL, '1982-01-01 23:41:10', 22, ''),
(327, 40, 5, 'BHPD  5081', '365772-', 14, NULL, '1980-01-31 23:41:10', 25, ''),
(328, 40, 1, 'BNMP', '365997-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(329, 40, 1, 'APBT', '366251-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(330, 40, 1, 'CBGR', '367613-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(331, 45, 5, 'BNMP  5063', '368601-', 13, NULL, '1981-01-31 23:41:10', 24, ''),
(332, 12, 1, 'CBRO', '368742-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(333, 38, 1, 'BHPD', '371447-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(334, 40, 1, 'BNMP', '372319-', 13, NULL, '1988-01-01 23:41:10', 18, '5073'),
(335, 40, 1, 'BNMP', '373619-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(336, 29, 1, 'SUSA', '375240-', 13, 0, '1982-01-01 23:41:10', 22, ''),
(337, 30, 1, 'ESSB', '376051-', 13, NULL, '1982-01-01 23:41:10', 22, ''),
(338, 40, 1, 'BNMP', '376600-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(339, NULL, 1, 'CBDR', '377935-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(340, 27, 1, 'REPI', '378144-', 13, NULL, '1982-01-01 23:41:10', 22, ''),
(341, 12, 1, '', '379507-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(342, 12, 1, 'CBRO', '379515-', 13, NULL, '1982-01-01 00:00:00', 22, ''),
(343, 10, 1, 'CBGR', '379590-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(344, 40, 1, 'BHPD', '379869-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(345, 27, 1, 'AVGU', '379888-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(346, 27, 1, 'SISA', '380809-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(347, 40, 1, 'BNMP', '381218-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(348, 18, 1, 'BNMP', '384148-', 14, NULL, '1988-01-01 23:41:10', 16, ''),
(349, 40, 1, 'CBRO', '384804-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(350, 29, 1, 'BNMP  5013', '384902-', 13, NULL, '1984-01-16 23:41:10', 21, ''),
(351, 40, 1, 'ANAT', '384936-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(352, 31, 1, 'ANAT', '385245-', 13, NULL, '1988-01-01 23:41:10', 18, '5011'),
(353, 31, 1, 'ANAT', '385254-', 13, NULL, '1988-01-01 23:41:10', 18, '5011'),
(354, 29, 1, 'AVGU', '387185-', 14, NULL, '1988-01-01 23:41:10', 16, ''),
(355, 45, 1, 'CBDR', '389023-', 13, NULL, '1988-01-01 23:41:10', 16, ''),
(356, 29, 2, 'AVGU', '389305-', 14, NULL, '1988-01-01 23:41:10', 18, '5086'),
(357, 12, 1, 'ESSB', '390238-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(358, 12, 1, 'CBDR', '390372-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(359, 17, 1, 'BNMP', '390670-', 14, NULL, '1988-01-01 23:41:10', 16, ''),
(360, 12, 1, 'ANAT', '390714-', 14, NULL, '1988-01-01 23:41:10', 16, ''),
(361, 12, 1, 'BHCR', '390741-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(362, 11, 1, 'BNMP', '390927-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(363, 40, 1, 'IBMP', '390997-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(364, 8, 1, 'APBT', '392907-', 15, NULL, '1994-01-01 23:41:10', 10, ''),
(365, 40, 1, '', '394862-', 14, NULL, '1988-01-01 00:00:00', 16, ''),
(366, 40, 1, 'ARMP', '395029-', 16, NULL, '1999-01-01 00:00:00', 5, ''),
(367, 40, 1, 'AVGU', '397317-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(368, 40, 1, '', '397585-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(369, 40, 1, 'CBGR', '399001-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(370, 40, 3, 'SUSC', '399130-', 14, NULL, '1994-01-01 23:41:10', 10, ''),
(371, 40, 1, 'APBT', '401317-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(372, 40, 1, 'CBDR', '401392-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(373, 40, 1, 'BNMP', '401628-', 15, NULL, '1994-01-01 23:41:10', 10, '5134'),
(374, 8, 1, 'APBT', '401680-', 15, NULL, '1994-01-01 23:41:10', 10, ''),
(375, 17, 5, 'HNPB  9682', '401701-', 15, NULL, '1994-01-01 23:41:10', 15, ''),
(376, 29, 1, 'ARMP', '402247-', 16, 0, '1999-01-01 23:41:10', 5, ''),
(377, 35, 1, 'CBGR', '402615-', 14, NULL, '1991-03-08 23:41:10', 19, ''),
(378, 30, 1, 'ARMP', '402680-', 14, NULL, '1988-01-01 23:41:10', 16, '5564'),
(379, NULL, 1, 'BNMP', '403442-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(380, NULL, 1, 'CBGE', '404938-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(381, 45, 1, 'ESBU', '404988-', 15, NULL, '1994-01-01 23:41:10', 10, ''),
(382, NULL, 1, 'CBGR', '405036-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(383, 30, 1, 'ESSB', '405051-', 15, NULL, '1999-01-01 23:41:10', 5, ''),
(384, NULL, 1, 'ESSB', '405056-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(385, 29, 1, 'APBT  5166', '405140-', 15, NULL, '1992-02-04 23:41:10', 13, ''),
(386, 17, 1, 'APBT  5166', '405519-', 15, NULL, '1994-01-01 23:41:10', 10, ''),
(387, NULL, 1, 'AVGU', '406823-', 16, NULL, '1999-01-01 00:00:00', 5, ''),
(388, 9, 1, 'BNMP  5157', '406875-', 15, NULL, '1993-02-01 23:41:10', 12, ''),
(389, 45, 1, 'CBDR  5082', '406955-', 15, NULL, '1993-02-01 23:41:10', 12, ''),
(390, NULL, 1, 'CBES', '407058-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(391, 18, 1, 'AVIR', '408319-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(392, 18, 1, 'ANAT', '412188-', 16, NULL, '1999-01-01 00:00:00', 5, ''),
(393, 22, 2, 'BHCR', '412370-', 16, NULL, '1999-01-01 23:41:10', 6, '5153'),
(394, 40, 1, 'AVIR', '412467-', 16, NULL, '1999-01-01 00:00:00', 5, ''),
(395, 40, 1, 'BNMP 2345', '414709-', 16, NULL, '1999-01-01 23:41:10', 5, ''),
(396, 30, 1, 'SUSJ', '414911-', 16, NULL, '1999-01-01 23:41:10', 5, '5003'),
(397, 22, 1, 'DVPM', '416541-', 16, NULL, '1999-01-01 23:41:10', 5, ''),
(398, 40, 1, 'CBGU', '417041-', 16, NULL, '1999-01-01 00:00:00', 5, ''),
(399, 40, 1, 'CBGU  5131', '417119-', 16, NULL, '1998-02-02 23:41:10', 8, ''),
(400, 30, 1, 'AVIR', '417456-', 16, NULL, '1999-01-01 23:41:10', 5, ''),
(401, NULL, 2, 'ANAT', '419018-', 17, NULL, '2003-01-01 23:41:10', 4, ''),
(402, 29, 5, 'AVIR  5187', '419779-', 17, NULL, '2001-02-02 23:41:10', 6, ''),
(403, NULL, 1, 'ARMP', '419958-', 17, NULL, '2003-01-01 23:41:10', 1, ''),
(404, 11, 1, 'DNMDP', '474618-', 6, NULL, '1986-01-01 23:41:10', 18, ''),
(405, 11, 1, 'BNMP', '515849-', 5, NULL, '1980-01-01 23:41:10', 24, ''),
(426, 11, 1, 'BNMP', '902108-', 7, NULL, '1992-01-01 00:00:00', 12, ''),
(427, 11, 1, 'PREFEC', '912183-', 15, NULL, '1994-01-01 00:00:00', 10, ''),
(430, 29, 2, 'BNMP', '401548-', 14, 0, '1990-08-02 23:41:10', 18, ''),
(429, 40, 2, 'DVPM  5118', '4171269', 16, NULL, '1998-02-02 23:41:10', 8, ''),
(433, 11, 6, 'ANAT   5196', '005954-', 4, NULL, '1970-03-02 23:41:10', 35, ''),
(436, 1, 1, 'Base Aerea MdP', 'xx', 23, 0, '1980-01-01 23:41:10', 10, ''),
(459, 22, 3, 'SUSJ', '398739-', 15, NULL, '1993-01-11 23:41:10', 12, ''),
(438, 22, 1, 'BNMP', '415162-', 16, 0, '1997-01-06 23:41:10', 7, ''),
(760, 14, 8, 'CBGR', '390747-', 15, NULL, '1989-07-09 23:41:10', 18, '5138'),
(439, 27, 2, 'APBT', '357740-', 13, 0, '1980-01-01 23:41:10', 20, ''),
(483, 48, 2, 'BNMP  5128', '023023-', 8, NULL, '2004-03-01 23:41:10', 5, ''),
(441, 44, 4, 'ARMP', '419958-', 17, 0, '1997-01-06 23:41:10', 7, ''),
(766, 27, 5, 'ESNP', '398775-', 14, NULL, '1989-02-08 23:41:10', 19, ''),
(445, 45, 4, 'BNMP', '355090-', 13, 0, '1980-01-01 23:41:10', 25, ''),
(567, 17, 4, 'ARMP', '367993-', 13, NULL, '1981-01-31 23:41:10', 24, ''),
(446, 30, 2, 'COFS', '399130-', 14, 0, '1985-01-21 23:41:10', 20, ''),
(447, 29, 5, 'AVIR', '414956-', 15, 0, '1986-01-13 23:41:10', 18, ''),
(448, 29, 3, 'AVIR', '390741-', 14, 0, '1980-01-01 23:41:10', 25, ''),
(449, 44, 1, 'ARMP', '420065-', 16, 0, '1998-01-12 23:41:10', 7, ''),
(450, 27, 1, 'CBDR', '418831.', 18, 0, '2000-01-10 23:41:10', 6, '5082'),
(451, 22, 3, 'BNMP', '408369-', 16, 0, '1997-01-13 23:41:10', 8, ''),
(568, 11, 1, 'DELA', '014501-', 8, NULL, '1997-03-02 23:41:10', 10, ''),
(452, 37, 4, 'CBDR', '417111-', 16, 0, '1998-01-05 23:41:10', 7, ''),
(454, 11, 5, 'BNMP  5120', '008073-', 5, NULL, '1976-01-20 23:41:10', 27, ''),
(455, 11, 1, 'AVGU', '013407-', 7, 0, '1993-02-02 23:41:10', 14, ''),
(461, 11, 1, 'DVPM', '010398-', 5, NULL, '1981-01-19 23:41:10', 24, '5118'),
(463, 11, 6, 'ESSB', '008551-', 5, NULL, '1977-01-18 23:41:10', 30, '5053'),
(464, 11, 1, 'CBGR ', '014437-', 8, NULL, '1997-03-02 23:41:10', 10, '5121'),
(466, 11, 1, 'SUSC  5119', '013329-', 7, NULL, '1992-02-01 23:41:10', 12, ''),
(484, 11, 3, 'AVSC  5114', '011139-', 6, NULL, '1983-01-17 23:41:10', 22, ''),
(486, 11, 3, 'COFS  5172', '006389-', 4, NULL, '1971-02-01 23:41:10', 34, ''),
(487, 11, 3, 'ARMP  5164', '11739-2', 6, NULL, '1985-02-19 23:41:10', 20, ''),
(488, 11, 5, 'ANAT  5240', '007654-', 5, NULL, '1975-01-29 23:41:10', 30, ''),
(489, 11, 1, 'SUSA', '014436-', 8, NULL, '1997-03-02 23:41:10', 10, ''),
(490, 11, 1, 'SUSC  ', '014482-', 8, NULL, '1997-02-03 23:41:10', 11, '5119'),
(491, 11, 2, 'AVIR  5133', '012840-', 7, NULL, '1990-01-23 23:41:10', 15, ''),
(569, 27, 2, 'AVSC', '417220-', 16, NULL, '1998-02-02 23:41:10', 8, ''),
(493, 11, 1, 'COFS', '807035', 5, NULL, NULL, 1, ''),
(494, 13, 3, 'ESSB', '022191-', 7, NULL, '2000-07-03 23:41:10', 7, ''),
(496, 11, 3, 'CBDR', '022807-', 8, NULL, '1992-09-16 23:41:10', 15, ''),
(501, 11, 1, 'CBGR', '014246-', 9, NULL, '1999-03-02 23:41:10', 6, ''),
(502, 13, 4, 'BHPD', '022620-', 8, NULL, '2003-03-03 23:41:10', 4, '5151'),
(504, 11, 1, 'ANAT', '012920-', 7, NULL, '1990-01-23 23:41:10', 18, ''),
(505, 11, 2, 'BHCR', '013132-', 7, NULL, '1985-03-02 23:41:10', 20, ''),
(506, 12, 1, 'CBGR', '013781-', 8, NULL, NULL, 12, ''),
(508, 11, 1, 'BNMP', '012979-', 7, NULL, '1985-03-02 23:41:10', 20, ''),
(509, 11, 1, 'BNMP', '012995-', 6, NULL, '1990-03-23 23:41:10', 18, ''),
(512, 11, 1, 'ESSB', '013367-', 7, NULL, '1985-03-02 23:41:10', 15, '5132'),
(514, 11, 2, 'CBDR', '012856-', 7, NULL, '1985-03-02 23:41:10', 20, ''),
(516, 16, 1, 'BNMP', '743781-', 22, NULL, NULL, 20, ''),
(517, 18, 2, 'BHCR', '416272-', 15, NULL, '1990-02-02 23:41:10', 15, ''),
(518, 30, 1, 'CBGU', '417580-', 16, NULL, '1992-03-02 23:41:10', 13, ''),
(519, 22, 1, 'APBT', '381510-', 13, NULL, '1980-02-03 23:41:10', 25, ''),
(520, 22, 4, 'BNMP  5056', '389163-', 14, NULL, '1986-03-10 23:41:10', 19, ''),
(521, 41, 1, 'BNMP', '743499-', 22, NULL, '1998-03-03 23:41:10', 7, ''),
(522, 29, 1, 'CBDR  ', '408919-', 15, NULL, '1994-02-09 23:41:10', 11, '5082'),
(523, 41, 1, 'BNMP', '743361-', 22, NULL, '1995-02-03 23:41:10', 10, ''),
(524, 24, 1, 'COFM', '355241-', 12, NULL, '1974-02-12 23:41:10', 31, ''),
(525, 18, 1, 'BNMP', '394828-', 14, NULL, '1988-03-07 23:41:10', 18, ''),
(526, 22, 1, 'BHPD  5081', '390185-', 14, NULL, '1987-02-09 23:41:10', 18, ''),
(527, 30, 1, 'CBGU  5131', '393304-', 14, NULL, '1998-02-08 23:41:10', 17, ''),
(528, 37, 1, 'ANAT', '384967-', 14, NULL, '1991-02-03 23:41:10', 14, ''),
(529, 27, 1, 'BHPD   ', '418795-', 16, NULL, '2000-02-02 23:41:10', 7, '5081'),
(530, 37, 4, 'CBGU', '416610-', 16, NULL, '1996-03-02 23:41:10', 9, ''),
(531, 45, 2, 'REPI', '417282-', 16, NULL, '1998-02-02 23:41:10', 8, '5096'),
(532, 9, 2, 'ESSB  5211', '407252-', 15, NULL, '1993-02-01 23:41:10', 12, ''),
(533, 40, 5, 'CBGR  5138', '416719-', 16, NULL, '1997-02-03 23:41:10', 9, ''),
(534, 45, 1, 'AVGU', '402215-', 14, NULL, '1990-02-03 23:41:10', 16, '5086'),
(535, 30, 2, 'SUSA', '417411-', 16, NULL, '1998-02-02 23:41:10', 8, '5080'),
(536, 45, 1, 'BNMP  5063', '344625-', 12, NULL, '1973-01-25 23:41:10', 32, ''),
(570, 11, 4, 'CBGR', '012920-', 7, NULL, '1990-01-23 23:41:10', 15, ''),
(623, 9, 1, 'ESSB', '385104-', 13, NULL, '1984-01-20 23:41:10', 22, ''),
(631, 11, 1, 'CBDR', '022069-', 10, NULL, '1999-01-18 23:41:10', 1, '5148'),
(539, 45, 2, 'AVGU', '394013-', 14, NULL, '1989-02-03 23:41:10', 16, ''),
(784, 11, 1, 'CBDR', '013941-', 7, NULL, '1997-02-03 23:41:10', 11, ''),
(540, 9, 5, 'BNMP', '406806-', 15, NULL, '1990-03-02 23:41:10', 15, ''),
(541, 9, 2, 'ESSB  5211', '407348-', 15, NULL, '1993-02-01 23:41:10', 12, ''),
(542, 9, 2, 'APBT', '414917-', 16, NULL, '1995-03-02 23:41:10', 10, ''),
(545, 27, 2, '', '361941-', 12, NULL, '1979-01-31 23:41:10', 26, ''),
(546, 13, 3, 'BNMP    5128', '011385-', 5, NULL, '1983-10-11 23:41:10', 27, ''),
(549, 9, 2, 'ESSB   5045', '393260-', 14, NULL, '1988-02-09 23:41:10', 17, ''),
(572, 22, 7, '', '407431-', 15, NULL, '1993-02-01 23:41:10', 16, ''),
(573, 29, 3, 'SUSA', '406978-', 15, NULL, '1993-02-03 23:41:10', 13, ''),
(574, 11, 1, 'CBDR', '014608-', 8, NULL, '1998-03-02 23:41:10', 10, ''),
(559, 17, 4, 'ARMP', '367993-', 13, NULL, '1985-02-03 23:41:10', 20, ''),
(561, 11, 1, 'AVIR', '014272-', 8, NULL, '1996-02-02 23:41:10', 10, ''),
(563, 11, 1, 'CBDR', '022037-', 10, NULL, '2000-02-01 23:41:10', 5, ''),
(564, 44, 5, 'CBGR', '402891-', 14, NULL, '1990-03-15 23:41:10', 15, ''),
(565, 35, 1, 'CBGU', '398919-', 14, NULL, '1989-02-01 23:41:10', 16, ''),
(566, 27, 2, 'AVSC   5076', '417220-', 16, NULL, '1997-02-10 23:41:10', 8, ''),
(577, 22, 5, '', '389292-', 14, NULL, '1986-03-10 23:41:10', 20, ''),
(578, 29, 4, 'DVPM', '397839-', 14, NULL, '1994-02-08 23:41:10', 19, ''),
(580, 31, 8, '', '357983-', 13, NULL, '1978-01-31 23:41:10', 28, ''),
(581, 27, 1, 'ARMP', '352286-', 15, NULL, '1976-02-01 23:41:10', 30, ''),
(582, 29, 6, 'CBGU', '388869-', 14, NULL, '1986-02-01 23:41:10', 20, ''),
(583, 45, 5, 'IBMP', '391125-', 14, NULL, '1987-02-12 23:41:10', 19, ''),
(584, 17, 3, 'BNMP', '394709-', 14, NULL, '1988-02-08 23:41:10', 20, ''),
(585, 22, 3, 'CBDR', '390318-', 14, NULL, '1987-02-07 23:41:10', 19, ''),
(587, 19, 6, 'CBGR', '402939-', 14, NULL, '1990-03-05 23:41:10', 16, ''),
(588, 25, 3, 'BNMP', '416975-', 16, NULL, '1998-02-12 23:41:10', 8, ''),
(589, 17, 3, 'CBGR', '405786-', 14, NULL, '1988-02-01 23:41:10', 18, ''),
(590, 37, 5, 'COFS', '385112-', 14, NULL, '1984-02-01 23:41:10', 22, ''),
(591, 11, 5, 'BHPD', '013175-', 7, NULL, '1991-01-22 23:41:10', 16, ''),
(592, 11, 1, 'BHPD', '013495-', 7, NULL, '1992-02-01 23:41:10', 16, ''),
(593, 11, 2, 'BHCR', '022154-', 10, NULL, '2000-02-01 23:41:10', 6, ''),
(594, 11, 2, 'ESSB', '014618-', 9, NULL, '1998-01-01 23:41:10', 8, ''),
(595, 12, 1, 'ESGN', '022165-', 10, NULL, '2000-02-02 23:41:10', 8, ''),
(596, 11, 1, 'APBT', '014440-', 8, NULL, '1997-03-02 23:41:10', 10, '5166'),
(597, 11, 1, 'CBGR', '014425-', 8, NULL, '1997-03-02 23:41:10', 10, ''),
(599, 11, 4, 'BHPD', '011668-', 6, NULL, '1985-02-19 23:41:10', 22, ''),
(600, 11, 5, 'CBDR', '012925-', 7, NULL, '1990-01-23 23:41:10', 17, ''),
(613, 6, 1, 'ANAT', '022609-', 7, NULL, '2002-04-03 23:41:10', 5, ''),
(603, 11, 4, 'BNMP', '014774-', 7, NULL, '1999-02-03 23:41:10', 8, ''),
(605, 11, 2, 'ESBU', '014717-', 9, NULL, '1998-02-22 23:41:10', 8, ''),
(606, 11, 1, 'CBGU', '014423-', 9, NULL, '1997-03-02 23:41:10', 10, ''),
(607, 22, 4, 'ANAT', '371560-', 13, NULL, '1981-01-31 23:41:10', 25, ''),
(608, 45, 6, 'AVGU', '403732-', 15, NULL, '1991-03-02 23:41:10', 15, ''),
(609, 45, 1, 'BNMP', '379664-', 13, NULL, '1983-02-01 23:41:10', 23, ''),
(610, 45, 2, 'CBDR', '014024-', 8, NULL, '1995-01-02 23:41:10', 12, '5148'),
(611, 11, 1, 'CBGU', '014187-', 8, NULL, '1997-03-02 23:41:10', 9, ''),
(612, 11, 2, 'APBT', '012117-', 6, NULL, '1987-02-02 23:41:10', 19, ''),
(615, 13, 4, 'ARMP', '022629-', 8, NULL, '2003-03-03 23:41:10', 4, ''),
(622, 11, 3, 'AVSC', '014697-', 9, NULL, '1998-03-02 23:41:10', 9, '5076'),
(633, 40, 3, 'CBGU', '417121-', 16, NULL, '1998-02-02 23:41:10', 8, ''),
(634, 35, 2, 'SUSA', '399117-', 14, NULL, '1989-02-01 23:41:10', 17, ''),
(636, 27, 5, 'AVGU', '420120-', 17, NULL, '2001-02-02 23:41:10', 6, ''),
(637, 35, 3, 'CBGR', '417249-', 16, NULL, '1998-02-02 23:41:10', 8, ''),
(638, 48, 3, 'BNMP', '023018-', 8, NULL, '2004-01-01 23:41:10', 6, '5015'),
(641, 11, 5, 'SUSC', '012916-', 7, NULL, '1990-01-23 23:41:10', 16, '5119'),
(644, 22, 1, 'BHPD', '418740-', 16, NULL, '2000-02-02 23:41:10', 7, '5081'),
(645, 27, 5, 'BHPD', '419873-', 17, NULL, '2001-02-02 23:41:10', 6, '5081'),
(649, 35, 1, 'SUSJ', '407284-', 15, NULL, '1993-02-01 23:41:10', 13, '5084'),
(652, 11, 1, 'SUSC', '014685-', 8, NULL, '1998-03-02 23:41:10', 9, ''),
(653, 9, 6, 'ESSB', '389002-', 14, NULL, '1986-03-10 23:41:10', 20, '5211'),
(656, 17, 3, 'CBGU', '407429-', 15, NULL, '1993-02-01 23:41:10', 13, '5131'),
(659, 13, 1, 'COFS', '023348-', 8, NULL, '1989-08-02 23:41:10', 18, ''),
(660, 17, 1, 'SUSA', '387579-', 13, NULL, '1985-02-04 23:41:10', 21, ''),
(662, 22, 1, 'APNH', '418738-', 16, NULL, '2000-02-02 23:41:10', 7, '5193'),
(669, 12, 5, 'CBGU', '013134-', 7, NULL, '1991-01-22 23:41:10', 16, ''),
(670, 8, 4, 'APBT', '405139-', 15, NULL, '1992-02-04 23:41:10', 14, '5166'),
(671, 31, 7, 'ANAT', '403613-', 15, NULL, '1991-03-03 23:41:10', 15, '5011'),
(676, 27, 5, 'CBGR', '420181-', 17, NULL, NULL, 6, '5138'),
(677, 11, 1, 'AVGU', '014397-', 8, NULL, '1997-03-02 23:41:10', 10, '5111'),
(678, 11, 5, 'AVSC', '013212-', 7, NULL, '1991-01-22 23:41:10', 16, '5111'),
(679, 11, 2, 'ESSB', '014989-', 9, NULL, '1999-02-02 23:41:10', 8, '5211'),
(680, 12, 6, 'BNMP', '011582-', 6, NULL, '1984-01-23 23:41:10', 23, ''),
(681, 29, 4, 'CBDR', '407489-', 15, NULL, '1993-02-02 23:41:10', 14, ''),
(682, 11, 2, 'ESSB', '014860-', 9, NULL, '1999-02-02 23:41:10', 8, '5211'),
(683, 35, 5, 'ANAT', '414854-', 16, NULL, '1996-02-06 23:41:10', 11, ''),
(684, 29, 2, 'DVPM', '419069-', 16, NULL, '2000-02-02 23:41:10', 7, '5070'),
(685, 11, 1, 'SUSA', '014705-', 8, NULL, '1999-03-02 23:41:10', 10, '5032'),
(686, 38, 1, 'ANAT', '412199-', 14, NULL, '1995-02-01 23:41:10', 12, ''),
(687, 11, 5, 'CBGR', '013117-', 7, NULL, '1991-01-22 23:41:10', 16, ''),
(688, 22, 2, 'AVGU', '418731-', 16, NULL, '2000-02-02 23:41:10', 7, ''),
(689, 27, 8, 'REON', '401458-', 15, NULL, '1990-02-02 23:41:10', 17, '5096'),
(690, 13, 1, 'ARMP', '013834-', 6, NULL, '1994-09-08 23:41:10', 13, '5001'),
(694, 22, 2, 'FRLI', '418732-', 16, NULL, '2000-02-02 23:41:10', 7, ''),
(695, 11, 2, 'ESSB', '014898-', 9, NULL, '1999-02-02 23:41:10', 8, '5145'),
(698, 31, 3, 'ANAT', '358143-', 12, NULL, '1978-01-01 23:41:10', 29, '5011'),
(697, 40, 2, 'BHPD', '418855-', 16, NULL, '2000-02-02 23:41:10', 7, ''),
(701, 12, 2, 'ESSB', '013578-', 7, NULL, '1993-02-02 23:41:10', 14, '5045'),
(707, 45, 3, 'AVGU', '417875-', 16, NULL, '1999-02-01 23:41:10', 8, ''),
(708, 11, 1, 'CBDR', '014613-', 8, NULL, '1998-03-02 23:41:10', 10, '5148'),
(709, 11, 2, 'AVIR', '022250-', 10, NULL, '2001-05-02 23:41:10', 6, '5178'),
(710, 31, 4, 'JEMD', '389241-', 14, NULL, '1987-03-23 23:41:10', 20, ''),
(714, 11, 1, 'BHPD', '014521-', 8, NULL, '1997-03-02 23:41:10', 10, '5181'),
(716, 22, 4, 'BHPD', '405553-', 15, NULL, '1992-02-04 23:41:10', 15, '5081'),
(717, 11, 2, 'AVIR', '014247-', 8, NULL, '1996-01-27 23:41:10', 11, '5133'),
(718, 37, 7, 'AVSC', '397566-', 15, NULL, '1989-02-02 23:41:10', 18, ''),
(722, 11, 1, 'ANAT', '012622-', 6, NULL, '1989-01-24 23:41:10', 18, ''),
(723, 11, 2, 'CBGR', '014841-', 9, NULL, '1999-02-02 23:41:10', 8, '5107'),
(724, 11, 3, 'BHPD', '014624-', 9, NULL, '1998-02-03 23:41:10', 9, '5081'),
(725, 35, 1, 'ANAT', '425630-', 17, NULL, '2006-02-08 23:41:10', 1, '5054'),
(726, 29, 4, 'CBGU', '421858-', 17, NULL, '2003-02-01 23:41:10', 4, ''),
(727, 30, 4, 'CBDR', '403502-', 15, NULL, '1991-02-01 23:41:10', 16, '5082'),
(728, 27, 2, 'BNMP', '365596-', 12, NULL, '1980-01-31 23:41:10', 27, '5071'),
(729, 13, 4, 'BNIM', '011080-', 5, NULL, '1969-01-06 23:41:10', 38, '13-83'),
(730, 11, 3, 'SUSJ', '014472-', 9, NULL, '2004-02-01 23:41:10', 2, ''),
(731, 11, 2, 'ESAM', '022123-', 9, NULL, '2000-02-02 23:41:10', 6, '5890'),
(735, 29, 1, 'BHPD', '420584-', 16, NULL, '2002-02-02 23:41:10', 6, ''),
(736, 37, 1, 'AVGU', '420155-', 16, NULL, '2001-02-02 23:41:10', 6, '5086'),
(737, 11, 2, 'ESSB', '014888-', 9, NULL, '2005-01-01 23:41:10', 2, '5045'),
(738, 26, 5, 'ANAT', '374191-', 13, NULL, '1982-01-02 23:41:10', 25, '5238'),
(739, 29, 4, 'ESSB', '421621-', 17, NULL, '2003-02-01 23:41:10', 5, ''),
(743, 22, 4, 'ESSB', '421836-', 17, NULL, '2003-02-01 23:41:10', 4, ''),
(744, 45, 3, 'AVGU', '423010-', 17, NULL, NULL, 3, ''),
(747, 27, 3, 'CBDR', '418132-', 16, NULL, '1999-02-01 23:41:10', 8, '5082'),
(748, 11, 1, 'SUSC', '014695-', 8, NULL, '2004-12-31 23:41:10', 10, ''),
(749, 27, 2, 'AVGU', '419196-', 16, NULL, '2000-02-02 23:41:10', 7, '5086'),
(754, 29, 3, 'AVGU', '422929-', 17, NULL, '2004-02-03 23:41:10', 3, '5086'),
(756, 35, 2, 'CBGR', '424070-', 17, NULL, '2005-01-31 23:41:10', 2, ''),
(757, 29, 4, 'CBGU', '421519-', 17, NULL, '2003-02-01 23:41:10', 4, ''),
(758, 29, 4, 'AVGU', '421471-', 17, NULL, '2003-02-01 23:41:10', 4, ''),
(759, 37, 3, 'BHPD', '417097-', 16, NULL, '1998-02-02 23:41:10', 9, ''),
(761, 27, 8, 'CBGU', '417836-', 16, NULL, '1999-02-01 23:41:10', 8, '5131'),
(762, 18, 3, 'TRHE', '389631-', 14, NULL, '1986-03-05 23:41:10', 21, '7211'),
(763, 31, 7, 'ANAT', '389324-', 14, NULL, '1986-03-10 23:41:10', 23, '5011'),
(765, 22, 2, 'IBMP', '397483-', 14, NULL, '1989-02-02 23:41:10', 18, '5044'),
(767, 13, 1, 'BHCR', '022644-', 9, NULL, '2003-03-03 23:41:10', 4, ''),
(768, 29, 2, 'CBDR', '398392-', 13, NULL, '1989-02-06 23:41:10', 18, ''),
(769, 45, 4, 'BNMP', '398910-', 13, NULL, '1989-02-01 23:41:10', 18, '5063'),
(770, 11, 5, 'ESSB', '013402-', 7, NULL, '1992-01-28 23:41:10', 15, ''),
(771, 13, 1, 'ANAT', '022631-', 7, NULL, '2003-03-03 23:41:10', 4, '5020'),
(772, 13, 2, 'ESSB', '022091-', 9, NULL, '2000-02-02 23:41:10', 7, '5211'),
(773, 11, 5, 'BHPD', '011669-', 6, NULL, '1985-02-19 23:41:10', 22, '5051'),
(774, 13, 1, 'CBDR', '014551-', 8, NULL, '1998-01-20 23:41:10', 10, '50852'),
(775, 13, 1, 'BHCR', '022782-', 10, NULL, '2003-02-03 23:41:10', 4, '5059'),
(777, 11, 1, 'CBGR', '014438-', 8, NULL, '1997-02-03 23:41:10', 11, '5107'),
(778, 17, 5, 'ARMP', '380814-', 13, NULL, '1983-01-13 23:41:10', 25, '5100'),
(779, 26, 3, 'ARMP', '419182-', 16, NULL, '2000-02-02 23:41:10', 8, '5164'),
(780, 26, 3, 'ANAT', '401780-', 14, NULL, '1990-02-02 23:41:10', 18, ''),
(781, 31, 5, 'ANAT', '373685-', 13, NULL, '1982-01-01 23:41:10', 26, '5011'),
(782, 22, 5, 'APBT', '405626-', 15, NULL, '1992-02-04 23:41:10', 16, '5008'),
(783, 11, 1, 'CBGU', '014542-', 8, NULL, '1999-01-02 23:41:10', 9, ''),
(785, 11, 3, 'ESSB', '014631-', 9, NULL, '1998-02-03 23:41:10', 10, '5211'),
(786, 11, 5, 'CBGR', '011726-', 6, NULL, '1985-02-19 23:41:10', 23, '5107'),
(787, 11, 2, 'CBDR', '014522-', 8, NULL, '1997-02-04 23:41:10', 11, ''),
(788, 9, 1, 'ESSB', '368443-', 12, NULL, '1981-01-31 23:41:10', 27, '5045'),
(789, 13, 2, 'ANAT', '022588-', 7, NULL, '2002-01-01 23:41:10', 6, '5238'),
(790, 11, 5, 'SUSA', '013367-', 7, NULL, '1992-01-31 23:41:10', 16, '5032'),
(791, 13, 2, 'BNMP', '023858-', 8, NULL, '2007-03-19 23:41:10', 1, '5090'),
(792, 17, 4, 'COFS', '393849-', 14, NULL, '1988-02-03 23:41:10', 20, '5040'),
(793, 29, 2, 'BHPD', '419892-', 16, NULL, '2007-02-02 23:41:10', 7, ''),
(794, 9, 3, 'ESSB', '360746-', 12, NULL, '1979-01-31 23:41:10', 29, ''),
(795, 37, 5, 'BHPD', '417150-', 16, NULL, '1998-02-02 23:41:10', 10, '5081'),
(796, 11, 3, 'ESSB', '014598-', 9, NULL, '1998-02-03 23:41:10', 10, '5045'),
(797, 11, 2, 'ESSB', '022124-', 9, NULL, '2000-02-02 23:41:10', 7, ''),
(798, 30, 3, 'AVGU', '419198-', 16, NULL, '2000-02-02 23:41:10', 7, ''),
(799, 11, 3, 'ESSB', '014785-', 9, NULL, '1999-02-02 23:41:10', 9, '5045'),
(801, 27, 6, 'AVGU', '405449-', 15, NULL, '1992-02-02 23:41:10', 16, ''),
(802, 11, 9, 'AVIR', '014947-', 9, NULL, NULL, 9, '5133'),
(803, 37, 1, 'BHPD', '401176-', 14, NULL, '1990-02-07 23:41:10', 18, ''),
(804, 9, 2, 'ESSB', '414887-', 15, NULL, '1980-01-01 23:41:10', 12, ''),
(0, 44, 4, 'RER', '4444', 4, 44444, NULL, 4, '2323');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `militar_no_ocupante`
--
ALTER TABLE `militar_no_ocupante`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `militarnoocupante_grado_fk` (`idgrado`);

--
-- Indices de la tabla `ocupante_civil`
--
ALTER TABLE `ocupante_civil`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `ocupante_militar`
--
ALTER TABLE `ocupante_militar`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `ocupantemilitar_especialidad_fk` (`idespecialidad`),
  ADD KEY `ocupantemilitar_grado_fk` (`idgrado`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

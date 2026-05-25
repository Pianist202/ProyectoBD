-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2026 a las 16:43:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `ID_MATERIA` varchar(4) NOT NULL,
  `ID_MAESTRO` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `ID_CARRERA` varchar(4) NOT NULL,
  `CARRERA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_maestro`
--

CREATE TABLE `datos_maestro` (
  `ID_MAESTRO` varchar(4) NOT NULL,
  `NOMBRE` text NOT NULL,
  `DIRECCIÓN` varchar(10) NOT NULL,
  `TELEFONO` varchar(10) NOT NULL,
  `ID_SEXO` varchar(4) NOT NULL,
  `ID_CARRERA` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `ID_MATERIA` varchar(4) NOT NULL,
  `MATERIA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `ID_SEXO` varchar(4) NOT NULL,
  `SEXO` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD KEY `fk_maestro` (`ID_MAESTRO`),
  ADD KEY `fk_materia` (`ID_MATERIA`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`ID_CARRERA`);

--
-- Indices de la tabla `datos_maestro`
--
ALTER TABLE `datos_maestro`
  ADD PRIMARY KEY (`ID_MAESTRO`),
  ADD KEY `fk_carrera` (`ID_CARRERA`),
  ADD KEY `fk_sexo` (`ID_SEXO`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`ID_MATERIA`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`ID_SEXO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `fk_maestro` FOREIGN KEY (`ID_MAESTRO`) REFERENCES `datos_maestro` (`ID_MAESTRO`),
  ADD CONSTRAINT `fk_materia` FOREIGN KEY (`ID_MATERIA`) REFERENCES `materias` (`ID_MATERIA`);

--
-- Filtros para la tabla `datos_maestro`
--
ALTER TABLE `datos_maestro`
  ADD CONSTRAINT `fk_carrera` FOREIGN KEY (`ID_CARRERA`) REFERENCES `carrera` (`ID_CARRERA`),
  ADD CONSTRAINT `fk_sexo` FOREIGN KEY (`ID_SEXO`) REFERENCES `sexo` (`ID_SEXO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

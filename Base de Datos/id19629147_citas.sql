-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2022 a las 20:06:17
-- Versión del servidor: 10.5.16-MariaDB
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id19629147_citas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`id19629147_papu1`@`%` PROCEDURE `insertar_cliente` (IN `idCliente` INT, IN `numDocCliente` VARCHAR(50), IN `tipoDocCliente` VARCHAR(50), IN `nombreDocCliente` VARCHAR(50), IN `apellidoDocCliente` VARCHAR(50), IN `direccionCliente` VARCHAR(50), IN `telefonoCliente` VARCHAR(50), IN `estadoCliente` VARCHAR(50), IN `idUsuarioFK` INT)  BEGIN
insert INTO cliente VALUES(
idCliente,
numDocCliente,
tipoDocCliente,
nombreDocCliente,
apellidoDocCliente,
direccionCliente,
telefonoCliente,
estadoCliente,
idUsuarioFK
);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CITA`
--

CREATE TABLE `CITA` (
  `idCita` int(11) NOT NULL,
  `fechaCita` date DEFAULT NULL,
  `horaCita` time DEFAULT NULL,
  `estadoCita` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idEmpleadoFK` int(11) DEFAULT NULL,
  `idClienteFK` int(11) DEFAULT NULL,
  `idServicioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `idCliente` int(11) NOT NULL,
  `numDocCliente` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipoDocCliente` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreDocCliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidoDocCliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccionCliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefonoCliente` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoCliente` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEADO`
--

CREATE TABLE `EMPLEADO` (
  `idEmpleado` int(11) NOT NULL,
  `numDocEmpleado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipoDocEmpleado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreEmpleado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidoEmpleado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccionEmpleado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefonoEmpleado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoEmpleado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROL`
--

CREATE TABLE `ROL` (
  `idRol` int(11) NOT NULL,
  `descripcionRol` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoRol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ROL`
--

INSERT INTO `ROL` (`idRol`, `descripcionRol`, `estadoRol`) VALUES
(1, 'Este rol administra', 'Activo'),
(2, 'Puede entrar a la pagina pero con poca informacion', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERVICIO`
--

CREATE TABLE `SERVICIO` (
  `idServicio` int(11) NOT NULL,
  `descripcionServicio` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoServicio` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `idUsuario` int(11) NOT NULL,
  `correoUsuario` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordUsuario` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoUsuario` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IdRolFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CITA`
--
ALTER TABLE `CITA`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`),
  ADD KEY `idClienteFK` (`idClienteFK`),
  ADD KEY `idServicioFK` (`idServicioFK`);

--
-- Indices de la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Indices de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Indices de la tabla `ROL`
--
ALTER TABLE `ROL`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `SERVICIO`
--
ALTER TABLE `SERVICIO`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `IdRolFK` (`IdRolFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CITA`
--
ALTER TABLE `CITA`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ROL`
--
ALTER TABLE `ROL`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `SERVICIO`
--
ALTER TABLE `SERVICIO`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CITA`
--
ALTER TABLE `CITA`
  ADD CONSTRAINT `CITA_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `EMPLEADO` (`idEmpleado`),
  ADD CONSTRAINT `CITA_ibfk_2` FOREIGN KEY (`idClienteFK`) REFERENCES `CLIENTE` (`idCliente`),
  ADD CONSTRAINT `CITA_ibfk_3` FOREIGN KEY (`idServicioFK`) REFERENCES `SERVICIO` (`idServicio`);

--
-- Filtros para la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD CONSTRAINT `CLIENTE_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `USUARIO` (`idUsuario`);

--
-- Filtros para la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  ADD CONSTRAINT `EMPLEADO_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `USUARIO` (`idUsuario`);

--
-- Filtros para la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD CONSTRAINT `USUARIO_ibfk_1` FOREIGN KEY (`IdRolFK`) REFERENCES `ROL` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

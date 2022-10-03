-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2022 a las 22:28:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL,
  `fechaCita` date DEFAULT NULL,
  `horaCita` time DEFAULT NULL,
  `estadoCita` varchar(20) DEFAULT NULL,
  `idEmpleadoFK` int(11) DEFAULT NULL,
  `idClienteFK` int(11) DEFAULT NULL,
  `idServicioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `numDocCliente` varchar(15) DEFAULT NULL,
  `tipoDocCliente` varchar(20) DEFAULT NULL,
  `nombreDocCliente` varchar(50) DEFAULT NULL,
  `apellidoDocCliente` varchar(50) DEFAULT NULL,
  `direccionCliente` varchar(50) DEFAULT NULL,
  `telefonoCliente` varchar(20) DEFAULT NULL,
  `estadoCliente` varchar(20) DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `numDocEmpleado` varchar(15) DEFAULT NULL,
  `tipoDocEmpleado` varchar(20) DEFAULT NULL,
  `nombreEmpleado` varchar(50) DEFAULT NULL,
  `apellidoEmpleado` varchar(50) DEFAULT NULL,
  `direccionEmpleado` varchar(50) DEFAULT NULL,
  `telefonoEmpleado` varchar(20) DEFAULT NULL,
  `estadoEmpleado` varchar(20) DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `descripcionRol` varchar(30) NOT NULL,
  `estadoRol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `descripcionServicio` varchar(50) DEFAULT NULL,
  `estadoServicio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `correoUsuario` varchar(50) DEFAULT NULL,
  `passwordUsuario` varchar(20) DEFAULT NULL,
  `estadoUsuario` varchar(20) DEFAULT NULL,
  `IdRolFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`),
  ADD KEY `idClienteFK` (`idClienteFK`),
  ADD KEY `idServicioFK` (`idServicioFK`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `IdRolFK` (`IdRolFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`idClienteFK`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`idServicioFK`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdRolFK`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2022 a las 22:27:24
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agendamiento_de_citas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_empleado` (IN `idEmpleado` INT, IN `numDocEmpleado` VARCHAR(15), IN `tipoDocEmpleado` VARCHAR(20), IN `nombreEmpleado` VARCHAR(50), IN `apellidoEmpleado` VARCHAR(50), IN `direccionEmpleado` VARCHAR(50), IN `telefonoEmpleado` VARCHAR(20), IN `estadoEmpleado` VARCHAR(20), IN `idUsuarioFK` INT)   BEGIN
insert INTO empleado VALUES(
    idEmpleado,
    numDocEmpleado,
    tipoDocEmpleado,
    nombreEmpleado,
    apellidoEmpleado,
    direccionEmpleado,
    telefonoEmpleado,
    estadoEmpleado,
    idUsuarioFK
);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_usuario` (IN `idUsuario` INT, IN `correoUsuario` VARCHAR(50), IN `passwordUsuario` VARCHAR(20), IN `estadoUsuario` VARCHAR(20), IN `IdRolFK` INT)   BEGIN
INSERT INTO usuario VALUES(
null,
correoUsuario,
passwordUsuario,
estadoUsuario,
IdRolFK
);
END$$

DELIMITER ;

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
  `descripcionRol` varchar(65) NOT NULL,
  `estadoRol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `descripcionRol`, `estadoRol`) VALUES
(1, 'aquel puede acceder a la información de la base de datos', 'activo'),
(2, 'aquel que puede acceder a la página pero con información limitada', 'activo');

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
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `correoUsuario`, `passwordUsuario`, `estadoUsuario`, `IdRolFK`) VALUES
(1, 'TIMMOTYBULLYNG@hotmail.com', 'timoti3368798', 'activo', 1),
(2, 'abdulhaalahbom@hotmail.com', 'alah es grande', 'activo', 2),
(3, 'cav4956@gmail.com', 'zxcvbnm.06z', 'activo', 1),
(4, 'luisfer111414@gmail.com', 'poiuytrewqdsgkw', 'activo', 1);

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
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

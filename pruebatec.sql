-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2023 a las 03:11:47
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebatec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL,
  `nombre_cliente` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codigo`, `nombre_cliente`, `direccion`, `telefono`) VALUES
(1, 'Juan Perez', 'Calle 123, Ciudad', '555-1234'),
(2, 'Maria Lopez', 'Avenida 456, Ciudad', '555-5678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_proforma`
--

CREATE TABLE `detalle_proforma` (
  `anio` int(11) NOT NULL,
  `consecutivo` int(11) NOT NULL,
  `codigo_producto` int(11) DEFAULT NULL,
  `cantidad_pedida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_proforma`
--

INSERT INTO `detalle_proforma` (`anio`, `consecutivo`, `codigo_producto`, `cantidad_pedida`) VALUES
(2023, 1, 1, 10),
(2023, 2, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `nombre_producto`, `precio`, `stock`) VALUES
(1, 'Camisa', '29.99', 50),
(2, 'Pantalón', '49.99', 30),
(3, 'Lima', NULL, 600),
(4, 'Martillo', NULL, 500),
(5, 'Destornillador', NULL, 200),
(6, 'Sierra', NULL, 700),
(7, 'Alicate', NULL, 400),
(8, 'Lima', NULL, 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proforma`
--

CREATE TABLE `proforma` (
  `anio` int(11) NOT NULL,
  `consecutivo` int(11) NOT NULL,
  `fecha_proforma` date DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `notas_pedido` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proforma`
--

INSERT INTO `proforma` (`anio`, `consecutivo`, `fecha_proforma`, `codigo_cliente`, `notas_pedido`) VALUES
(2023, 1, '2023-05-01', 1, 'Urgente, enviar a dirección de envío'),
(2023, 2, '2023-05-02', 2, 'Entrega programada para la próxima semana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `detalle_proforma`
--
ALTER TABLE `detalle_proforma`
  ADD PRIMARY KEY (`anio`,`consecutivo`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `proforma`
--
ALTER TABLE `proforma`
  ADD PRIMARY KEY (`anio`,`consecutivo`),
  ADD KEY `codigo_cliente` (`codigo_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_proforma`
--
ALTER TABLE `detalle_proforma`
  ADD CONSTRAINT `detalle_proforma_ibfk_1` FOREIGN KEY (`anio`,`consecutivo`) REFERENCES `proforma` (`anio`, `consecutivo`),
  ADD CONSTRAINT `detalle_proforma_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`);

--
-- Filtros para la tabla `proforma`
--
ALTER TABLE `proforma`
  ADD CONSTRAINT `proforma_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

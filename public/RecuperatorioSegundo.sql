-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2020 a las 22:32:56
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `segundoparcial2`
--
CREATE DATABASE IF NOT EXISTS `segundoparcial2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `segundoparcial2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
CREATE TABLE `mascotas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(100) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `tipo`, `precio`, `created_at`, `updated_at`) VALUES
(1, 'huron', 3000, '2020-12-07', '2020-12-07'),
(2, 'perro', 4000, '2020-12-07', '2020-12-07'),
(3, 'gato', 2000, '2020-12-07', '2020-12-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

DROP TABLE IF EXISTS `turnos`;
CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `atendido` varchar(10) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'no',
  `fecha` date NOT NULL,
  `usuario_FK` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id`, `tipo`, `atendido`, `fecha`, `usuario_FK`, `created_at`, `updated_at`) VALUES
(1, 'huron', 'si', '2020-12-09', 'corral@gmail.com', '2020-12-07', '2020-12-07'),
(2, 'perro', 'si', '2020-12-08', 'lopez@gmail.com', '2020-12-07', '2020-12-07'),
(3, 'gato', 'si', '2020-12-10', 'garcia@gmail.com', '2020-12-07', '2020-12-07'),
(4, 'gato', 'no', '2020-12-10', 'corral@gmail.com', '2020-12-07', '2020-12-07'),
(5, 'perro', 'no', '2020-12-10', 'corral@gmail.com', '2020-12-07', '2020-12-07'),
(6, 'gato', 'no', '2020-12-10', 'corral@gmail.com', '2020-12-07', '2020-12-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `nombre`, `clave`, `tipo`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'corral@gmail.com', 'mariana', '4aa2fa93f041d011410cc1892451939cf65d2c14', 'cliente', '', '2020-12-06', '2020-12-06'),
(2, 'artaza@gmail.com', 'hernan', '4aa2fa93f041d011410cc1892451939cf65d2c14', 'admin', '', '2020-12-06', '2020-12-06'),
(3, 'lopez@gmail.com', 'nora', '4aa2fa93f041d011410cc1892451939cf65d2c14', 'cliente', '', '2020-12-07', '2020-12-07'),
(4, 'garcia@gmail.com', 'laura', '4aa2fa93f041d011410cc1892451939cf65d2c14', 'cliente', '', '2020-12-07', '2020-12-07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

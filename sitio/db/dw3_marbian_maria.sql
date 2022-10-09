-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2022 a las 18:55:10
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
-- Base de datos: `florencia_marbian`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categorias_id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `etiquetas_id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productos_id` int(10) UNSIGNED NOT NULL,
  `usuarios_fk` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `imagen_descripcion` varchar(255) NOT NULL,
  `audio` blob DEFAULT NULL,
  `video` blob DEFAULT NULL,
  `texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`productos_id`, `usuarios_fk`, `titulo`, `precio`, `imagen`, `imagen_descripcion`, `audio`, `video`, `texto`) VALUES
(1, 1, 'Abejas', '1500.00', 'abejas.jpg', 'Lisa y las abejas', 0x6c6973615f6162656a61732e6d7033, 0x656d6265642f775671526a785375555849, 'Estampado de la escena de lisa con las abejas y la goma de mascar. Calidad viscosa. El calce es suelto, con ruedo asimétrico. Está confeccionada en algodón. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(2, 1, 'El resplandor', '1600.00', 'aun-hay-mas.jpg', 'El resplandor', 0x61756e5f6861795f6d61732e6d7033, 0x656d6265642f674465573976786d7a4441, 'Remera básica en color blanco. Estampado de la escena del resplandor,  El calce es suelto, con ruedo asimétrico. Está confeccionada en viscosa y lycra. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(3, 1, 'El coco', '1450.00', 'coco.jpg', 'El coco está en la casa', 0x656c5f636f636f2e6d7033, 0x656d6265642f2d7536327474782d414a34, 'Estampado de la escena del coco, calidad algodón y lycra. Disponible en color blanco y negro. El calce es suelto, con ruedo asimétrico. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(4, 1, 'Cumbancha', '1500.00', 'cumbancha.jpg', 'Suba a la cumbancha', 0x6c615f63756d62616e6368612e6d7033, 0x656d6265642f31754e32316d6a6f304941, 'Estampado de la escena de la cumbancha, calidad algodón y lycra o en 100% lycra. Disponible en color blanco únicamente. El calce es suelto, con ruedo asimétrico. De las más elegidas. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(5, 2, 'Francia', '1400.00', 'eleagncia.jpg', 'Que elegancia la de francia', 0x7175655f656c6567616e6369612e6d7033, 0x656d6265642f51694b323733506a705638, 'Remera blanca y también disponible en color hueso. Estampado de la escena de homero en el casino, calidad algodón y lycra. El calce es suelto, con ruedo asimétrico. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(6, 1, 'Nave espacial', '1680.00', 'espacio.jpg', 'Homero en el espacio', 0x6e6176655f657370616369616c2e6d7033, 0x656d6265642f70395663774e3568736e6f, 'Remera blanca con estampado de la escena de homero en el espacio. Disponible en color blanco y negro. El calce es suelto, con ruedo asimétrico. Está confeccionada en visco y lycra. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(7, 1, 'El heredero', '1800.00', 'joroba.jpg', 'Bart el heredero con joroba', 0x6a6f726f62612e6d7033, 0x656d6265642f7036434454717651465245, 'Remera blanca con estampado de la escena de bart único heredero de burns, calidad algodón y lycra. Disponible en color blanco y negro. El calce es suelto, con ruedo asimétrico. Calidad super suave y cómoda. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(8, 1, 'Un loquito', '1380.00', 'loquito.jpg', 'Mira bart, esto es un loquito', 0x6c6f717569746f2e6d7033, 0x656d6265642f6746324143617657544149, 'Remera básica en color blanco. Estampado de la escena del capiítulo del lider,  El calce es suelto, con ruedo asimétrico. Está confeccionada en visco y lycra. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(9, 1, 'Maquina invisible', '1540.00', 'maquina.jpg', 'Maquina de escribir invisible', 0x6d617175696e615f696e76697369626c652e6d7033, 0x656d6265642f4469774f4e326c48523363, 'Estampado de la escena de la cumbancha, calidad algodón y lycra o en 100% lycra. Disponible en color blanco únicamente. El calce es suelto, con ruedo asimétrico. Está confeccionada con la mejor calidad del mercado. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(10, 1, 'Matrimonio', '1710.00', 'matrimonio.jpg', 'El matrimonio es igual a una naranja', 0x6d617472696d6f6e696f5f6e6172616e6a612e6d7033, 0x656d6265642f534d51584d3938516e6545, 'Estampado de la escena del matrimonio, calidad algodón y lycra o en 100% lycra. Disponible en color blanco únicamente. El calce es suelto, con ruedo asimétrico. Está confeccionada con la mejor calidad del mercado. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(11, 1, 'El padrino', '1670.00', 'padrino.jpg', 'Homero es el padrino', 0x686f6d65726f5f70616472696e6f2e6d7033, 0x656d6265642f7253767234616b79775451, 'Estampado de la escena de homero siendo el padrino, calidad algodón y lycra o en 100% lycra. Disponible en color blanco únicamente. El calce es suelto, con ruedo asimétrico. Super cómoda y canchera. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(12, 1, 'Burns radiactivo', '1384.00', 'paz.jpg', 'Les traigo paz', 0x6c65735f74726169676f5f70617a2e6d7033, 0x656d6265642f4a415231526569686c6577, 'Estampado de la escena del señor Burns radioactivo, calidad algodón y lycra o en 100% lycra. Disponible en color blanco únicamente. El calce es suelto, con ruedo asimétrico. Las costuras son espectaculares. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(13, 1, 'Stacy', '1625.00', 'stacy.jpg', 'Soy solo una chica', 0x73746163792e6d7033, 0x656d6265642f69484c5169712d58655551, 'Remera básica en color blanco. Estampado de la escena de Stacy malibu,  El calce es suelto, con ruedo asimétrico. Está confeccionada en visco y lycra. Tiene escote redondo y mangas cortas.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!'),
(14, 1, 'Peces del infierno', '1890.00', 'tanque.jpg', 'Los peces del infierno', 0x77617465726c6f6f5f616262612e6d7033, 0x656d6265642f734b4f31525562305a7173, 'Remera básica en color blanco. Estampado de la escena del señor Burns en el tanque,  El calce es suelto, con ruedo asimétrico. Está confeccionada en viscosa y lycra. Tiene escote redondo y mangas cortas Si estas al limite del talle, te recomendamos ir por el talle siguiente! Este top al tener pecho alto ajusta más.<br> Chequeá la tabla de medidas (para conecer las medidas de la prenda) y la tabla de talles (para tener de referencia a la hora de elegir tu remera)!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_categorias`
--

CREATE TABLE `productos_has_categorias` (
  `productos_fk` int(10) UNSIGNED NOT NULL,
  `categorias_fk` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_etiquetas`
--

CREATE TABLE `productos_has_etiquetas` (
  `productos_fk` int(10) UNSIGNED NOT NULL,
  `etiquetas_fk` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roles_id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`roles_id`, `nombre`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarios_id` int(10) UNSIGNED NOT NULL,
  `roles_fk` tinyint(3) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuarios_id`, `roles_fk`, `email`, `password`, `nombre`, `apellido`) VALUES
(1, 1, 'flormarbian@gmail.com', 'morella87', 'Flor', 'Marbian'),
(2, 2, 'maria@gmail.com', 'pacho', 'Maria', 'Krivokapic');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categorias_id`),
  ADD UNIQUE KEY `categorias_id_UNIQUE` (`categorias_id`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`etiquetas_id`),
  ADD UNIQUE KEY `idetiquetas_UNIQUE` (`etiquetas_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productos_id`),
  ADD KEY `fk_productos_usuarios_idx` (`usuarios_fk`);

--
-- Indices de la tabla `productos_has_categorias`
--
ALTER TABLE `productos_has_categorias`
  ADD PRIMARY KEY (`productos_fk`,`categorias_fk`),
  ADD KEY `fk_productos_has_categorias_categorias1_idx` (`categorias_fk`),
  ADD KEY `fk_productos_has_categorias_productos1_idx` (`productos_fk`);

--
-- Indices de la tabla `productos_has_etiquetas`
--
ALTER TABLE `productos_has_etiquetas`
  ADD PRIMARY KEY (`productos_fk`,`etiquetas_fk`),
  ADD KEY `fk_productos_has_etiquetas_etiquetas1_idx` (`etiquetas_fk`),
  ADD KEY `fk_productos_has_etiquetas_productos1_idx` (`productos_fk`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarios_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_usuarios_roles1_idx` (`roles_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categorias_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `etiquetas_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `roles_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarios_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_usuarios` FOREIGN KEY (`usuarios_fk`) REFERENCES `usuarios` (`usuarios_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos_has_categorias`
--
ALTER TABLE `productos_has_categorias`
  ADD CONSTRAINT `fk_productos_has_categorias_categorias1` FOREIGN KEY (`categorias_fk`) REFERENCES `categorias` (`categorias_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_has_categorias_productos1` FOREIGN KEY (`productos_fk`) REFERENCES `productos` (`productos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos_has_etiquetas`
--
ALTER TABLE `productos_has_etiquetas`
  ADD CONSTRAINT `fk_productos_has_etiquetas_etiquetas1` FOREIGN KEY (`etiquetas_fk`) REFERENCES `etiquetas` (`etiquetas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_has_etiquetas_productos1` FOREIGN KEY (`productos_fk`) REFERENCES `productos` (`productos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`roles_fk`) REFERENCES `roles` (`roles_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

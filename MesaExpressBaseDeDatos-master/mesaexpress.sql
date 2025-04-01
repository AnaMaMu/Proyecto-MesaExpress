-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-01-2025 a las 01:13:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mesaexpress`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `permiso_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`permiso_id`, `nombre`, `descripcion`) VALUES
(1, 'Gestionar usuarios', 'Permite crear, editar o eliminar usuarios.'),
(2, 'Gestionar menús', 'Permite agregar, actualizar o eliminar platos del menú.'),
(3, 'Realizar pedidos', 'Permite crear nuevos pedidos.'),
(4, 'Ver historial de pedidos', 'Permite consultar el historial de pedidos.'),
(5, 'Gestionar estados de pedidos', 'Permite cambiar el estado de los pedidos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosxrol`
--

CREATE TABLE `permisosxrol` (
  `permisoXRol_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  `es_activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisosxrol`
--

INSERT INTO `permisosxrol` (`permisoXRol_id`, `rol_id`, `permiso_id`, `es_activo`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0),
(6, 1, 1, 0),
(7, 1, 2, 0),
(8, 1, 3, 0),
(9, 1, 4, 0),
(10, 1, 5, 0),
(11, 2, 2, 0),
(12, 2, 4, 0),
(13, 2, 5, 0),
(14, 3, 3, 0),
(15, 3, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `nombre`, `descripcion`) VALUES
(1, 'Admin', 'Gestiona la aplicación y los usuarios.'),
(2, 'Restaurante', 'Gestiona menús y pedidos del restaurante.'),
(3, 'Cliente', 'Realiza pedidos y revisa su historial.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombres`, `apellidos`, `email`, `direccion`, `celular`, `rol_id`, `password`) VALUES
(1, 'Ana Maria', 'Murillo', 'juan.perez123@gmail.com', 'Calle 16 #5-41, La Candelaria.', '3102564788', 1, '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9'),
(2, 'Jefferson', 'Porras Coronado', 'miguel.andres2025@yahoo.com', 'Carrera 2 Este #21-48.', '3102562133', 1, 'ee42006c22665c906e64bf5036ebd072241bd0f154447b07e5c5e803cd073c02'),
(3, 'Diana', 'Morera', 'carolina.rodriguez89@hotmail.com', 'Calle 63 y Carrera 48, Teusaquillo.', '3102587695', 3, '9b97dfeaa209d064d08d324ff332777608aa5a1f238d8d8860723e8aac312fe6'),
(4, 'William ', 'Forero', 'felipe.castro100@gmail.com', 'Carrera 11 #82-71, Zona T.', '3102545563', 3, 'ec2192f0ae78014475113f0d807d06a5da2572ccf3eb67e15462b554d7fc4896'),
(5, 'Joan Samuel', 'Porras Morera', 'david.gonzalez01@gmail.com', 'Carrera 7 entre calles 10 y 11, La Candelaria.', '3123625678', 3, '6a47a59ae38e2dfebf6d8a97c994db954876c4b8cfe3692165b8c29de38116e2'),
(6, 'Andres Smith', 'Pérez Guitierrez', 'sandra.mejia34@live.com', 'Calle 70 entre carreras 5 y 7, Chapinero.', '3102525638', 3, '7e630f8378e65d6c5b69287a56e9a97ad4dba5d6f672aa27f85c12b9a83a3950'),
(7, 'Laura', 'Martinez Poveda', 'laura.martinez78@outlook.com', 'Calle 119 con Carrera 6A, Usaquén.', '3212564788', 3, 'a49d14747832952e7b0ff7c31b9fd82321a9bf37575f785e9ec4401529fbea65'),
(8, 'Maria Camila', 'Ortiz', 'camila.ortega56@hotmail.com', 'Avenida Carrera 60 #57-60, Teusaquillo.', '3102564788', 3, 'fbeaa59ea5d82ed45c43b3bbc1de032961767a6c4f61c8da9802792b856ac948'),
(9, 'Marcos Alejandro ', 'Sanchez nuñez', 'alejandro.rios12@yahoo.com', 'Calle 11 #4-41, La Candelaria.', '3102564356', 3, 'a970cc684eb2cf99770d100ecdd628f1a2c5f462cbe8ba9d2ad57525a2a21a71'),
(10, 'Juan Diego', 'Pérez', 'valeria.munoz89@outlook.com', 'Avenida Carrera 68 #63-00, Salitre.', '3102537544', 3, 'ea6e68a5bd497eabb1b30cb7dd12347831b28b89a6dc1e8f66b2c711fa2919c5');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`permiso_id`);

--
-- Indices de la tabla `permisosxrol`
--
ALTER TABLE `permisosxrol`
  ADD PRIMARY KEY (`permisoXRol_id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `permiso_id` (`permiso_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `permiso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `permisosxrol`
--
ALTER TABLE `permisosxrol`
  MODIFY `permisoXRol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permisosxrol`
--
ALTER TABLE `permisosxrol`
  ADD CONSTRAINT `permisosxrol_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`),
  ADD CONSTRAINT `permisosxrol_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`permiso_id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

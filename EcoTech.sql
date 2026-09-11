-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-09-2026 a las 16:03:54
-- Versión del servidor: 11.8.6-MariaDB-5ubuntu0.1 from Ubuntu
-- Versión de PHP: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `EcoTech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Auditoria`
--

CREATE TABLE `Auditoria` (
  `auditoria_id` int(11) NOT NULL,
  `tabla_afectada` varchar(100) NOT NULL,
  `operacion` varchar(15) NOT NULL,
  `registro_id` int(11) DEFAULT NULL,
  `usuario_sql` varchar(100) DEFAULT user(),
  `fecha` datetime DEFAULT current_timestamp(),
  `detalle` varchar(100) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Beneficiarios`
--

CREATE TABLE `Beneficiarios` (
  `beneficiario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `ciudad_id` int(11) DEFAULT NULL,
  `direccion` varchar(250) NOT NULL,
  `estrato` int(11) DEFAULT NULL CHECK (`estrato` >= 1 and `estrato` <= 3),
  `necesidad` text DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudades`
--

CREATE TABLE `Ciudades` (
  `ciudad_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Ciudades`
--

INSERT INTO `Ciudades` (`ciudad_id`, `nombre`, `departamento`) VALUES
(1, 'Bogotá', 'Cundinamarca'),
(2, 'Medellín', 'Antioquia'),
(3, 'Cali', 'Valle del Cauca'),
(4, 'Barranquilla', 'Atlántico'),
(5, 'Cartagena', 'Bolívar'),
(6, 'Bucaramanga', 'Santander'),
(7, 'Pereira', 'Risaralda'),
(8, 'Santa Marta', 'Magdalena'),
(9, 'Ibagué', 'Tolima'),
(10, 'Manizales', 'Caldas'),
(11, 'Cúcuta', 'Norte de Santander'),
(12, 'Villacencio', 'Meta'),
(13, 'Pasto', 'Nariño'),
(14, 'Montería', 'Córdoba'),
(15, 'Neiva', 'Huila'),
(16, 'Armenia', 'Quindío'),
(17, 'Popayán', 'Cauca'),
(18, 'Valledupar', 'Cesar'),
(19, 'Tunja', 'Boyacá'),
(20, 'Sincelejo', 'Sucre'),
(21, 'Riohacha', 'La Guajira'),
(22, 'Florencia', 'Caquetá'),
(23, 'Yopal', 'Casanare'),
(24, 'Quibdó', 'Chocó'),
(25, 'San Andrés', 'San Andrés y Providencia'),
(26, 'Sogamoso', 'Boyacá'),
(27, 'Girardot', 'Cundinamarca'),
(28, 'Bello', 'Antioquia'),
(29, 'Soledad', 'Atlántico'),
(30, 'Envigado', 'Antioquia'),
(31, 'Palmira', 'Valle del Cauca'),
(32, 'Buenaventura', 'Valle del Cauca'),
(33, 'Floridablanca', 'Santander'),
(34, 'Barrancabermeja', 'Santander'),
(35, 'Tuluá', 'Valle del Cauca'),
(36, 'Zipaquirá', 'Cundinamarca'),
(37, 'Dosquebradas', 'Risaralda'),
(38, 'Itagüí', 'Antioquia'),
(39, 'Facatativá', 'Cundinamarca'),
(40, 'Soacha', 'Cundinamarca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Diagnosticos`
--

CREATE TABLE `Diagnosticos` (
  `diagnostico_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `requiere_repara` tinyint(1) DEFAULT 1,
  `costo_estimado` decimal(18,2) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Donantes`
--

CREATE TABLE `Donantes` (
  `donante_id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `ciudad_id` int(11) DEFAULT NULL,
  `direccion` varchar(250) NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Entregas`
--

CREATE TABLE `Entregas` (
  `entrega_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `beneficiario_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_entrega` datetime DEFAULT current_timestamp(),
  `condiciones` varchar(100) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Equipos`
--

CREATE TABLE `Equipos` (
  `equipo_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `donante_id` int(11) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `estado_ingreso` varchar(50) DEFAULT NULL,
  `estado_actual` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reparaciones`
--

CREATE TABLE `Reparaciones` (
  `reparacion_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `repuestos_usados` varchar(100) DEFAULT NULL,
  `costo_real` decimal(18,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT current_timestamp(),
  `fecha_fin` datetime DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposEquipo`
--

CREATE TABLE `TiposEquipo` (
  `tipo_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `TiposEquipo`
--

INSERT INTO `TiposEquipo` (`tipo_id`, `nombre`, `descripcion`) VALUES
(1, 'Computador Portátil', 'Equipos laptop para uso personal o corporativo'),
(2, 'Computador de Escritorio', 'Torres y CPU de escritorio con o sin periféricos'),
(3, 'Monitor / Pantalla', 'Monitores LED, LCD y pantallas de computadores'),
(4, 'Tableta', 'Dispositivos táctiles portátiles'),
(5, 'Teléfono Inteligente', 'Smartphones de diversas marcas y gamas'),
(6, 'Impresora / Escáner', 'Equipos multifuncionales de impresión y digitalización'),
(7, 'Servidor', 'Equipos de cómputo de alto rendimiento para procesamiento/almacenamiento'),
(8, 'Teclado y Mouse', 'Periféricos de entrada de datos'),
(9, 'Disco Duro / SSD', 'Unidades de almacenamiento interno y externo'),
(10, 'Componente Interno', 'Tarjetas madre, memoria RAM, fuentes de poder y procesadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `primer_apellido` varchar(100) NOT NULL,
  `segundo_apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`usuario_id`, `nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `contrasena`, `rol`, `activo`, `fecha_registro`) VALUES
(4, 'Prueba', 'Prueba', '', 'Prueba@mail.com', '', 'Auditor', 1, '2026-09-03 19:45:45'),
(60, 'Prueba2', 'Prueba2', '', 'Prueba2@gmail.com', '', 'Operador', 1, '2026-09-03 19:53:21'),
(111, 'AA', 'AA', '', 'AA', '', 'Auditor', 1, '2026-09-03 20:04:04'),
(112, 'Carlos', 'Mendoza', '', 'carlos.mendoza@ecotech.co', '', 'Administrador', 1, '2026-01-10 08:30:00'),
(113, 'Ana', 'Gómez', '', 'ana.gomez@ecotech.co', '', 'Técnico', 1, '2026-01-11 09:15:00'),
(114, 'Luis', 'Rodríguez', '', 'luis.rodriguez@ecotech.co', '', 'Técnico', 1, '2026-01-12 10:00:00'),
(115, 'Sofia', 'Martínez', '', 'sofia.martinez@ecotech.co', '', 'Operador', 1, '2026-01-14 11:20:00'),
(116, 'David', 'López', '', 'david.lopez@ecotech.co', '', 'Auditor', 1, '2026-01-15 14:00:00'),
(117, 'Laura', 'Hernández', '', 'laura.hernandez@ecotech.co', '', 'Técnico', 1, '2026-01-16 08:45:00'),
(118, 'Jorge', 'García', '', 'jorge.garcia@ecotech.co', '', 'Operador', 1, '2026-01-18 13:10:00'),
(119, 'Camila', 'Pérez', '', 'camila.perez@ecotech.co', '', 'Usuario', 1, '2026-01-20 09:30:00'),
(120, 'Mateo', 'Sánchez', '', 'mateo.sanchez@ecotech.co', '', 'Administrador', 1, '2026-01-22 15:40:00'),
(121, 'Valentina', 'Ramírez', '', 'valentina.ramirez@ecotech.co', '', 'Operador', 1, '2026-01-25 10:05:00'),
(122, 'Andrés', 'Torres', '', 'andres.torres@ecotech.co', '', 'Técnico', 1, '2026-02-01 08:00:00'),
(123, 'Mariana', 'Díaz', '', 'mariana.diaz@ecotech.co', '', 'Usuario', 1, '2026-02-03 11:30:00'),
(124, 'Felipe', 'Vargas', '', 'felipe.vargas@ecotech.co', '', 'Operador', 1, '2026-02-05 14:20:00'),
(125, 'Gabriela', 'Castro', '', 'gabriela.castro@ecotech.co', '', 'Auditor', 1, '2026-02-08 09:50:00'),
(126, 'Daniel', 'Morales', '', 'daniel.morales@ecotech.co', '', 'Técnico', 1, '2026-02-10 16:15:00'),
(127, 'Paula', 'Ortiz', '', 'paula.ortiz@ecotech.co', '', 'Usuario', 1, '2026-02-11 11:00:00'),
(128, 'Camilo', 'Silva', '', 'camilo.silva@ecotech.co', '', 'Técnico', 1, '2026-02-12 12:30:00'),
(129, 'Andrea', 'Rojas', '', 'andrea.rojas@ecotech.co', '', 'Operador', 1, '2026-02-14 14:10:00'),
(130, 'Santiago', 'Muñoz', '', 'santiago.munoz@ecotech.co', '', 'Usuario', 1, '2026-02-15 09:00:00'),
(131, 'Natalia', 'Romero', '', 'natalia.romero@ecotech.co', '', 'Auditor', 1, '2026-02-16 16:45:00'),
(132, 'Diego', 'Álvarez', '', 'diego.alvarez@ecotech.co', '', 'Técnico', 1, '2026-02-18 08:15:00'),
(133, 'Diana', 'Moreno', '', 'diana.moreno@ecotech.co', '', 'Operador', 1, '2026-02-20 10:20:00'),
(134, 'Alejandro', 'Gutiérrez', '', 'alejandro.gutierrez@ecotech.co', '', 'Usuario', 1, '2026-02-22 13:50:00'),
(135, 'Karely', 'Navarro', '', 'karely.navarro@ecotech.co', '', 'Administrador', 1, '2026-02-24 15:30:00'),
(136, 'Esteban', 'Suárez', '', 'esteban.suarez@ecotech.co', '', 'Técnico', 1, '2026-02-25 17:00:00'),
(137, 'Pedro', 'y', 'Pablo', 'PedroyPablo@gmial.com', '$2y$12$0DwGr4m2VoH20KVcf9mbDuI9mKRZluT0x.3m7aKYXIsX1J.hdTEz.', 'Administrador', 1, '2026-09-11 15:09:11'),
(138, 'Yofan', 'Tellez', 'Garzon', 'yofan.tellez@cun.edu.co', '$2y$12$514.kE6OASfOQJ79oJ8wCeiGtWXZR5LKcafaLKuAnOHTPqyGypdd.', 'admin', 1, '2026-09-11 15:14:13'),
(139, 'Guillermo', 'Blanco', 'Garzon', 'guillermo.blanco@gmial.com', '$2y$12$5ESyMFf3ff/VTns6VpwYjOT.c2Oie4ZWY5A1msMP16Pfq8gJAuWaC', 'cliente', 1, '2026-09-11 15:30:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Auditoria`
--
ALTER TABLE `Auditoria`
  ADD PRIMARY KEY (`auditoria_id`);

--
-- Indices de la tabla `Beneficiarios`
--
ALTER TABLE `Beneficiarios`
  ADD PRIMARY KEY (`beneficiario_id`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD KEY `ciudad_id` (`ciudad_id`);

--
-- Indices de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  ADD PRIMARY KEY (`ciudad_id`);

--
-- Indices de la tabla `Diagnosticos`
--
ALTER TABLE `Diagnosticos`
  ADD PRIMARY KEY (`diagnostico_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `Donantes`
--
ALTER TABLE `Donantes`
  ADD PRIMARY KEY (`donante_id`),
  ADD KEY `ciudad_id` (`ciudad_id`);

--
-- Indices de la tabla `Entregas`
--
ALTER TABLE `Entregas`
  ADD PRIMARY KEY (`entrega_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `beneficiario_id` (`beneficiario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD PRIMARY KEY (`equipo_id`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `tipo_id` (`tipo_id`),
  ADD KEY `donante_id` (`donante_id`);

--
-- Indices de la tabla `Reparaciones`
--
ALTER TABLE `Reparaciones`
  ADD PRIMARY KEY (`reparacion_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `TiposEquipo`
--
ALTER TABLE `TiposEquipo`
  ADD PRIMARY KEY (`tipo_id`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Auditoria`
--
ALTER TABLE `Auditoria`
  MODIFY `auditoria_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Beneficiarios`
--
ALTER TABLE `Beneficiarios`
  MODIFY `beneficiario_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  MODIFY `ciudad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `Diagnosticos`
--
ALTER TABLE `Diagnosticos`
  MODIFY `diagnostico_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Donantes`
--
ALTER TABLE `Donantes`
  MODIFY `donante_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Entregas`
--
ALTER TABLE `Entregas`
  MODIFY `entrega_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  MODIFY `equipo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Reparaciones`
--
ALTER TABLE `Reparaciones`
  MODIFY `reparacion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TiposEquipo`
--
ALTER TABLE `TiposEquipo`
  MODIFY `tipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Beneficiarios`
--
ALTER TABLE `Beneficiarios`
  ADD CONSTRAINT `Beneficiarios_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `Ciudades` (`ciudad_id`);

--
-- Filtros para la tabla `Diagnosticos`
--
ALTER TABLE `Diagnosticos`
  ADD CONSTRAINT `Diagnosticos_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `Equipos` (`equipo_id`),
  ADD CONSTRAINT `Diagnosticos_ibfk_2` FOREIGN KEY (`tecnico_id`) REFERENCES `Usuarios` (`usuario_id`);

--
-- Filtros para la tabla `Donantes`
--
ALTER TABLE `Donantes`
  ADD CONSTRAINT `Donantes_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `Ciudades` (`ciudad_id`);

--
-- Filtros para la tabla `Entregas`
--
ALTER TABLE `Entregas`
  ADD CONSTRAINT `Entregas_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `Equipos` (`equipo_id`),
  ADD CONSTRAINT `Entregas_ibfk_2` FOREIGN KEY (`beneficiario_id`) REFERENCES `Beneficiarios` (`beneficiario_id`),
  ADD CONSTRAINT `Entregas_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`usuario_id`);

--
-- Filtros para la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD CONSTRAINT `Equipos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`usuario_id`),
  ADD CONSTRAINT `Equipos_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `TiposEquipo` (`tipo_id`),
  ADD CONSTRAINT `Equipos_ibfk_3` FOREIGN KEY (`donante_id`) REFERENCES `Donantes` (`donante_id`);

--
-- Filtros para la tabla `Reparaciones`
--
ALTER TABLE `Reparaciones`
  ADD CONSTRAINT `Reparaciones_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `Equipos` (`equipo_id`),
  ADD CONSTRAINT `Reparaciones_ibfk_2` FOREIGN KEY (`tecnico_id`) REFERENCES `Usuarios` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

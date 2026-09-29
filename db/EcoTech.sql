-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-09-2026 a las 02:30:47
-- Versión del servidor: 8.4.11-0ubuntu0.26.04.1
-- Versión de PHP: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecotech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `id_activo` int NOT NULL,
  `codigo_qr` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_activo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `marca` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modelo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_serie` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `valor_compra` decimal(12,2) DEFAULT NULL,
  `vida_util_anios` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_ubicacion` int DEFAULT NULL,
  `id_empresa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `activos`
--

INSERT INTO `activos` (`id_activo`, `codigo_qr`, `nombre_activo`, `descripcion`, `marca`, `modelo`, `numero_serie`, `fecha_adquisicion`, `valor_compra`, `vida_util_anios`, `id_categoria`, `id_estado`, `id_ubicacion`, `id_empresa`) VALUES
(1, 'QR-DEV-2001', 'Laptop ThinkPad L480', 'Laptop recibida para diagnóstico inicial', 'Lenovo', 'Mod-2019', 'SN-TECH-88001', '2023-01-17', 145.20, 3, 1, 1, 1, 1),
(2, 'QR-DEV-2002', 'iPhone 11 64GB', 'Smartphone con batería degradada', 'Apple', 'Mod-2020', 'SN-TECH-88002', '2023-01-29', 190.40, 2, 2, 2, 2, 2),
(3, 'QR-DEV-2003', 'Servidor PowerEdge R640', 'Servidor corporativo retirado de uso', 'Dell', 'Mod-2021', 'SN-TECH-88003', '2023-02-10', 235.60, 5, 3, 3, 3, 3),
(4, 'QR-DEV-2004', 'Monitor Dell 24\" IPS', 'Monitor con falla de retroiluminación', 'Dell', 'Mod-2022', 'SN-TECH-88004', '2023-02-22', 280.80, 7, 4, 4, 4, 1),
(5, 'QR-DEV-2005', 'Disco SSD NVMe 1TB', 'Unidad recuperada para testing', 'Kingston', 'Mod-2023', 'SN-TECH-88005', '2023-03-06', 326.00, 3, 5, 5, 5, 2),
(6, 'QR-DEV-2006', 'Laptop EliteBook 840', 'Laptop con desgaste estético leve', 'HP', 'Mod-2018', 'SN-TECH-88006', '2023-03-18', 371.20, 2, 1, 1, 6, 3),
(7, 'QR-DEV-2007', 'Samsung Galaxy S20', 'Móvil con pantalla fisurada', 'Samsung', 'Mod-2019', 'SN-TECH-88007', '2023-03-30', 416.40, 3, 2, 2, 1, 1),
(8, 'QR-DEV-2008', 'Switch Cisco Catalyst 2960', 'Switch de red para despiece', 'Cisco', 'Mod-2020', 'SN-TECH-88008', '2023-04-11', 461.60, 5, 3, 3, 2, 2),
(9, 'QR-DEV-2009', 'Monitor LG UltraWide 29\"', 'Monitor reacondicionado para reventa', 'LG Electronics', 'Mod-2021', 'SN-TECH-88009', '2023-04-23', 506.80, 7, 4, 4, 3, 3),
(10, 'QR-DEV-2010', 'Memoria RAM DDR4 16GB', 'Módulo extraído de servidores', 'Crucial', 'Mod-2022', 'SN-TECH-88010', '2023-05-05', 552.00, 3, 5, 5, 4, 1),
(11, 'QR-DEV-2011', 'MacBook Air M1', 'Portátil recibido para cambio de teclado', 'Apple', 'Mod-2023', 'SN-TECH-88011', '2023-05-17', 597.20, 2, 1, 1, 5, 2),
(12, 'QR-DEV-2012', 'Tablet iPad 8va Gen', 'Tablet para refaccionar', 'Apple', 'Mod-2018', 'SN-TECH-88012', '2023-05-29', 642.40, 3, 2, 2, 6, 3),
(13, 'QR-DEV-2013', 'Router Mikrotik Cloud Core', 'Equipo de red para reventa', 'Mikrotik', 'Mod-2019', 'SN-TECH-88013', '2023-06-10', 687.60, 5, 3, 3, 1, 1),
(14, 'QR-DEV-2014', 'Impresora LaserJet Pro', 'Impresora para reciclaje de toner y partes', 'HP', 'Mod-2020', 'SN-TECH-88014', '2023-06-22', 732.80, 7, 4, 4, 2, 2),
(15, 'QR-DEV-2015', 'Tarjeta Gráfica GTX 1660', 'Componente probado y operativo', 'ASUS', 'Mod-2021', 'SN-TECH-88015', '2023-07-04', 778.00, 3, 5, 5, 3, 3),
(16, 'QR-DEV-2016', 'PC Escritorio ProDesk 600', 'CPU corporativo para limpieza y formato', 'HP', 'Mod-2022', 'SN-TECH-88016', '2023-07-16', 823.20, 2, 1, 1, 4, 1),
(17, 'QR-DEV-2017', 'Xiaomi Redmi Note 10', 'Teléfono recibido en lote RAEE', 'Xiaomi', 'Mod-2023', 'SN-TECH-88017', '2023-07-28', 868.40, 3, 2, 2, 5, 2),
(18, 'QR-DEV-2018', 'UPS APC Smart-UPS 1500VA', 'Unidad de respaldo con batería desgastada', 'APC', 'Mod-2018', 'SN-TECH-88018', '2023-08-09', 913.60, 5, 3, 3, 6, 3),
(19, 'QR-DEV-2019', 'Escáner Fujitsu fi-7160', 'Escáner de alta velocidad para reventa', 'Fujitsu', 'Mod-2019', 'SN-TECH-88019', '2023-08-21', 958.80, 7, 4, 4, 1, 1),
(20, 'QR-DEV-2020', 'Fuente ATX Corsair 650W', 'Fuente probada en banco de ensayo', 'Corsair', 'Mod-2020', 'SN-TECH-88020', '2023-09-02', 1004.00, 3, 5, 5, 2, 2),
(21, 'QR-DEV-2021', 'Laptop Dell Latitude 5400', 'Laptop reacondicionada lista para outlet', 'Dell', 'Mod-2021', 'SN-TECH-88021', '2023-09-14', 1049.20, 2, 1, 1, 3, 3),
(22, 'QR-DEV-2022', 'Samsung Galaxy Tab S6', 'Tablet con falla en pin de carga', 'Samsung', 'Mod-2022', 'SN-TECH-88022', '2023-09-26', 1094.40, 3, 2, 2, 4, 1),
(23, 'QR-DEV-2023', 'Servidor HP ProLiant DL360', 'Servidor desmantelado para componentes', 'HP', 'Mod-2023', 'SN-TECH-88023', '2023-10-08', 1139.60, 5, 3, 3, 5, 2),
(24, 'QR-DEV-2024', 'Monitor Samsung 27\" Curved', 'Pantalla con pixeles muertos', 'Samsung', 'Mod-2018', 'SN-TECH-88024', '2023-10-20', 1184.80, 7, 4, 4, 6, 3),
(25, 'QR-DEV-2025', 'Procesador Intel i7 10ma', 'CPU testeado y empacado para reventa', 'Intel', 'Mod-2019', 'SN-TECH-88025', '2023-11-01', 1230.00, 3, 5, 5, 1, 1),
(26, 'QR-DEV-2026', 'Laptop ASUS ZenBook 14', 'Laptop con bisagra dañada', 'ASUS', 'Mod-2020', 'SN-TECH-88026', '2023-11-13', 1275.20, 2, 1, 1, 2, 2),
(27, 'QR-DEV-2027', 'Motorola Moto G50', 'Dispositivo destruido, enviado a reciclaje', 'Motorola', 'Mod-2021', 'SN-TECH-88027', '2023-11-25', 1320.40, 3, 2, 2, 3, 3),
(28, 'QR-DEV-2028', 'Firewall Fortinet 60E', 'Dispositivo de seguridad reacondicionado', 'Fortinet', 'Mod-2022', 'SN-TECH-88028', '2023-12-07', 1365.60, 5, 3, 3, 4, 1),
(29, 'QR-DEV-2029', 'Teclado Mecánico Logitech G', 'Periférico en reacondicionamiento', 'Logitech', 'Mod-2023', 'SN-TECH-88029', '2023-12-19', 1410.80, 7, 4, 4, 5, 2),
(30, 'QR-DEV-2030', 'Disco HDD 2TB Western Digital', 'Disco duro formateado bajo norma NIST', 'Western Digital', 'Mod-2018', 'SN-TECH-88030', '2023-12-31', 1456.00, 3, 5, 5, 6, 3),
(31, 'QR-DEV-2031', 'Laptop ThinkPad X1 Carbon', 'Portátil ultrabooks recuperado', 'Lenovo', 'Mod-2019', 'SN-TECH-88031', '2024-01-12', 1501.20, 2, 1, 1, 1, 1),
(32, 'QR-DEV-2032', 'iPhone XR 128GB', 'Celular reacondicionado vendido de 2da', 'Apple', 'Mod-2020', 'SN-TECH-88032', '2024-01-24', 1546.40, 3, 2, 2, 2, 2),
(33, 'QR-DEV-2033', 'Switch Ubiquiti UniFi 24p', 'Switch gestionable probado en rack', 'Ubiquiti', 'Mod-2021', 'SN-TECH-88033', '2024-02-05', 1591.60, 5, 3, 3, 3, 3),
(34, 'QR-DEV-2034', 'Pantalla Interactiva Smart 65\"', 'Monitor corporativo retirado de salas', 'Smart', 'Mod-2022', 'SN-TECH-88034', '2024-02-17', 1636.80, 7, 4, 4, 4, 1),
(35, 'QR-DEV-2035', 'Tarjeta Madre MSI B450', 'Tarjeta madre revisada sin fallas', 'MSI', 'Mod-2023', 'SN-TECH-88035', '2024-02-29', 1682.00, 3, 5, 5, 5, 2),
(36, 'QR-DEV-2036', 'All-In-One Lenovo V530', 'Equipo Todo en Uno para reacondicionar', 'Lenovo', 'Mod-2018', 'SN-TECH-88036', '2024-03-12', 1727.20, 2, 1, 1, 6, 3),
(37, 'QR-DEV-2037', 'Huawei P30 Pro', 'Teléfono para despiece de repuestos', 'Huawei', 'Mod-2019', 'SN-TECH-88037', '2024-03-24', 1772.40, 3, 2, 2, 1, 1),
(38, 'QR-DEV-2038', 'Servidor NAS Synology 4-Bay', 'Servidor de almacenamiento de segunda', 'Synology', 'Mod-2020', 'SN-TECH-88038', '2024-04-05', 1817.60, 5, 3, 3, 2, 2),
(39, 'QR-DEV-2039', 'Impresora Epson EcoTank L3110', 'Impresora con sistema de tinta limpio', 'Epson', 'Mod-2021', 'SN-TECH-88039', '2024-04-17', 1862.80, 7, 4, 4, 3, 3),
(40, 'QR-DEV-2040', 'Procesador AMD Ryzen 5 3600', 'CPU de segunda mano verificado', 'AMD', 'Mod-2022', 'SN-TECH-88040', '2024-04-29', 1908.00, 3, 5, 5, 4, 1),
(41, 'QR-DEV-2041', 'Laptop HP Pavilion 15', 'Laptop funcional lista para reventa', 'HP', 'Mod-2023', 'SN-TECH-88041', '2024-05-11', 1953.20, 2, 1, 1, 5, 2),
(42, 'QR-DEV-2042', 'Google Pixel 4a', 'Móvil recibido para reciclaje seguro', 'Google', 'Mod-2018', 'SN-TECH-88042', '2024-05-23', 1998.40, 3, 2, 2, 6, 3),
(43, 'QR-DEV-2043', 'Router Cisco ISR 4331', 'Router de telecomunicaciones', 'Cisco', 'Mod-2019', 'SN-TECH-88043', '2024-06-04', 2043.60, 5, 3, 3, 1, 1),
(44, 'QR-DEV-2044', 'Monitor BenQ 27\" Designer', 'Monitor profesional reacondicionado', 'BenQ', 'Mod-2020', 'SN-TECH-88044', '2024-06-16', 2088.80, 7, 4, 4, 2, 2),
(45, 'QR-DEV-2045', 'Tarjeta de Red 10Gb SFP+', 'Adaptador de red corporativo', 'Intel', 'Mod-2021', 'SN-TECH-88045', '2024-06-28', 2134.00, 3, 5, 5, 3, 3),
(46, 'QR-DEV-2046', 'Laptop Dell XPS 13', 'Ultrabook repotenciado con SSD nuevo', 'Dell', 'Mod-2022', 'SN-TECH-88046', '2024-07-10', 2179.20, 2, 1, 1, 4, 1),
(47, 'QR-DEV-2047', 'Samsung Galaxy Tab A7', 'Tablet reacondicionada para educación', 'Samsung', 'Mod-2023', 'SN-TECH-88047', '2024-07-22', 2224.40, 3, 2, 2, 5, 2),
(48, 'QR-DEV-2048', 'Access Point Aruba AP-305', 'AP inalámbrico para venta outlet', 'Aruba', 'Mod-2018', 'SN-TECH-88048', '2024-08-03', 2269.60, 5, 3, 3, 6, 3),
(49, 'QR-DEV-2049', 'Mouse Ergónomico MX Master 3', 'Periférico en buen estado para tienda', 'Logitech', 'Mod-2019', 'SN-TECH-88049', '2024-08-15', 2314.80, 7, 4, 4, 1, 1),
(50, 'QR-DEV-2050', 'Kit Memoria RAM Corsair 32GB', 'Par de memorias RAM probadas', 'Corsair', 'Mod-2020', 'SN-TECH-88050', '2024-08-27', 2360.00, 3, 5, 5, 2, 2),
(51, 'QR-DEV-2051', 'Laptop Lenovo ThinkPad T490', 'Portátil recibido para cambio de disco y pasta térmica', 'Lenovo', 'Mod-2020', 'SN-TECH-88051', '2024-01-05', 380.00, 3, 1, 1, 1, 1),
(52, 'QR-DEV-2052', 'iPhone SE 2020 64GB', 'Móvil con batería desgastada ingresado para revisión', 'Apple', 'Mod-2020', 'SN-TECH-88052', '2024-01-12', 150.00, 2, 2, 2, 2, 2),
(53, 'QR-DEV-2053', 'Servidor HP ProLiant DL380 G10', 'Servidor empresarial listo para venta de segunda mano', 'HP', 'Mod-2021', 'SN-TECH-88053', '2024-01-18', 1200.00, 5, 3, 3, 3, 3),
(54, 'QR-DEV-2054', 'Monitor HP EliteDisplay 23\"', 'Pantalla recibida para prueba de tarjeta lógica', 'HP', 'Mod-2019', 'SN-TECH-88054', '2024-01-25', 95.50, 7, 4, 4, 4, 1),
(55, 'QR-DEV-2055', 'Disco M.2 NVMe Samsung 512GB', 'Modulo SSD recuperado de equipo desmantelado', 'Samsung', 'Mod-2022', 'SN-TECH-88055', '2024-02-01', 45.00, 3, 5, 5, 5, 2),
(56, 'QR-DEV-2056', 'Laptop Dell Vostro 3500', 'Laptop corporativa en reacondicionamiento', 'Dell', 'Mod-2021', 'SN-TECH-88056', '2024-02-08', 310.00, 3, 1, 2, 2, 3),
(57, 'QR-DEV-2057', 'Samsung Galaxy A52', 'Smartphone con pin de carga averiado', 'Samsung', 'Mod-2021', 'SN-TECH-88057', '2024-02-14', 110.00, 2, 2, 1, 1, 1),
(58, 'QR-DEV-2058', 'Switch Aruba 2530 48G', 'Switch administrable probando puertos para outlet', 'Aruba', 'Mod-2020', 'SN-TECH-88058', '2024-02-20', 450.00, 5, 3, 3, 3, 2),
(59, 'QR-DEV-2059', 'Monitor AOC 22\" Full HD', 'Monitor testeado para reventa a bajo costo', 'AOC', 'Mod-2018', 'SN-TECH-88059', '2024-02-26', 70.00, 7, 4, 3, 6, 3),
(60, 'QR-DEV-2060', 'Fuente Certificada EVGA 500W', 'Fuente ATX extraída y testeada en banco', 'EVGA', 'Mod-2021', 'SN-TECH-88060', '2024-03-02', 35.00, 3, 5, 5, 5, 1),
(61, 'QR-DEV-2061', 'MacBook Pro 13\" 2017', 'Lote de recepción con fallas en flex de pantalla', 'Apple', 'Mod-2017', 'SN-TECH-88061', '2024-03-09', 290.00, 2, 1, 1, 1, 2),
(62, 'QR-DEV-2062', 'Tablet iPad Air 3', 'Tablet con cristal roto para cambio de táctil', 'Apple', 'Mod-2019', 'SN-TECH-88062', '2024-03-15', 180.00, 3, 2, 2, 2, 3),
(63, 'QR-DEV-2063', 'Router Cisco ISR 1100', 'Router de borde recuperado de telecomunicaciones', 'Cisco', 'Mod-2021', 'SN-TECH-88063', '2024-03-21', 320.00, 5, 3, 3, 3, 1),
(64, 'QR-DEV-2064', 'Impresora Térmica Zebra ZT230', 'Impresora industrial para reacondicionar', 'Zebra', 'Mod-2020', 'SN-TECH-88064', '2024-03-27', 210.00, 7, 4, 2, 2, 2),
(65, 'QR-DEV-2065', 'Procesador AMD Ryzen 7 2700X', 'CPU testeado de segunda mano listo para reventa', 'AMD', 'Mod-2019', 'SN-TECH-88065', '2024-04-02', 115.00, 3, 5, 3, 6, 3),
(66, 'QR-DEV-2066', 'PC All-In-One HP ProOne 400', 'Equipo listo para venta de segunda mano', 'HP', 'Mod-2020', 'SN-TECH-88066', '2024-04-08', 340.00, 3, 1, 3, 6, 1),
(67, 'QR-DEV-2067', 'Xiaomi Poco X3 Pro', 'Celular destinado a despiece y extracción RAEE', 'Xiaomi', 'Mod-2021', 'SN-TECH-88067', '2024-04-14', 65.00, 2, 2, 4, 4, 2),
(68, 'QR-DEV-2068', 'UPS Tripp Lite 1000VA', 'Unidad de respaldo enviada a cambio de baterías', 'Tripp Lite', 'Mod-2019', 'SN-TECH-88068', '2024-04-20', 130.00, 5, 3, 2, 2, 3),
(69, 'QR-DEV-2069', 'Escáner Kodak Alaris S2050', 'Escáner reacondicionado para oficina', 'Kodak', 'Mod-2020', 'SN-TECH-88069', '2024-04-26', 280.00, 7, 4, 3, 3, 1),
(70, 'QR-DEV-2070', 'Tarjeta Gráfica RTX 2060 6GB', 'Componente probado en banco de estrés', 'Gigabyte', 'Mod-2020', 'SN-TECH-88070', '2024-05-02', 190.00, 3, 5, 5, 5, 2),
(71, 'QR-DEV-2071', 'Laptop Dell Latitude 3410', 'Portátil reacondicionado vendido de segunda mano', 'Dell', 'Mod-2021', 'SN-TECH-88071', '2024-05-08', 360.00, 3, 1, 5, 6, 3),
(72, 'QR-DEV-2072', 'Samsung Galaxy Tab S7', 'Tablet gama alta en diagnóstico de software', 'Samsung', 'Mod-2020', 'SN-TECH-88072', '2024-05-14', 240.00, 3, 2, 1, 1, 1),
(73, 'QR-DEV-2073', 'Servidor Lenovo ThinkSystem SR650', 'Servidor para venta de repuestos', 'Lenovo', 'Mod-2021', 'SN-TECH-88073', '2024-05-20', 1400.00, 5, 3, 4, 4, 2),
(74, 'QR-DEV-2074', 'Monitor ViewSonic 27\" 144Hz', 'Pantalla con tarjeta de video dañada', 'ViewSonic', 'Mod-2021', 'SN-TECH-88074', '2024-05-26', 160.00, 7, 4, 4, 4, 3),
(75, 'QR-DEV-2075', 'Memoria RAM DDR4 32GB Kingston', 'Modulo RAM empresarial verificado', 'Kingston', 'Mod-2022', 'SN-TECH-88075', '2024-06-01', 75.00, 3, 5, 3, 3, 1),
(76, 'QR-DEV-2076', 'Laptop ASUS TUF Gaming F15', 'Portátil recuperado en proceso de limpieza interna', 'ASUS', 'Mod-2021', 'SN-TECH-88076', '2024-06-07', 520.00, 3, 1, 2, 2, 2),
(77, 'QR-DEV-2077', 'Motorola Edge 20', 'Móvil con pantalla quebrada listo para reciclar', 'Motorola', 'Mod-2021', 'SN-TECH-88077', '2024-06-13', 85.00, 2, 2, 4, 4, 3),
(78, 'QR-DEV-2078', 'Switch Mikrotik CRS326', 'Switch de fibra reacondicionado para tiendas', 'Mikrotik', 'Mod-2020', 'SN-TECH-88078', '2024-06-19', 210.00, 5, 3, 3, 6, 1),
(79, 'QR-DEV-2079', 'Impresora Brother HL-L2350DW', 'Impresora láser testeada con toner nuevo', 'Brother', 'Mod-2020', 'SN-TECH-88079', '2024-06-25', 90.00, 7, 4, 3, 3, 2),
(80, 'QR-DEV-2080', 'Disco HDD 4TB Seagate IronWolf', 'Disco de servidor formateado bajo norma segura', 'Seagate', 'Mod-2020', 'SN-TECH-88080', '2024-07-01', 80.00, 3, 5, 5, 5, 3),
(81, 'QR-DEV-2081', 'Laptop ThinkPad L14 Gen 2', 'Equipo reacondicionado listo para reventa', 'Lenovo', 'Mod-2022', 'SN-TECH-88081', '2024-07-07', 410.00, 3, 1, 3, 3, 1),
(82, 'QR-DEV-2082', 'iPhone 12 Mini 128GB', 'Smartphone recuperado con cambio de cámara', 'Apple', 'Mod-2020', 'SN-TECH-88082', '2024-07-13', 270.00, 2, 2, 2, 2, 2),
(83, 'QR-DEV-2083', 'Firewall Sophos XG 115', 'Equipo de seguridad corporativo repotenciado', 'Sophos', 'Mod-2020', 'SN-TECH-88083', '2024-07-19', 310.00, 5, 3, 3, 6, 3),
(84, 'QR-DEV-2084', 'Monitor Samsung Odyssey G3', 'Pantalla testeada comercializada en outlet', 'Samsung', 'Mod-2022', 'SN-TECH-88084', '2024-07-25', 180.00, 7, 4, 5, 6, 1),
(85, 'QR-DEV-2085', 'Tarjeta Madre ASUS Prime B550', 'Tarjeta madre revisada sin detalles', 'ASUS', 'Mod-2021', 'SN-TECH-88085', '2024-07-31', 95.00, 3, 5, 3, 3, 2),
(86, 'QR-DEV-2086', 'PC HP EliteDesk 800 G4', 'Mini PC reacondicionado para oficinas', 'HP', 'Mod-2019', 'SN-TECH-88086', '2024-08-06', 220.00, 3, 1, 3, 6, 3),
(87, 'QR-DEV-2087', 'Huawei MatePad 10.4', 'Tablet gama media en desarme RAEE', 'Huawei', 'Mod-2020', 'SN-TECH-88087', '2024-08-12', 70.00, 3, 2, 4, 4, 1),
(88, 'QR-DEV-2088', 'Servidor QNAP TS-453D', 'NAS de almacenamiento de 4 bahías', 'QNAP', 'Mod-2021', 'SN-TECH-88088', '2024-08-18', 390.00, 5, 3, 3, 3, 2),
(89, 'QR-DEV-2089', 'Multifuncional Canon ImageCLASS', 'Equipo recibido para limpieza de rodillos', 'Canon', 'Mod-2020', 'SN-TECH-88089', '2024-08-24', 160.00, 7, 4, 2, 2, 3),
(90, 'QR-DEV-2090', 'Procesador Intel i5 11400', 'Procesador reacondicionado con caja', 'Intel', 'Mod-2021', 'SN-TECH-88090', '2024-08-30', 130.00, 3, 5, 3, 3, 1),
(91, 'QR-DEV-2091', 'Laptop Dell Inspiron 15', 'Portátil económico vendido en tienda de segunda', 'Dell', 'Mod-2021', 'SN-TECH-88091', '2024-09-05', 290.00, 3, 1, 5, 6, 2),
(92, 'QR-DEV-2092', 'Samsung Galaxy Note 20', 'Móvil recibido para diagnóstico general', 'Samsung', 'Mod-2020', 'SN-TECH-88092', '2024-09-11', 230.00, 2, 2, 1, 1, 3),
(93, 'QR-DEV-2093', 'Access Point Cisco Meraki MR33', 'Punto de acceso WiFi para venta', 'Cisco', 'Mod-2019', 'SN-TECH-88093', '2024-09-17', 110.00, 5, 3, 3, 6, 1),
(94, 'QR-DEV-2094', 'Monitor BenQ 24\" Care', 'Monitor con pequeños rayones en carcasa', 'BenQ', 'Mod-2020', 'SN-TECH-88094', '2024-09-23', 85.00, 7, 4, 3, 3, 2),
(95, 'QR-DEV-2095', 'Kit RAM Crucial Ballistix 16GB', 'Set de memorias testeado en dual channel', 'Crucial', 'Mod-2021', 'SN-TECH-88095', '2024-09-29', 55.00, 3, 5, 3, 3, 3),
(96, 'QR-DEV-2096', 'Laptop Lenovo IdeaPad 3', 'Laptop reparada por falla de encendido', 'Lenovo', 'Mod-2021', 'SN-TECH-88096', '2024-10-05', 270.00, 3, 1, 2, 2, 1),
(97, 'QR-DEV-2097', 'Xiaomi Mi 11 Lite', 'Teléfono con daño por humedad enviado a despiece', 'Xiaomi', 'Mod-2021', 'SN-TECH-88097', '2024-10-11', 75.00, 2, 2, 4, 4, 2),
(98, 'QR-DEV-2098', 'Switch TP-Link JetStream 24P', 'Switch de red testeado en laboratorio', 'TP-Link', 'Mod-2022', 'SN-TECH-88098', '2024-10-17', 140.00, 5, 3, 3, 3, 3),
(99, 'QR-DEV-2099', 'Teclado Mecánico Corsair K70', 'Periférico reacondicionado para catálogo online', 'Corsair', 'Mod-2021', 'SN-TECH-88099', '2024-10-23', 60.00, 7, 4, 3, 6, 1),
(100, 'QR-DEV-2100', 'Fuente Modular Seasonic 750W', 'Fuente probada y en estado operativo', 'Seasonic', 'Mod-2021', 'SN-TECH-88100', '2024-10-29', 85.00, 3, 5, 3, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(1, 'Cómputo Portátil y Escritorio', 'Laptops, PCs corporativos y All-In-One'),
(2, 'Dispositivos Móviles y Tablets', 'Smartphones, tablets e e-readers'),
(3, 'Servidores y Redes', 'Servidores rack, switches, routers y UPS'),
(4, 'Periféricos y Monitores', 'Pantallas LED, teclados, impresoras y escáneres'),
(5, 'Componentes y Piezas de Repuesto', 'RAM, discos SSD, fuentes de poder y procesadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nit` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo_contacto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre`, `nit`, `direccion`, `telefono`, `correo_contacto`, `fecha_registro`) VALUES
(1, 'EcoTech Circular Solutions', '900123456-1', 'Calle 100 # 15-20, Bogotá', '6015551234', 'contacto@ecotech.com', '2023-01-15'),
(2, 'EcoRecycle & Scrap Co.', '901987654-3', 'Carrera 42 # 10-50, Medellín', '6044445678', 'operaciones@ecorecycle.com', '2023-03-20'),
(3, 'TechRemarketing & Refurbished', '800555333-8', 'Zona Franca Calle 13, Cali', '6023339012', 'ventas@techremarketing.co', '2023-06-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int NOT NULL,
  `nombre_estado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `nombre_estado`, `descripcion`) VALUES
(1, 'En Diagnóstico', 'Dispositivo recién recibido en evaluación técnica'),
(2, 'En Reacondicionamiento', 'En proceso de reparación o repotenciación'),
(3, 'Listo para Reventa', 'Reacondicionado y clasificado para venta a menor precio'),
(4, 'Destinado a Desecho/Reciclaje', 'Dispositivo no funcional para despiece seguro (RAEE)'),
(5, 'Vendido / Vendido de Segunda', 'Dispositivo comercializado a un tercero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_activos`
--

CREATE TABLE `historial_activos` (
  `id_historial` int NOT NULL,
  `id_activo` int NOT NULL,
  `fecha_movimiento` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado_anterior` int DEFAULT NULL,
  `nuevo_estado` int DEFAULT NULL,
  `ubicacion_anterior` int DEFAULT NULL,
  `nueva_ubicacion` int DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_activos`
--

INSERT INTO `historial_activos` (`id_historial`, `id_activo`, `fecha_movimiento`, `estado_anterior`, `nuevo_estado`, `ubicacion_anterior`, `nueva_ubicacion`, `observaciones`) VALUES
(1, 1, '2023-02-10 09:00:00', 1, 2, 1, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(2, 2, '2023-02-16 09:00:00', 2, 3, 2, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(3, 3, '2023-02-22 09:00:00', 3, 4, 3, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(4, 4, '2023-02-28 09:00:00', 4, 5, 4, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(5, 5, '2023-03-06 09:00:00', 1, 2, 5, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(6, 6, '2023-03-12 09:00:00', 2, 3, 6, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(7, 7, '2023-03-18 09:00:00', 3, 4, 1, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(8, 8, '2023-03-24 09:00:00', 4, 5, 2, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(9, 9, '2023-03-30 09:00:00', 1, 2, 3, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(10, 10, '2023-04-05 09:00:00', 2, 3, 4, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(11, 11, '2023-04-11 09:00:00', 3, 4, 5, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(12, 12, '2023-04-17 09:00:00', 4, 5, 6, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(13, 13, '2023-04-23 09:00:00', 1, 2, 1, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(14, 14, '2023-04-29 09:00:00', 2, 3, 2, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(15, 15, '2023-05-05 09:00:00', 3, 4, 3, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(16, 16, '2023-05-11 09:00:00', 4, 5, 4, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(17, 17, '2023-05-17 09:00:00', 1, 2, 5, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(18, 18, '2023-05-23 09:00:00', 2, 3, 6, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(19, 19, '2023-05-29 09:00:00', 3, 4, 1, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(20, 20, '2023-06-04 09:00:00', 4, 5, 2, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(21, 21, '2023-06-10 09:00:00', 1, 2, 3, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(22, 22, '2023-06-16 09:00:00', 2, 3, 4, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(23, 23, '2023-06-22 09:00:00', 3, 4, 5, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(24, 24, '2023-06-28 09:00:00', 4, 5, 6, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(25, 25, '2023-07-04 09:00:00', 1, 2, 1, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(26, 26, '2023-07-10 09:00:00', 2, 3, 2, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(27, 27, '2023-07-16 09:00:00', 3, 4, 3, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(28, 28, '2023-07-22 09:00:00', 4, 5, 4, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(29, 29, '2023-07-28 09:00:00', 1, 2, 5, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(30, 30, '2023-08-03 09:00:00', 2, 3, 6, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(31, 31, '2023-08-09 09:00:00', 3, 4, 1, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(32, 32, '2023-08-15 09:00:00', 4, 5, 2, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(33, 33, '2023-08-21 09:00:00', 1, 2, 3, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(34, 34, '2023-08-27 09:00:00', 2, 3, 4, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(35, 35, '2023-09-02 09:00:00', 3, 4, 5, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(36, 36, '2023-09-08 09:00:00', 4, 5, 6, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(37, 37, '2023-09-14 09:00:00', 1, 2, 1, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(38, 38, '2023-09-20 09:00:00', 2, 3, 2, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(39, 39, '2023-09-26 09:00:00', 3, 4, 3, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(40, 40, '2023-10-02 09:00:00', 4, 5, 4, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(41, 41, '2023-10-08 09:00:00', 1, 2, 5, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(42, 42, '2023-10-14 09:00:00', 2, 3, 6, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(43, 43, '2023-10-20 09:00:00', 3, 4, 1, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(44, 44, '2023-10-26 09:00:00', 4, 5, 2, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(45, 45, '2023-11-01 09:00:00', 1, 2, 3, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(46, 46, '2023-11-07 09:00:00', 2, 3, 4, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(47, 47, '2023-11-13 09:00:00', 3, 4, 5, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(48, 48, '2023-11-19 09:00:00', 4, 5, 6, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(49, 49, '2023-11-25 09:00:00', 1, 2, 1, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(50, 50, '2023-12-01 09:00:00', 2, 3, 2, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(51, 51, '2024-01-15 10:00:00', 1, 2, 1, 2, 'Equipo aprobado en diagnóstico; pasa a taller de reacondicionamiento.'),
(52, 52, '2024-01-20 11:30:00', 1, 2, 1, 2, 'Inicia cambio de batería en taller técnico.'),
(53, 53, '2024-01-26 14:15:00', 2, 3, 2, 3, 'Reparación completada; trasladado al almacén de reventa.'),
(54, 54, '2024-02-02 09:45:00', 1, 4, 1, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(55, 55, '2024-02-09 16:00:00', 2, 3, 2, 5, 'Modulo extraído colocado en bodega de repuestos.'),
(56, 56, '2024-02-16 10:20:00', 1, 2, 1, 2, 'Ingresado a taller para cambio de componentes.'),
(57, 57, '2024-02-23 11:00:00', 1, 2, 1, 2, 'Pasado a reparación de pin de carga.'),
(58, 58, '2024-03-01 15:30:00', 2, 3, 2, 3, 'Switch configurado y enviado a almacén de reventa.'),
(59, 59, '2024-03-08 08:30:00', 3, 5, 3, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(60, 60, '2024-03-15 12:00:00', 2, 3, 2, 5, 'Fuente lista y categorizada para venta de repuestos.'),
(61, 61, '2024-03-22 14:00:00', 1, 2, 1, 2, 'Portátil ingresado a taller para cambio de flex.'),
(62, 62, '2024-03-29 16:45:00', 2, 3, 2, 3, 'Tablet reparada y lista para catálogo de reventa.'),
(63, 63, '2024-04-05 10:10:00', 2, 3, 2, 3, 'Router restablecido y guardado en almacén de venta.'),
(64, 64, '2024-04-12 11:50:00', 1, 2, 1, 2, 'Impresora pasada a mantenimiento técnico de rodillos.'),
(65, 65, '2024-04-19 13:25:00', 3, 5, 3, 6, 'Procesador vendido en tienda física de segunda mano.'),
(66, 66, '2024-04-26 15:00:00', 3, 5, 3, 6, 'PC All-In-One comercializado en tienda outlet.'),
(67, 67, '2024-05-03 09:30:00', 1, 4, 1, 4, 'Dispositivo destruido, enviado a reciclaje RAEE.'),
(68, 68, '2024-05-10 10:40:00', 1, 2, 1, 2, 'UPS enviada a taller de reemplazo de celdas de batería.'),
(69, 69, '2024-05-17 14:10:00', 2, 3, 2, 3, 'Escáner probado y listo para venta de oficina.'),
(70, 70, '2024-05-24 16:30:00', 2, 3, 2, 5, 'GPU testeada guardada en bodega de partes de calidad.'),
(71, 71, '2024-05-31 11:15:00', 3, 5, 3, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(72, 72, '2024-06-07 09:00:00', 1, 2, 1, 2, 'Tablet ingresada a taller para restauración de software.'),
(73, 73, '2024-06-14 12:40:00', 1, 4, 1, 4, 'Servidor obsoleto llevado a planta de despiece.'),
(74, 74, '2024-06-21 15:10:00', 2, 4, 2, 4, 'No rentable para reparar; trasladado a despiece y desecho ecológico.'),
(75, 75, '2024-06-28 10:05:00', 2, 3, 2, 3, 'Memoria validada lista para venta.'),
(76, 76, '2024-07-05 11:30:00', 1, 2, 1, 2, 'Laptop gamer pasada a limpieza y cambio de disipador.'),
(77, 77, '2024-07-12 14:50:00', 1, 4, 1, 4, 'Teléfono destruido enviado a contenedor de reciclaje.'),
(78, 78, '2024-07-19 16:20:00', 3, 5, 3, 6, 'Switch de fibra vendido a pequeña empresa local.'),
(79, 79, '2024-07-26 09:15:00', 2, 3, 2, 3, 'Impresora probada, pasa a inventario comercial.'),
(80, 80, '2024-08-02 10:50:00', 2, 3, 2, 5, 'Disco duro formateado y colocado en almacén de partes.'),
(81, 81, '2024-08-09 13:00:00', 2, 3, 2, 3, 'Laptop reacondicionada trasladada a almacén principal.'),
(82, 82, '2024-08-16 15:40:00', 2, 3, 2, 3, 'iPhone reparado listo para exhibición en outlet.'),
(83, 83, '2024-08-23 11:10:00', 3, 5, 3, 6, 'Firewall comercializado a empresa aliada.'),
(84, 84, '2024-08-30 14:30:00', 3, 5, 3, 6, 'Monitor vendido a menor precio en tienda física.'),
(85, 85, '2024-09-06 09:20:00', 2, 3, 2, 5, 'Tarjeta madre verificada lista en bodega de repuestos.'),
(86, 86, '2024-09-13 12:15:00', 3, 5, 3, 6, 'Mini PC corporativo vendido a cliente particular.'),
(87, 87, '2024-09-20 16:00:00', 1, 4, 1, 4, 'Tablet inservible enviada a clasificación de materiales.'),
(88, 88, '2024-09-27 10:45:00', 2, 3, 2, 3, 'Servidor NAS probado y listo para reacondicionamiento comercial.'),
(89, 89, '2024-10-04 11:25:00', 1, 2, 1, 2, 'Pasada a mantenimiento por fallo de arrastre de papel.'),
(90, 90, '2024-10-11 13:50:00', 2, 3, 2, 3, 'Procesador listo para venta individual.'),
(91, 91, '2024-10-18 15:15:00', 3, 5, 3, 6, 'Vendido a cliente final a precio reducido de segunda mano.'),
(92, 92, '2024-10-25 08:45:00', 1, 2, 1, 2, 'Celular ingresado a diagnóstico de batería y señal.'),
(93, 93, '2024-11-01 10:30:00', 3, 5, 3, 6, 'Access Point vendido a cliente institucional.'),
(94, 94, '2024-11-08 14:00:00', 2, 3, 2, 3, 'Monitor pulido y colocado en exhibición.'),
(95, 95, '2024-11-15 16:10:00', 2, 3, 2, 5, 'Kit RAM enviado a inventario de piezas verificadas.'),
(96, 96, '2024-11-22 09:50:00', 2, 3, 2, 3, 'Laptop reacondicionada aprobada por el área de calidad.'),
(97, 97, '2024-11-29 11:05:00', 1, 4, 1, 4, 'Dispositivo con humedad grave enviado a reciclaje ecológico.'),
(98, 98, '2024-12-06 13:40:00', 2, 3, 2, 3, 'Switch probado en todos sus puertos; pasa a catálogo.'),
(99, 99, '2024-12-13 15:20:00', 3, 5, 3, 6, 'Teclado mecánico vendido de segunda mano en tienda web.'),
(100, 100, '2024-12-20 10:00:00', 2, 3, 2, 5, 'Fuente modular verificada colocada en bodega de partes.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientos`
--

CREATE TABLE `mantenimientos` (
  `id_mantenimiento` int NOT NULL,
  `id_activo` int NOT NULL,
  `tipo` enum('Preventivo','Correctivo') COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `responsable` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mantenimientos`
--

INSERT INTO `mantenimientos` (`id_mantenimiento`, `id_activo`, `tipo`, `fecha_mantenimiento`, `descripcion`, `responsable`, `costo`) VALUES
(1, 1, 'Preventivo', '2023-02-01', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 23.50),
(2, 2, 'Correctivo', '2023-02-08', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 32.00),
(3, 3, 'Preventivo', '2023-02-15', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 40.50),
(4, 4, 'Correctivo', '2023-02-22', 'Despiece total para separación de metales y tarjetas PCB.', 'Taller Externo Refurb', 49.00),
(5, 5, 'Preventivo', '2023-03-01', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 57.50),
(6, 6, 'Correctivo', '2023-03-08', 'Reemplazo de pantalla quebrada y prueba de carga.', 'Luis Hernández', 66.00),
(7, 7, 'Preventivo', '2023-03-15', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 74.50),
(8, 8, 'Correctivo', '2023-03-22', 'Limpieza ultrasónica de placa madre y cambio de conectores.', 'Taller Externo Refurb', 83.00),
(9, 9, 'Preventivo', '2023-03-29', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 91.50),
(10, 10, 'Correctivo', '2023-04-05', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 100.00),
(11, 11, 'Preventivo', '2023-04-12', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 108.50),
(12, 12, 'Correctivo', '2023-04-19', 'Despiece total para separación de metales y tarjetas PCB.', 'Taller Externo Refurb', 117.00),
(13, 13, 'Preventivo', '2023-04-26', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 125.50),
(14, 14, 'Correctivo', '2023-05-03', 'Reemplazo de pantalla quebrada y prueba de carga.', 'Luis Hernández', 134.00),
(15, 15, 'Preventivo', '2023-05-10', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 142.50),
(16, 16, 'Correctivo', '2023-05-17', 'Limpieza ultrasónica de placa madre y cambio de conectores.', 'Taller Externo Refurb', 151.00),
(17, 17, 'Preventivo', '2023-05-24', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 159.50),
(18, 18, 'Correctivo', '2023-05-31', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 168.00),
(19, 19, 'Preventivo', '2023-06-07', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 176.50),
(20, 20, 'Correctivo', '2023-06-14', 'Despiece total para separación de metales y tarjetas PCB.', 'Taller Externo Refurb', 185.00),
(21, 21, 'Preventivo', '2023-06-21', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 193.50),
(22, 22, 'Correctivo', '2023-06-28', 'Reemplazo de pantalla quebrada y prueba de carga.', 'Luis Hernández', 202.00),
(23, 23, 'Preventivo', '2023-07-05', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 210.50),
(24, 24, 'Correctivo', '2023-07-12', 'Limpieza ultrasónica de placa madre y cambio de conectores.', 'Taller Externo Refurb', 219.00),
(25, 25, 'Preventivo', '2023-07-19', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 227.50),
(26, 26, 'Correctivo', '2023-07-26', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 236.00),
(27, 27, 'Preventivo', '2023-08-02', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 244.50),
(28, 28, 'Correctivo', '2023-08-09', 'Despiece total para separación de metales y tarjetas PCB.', 'Taller Externo Refurb', 253.00),
(29, 29, 'Preventivo', '2023-08-16', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 261.50),
(30, 30, 'Correctivo', '2023-08-23', 'Reemplazo de pantalla quebrada y prueba de carga.', 'Luis Hernández', 270.00),
(31, 31, 'Preventivo', '2023-08-30', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 278.50),
(32, 32, 'Correctivo', '2023-09-06', 'Limpieza ultrasónica de placa madre y cambio de conectores.', 'Taller Externo Refurb', 287.00),
(33, 33, 'Preventivo', '2023-09-13', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 295.50),
(34, 34, 'Correctivo', '2023-09-20', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 304.00),
(35, 35, 'Preventivo', '2023-09-27', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 312.50),
(36, 36, 'Correctivo', '2023-10-04', 'Despiece total para separación de metales y tarjetas PCB.', 'Taller Externo Refurb', 321.00),
(37, 37, 'Preventivo', '2023-10-11', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 329.50),
(38, 38, 'Correctivo', '2023-10-18', 'Reemplazo de pantalla quebrada y prueba de carga.', 'Luis Hernández', 338.00),
(39, 39, 'Preventivo', '2023-10-25', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 346.50),
(40, 40, 'Correctivo', '2023-11-01', 'Limpieza ultrasónica de placa madre y cambio de conectores.', 'Taller Externo Refurb', 355.00),
(41, 41, 'Preventivo', '2023-11-08', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 363.50),
(42, 42, 'Correctivo', '2023-11-15', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 372.00),
(43, 43, 'Preventivo', '2023-11-22', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 380.50),
(44, 44, 'Correctivo', '2023-11-29', 'Despiece total para separación de metales y tarjetas PCB.', 'Taller Externo Refurb', 389.00),
(45, 45, 'Preventivo', '2023-12-06', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 397.50),
(46, 46, 'Correctivo', '2023-12-13', 'Reemplazo de pantalla quebrada y prueba de carga.', 'Luis Hernández', 406.00),
(47, 47, 'Preventivo', '2023-12-20', 'Revisión periódica de rutina, limpieza y lubricación.', 'María Rodríguez', 414.50),
(48, 48, 'Correctivo', '2023-12-27', 'Limpieza ultrasónica de placa madre y cambio de conectores.', 'Taller Externo Refurb', 423.00),
(49, 49, 'Preventivo', '2024-01-03', 'Revisión periódica de rutina, limpieza y lubricación.', 'Ana Martínez', 431.50),
(50, 50, 'Correctivo', '2024-01-10', 'Cambio de batería, pasta térmica y reinstalación de SO.', 'Luis Hernández', 440.00),
(51, 51, 'Preventivo', '2024-01-10', 'Limpieza interna y aplicación de pasta térmica.', 'Ana Martínez', 25.00),
(52, 52, 'Correctivo', '2024-01-17', 'Reemplazo de módulo de batería por componente nuevo.', 'Luis Hernández', 45.00),
(53, 53, 'Preventivo', '2024-01-24', 'Actualización de firmware y formateo seguro de discos.', 'María Rodríguez', 60.00),
(54, 54, 'Correctivo', '2024-01-31', 'Reparación de condensadores en tarjeta lógica de video.', 'Taller Externo Refurb', 35.00),
(55, 55, 'Preventivo', '2024-02-07', 'Diagnóstico de sectores y verificación de salud S.M.A.R.T.', 'Ana Martínez', 15.00),
(56, 56, 'Correctivo', '2024-02-14', 'Cambio de teclado y restauración de sistema operativo.', 'Luis Hernández', 50.00),
(57, 57, 'Correctivo', '2024-02-21', 'Sustitución de puerto de carga Flex.', 'María Rodríguez', 30.00),
(58, 58, 'Preventivo', '2024-02-28', 'Prueba de puertos RJ45 y actualización de IOS/Firmware.', 'Ana Martínez', 40.00),
(59, 59, 'Preventivo', '2024-03-06', 'Limpieza de chasís y calibración de brillo/color.', 'Luis Hernández', 20.00),
(60, 60, 'Preventivo', '2024-03-13', 'Medición de voltajes con multímetro en banco de ensayo.', 'María Rodríguez', 18.00),
(61, 61, 'Correctivo', '2024-03-20', 'Reemplazo de bus de video flex de pantalla.', 'Taller Externo Refurb', 75.00),
(62, 62, 'Correctivo', '2024-03-27', 'Cambio de cristal digitalizador táctil.', 'Luis Hernández', 55.00),
(63, 63, 'Preventivo', '2024-04-03', 'Reset a valores de fábrica y prueba de throughput.', 'Ana Martínez', 35.00),
(64, 64, 'Correctivo', '2024-04-10', 'Ajuste de rodillos de arrastre y calibración de cabezal.', 'María Rodríguez', 42.00),
(65, 65, 'Preventivo', '2024-04-17', 'Limpieza de contactos dorados y prueba de pines.', 'Ana Martínez', 12.00),
(66, 66, 'Preventivo', '2024-04-24', 'Mantenimiento de ventiladores y formateo con SSD.', 'Luis Hernández', 38.00),
(67, 67, 'Correctivo', '2024-05-01', 'Desmontaje total para clasificación de tarjetas RAEE.', 'Luis Hernández', 15.00),
(68, 68, 'Correctivo', '2024-05-08', 'Reemplazo de baterías internas de plomo-ácido.', 'Taller Externo Refurb', 65.00),
(69, 69, 'Preventivo', '2024-05-15', 'Limpieza de lentes ópticos del escáner.', 'María Rodríguez', 28.00),
(70, 70, 'Preventivo', '2024-05-22', 'Prueba de estabilidad gráfica y cambio de pads térmicos.', 'Ana Martínez', 32.00),
(71, 71, 'Preventivo', '2024-05-29', 'Instalación de paquete de software basico para reventa.', 'Ana Martínez', 20.00),
(72, 72, 'Preventivo', '2024-06-05', 'Diagnóstico general de consumo de batería en reposo.', 'Luis Hernández', 22.00),
(73, 73, 'Correctivo', '2024-06-12', 'Extracción de fuentes redundantes y memorias para repuestos.', 'María Rodríguez', 50.00),
(74, 74, 'Correctivo', '2024-06-19', 'Intento de reflow en GPU no exitoso; pasa a reciclaje.', 'Taller Externo Refurb', 30.00),
(75, 75, 'Preventivo', '2024-06-26', 'Test MemTest86 completado sin errores.', 'Ana Martínez', 10.00),
(76, 76, 'Correctivo', '2024-07-03', 'Cambio de ventilador disipador ruidoso.', 'Luis Hernández', 48.00),
(77, 77, 'Correctivo', '2024-07-10', 'Separación de componentes plásticos y metales pesados.', 'Luis Hernández', 15.00),
(78, 78, 'Preventivo', '2024-07-17', 'Limpieza de polvo interno y test de fibra SFP.', 'María Rodríguez', 25.00),
(79, 79, 'Preventivo', '2024-07-24', 'Revisión del unidad de fusión y recarga de tóner.', 'Ana Martínez', 30.00),
(80, 80, 'Preventivo', '2024-07-31', 'Borrado seguro de datos mediante software certificado.', 'Ana Martínez', 18.00),
(81, 81, 'Preventivo', '2024-08-07', 'Instalación de SSD de 256GB y mantenimiento general.', 'Luis Hernández', 45.00),
(82, 82, 'Correctivo', '2024-08-14', 'Cambio del sensor de cámara trasera.', 'María Rodríguez', 62.00),
(83, 83, 'Preventivo', '2024-08-21', 'Actualización de base de firmas y reset de fábrica.', 'Ana Martínez', 35.00),
(84, 84, 'Preventivo', '2024-08-28', 'Prueba de frecuencia de refresco 144Hz en monitor.', 'Luis Hernández', 15.00),
(85, 85, 'Preventivo', '2024-09-04', 'Actualización de BIOS y prueba con socket AM4.', 'María Rodríguez', 20.00),
(86, 86, 'Preventivo', '2024-09-11', 'Instalación de sistema operativo limpio.', 'Ana Martínez', 25.00),
(87, 87, 'Correctivo', '2024-09-18', 'Desmontaje de pantalla LCD dañada para reciclaje.', 'Luis Hernández', 12.00),
(88, 88, 'Preventivo', '2024-09-25', 'Configuración de arreglo RAID y verificación de bahías.', 'María Rodríguez', 40.00),
(89, 89, 'Correctivo', '2024-10-02', 'Cambio de goma de alimentación de papel.', 'Taller Externo Refurb', 28.00),
(90, 90, 'Preventivo', '2024-10-09', 'Inspección visual de pines y test de estabilidad.', 'Ana Martínez', 15.00),
(91, 91, 'Preventivo', '2024-10-16', 'Pintado suave de carcasa e instalación de cargador nuevo.', 'Luis Hernández', 35.00),
(92, 92, 'Preventivo', '2024-10-23', 'Revisión de consumo de energía con amperímetro.', 'María Rodríguez', 20.00),
(93, 93, 'Preventivo', '2024-10-30', 'Prueba de cobertura inalámbrica en banda 5GHz.', 'Ana Martínez', 22.00),
(94, 94, 'Preventivo', '2024-11-06', 'Limpieza de pantalla con solución antiestática.', 'Luis Hernández', 10.00),
(95, 95, 'Preventivo', '2024-11-13', 'Prueba de velocidad de lectura y escritura.', 'María Rodríguez', 12.00),
(96, 96, 'Correctivo', '2024-11-20', 'Reparación de circuito de carga en la tarjeta madre.', 'Taller Externo Refurb', 68.00),
(97, 97, 'Correctivo', '2024-11-27', 'Extracción de metales preciosos e hilos de cobre.', 'Luis Hernández', 15.00),
(98, 98, 'Preventivo', '2024-12-04', 'Verificación de velocidad Gigabit en los 24 puertos.', 'Ana Martínez', 30.00),
(99, 99, 'Preventivo', '2024-12-11', 'Soplado de polvo y cambio de keycaps faltantes.', 'María Rodríguez', 18.00),
(100, 100, 'Preventivo', '2024-12-18', 'Verificación de riel de 12V bajo carga pesada.', 'Ana Martínez', 25.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` int NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `fecha_generacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `generado_por` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `titulo`, `descripcion`, `fecha_generacion`, `generado_por`) VALUES
(1, 'Tasa de Recuperación y Refurbish Q1', 'Porcentaje de equipos reacondicionados exitosamente', '2024-03-31 10:30:00', 1),
(2, 'Informe de Mitigación de Huella de Carbono', 'Kilos de e-waste desviados de vertederos', '2024-05-15 14:00:00', 3),
(3, 'Balance Económico por Reventa de Equipos', 'Ingresos generados por comercialización de segunda mano', '2024-06-30 16:45:00', 4),
(4, 'Auditoría de Desecho RAEE y Componentes', 'Análisis de materiales extraídos (cobre, oro, plásticos)', '2024-07-20 09:15:00', 3),
(5, 'Consolidado General de Ciclo de Vida 2024', 'Métricas integradas de entrada, reparación, venta y reciclaje', '2024-08-31 11:20:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id_ubicacion` int NOT NULL,
  `nombre_ubicacion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `id_empresa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id_ubicacion`, `nombre_ubicacion`, `descripcion`, `id_empresa`) VALUES
(1, 'Centro de Recepción y Diagnóstico', 'Recepción de e-waste e inspección inicial', 1),
(2, 'Taller de Reacondicionamiento (Refurbish)', 'Reparación, limpieza y repotenciación', 1),
(3, 'Almacén de Equipos Reacondicionados', 'Inventario listo para venta de segunda mano', 3),
(4, 'Planta de Despiece y Clasificación', 'Separación de componentes (RAEE / E-Waste)', 2),
(5, 'Bodega de Materiales Reciclados', 'Plásticos, cobres, tarjetas PCB y baterías', 2),
(6, 'Outlets y Tienda de Reventa', 'Exhibición y venta a precios accesibles', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `primer_apellido` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `segundo_apellido` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `contrasena`, `rol`) VALUES
(1, 'Carlos', 'Gómez', 'Ríos', 'cgomez@ecotech.com', '$2a$12$e8f7a6...', 'Administrador BI'),
(2, 'Ana', 'Martínez', 'López', 'amartinez@ecotech.com', '$2a$12$e8f7a6...', 'Técnico de Reacondicionamiento'),
(3, 'Luis', 'Hernández', 'Silva', 'lhernandez@ecotech.com', '$2a$12$e8f7a6...', 'Especialista en Reciclaje RAEE'),
(4, 'Sofía', 'Pérez', 'Torres', 'sperez@techremarketing.com', '$2a$12$e8f7a6...', 'Gestora de Ventas / Remarketing'),
(5, 'Jorge', 'Ramírez', 'Castro', 'jramirez@ecorecycle.com', '$2a$12$e8f7a6...', 'Supervisora de Diagnóstico'),
(6, 'María', 'Rodríguez', 'Vargas', 'mrodriguez@ecotech.com', '$2a$12$e8f7a6...', 'Técnico de Calidad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`id_activo`),
  ADD UNIQUE KEY `codigo_qr` (`codigo_qr`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_ubicacion` (`id_ubicacion`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `nit` (`nit`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `historial_activos`
--
ALTER TABLE `historial_activos`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_activo` (`id_activo`),
  ADD KEY `estado_anterior` (`estado_anterior`),
  ADD KEY `nuevo_estado` (`nuevo_estado`),
  ADD KEY `ubicacion_anterior` (`ubicacion_anterior`),
  ADD KEY `nueva_ubicacion` (`nueva_ubicacion`);

--
-- Indices de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `id_activo` (`id_activo`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `generado_por` (`generado_por`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `id_activo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_activos`
--
ALTER TABLE `historial_activos`
  MODIFY `id_historial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  MODIFY `id_mantenimiento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id_ubicacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `activos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `activos_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `activos_ibfk_3` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`),
  ADD CONSTRAINT `activos_ibfk_4` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `historial_activos`
--
ALTER TABLE `historial_activos`
  ADD CONSTRAINT `historial_activos_ibfk_1` FOREIGN KEY (`id_activo`) REFERENCES `activos` (`id_activo`),
  ADD CONSTRAINT `historial_activos_ibfk_2` FOREIGN KEY (`estado_anterior`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `historial_activos_ibfk_3` FOREIGN KEY (`nuevo_estado`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `historial_activos_ibfk_4` FOREIGN KEY (`ubicacion_anterior`) REFERENCES `ubicaciones` (`id_ubicacion`),
  ADD CONSTRAINT `historial_activos_ibfk_5` FOREIGN KEY (`nueva_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`);

--
-- Filtros para la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD CONSTRAINT `mantenimientos_ibfk_1` FOREIGN KEY (`id_activo`) REFERENCES `activos` (`id_activo`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`generado_por`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `ubicaciones_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

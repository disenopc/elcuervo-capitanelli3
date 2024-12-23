-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: elcuervopetshop
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `elcuervopetshop`
--

/*!40000 DROP DATABASE IF EXISTS `elcuervopetshop`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `elcuervopetshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `elcuervopetshop`;

--
-- Table structure for table `categoria_de_producto`
--

DROP TABLE IF EXISTS `categoria_de_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_de_producto` (
  `id_categoria_de_producto` int NOT NULL AUTO_INCREMENT,
  `categoria_de_producto` enum('ALIMENTO DE PERRO','ALIMENTO DE GATO','ALIMENTO DE MAMIFEROS PEQUENOS','ALIMENTO DE REPTILES','ALIMENTO DE PECES','ACCESORIOS DE PERRO','ACCESORIOS DE GATO','ACCESORIOS DE AVE','ACCESORIOS PARA PECERA','ACCESORIOS MAMIFEROS PEQUENOS','ACCESORIOS DE REPTILES') DEFAULT NULL,
  PRIMARY KEY (`id_categoria_de_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_de_producto`
--

LOCK TABLES `categoria_de_producto` WRITE;
/*!40000 ALTER TABLE `categoria_de_producto` DISABLE KEYS */;
INSERT INTO `categoria_de_producto` VALUES (1,'ALIMENTO DE PERRO'),(2,'ALIMENTO DE GATO'),(3,'ALIMENTO DE MAMIFEROS PEQUENOS'),(4,'ALIMENTO DE REPTILES'),(5,'ACCESORIOS DE PERRO');
/*!40000 ALTER TABLE `categoria_de_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_de_almacenamiento`
--

DROP TABLE IF EXISTS `centro_de_almacenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_de_almacenamiento` (
  `id_centro_de_almacenamiento` int NOT NULL AUTO_INCREMENT,
  `nombre_almacen` enum('PETRACCHI','MODULO 2') DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `capacidad` varchar(200) DEFAULT NULL,
  `responsable` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_centro_de_almacenamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_de_almacenamiento`
--

LOCK TABLES `centro_de_almacenamiento` WRITE;
/*!40000 ALTER TABLE `centro_de_almacenamiento` DISABLE KEYS */;
INSERT INTO `centro_de_almacenamiento` VALUES (1,'PETRACCHI','Zona Industrial Norte','1000 m2','Carlos Gutierrez'),(2,'MODULO 2','Parque LogÃ­stico Este','800 m2','Laura Mendez'),(3,'PETRACCHI','Zona Industrial Sur','1200 m2','Ricardo Fernandez'),(4,'MODULO 2','Parque LogÃ­stico Oeste','900 m2','Martina Rodriguez'),(5,'PETRACCHI','Centro LogÃ­stico','1500 m2','Diego Martinez');
/*!40000 ALTER TABLE `centro_de_almacenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(200) DEFAULT NULL,
  `fecha_de_nacimiento` datetime DEFAULT (now()),
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `fecha_de_alta` datetime DEFAULT (now()),
  `estado` enum('DEUDOR','A TIEMPO') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Roberto Sanchez','1985-06-15 00:00:00','Av. Libertador 1234','roberto.sanchez1@email.com','2024-01-10 10:00:00','A TIEMPO'),(2,'Carolina Lopez','1990-03-22 00:00:00','Mitre 567','carolina.lopez1@email.com','2024-02-15 14:30:00','A TIEMPO'),(3,'Miguel Torres','1978-11-30 00:00:00','San Martin 890','miguel.torres1@email.com','2024-03-20 11:45:00','DEUDOR'),(4,'Sofia Ramirez','1995-09-10 00:00:00','Belgrano 456','sofia.ramirez1@email.com','2024-04-05 09:15:00','A TIEMPO'),(5,'Daniel Morales','1982-07-05 00:00:00','Rivadavia 2345','daniel.morales1@email.com','2024-05-12 16:20:00','DEUDOR');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_de_compra`
--

DROP TABLE IF EXISTS `detalle_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_numero_de_factura_de_compra` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_producto` (`id_producto`),
  KEY `id_numero_de_factura_de_compra` (`id_numero_de_factura_de_compra`),
  CONSTRAINT `detalle_de_compra_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `detalle_de_compra_ibfk_2` FOREIGN KEY (`id_numero_de_factura_de_compra`) REFERENCES `facturas_de_compra` (`id_numero_de_factura_de_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_de_compra`
--

LOCK TABLES `detalle_de_compra` WRITE;
/*!40000 ALTER TABLE `detalle_de_compra` DISABLE KEYS */;
INSERT INTO `detalle_de_compra` VALUES (1,1,1,100,45.50,4550.00),(2,2,2,80,32.75,2620.00),(3,3,3,50,55.20,2760.00),(4,4,4,120,18.90,2268.00),(5,5,5,75,26.60,1995.00);
/*!40000 ALTER TABLE `detalle_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_de_venta`
--

DROP TABLE IF EXISTS `detalle_de_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_venta` (
  `id_detalle_de_venta` int NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_num_factura_venta` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tipo_venta` enum('ONLINE','FISICA') DEFAULT NULL,
  `nombre_cliente` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_de_venta`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_de_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `detalle_de_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_de_venta`
--

LOCK TABLES `detalle_de_venta` WRITE;
/*!40000 ALTER TABLE `detalle_de_venta` DISABLE KEYS */;
INSERT INTO `detalle_de_venta` VALUES (1,1,1,1,2,45.50,0.00,91.00,'FISICA','Roberto Sanchez'),(2,2,2,2,3,32.75,5.00,93.25,'ONLINE','Carolina Lopez'),(3,3,3,3,1,55.20,0.00,55.20,'FISICA','Miguel Torres'),(4,4,4,4,4,18.90,10.00,65.60,'ONLINE','Sofia Ramirez'),(5,5,5,5,2,26.60,0.00,53.20,'FISICA','Daniel Morales');
/*!40000 ALTER TABLE `detalle_de_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_stock_postventa` AFTER INSERT ON `detalle_de_venta` FOR EACH ROW BEGIN
    -- Reducir la cantidad de productos en la tabla productos
    UPDATE productos 
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = NEW.id_producto;

    -- Reducir la cantidad de stock en la tabla stock
    UPDATE stock 
    SET cantidad_stock = cantidad_stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturas_de_compra`
--

DROP TABLE IF EXISTS `facturas_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_de_compra` (
  `id_numero_de_factura_de_compra` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(200) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT (now()),
  `detalle` varchar(200) DEFAULT NULL,
  `monto_bruto` decimal(10,2) DEFAULT NULL,
  `impuestos` decimal(10,2) DEFAULT NULL,
  `monto_neto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_numero_de_factura_de_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_de_compra`
--

LOCK TABLES `facturas_de_compra` WRITE;
/*!40000 ALTER TABLE `facturas_de_compra` DISABLE KEYS */;
INSERT INTO `facturas_de_compra` VALUES (1,'PetFood Suppliers','2024-01-15 10:30:00','Compra de alimentos para perros',5000.00,950.00,5950.00),(2,'Animal Accessories Inc','2024-02-20 14:45:00','Compra de accesorios para gatos',3500.00,665.00,4165.00),(3,'Wild Reptile Supplies','2024-03-10 09:15:00','Compra de alimentos para reptiles',2800.00,532.00,3332.00),(4,'Fish World Distributors','2024-04-05 11:20:00','Compra de accesorios para pecera',4200.00,798.00,4998.00),(5,'Small Mammal Solutions','2024-05-12 15:00:00','Compra de alimentos para mamÃ­feros pequeÃ±os',3000.00,570.00,3570.00);
/*!40000 ALTER TABLE `facturas_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_de_venta`
--

DROP TABLE IF EXISTS `facturas_de_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_de_venta` (
  `id_num_factura_venta` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(200) DEFAULT NULL,
  `detalle` varchar(200) DEFAULT NULL,
  `monto_bruto` decimal(10,2) DEFAULT NULL,
  `impuestos` decimal(10,2) DEFAULT NULL,
  `monto_neto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_num_factura_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_de_venta`
--

LOCK TABLES `facturas_de_venta` WRITE;
/*!40000 ALTER TABLE `facturas_de_venta` DISABLE KEYS */;
INSERT INTO `facturas_de_venta` VALUES (1,'Roberto Sanchez','Venta de alimento para perro',2500.00,475.00,2975.00),(2,'Carolina Lopez','Venta de accesorios para gato',1800.00,342.00,2142.00),(3,'Miguel Torres','Venta de alimento para reptiles',1200.00,228.00,1428.00),(4,'Sofia Ramirez','Venta de accesorios para pecera',3000.00,570.00,3570.00),(5,'Daniel Morales','Venta de alimento para mamÃ­feros pequeÃ±os',1500.00,285.00,1785.00);
/*!40000 ALTER TABLE `facturas_de_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_de_precios`
--

DROP TABLE IF EXISTS `historial_de_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_de_precios` (
  `id_historial_precio` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `precio_anterior` decimal(10,2) NOT NULL,
  `precio_nuevo` decimal(10,2) NOT NULL,
  `fecha_cambio` datetime NOT NULL,
  PRIMARY KEY (`id_historial_precio`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `historial_de_precios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_de_precios`
--

LOCK TABLES `historial_de_precios` WRITE;
/*!40000 ALTER TABLE `historial_de_precios` DISABLE KEYS */;
INSERT INTO `historial_de_precios` VALUES (1,1,49.99,45.99,'2024-01-15 10:30:00'),(2,2,99.99,89.99,'2024-02-01 14:15:00'),(3,3,149.99,129.99,'2024-02-15 09:00:00'),(4,4,29.99,24.99,'2024-03-01 11:45:00'),(5,5,199.99,179.99,'2024-03-15 16:20:00');
/*!40000 ALTER TABLE `historial_de_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_de_envio`
--

DROP TABLE IF EXISTS `metodo_de_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_de_envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(255) NOT NULL,
  `costo_envio` decimal(10,2) NOT NULL,
  `tiempo_estimado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_de_envio`
--

LOCK TABLES `metodo_de_envio` WRITE;
/*!40000 ALTER TABLE `metodo_de_envio` DISABLE KEYS */;
INSERT INTO `metodo_de_envio` VALUES (1,'EnvÃ­o EstÃ¡ndar',5.99,'3-5 dÃ­as hÃ¡biles'),(2,'EnvÃ­o Express',12.99,'24-48 horas'),(3,'EnvÃ­o Internacional',25.99,'7-10 dÃ­as hÃ¡biles'),(4,'Recogida en Tienda',0.00,'1-2 dÃ­as hÃ¡biles'),(5,'EnvÃ­o Premium',15.99,'Mismo dÃ­a');
/*!40000 ALTER TABLE `metodo_de_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postventa`
--

DROP TABLE IF EXISTS `postventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postventa` (
  `id_reclamo` int NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `nombre_cliente` varchar(200) DEFAULT NULL,
  `fecha_reclamo` datetime DEFAULT (now()),
  `tipo_de_reclamo` enum('PRODUCTO DEFECTUOSO','RETRASO EN ENTREGA','ERROR DE FACTURACION','EXPECTATIVA NO SATISFECHA') DEFAULT NULL,
  `estado_del_reclamo` enum('RESUELTO','EN PROGRESO','EN ESPERA') DEFAULT NULL,
  `prioridad` enum('ALTA','MEDIA','BAJA') DEFAULT NULL,
  `cantidad_de_reclamos` int DEFAULT NULL,
  `respuesta` varchar(200) DEFAULT NULL,
  `fecha_de_resolucion` datetime DEFAULT (now()),
  PRIMARY KEY (`id_reclamo`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `postventa_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postventa`
--

LOCK TABLES `postventa` WRITE;
/*!40000 ALTER TABLE `postventa` DISABLE KEYS */;
INSERT INTO `postventa` VALUES (1,1,'Roberto Sanchez','2024-12-23 11:33:36','PRODUCTO DEFECTUOSO','RESUELTO','BAJA',1,'Se realizÃ³ cambio del producto','2024-12-23 11:33:36'),(2,2,'Carolina Lopez','2024-12-23 11:33:36','RETRASO EN ENTREGA','EN PROGRESO','MEDIA',2,'Investigando el motivo del retraso','2024-12-23 11:33:36'),(3,3,'Miguel Torres','2024-12-23 11:33:36','ERROR DE FACTURACION','EN ESPERA','ALTA',3,'Pendiente de revisiÃ³n contable','2024-12-23 11:33:36'),(4,4,'Sofia Ramirez','2024-12-23 11:33:36','EXPECTATIVA NO SATISFECHA','RESUELTO','BAJA',1,'Se ofreciÃ³ explicaciÃ³n y soluciÃ³n','2024-12-23 11:33:36'),(5,5,'Daniel Morales','2024-12-23 11:33:36','PRODUCTO DEFECTUOSO','EN PROGRESO','MEDIA',2,'Evaluando condiciÃ³n del producto','2024-12-23 11:33:36');
/*!40000 ALTER TABLE `postventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_stock_devolucion` AFTER INSERT ON `postventa` FOR EACH ROW BEGIN
    -- Variable para almacenar el ID del cliente
    DECLARE v_cliente_id INT;

    -- Obtener el ID del cliente a partir de la venta
    SELECT id_cliente INTO v_cliente_id
    FROM ventas
    WHERE id_venta = NEW.id_venta;

    -- Actualizar estado del cliente si tiene muchos reclamos
    IF (SELECT COUNT(*) 
        FROM postventa 
        WHERE id_venta IN (SELECT id_venta FROM ventas WHERE id_cliente = v_cliente_id)) > 3 THEN
        UPDATE cliente
        SET estado = 'DEUDOR'
        WHERE id_cliente = v_cliente_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_numero_de_factura_de_compra` int DEFAULT NULL,
  `id_categoria_de_producto` int DEFAULT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_numero_de_factura_de_compra` (`id_numero_de_factura_de_compra`),
  KEY `id_categoria_de_producto` (`id_categoria_de_producto`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_numero_de_factura_de_compra`) REFERENCES `facturas_de_compra` (`id_numero_de_factura_de_compra`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_categoria_de_producto`) REFERENCES `categoria_de_producto` (`id_categoria_de_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,1,'Alimento Premium para Perros Adultos',45.50,100),(2,2,2,'Snacks para Gatos Salmon',32.75,80),(3,3,4,'Alimento para Iguana',55.20,50),(4,4,5,'Collar Reflectivo para Perros',18.90,120),(5,5,3,'Alimento Balanceado para Hamsters',26.60,75);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas_de_fidelidad`
--

DROP TABLE IF EXISTS `programas_de_fidelidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programas_de_fidelidad` (
  `id_programa` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `puntos_acumulados` int NOT NULL DEFAULT '0',
  `nivel_fidelidad` enum('ALTO','MEDIO','BAJO') DEFAULT NULL,
  PRIMARY KEY (`id_programa`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `programas_de_fidelidad_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas_de_fidelidad`
--

LOCK TABLES `programas_de_fidelidad` WRITE;
/*!40000 ALTER TABLE `programas_de_fidelidad` DISABLE KEYS */;
INSERT INTO `programas_de_fidelidad` VALUES (1,1,1500,'ALTO'),(2,2,750,'MEDIO'),(3,3,250,'BAJO'),(4,4,1800,'ALTO'),(5,5,500,'MEDIO');
/*!40000 ALTER TABLE `programas_de_fidelidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `nombre_promocion` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `porcentaje_descuento` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_promocion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'Descuento Verano 2024','Grandes descuentos en toda la colecciÃ³n de verano','2024-06-01 00:00:00','2024-08-31 23:59:59',25.00),(2,'Black Friday','Descuentos especiales en productos seleccionados','2024-11-29 00:00:00','2024-11-29 23:59:59',40.00),(3,'Semana Santa','Aprovecha los descuentos de temporada','2024-03-24 00:00:00','2024-03-31 23:59:59',15.00),(4,'Cyber Monday','Ofertas exclusivas en lÃ­nea','2024-12-02 00:00:00','2024-12-02 23:59:59',30.00),(5,'Aniversario','Celebra nuestro aniversario con descuentos especiales','2024-10-01 00:00:00','2024-10-15 23:59:59',20.00);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_categoria_de_producto` int DEFAULT NULL,
  `fecha` datetime DEFAULT (now()),
  `numero_de_pedido` int DEFAULT NULL,
  `detalles` varchar(200) DEFAULT NULL,
  `forma_de_pago` enum('CONTADO','A 30 DIAS','A 60 DIAS') DEFAULT NULL,
  `estado_del_pago` enum('PAGADO','PENDIENTE') DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `id_producto` (`id_producto`),
  KEY `id_categoria_de_producto` (`id_categoria_de_producto`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`id_categoria_de_producto`) REFERENCES `categoria_de_producto` (`id_categoria_de_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,1,1,'2024-01-15 10:30:00',12345,'Pedido de alimentos para perros','CONTADO','PAGADO'),(2,2,2,'2024-02-20 14:45:00',12346,'Pedido de snacks para gatos','A 30 DIAS','PENDIENTE'),(3,3,4,'2024-03-10 09:15:00',12347,'Pedido de alimentos para reptiles','A 60 DIAS','PENDIENTE'),(4,4,5,'2024-04-05 11:20:00',12348,'Pedido de accesorios para perros','CONTADO','PAGADO'),(5,5,3,'2024-05-12 15:00:00',12349,'Pedido de alimentos para mamÃ­feros pequeÃ±os','A 30 DIAS','PENDIENTE');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_centro_de_almacenamiento` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad_stock` int DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `id_producto` (`id_producto`),
  KEY `id_centro_de_almacenamiento` (`id_centro_de_almacenamiento`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_centro_de_almacenamiento`) REFERENCES `centro_de_almacenamiento` (`id_centro_de_almacenamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1,45.50,100),(2,2,2,32.75,80),(3,3,3,55.20,50),(4,4,4,18.90,120),(5,5,5,26.60,75);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nombre_vendedor` varchar(200) DEFAULT NULL,
  `cantidad_de_ventas` int DEFAULT NULL,
  `estado_vendedor` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Juan PÃ©rez',45,'ACTIVO'),(2,'MarÃ­a Rodriguez',62,'ACTIVO'),(3,'Carlos Gomez',38,'ACTIVO'),(4,'Ana MartÃ­nez',55,'ACTIVO'),(5,'Luis Fernandez',41,'INACTIVO');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  `id_categoria_de_producto` int DEFAULT NULL,
  `id_num_factura_venta` int DEFAULT NULL,
  `nombre_cliente` varchar(200) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `total_venta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_categoria_de_producto` (`id_categoria_de_producto`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_num_factura_venta` (`id_num_factura_venta`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_categoria_de_producto`) REFERENCES `categoria_de_producto` (`id_categoria_de_producto`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`),
  CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`id_num_factura_venta`) REFERENCES `facturas_de_venta` (`id_num_factura_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,1,1,'Roberto Sanchez',45.50,2,91.00),(2,2,2,2,2,'Carolina Lopez',32.75,3,98.25),(3,3,3,4,3,'Miguel Torres',55.20,1,55.20),(4,4,4,5,4,'Sofia Ramirez',18.90,4,75.60),(5,5,5,3,5,'Daniel Morales',26.60,2,53.20);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_cantidad_postventa` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN
    UPDATE vendedor 
    SET cantidad_de_ventas = cantidad_de_ventas + 1
    WHERE id_vendedor = NEW.id_vendedor;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_analisis_reclamos`
--

DROP TABLE IF EXISTS `vista_analisis_reclamos`;
/*!50001 DROP VIEW IF EXISTS `vista_analisis_reclamos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_analisis_reclamos` AS SELECT 
 1 AS `tipo_de_reclamo`,
 1 AS `estado_del_reclamo`,
 1 AS `total_reclamos`,
 1 AS `porcentajes_reclamos`,
 1 AS `promedio_resolucion_tiempo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ingresos_por_categoria`
--

DROP TABLE IF EXISTS `vista_ingresos_por_categoria`;
/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ingresos_por_categoria` AS SELECT 
 1 AS `categoria_de_producto`,
 1 AS `total_ingresos`,
 1 AS `num_ventas`,
 1 AS `promedio_transaccion_valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_mensual_crecimiento_ventas`
--

DROP TABLE IF EXISTS `vista_mensual_crecimiento_ventas`;
/*!50001 DROP VIEW IF EXISTS `vista_mensual_crecimiento_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_mensual_crecimiento_ventas` AS SELECT 
 1 AS `year`,
 1 AS `month`,
 1 AS `total_mensual_ventas`,
 1 AS `previa_mensuales_ventas`,
 1 AS `crecimiento_porcentual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_performance_vendedor`
--

DROP TABLE IF EXISTS `vista_performance_vendedor`;
/*!50001 DROP VIEW IF EXISTS `vista_performance_vendedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_performance_vendedor` AS SELECT 
 1 AS `nombre_vendedor`,
 1 AS `estado_vendedor`,
 1 AS `cantidad_de_ventas`,
 1 AS `total_ventas`,
 1 AS `promedio_valor_ventas`,
 1 AS `num_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_retencion_cliente`
--

DROP TABLE IF EXISTS `vista_retencion_cliente`;
/*!50001 DROP VIEW IF EXISTS `vista_retencion_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_retencion_cliente` AS SELECT 
 1 AS `estado_cliente`,
 1 AS `total_clientes`,
 1 AS `clientes_activos`,
 1 AS `tasa_retencion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_rotacion_inventarios`
--

DROP TABLE IF EXISTS `vista_rotacion_inventarios`;
/*!50001 DROP VIEW IF EXISTS `vista_rotacion_inventarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_rotacion_inventarios` AS SELECT 
 1 AS `nombre_producto`,
 1 AS `categoria_de_producto`,
 1 AS `stock_actual`,
 1 AS `total_unidades_vendidas`,
 1 AS `tasa_rotacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'elcuervopetshop'
--

--
-- Dumping routines for database 'elcuervopetshop'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_tasa_retencion_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_tasa_retencion_clientes`() RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_clientes INT;
    DECLARE clientes_activos INT;

    -- Calcula el total de clientes
    SELECT COUNT(*) INTO total_clientes
    FROM cliente;

    -- Calcula los clientes que tienen ventas asociadas (clientes activos)
    SELECT COUNT(DISTINCT id_cliente) INTO clientes_activos
    FROM ventas;

    -- Retorna el porcentaje de clientes activos
    RETURN ROUND((clientes_activos / total_clientes) * 100, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `tiempo_promedio_resolucion_reclamos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tiempo_promedio_resolucion_reclamos`() RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE promedio_resolucion DECIMAL(10, 2);

    SELECT AVG(DATEDIFF(fecha_de_resolucion, fecha_reclamo))
    INTO promedio_resolucion
    FROM postventa
    WHERE estado_del_reclamo = 'RESUELTO';

    RETURN promedio_resolucion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `vendedor_top_ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `vendedor_top_ventas`() RETURNS varchar(200) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE nombre_vendedor_top VARCHAR(200);

    -- Busca el vendedor con más ventas
    SELECT nombre_vendedor
    INTO nombre_vendedor_top
    FROM vendedor
    ORDER BY cantidad_de_ventas DESC
    LIMIT 1;

    RETURN nombre_vendedor_top;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificar_disponibilidad_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificar_disponibilidad_producto`(
    producto_id INT,
    cantidad_deseada INT
) RETURNS varchar(200) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE stock_actual INT;

    -- Obtiene el stock actual del producto (asegurándose de que solo devuelva una fila)
    SELECT cantidad_stock INTO stock_actual
    FROM stock
    WHERE id_producto = producto_id
    LIMIT 1;  

    -- Verifica si hay suficiente stock
    IF stock_actual >= cantidad_deseada THEN
        RETURN 'Stock disponible';
    ELSE
        RETURN CONCAT('Stock insuficiente: Solo hay ', stock_actual, ' unidades disponibles.');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPrecioProducto`(
    IN p_id_producto INT,
    IN p_precio_nuevo DECIMAL(10, 2)
)
BEGIN
    -- DECLARACIÓN DE VARIABLES
    DECLARE v_existente INT;

    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- CHEQUEO DE LA EXISTENCIA DEL PRODUCTO
    SELECT COUNT(*) INTO v_existente FROM productos WHERE id_producto = p_id_producto;

    -- SI EL PRODUCTO NO EXISTE, HACER ROLLBACK
    IF v_existente = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe';
    ELSE
        -- SI EL PRODUCTO EXISTE, ACTUALIZAR EL PRECIO
        UPDATE productos
        SET precio = p_precio_nuevo
        WHERE id_producto = p_id_producto;

        -- HACER PERMANENTE LA TRANSACCIÓN
        COMMIT;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStock`(
    IN p_id_producto INT,
    IN p_id_centro_almacenamiento INT,
    IN p_cantidad INT
)
BEGIN
    -- ACTUALIZA EL STOCK DE PRODUCTO EXISTENTE O NUEVO REGISTRO
    INSERT INTO stock (
        id_producto, 
        id_centro_de_almacenamiento, 
        cantidad_stock
    ) VALUES (
        p_id_producto, 
        p_id_centro_almacenamiento, 
        p_cantidad
    ) ON DUPLICATE KEY UPDATE 
    cantidad_stock = cantidad_stock + p_cantidad;

    -- ACTUALIZAR TABLA DE PRODUCTOS
    UPDATE productos 
    SET cantidad = cantidad + p_cantidad 
    WHERE id_producto = p_id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto`(
    IN p_id_factura_compra INT,
    IN p_id_categoria INT,
    IN p_nombre_producto VARCHAR(200),
    IN p_precio DECIMAL(10,2),
    IN p_cantidad INT
)
BEGIN
    INSERT INTO productos (
        id_numero_de_factura_de_compra, 
        id_categoria_de_producto, 
        nombre_producto, 
        precio, 
        cantidad
    ) VALUES (
        p_id_factura_compra, 
        p_id_categoria, 
        p_nombre_producto, 
        p_precio, 
        p_cantidad
    );
    SELECT LAST_INSERT_ID() AS nuevo_producto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDetallesVentaConVendedoresFiltrados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDetallesVentaConVendedoresFiltrados`(
    IN p_tipo_venta VARCHAR(10),
    IN p_estado_vendedor VARCHAR(10),
    IN p_min_cantidad INT,
    IN p_max_cantidad INT
)
BEGIN
    -- Asigna valores predeterminados si son NULL
    IF p_min_cantidad IS NULL THEN
        SET p_min_cantidad = 0;
    END IF;
    IF p_max_cantidad IS NULL THEN
        SET p_max_cantidad = 1000000;
    END IF;

    SELECT 
        dv.id_detalle_de_venta,
        dv.id_venta,
        dv.id_producto,
        dv.id_num_factura_venta,
        dv.cantidad AS cantidad_vendida,
        dv.precio AS precio_venta,
        dv.descuento,
        dv.subtotal,
        dv.tipo_venta,
        dv.nombre_cliente,
        v.id_vendedor,
        v.nombre_vendedor,
        v.cantidad_de_ventas,
        v.estado_vendedor
    FROM 
        detalle_de_venta dv
    LEFT JOIN 
        ventas ve ON dv.id_venta = ve.id_venta
    LEFT JOIN 
        vendedor v ON ve.id_vendedor = v.id_vendedor
    WHERE 
        (p_tipo_venta IS NULL OR dv.tipo_venta = p_tipo_venta)
        AND (p_estado_vendedor IS NULL OR v.estado_vendedor = p_estado_vendedor)
        AND dv.cantidad BETWEEN p_min_cantidad AND p_max_cantidad
    ORDER BY 
        dv.id_detalle_de_venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarProgramaFidelidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarProgramaFidelidad`(
    IN p_id_cliente INT,
    IN p_puntos INT,
    IN p_nivel_fidelidad ENUM('ALTO', 'MEDIO', 'BAJO')
)
BEGIN
    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- INSERTAR UN NUEVO CLIENTE AL PROGRAMA DE FIDELIZACIÓN
    INSERT INTO programas_de_fidelidad (id_cliente, puntos_acumulados, nivel_fidelidad)
    VALUES (p_id_cliente, p_puntos, p_nivel_fidelidad);

    -- HACER PERMANENTE LA TRANSACCIÓN
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPromocion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPromocion`(
    IN p_nombre_promocion VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_fecha_inicio DATETIME,
    IN p_fecha_fin DATETIME,
    IN p_descuento DECIMAL(5, 2)
)
BEGIN
    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- SAVEPOINT
    SAVEPOINT antes_promocion;

    -- INSERTAR LA NUEVA PROMOCIÓN
    INSERT INTO promociones (nombre_promocion, descripcion, fecha_inicio, fecha_fin, porcentaje_descuento)
    VALUES (p_nombre_promocion, p_descripcion, p_fecha_inicio, p_fecha_fin, p_descuento);

    -- HACER PERMANENTE LA TRANSACCIÓN
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarReclamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarReclamo`(
    IN p_id_venta INT,
    IN p_nombre_cliente VARCHAR(200),
    IN p_tipo_reclamo ENUM('PRODUCTO DEFECTUOSO', 'RETRASO EN ENTREGA', 'ERROR DE FACTURACION', 'EXPECTATIVA NO SATISFECHA'),
    IN p_prioridad ENUM('ALTA', 'MEDIA', 'BAJA'),
    IN p_respuesta VARCHAR(200)
)
BEGIN
    INSERT INTO postventa (
        id_venta, 
        nombre_cliente, 
        tipo_de_reclamo, 
        estado_del_reclamo, 
        prioridad, 
        respuesta
    ) VALUES (
        p_id_venta, 
        p_nombre_cliente, 
        p_tipo_reclamo, 
        'EN PROGRESO', 
        p_prioridad, 
        p_respuesta
    );
    SELECT LAST_INSERT_ID() AS nuevo_reclamo_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarVenta`(
    IN p_id_cliente INT,
    IN p_id_vendedor INT,
    IN p_id_categoria INT,
    IN p_nombre_cliente VARCHAR(200),
    IN p_precio_venta DECIMAL(10,2),
    IN p_cantidad INT
)
BEGIN
    DECLARE v_factura_id INT;
    DECLARE v_venta_id INT;

    -- INSERTA DATOS DE LA FACTURA DE VENTA
    INSERT INTO facturas_de_venta (
        nombre_cliente, 
        detalle, 
        monto_bruto, 
        impuestos, 
        monto_neto
    ) VALUES (
        p_nombre_cliente, 
        'Venta de productos', 
        p_precio_venta * p_cantidad, 
        p_precio_venta * p_cantidad * 0.21, 
        p_precio_venta * p_cantidad * 1.21
    );
    SET v_factura_id = LAST_INSERT_ID();

    -- INSERTA LA VENTA
    INSERT INTO ventas (
        id_cliente, 
        id_vendedor, 
        id_categoria_de_producto, 
        id_num_factura_venta, 
        nombre_cliente, 
        precio_venta, 
        cantidad, 
        total_venta
    ) VALUES (
        p_id_cliente, 
        p_id_vendedor, 
        p_id_categoria, 
        v_factura_id, 
        p_nombre_cliente, 
        p_precio_venta, 
        p_cantidad, 
        p_precio_venta * p_cantidad
    );
    SET v_venta_id = LAST_INSERT_ID();

    -- DEVUELVE ID's DE FACTURA Y VENTA 
    SELECT v_factura_id AS factura_id, v_venta_id AS venta_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `elcuervopetshop`
--

USE `elcuervopetshop`;

--
-- Final view structure for view `vista_analisis_reclamos`
--

/*!50001 DROP VIEW IF EXISTS `vista_analisis_reclamos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_analisis_reclamos` AS select `postventa`.`tipo_de_reclamo` AS `tipo_de_reclamo`,`postventa`.`estado_del_reclamo` AS `estado_del_reclamo`,count(0) AS `total_reclamos`,round(((count(0) / (select count(0) from `postventa`)) * 100),2) AS `porcentajes_reclamos`,avg((to_days(`postventa`.`fecha_de_resolucion`) - to_days(`postventa`.`fecha_reclamo`))) AS `promedio_resolucion_tiempo` from `postventa` group by `postventa`.`tipo_de_reclamo`,`postventa`.`estado_del_reclamo` order by `total_reclamos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ingresos_por_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingresos_por_categoria` AS select `cp`.`categoria_de_producto` AS `categoria_de_producto`,sum(`v`.`total_venta`) AS `total_ingresos`,count(`v`.`id_venta`) AS `num_ventas`,avg(`v`.`total_venta`) AS `promedio_transaccion_valor` from (`ventas` `v` join `categoria_de_producto` `cp` on((`v`.`id_categoria_de_producto` = `cp`.`id_categoria_de_producto`))) group by `cp`.`categoria_de_producto` order by `total_ingresos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_mensual_crecimiento_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vista_mensual_crecimiento_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_mensual_crecimiento_ventas` AS with `ventas_mensuales` as (select year(`c`.`fecha_de_alta`) AS `year`,month(`c`.`fecha_de_alta`) AS `month`,sum(`v`.`total_venta`) AS `total_mensual_ventas` from (`ventas` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) group by year(`c`.`fecha_de_alta`),month(`c`.`fecha_de_alta`)) select `ventas_mensuales`.`year` AS `year`,`ventas_mensuales`.`month` AS `month`,`ventas_mensuales`.`total_mensual_ventas` AS `total_mensual_ventas`,lag(`ventas_mensuales`.`total_mensual_ventas`) OVER (ORDER BY `ventas_mensuales`.`year`,`ventas_mensuales`.`month` )  AS `previa_mensuales_ventas`,round((((`ventas_mensuales`.`total_mensual_ventas` - lag(`ventas_mensuales`.`total_mensual_ventas`) OVER (ORDER BY `ventas_mensuales`.`year`,`ventas_mensuales`.`month` ) ) / lag(`ventas_mensuales`.`total_mensual_ventas`) OVER (ORDER BY `ventas_mensuales`.`year`,`ventas_mensuales`.`month` ) ) * 100),2) AS `crecimiento_porcentual` from `ventas_mensuales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_performance_vendedor`
--

/*!50001 DROP VIEW IF EXISTS `vista_performance_vendedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_performance_vendedor` AS select `vd`.`nombre_vendedor` AS `nombre_vendedor`,`vd`.`estado_vendedor` AS `estado_vendedor`,`vd`.`cantidad_de_ventas` AS `cantidad_de_ventas`,sum(`v`.`total_venta`) AS `total_ventas`,round(avg(`v`.`total_venta`),2) AS `promedio_valor_ventas`,count(distinct `v`.`id_venta`) AS `num_ventas` from (`vendedor` `vd` join `ventas` `v` on((`vd`.`id_vendedor` = `v`.`id_vendedor`))) group by `vd`.`id_vendedor`,`vd`.`nombre_vendedor`,`vd`.`estado_vendedor` order by `total_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_retencion_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vista_retencion_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_retencion_cliente` AS select `c`.`estado` AS `estado_cliente`,count(distinct `c`.`id_cliente`) AS `total_clientes`,count(distinct `v`.`id_cliente`) AS `clientes_activos`,round(((count(distinct `v`.`id_cliente`) / count(distinct `c`.`id_cliente`)) * 100),2) AS `tasa_retencion` from (`cliente` `c` left join `ventas` `v` on((`c`.`id_cliente` = `v`.`id_cliente`))) group by `c`.`estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_rotacion_inventarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_rotacion_inventarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_rotacion_inventarios` AS select `p`.`nombre_producto` AS `nombre_producto`,`cp`.`categoria_de_producto` AS `categoria_de_producto`,`s`.`cantidad_stock` AS `stock_actual`,sum(`dv`.`cantidad`) AS `total_unidades_vendidas`,round((sum(`dv`.`cantidad`) / `s`.`cantidad_stock`),2) AS `tasa_rotacion` from (((`productos` `p` join `stock` `s` on((`p`.`id_producto` = `s`.`id_producto`))) join `categoria_de_producto` `cp` on((`p`.`id_categoria_de_producto` = `cp`.`id_categoria_de_producto`))) join `detalle_de_venta` `dv` on((`p`.`id_producto` = `dv`.`id_producto`))) group by `p`.`id_producto`,`p`.`nombre_producto`,`cp`.`categoria_de_producto`,`s`.`cantidad_stock` order by `tasa_rotacion` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-23 11:38:21
USE elcuervopetshop;

-- PRIMERA VISTA: Total de Ingresos por categoría
CREATE OR REPLACE VIEW vista_ingresos_por_categoria AS
SELECT 
    cp.categoria_de_producto,
    SUM(v.total_venta) AS total_ingresos,
    COUNT(v.id_venta) AS num_ventas,
    AVG(v.total_venta) AS promedio_transaccion_valor
FROM ventas v
JOIN categoria_de_producto cp ON v.id_categoria_de_producto = cp.id_categoria_de_producto
GROUP BY cp.categoria_de_producto
ORDER BY total_ingresos DESC;
-- _______________________________________________________________________________________________________________________________________________

-- SEGUNDA VISTA: Crecimiento de ventas mensuales
CREATE OR REPLACE VIEW vista_mensual_crecimiento_ventas AS
WITH ventas_mensuales AS (
    SELECT 
        YEAR(fecha_de_alta) AS year,
        MONTH(fecha_de_alta) AS month,
        SUM(total_venta) AS total_mensual_ventas
    FROM ventas v
    JOIN cliente c ON v.id_cliente = c.id_cliente
    GROUP BY YEAR(fecha_de_alta), MONTH(fecha_de_alta)
)
SELECT 
    year,
    month,
    total_mensual_ventas,
    LAG(total_mensual_ventas) OVER (ORDER BY year, month) AS previa_mensuales_ventas,
    ROUND(((total_mensual_ventas - LAG(total_mensual_ventas) OVER (ORDER BY year, month)) 
    / LAG(total_mensual_ventas) OVER (ORDER BY year, month)) * 100, 2) AS crecimiento_porcentual
FROM ventas_mensuales;

-- _______________________________________________________________________________________________________________________________________________
-- TERCERA VISTA: Análisis de Retención de Clientes
CREATE OR REPLACE VIEW vista_retencion_cliente AS
SELECT 
    c.estado AS estado_cliente,
    COUNT(DISTINCT c.id_cliente) AS total_clientes,
    COUNT(DISTINCT v.id_cliente) AS clientes_activos,
    ROUND(COUNT(DISTINCT v.id_cliente) / COUNT(DISTINCT c.id_cliente) * 100, 2) AS tasa_retencion
FROM cliente c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.estado;

-- _______________________________________________________________________________________________________________________________________________
-- CUARTA VISTA: Desempeño del proveedor
CREATE OR REPLACE VIEW vista_performance_vendedor AS
SELECT 
    vd.nombre_vendedor,
    vd.estado_vendedor,
    vd.cantidad_de_ventas,
    SUM(v.total_venta) AS total_ventas,
    ROUND(AVG(v.total_venta), 2) AS promedio_valor_ventas,
    COUNT(DISTINCT v.id_venta) AS num_ventas
FROM vendedor vd
JOIN ventas v ON vd.id_vendedor = v.id_vendedor
GROUP BY vd.id_vendedor, vd.nombre_vendedor, vd.estado_vendedor
ORDER BY total_ventas DESC;

-- _______________________________________________________________________________________________________________________________________________
-- QUINTA VISTA: Análisis de quejas
CREATE OR REPLACE VIEW vista_analisis_reclamos AS
SELECT 
    tipo_de_reclamo,
    estado_del_reclamo,
    COUNT(*) AS total_reclamos,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM postventa) * 100, 2) AS porcentajes_reclamos,
    AVG(DATEDIFF(fecha_de_resolucion, fecha_reclamo)) AS promedio_resolucion_tiempo
FROM postventa
GROUP BY tipo_de_reclamo, estado_del_reclamo
ORDER BY total_reclamos DESC;

-- _______________________________________________________________________________________________________________________________________________
-- SEXTA VISTA: Rotación de Inventarios
CREATE OR REPLACE VIEW vista_rotacion_inventarios AS
SELECT 
    p.nombre_producto,
    cp.categoria_de_producto,
    s.cantidad_stock AS stock_actual,
    SUM(dv.cantidad) AS total_unidades_vendidas,
    ROUND(SUM(dv.cantidad) / s.cantidad_stock, 2) AS tasa_rotacion
FROM productos p
JOIN stock s ON p.id_producto = s.id_producto
JOIN categoria_de_producto cp ON p.id_categoria_de_producto = cp.id_categoria_de_producto
JOIN detalle_de_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre_producto, cp.categoria_de_producto, s.cantidad_stock
ORDER BY tasa_rotacion DESC;USE elcuervopetshop;

-- PRIMERA FUNCIÓN: CORROBORAR LA DISPONIBILIDAD DE UN PRODUCTO

DELIMITER //

DROP FUNCTION IF EXISTS verificar_disponibilidad_producto //

CREATE FUNCTION verificar_disponibilidad_producto(
    producto_id INT,
    cantidad_deseada INT
) RETURNS VARCHAR(200)
    READS SQL DATA
BEGIN
    DECLARE stock_actual INT;

    -- Obtiene el stock actual del producto (asegurándose de que solo devuelva una fila)
    SELECT cantidad_stock INTO stock_actual
    FROM stock
    WHERE id_producto = producto_id
    LIMIT 1;  

    -- Verifica si hay suficiente stock
    IF stock_actual >= cantidad_deseada THEN
        RETURN 'Stock disponible';
    ELSE
        RETURN CONCAT('Stock insuficiente: Solo hay ', stock_actual, ' unidades disponibles.');
    END IF;
END//

DELIMITER ;


-- Llamar a la función para probar
SELECT verificar_disponibilidad_producto(1, 10);

SELECT id_producto, COUNT(*) 
FROM stock
GROUP BY id_producto
HAVING COUNT(*) > 1;

-- ________________________________________________________________________________________________________________________________________________________________

-- SEGUNDA FUNCIÓN: TIEMPO PROMEDIO DE RESOLUCIÓN DE RECLAMOS

DELIMITER //

DROP FUNCTION IF EXISTS tiempo_promedio_resolucion_reclamos //

CREATE FUNCTION tiempo_promedio_resolucion_reclamos()
RETURNS DECIMAL(10, 2)
    READS SQL DATA
BEGIN
    DECLARE promedio_resolucion DECIMAL(10, 2);

    SELECT AVG(DATEDIFF(fecha_de_resolucion, fecha_reclamo))
    INTO promedio_resolucion
    FROM postventa
    WHERE estado_del_reclamo = 'RESUELTO';

    RETURN promedio_resolucion;
END//

DELIMITER ;

-- Llamar a la función para probar
SELECT tiempo_promedio_resolucion_reclamos();

-- ________________________________________________________________________________________________________________________________________________________________

-- TERCERA FUNCIÓN: TASA DE RETENCIÓN DEL CLIENTE

DELIMITER //

DROP FUNCTION IF EXISTS calcular_tasa_retencion_clientes //

CREATE FUNCTION calcular_tasa_retencion_clientes()
RETURNS DECIMAL(10, 2)
    READS SQL DATA
BEGIN
    DECLARE total_clientes INT;
    DECLARE clientes_activos INT;

    -- Calcula el total de clientes
    SELECT COUNT(*) INTO total_clientes
    FROM cliente;

    -- Calcula los clientes que tienen ventas asociadas (clientes activos)
    SELECT COUNT(DISTINCT id_cliente) INTO clientes_activos
    FROM ventas;

    -- Retorna el porcentaje de clientes activos
    RETURN ROUND((clientes_activos / total_clientes) * 100, 2);
END//

DELIMITER ;

-- Llamar a la función para probar
SELECT calcular_tasa_retencion_clientes();


-- ________________________________________________________________________________________________________________________________________________________________

-- CUARTA FUNCIÓN: VENDEDOR CON MAYOR CANTIDAD DE VENTAS EJECUTADAS


DELIMITER //

DROP FUNCTION IF EXISTS vendedor_top_ventas //

CREATE FUNCTION vendedor_top_ventas()
RETURNS VARCHAR(200)
    READS SQL DATA
BEGIN
    DECLARE nombre_vendedor_top VARCHAR(200);

    -- Busca el vendedor con más ventas
    SELECT nombre_vendedor
    INTO nombre_vendedor_top
    FROM vendedor
    ORDER BY cantidad_de_ventas DESC
    LIMIT 1;

    RETURN nombre_vendedor_top;
END//

DELIMITER ;

-- Llamar a la función para probar
SELECT vendedor_top_ventas();
USE elcuervopetshop;

-- PRIMER PROCEDIMIENTO: INSERTAR UN NUEVO PRODUCTO
DELIMITER //
DROP PROCEDURE IF EXISTS elcuervopetshop.InsertarProducto //
CREATE PROCEDURE elcuervopetshop.InsertarProducto(
    IN p_id_factura_compra INT,
    IN p_id_categoria INT,
    IN p_nombre_producto VARCHAR(200),
    IN p_precio DECIMAL(10,2),
    IN p_cantidad INT
)
BEGIN
    INSERT INTO productos (
        id_numero_de_factura_de_compra, 
        id_categoria_de_producto, 
        nombre_producto, 
        precio, 
        cantidad
    ) VALUES (
        p_id_factura_compra, 
        p_id_categoria, 
        p_nombre_producto, 
        p_precio, 
        p_cantidad
    );
    SELECT LAST_INSERT_ID() AS nuevo_producto_id;
END //
DELIMITER ;
-- ______________________________________________________________________________________________________________________________________________________

-- SEGUNDO PROCEDIMIENTO: REGISTRAR UNA NUEVA VENTA
DELIMITER //
DROP PROCEDURE IF EXISTS elcuervopetshop.RegistrarVenta //
CREATE PROCEDURE RegistrarVenta(
    IN p_id_cliente INT,
    IN p_id_vendedor INT,
    IN p_id_categoria INT,
    IN p_nombre_cliente VARCHAR(200),
    IN p_precio_venta DECIMAL(10,2),
    IN p_cantidad INT
)
BEGIN
    DECLARE v_factura_id INT;
    DECLARE v_venta_id INT;

    -- INSERTA DATOS DE LA FACTURA DE VENTA
    INSERT INTO facturas_de_venta (
        nombre_cliente, 
        detalle, 
        monto_bruto, 
        impuestos, 
        monto_neto
    ) VALUES (
        p_nombre_cliente, 
        'Venta de productos', 
        p_precio_venta * p_cantidad, 
        p_precio_venta * p_cantidad * 0.21, 
        p_precio_venta * p_cantidad * 1.21
    );
    SET v_factura_id = LAST_INSERT_ID();

    -- INSERTA LA VENTA
    INSERT INTO ventas (
        id_cliente, 
        id_vendedor, 
        id_categoria_de_producto, 
        id_num_factura_venta, 
        nombre_cliente, 
        precio_venta, 
        cantidad, 
        total_venta
    ) VALUES (
        p_id_cliente, 
        p_id_vendedor, 
        p_id_categoria, 
        v_factura_id, 
        p_nombre_cliente, 
        p_precio_venta, 
        p_cantidad, 
        p_precio_venta * p_cantidad
    );
    SET v_venta_id = LAST_INSERT_ID();

    -- DEVUELVE ID's DE FACTURA Y VENTA 
    SELECT v_factura_id AS factura_id, v_venta_id AS venta_id;
END //
DELIMITER ;

-- ______________________________________________________________________________________________________________________________________________________
-- TERCER PROCEDIMIENTO: REGISTRAR UN RECLAMO POSTVENTA
DELIMITER //

DROP PROCEDURE IF EXISTS elcuervopetshop.RegistrarReclamo //
CREATE PROCEDURE elcuervopetshop.RegistrarReclamo(
    IN p_id_venta INT,
    IN p_nombre_cliente VARCHAR(200),
    IN p_tipo_reclamo ENUM('PRODUCTO DEFECTUOSO', 'RETRASO EN ENTREGA', 'ERROR DE FACTURACION', 'EXPECTATIVA NO SATISFECHA'),
    IN p_prioridad ENUM('ALTA', 'MEDIA', 'BAJA'),
    IN p_respuesta VARCHAR(200)
)
BEGIN
    INSERT INTO postventa (
        id_venta, 
        nombre_cliente, 
        tipo_de_reclamo, 
        estado_del_reclamo, 
        prioridad, 
        respuesta
    ) VALUES (
        p_id_venta, 
        p_nombre_cliente, 
        p_tipo_reclamo, 
        'EN PROGRESO', 
        p_prioridad, 
        p_respuesta
    );
    SELECT LAST_INSERT_ID() AS nuevo_reclamo_id;
END //

DELIMITER ;

-- ACTUALIZA EL STOCK DE PRODUCTO
DELIMITER //

DROP PROCEDURE IF EXISTS elcuervopetshop.ActualizarStock //
CREATE PROCEDURE elcuervopetshop.ActualizarStock(
    IN p_id_producto INT,
    IN p_id_centro_almacenamiento INT,
    IN p_cantidad INT
)
BEGIN
    -- ACTUALIZA EL STOCK DE PRODUCTO EXISTENTE O NUEVO REGISTRO
    INSERT INTO stock (
        id_producto, 
        id_centro_de_almacenamiento, 
        cantidad_stock
    ) VALUES (
        p_id_producto, 
        p_id_centro_almacenamiento, 
        p_cantidad
    ) ON DUPLICATE KEY UPDATE 
    cantidad_stock = cantidad_stock + p_cantidad;

    -- ACTUALIZAR TABLA DE PRODUCTOS
    UPDATE productos 
    SET cantidad = cantidad + p_cantidad 
    WHERE id_producto = p_id_producto;
END //

DELIMITER ;


-- _____________________________________________________________________________________________________________________________________________________

-- CUARTO PROCEDIMIENTO: OBTENER VENTAS POR VENDEDOR CON FILTROS
DELIMITER //

DROP PROCEDURE IF EXISTS elcuervopetshop.ObtenerDetallesVentaConVendedoresFiltrados //

CREATE PROCEDURE ObtenerDetallesVentaConVendedoresFiltrados(
    IN p_tipo_venta VARCHAR(10),
    IN p_estado_vendedor VARCHAR(10),
    IN p_min_cantidad INT,
    IN p_max_cantidad INT
)
BEGIN
    -- Asigna valores predeterminados si son NULL
    IF p_min_cantidad IS NULL THEN
        SET p_min_cantidad = 0;
    END IF;
    IF p_max_cantidad IS NULL THEN
        SET p_max_cantidad = 1000000;
    END IF;

    SELECT 
        dv.id_detalle_de_venta,
        dv.id_venta,
        dv.id_producto,
        dv.id_num_factura_venta,
        dv.cantidad AS cantidad_vendida,
        dv.precio AS precio_venta,
        dv.descuento,
        dv.subtotal,
        dv.tipo_venta,
        dv.nombre_cliente,
        v.id_vendedor,
        v.nombre_vendedor,
        v.cantidad_de_ventas,
        v.estado_vendedor
    FROM 
        detalle_de_venta dv
    LEFT JOIN 
        ventas ve ON dv.id_venta = ve.id_venta
    LEFT JOIN 
        vendedor v ON ve.id_vendedor = v.id_vendedor
    WHERE 
        (p_tipo_venta IS NULL OR dv.tipo_venta = p_tipo_venta)
        AND (p_estado_vendedor IS NULL OR v.estado_vendedor = p_estado_vendedor)
        AND dv.cantidad BETWEEN p_min_cantidad AND p_max_cantidad
    ORDER BY 
        dv.id_detalle_de_venta;
END //

DELIMITER ;USE elcuervopetshop;

-- ___________________________________________________________________________________________________________________________________________________
-- PRIMER TRIGGER: OBJETIVO - ACTUALIZAR LA CANTIDAD DE VENTAS DE UN VENDEDOR DESPUÉS DE CADA VENTA.
DELIMITER //
CREATE TRIGGER actualizar_cantidad_postventa
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    UPDATE vendedor 
    SET cantidad_de_ventas = cantidad_de_ventas + 1
    WHERE id_vendedor = NEW.id_vendedor;
END //
DELIMITER ;

-- ___________________________________________________________________________________________________________________________________________________

-- SEGUNDO TRIGGER: OBJETIVO - ACTUALIZAR STOCK DE PRODUCTOS DESPÚES DE CADA VENTA 
DELIMITER //
CREATE TRIGGER actualizar_stock_postventa
AFTER INSERT ON detalle_de_venta
FOR EACH ROW
BEGIN
    -- Reducir la cantidad de productos en la tabla productos
    UPDATE productos 
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = NEW.id_producto;

    -- Reducir la cantidad de stock en la tabla stock
    UPDATE stock 
    SET cantidad_stock = cantidad_stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- ___________________________________________________________________________________________________________________________________________________

-- TERCER TRIGGER: OBJETIVO - MANEJO DE RECLAMOS Y ACTUALIZACIÓN CONTADOR DE RECLAMOS DEL CLIENTE
DELIMITER //

CREATE TRIGGER actualizar_stock_devolucion
AFTER INSERT ON postventa
FOR EACH ROW
BEGIN
    -- Variable para almacenar el ID del cliente
    DECLARE v_cliente_id INT;

    -- Obtener el ID del cliente a partir de la venta
    SELECT id_cliente INTO v_cliente_id
    FROM ventas
    WHERE id_venta = NEW.id_venta;

    -- Actualizar estado del cliente si tiene muchos reclamos
    IF (SELECT COUNT(*) 
        FROM postventa 
        WHERE id_venta IN (SELECT id_venta FROM ventas WHERE id_cliente = v_cliente_id)) > 3 THEN
        UPDATE cliente
        SET estado = 'DEUDOR'
        WHERE id_cliente = v_cliente_id;
    END IF;
END //

DELIMITER ;
USE elcuervopetshop;


DROP USER IF EXISTS 
'usuario_uri'@'%',
'usuario_gero'@'%',
'usuario_dani'@'%';


-- Usuario para área de compras (usuario 1)
CREATE USER 'usuario_uri'@'%' IDENTIFIED BY 'pass_123!';
GRANT SELECT ON elcuervopetshop.vista_rotacion_inventarios TO 'usuario_uri'@'%';
GRANT SELECT ON elcuervopetshop.vista_mensual_crecimiento_ventas TO 'usuario_uri'@'%';

-- Usuario para área de ventas (usuario 2)
CREATE USER 'usuario_gero'@'%' IDENTIFIED BY 'pass_123!';
GRANT SELECT ON elcuervopetshop.* TO 'usuario_gero'@'%';

-- Usuario para área de postventa (usuario 3)
CREATE USER 'usuario_dani'@'%' IDENTIFIED BY 'pass_123!';
GRANT ALL PRIVILEGES ON elcuervopetshop.* TO 'usuario_dani'@'%';

FLUSH PRIVILEGES;

SELECT * FROM mysql.user;
USE elcuervopetshop;

-- __________________________________________________________________________________________________________
-- PRIMER PROCEDIMIENTO TCL -- REGISTRAR UN NUEVO PROGRAMA DE FIDELIZACIÓN
DELIMITER //

CREATE PROCEDURE RegistrarProgramaFidelidad (
    IN p_id_cliente INT,
    IN p_puntos INT,
    IN p_nivel_fidelidad ENUM('ALTO', 'MEDIO', 'BAJO')
)
BEGIN
    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- INSERTAR UN NUEVO CLIENTE AL PROGRAMA DE FIDELIZACIÓN
    INSERT INTO programas_de_fidelidad (id_cliente, puntos_acumulados, nivel_fidelidad)
    VALUES (p_id_cliente, p_puntos, p_nivel_fidelidad);

    -- HACER PERMANENTE LA TRANSACCIÓN
    COMMIT;
    
END //

DELIMITER ;


-- __________________________________________________________________________________________________________
-- SEGUNDO PROCEDIMIENTO TCL -- ACTUALIZAR EL PRECIO DE UN PRODUCTO

DELIMITER //

CREATE PROCEDURE ActualizarPrecioProducto (
    IN p_id_producto INT,
    IN p_precio_nuevo DECIMAL(10, 2)
)
BEGIN
    -- DECLARACIÓN DE VARIABLES
    DECLARE v_existente INT;

    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- CHEQUEO DE LA EXISTENCIA DEL PRODUCTO
    SELECT COUNT(*) INTO v_existente FROM productos WHERE id_producto = p_id_producto;

    -- SI EL PRODUCTO NO EXISTE, HACER ROLLBACK
    IF v_existente = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe';
    ELSE
        -- SI EL PRODUCTO EXISTE, ACTUALIZAR EL PRECIO
        UPDATE productos
        SET precio = p_precio_nuevo
        WHERE id_producto = p_id_producto;

        -- HACER PERMANENTE LA TRANSACCIÓN
        COMMIT;
    END IF;
    
END //

DELIMITER ;


-- __________________________________________________________________________________________________________
-- TERCER PROCEDIMIENTO TCL -- REGISTRAR UNA PROMOCIÓN
DELIMITER //

CREATE PROCEDURE RegistrarPromocion (
    IN p_nombre_promocion VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_fecha_inicio DATETIME,
    IN p_fecha_fin DATETIME,
    IN p_descuento DECIMAL(5, 2)
)
BEGIN
    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- SAVEPOINT
    SAVEPOINT antes_promocion;

    -- INSERTAR LA NUEVA PROMOCIÓN
    INSERT INTO promociones (nombre_promocion, descripcion, fecha_inicio, fecha_fin, porcentaje_descuento)
    VALUES (p_nombre_promocion, p_descripcion, p_fecha_inicio, p_fecha_fin, p_descuento);

    -- HACER PERMANENTE LA TRANSACCIÓN
    COMMIT;

END //

DELIMITER ;

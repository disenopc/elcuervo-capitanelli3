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
INSERT INTO `postventa` VALUES (1,1,'Roberto Sanchez','2024-12-21 14:55:48','PRODUCTO DEFECTUOSO','RESUELTO','BAJA',1,'Se realizÃ³ cambio del producto','2024-12-21 14:55:48'),(2,2,'Carolina Lopez','2024-12-21 14:55:48','RETRASO EN ENTREGA','EN PROGRESO','MEDIA',2,'Investigando el motivo del retraso','2024-12-21 14:55:48'),(3,3,'Miguel Torres','2024-12-21 14:55:48','ERROR DE FACTURACION','EN ESPERA','ALTA',3,'Pendiente de revisiÃ³n contable','2024-12-21 14:55:48'),(4,4,'Sofia Ramirez','2024-12-21 14:55:48','EXPECTATIVA NO SATISFECHA','RESUELTO','BAJA',1,'Se ofreciÃ³ explicaciÃ³n y soluciÃ³n','2024-12-21 14:55:48'),(5,5,'Daniel Morales','2024-12-21 14:55:48','PRODUCTO DEFECTUOSO','EN PROGRESO','MEDIA',2,'Evaluando condiciÃ³n del producto','2024-12-21 14:55:48');
/*!40000 ALTER TABLE `postventa` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-21 15:18:21

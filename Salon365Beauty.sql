-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: salonprueba
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `idAdministradores` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned DEFAULT NULL,
  `primerNombre` varchar(45) DEFAULT NULL,
  `segundoNombre` varchar(45) DEFAULT NULL,
  `primerApellido` varchar(45) DEFAULT NULL,
  `segundoApellido` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idAdministradores`),
  UNIQUE KEY `idadministradores_UNIQUE` (`idAdministradores`),
  KEY `fk_id_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (5,57,'Angel','Edgardo','Ordoñez','Ordoñez','000000000','Choluteca','aeordonezo@unah.hn','32378189','Masculino','1998-11-05','angel','angel'),(6,58,'Administrador','Administrador','Oficial','Oficial','01010101','Kennedy','360beauty@hotmail.com','2279856','Femenino','2021-11-23','admin','admin');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities_users`
--

DROP TABLE IF EXISTS `authorities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities_users` (
  `usuario_id` int unsigned NOT NULL,
  `authority_id` int unsigned NOT NULL,
  KEY `fk_authuser_user_idx` (`usuario_id`),
  KEY `fk_authuser_authority_idx` (`authority_id`),
  CONSTRAINT `fk_authuser_authority` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`idauthority`),
  CONSTRAINT `fk_authuser_user` FOREIGN KEY (`usuario_id`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities_users`
--

LOCK TABLES `authorities_users` WRITE;
/*!40000 ALTER TABLE `authorities_users` DISABLE KEYS */;
INSERT INTO `authorities_users` VALUES (18,2),(21,1),(22,2),(23,2),(26,1),(28,2),(29,1),(30,2),(31,1),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,1),(58,1),(59,2);
/*!40000 ALTER TABLE `authorities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `idauthority` int unsigned NOT NULL AUTO_INCREMENT,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`idauthority`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `idCajas` int unsigned NOT NULL AUTO_INCREMENT,
  `puntoEmision` varchar(5) DEFAULT NULL,
  `cEmpleado` int unsigned NOT NULL,
  `cSucursal` int unsigned NOT NULL,
  PRIMARY KEY (`idCajas`),
  UNIQUE KEY `idCajas_UNIQUE` (`idCajas`),
  KEY `fk_cajas_empleado_idx` (`cEmpleado`),
  KEY `fk_cajas_sucursal_idx` (`cSucursal`),
  CONSTRAINT `fk_cajas_empleado` FOREIGN KEY (`cEmpleado`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `fk_cajas_sucursal` FOREIGN KEY (`cSucursal`) REFERENCES `sucursal` (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,'001',9,1);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategorias` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Servicio para Manos y Pies'),(2,'Servicio de Depilacion'),(3,'Servicio para Cabello'),(4,'Tratamientos para el Cabello'),(5,'Maquillaje');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `idCita` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `ci_hora` int unsigned NOT NULL,
  `ci_empleado` int unsigned DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCita`),
  UNIQUE KEY `idCita_UNIQUE` (`idCita`),
  KEY `fk_c_hora_idx` (`ci_hora`),
  KEY `fk_ci_empleado_idx` (`ci_empleado`),
  CONSTRAINT `fk_ci_empleado` FOREIGN KEY (`ci_empleado`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `fk_ci_hora` FOREIGN KEY (`ci_hora`) REFERENCES `horas` (`idHora`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (16,'2021-12-07',1,5,'Alan David','+3255411558','');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas_facturadas`
--

DROP TABLE IF EXISTS `citas_facturadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas_facturadas` (
  `idcitas_facturadas` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `empleado` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `servicio` varchar(45) DEFAULT NULL,
  `fechaEmision` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcitas_facturadas`),
  UNIQUE KEY `idcitas_facturadas_UNIQUE` (`idcitas_facturadas`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas_facturadas`
--

LOCK TABLES `citas_facturadas` WRITE;
/*!40000 ALTER TABLE `citas_facturadas` DISABLE KEYS */;
INSERT INTO `citas_facturadas` VALUES (9,'2021-12-07','9:00 AM','Sara Isabel Domienguez Cardona','Angel Ordoñez','0000-0001','','Esmaltado permanente','2021/diciembre/07 11:32:45'),(10,'2021-12-08','9:00 AM','Sara Isabel Domienguez Cardona','Sofia Videa','0000-0002','Posiblemas llegue tarde','Pedicure','2021/diciembre/07 13:44:48'),(11,'2021-12-08','5:00 PM','Alan Manuel David Romero','Dariel Sabillon','+3255411558','','Manicure','2021/diciembre/07 13:48:04');
/*!40000 ALTER TABLE `citas_facturadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas_servicios`
--

DROP TABLE IF EXISTS `citas_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas_servicios` (
  `cs_cita` int unsigned NOT NULL,
  `cs_servicio` int unsigned NOT NULL,
  KEY `fk_cs_cita_idx` (`cs_cita`),
  KEY `fk_cs_servicio_idx` (`cs_servicio`),
  CONSTRAINT `fk_cs_cita` FOREIGN KEY (`cs_cita`) REFERENCES `citas` (`idCita`),
  CONSTRAINT `fk_cs_servicio` FOREIGN KEY (`cs_servicio`) REFERENCES `servicios` (`idServicios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas_servicios`
--

LOCK TABLES `citas_servicios` WRITE;
/*!40000 ALTER TABLE `citas_servicios` DISABLE KEYS */;
INSERT INTO `citas_servicios` VALUES (16,2);
/*!40000 ALTER TABLE `citas_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int unsigned DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `username` varchar(65) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idclientes_UNIQUE` (`idCliente`),
  KEY `fk_id_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,39,'Angel Edgardo Ordoñez','aeordonezo@unah.hn',NULL,'skratos','skratos'),(3,40,'Irma Valladarez','irma@unah.hn',NULL,'irma','irma'),(4,41,'josue','josue@yahoo.com',NULL,'josue','josue'),(7,50,'Maria Aurora Vadallades','mariaAurora@unah.hn',NULL,'mariaAurora','MariaAurora'),(13,56,'Usuario de prueba','usuarioPrueba@unah.hn',NULL,'usuario','usuario');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlproductos`
--

DROP TABLE IF EXISTS `controlproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlproductos` (
  `idcontrolProductos` int unsigned NOT NULL AUTO_INCREMENT,
  `c_servicio` int unsigned NOT NULL,
  `c_producto` int unsigned NOT NULL,
  `cantidad` double NOT NULL,
  `c_unidad` int unsigned NOT NULL,
  PRIMARY KEY (`idcontrolProductos`),
  UNIQUE KEY `idcontrolProductos_UNIQUE` (`idcontrolProductos`),
  KEY `c_fk_servicio_idx` (`c_servicio`),
  KEY `c_fk_producto_idx` (`c_producto`),
  KEY `c_fk_unidad_idx` (`c_unidad`),
  CONSTRAINT `c_fk_producto` FOREIGN KEY (`c_producto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `c_fk_servicio` FOREIGN KEY (`c_servicio`) REFERENCES `servicios` (`idServicios`),
  CONSTRAINT `c_fk_unidad` FOREIGN KEY (`c_unidad`) REFERENCES `unidades` (`idUnidades`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlproductos`
--

LOCK TABLES `controlproductos` WRITE;
/*!40000 ALTER TABLE `controlproductos` DISABLE KEYS */;
INSERT INTO `controlproductos` VALUES (3,2,29,4,5),(4,4,7,2,7),(5,2,17,3.5,5),(6,4,14,5,4);
/*!40000 ALTER TABLE `controlproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `idDetalle_factura` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(60) DEFAULT NULL,
  `rtn_cliente` varchar(45) DEFAULT NULL,
  `df_producto` int unsigned DEFAULT NULL,
  `df_servicio` int unsigned DEFAULT NULL,
  `_cita` varchar(45) DEFAULT NULL,
  `servicios` varchar(200) DEFAULT NULL,
  `productos` varchar(200) DEFAULT NULL,
  `precioServicio` double DEFAULT NULL,
  `precioMasServicios` double DEFAULT NULL,
  `precioProducto` double DEFAULT NULL,
  `precioMasProductos` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`idDetalle_factura`),
  UNIQUE KEY `idDetalle_factura_UNIQUE` (`idDetalle_factura`),
  KEY `fk_df_servicio_idx` (`df_servicio`),
  KEY `fk_df_producto_idx` (`df_producto`),
  CONSTRAINT `fk_df_producto` FOREIGN KEY (`df_producto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_df_servicio` FOREIGN KEY (`df_servicio`) REFERENCES `servicios` (`idServicios`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (5,'Bruno Fernandez','00021151100',1,1,NULL,'Corte de cabello, Pintado de uñas','',11,6,NULL,NULL,0,85),(6,'Sara Dominguez','01250',1,1,NULL,'Corte de cabello, Pintado de uñas','',12,58,NULL,NULL,0,100),(7,'Luis Golez','00021151100',1,1,NULL,'Corte de cabello','',300,85,0,0,0,385),(8,'Angel Ordoñez','00021151100',7,2,NULL,'','',400,0,55,0,0,455),(9,'Angel Ordoñez','00021151100',1,4,NULL,'','',250,0,80,0,0,330),(10,'Luis Golez','00021151100',1,1,NULL,'Corte de cabello','',300,109,80,0,52,489),(11,'Leonel Messi','00021151100',1,1,NULL,'','',300,0,80,0,0,380),(12,'Leonel Messi','00021151100',1,1,NULL,'Corte de cabello, Pintado de uñas','',300,52,80,0,52,432),(13,'Juan Robando','00000',1,1,NULL,'nada','nada',300,0,80,0,0,380),(14,'Sara Dominguez','CITA',1,1,'4','Corte de cabello, Pintado de uñas','',0,988.2,0,0,52.3,988.2),(15,'Deybi Ordonez CITA','00000',1,1,'12','nada','nada',0,85.9,0,0,5.3,85.9),(16,'Randy','01250',1,1,'4 Angel Ordoñez','Corte de cabello, Pintado de uñas','',0,985.25,0,0,25,985.25),(17,'Paul Pogba','00021151100',1,1,'12 Angel Ordoñez','Corte de cabello, Pintado de uñas','',0,98.5,0,0,0,98.5),(18,'Sofia Videa','CITA',1,1,'14 Sofia Videa','Corte de cabello','',0,985.2,0,0,52,985.2),(19,'Dariel Sabillon','CITA',1,1,'15 Dariel Sabillon','Corte de cabello, Pintado de uñas','',0,1089,0,0,400,1089);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleados` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(80) DEFAULT NULL,
  `identidad` varchar(45) DEFAULT NULL,
  `tipoContrato` varchar(45) DEFAULT NULL,
  `salario` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fechaIncorporacion` date DEFAULT NULL,
  `puesto` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `ruta_foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idEmpleados`),
  UNIQUE KEY `idEmpleados_UNIQUE` (`idEmpleados`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Sara Isabel Domienguez Cardona','0801-1975-000001','Permanente','38,000','99-56-85-10','2020-01-03','Estilista','Ingenieria en Sistemas - 20161005072','empleado 3.jpg'),(3,'Gina Nicol Discua Quiroz','0801-1999-004568','Por horas','7,000.00','88-99-66-44','2021-11-19','Estilista','Ingenieria en Sistemas - 20181005768','empleado 4.jpg'),(5,'Dariel Alexander Funez Guillen','0601-5555-9888','Permanente','45,000','99-88-55-66','2021-11-20','Estilista','Ingeniero en sistemas - 20161900277','empleado Driel.jpg'),(9,'Alan Manuel David Romero','0501-9998-99666','Por horas','7,000.00','3625-9651','2021-11-25','Estilista','Ingeniero en Sitemas - 20161900042','empleado 5.jpg');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_servicios`
--

DROP TABLE IF EXISTS `empleados_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_servicios` (
  `servicio_id` int unsigned NOT NULL,
  `empleado_id` int unsigned NOT NULL,
  KEY `fk_se_servicio_idx` (`servicio_id`),
  KEY `fk_se_empleado` (`empleado_id`),
  CONSTRAINT `fk_se_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`idEmpleados`),
  CONSTRAINT `fk_se_servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`idServicios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_servicios`
--

LOCK TABLES `empleados_servicios` WRITE;
/*!40000 ALTER TABLE `empleados_servicios` DISABLE KEYS */;
INSERT INTO `empleados_servicios` VALUES (1,9),(1,5),(1,3),(1,1),(2,3),(2,1),(4,9),(4,5),(4,3);
/*!40000 ALTER TABLE `empleados_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int unsigned NOT NULL AUTO_INCREMENT,
  `fechaEmision` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `numeroFactura` varchar(100) DEFAULT NULL,
  `rango` varchar(100) DEFAULT NULL,
  `f_DetalleFactura` int unsigned DEFAULT NULL,
  `importe_exonerado` double DEFAULT NULL,
  `importe_exento` double DEFAULT NULL,
  `importe_gravado` double DEFAULT NULL,
  `monto1` double DEFAULT NULL,
  `monto2` double DEFAULT NULL,
  `monto3` double DEFAULT NULL,
  `monto4` double DEFAULT NULL,
  `isv15` double DEFAULT NULL,
  `isv18` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total_pagar` double DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  UNIQUE KEY `idfactura_UNIQUE` (`idfactura`),
  KEY `fk_f_detalleFactura_idx` (`f_DetalleFactura`),
  CONSTRAINT `fk_f_detalleFactura` FOREIGN KEY (`f_DetalleFactura`) REFERENCES `detalle_factura` (`idDetalle_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (10,'2021/diciembre/07 00:28:40','365beautysalon@gmail.com','Ave. Juan Lindo, No. 501, diagonal al redondel de Colonia Las Minitas, Tegucigalpa 11101','001-001-01-00000018','001-001-01-00000000 AL 001-001-01-00015000',14,0,0,0,0,0,988.2,0,148.23,0,988.2,1084.13),(11,'2021/diciembre/07 00:35:43','365beautysalon@gmail.com','Ave. Juan Lindo, No. 501, diagonal al redondel de Colonia Las Minitas, Tegucigalpa 11101','001-001-01-00000019','001-001-01-00000000 AL 001-001-01-00015000',15,0,0,0,0,0,85.9,0,12.885,0,85.9,93.48500000000001),(12,'2021/diciembre/07 11:05:13','365beautysalon@gmail.com','Ave. Juan Lindo, No. 501, diagonal al redondel de Colonia Las Minitas, Tegucigalpa 11101','001-001-01-00000020','001-001-01-00000000 AL 001-001-01-00015000',16,0,0,0,0,0,985.25,0,147.7875,0,985.25,1108.0375),(13,'2021/diciembre/07 11:32:45','365beautysalon@gmail.com','Ave. Juan Lindo, No. 501, diagonal al redondel de Colonia Las Minitas, Tegucigalpa 11101','001-001-01-00000021','001-001-01-00000000 AL 001-001-01-00015000',17,0,0,0,0,0,98.5,0,14.774999999999999,0,98.5,113.275),(14,'2021/diciembre/07 13:44:48','365beautysalon@gmail.com','Ave. Juan Lindo, No. 501, diagonal al redondel de Colonia Las Minitas, Tegucigalpa 11101','001-001-01-00000022','001-001-01-00000000 AL 001-001-01-00015000',18,0,0,0,0,0,985.2,0,147.78,0,985.2,1080.98),(15,'2021/diciembre/07 13:48:04','365beautysalon@gmail.com','Ave. Juan Lindo, No. 501, diagonal al redondel de Colonia Las Minitas, Tegucigalpa 11101','001-001-01-00000023','001-001-01-00000000 AL 001-001-01-00015000',19,0,0,0,0,0,1089,0,163.35,0,1089,852.3499999999999);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herramientas`
--

DROP TABLE IF EXISTS `herramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `herramientas` (
  `idherramientas` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_herramienta` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `cantidad_existente` int DEFAULT NULL,
  `precioCompra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idherramientas`),
  UNIQUE KEY `idherramientas_UNIQUE` (`idherramientas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herramientas`
--

LOCK TABLES `herramientas` WRITE;
/*!40000 ALTER TABLE `herramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `herramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas`
--

DROP TABLE IF EXISTS `horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horas` (
  `idHora` int unsigned NOT NULL AUTO_INCREMENT,
  `hora` varchar(10) NOT NULL,
  PRIMARY KEY (`idHora`),
  UNIQUE KEY `idHora_UNIQUE` (`idHora`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas`
--

LOCK TABLES `horas` WRITE;
/*!40000 ALTER TABLE `horas` DISABLE KEYS */;
INSERT INTO `horas` VALUES (1,'9:00 AM'),(2,'9:30 AM'),(3,'10:00 AM'),(4,'10:30 AM'),(5,'11:00 AM'),(6,'11:30 AM'),(7,'12:00 PM'),(8,'12:30 PM'),(9,'1:00 PM'),(10,'1:30 PM'),(11,'2:00 PM'),(12,'2:30 PM'),(13,'3:00 PM'),(14,'3:30 PM'),(15,'4:00 PM'),(16,'4:30 PM'),(17,'5:00 PM'),(18,'5:30 PM');
/*!40000 ALTER TABLE `horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarioproductos`
--

DROP TABLE IF EXISTS `inventarioproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarioproductos` (
  `idInventarioProductos` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `idProduct` int unsigned NOT NULL,
  `precioCompra` double DEFAULT NULL,
  `cantidadExistencia` int DEFAULT NULL,
  `observacion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idInventarioProductos`),
  UNIQUE KEY `idinventarioProductos_UNIQUE` (`idInventarioProductos`),
  KEY `fk_ip_producto_idx` (`idProduct`),
  CONSTRAINT `fk_ip_producto` FOREIGN KEY (`idProduct`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarioproductos`
--

LOCK TABLES `inventarioproductos` WRITE;
/*!40000 ALTER TABLE `inventarioproductos` DISABLE KEYS */;
INSERT INTO `inventarioproductos` VALUES (1,'2vr932635',7,25.6,100,'Se compraron nuevos productos'),(2,'1lhjz5728',30,999,109,'Aun sin ventas para este producto');
/*!40000 ALTER TABLE `inventarioproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerofactura`
--

DROP TABLE IF EXISTS `numerofactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numerofactura` (
  `idnumeroFactura` int unsigned NOT NULL AUTO_INCREMENT,
  `establecimiento` varchar(45) DEFAULT NULL,
  `puntoEmision` varchar(45) DEFAULT NULL,
  `tipoDocumento` varchar(45) DEFAULT NULL,
  `numeroColerrativa` int DEFAULT NULL,
  `numeroFactura` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idnumeroFactura`),
  UNIQUE KEY `idnumeroFactura_UNIQUE` (`idnumeroFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerofactura`
--

LOCK TABLES `numerofactura` WRITE;
/*!40000 ALTER TABLE `numerofactura` DISABLE KEYS */;
INSERT INTO `numerofactura` VALUES (13,'001','001','01',14,'001-001-01-00000014'),(14,'001','001','01',15,'001-001-01-00000015'),(15,'001','001','01',16,'001-001-01-00000016'),(16,'001','001','01',17,'001-001-01-00000017'),(17,'001','001','01',18,'001-001-01-00000018'),(18,'001','001','01',19,'001-001-01-00000019'),(19,'001','001','01',20,'001-001-01-00000020'),(20,'001','001','01',21,'001-001-01-00000021'),(21,'001','001','01',22,'001-001-01-00000022'),(22,'001','001','01',23,'001-001-01-00000023');
/*!40000 ALTER TABLE `numerofactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idpersona` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `username` varchar(65) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `primerNombre` varchar(45) DEFAULT NULL,
  `segundoNombre` varchar(45) DEFAULT NULL,
  `primerApellido` varchar(45) DEFAULT NULL,
  `segundoApellido` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `iduser_UNIQUE` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (18,'Usuario de prueba','Santa ana','user1@unah.hn','8856-2348','usuario','$2a$04$a6XIpwXgVoKwGyW6g7bFP.ePrp3I8DdNkx1zjf1aIx1UMLJkbe7Km',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'Sofia Videa','Loarque','sofiagineth4@gmail.com',NULL,'svidea','$2a$04$3lVJ0dAfupUHUgxQhnhfXeZ60nd3MJSZneW.hEKThLz4wsOQxKiii',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'Angel Ordoñez','Kennedy','ordonezangel88@gmail.com',NULL,'angelo','$2a$04$olA5lJjLW9GBgTHPDhZ9/eZ005/Jb9MvQ4qfzgAchvzAaxRBVIhaG',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Alan David','Brasil','aaassa@yahoo.com',NULL,'alan','$2a$04$Kc0SxdibXFPeVtFc4hW77uEAcOVj5r/3iNv7mEc62mAg13Lj.IPVi',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'Mayra Castellanos','7 Houndstooth Rd.','maira@unah.hn',NULL,'maira','$2a$04$/rv1Oi4FNEVDyXSLtXiCc.PbKmUhH3UA5atUwCUQ1o03hAB1mC3jS',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'Deybi Garmendia',NULL,'deybi@unah.hn',NULL,'deybi','$2a$04$6DV31dBoHxPw3R.WA1BTkO9jTUQTslOUolzDXEZ1a4OOwYUUN/Pv.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'Kako',NULL,'kako@hotmail.com',NULL,'kako','$2a$04$xBvL6Ih3y2XfnD63GtPdZeTpzzwS5a86CnSNWDbHBezNmEhnOct/W',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'ultimo usuario de prueba',NULL,'ultiomoprueba@unah.com',NULL,'ultimo','$2a$04$CPpqln7jsURypqXNr43lkezeLDxOYyB9OaVP3MR0NByl1YEQUQTQq',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'z',NULL,'Adida@hotmail.com',NULL,'z','$2a$04$g0wHxQddyNntcMSWS5yHseZkTexrkrgep90WOI.LbqW.MXkU.XXDC',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'admin2',NULL,'aaassa@yahoo.com',NULL,'admin2','$2a$04$eqsBW1HVWB2xT566rCDRtucaJ642j4gkdYJr8mYNxUxBy5buK/gC6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Kako Lagos',NULL,'lagos@unah.hn',NULL,'kako','$2a$04$xIUeGHgD4xlFfwfJ4Tq9T./z3zEGKwIy/GcWaGsbnEFExxl8jNCyW',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'b',NULL,'b@yahoo.com',NULL,'b','$2a$04$PEITxhksV5l8RWVpspsB5.9GHVY76Byb892iMUXGHZBaDPKmOUXH6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'Gina Discua',NULL,'gina@unah.com',NULL,'gina','$2a$04$87j2IbjeR/s7VICtXg63E.Hi2gwiqHlfQoHyAlCZNedncHmTUYNQ.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'Prueba Cliente',NULL,'pruebaCliente@prueba.com',NULL,'pruebaCliente','$2a$04$VEW.7JZSuchzXgZXMJdB4.80Pq.aDiSFQWGJ.k7gf7TiuJC6GJaie',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'Prueba Cliente 2',NULL,'pruebaCliente2@prueba.com',NULL,'pruebaCliente2','$2a$04$MOlx167wr4NILKacumlTSugYYKa.4WksGKYHQtaK52.uT4CYVYHsW',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'Prueba Cliente 2',NULL,'pruebaCliente2@prueba.com',NULL,'pruebaCliente2','$2a$04$jOkvnh8Te1dQfLDCbp4gw.0fZZca2BZj6ppnyqKaka2hCsIjY4s7u',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'Prueba Cliente 2',NULL,'pruebaCliente2@prueba.com',NULL,'pruebaCliente2','$2a$04$vIojMo0IeV5dzXDN7pWMe.MLwyWS4j5wxBrnnOb/U2c.QW8i3eLSa',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'Prueba Cliente 2',NULL,'pruebaCliente2@prueba.com',NULL,'pruebaCliente2','$2a$04$EZ5zgEG.BL0mutHAeIrWP.OC/R66D.pkRxtodWpkCr0VKwl0Z8Z0S',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'Prueba Cliente 2',NULL,'pruebaCliente2@prueba.com',NULL,'pruebaCliente2','$2a$04$jATi5yeRc6ckQAxYyaHg4us00b/.PfBwwn.8985uqttmBqKNQQaea',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'Angel Edgardo Ordoñez',NULL,'aeordonezo@unah.hn',NULL,'skratos','$2a$04$Lvx8b1FdPyceFVAYrZyTyulnAxRGoEepHCEHNHIif16/v.CY42Zc.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'Irma Valladarez',NULL,'irma@unah.hn',NULL,'irma','$2a$04$85BzWzZITu4GwuyN33Ok/.oMLgao0879voQ4YNH7bspT2U4M0zFEm',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'josue',NULL,'josue@yahoo.com',NULL,'josue','$2a$04$EyuVnEusM4fkWqXlOM6uYeB8KLDDigQl5Tflb4B9smgLeF3FIKC6G',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'Usuario',NULL,'usaurio@unah.hn',NULL,'usuario','$2a$04$qjiZDhavO4reYcCN82.0qekTKprvxtscGM.wf3BCJ5baV0Dk.XwLS',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'alan',NULL,'Adida@hotmail.com',NULL,'alan','$2a$04$mlHHwLOUsScNCpKCeoicSu7vNriiMOSwbYOqfNiR5Df1xfkW5rQc.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,NULL,'Choluteca','ordonezangel88@gmail.com','32378189','1234','$2a$04$6H5n2ZV1QA8EAP03mHRuUOXg3xjxzaCkacO.DEs3o4NCNys9YcH8S','Angel','Edgardo','Ordoñez','Ordoñez','000000000','M','2021-11-04'),(45,NULL,'Colonia Iberia, Distrito Central','ordonezangel88@gmail.com','32378189','1234','$2a$04$cARMGRg2ow.jjbCrNs8bleuwn9B9.7tuRmRDfK3UVa4XTtKx.zlO6','Angel','Edgardo','Ordoñez','Ordoñez','000000000','M','2021-11-04'),(46,NULL,'Colonia Iberia, Distrito Central','ordonezangel88@gmail.com','32378189','1234','$2a$04$BK/u/nQcmHYow5h.irokaeo4J.Ao7GwQMmEZ1LZecs0eSbML6590O','Angel','Edgardo','Ordoñez','Ordoñez','000000000','M','2021-11-05'),(47,NULL,'Colonia Iberia, Distrito Central','ordonezangel88@gmail.com','32378189','1234','$2a$04$lS9zwyhUmNCVruMQSYFq.ON2LVZVkdiXyXVTCMyFWfJwATNnpe2wm','Angel','Edgardo','Ordoñez','Ordoñez','000000000','M','2021-11-05'),(48,NULL,'Colonia Iberia, Distrito Central','ordonezangel88@gmail.com','32378189','1234','$2a$04$5Nkw0l32OQghBjX5kND8i.Djl6GgP3kx.uEJGTlWzulQw2kTuhnJO','Angel','Edgardo','Ordoñez','Ordoñez','000000000','M','2021-11-05'),(49,NULL,'7 Houndstooth Rd.','kako@hotmail.com','715554444','deybi','$2a$04$6bO7fN4KxAVJTaq3/jS9COhq6H9aP3Sw002WiwGoZwI80sx1/.HKe','Deyvi','Edgardo','Ordoñez','Ordoñez','000000000','M','2021-11-04'),(50,'Maria Aurora Vadallades',NULL,'mariaAurora@unah.hn',NULL,'mariaAurora','$2a$04$hX4uVk0bFiGwZz3S77bWGuC3E5Afn0.m2YuGtvAO6DuwhiRV4M2wm',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'Usuario de prueba',NULL,'usuarioPrueba@unah.hn',NULL,'usuario','$2a$04$wz6n/Fgb/PbjO0c7vOrbbucZ5.xUytBktMCapCkl1WF21lvP241qu',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Usuario de prueba',NULL,'usuarioPrueba@unah.hn',NULL,'usuario','$2a$04$KkKHxCX419azrvHn2P8HXO8Snfdn.ZZLqea8ZytUlwIdcqfAxLWDS',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'Usuario de prueba',NULL,'usuarioPrueba@unah.hn',NULL,'usuario','$2a$04$XOst5innem8VSMAoDH6..ez/Z6OFQCueG/5vpKcL0MPIsX8x5RxV.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Usuario de prueba',NULL,'usuarioPrueba@unah.hn',NULL,'usuario','$2a$04$5VsRFJJ/QB5XO3kojWZpb.vak7cQV.MxqliiFPDYtQEmFWYD.gRce',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'Usuario de prueba',NULL,'usuarioPrueba@unah.hn',NULL,'usuario','$2a$04$umB.mTVXjodBEd2gF1qm8.sk1Ii9VnsmT1ADzk5UnOygV0W1yGpHi',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'Usuario de prueba',NULL,'usuarioPrueba@unah.hn',NULL,'usuario','$2a$04$cAbALsRz2tI5ANkGZ07nIOCDY5WLtnzmlh5SmD13bSedxiNLAoTee',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,NULL,'Choluteca','aeordonezo@unah.hn','32378189','angel','$2a$04$HCZFy.s3DEHu0vtOSm1E3e3BviptSq/AjA5vk3fOyQxYrw6v3i2n6','Angel','Edgardo','Ordoñez','Ordoñez','000000000','Masculino','1998-11-05'),(58,NULL,'Kennedy','360beauty@hotmail.com','2279856','admin','$2a$04$92JBBy1aYjz5AONagnuPMeF2SVJwsu9TQ33oVbQVRlmtEUkVKR/Y6','Administrador','Administrador','Oficial','Oficial','01010101','Femenino','2021-11-23'),(59,'Paul Pogba',NULL,'pogba@francia.com',NULL,'pogba','$2a$04$DoozQR2j71iwzyoIepUpZ.Ni07ks2uiBvNg0Gde.gEo3I0UWOqRHa',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `ruta_imagen` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Tinte rosa','Tinte para cabello color rosa fusia','MAILOB',80,'1. tinte cabello rosa.jpg'),(6,'Shampu Basico','Shampu Basico','GIRASOL',95,'2. shampu basico.jpg'),(7,'Shampu head & shoulder','shampu head & shoulder','head & shoulder',55,'3. shampu head & shoulder.jpg'),(8,'Shampu pantene','shampu pantene','PANTENE',105,'4. shampu pantene.jpg'),(9,'Tinte morado','Tinte de cabello morado','PANTENE',305,'5. tinte morado.jpg'),(12,'Gelatina EXO','Gelatina exo frasco verde mediano','ECO',1000,'8. exo.jpg'),(14,'Plancha Rowenta','Plancha para cabello color negro, modelo Rowenta','ROWENTA',999,'9. plancha pelo.jpg'),(17,'Wax gigi','Cera para depilacion','GIGI',400,'11. cera depilar.jpg'),(29,'Tinte dorado','Nutrisse mediado','NUTRISSE',399,'6. tinte aguacate.jpg'),(30,'Gel Xtreme','Gelatina xtreme Bote pequeño Color transparente','XTREME',85,'7. xtreme.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `idpromociones` int unsigned NOT NULL AUTO_INCREMENT,
  `ruta_imagen` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idpromociones`),
  UNIQUE KEY `idpromociones_UNIQUE` (`idpromociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rangos`
--

DROP TABLE IF EXISTS `rangos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rangos` (
  `idRango` int unsigned NOT NULL AUTO_INCREMENT,
  `inicio` varchar(45) DEFAULT NULL,
  `final` varchar(45) DEFAULT NULL,
  `numeroActual` int DEFAULT NULL,
  `cai` varchar(45) DEFAULT NULL,
  `fechaLimiteEmision` date DEFAULT NULL,
  `r_tipoDocumento` int unsigned NOT NULL,
  `activo` varchar(5) DEFAULT NULL,
  `r_sucursal` int unsigned NOT NULL,
  `r_caja` int unsigned NOT NULL,
  PRIMARY KEY (`idRango`),
  UNIQUE KEY `idRango_UNIQUE` (`idRango`),
  KEY `fk_r_tipoDocumento_idx` (`r_tipoDocumento`),
  KEY `fk_r_sucursal_idx` (`r_sucursal`),
  KEY `fk_r_caja_idx` (`r_caja`),
  CONSTRAINT `fk_r_caja` FOREIGN KEY (`r_caja`) REFERENCES `cajas` (`idCajas`),
  CONSTRAINT `fk_r_sucursal` FOREIGN KEY (`r_sucursal`) REFERENCES `sucursal` (`idSucursal`),
  CONSTRAINT `fk_r_tipoDocumento` FOREIGN KEY (`r_tipoDocumento`) REFERENCES `tipodocumentos` (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rangos`
--

LOCK TABLES `rangos` WRITE;
/*!40000 ALTER TABLE `rangos` DISABLE KEYS */;
INSERT INTO `rangos` VALUES (1,'001-001-01-00000000','001-001-01-00015000',23,'35ASD-254569-SASDS-SSAD-2D','2022-12-31',1,'SI',1,1);
/*!40000 ALTER TABLE `rangos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_categoria`
--

DROP TABLE IF EXISTS `servicio_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_categoria` (
  `servicio` int unsigned NOT NULL,
  `categoria` int unsigned NOT NULL,
  KEY `fk_sc_servicio_idx` (`servicio`),
  KEY `fk_sc_categoria_idx` (`categoria`),
  CONSTRAINT `fk_sc_categoria` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`idCategorias`),
  CONSTRAINT `fk_sc_servicio` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`idServicios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_categoria`
--

LOCK TABLES `servicio_categoria` WRITE;
/*!40000 ALTER TABLE `servicio_categoria` DISABLE KEYS */;
INSERT INTO `servicio_categoria` VALUES (1,1),(2,1),(4,1);
/*!40000 ALTER TABLE `servicio_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `idServicios` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreServicio` varchar(90) DEFAULT NULL,
  `duracion` varchar(20) DEFAULT NULL,
  `precioServicio` double DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `ruta_portada` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idServicios`),
  UNIQUE KEY `idServicios_UNIQUE` (`idServicios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Manicure','1 hora',300,'Pintado normal','1. Manicure.jpg'),(2,'Pedicure','3 horas',400,'Pintado normal','2. Pedicure.jpg'),(4,'Esmaltado permanente','3 horas',250,'','3. esmaltado permanente.jpg');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `idSucursal` int unsigned NOT NULL AUTO_INCREMENT,
  `establecimiento` varchar(5) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rtn` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSucursal`),
  UNIQUE KEY `idSucursal_UNIQUE` (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'001','32659621','0005-55210-55','Kennedy');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumentos`
--

DROP TABLE IF EXISTS `tipodocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodocumentos` (
  `idTipoDocumento` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `habilitado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`),
  UNIQUE KEY `idTipoDocumento_UNIQUE` (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumentos`
--

LOCK TABLES `tipodocumentos` WRITE;
/*!40000 ALTER TABLE `tipodocumentos` DISABLE KEYS */;
INSERT INTO `tipodocumentos` VALUES (1,'01','Factura','SI');
/*!40000 ALTER TABLE `tipodocumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `idUnidades` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreUnidad` varchar(45) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idUnidades`),
  UNIQUE KEY `idUnidades_UNIQUE` (`idUnidades`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'kilogramos','kg'),(2,'litros','l'),(3,'gramos','gramos'),(4,'miligramo','mg'),(5,'onza','onz'),(6,'libra','lb'),(7,'unidades','unidades');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 16:46:38

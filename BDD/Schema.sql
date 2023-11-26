-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: nodo_travel
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquileres` (
  `RentalID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `BikeID` int DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `EstadoAlquiler` varchar(50) DEFAULT NULL,
  `MontoTotal` decimal(8,2) DEFAULT NULL,
  `LocationID` int DEFAULT NULL,
  PRIMARY KEY (`RentalID`),
  KEY `UserID` (`UserID`),
  KEY `BikeID` (`BikeID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `alquileres_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `alquileres_ibfk_2` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`),
  CONSTRAINT `alquileres_ibfk_3` FOREIGN KEY (`LocationID`) REFERENCES `ubicaciones` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquileres`
--

LOCK TABLES `alquileres` WRITE;
/*!40000 ALTER TABLE `alquileres` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicicletas`
--

DROP TABLE IF EXISTS `bicicletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicicletas` (
  `BikeID` int NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `PrecioPorHora` decimal(8,2) DEFAULT NULL,
  `Descripcion` text,
  `LocationID` int DEFAULT NULL,
  PRIMARY KEY (`BikeID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `bicicletas_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `ubicaciones` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicicletas`
--

LOCK TABLES `bicicletas` WRITE;
/*!40000 ALTER TABLE `bicicletas` DISABLE KEYS */;
INSERT INTO `bicicletas` VALUES (3,'Bicicleta1','Deportiva','Disponible',5.00,'Bicicleta deportiva de color rojo',1),(4,'Bicicleta2','Paseo','En Reparación',3.50,'Bicicleta de paseo con canasta',2);
/*!40000 ALTER TABLE `bicicletas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacionesresenas`
--

DROP TABLE IF EXISTS `calificacionesresenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacionesresenas` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `BikeID` int DEFAULT NULL,
  `Comentario` text,
  `Calificacion` int DEFAULT NULL,
  `FechaResena` datetime DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `BikeID` (`BikeID`),
  CONSTRAINT `calificacionesresenas_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `calificacionesresenas_ibfk_2` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacionesresenas`
--

LOCK TABLES `calificacionesresenas` WRITE;
/*!40000 ALTER TABLE `calificacionesresenas` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacionesresenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlcalidad`
--

DROP TABLE IF EXISTS `controlcalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlcalidad` (
  `QualityControlID` int NOT NULL AUTO_INCREMENT,
  `BikeID` int DEFAULT NULL,
  `FechaRevision` datetime DEFAULT NULL,
  `Observaciones` text,
  `EstadoCalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`QualityControlID`),
  KEY `BikeID` (`BikeID`),
  CONSTRAINT `controlcalidad_ibfk_1` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlcalidad`
--

LOCK TABLES `controlcalidad` WRITE;
/*!40000 ALTER TABLE `controlcalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlcalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtradospreferencias`
--

DROP TABLE IF EXISTS `filtradospreferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filtradospreferencias` (
  `FilterID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `TipoFiltro` varchar(50) DEFAULT NULL,
  `ValorFiltro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FilterID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `filtradospreferencias_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtradospreferencias`
--

LOCK TABLES `filtradospreferencias` WRITE;
/*!40000 ALTER TABLE `filtradospreferencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtradospreferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantias`
--

DROP TABLE IF EXISTS `garantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantias` (
  `WarrantyID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `BikeID` int DEFAULT NULL,
  `DescripcionGarantia` text,
  `FechaInicioGarantia` datetime DEFAULT NULL,
  `FechaFinGarantia` datetime DEFAULT NULL,
  PRIMARY KEY (`WarrantyID`),
  KEY `UserID` (`UserID`),
  KEY `BikeID` (`BikeID`),
  CONSTRAINT `garantias_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `garantias_ibfk_2` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantias`
--

LOCK TABLES `garantias` WRITE;
/*!40000 ALTER TABLE `garantias` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidentes`
--

DROP TABLE IF EXISTS `incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidentes` (
  `IncidentID` int NOT NULL AUTO_INCREMENT,
  `RentalID` int DEFAULT NULL,
  `DescripcionIncidente` text,
  `CostoReparacion` decimal(8,2) DEFAULT NULL,
  `FechaIncidente` datetime DEFAULT NULL,
  PRIMARY KEY (`IncidentID`),
  KEY `RentalID` (`RentalID`),
  CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`RentalID`) REFERENCES `alquileres` (`RentalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentes`
--

LOCK TABLES `incidentes` WRITE;
/*!40000 ALTER TABLE `incidentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `MaintenanceID` int NOT NULL AUTO_INCREMENT,
  `BikeID` int DEFAULT NULL,
  `DescripcionMantenimiento` text,
  `FechaInicioMantenimiento` datetime DEFAULT NULL,
  `FechaFinMantenimiento` datetime DEFAULT NULL,
  `CostoMantenimiento` decimal(8,2) DEFAULT NULL,
  `EstadoMantenimiento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaintenanceID`),
  KEY `BikeID` (`BikeID`),
  CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Monto` decimal(8,2) DEFAULT NULL,
  `MetodoPago` varchar(50) DEFAULT NULL,
  `FechaPago` datetime DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietariosbicicletas`
--

DROP TABLE IF EXISTS `propietariosbicicletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietariosbicicletas` (
  `OwnerID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `BikeID` int DEFAULT NULL,
  PRIMARY KEY (`OwnerID`),
  KEY `UserID` (`UserID`),
  KEY `BikeID` (`BikeID`),
  CONSTRAINT `propietariosbicicletas_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `propietariosbicicletas_ibfk_2` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietariosbicicletas`
--

LOCK TABLES `propietariosbicicletas` WRITE;
/*!40000 ALTER TABLE `propietariosbicicletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietariosbicicletas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robos`
--

DROP TABLE IF EXISTS `robos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robos` (
  `RoboID` int NOT NULL AUTO_INCREMENT,
  `BikeID` int DEFAULT NULL,
  `DescripcionRobo` text,
  `FechaRobo` datetime DEFAULT NULL,
  PRIMARY KEY (`RoboID`),
  KEY `BikeID` (`BikeID`),
  CONSTRAINT `robos_ibfk_1` FOREIGN KEY (`BikeID`) REFERENCES `bicicletas` (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robos`
--

LOCK TABLES `robos` WRITE;
/*!40000 ALTER TABLE `robos` DISABLE KEYS */;
/*!40000 ALTER TABLE `robos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `NombreRol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RoleID`),
  UNIQUE KEY `NombreRol` (`NombreRol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'Administrador'),(7,'AnalistaDatos'),(6,'AuditorSeguridad'),(3,'Mantenimiento'),(5,'SoporteCliente'),(4,'SupervisorAlquileres'),(1,'Usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `RentalID` int DEFAULT NULL,
  `Monto` decimal(8,2) DEFAULT NULL,
  `MetodoPago` varchar(50) DEFAULT NULL,
  `FechaTransaccion` datetime DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `UserID` (`UserID`),
  KEY `RentalID` (`RentalID`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`RentalID`) REFERENCES `alquileres` (`RentalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `NombreUbicacion` varchar(255) DEFAULT NULL,
  `Latitud` decimal(10,6) DEFAULT NULL,
  `Longitud` decimal(10,6) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,'Ubicacion1',40.712800,-74.006000,'Times Square, New York'),(2,'Ubicacion2',34.052200,-118.243700,'Hollywood Blvd, Los Angeles');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `CorreoElectronico` varchar(255) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `CorreoElectronico` (`CorreoElectronico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Perez','juan@example.com','password123','Calle 123, Ciudad','123-456-7890'),(2,'Maria','Gomez','maria@example.com','securepass','Avenida 456, Ciudad','987-654-3210');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariosroles`
--

DROP TABLE IF EXISTS `usuariosroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariosroles` (
  `UsuarioRolID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  PRIMARY KEY (`UsuarioRolID`),
  KEY `UserID` (`UserID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `usuariosroles_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`),
  CONSTRAINT `usuariosroles_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariosroles`
--

LOCK TABLES `usuariosroles` WRITE;
/*!40000 ALTER TABLE `usuariosroles` DISABLE KEYS */;
INSERT INTO `usuariosroles` VALUES (1,1,1),(2,1,2),(3,2,1);
/*!40000 ALTER TABLE `usuariosroles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26 16:31:00

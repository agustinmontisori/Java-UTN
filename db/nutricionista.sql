CREATE DATABASE  IF NOT EXISTS `nutricionista` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nutricionista`;
-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: nutricionista
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `id_alimento` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `calorias` int unsigned NOT NULL,
  `grasas` float unsigned NOT NULL,
  `proteinas` float unsigned NOT NULL,
  `carbohidratos` float unsigned NOT NULL,
  `id_unidad_medida` int unsigned NOT NULL,
  `id_categoria` int unsigned NOT NULL,
  PRIMARY KEY (`id_alimento`),
  UNIQUE KEY `id_alimento_UNIQUE` (`id_alimento`),
  KEY `fk_alimento_unidad_idx` (`id_unidad_medida`),
  KEY `fk_alimento_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_alimento_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_alimento_unidad` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (1,'Carne de vaca',150,50,20,0,3,8),(2,'Lentejas',100,0,35,30,1,9),(3,'Queso parmesano',500,200,70,15,1,10);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'verdura'),(8,'carne'),(9,'legumbre'),(10,'lacteo'),(11,'fruta'),(12,'fruto seco');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo_paciente`
--

DROP TABLE IF EXISTS `consumo_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo_paciente` (
  `id_paciente` varchar(45) NOT NULL,
  `id_alimento` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `cantidad` int unsigned NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_alimento`,`fecha`,`tipo`),
  KEY `fk_consumo_alimento_idx` (`id_alimento`),
  CONSTRAINT `fk_consumo_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_consumo_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo_paciente`
--

LOCK TABLES `consumo_paciente` WRITE;
/*!40000 ALTER TABLE `consumo_paciente` DISABLE KEYS */;
INSERT INTO `consumo_paciente` VALUES ('11111111',1,'2020-07-18','merienda',3),('11111111',2,'2020-07-18','almuerzo',200),('11111111',2,'2020-07-18','desayuno',500),('11111112',1,'2020-07-18','cena',2),('11111112',3,'2020-07-18','almuerzo',50),('11111113',1,'2020-07-18','almuerzo',5),('11111113',1,'2020-07-18','otro',5);
/*!40000 ALTER TABLE `consumo_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_nutricionista` varchar(45) NOT NULL,
  `cod_postal` int unsigned NOT NULL,
  `calle` varchar(45) NOT NULL,
  `altura` int unsigned NOT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `depto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nutricionista`,`cod_postal`),
  KEY `fk_direccion_localidad_idx` (`cod_postal`),
  CONSTRAINT `fk_direccion_localidad` FOREIGN KEY (`cod_postal`) REFERENCES `localidad` (`cod_postal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_direccion_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES ('22222221',2000,'Zeballos',1300,NULL,NULL),('22222222',2113,'Av. San Martin',200,NULL,NULL),('22222223',2000,'Corrientes',2213,NULL,NULL);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio` (
  `id_ejercicio` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `gasto_energetico` int unsigned NOT NULL,
  PRIMARY KEY (`id_ejercicio`),
  UNIQUE KEY `id_ejercicio_UNIQUE` (`id_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
INSERT INTO `ejercicio` VALUES (1,'correr',1000),(2,'nado',1300),(3,'caminata',500),(4,'pesas',600),(5,'ciclismo',400),(6,'tennis',1000);
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_animo`
--

DROP TABLE IF EXISTS `estado_animo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_animo` (
  `id_estado_animo` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado_animo`),
  UNIQUE KEY `id_estado_animo_UNIQUE` (`id_estado_animo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_animo`
--

LOCK TABLES `estado_animo` WRITE;
/*!40000 ALTER TABLE `estado_animo` DISABLE KEYS */;
INSERT INTO `estado_animo` VALUES (1,'desanimado'),(2,'energico'),(3,'cansado'),(4,'desmotivado'),(5,'motivado');
/*!40000 ALTER TABLE `estado_animo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_nutricionista` varchar(45) NOT NULL,
  `dia` varchar(45) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time DEFAULT NULL,
  PRIMARY KEY (`id_nutricionista`,`dia`,`hora_desde`),
  CONSTRAINT `fk_horario_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES ('22222221','jueves','08:00:00','08:30:00'),('22222221','jueves','09:00:00','09:30:00'),('22222221','jueves','09:30:00','10:00:00'),('22222221','jueves','10:00:00','10:30:00'),('22222221','martes','08:00:00','08:30:00'),('22222221','martes','09:00:00','09:30:00'),('22222221','miercoles','08:00:00','08:30:00'),('22222221','miercoles','09:00:00','09:30:00'),('22222221','miercoles','09:30:00','10:00:00'),('22222221','miercoles','10:00:00','10:30:00'),('22222222','lunes','08:00:00','08:30:00'),('22222222','lunes','09:00:00','09:30:00'),('22222222','lunes','09:30:00','10:00:00'),('22222222','lunes','10:00:00','10:30:00'),('22222222','martes','08:00:00','08:30:00'),('22222222','martes','09:00:00','09:30:00'),('22222222','martes','17:00:00','17:30:00'),('22222222','miercoles','08:00:00','08:30:00'),('22222222','miercoles','09:00:00','09:30:00'),('22222222','miercoles','09:30:00','10:00:00'),('22222222','miercoles','10:00:00','10:30:00'),('22222223','martes','09:00:00','09:30:00'),('22222223','miercoles','08:00:00','08:30:00'),('22222223','miercoles','09:00:00','09:30:00'),('22222223','miercoles','09:30:00','10:00:00'),('22222223','miercoles','10:00:00','10:30:00'),('22222223','viernes','08:00:00','08:30:00'),('22222223','viernes','09:30:00','10:00:00'),('22222223','viernes','10:00:00','10:30:00');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `cod_postal` int unsigned NOT NULL,
  `denominacion` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_postal`),
  UNIQUE KEY `cod_postal_UNIQUE` (`cod_postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (2000,'Rosario'),(2113,'Peyrano');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionista`
--

DROP TABLE IF EXISTS `nutricionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista` (
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `matricula_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionista`
--

LOCK TABLES `nutricionista` WRITE;
/*!40000 ALTER TABLE `nutricionista` DISABLE KEYS */;
INSERT INTO `nutricionista` VALUES ('22222221','laura','merlo','laura','341 22313222','laura@gmail.com'),('22222222','martina','moron','martina','341 4134243','martina@gmail.com'),('22222223','juan','mendez','juan','341 5543445','juan@gmail.com');
/*!40000 ALTER TABLE `nutricionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionista_paciente`
--

DROP TABLE IF EXISTS `nutricionista_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista_paciente` (
  `id_nutricionista` varchar(45) NOT NULL,
  `id_paciente` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`fecha`,`id_paciente`,`id_nutricionista`),
  KEY `fk_nutricionista_paciente_2_idx` (`id_paciente`),
  KEY `fk_nutricionista_paciente_1_idx` (`id_nutricionista`),
  CONSTRAINT `fk_nutricionista_paciente_1` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_nutricionista_paciente_2` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionista_paciente`
--

LOCK TABLES `nutricionista_paciente` WRITE;
/*!40000 ALTER TABLE `nutricionista_paciente` DISABLE KEYS */;
INSERT INTO `nutricionista_paciente` VALUES ('22222221','11111111','2020-08-15'),('22222221','11111111','2020-12-02'),('22222222','11111113','2020-06-15');
/*!40000 ALTER TABLE `nutricionista_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `genero` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `altura` int unsigned DEFAULT NULL,
  `peso` float unsigned DEFAULT NULL,
  `imc` float unsigned DEFAULT NULL,
  `metabolismo_basal` float unsigned DEFAULT NULL,
  `peso_objetivo` float unsigned DEFAULT NULL,
  `objetivo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('11111111','agustin','dangelo','agustin@gmail.com','agustin','12313123','masculino','2000-02-24',177,77,20,2000,90,'subir peso'),('11111112','rodrigo','perez','rodrigo@gmail.com','rodrigo','7657567567','masculino','2005-02-24',150,60,15,1800,55,'bajar peso'),('11111113','martin','moreno','martin@gmail.com','martin','556456','masculino','2005-01-30',165,57,12,2150,70,'aumentar masa muscular');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_ejercicio`
--

DROP TABLE IF EXISTS `paciente_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_ejercicio` (
  `id_paciente` varchar(45) NOT NULL,
  `id_ejercicio` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `duracion` int NOT NULL,
  `intensidad` varchar(45) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_ejercicio`,`fecha`),
  KEY `fk_paciente_ejercicio_2_idx` (`id_ejercicio`),
  CONSTRAINT `fk_paciente_ejercicio_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_ejercicio_2` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id_ejercicio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_ejercicio`
--

LOCK TABLES `paciente_ejercicio` WRITE;
/*!40000 ALTER TABLE `paciente_ejercicio` DISABLE KEYS */;
INSERT INTO `paciente_ejercicio` VALUES ('11111111',3,'2020-07-18',50,'alta'),('11111111',4,'2020-07-18',10,'baja'),('11111111',5,'2020-07-18',30,'moderada'),('11111112',1,'2020-07-18',30,'moderada'),('11111112',2,'2020-07-18',10,'baja'),('11111112',6,'2020-07-18',10,'baja'),('11111113',1,'2020-07-18',30,'moderada'),('11111113',3,'2020-07-18',50,'alta'),('11111113',4,'2020-07-18',10,'baja');
/*!40000 ALTER TABLE `paciente_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_estado_animo`
--

DROP TABLE IF EXISTS `paciente_estado_animo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_estado_animo` (
  `id_paciente` varchar(45) NOT NULL,
  `id_estado_animo` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_estado_animo`,`fecha`),
  KEY `fk_paciente_estado_animo_2_idx` (`id_estado_animo`),
  CONSTRAINT `fk_paciente_estado_animo_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_estado_animo_2` FOREIGN KEY (`id_estado_animo`) REFERENCES `estado_animo` (`id_estado_animo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_estado_animo`
--

LOCK TABLES `paciente_estado_animo` WRITE;
/*!40000 ALTER TABLE `paciente_estado_animo` DISABLE KEYS */;
INSERT INTO `paciente_estado_animo` VALUES ('11111112',1,'2020-07-18'),('11111111',3,'2020-07-18'),('11111111',4,'2020-07-18');
/*!40000 ALTER TABLE `paciente_estado_animo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_desde` date NOT NULL,
  `id_paciente` varchar(45) NOT NULL,
  `id_nutricionista` varchar(45) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE KEY `id_plan_UNIQUE` (`id_plan`),
  KEY `fk_plan_paciente_idx` (`id_paciente`),
  KEY `fk_plan_nutricionista_idx` (`id_nutricionista`),
  CONSTRAINT `fk_plan_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_plan_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'2020-07-18','11111111','22222221'),(2,'2020-07-18','11111112','22222222'),(3,'2020-07-18','11111113','22222223');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_alimento`
--

DROP TABLE IF EXISTS `plan_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_alimento` (
  `id_alimento` int unsigned NOT NULL,
  `id_plan` int unsigned NOT NULL,
  PRIMARY KEY (`id_alimento`,`id_plan`),
  KEY `fk_plan_alimento_alimento_idx` (`id_alimento`),
  KEY `fk_plan_alimento_2_idx` (`id_plan`),
  CONSTRAINT `fk_plan_alimento_1` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_plan_alimento_2` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_alimento`
--

LOCK TABLES `plan_alimento` WRITE;
/*!40000 ALTER TABLE `plan_alimento` DISABLE KEYS */;
INSERT INTO `plan_alimento` VALUES (1,1),(1,2),(2,1),(3,2),(3,3);
/*!40000 ALTER TABLE `plan_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_paciente` varchar(45) NOT NULL,
  `id_nutricionista` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT 'Pendiente',
  PRIMARY KEY (`id_paciente`,`id_nutricionista`),
  KEY `fk_solicitud_nutricionista_idx` (`id_nutricionista`),
  CONSTRAINT `fk_solicitud_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES ('11111111','22222222','rechazada'),('11111111','22222223','pendiente'),('11111112','22222222','rechazada'),('11111113','22222221','confirmada'),('11111113','22222222','pendiente'),('11111113','22222223','confirmada');
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_unidad_medida`),
  UNIQUE KEY `id_unidad_medida_UNIQUE` (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'gramos'),(2,'unidades'),(3,'filetes'),(4,'puñado');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-18 18:01:25

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
  `id_alimento` int unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `calorias` float unsigned DEFAULT NULL,
  `grasas` float unsigned DEFAULT NULL,
  `proteinas` float unsigned DEFAULT NULL,
  `carbohidratos` float unsigned DEFAULT NULL,
  `id_unidad_medida` int unsigned NOT NULL,
  `id_categoria` int unsigned NOT NULL,
  PRIMARY KEY (`id_alimento`),
  UNIQUE KEY `id_alimento_UNIQUE` (`id_alimento`),
  KEY `fk_alimento_unidad_medida_idx` (`id_unidad_medida`),
  KEY `fk_alimento_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_alimento_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_alimento_unidad_medida` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (0,'Carne de vaca',150,50,20,0,2,1),(1,'Lentejas',100,0,35,30,0,2),(2,'Queso parmesano',500,200,70,15,0,3);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (0,'verdura'),(1,'carne'),(2,'legumbre'),(3,'lacteo'),(4,'fruta');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo_paciente`
--

DROP TABLE IF EXISTS `consumo_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo_paciente` (
  `id_paciente` int unsigned NOT NULL,
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
INSERT INTO `consumo_paciente` VALUES (1111111,0,'2020-07-14','merienda',3),(1111111,1,'2020-07-14','almuerzo',200),(2222222,1,'2020-07-14','desayuno',500),(2222222,2,'2020-07-14','almuerzo',50),(4124412,0,'2020-07-14','cena',2),(4124412,0,'2020-07-14','otro',5);
/*!40000 ALTER TABLE `consumo_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `cod_postal` int DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `id_nutricionista` int unsigned NOT NULL,
  UNIQUE KEY `id_nutricionista_UNIQUE` (`id_nutricionista`),
  CONSTRAINT `fk_direccion_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`matricula`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (2000,'Rosario','1300',NULL,'Zeballos',0),(2000,'Rosario','2213',NULL,'Corrientes',12312),(2113,'Peyrano','200',NULL,'Av. San Martin',55555);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio` (
  `id_ejercicio` int unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `gasto_energetico` float unsigned NOT NULL,
  PRIMARY KEY (`id_ejercicio`),
  UNIQUE KEY `id_ejercicio_UNIQUE` (`id_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
INSERT INTO `ejercicio` VALUES (0,'correr',1000),(1,'nado',1300),(2,'caminata',500),(3,'pesas',600),(4,'ciclismo',400),(5,'tennis',1000);
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_animo`
--

DROP TABLE IF EXISTS `estado_animo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_animo` (
  `id_estado_animo` int unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_animo`),
  UNIQUE KEY `id_estado_animo_UNIQUE` (`id_estado_animo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_animo`
--

LOCK TABLES `estado_animo` WRITE;
/*!40000 ALTER TABLE `estado_animo` DISABLE KEYS */;
INSERT INTO `estado_animo` VALUES (0,'desanimado'),(1,'energico'),(2,'cansado'),(3,'desmotivado'),(4,'motivado');
/*!40000 ALTER TABLE `estado_animo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_nutricionista` int unsigned NOT NULL,
  `dia` varchar(45) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time DEFAULT NULL,
  PRIMARY KEY (`id_nutricionista`,`dia`,`hora_desde`),
  CONSTRAINT `fk_horario_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (0,'martes','09:00:00','09:30:00'),(0,'miercoles','08:00:00','08:30:00'),(0,'miercoles','09:00:00','09:30:00'),(0,'miercoles','09:30:00','10:00:00'),(0,'miercoles','10:00:00','10:30:00'),(0,'viernes','08:00:00','08:30:00'),(0,'viernes','09:00:00','09:30:00'),(0,'viernes','09:30:00','10:00:00'),(0,'viernes','10:00:00','10:30:00'),(12312,'jueves','08:00:00','08:30:00'),(12312,'jueves','09:00:00','09:30:00'),(12312,'jueves','09:30:00','10:00:00'),(12312,'jueves','10:00:00','10:30:00'),(12312,'martes','08:00:00','08:30:00'),(12312,'martes','09:00:00','09:30:00'),(12312,'miercoles','08:00:00','08:30:00'),(12312,'miercoles','09:00:00','09:30:00'),(12312,'miercoles','09:30:00','10:00:00'),(12312,'miercoles','10:00:00','10:30:00'),(55555,'lunes','08:00:00','08:30:00'),(55555,'lunes','09:00:00','09:30:00'),(55555,'lunes','09:30:00','10:00:00'),(55555,'lunes','10:00:00','10:30:00'),(55555,'martes','08:00:00','08:30:00'),(55555,'martes','09:00:00','09:30:00'),(55555,'miercoles','08:00:00','08:30:00'),(55555,'miercoles','09:00:00','09:30:00'),(55555,'miercoles','09:30:00','10:00:00'),(55555,'miercoles','10:00:00','10:30:00');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionista`
--

DROP TABLE IF EXISTS `nutricionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista` (
  `matricula` int(10) unsigned zerofill NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionista`
--

LOCK TABLES `nutricionista` WRITE;
/*!40000 ALTER TABLE `nutricionista` DISABLE KEYS */;
INSERT INTO `nutricionista` VALUES (0000000000,'laura','merlo','laura'),(0000012312,'martina','moron','martina'),(0000055555,'juan','mendez','juan');
/*!40000 ALTER TABLE `nutricionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionista_paciente`
--

DROP TABLE IF EXISTS `nutricionista_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista_paciente` (
  `id_nutricionista` int unsigned NOT NULL,
  `id_paciente` int unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  KEY `fk_paciente_atendido_nutricionista_idx` (`id_paciente`),
  KEY `fk_nutricionista_atiende_paciente_idx` (`id_nutricionista`),
  CONSTRAINT `fk_nutricionista_atiende_paciente` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`matricula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_paciente_atendido_nutricionista` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionista_paciente`
--

LOCK TABLES `nutricionista_paciente` WRITE;
/*!40000 ALTER TABLE `nutricionista_paciente` DISABLE KEYS */;
INSERT INTO `nutricionista_paciente` VALUES (0,1111111,'2020-12-02'),(0,1111111,'2020-08-15'),(55555,2222222,'2020-06-15');
/*!40000 ALTER TABLE `nutricionista_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `dni` int unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
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
INSERT INTO `paciente` VALUES (1111111,'agustin','dangelo','agustin@gmail.com','agustin','12313123','masculino','2000-02-24',177,77,20,2000,90,'subir peso'),(2222222,'rodrigo','perez','rodrigo@gmail.com','rodrigo','7657567567','masculino','2005-02-24',150,60,15,1800,55,'bajar peso'),(4124412,'martin','moreno','martin@gmail.com','martin','556456','masculino','2005-01-30',165,57,12,2150,70,'aumentar masa muscular');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_ejercicio`
--

DROP TABLE IF EXISTS `paciente_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_ejercicio` (
  `id_paciente` int unsigned NOT NULL,
  `id_ejercicio` int unsigned NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `intensidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`,`id_ejercicio`),
  KEY `fk_ejercicio_paciente_idx` (`id_ejercicio`),
  CONSTRAINT `fk_ejercicio_paciente` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id_ejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_ejercicio` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_ejercicio`
--

LOCK TABLES `paciente_ejercicio` WRITE;
/*!40000 ALTER TABLE `paciente_ejercicio` DISABLE KEYS */;
INSERT INTO `paciente_ejercicio` VALUES (1111111,0,'2020-07-13 22:39:25',10,'baja'),(1111111,2,'2020-07-13 22:39:25',10,'baja'),(1111111,4,'2020-07-13 22:39:23',10,'baja'),(2222222,0,'2020-07-13 22:38:09',30,'moderada'),(4124412,0,'2020-07-13 22:39:26',30,'moderada'),(4124412,3,'2020-07-13 22:39:27',50,'alta'),(4124412,4,'2020-07-13 22:39:27',10,'baja');
/*!40000 ALTER TABLE `paciente_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_estado_animo`
--

DROP TABLE IF EXISTS `paciente_estado_animo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_estado_animo` (
  `id_paciente` int unsigned NOT NULL,
  `id_estado_animo` int unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_paciente`,`id_estado_animo`),
  KEY `fk_estado_animo_paciente_idx` (`id_estado_animo`),
  CONSTRAINT `fk_estado_animo_paciente` FOREIGN KEY (`id_estado_animo`) REFERENCES `estado_animo` (`id_estado_animo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_estado_animo` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_estado_animo`
--

LOCK TABLES `paciente_estado_animo` WRITE;
/*!40000 ALTER TABLE `paciente_estado_animo` DISABLE KEYS */;
INSERT INTO `paciente_estado_animo` VALUES (1111111,3,'2020-07-13'),(2222222,4,'2020-07-13'),(4124412,1,'2020-07-13');
/*!40000 ALTER TABLE `paciente_estado_animo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_paciente` int unsigned NOT NULL,
  `fecha_desde` date NOT NULL,
  `id_plan_alimentacion` int unsigned NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_plan_alimentacion`),
  UNIQUE KEY `id_plan_alimentacion_UNIQUE` (`id_plan_alimentacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (0,'2020-07-13',0),(1,'2020-07-13',1),(2,'2020-07-13',2);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_alimento`
--

DROP TABLE IF EXISTS `plan_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_alimento` (
  `id_plan_alimentacion` int unsigned NOT NULL,
  `id_alimento` int unsigned NOT NULL,
  PRIMARY KEY (`id_plan_alimentacion`,`id_alimento`),
  KEY `fk_plan_alimento_alimento_idx` (`id_alimento`),
  CONSTRAINT `fk_plan_alimento_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`),
  CONSTRAINT `fk_plan_alimento_plan_alimentacion` FOREIGN KEY (`id_plan_alimentacion`) REFERENCES `plan` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_alimento`
--

LOCK TABLES `plan_alimento` WRITE;
/*!40000 ALTER TABLE `plan_alimento` DISABLE KEYS */;
INSERT INTO `plan_alimento` VALUES (0,0),(1,0),(0,1),(1,2),(2,2);
/*!40000 ALTER TABLE `plan_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_nutricionista` int unsigned NOT NULL,
  `id_paciente` int unsigned NOT NULL,
  `estado_solicitud` varchar(45) DEFAULT NULL,
  KEY `fk_solicitud_paciente_idx` (`id_paciente`),
  KEY `fk_solicitud_nutricionista_idx` (`id_nutricionista`),
  CONSTRAINT `fk_solicitud_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`matricula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_solicitud_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (0,4124412,'confirmada'),(55555,4124412,'pendiente'),(55555,4124412,'rechazada'),(12312,4124412,'confirmada'),(12312,2222222,'pendiente'),(55555,2222222,'rechazada');
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_unidad_medida`),
  UNIQUE KEY `id_unidad_medida_UNIQUE` (`id_unidad_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (0,'gramos'),(1,'unidades'),(2,'filetes');
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

-- Dump completed on 2020-07-14 11:15:14

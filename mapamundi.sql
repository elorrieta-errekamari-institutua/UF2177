CREATE DATABASE  IF NOT EXISTS `mapamundi` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mapamundi`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mapamundi
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `continente`
--

DROP TABLE IF EXISTS `continente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continente` (
  `continente_id` tinyint(1) NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`continente_id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continente`
--

LOCK TABLES `continente` WRITE;
/*!40000 ALTER TABLE `continente` DISABLE KEYS */;
INSERT INTO `continente` VALUES (3,'Afrika'),(4,'America'),(2,'Asia'),(1,'Europa'),(5,'Oceania');
/*!40000 ALTER TABLE `continente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curiosidad`
--

DROP TABLE IF EXISTS `curiosidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curiosidad` (
  `curiosidad_id` int NOT NULL,
  `texto` mediumtext CHARACTER SET utf8 COLLATE utf8_bin,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`curiosidad_id`),
  KEY `fk_curiosidad_pais1_idx` (`pais_id`),
  CONSTRAINT `fk_curiosidad_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curiosidad`
--

LOCK TABLES `curiosidad` WRITE;
/*!40000 ALTER TABLE `curiosidad` DISABLE KEYS */;
INSERT INTO `curiosidad` VALUES (1,'pLOCIA mONTADA EN CABALLOS',3),(2,'rima con colonia',5),(3,'Buenos coches',6),(4,'Desayunan cerveza',6),(5,'solo pasta',1),(6,'paella',2),(7,'calles de agua',4),(8,'colonia polonia',5),(9,'Petroleo',7),(10,'Piramides',9),(11,'Picante',10);
/*!40000 ALTER TABLE `curiosidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `pais_id` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `continente_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`pais_id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_pais_continente_idx` (`continente_id`),
  CONSTRAINT `fk_pais_continente` FOREIGN KEY (`continente_id`) REFERENCES `continente` (`continente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Italia',1),(2,'España',1),(3,'Canada',3),(4,'Paises Bajos',1),(5,'Polonia',1),(6,'Alemania',1),(7,'Nigeria',3),(8,'Congo',3),(9,'Egipto',3),(10,'Mexico',4),(11,'Australia',5),(12,'Nueva Zelanda',5),(13,'China',2),(14,'Japon',2);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais_religion`
--

DROP TABLE IF EXISTS `pais_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais_religion` (
  `pais_id` int NOT NULL,
  `religion_id` int NOT NULL,
  PRIMARY KEY (`pais_id`,`religion_id`),
  KEY `fk_pais_has_religion_religion1_idx` (`religion_id`),
  KEY `fk_pais_has_religion_pais1_idx` (`pais_id`),
  CONSTRAINT `fk_pais_has_religion_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`),
  CONSTRAINT `fk_pais_has_religion_religion1` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`religion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais_religion`
--

LOCK TABLES `pais_religion` WRITE;
/*!40000 ALTER TABLE `pais_religion` DISABLE KEYS */;
INSERT INTO `pais_religion` VALUES (2,1),(3,1),(2,3),(6,3),(3,5);
/*!40000 ALTER TABLE `pais_religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `religion` (
  `religion_id` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`religion_id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religion`
--

LOCK TABLES `religion` WRITE;
/*!40000 ALTER TABLE `religion` DISABLE KEYS */;
INSERT INTO `religion` VALUES (1,'Catolica'),(4,'Indu'),(2,'Islam'),(5,'Laica'),(3,'Protestante');
/*!40000 ALTER TABLE `religion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-09  9:57:00

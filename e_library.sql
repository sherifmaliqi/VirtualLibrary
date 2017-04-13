-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: e_library
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresa` (
  `adresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `rruga` varchar(50) NOT NULL,
  `numri_i_rruges` int(11) DEFAULT NULL,
  `qyteti` varchar(50) NOT NULL,
  `shteti` varchar(40) NOT NULL,
  `zip` int(11) NOT NULL,
  PRIMARY KEY (`adresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autori`
--

DROP TABLE IF EXISTS `autori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autori` (
  `autori_id` int(11) NOT NULL AUTO_INCREMENT,
  `emri` varchar(100) NOT NULL,
  `mosha` int(11) NOT NULL,
  `adresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`autori_id`),
  KEY `adresa_id` (`adresa_id`),
  CONSTRAINT `autori_ibfk_1` FOREIGN KEY (`adresa_id`) REFERENCES `adresa` (`adresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori`
--

LOCK TABLES `autori` WRITE;
/*!40000 ALTER TABLE `autori` DISABLE KEYS */;
/*!40000 ALTER TABLE `autori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoria`
--

DROP TABLE IF EXISTS `kategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategoria` (
  `kategoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `emri` varchar(40) NOT NULL,
  PRIMARY KEY (`kategoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoria`
--

LOCK TABLES `kategoria` WRITE;
/*!40000 ALTER TABLE `kategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libri`
--

DROP TABLE IF EXISTS `libri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libri` (
  `libri_id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(14) NOT NULL,
  `titulli` varchar(50) NOT NULL,
  `autori_id` int(11) NOT NULL,
  `viti_i_publikimit` int(11) NOT NULL,
  `shtepia_botuese_id` int(11) NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  PRIMARY KEY (`libri_id`),
  KEY `autori_id` (`autori_id`),
  KEY `shtepia_botuese_id` (`shtepia_botuese_id`),
  KEY `kategoria_id` (`kategoria_id`),
  CONSTRAINT `libri_ibfk_1` FOREIGN KEY (`autori_id`) REFERENCES `autori` (`autori_id`),
  CONSTRAINT `libri_ibfk_2` FOREIGN KEY (`shtepia_botuese_id`) REFERENCES `shtepia_botuese` (`shtepia_botuese_id`),
  CONSTRAINT `libri_ibfk_3` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`kategoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libri`
--

LOCK TABLES `libri` WRITE;
/*!40000 ALTER TABLE `libri` DISABLE KEYS */;
/*!40000 ALTER TABLE `libri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perdoruesi`
--

DROP TABLE IF EXISTS `perdoruesi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perdoruesi` (
  `perdoruesi_id` int(11) NOT NULL AUTO_INCREMENT,
  `emri` varchar(100) NOT NULL,
  `mosha` int(11) NOT NULL,
  `adresa_id` int(11) NOT NULL,
  `privilegje_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `hash` varchar(300) NOT NULL,
  `salt` varchar(30) NOT NULL,
  PRIMARY KEY (`perdoruesi_id`),
  KEY `adresa_id` (`adresa_id`),
  KEY `privilegje_id` (`privilegje_id`),
  CONSTRAINT `perdoruesi_ibfk_1` FOREIGN KEY (`adresa_id`) REFERENCES `adresa` (`adresa_id`),
  CONSTRAINT `perdoruesi_ibfk_2` FOREIGN KEY (`privilegje_id`) REFERENCES `privilegje` (`privilegje_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perdoruesi`
--

LOCK TABLES `perdoruesi` WRITE;
/*!40000 ALTER TABLE `perdoruesi` DISABLE KEYS */;
/*!40000 ALTER TABLE `perdoruesi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegje`
--

DROP TABLE IF EXISTS `privilegje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegje` (
  `privilegje_id` int(11) NOT NULL AUTO_INCREMENT,
  `lloji_i_perdoruesit` varchar(50) NOT NULL,
  PRIMARY KEY (`privilegje_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegje`
--

LOCK TABLES `privilegje` WRITE;
/*!40000 ALTER TABLE `privilegje` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacioni`
--

DROP TABLE IF EXISTS `relacioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacioni` (
  `relacioni_id` int(11) NOT NULL AUTO_INCREMENT,
  `perdoruesi_id` int(11) NOT NULL,
  `libri_id` int(11) NOT NULL,
  PRIMARY KEY (`relacioni_id`),
  KEY `perdoruesi_id` (`perdoruesi_id`),
  KEY `libri_id` (`libri_id`),
  CONSTRAINT `relacioni_ibfk_1` FOREIGN KEY (`perdoruesi_id`) REFERENCES `perdoruesi` (`perdoruesi_id`),
  CONSTRAINT `relacioni_ibfk_2` FOREIGN KEY (`libri_id`) REFERENCES `libri` (`libri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacioni`
--

LOCK TABLES `relacioni` WRITE;
/*!40000 ALTER TABLE `relacioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shtepia_botuese`
--

DROP TABLE IF EXISTS `shtepia_botuese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shtepia_botuese` (
  `shtepia_botuese_id` int(11) NOT NULL AUTO_INCREMENT,
  `emri` varchar(40) NOT NULL,
  `adresa_id` int(11) NOT NULL,
  `pershkrimi` text,
  PRIMARY KEY (`shtepia_botuese_id`),
  KEY `adresa_id` (`adresa_id`),
  CONSTRAINT `shtepia_botuese_ibfk_1` FOREIGN KEY (`adresa_id`) REFERENCES `adresa` (`adresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shtepia_botuese`
--

LOCK TABLES `shtepia_botuese` WRITE;
/*!40000 ALTER TABLE `shtepia_botuese` DISABLE KEYS */;
/*!40000 ALTER TABLE `shtepia_botuese` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-12 20:20:09

-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: TOURISTAPP
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `ATRACCION`
--

DROP TABLE IF EXISTS `ATRACCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATRACCION` (
  `idAtraccion` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `imagen` mediumblob,
  `lat` float(10,6) DEFAULT NULL,
  `lng` float(10,6) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idAtraccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATRACCION`
--

LOCK TABLES `ATRACCION` WRITE;
/*!40000 ALTER TABLE `ATRACCION` DISABLE KEYS */;
INSERT INTO `ATRACCION` VALUES (1,'La Estrella de Puebla','La Estrella de Puebla es una Noria (Rueda de la Fortuna, Rueda de Observaci?n) tur?stica ubicada en la ciudad de Puebla de los Angeles a un costado del centro comercial Angel?polis en el llamado parque lineal.\n \nLa estrella de fue inaugurada el 22 de julio de 2013 por el gobernador Rafael Moreno Valle y  recibio el Record Guiness por ser la rueda de observaci?n transportable mas grande de latinoamerica.\n \nLa Estrella de Puebla, es una rueda de fabricaci?n alemana. Es el modelo R80XL , el cual es el mas grande de las ruedas transportables. Se le llama transportable porque en cualquier momento se puede desensamblar y colocar en otro lugar.',NULL,19.034416,-98.234589,'Av. Osa Mayor Esq.  Ni?os Heroes, Reserva Territorial Atlixc?yotl\nFrente al centro comercial Angel?polis\nPUEBLA, Puebla, 72810'),(2,'Catedral de Puebla','La Catedral Bas?lica de Puebla, como se conoce a la catedral de Nuestra Se?ora de la Inmaculada Concepci?n de acuerdo a su advocaci?n mariana, es la sede episcopal de la arquidi?cesis de Puebla. Es uno de las m?s importantes inmuebles del centro hist?rico declarado patrimonio de la humanidad. Tiene la prerrogativa de ser el primer templo suntuoso que bajo buenos dise?os se hizo en Am?rica, consagrada en 1649 se adelant? a la Metropolitana de M?xico que fue dedicada 1653.\n\nLa actual catedral de estilo herreriano, fue construida entre los siglos XVI y XVII, y substituy? a la anterior que existi? en lo que hoy es el atrio. Del inicio de su construcci?n en 1575 a su consagraci?n trascurrieron 74 a?os que se ubican durante el periodo de tres reyes de Espa?a, Felipe II, Felipe III y Felipe IV. Los contratiempos a lo largo de esos a?os permitieron numerosas modificaciones a la traza original. Para 1624 las obras se suspendieron en su totalidad hasta el arribo del obispo Juan de Palafox y Mendoza en julio de 1640, quien retom? las obras con decidido entusiasmo. Las nuevas reformas dieron una mayor elevaci?n a la nave central por encima de las procesionales permitiendo el paso de la luz natural y d?ndole un aspecto de estructura piramidal. Fue consagrada por el obispo Juan de Palafox y Mendoza el 18 de abril de 1649 sin haber sido totalmente terminada.',NULL,19.042894,-98.200516,'16 de Septiembre s/n,Centro,72000 Pue.');
/*!40000 ALTER TABLE `ATRACCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATRACCION_SUBCAT`
--

DROP TABLE IF EXISTS `ATRACCION_SUBCAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATRACCION_SUBCAT` (
  `refAtraccion` int(11) NOT NULL DEFAULT '0',
  `refSubcat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`refAtraccion`,`refSubcat`),
  KEY `refSubcat` (`refSubcat`),
  CONSTRAINT `ATRACCION_SUBCAT_ibfk_1` FOREIGN KEY (`refAtraccion`) REFERENCES `ATRACCION` (`idAtraccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ATRACCION_SUBCAT_ibfk_2` FOREIGN KEY (`refSubcat`) REFERENCES `SUBCATEGORIA` (`idSub`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATRACCION_SUBCAT`
--

LOCK TABLES `ATRACCION_SUBCAT` WRITE;
/*!40000 ALTER TABLE `ATRACCION_SUBCAT` DISABLE KEYS */;
INSERT INTO `ATRACCION_SUBCAT` VALUES (1,1),(2,4);
/*!40000 ALTER TABLE `ATRACCION_SUBCAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIA` (
  `idCat` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(20) DEFAULT NULL,
  `imagen` mediumblob,
  PRIMARY KEY (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,'Arte',NULL),(2,'Arquitectura',NULL),(3,'Historia',NULL),(4,'Deportes',NULL);
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CIUDAD`
--

DROP TABLE IF EXISTS `CIUDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CIUDAD` (
  `idCiudad` int(11) NOT NULL DEFAULT '0',
  `refEstado` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `d_simple` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `refEstado` (`refEstado`),
  CONSTRAINT `CIUDAD_ibfk_1` FOREIGN KEY (`refEstado`) REFERENCES `ESTADO` (`idEstado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CIUDAD`
--

LOCK TABLES `CIUDAD` WRITE;
/*!40000 ALTER TABLE `CIUDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CIUDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIA`
--

DROP TABLE IF EXISTS `DIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIA` (
  `idDia` int(11) NOT NULL DEFAULT '0',
  `nombre` enum('domingo','lunes','martes','miercoles','jueves','viernes','sabado') DEFAULT NULL,
  PRIMARY KEY (`idDia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIA`
--

LOCK TABLES `DIA` WRITE;
/*!40000 ALTER TABLE `DIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTADO`
--

DROP TABLE IF EXISTS `ESTADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTADO` (
  `idEstado` int(11) NOT NULL DEFAULT '0',
  `refPais` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `refPais` (`refPais`),
  CONSTRAINT `ESTADO_ibfk_1` FOREIGN KEY (`refPais`) REFERENCES `PAIS` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTADO`
--

LOCK TABLES `ESTADO` WRITE;
/*!40000 ALTER TABLE `ESTADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ESTADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTO`
--

DROP TABLE IF EXISTS `EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENTO` (
  `idEvento` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `imagen` mediumblob,
  `lat` float(10,6) DEFAULT NULL,
  `lng` float(10,6) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTO`
--

LOCK TABLES `EVENTO` WRITE;
/*!40000 ALTER TABLE `EVENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTO_SUBCAT`
--

DROP TABLE IF EXISTS `EVENTO_SUBCAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENTO_SUBCAT` (
  `refEvento` int(11) NOT NULL DEFAULT '0',
  `refSubcat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`refEvento`,`refSubcat`),
  KEY `refSubcat` (`refSubcat`),
  CONSTRAINT `EVENTO_SUBCAT_ibfk_1` FOREIGN KEY (`refEvento`) REFERENCES `EVENTO` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVENTO_SUBCAT_ibfk_2` FOREIGN KEY (`refSubcat`) REFERENCES `SUBCATEGORIA` (`idSub`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTO_SUBCAT`
--

LOCK TABLES `EVENTO_SUBCAT` WRITE;
/*!40000 ALTER TABLE `EVENTO_SUBCAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENTO_SUBCAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FECHA`
--

DROP TABLE IF EXISTS `FECHA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FECHA` (
  `idFecha` int(11) NOT NULL DEFAULT '0',
  `refEvento` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idFecha`),
  KEY `refEvento` (`refEvento`),
  CONSTRAINT `FECHA_ibfk_1` FOREIGN KEY (`refEvento`) REFERENCES `EVENTO` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FECHA`
--

LOCK TABLES `FECHA` WRITE;
/*!40000 ALTER TABLE `FECHA` DISABLE KEYS */;
/*!40000 ALTER TABLE `FECHA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GALERIA_ATRACCION`
--

DROP TABLE IF EXISTS `GALERIA_ATRACCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GALERIA_ATRACCION` (
  `idGaleria_Atraccion` int(11) NOT NULL DEFAULT '0',
  `refAtraccion` int(11) DEFAULT NULL,
  `imagen` mediumblob,
  PRIMARY KEY (`idGaleria_Atraccion`),
  KEY `refAtraccion` (`refAtraccion`),
  CONSTRAINT `GALERIA_ATRACCION_ibfk_1` FOREIGN KEY (`refAtraccion`) REFERENCES `ATRACCION` (`idAtraccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GALERIA_ATRACCION`
--

LOCK TABLES `GALERIA_ATRACCION` WRITE;
/*!40000 ALTER TABLE `GALERIA_ATRACCION` DISABLE KEYS */;
/*!40000 ALTER TABLE `GALERIA_ATRACCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GALERIA_CIUDAD`
--

DROP TABLE IF EXISTS `GALERIA_CIUDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GALERIA_CIUDAD` (
  `idGaleria_Ciudad` int(11) NOT NULL DEFAULT '0',
  `refCiudad` int(11) DEFAULT NULL,
  `imagen` mediumblob,
  PRIMARY KEY (`idGaleria_Ciudad`),
  KEY `refCiudad` (`refCiudad`),
  CONSTRAINT `GALERIA_CIUDAD_ibfk_1` FOREIGN KEY (`refCiudad`) REFERENCES `CIUDAD` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GALERIA_CIUDAD`
--

LOCK TABLES `GALERIA_CIUDAD` WRITE;
/*!40000 ALTER TABLE `GALERIA_CIUDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `GALERIA_CIUDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HORARIO`
--

DROP TABLE IF EXISTS `HORARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HORARIO` (
  `idHorario` int(11) NOT NULL DEFAULT '0',
  `refAtraccion` int(11) DEFAULT NULL,
  `refDia` int(11) DEFAULT NULL,
  `horaInicio` int(11) DEFAULT NULL,
  `minInicio` int(11) DEFAULT NULL,
  `horaFin` int(11) DEFAULT NULL,
  `minFin` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `refDia` (`refDia`),
  CONSTRAINT `HORARIO_ibfk_1` FOREIGN KEY (`refDia`) REFERENCES `DIA` (`idDia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HORARIO`
--

LOCK TABLES `HORARIO` WRITE;
/*!40000 ALTER TABLE `HORARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `HORARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INFO_ATRACCION`
--

DROP TABLE IF EXISTS `INFO_ATRACCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INFO_ATRACCION` (
  `imagen` mediumblob,
  `idInfo` int(11) DEFAULT NULL,
  `refAtraccion` int(11) DEFAULT NULL,
  `descripcion` text,
  KEY `refAtraccion` (`refAtraccion`),
  CONSTRAINT `INFO_ATRACCION_ibfk_1` FOREIGN KEY (`refAtraccion`) REFERENCES `ATRACCION` (`idAtraccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFO_ATRACCION`
--

LOCK TABLES `INFO_ATRACCION` WRITE;
/*!40000 ALTER TABLE `INFO_ATRACCION` DISABLE KEYS */;
/*!40000 ALTER TABLE `INFO_ATRACCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIS`
--

DROP TABLE IF EXISTS `PAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAIS` (
  `idPais` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIS`
--

LOCK TABLES `PAIS` WRITE;
/*!40000 ALTER TABLE `PAIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUBCATEGORIA`
--

DROP TABLE IF EXISTS `SUBCATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUBCATEGORIA` (
  `idSub` int(11) NOT NULL DEFAULT '0',
  `refCat` int(11) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idSub`),
  KEY `refCat` (`refCat`),
  CONSTRAINT `SUBCATEGORIA_ibfk_1` FOREIGN KEY (`refCat`) REFERENCES `CATEGORIA` (`idCat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBCATEGORIA`
--

LOCK TABLES `SUBCATEGORIA` WRITE;
/*!40000 ALTER TABLE `SUBCATEGORIA` DISABLE KEYS */;
INSERT INTO `SUBCATEGORIA` VALUES (1,1,'Cine'),(2,1,'Artes plasticas'),(3,1,'Teatro'),(4,4,'Basquetbol'),(5,4,'Futbol');
/*!40000 ALTER TABLE `SUBCATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `nombre` varchar(100) DEFAULT NULL,
  `imagen` mediumblob,
  `mail` varchar(50) NOT NULL DEFAULT '',
  `contrasena` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO_SUBCAT`
--

DROP TABLE IF EXISTS `USUARIO_SUBCAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO_SUBCAT` (
  `refUsuario` varchar(50) NOT NULL DEFAULT '',
  `refSubcat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`refUsuario`,`refSubcat`),
  KEY `refSubcat` (`refSubcat`),
  CONSTRAINT `USUARIO_SUBCAT_ibfk_1` FOREIGN KEY (`refUsuario`) REFERENCES `USUARIO` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USUARIO_SUBCAT_ibfk_2` FOREIGN KEY (`refSubcat`) REFERENCES `SUBCATEGORIA` (`idSub`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_SUBCAT`
--

LOCK TABLES `USUARIO_SUBCAT` WRITE;
/*!40000 ALTER TABLE `USUARIO_SUBCAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_SUBCAT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-16 15:54:09

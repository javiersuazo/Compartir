-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: asociacionCompartir
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
-- Table structure for table `accedes`
--

DROP TABLE IF EXISTS `accedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accedes` (
  `idUsuario` varchar(20) NOT NULL,
  `idModulo` varchar(5) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idModulo`),
  KEY `idModulo` (`idModulo`),
  CONSTRAINT `accedes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accedes_ibfk_2` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accedes`
--

LOCK TABLES `accedes` WRITE;
/*!40000 ALTER TABLE `accedes` DISABLE KEYS */;
INSERT INTO `accedes` VALUES ('Administrador01','A0001'),('Educador06','A0002'),('Educador03','A0003'),('Educador08','A0003'),('Educador04','A0004'),('Educador07','A0004'),('Educador05','A0005'),('Educador06','A0005');
/*!40000 ALTER TABLE `accedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accidentes_sufridos`
--

DROP TABLE IF EXISTS `accidentes_sufridos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accidentes_sufridos` (
  `codigoExpediente` varchar(10) NOT NULL,
  `accidente` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`,`accidente`),
  CONSTRAINT `accidentes_sufridos_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_salud` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidentes_sufridos`
--

LOCK TABLES `accidentes_sufridos` WRITE;
/*!40000 ALTER TABLE `accidentes_sufridos` DISABLE KEYS */;
/*!40000 ALTER TABLE `accidentes_sufridos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente_salud`
--

DROP TABLE IF EXISTS `antecedente_salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente_salud` (
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `enfermedad` varchar(30) NOT NULL,
  PRIMARY KEY (`nombre`,`apellido`,`enfermedad`),
  CONSTRAINT `antecedente_salud_ibfk_1` FOREIGN KEY (`nombre`, `apellido`) REFERENCES `familiars` (`nombre`, `apellido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente_salud`
--

LOCK TABLES `antecedente_salud` WRITE;
/*!40000 ALTER TABLE `antecedente_salud` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedente_salud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apadrinas`
--

DROP TABLE IF EXISTS `apadrinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apadrinas` (
  `codigoNino` varchar(10) NOT NULL,
  `codigoPadrino` varchar(10) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaInterrupcion` date DEFAULT NULL,
  `tipoPadrinazgo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codigoNino`,`codigoPadrino`),
  KEY `codigoPadrino` (`codigoPadrino`),
  CONSTRAINT `apadrinas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`),
  CONSTRAINT `apadrinas_ibfk_2` FOREIGN KEY (`codigoPadrino`) REFERENCES `padrinos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apadrinas`
--

LOCK TABLES `apadrinas` WRITE;
/*!40000 ALTER TABLE `apadrinas` DISABLE KEYS */;
INSERT INTO `apadrinas` VALUES ('12008901','2711001','2001-11-10',NULL,'Padrinazgo Compartir'),('12008902','2711002','2002-08-12','2004-06-08','Padrinazgo Partage'),('12008903','2711003','1990-10-10',NULL,'Otro Padrinazgo');
/*!40000 ALTER TABLE `apadrinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficios`
--

DROP TABLE IF EXISTS `beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficios` (
  `codigoNino` varchar(10) NOT NULL,
  `tipoBeneficio` varchar(30) NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalle` text,
  `importe` decimal(11,2) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`codigoNino`,`tipoBeneficio`),
  CONSTRAINT `beneficios_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios`
--

LOCK TABLES `beneficios` WRITE;
/*!40000 ALTER TABLE `beneficios` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centros`
--

DROP TABLE IF EXISTS `centros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centros` (
  `nombre` varchar(30) NOT NULL,
  `sector` varchar(20) NOT NULL,
  `codigoAdministrador` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`sector`),
  KEY `codigoAdministrador` (`codigoAdministrador`),
  CONSTRAINT `centros_ibfk_1` FOREIGN KEY (`codigoAdministrador`) REFERENCES `educadors` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros`
--

LOCK TABLES `centros` WRITE;
/*!40000 ALTER TABLE `centros` DISABLE KEYS */;
INSERT INTO `centros` VALUES ('Villa Nueva','Sector 1','E00001'),('Villa Nueva','Sector 2','E00003'),('Los Pinos','Sector 1','E00005'),('Nueva Suyapa','Sector 1','E00007');
/*!40000 ALTER TABLE `centros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_viviendas`
--

DROP TABLE IF EXISTS `componente_viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componente_viviendas` (
  `codigoExpediente` varchar(10) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `revision` date NOT NULL,
  `condicion` varchar(7) NOT NULL,
  `observacion` text,
  PRIMARY KEY (`codigoExpediente`,`nombre`,`revision`),
  CONSTRAINT `componente_viviendas_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_viviendas` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_viviendas`
--

LOCK TABLES `componente_viviendas` WRITE;
/*!40000 ALTER TABLE `componente_viviendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente_viviendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educadors`
--

DROP TABLE IF EXISTS `educadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educadors` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `idUsuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `educadors_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educadors`
--

LOCK TABLES `educadors` WRITE;
/*!40000 ALTER TABLE `educadors` DISABLE KEYS */;
INSERT INTO `educadors` VALUES ('E00001','Luis','Medina','educador01'),('E00002','Carlos','Almendarez','educador02'),('E00003','Rosa','NuÃ±ez','educador03'),('E00004','Marilyn','Argueta','educador04'),('E00005','Carlos','Erazo','educador05'),('E00006','Carmen','Guzman','educador06'),('E00007','Reina','Flores','educador07'),('E00008','Josue','Rodriguez','educador08');
/*!40000 ALTER TABLE `educadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades`
--

DROP TABLE IF EXISTS `enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedades` (
  `codigoExpediente` varchar(10) NOT NULL,
  `enfermedad` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`,`enfermedad`),
  CONSTRAINT `enfermedades_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_salud` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades`
--

LOCK TABLES `enfermedades` WRITE;
/*!40000 ALTER TABLE `enfermedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esfamiliars`
--

DROP TABLE IF EXISTS `esfamiliars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esfamiliars` (
  `codigoNino` varchar(10) NOT NULL,
  `nombreFamiliar` varchar(30) NOT NULL,
  `apellidoFamiliar` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoNino`,`nombreFamiliar`,`apellidoFamiliar`),
  KEY `nombreFamiliar` (`nombreFamiliar`,`apellidoFamiliar`),
  CONSTRAINT `esfamiliars_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`),
  CONSTRAINT `esfamiliars_ibfk_2` FOREIGN KEY (`nombreFamiliar`, `apellidoFamiliar`) REFERENCES `familiars` (`nombre`, `apellido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esfamiliars`
--

LOCK TABLES `esfamiliars` WRITE;
/*!40000 ALTER TABLE `esfamiliars` DISABLE KEYS */;
INSERT INTO `esfamiliars` VALUES ('12008935','juan angel','hernandez perez');
/*!40000 ALTER TABLE `esfamiliars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_descriptivos`
--

DROP TABLE IF EXISTS `expediente_descriptivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_descriptivos` (
  `codigoExpediente` varchar(10) NOT NULL,
  `drogas` text,
  `fumador` tinyint(1) DEFAULT '0',
  `alcohol` tinyint(1) DEFAULT '0',
  `tatuajes` text,
  `descripcionAmigos` text,
  `descripcionActual` text,
  `descripcionActualAmigos` text,
  `observaciones` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_descriptivos_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_descriptivos`
--

LOCK TABLES `expediente_descriptivos` WRITE;
/*!40000 ALTER TABLE `expediente_descriptivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_descriptivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_educativo`
--

DROP TABLE IF EXISTS `expediente_educativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_educativo` (
  `codigoExpediente` varchar(10) NOT NULL,
  `descripcionNoAsistenciaPre` text,
  `edadIngresoPre` smallint(6) DEFAULT NULL,
  `edadEgresoPre` smallint(6) DEFAULT NULL,
  `nombrePrescolar` varchar(50) DEFAULT NULL,
  `edadIngresoPrim` smallint(6) DEFAULT NULL,
  `edadEgresoPrim` smallint(6) DEFAULT NULL,
  `nombrePrimaria` varchar(50) DEFAULT NULL,
  `descripcionNoAsistenciaPri` text,
  `clasesFavoritas` text,
  `descripcionesExpulsiones` text,
  `des_Inasistencia` text,
  `clasesDificultad` text,
  `oficio` varchar(50) DEFAULT NULL,
  `club` varchar(50) DEFAULT NULL,
  `diversion` text,
  `carrera` varchar(40) DEFAULT NULL,
  `cursoDiversificado` smallint(6) DEFAULT NULL,
  `cursoAprobado` smallint(6) DEFAULT NULL,
  `asisteSecundaria` tinyint(1) DEFAULT '0',
  `descripcionNoAsistenciaSecundaria` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_educativo_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_educativo`
--

LOCK TABLES `expediente_educativo` WRITE;
/*!40000 ALTER TABLE `expediente_educativo` DISABLE KEYS */;
INSERT INTO `expediente_educativo` VALUES ('EXP00001',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'EspaÃ±ol y Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00002',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'Ciencias Naturales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('EXP00003',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'Matematicas',NULL,NULL,'EspaÃ±ol',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00004',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'EspaÃ±ol',NULL,NULL,'Ciencias Naturales',NULL,NULL,NULL,NULL,NULL,3,0,NULL),('EXP00005',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('EXP00006',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'EspaÃ±ol y Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00007',NULL,4,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Estudios Sociales',NULL,NULL,'EspaÃ±ol',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00008',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Estudios Sociales',NULL,NULL,'InglÃ©s',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00009',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00010',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Civica',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00011',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'InglÃ©s',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00012',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00013',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00014',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00015',NULL,4,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'InglÃ©s',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00016',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00017',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00018',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00019',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('EXP00020',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,1,0,NULL),('EXP00021',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00022',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00023',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Civica',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00024',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'EducaciÃ³n Fisica',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00025','Falta de Recursos EconÃ³micos',NULL,NULL,NULL,6,12,'Melida Jesus MuÃ±os',NULL,'EspaÃ±ol y Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00026',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'EspaÃ±ol y Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00027',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00028',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00029',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'Civica',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00030',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Civica',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL),('EXP00031',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'Ciencias Naturales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00032',NULL,5,6,'LuciÃ©rnagas',6,12,'11 de Junio',NULL,'EspaÃ±ol',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00033',NULL,5,6,'Abejitas',6,12,'Naciones Unidas',NULL,'Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00034',NULL,5,6,'Nuevo Amanecer',6,12,'Naciones Unidas',NULL,'Civica',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('EXP00035',NULL,5,6,'Casa Feliz',6,12,'Melida Jesus MuÃ±os',NULL,'EspaÃ±ol y Estudios Sociales',NULL,NULL,'MatemÃ¡ticas',NULL,NULL,NULL,NULL,NULL,2,0,NULL);
/*!40000 ALTER TABLE `expediente_educativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_familiar`
--

DROP TABLE IF EXISTS `expediente_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_familiar` (
  `codigoExpediente` varchar(10) NOT NULL,
  `familiaMaterna` text,
  `entreHermanos` text,
  `entreHijos` text,
  `familiaPaterna` text,
  `padreHijo` text,
  `padres` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_familiar_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_familiar`
--

LOCK TABLES `expediente_familiar` WRITE;
/*!40000 ALTER TABLE `expediente_familiar` DISABLE KEYS */;
INSERT INTO `expediente_familiar` VALUES ('EXP00001','Buenas',NULL,'Buenas','Buenas','Buenas','Buenas'),('EXP00002','Buenas','Regular','Buenas','Buenas','Buenas','Buenas'),('EXP00003','Buenas','Buenas','Regular','Buenas','Buenas','Buenas'),('EXP00004','Buenas',NULL,'Buenas','Buenas','Buenas','Buenas'),('EXP00005','Buenas',NULL,'Buenas','Regular','Buenas','Buenas'),('EXP00006','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00007','Buenas','Buenas','Regular','Buenas','Conflicto','Regular'),('EXP00008','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00009','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00010','Conflicto','Buenas','Buenas','Regular','Buenas','Conflicto'),('EXP00011','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00012','Buenas',NULL,'Buenas','Buenas','Buenas','Buenas'),('EXP00013','Buenas',NULL,'Buenas','Regular','Buenas','Buenas'),('EXP00014','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00015','Buenas','Buenas','conflicto','Buenas','Regular','Buenas'),('EXP00016','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00017','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00018','Buenas','Buenas','Buenas','Regular','Buenas','Buenas'),('EXP00019','Buenas','Regular','Buenas','Buenas','Conflicto','Conflicto'),('EXP00020','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00021','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00022','Buenas','Regular','Buenas','Buenas','Buenas','Buenas'),('EXP00023','Buenas','Buenas','Conflicto','Buenas','Buenas','Buenas'),('EXP00024','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00025','Buenas','Buenas','Buenas','Regular','Conflicto','Conflicto'),('EXP00026','Buenas','Regular','Buenas','Buenas','Buenas','Buenas'),('EXP00027','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00028','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00029','Buenas','Buenas','Buenas','Conflicto','Buenas','Buenas'),('EXP00030','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00031','Buenas','Buenas','Buenas','Buenas','Buenas','Conflicto'),('EXP00032','Buenas','Buenas','Buenas','Buenas','Buenas','Buenas'),('EXP00033','Buenas','Buenas','Buenas','Buenas','Buenas','Regular'),('EXP00034','Buenas',NULL,NULL,'Buenas','Conflicto','Conflicto'),('EXP00035','Buenas',NULL,NULL,'Regular',NULL,NULL);
/*!40000 ALTER TABLE `expediente_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_juridico`
--

DROP TABLE IF EXISTS `expediente_juridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_juridico` (
  `codigoExpediente` varchar(10) NOT NULL,
  `inscritoRNP` tinyint(1) DEFAULT '1',
  `reconodicoPor` varchar(15) DEFAULT NULL,
  `maltratoFisico` text,
  `contactoEmergencia` varchar(60) DEFAULT NULL,
  `problemaSobreNombre` tinyint(1) DEFAULT '0',
  `descripcionNoInscrito` text,
  `maltratadoPor` text,
  `victimaViolacion` tinyint(1) DEFAULT NULL,
  `auxilioExterno` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_juridico_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_juridico`
--

LOCK TABLES `expediente_juridico` WRITE;
/*!40000 ALTER TABLE `expediente_juridico` DISABLE KEYS */;
INSERT INTO `expediente_juridico` VALUES ('EXP00001',0,'Ambos padres','No','Rosa Sagastume 33660577',0,NULL,NULL,0,NULL),('EXP00002',0,'Madre','No','Maria Sorto 33660577',0,NULL,NULL,0,NULL),('EXP00003',0,'Ambos padres','No','Alex Sorto 33660577',0,NULL,NULL,0,NULL),('EXP00004',0,'Ambos padres','No','Pedro Guzman 33660577',0,NULL,NULL,0,NULL),('EXP00005',0,'Padrastro','No','Mirna Carranza 33660577',0,NULL,NULL,0,NULL),('EXP00006',0,'Ambos padres','No','Ismael Salinas 33660577',0,NULL,NULL,0,NULL),('EXP00007',0,'Ambos padres','Si','Teresa 33660577',0,NULL,'Padre',0,'Vecino Mario Henriquez'),('EXP00008',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00009',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00010',0,'Madre','No',NULL,0,NULL,NULL,0,NULL),('EXP00011',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00012',0,'Abuelos','No',NULL,0,NULL,NULL,0,NULL),('EXP00013',0,'Madre','No',NULL,0,NULL,NULL,0,NULL),('EXP00014',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00015',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00016',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00017',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00018',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00019',0,'Padrastro','Si',NULL,0,NULL,'Madre y Padre',0,'Vecina Ana Pineda'),('EXP00020',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00021',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00022',0,'Madre','No','Rosa Sagastume 33660577',0,NULL,NULL,0,NULL),('EXP00023',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00024',0,'Ambos padres','No','Mario Mendoza 28660577',0,NULL,NULL,0,NULL),('EXP00025',0,'Madre','Si',NULL,0,NULL,'Madre',0,'Familiar Carlos Perez'),('EXP00026',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00027',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00028',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00029',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00030',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00031',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00032',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00033',0,'Ambos padres','No',NULL,0,NULL,NULL,0,NULL),('EXP00034',0,'Ambos padres','Si',NULL,0,NULL,'Padre',0,'Vecina MarÃ­a Zepeda'),('EXP00035',0,'Abuelos','No','Rosa Sagastume 33660577',0,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `expediente_juridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_salud`
--

DROP TABLE IF EXISTS `expediente_salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_salud` (
  `codigoExpediente` varchar(10) NOT NULL,
  `TipoParto` varchar(30) DEFAULT NULL,
  `TipoNacimiento` varchar(30) DEFAULT NULL,
  `EmbarazoControlado` tinyint(1) DEFAULT '1',
  `SaludActual` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_salud_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_salud`
--

LOCK TABLES `expediente_salud` WRITE;
/*!40000 ALTER TABLE `expediente_salud` DISABLE KEYS */;
INSERT INTO `expediente_salud` VALUES ('EXP00001','Hospital','Normal',0,'Bien, confortable'),('EXP00002','Hospital','Normal',0,'Bien, confortable'),('EXP00003','Hospital','CesÃ¡rea',0,'Bien, confortable'),('EXP00004','Hospital','Normal',0,'Bien, confortable'),('EXP00005','Hospital','Normal',0,'Bien, confortable'),('EXP00006','Hospital','Normal',0,'Bien, confortable'),('EXP00007','Hospital','Normal',0,'Bien, confortable'),('EXP00008','Casa','Normal',0,'Bien, confortable'),('EXP00009','Hospital','Normal',0,'Bien, confortable'),('EXP00010','Hospital','Normal',0,'Bien, confortable'),('EXP00011','Hospital','Normal',0,'Bien, confortable'),('EXP00012','Hospital','Normal',0,'Bien, confortable'),('EXP00013','Hospital','Normal',0,'Bien, confortable'),('EXP00014','Hospital','CesÃ¡rea',0,'Bien, confortable'),('EXP00015','Hospital','Normal',0,'Bien, confortable'),('EXP00016','Hospital','Normal',0,'Bien, confortable'),('EXP00017','Hospital','Normal',0,'Bien, confortable'),('EXP00018','Casa','Normal',0,'Bien, confortable'),('EXP00019','Hospital','Normal',0,'Bien, confortable'),('EXP00020','Hospital','Normal',0,'Bien, confortable'),('EXP00021','Hospital','Normal',0,'Bien, confortable'),('EXP00022','Hospital','Normal',0,'Bien, confortable'),('EXP00023','Hospital','Normal',0,'Regular con problemas respiratorios'),('EXP00024','Hospital','FÃ³rceps',0,'Bien, confortable'),('EXP00025','Hospital','Normal',0,'Bien, confortable'),('EXP00026','Hospital','Normal',0,'Bien, confortable'),('EXP00027','Hospital','Normal',0,'Bien, confortable'),('EXP00028','Hospital','FÃ³rceps',0,'Bien, confortable'),('EXP00029','Hospital','Normal',0,'Bien, confortable'),('EXP00030','Hospital','Normal',0,'Bien, confortable'),('EXP00032','Hospital','Normal',0,'Bien, confortable'),('EXP00033','Hospital','Normal',0,'Bien, confortable'),('EXP00034','Hospital','CesÃ¡rea',0,'Bien, confortable'),('EXP00035','Hospital','Normal',0,'Bien, confortable');
/*!40000 ALTER TABLE `expediente_salud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_trabajo`
--

DROP TABLE IF EXISTS `expediente_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_trabajo` (
  `codigoExpediente` varchar(10) NOT NULL,
  `empleador` varchar(25) DEFAULT NULL,
  `lugarTrabajo` varchar(50) DEFAULT NULL,
  `formaPago` varchar(7) DEFAULT NULL,
  `contrato` varchar(30) DEFAULT NULL,
  `diasLaborales` varchar(15) DEFAULT NULL,
  `horaEntrada` time DEFAULT NULL,
  `horaSalida` time DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `trabajoPeligroso` tinyint(1) DEFAULT '0',
  `acompanante` varchar(50) DEFAULT NULL,
  `motivosAbandonoHogar` text,
  `relacionesCompaneros` text,
  `aspiraciones` text,
  `habilidades` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_trabajo_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_trabajo`
--

LOCK TABLES `expediente_trabajo` WRITE;
/*!40000 ALTER TABLE `expediente_trabajo` DISABLE KEYS */;
INSERT INTO `expediente_trabajo` VALUES ('EXP00001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00014','Jose Ferrero','Empacadora Universal','Efectiv','Ocasional',NULL,NULL,NULL,'180.00',0,'Solo','Pobreza','Buena','Terminar la Secundaria',NULL),('EXP00015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00017',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00019',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00020',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00022',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00023',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00024',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00025',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00026',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00027',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00028','Camila Galindo','Textiles Omega','Mensual','Temporal','6','07:00:00','17:00:00','3500.00',0,'Solo','Pobreza','Regular','Obtener un mejor trabajo',NULL),('EXP00029',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00030',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00031',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00032',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00033',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00034',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('EXP00035',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `expediente_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_viviendas`
--

DROP TABLE IF EXISTS `expediente_viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_viviendas` (
  `codigoExpediente` varchar(10) NOT NULL,
  `cantidadCuartos` smallint(6) DEFAULT NULL,
  `material` varchar(40) DEFAULT NULL,
  `antiguedad` smallint(6) DEFAULT NULL,
  `propietario` varchar(30) DEFAULT NULL,
  `luz` varchar(15) DEFAULT NULL,
  `agua` varchar(15) DEFAULT NULL,
  `direccion` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_viviendas_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_viviendas`
--

LOCK TABLES `expediente_viviendas` WRITE;
/*!40000 ALTER TABLE `expediente_viviendas` DISABLE KEYS */;
INSERT INTO `expediente_viviendas` VALUES ('EXP00035',2,'madera',2,NULL,NULL,NULL,'Los pinos tres casas a la derecha de la pulpe de doÃ±a maria');
/*!40000 ALTER TABLE `expediente_viviendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedientes`
--

DROP TABLE IF EXISTS `expedientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expedientes` (
  `codigo` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `responsable` varchar(40) DEFAULT NULL,
  `codigoNino` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigoNino` (`codigoNino`),
  CONSTRAINT `expedientes_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedientes`
--

LOCK TABLES `expedientes` WRITE;
/*!40000 ALTER TABLE `expedientes` DISABLE KEYS */;
INSERT INTO `expedientes` VALUES ('EXP00001','2011-01-17','Luis Medina','12008901'),('EXP00002','2011-01-17','Carlos Almendarez','12008902'),('EXP00003','2011-01-17','Carlos Almendarez','12008903'),('EXP00004','2011-01-17','Luis Medina','12008904'),('EXP00005','2011-01-17','Luis Medina','12008905'),('EXP00006','2011-01-17','Rosa NuÃ±ez','12008906'),('EXP00007','2011-01-17','Rosa NuÃ±ez','12008907'),('EXP00008','2011-01-17','Marylin Argueta','12008908'),('EXP00009','2011-01-17','Rosa NuÃ±ez','12008909'),('EXP00010','2011-01-17','Marylin Argueta','12008910'),('EXP00011','2011-01-17','Carlos Erazo','12008911'),('EXP00012','2011-01-17','Carlos Erazo','12008912'),('EXP00013','2011-01-17','Carmen Guzman','12008913'),('EXP00014','2011-01-17','Carmen Guzman','12008914'),('EXP00015','2011-01-17','Carlos Erazo','12008915'),('EXP00016','2011-01-17','Reina Flores','12008916'),('EXP00017','2011-01-17','Reina Flores','12008917'),('EXP00018','2011-01-17','Josue Rodriguez','12008918'),('EXP00019','2011-01-17','Josue Rodriguez','12008919'),('EXP00020','2011-01-17','Reina Flores','12008920'),('EXP00021','2011-01-17','Luis Medina','12008921'),('EXP00022','2011-01-17','Carlos Almendarez','12008922'),('EXP00023','2011-01-17','Rosa NuÃ±ez','12008923'),('EXP00024','2011-01-17','Marylin Argueta','12008924'),('EXP00025','2011-01-17','Carlos Erazo','12008925'),('EXP00026','2011-01-17','Carmen Guzman','12008926'),('EXP00027','2011-01-17','Reina Flores','12008927'),('EXP00028','2011-01-17','Josue Rodriguez','12008928'),('EXP00029','2011-01-17','Carlos Almendarez','12008929'),('EXP00030','2011-01-17','Marylin Argueta','12008930'),('EXP00031','2011-01-17','Carlos Erazo','12008931'),('EXP00032','2011-01-17','Reina Flores','12008932'),('EXP00033','2011-01-17','Luis Medina','12008933'),('EXP00034','2011-01-17','Rosa NuÃ±ez','12008934'),('EXP00035','2011-01-17','Carmen Guzman','12008935');
/*!40000 ALTER TABLE `expedientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia_laboral` (
  `codigoExpediente` varchar(10) NOT NULL,
  `experiencia` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `experiencia_laboral_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_trabajo` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia_laboral`
--

LOCK TABLES `experiencia_laboral` WRITE;
/*!40000 ALTER TABLE `experiencia_laboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiencia_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiars`
--

DROP TABLE IF EXISTS `familiars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familiars` (
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `ocupacion` varchar(25) DEFAULT NULL,
  `salud` varchar(50) DEFAULT NULL,
  `salario` decimal(11,2) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `fechaAct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estadoCivil` varchar(15) DEFAULT NULL,
  `parentesco` varchar(15) DEFAULT NULL,
  `lugarTrabajo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`apellido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiars`
--

LOCK TABLES `familiars` WRITE;
/*!40000 ALTER TABLE `familiars` DISABLE KEYS */;
INSERT INTO `familiars` VALUES ('juan angel','hernandez perez','ebanistero','bien','5000.00',NULL,'2011-03-15 00:22:04','casado','padre','propio');
/*!40000 ALTER TABLE `familiars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_trabajo`
--

DROP TABLE IF EXISTS `gastos_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos_trabajo` (
  `codigoExpediente` varchar(10) NOT NULL,
  `gastos` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `gastos_trabajo_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_trabajo` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_trabajo`
--

LOCK TABLES `gastos_trabajo` WRITE;
/*!40000 ALTER TABLE `gastos_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historials`
--

DROP TABLE IF EXISTS `historials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historials` (
  `codigoNino` varchar(10) NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `foto` longblob,
  `descripcion` mediumtext,
  PRIMARY KEY (`codigoNino`,`fecha`),
  CONSTRAINT `historials_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historials`
--

LOCK TABLES `historials` WRITE;
/*!40000 ALTER TABLE `historials` DISABLE KEYS */;
/*!40000 ALTER TABLE `historials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
  `id` varchar(5) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES ('A0001','Accesso completo a todo'),('A0002','acceso a propios ninos'),('A0003','acceso a los expedientes solamente'),('A0004','acceso a centros especificos'),('A0005','acceso a todos los centros');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ninos`
--

DROP TABLE IF EXISTS `ninos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ninos` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `estadoPadrinazgo` varchar(25) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `sexo` char(1) NOT NULL,
  `habitaCon` varchar(30) DEFAULT NULL,
  `nombreCentro` varchar(30) NOT NULL,
  `nombreSector` varchar(20) NOT NULL,
  `codigoEducador` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `nombreCentro` (`nombreCentro`,`nombreSector`),
  KEY `codigoEducador` (`codigoEducador`),
  CONSTRAINT `ninos_ibfk_1` FOREIGN KEY (`nombreCentro`, `nombreSector`) REFERENCES `centros` (`nombre`, `sector`) ON UPDATE CASCADE,
  CONSTRAINT `ninos_ibfk_2` FOREIGN KEY (`codigoEducador`) REFERENCES `educadors` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ninos`
--

LOCK TABLES `ninos` WRITE;
/*!40000 ALTER TABLE `ninos` DISABLE KEYS */;
INSERT INTO `ninos` VALUES ('12008901','Carlos AndrÃ©s','Rodriguez Martinez','Padrinazgo Partage','2000-12-01','m','Madre','Villa Nueva','Sector 1','E00001'),('12008902','Martha Maria','Pacheco Mendoza','Padrinazgo Partage','2001-11-04','f','Madre, Padre y 2 hermanos','Villa Nueva','Sector 1','E00002'),('12008903','Mario Alberto','Sierra OrdoÃ±ez','Padrinazgo Compartir','1996-10-10','m','Madre, Padre y 1 hemana','Villa Nueva','Sector 1','E00002'),('12008904','Monica Alejandra','Fiallos','Padrinazgo Compartir','2001-10-04','f','Madre y Padre','Villa Nueva','Sector 1','E00001'),('12008905','AndrÃ©s','Solorzano','Padrinazgo Partage','2002-01-21','m','Madre','Villa Nueva','Sector 1','E00001'),('12008906','Reina Elizabeth','Salinas','Padrinazgo Partage','2001-11-04','f','Madre, Padre y 3 hermanos','Villa Nueva','Sector 2','E00003'),('12008907','Angelica','Bustillo Mendoza','Padrinazgo Compartir','2001-01-14','f','Padre y 2 hermanos','Villa Nueva','Sector 2','E00003'),('12008908','Ellyven Gissell','Alvarenga','Por ingresar','2003-04-04','f','Madre, Padre y 3 hermanos','Villa Nueva','Sector 2','E00004'),('12008909','Francis Adelay','Ramirez Soto','Por ingresar','1998-05-12','f','Madre, Padre y 1 hermano','Villa Nueva','Sector 2','E00003'),('12008910','Clara MarÃ­a','Funez Miranda','Otro Padrinazgo','2003-06-11','f','Madre, 3 hermanos','Villa Nueva','Sector 2','E00004'),('12008911','Nory Gisell','Lara Paguoada','Padrinazgo Partage','1995-12-24','f','Padre y 4 hermanos','Los Pinos','Sector 1','E00005'),('12008912','Perla Karina','Brenez claros','Padrinazgo Compartir','2000-07-08','f','Madre','Los Pinos','Sector 1','E00005'),('12008913','Nanci MarÃ­a','Aguilar Centeno','Padrinazgo Compartir','1997-10-09','f','Padre','Los Pinos','Sector 1','E00006'),('12008914','Edwin Gabriel','HernÃ¡ndez Rivera','Otro Padrinazgo','1996-09-25','m','Madre y 1 hermano','Los Pinos','Sector 1','E00006'),('12008915','Modesto Alberto','Lagos Trochez','Por ingresar','2004-02-14','m','Madre y 3 hermanos','Los Pinos','Sector 1','E00005'),('12008916','Edgar Armando','Rodriguez Luna','Por ingresar','2001-01-06','m','Madre y Padre','Nueva Suyapa','Sector 1','E00007'),('12008917','Marco Antonio','NuÃ±ez Lagos','En interrupciÃ³n','2002-07-12','m','Madre y Padre','Nueva Suyapa','Sector 1','E00007'),('12008918','Alexy Amilcar','Perdomo Flores','En interrupciÃ³n','1998-12-01','m','Madre, Padre y 4 hermanos','Nueva Suyapa','Sector 1','E00008'),('12008919','MarÃ­a Luisa','Lobo Mendoza','Egresado','1991-12-13','f','Madre, Padre y 1 hermano','Nueva Suyapa','Sector 1','E00008'),('12008920','Aldo Adalberto','Ãvila Gomez','Padrinazgo Partage','1995-03-27','m','Madre, Padre y 2 hermanos','Nueva Suyapa','Sector 1','E00007'),('12008921','Eduardo Jose','PÃ©rez PÃ©rez','Padrinazgo Compartir','1999-10-11','m','Madre y 2 hermanos','Villa Nueva','Sector 1','E00001'),('12008922','Kevin Armando','Ãlvarez DurÃ³n','Padrinazgo Partage','2000-08-08','m','Madre, Padre y 5 hermanos','Villa Nueva','Sector 1','E00002'),('12008923','Miguel Alfonso','LÃ³pez Cabrera','Egresado','1992-01-03','m','Madre, Padre y 3 hermanos','Villa Nueva','Sector 2','E00003'),('12008924','Josue Francisco','Carrasco LÃ³pez','Padrinazgo Partage','1999-10-09','m','Madre, Padre y 1 hermana','Villa Nueva','Sector 2','E00004'),('12008925','Amanda del Carmen','Rendon Aguilar','Padrinazgo Partage','2001-01-19','f','Madre y 3 hermanos','Los Pinos','Sector 1','E00005'),('12008926','MarÃ­a Jose','Torres Vega','Egresado','1991-11-14','f','Madre, Padre y 3 hermanos','Los Pinos','Sector 1','E00006'),('12008927','Efrain Ernesto','Ramirez MejÃ­a','Propuesto para Egreso','1992-05-13','m','Madre, Padre y 3 hermanos','Nueva Suyapa','Sector 1','E00007'),('12008928','Bryan JosÃºe','Eguigure Rodriguez','Propuesto para Egreso','1993-05-01','m','Madre, Padre y 4 hermanos','Nueva Suyapa','Sector 1','E00008'),('12008929','Wendy Liseth','Aguilar Flores','Egresado','1992-09-27','f','Madre y 1 hermano','Villa Nueva','Sector 1','E00002'),('12008930','Mario JosÃ©','MartÃ­nez Aguilar','Padrinazgo Partage','2000-05-15','m','Madre y 4 hermanos','Villa Nueva','Sector 2','E00004'),('12008931','MarÃ­a de Jesus','Flores NÃºÃ±ez','Padrinazgo Compartir','2001-06-08','f','Padre y 3 hermanos','Los Pinos','Sector 1','E00005'),('12008932','Anderson Noriel','NÃºÃ±ez Perdomo','Padrinazgo Partage','2002-04-30','m','Madre, Padre y 1 hermano','Nueva Suyapa','Sector 1','E00007'),('12008933','Milly Gabriela','Villacorta Lopez','Padrinazgo Partage','2002-04-29','f','Madre, Padre, 2 hermanos y 1 s','Villa Nueva','Sector 1','E00001'),('12008934','German Fabricio','Serrano Gomez','Padrinazgo Partage','2001-03-28','m','Tia y Tio','Villa Nueva','Sector 2','E00003'),('12008935','Ilsy Yamilteh','GarcÃ­a Zambrano','Padrinazgo Partage','1997-01-23','f','Abuelo y Abuela','Los Pinos','Sector 1','E00006');
/*!40000 ALTER TABLE `ninos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ninosPorIngresar`
--

DROP TABLE IF EXISTS `ninosPorIngresar`;
/*!50001 DROP VIEW IF EXISTS `ninosPorIngresar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ninosPorIngresar` (
  `codigo` varchar(10),
  `nombre` varchar(50),
  `apellido` varchar(50),
  `estadoPadrinazgo` varchar(25),
  `fechaNac` date,
  `sexo` char(1),
  `habitaCon` varchar(30),
  `nombreCentro` varchar(30),
  `nombreSector` varchar(20),
  `codigoEducador` varchar(10)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `padrinos`
--

DROP TABLE IF EXISTS `padrinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `padrinos` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT NULL,
  `titulo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrinos`
--

LOCK TABLES `padrinos` WRITE;
/*!40000 ALTER TABLE `padrinos` DISABLE KEYS */;
INSERT INTO `padrinos` VALUES ('2711001','Luis Ramirez','HondureÃ±a','Sr'),('2711002','Isabelle Aubret','Francesa','Sra'),('2711003','Francois Audrain','Francesa','Sr'),('2711004','Charles Aznavour','Francesa','Sr'),('2711005','Dominique Badi','Francesa','Sr'),('2711006','Pierre Balavoine','Francesa','Sr'),('2711007','Jeane Aufray','Francesa','Sra'),('2711008','Lucienne Boyer','Francesa','Sr'),('2711009','Chevalier de Maurice','Francesa','Sr'),('2711010','Marie Dubas','Francesa','Sra'),('2711011','Maria Jose','Italiana','Sra.');
/*!40000 ALTER TABLE `padrinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participas`
--

DROP TABLE IF EXISTS `participas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participas` (
  `codigoNino` varchar(10) NOT NULL,
  `tipoPrograma` varchar(20) NOT NULL,
  `componentePrograma` varchar(30) NOT NULL,
  `fechaInic` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `resultado` text,
  PRIMARY KEY (`codigoNino`,`tipoPrograma`,`componentePrograma`),
  KEY `tipoPrograma` (`tipoPrograma`,`componentePrograma`),
  CONSTRAINT `participas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`),
  CONSTRAINT `participas_ibfk_2` FOREIGN KEY (`tipoPrograma`, `componentePrograma`) REFERENCES `programas` (`tipo`, `componente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participas`
--

LOCK TABLES `participas` WRITE;
/*!40000 ALTER TABLE `participas` DISABLE KEYS */;
INSERT INTO `participas` VALUES ('12008934','integracion','iglesia','2005-06-06','2005-10-10','participo en el coro'),('12008935','educacion','computacion','2003-10-10','2003-12-12','aprendio el uso de word');
/*!40000 ALTER TABLE `participas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problemas_congenitos`
--

DROP TABLE IF EXISTS `problemas_congenitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problemas_congenitos` (
  `codigoExpediente` varchar(10) NOT NULL,
  `problema` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`,`problema`),
  CONSTRAINT `problemas_congenitos_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_salud` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemas_congenitos`
--

LOCK TABLES `problemas_congenitos` WRITE;
/*!40000 ALTER TABLE `problemas_congenitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `problemas_congenitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `tipo` varchar(20) NOT NULL,
  `componente` varchar(30) NOT NULL,
  PRIMARY KEY (`tipo`,`componente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES ('educacion','biblioteca movil'),('educacion','computacion'),('educacion','reforzamiento escolar'),('educacion','taller '),('integracion','casa juventud arte'),('integracion','iglesia'),('participacion','reforestacion'),('participacion','Taller medio ambiente');
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110314002556'),('20110314002654'),('20110314004007'),('20110314004242');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacion_academicas`
--

DROP TABLE IF EXISTS `situacion_academicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacion_academicas` (
  `codigoNino` varchar(10) NOT NULL,
  `anio` char(4) NOT NULL,
  `grado` char(2) DEFAULT NULL,
  `indice` decimal(5,2) DEFAULT NULL,
  `observacion` text,
  `centro` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigoNino`,`anio`),
  CONSTRAINT `situacion_academicas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacion_academicas`
--

LOCK TABLES `situacion_academicas` WRITE;
/*!40000 ALTER TABLE `situacion_academicas` DISABLE KEYS */;
INSERT INTO `situacion_academicas` VALUES ('12008934','2009','5','80.00','le va bien en las clases','Jose Trinidad Reyes'),('12008935','2009','5','80.00','le va bien en las clases','Jose Trinidad Reyes'),('12008935','2010','6','78.00','le dificulta matematica','Luis Bogran'),('12008935','2011','7','78.00','le dificulta matematica','Luis Bogran');
/*!40000 ALTER TABLE `situacion_academicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_educadors`
--

DROP TABLE IF EXISTS `telefono_educadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono_educadors` (
  `codigoEducador` varchar(10) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  PRIMARY KEY (`codigoEducador`,`telefono`),
  CONSTRAINT `telefono_educadors_ibfk_1` FOREIGN KEY (`codigoEducador`) REFERENCES `educadors` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_educadors`
--

LOCK TABLES `telefono_educadors` WRITE;
/*!40000 ALTER TABLE `telefono_educadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono_educadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajos_anteriores`
--

DROP TABLE IF EXISTS `trabajos_anteriores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajos_anteriores` (
  `codigoExpediente` varchar(10) NOT NULL,
  `trabajos` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `trabajos_anteriores_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_trabajo` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajos_anteriores`
--

LOCK TABLES `trabajos_anteriores` WRITE;
/*!40000 ALTER TABLE `trabajos_anteriores` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajos_anteriores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` varchar(20) NOT NULL,
  `contrasena` varchar(40) NOT NULL,
  `acceso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Administrador01','4898d47432db938163b998f98ef796e1','2011-03-01 02:04:30'),('Administrador02','631b3307d7c2417c290bf149c2acacb6','2011-03-01 02:04:30'),('Educador01','d15e24d89c8a72a2ac57d0f0e1312075','2011-03-01 02:04:30'),('Educador02','5db9880611a877470756b5431a0759d8','2011-03-01 02:04:30'),('Educador03','4bc0a9afbc1ae9bfa030331e87e29102','2011-03-01 02:04:30'),('Educador04','952cfd67e0303758c5d551998e9bdb93','2011-03-01 02:04:30'),('Educador05','35630d60edf8ce2e659bddd0826cdb00','2011-03-01 02:04:30'),('Educador06','e37e1a186dcd4ed68f2338976e475a62','2011-03-01 02:04:30'),('Educador07','0d7b06a575ff251372923af6e8c73eb1','2011-03-01 02:04:30'),('Educador08','85fd41461eefa1ed04dd3a63e03b9a08','2011-03-01 02:04:30');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ninosPorIngresar`
--

/*!50001 DROP TABLE IF EXISTS `ninosPorIngresar`*/;
/*!50001 DROP VIEW IF EXISTS `ninosPorIngresar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ninosPorIngresar` AS (select `ninos`.`codigo` AS `codigo`,`ninos`.`nombre` AS `nombre`,`ninos`.`apellido` AS `apellido`,`ninos`.`estadoPadrinazgo` AS `estadoPadrinazgo`,`ninos`.`fechaNac` AS `fechaNac`,`ninos`.`sexo` AS `sexo`,`ninos`.`habitaCon` AS `habitaCon`,`ninos`.`nombreCentro` AS `nombreCentro`,`ninos`.`nombreSector` AS `nombreSector`,`ninos`.`codigoEducador` AS `codigoEducador` from `ninos` where (`ninos`.`estadoPadrinazgo` = 'Por Ingresar')) */;
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

-- Dump completed on 2011-03-14 19:18:28

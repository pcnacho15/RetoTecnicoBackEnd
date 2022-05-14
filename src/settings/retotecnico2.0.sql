-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: retotecnico
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Deporte'),(2,'Historia'),(3,'Arte'),(4,'Ciencia'),(5,'Geografía');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `premio` float DEFAULT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Cristian','Martinez',100000);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcion` (
  `id_opcion` int NOT NULL AUTO_INCREMENT,
  `opcion` text NOT NULL,
  `id_pregunta` int NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `id_pregunta` (`id_pregunta`),
  CONSTRAINT `opcion_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,'60 MINUTOS',1),(2,'120 MINUTOS',1),(3,'80 MINUTOS',1),(4,'20 MINUTOS',2),(5,'15 MINUTOS',2),(6,'35 MINUTOS',2),(7,'ARGENTINA',3),(8,'ALEMANIA',3),(9,'FRANCIA',3),(10,'THE EAGLES',4),(11,'THE HAWKS',4),(12,'THE DEVILS',4),(13,'AZUL Y ROJO',5),(14,'ROJO Y AMARILLO',5),(15,'AMARILLO Y AZUL',5),(16,'1439',6),(17,'1765',6),(18,'1520',6),(19,'LOS WAYUU',7),(20,'LOS ARHUACO',7),(21,'LOS MAYAS',7),(22,'20 DE ENERO DEL 2016',8),(23,'10 DE FEBRERO DEL 2017',8),(24,'27 DE DICIEMBRE DEL 2017',8),(25,'ANDRÉS PASTRANA',9),(26,'ÁLVARO URIBE',9),(27,'VIRGILIO BARCO',9),(28,'MIGUEL ANTONIO CARO',10),(29,'MISAEL PASTRANA',10),(30,'GUILLERMO LEÓN VALENCIA',10),(31,'Miguel Ángel',11),(32,'Vincent van Gogh',11),(33,'Frida Kahlo',11),(34,'XX',12),(35,'XIX',12),(36,'XVI',12),(37,'Diego velázquez',13),(38,'Pablo Picasso',13),(39,'Salvador Dalí',13),(40,'Calude Monet',14),(41,'Pedro Pablo Rubents',14),(42,'Tiziano',14),(43,'J Balvin',15),(44,'Maluma',15),(45,'Daddy Yankee',15);
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacion`
--

DROP TABLE IF EXISTS `participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participacion` (
  `id_participacion` int NOT NULL AUTO_INCREMENT,
  `fecha_participa` varchar(100) NOT NULL,
  `premioObtenido` float NOT NULL,
  `id_jugador` int NOT NULL,
  PRIMARY KEY (`id_participacion`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `participacion_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacion`
--

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `pregunta` text NOT NULL,
  `dificultad` int NOT NULL,
  `id_categoria` int NOT NULL,
  `id_respuesta` int NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_respuesta` (`id_respuesta`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_respuesta`) REFERENCES `respuesta` (`id_respuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'¿Cuánto dura un partido de fútbol?',1,1,1),(2,'¿Cuánto dura la prórroga en un partido de fútbol?',2,1,2),(3,'¿Qué selección de fútbol ha ganado más Mundiales?',3,1,3),(4,'¿Cuál es el apodo del Leicester City??',4,1,4),(5,'¿De qué colores es la camiseta del Atlético de Madrid?',5,1,5),(6,'¿Cuándo se fundó la ciudad de Bogotá?',1,2,6),(7,'¿Qué pueblos indígenas habitaban Bogotá antes de la conquista?',2,2,7),(8,'¿Cuándo se firmó el Acuerdo de Paz entre el Gobierno y la guerrilla de las Farc?',3,2,8),(9,'¿Quién gobernaba el país cuando se realizó la Constitución de 1991?',4,2,9),(10,'¿Cuál fue el primer presidente que gobernó en el periodo conocido como el \'Frente Nacional\'?',5,2,10),(11,'¿Quién pintó a la Mona Lisa?',1,3,11),(12,'¿En qué siglo surgió el renacimiento?',2,3,12),(13,'¿Quién es el pinto más famoso del mundo?',3,3,11),(14,'¿Quién fue el artista que pintó su Alzheimer?',4,3,13),(15,'¿Quién es el cantante con más grammys?',5,3,14);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `id_respuesta` int NOT NULL AUTO_INCREMENT,
  `respuesta` text NOT NULL,
  PRIMARY KEY (`id_respuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,'90 MINUTOS'),(2,'30 MINUTOS'),(3,'BRASIL'),(4,'THE FOXES'),(5,'ROJO Y BLANCO'),(6,'1538'),(7,'LOS MUISCAS'),(8,'24 DE NOVIEMBRE DEL 2016'),(9,'CÉSAR GAVIRIA'),(10,'ALBERTO LLERAS CAMARGO'),(11,'Leonardo da Vinci'),(12,'siglo XV'),(13,'William Utermohlen'),(14,'Residente');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ronda`
--

DROP TABLE IF EXISTS `ronda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ronda` (
  `id_ronda` int NOT NULL AUTO_INCREMENT,
  `num_ronda` int NOT NULL,
  `premio` float NOT NULL,
  `id_pregunta` int NOT NULL,
  PRIMARY KEY (`id_ronda`),
  KEY `id_pregunta` (`id_pregunta`),
  CONSTRAINT `ronda_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ronda`
--

LOCK TABLES `ronda` WRITE;
/*!40000 ALTER TABLE `ronda` DISABLE KEYS */;
INSERT INTO `ronda` VALUES (1,1,100,1),(2,1,100,6),(3,1,100,11),(4,2,300,2),(5,2,300,7),(6,2,300,12),(7,3,500,3),(8,3,500,8),(9,3,500,13),(10,4,100,4),(11,4,100,9),(12,4,100,14),(13,5,1000,5),(14,5,1000,10),(15,5,1000,15);
/*!40000 ALTER TABLE `ronda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-13 20:20:33

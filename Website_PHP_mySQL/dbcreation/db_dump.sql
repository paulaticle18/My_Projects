-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: internPROJECT
-- ------------------------------------------------------
-- Server version	5.7.35-38

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `coffeename` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `rateing` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'espresso','10 RON','25 ml','','',4),(2,'cappuccino','16 RON','75 ml','espresso, crema de lapte','',4),(3,'caffee latte','17 RON','125 ml','espresso, lapte, spuma de lapte','',5),(4,'latte decofeinizat','15 RON','125 ml','espresso, lapte, spuma de lapte','fara cofeina',3),(5,'flavoured latte','18 RON','125 ml','espresso, crema de lapte, sirop','sirop: vanilie, caramel, cocos',5),(6,'irish coffee','22 RON','125 ml','espresso, zahar, whisky','contine alcool',4),(7,'ice latte','19 RON','125 ml','espresso, lapte, gheata, frisca','',5),(8,'fresh','16 RON','250 ml','fructe proaspete','portocala, grepefruit',4),(9,'croissant','11 RON','130 g','crema','unt, ciocolata, vanilie',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

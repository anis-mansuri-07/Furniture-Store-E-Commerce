-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: furniturestore
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `product_status` varchar(20) DEFAULT 'Pending',
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'akshit@gmail.com','TAVAR ROAD, IDAR, SABARKANTHA','Sabarkantha','GJ','383430','08141435587','DRIFTINGWOOD, ',30000.00,'Approved','2025-04-20 05:17:12'),(2,'akshit@gmail.com','TAVAR ROAD, IDAR, SABARKANTHA','Sabarkantha','GJ','383430','08141435587','DRIFTINGWOOD, ',15000.00,'Approved','2025-04-20 05:18:06'),(3,'anish@gmail.com','modasa','Sabarkantha','GJ','38343089','08141435587','DRIFTINGWOOD, ',60000.00,'Approved','2025-04-22 12:25:12'),(4,'milan12@gmail.com','desha','uhdiuds','MH','765432','8765436587','MODESTY WOODS, ',18000.00,'Approved','2025-04-23 09:57:24'),(5,'milan12@gmail.com','tavar rod idar,383530','Sabarkantha','GJ','383430','09106150639','Double Bed, ',10000.00,'Approved','2025-04-23 10:01:33'),(6,'sunnythakor721@gmai.com','tavar rod idar,383530','Sabarkantha','GJ','383430','09106150639','DRIFTINGWOOD, ',45000.00,'Approved','2025-04-23 10:03:50'),(7,'sunnythakor721@gmai.com','desha','uhdiuds','MH','765432','08765436587','Casaliving, ',14000.00,'Pending','2025-04-23 11:14:21'),(8,'sunnythakor721@gmai.com','tavar rod idar,383530','Sabarkantha','GJ','383430','09106150639','DRIFTINGWOOD, ',15000.00,'Approved','2025-04-23 11:15:19'),(9,'sunnythakor721@gmai.com','tavar rod idar,383530','Sabarkantha','GJ','383430','09106150639','Double Bed, ',30000.00,'Pending','2025-07-16 17:57:19'),(10,'anish@gmail.com','doctor.address','Sabarkantha','GJ','383430','8141435587','Double Bed, ',30000.00,'Approved','2025-09-19 17:47:47');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-26 22:42:35

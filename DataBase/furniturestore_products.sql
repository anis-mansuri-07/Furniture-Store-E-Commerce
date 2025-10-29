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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (41,'Double Bed','Bedroom Furniture',10000.00,7,'1745402372530_71OyHKQyNKL._SX679_.jpg','DRIFTINGWOOD Dolvi Solid Sheesham Wood Queen Size Bed with Storage | Wooden Double Bed Cot Bed with Box Storage & Upholstered Cushioned Headboard for Bedroom | Teak Finish','2025-04-13 04:48:10'),(42,'DRIFTINGWOOD','Bedroom Furniture',15000.00,9,'1744519968917_bed7.webp','DRIFTINGWOOD Florina Engineered Wood Low Height King Size Bed Without Storage | Wooden Double Bed | Low Floor/Lying/Rise/Level/Profile Cot Bedroom Furniture | Grey, Self Assembly (DIY)','2025-04-13 04:52:48'),(43,'MODESTY WOODS','Bedroom Furniture',9000.00,6,'1744520062888_bed6.jpg','MODESTY WOODS Solid Wood Upholstered Queen Size Bed with Box Storage Wooden Double Bed Fabric Cot Palang for Bedroom ','2025-04-13 04:54:22'),(44,'SABTA Craft','Bedroom Furniture',8000.00,12,'1744520130610_bed2.jpg','SABTA Craft Solid Sheesham Wood Low Height Queen Size Bed Without Storage | Wooden Double Bed | Low Floor/Lying/Rise/Level/Profile Cot with Cushioned Headboard | Brown Finish & Blue Cushion','2025-04-13 04:55:30'),(45,'LOOM & NEEDLES','Bedroom Furniture',10000.00,4,'1744520177544_bed4.jpg','LOOM & NEEDLES 75x60x6 Inches Queen Size Mattress | Reactive Dual Comfort Pocket Spring Mattress | 5 Zoned 7 Layer Orthopedic Medium Firm Bed Mattresses | HD Memory Gel Foam Gadda | Spring Mattress','2025-04-13 04:56:17'),(46,'Antique Wood','Living Room Furniture',16000.00,6,'1744520339150_sofa4.jpg','Antique Wood Hub Modern Classic 5 Seater Chesterfield Velvet (3+2) Seater Sofa for Living Room Bedroom Reception and Office (L-Shape, Beige)','2025-04-13 04:58:59'),(47,'LEGACY OF COMFORT','Living Room Furniture',13000.00,7,'1744520439103_sofa2.jpg','LEGACY OF COMFORT Prith Velvet Modern Cloud Sofa Upholstered 3 Seater Sofa Three Seater Sofa for Living Room Hotels & Offices (White)\r\nVisit the LEGACY OF COMFORT Store','2025-04-13 05:00:39'),(48,'Casaliving','Living Room Furniture',7000.00,4,'1744520503914_sofa3.jpg','Casaliving Rihan 6 Seater L Shape Sofa Set Living Room Right Side Sofa','2025-04-13 05:01:43'),(49,'Adorn India ','Living Room Furniture',8000.00,4,'1744520554755_sofa6.jpg','Adorn India Maddox Tufted L Shape 6 Seater Sofa Set Lhs (Beige) (3 Year Warranty)','2025-04-13 05:02:34'),(50,'Casaliving','Living Room Furniture',11000.00,5,'1744520623965_sofa5.jpg','Casaliving Tan - 4 Seater L Shape Sofa for Living Room (Black) Right Side Sofa','2025-04-13 05:03:43'),(51,'BLUEWUD Skiddo','Living Room Furniture',4000.00,4,'1744520879864_51hE9NcGunL._SX300_SY300_QL70_FMwebp_.webp','BLUEWUD Skiddo Engineered Wood TV Entertainment Unit Set Top Box Stand/TV Cabinet with Shelves for Books & Décor Display Unit Bed Living Room Upto 55 Inches - DIY (Walnut & White)','2025-04-13 05:07:59'),(52,'BLUEWUD Rowlet ','Living Room Furniture',7000.00,3,'1744520981997_41ccEaoL5YL._SX300_SY300_QL70_FMwebp_.webp','BLUEWUD Rowlet Large Engineering Wood Floor Standing TV Entertainment Unit Set Top Box Stand/TV Cabinet with Shelves for Books & Décor Display Unit Bed Living Room Upto 55 Inches (Brown Maple & Beige)','2025-04-13 05:09:42'),(53,'Spyder Craft','Living Room Furniture',5000.00,3,'1744521029892_41G7IooTUNL._SX300_SY300_QL70_FMwebp_.webp','Spyder Craft Matte Finished Engineering Wood TV Entertainment Unit with Wall Shelves with Storage','2025-04-13 05:10:29'),(54,'WoodenStreet','Bedroom Furniture',1500.00,3,'1744521160173_41-u6sJziaL._SX300_SY300_QL70_FMwebp_.webp','WoodenStreet™ Adolph Sheesham Wood Bed Side Table for Bedroom, Side Tables for Living Room, Bedside Table with Drawer, 1 Year Warranty (Honey Finish)','2025-04-13 05:12:40'),(55,'ETIQUETTE ART','Bedroom Furniture',2000.00,3,'1744521217339_41jQuux-m+L._SY300_SX300_.jpg','ETIQUETTE ART Modern Bedside Table with Solid Wood Legs Minimalist and Practical Bedside Table End Side Table with 2 Drawer Storage for Bedroom & Living Room (White)','2025-04-13 05:13:37'),(56,'UNITEK','Bedroom Furniture',1000.00,2,'1744521282387_51ZRaSZyVFL._SX679_.jpg','UNITEK FURNITURE Contemporary Sheesham Wood Bed Side Table with Drawer for Bedroom (White Finish)','2025-04-13 05:14:42'),(57,'DEVOKO Patio','Outdoor Furniture',16000.00,2,'1744521383174_61scumbPLnL._SX679_.jpg','DEVOKO Patio Furniture Set, 4 Pieces for Porch Backyard Garden Outdoor Furniture Rope 6 Seater Sofa with Wooden Top Table Premium Conversation Set with Washable Soft Cushion in Grey Color','2025-04-13 05:16:23'),(58,'FURNSHOP','Outdoor Furniture',700.00,4,'1744521446346_71OyHKQyNKL._SX679_.jpg','FURNSHOP INDIA Double Seater Hammock Swing Chair with Stand & Cushion for Outdoor Indoor Living Room Patio Balcony Garden Rooftop Water Resistant - White','2025-04-13 05:17:26'),(59,'DEVOKO ','Outdoor Furniture',900.00,4,'1744521497921_51z8H2uYZ4L._SX300_SY300_QL70_FMwebp_.webp','DEVOKO 5 Pieces Patio Furniture Set Outdoor Sofa and Ottoman Set with Cushions & Center Table, HDPE Wicker Rattan for Lawn, Pool, Balcony, Backyard (Silver and Grey)','2025-04-13 05:18:17'),(60,'Hindoro Wrought','Outdoor Furniture',4000.00,6,'1744521549407_91jjreyQaqL._SX679_.jpg','Hindoro Wrought Iron Outdoor Rattan Wicker Double Seater Swing with Stand and Cushion for Outdoor Patio Balcony Garden Terrace Porch Living Room Relaxing Chair, Powder Coated Furniture (Brown)','2025-04-13 05:19:09'),(61,'OUTLIVING Braid','Outdoor Furniture',6000.00,6,'1744521608507_61n2MeXLvBL._SX679_.jpg','OUTLIVING Braid & Rope Patio 4 Seater Sofa Set with Centre Table for Outdoor Garden Balcony (Grey)','2025-04-13 05:20:08');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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

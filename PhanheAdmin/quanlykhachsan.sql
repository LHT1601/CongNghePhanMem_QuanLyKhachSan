-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlykhachsan
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_card` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `employee_id` (`employee_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_card` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_card` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_detail`
--

DROP TABLE IF EXISTS `receipt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `receipt_id` int NOT NULL,
  `room_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_id` (`receipt_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `receipt_detail_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  CONSTRAINT `receipt_detail_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_detail`
--

LOCK TABLES `receipt_detail` WRITE;
/*!40000 ALTER TABLE `receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomCatalog_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RoomCatalog_id` (`RoomCatalog_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`RoomCatalog_id`) REFERENCES `room_catalog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'102',NULL,99,'imgs/blog1.jpg',1),(2,'302',NULL,100,'imgs/pic3.jpg',1),(3,'202',NULL,200,'imgs/pic8.jpg',1),(4,'PA.101',NULL,0,'imgs/blog1.jpg',1),(5,'VIP102',NULL,199,'imgs/pig8.jpg',3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_catalog`
--

DROP TABLE IF EXISTS `room_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_catalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_catalog`
--

LOCK TABLES `room_catalog` WRITE;
/*!40000 ALTER TABLE `room_catalog` DISABLE KEYS */;
INSERT INTO `room_catalog` VALUES (1,'Phòng Loại A',NULL),(2,'Phòng Loại B',NULL),(3,'Phòng Loại C',NULL);
/*!40000 ALTER TABLE `room_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Le','Trieu','1851050154Trieu@ou.edu.vn','LHT','e10adc3949ba59abbe56e057f20f883e',NULL,1),(2,'Le ','Phuc','1851050154Trieu@ou.edu.vn','LHGP','e10adc3949ba59abbe56e057f20f883e',NULL,1),(3,'Trang','Huynh','1851050154Trieu@ou.edu.vn','HTNT','e10adc3949ba59abbe56e057f20f883e',NULL,1),(5,'TRANG','HUYNH','1851050154Trieu@ou.edu.vn','HNT','e10adc3949ba59abbe56e057f20f883e',NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13 22:40:48

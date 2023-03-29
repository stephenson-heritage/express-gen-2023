-- MariaDB dump 10.19  Distrib 10.9.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: express_checkout
-- ------------------------------------------------------
-- Server version	10.9.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `express_checkout`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `express_checkout` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `express_checkout`;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `content` text DEFAULT NULL,
  `key` varchar(48) NOT NULL,
  `menu_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_un` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES
(1,'How to Take Care of Dogs','dogs <em>need</em> to be fed','care',1),
(2,'Dog Breeds','there are many dog breeds, Omar says the only breed that counts is Husky','breeds',2),
(3,'Photos','photos of dogs','photo',3),
(9,'Welcome','<h2>World of Dogs!</h2><p>stay a while and listen!</p><ol><li>ghjghj!!!</li></ol><p>&nbsp;</p><h3>gfhbfghfgh</h3>','index',0),
(10,'dfgdfg','sdfgdfgdf		\r\n		','tet1',1);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_history`
--

DROP TABLE IF EXISTS `page_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_history` (
  `page_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_key` varchar(48) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL,
  PRIMARY KEY (`page_history_id`),
  KEY `page_history_FK_1` (`user_id`),
  KEY `page_history_FK` (`page_key`),
  CONSTRAINT `page_history_FK` FOREIGN KEY (`page_key`) REFERENCES `page` (`key`),
  CONSTRAINT `page_history_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_history`
--

LOCK TABLES `page_history` WRITE;
/*!40000 ALTER TABLE `page_history` DISABLE KEYS */;
INSERT INTO `page_history` VALUES
(1,'index',1,'2023-03-29 10:09:55','<h2>World of Dogs!</h2><p>stay a while and listen!</p><ol><li>ghjghj!!!</li></ol><p>&nbsp;</p><h3>gfhbfghfgh</h3>'),
(2,'tet1',1,'2023-03-29 10:12:28','sdfgdfgdf		\r\n		');
/*!40000 ALTER TABLE `page_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(132) NOT NULL,
  `description` text DEFAULT NULL,
  `date_modified` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES
(1,'lab1.jpg','A labrador retriever puppy','2023-03-23 09:27:29'),
(2,'newf.jpg','A newfoundland dog puppy','2023-03-23 09:28:39'),
(3,'airedale.jpg','an airedale terrier puppy','2023-03-23 09:28:39'),
(4,'husky.jpg','a husky puppy','2023-03-23 12:18:58'),
(5,'chewie.jfif','wreraaarwwra','2023-03-24 10:50:44'),
(6,'3ad540ec196d41175e1b7c9d5bb5e34e.jpeg','example!','2023-03-29 07:11:29');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `email` varchar(316) DEFAULT NULL,
  `passHash` varchar(256) NOT NULL,
  `cookieHash` varchar(256) DEFAULT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_un` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'bob','bob@bob.com','A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=','B7mIrx0aiDTnAHwBkCNIuPJ+2VaJbzp5kaLbzPm/w/o=','2023-03-24 11:23:50');
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

-- Dump completed on 2023-03-29 10:22:54

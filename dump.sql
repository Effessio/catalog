-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: catalog
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add producer',6,'add_producer'),(17,'Can change producer',6,'change_producer'),(18,'Can delete producer',6,'delete_producer'),(19,'Can add product',7,'add_product'),(20,'Can change product',7,'change_product'),(21,'Can delete product',7,'delete_product'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_3387555d` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-02-11 08:37:15',1,6,'1','Adidas',1,''),(2,'2014-02-11 09:02:24',1,7,'1','cap',1,''),(3,'2014-02-11 10:27:55',1,6,'1','Adidas',2,'Changed moderator.'),(4,'2014-02-11 13:37:25',1,6,'2','Nike',1,''),(5,'2014-02-11 13:41:02',1,7,'3','shoes',1,''),(6,'2014-02-13 08:52:13',1,6,'10','Producer8',3,''),(7,'2014-02-13 08:52:13',1,6,'9','Producer7',3,''),(8,'2014-02-13 08:52:13',1,6,'8','Producer6',3,''),(9,'2014-02-13 08:52:13',1,6,'7','Producer5',3,''),(10,'2014-02-13 08:52:13',1,6,'6','Producer4',3,''),(11,'2014-02-13 08:52:13',1,6,'5','Producer3',3,''),(12,'2014-02-13 08:52:13',1,6,'4','Producer2',3,''),(13,'2014-02-13 08:52:13',1,6,'3','Producer1',3,''),(14,'2014-02-13 09:06:04',1,7,'23','Some product',3,''),(15,'2014-02-13 09:06:04',1,7,'22','Some product',3,''),(16,'2014-02-13 09:06:04',1,7,'20','Some product',3,''),(17,'2014-02-13 09:06:04',1,7,'19','Some product',3,''),(18,'2014-02-13 09:06:04',1,7,'18','Some product',3,''),(19,'2014-02-13 09:06:04',1,7,'17','Some product',3,''),(20,'2014-02-13 09:06:04',1,7,'16','Some product',3,''),(21,'2014-02-13 09:06:04',1,7,'15','Some product',3,''),(22,'2014-02-13 09:06:04',1,7,'14','Some product',3,''),(23,'2014-02-13 09:06:04',1,7,'13','Some product',3,''),(24,'2014-02-13 09:06:04',1,7,'12','Some product',3,''),(25,'2014-02-13 09:06:04',1,7,'11','Some product',3,''),(26,'2014-02-13 09:06:04',1,7,'10','Some product',3,''),(27,'2014-02-13 09:06:04',1,7,'9','Some product',3,''),(28,'2014-02-13 09:06:04',1,7,'7','Some product',3,''),(29,'2014-02-13 09:06:04',1,7,'6','Some product',3,''),(30,'2014-02-13 09:09:06',1,6,'18','Producer10',3,''),(31,'2014-02-13 09:09:07',1,6,'17','Producer9',3,''),(32,'2014-02-13 09:09:07',1,6,'16','Producer8',3,''),(33,'2014-02-13 09:09:07',1,6,'15','Producer7',3,''),(34,'2014-02-13 09:09:07',1,6,'14','Producer6',3,''),(35,'2014-02-13 09:09:07',1,6,'13','Producer5',3,''),(36,'2014-02-13 09:09:07',1,6,'12','Producer4',3,''),(37,'2014-02-13 09:09:07',1,6,'11','Producer3',3,''),(38,'2014-02-13 09:15:34',1,6,'26','Producer10',3,''),(39,'2014-02-13 09:15:34',1,6,'25','Producer9',3,''),(40,'2014-02-13 09:15:34',1,6,'24','Producer8',3,''),(41,'2014-02-13 09:15:34',1,6,'23','Producer7',3,''),(42,'2014-02-13 09:15:34',1,6,'22','Producer6',3,''),(43,'2014-02-13 09:15:34',1,6,'21','Producer5',3,''),(44,'2014-02-13 09:15:34',1,6,'20','Producer4',3,''),(45,'2014-02-13 09:15:34',1,6,'19','Producer3',3,''),(46,'2014-02-13 09:17:58',1,6,'34','Producer10',3,''),(47,'2014-02-13 09:17:59',1,6,'33','Producer9',3,''),(48,'2014-02-13 09:17:59',1,6,'32','Producer8',3,''),(49,'2014-02-13 09:17:59',1,6,'31','Producer7',3,''),(50,'2014-02-13 09:17:59',1,6,'30','Producer6',3,''),(51,'2014-02-13 09:17:59',1,6,'29','Producer5',3,''),(52,'2014-02-13 09:17:59',1,6,'28','Producer4',3,''),(53,'2014-02-13 09:17:59',1,6,'27','Producer3',3,''),(54,'2014-02-13 09:23:37',1,6,'42','Producer10',3,''),(55,'2014-02-13 09:23:37',1,6,'41','Producer9',3,''),(56,'2014-02-13 09:23:37',1,6,'40','Producer8',3,''),(57,'2014-02-13 09:23:37',1,6,'39','Producer7',3,''),(58,'2014-02-13 09:23:37',1,6,'38','Producer6',3,''),(59,'2014-02-13 09:23:37',1,6,'37','Producer5',3,''),(60,'2014-02-13 09:23:37',1,6,'36','Producer4',3,''),(61,'2014-02-13 09:23:37',1,6,'35','Producer3',3,''),(62,'2014-02-13 13:03:36',1,6,'50','Producer10',3,''),(63,'2014-02-13 13:03:36',1,6,'49','Producer9',3,''),(64,'2014-02-13 13:03:36',1,6,'48','Producer8',3,''),(65,'2014-02-13 13:03:36',1,6,'47','Producer7',3,''),(66,'2014-02-13 13:03:36',1,6,'46','Producer6',3,''),(67,'2014-02-13 13:03:36',1,6,'45','Producer5',3,''),(68,'2014-02-13 13:03:36',1,6,'44','Producer4',3,''),(69,'2014-02-13 13:03:36',1,6,'43','Producer3',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'producer','goods','producer'),(7,'product','goods','product'),(8,'user','users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('v1x614je88y7o8lv3i7utsiej9lu5ooe','NGQ4OTBjNTEzNzMyNjY5YzEwMjZkZDExZjMzM2M2NGQ2MGU2MjU4NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-02-28 13:27:31');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_producer`
--

DROP TABLE IF EXISTS `goods_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `moderator_id` int(11) DEFAULT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moderator_id` (`moderator_id`),
  CONSTRAINT `moderator_id_refs_id_662e6ed1` FOREIGN KEY (`moderator_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_producer`
--

LOCK TABLES `goods_producer` WRITE;
/*!40000 ALTER TABLE `goods_producer` DISABLE KEYS */;
INSERT INTO `goods_producer` VALUES (1,'Adidas',1,'2014-02-11 12:37:13'),(2,'Nike',NULL,'2014-02-11 17:37:24'),(51,'Producer3',NULL,'2014-02-13 13:04:04'),(52,'Producer4',NULL,'2014-02-13 13:04:05'),(53,'Producer5',NULL,'2014-02-13 13:04:05'),(54,'Producer6',NULL,'2014-02-13 13:04:05'),(55,'Producer7',NULL,'2014-02-13 13:04:05'),(56,'Producer8',NULL,'2014-02-13 13:04:06'),(57,'Producer9',NULL,'2014-02-13 13:04:06'),(58,'Producer10',NULL,'2014-02-13 13:04:06');
/*!40000 ALTER TABLE `goods_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_product`
--

DROP TABLE IF EXISTS `goods_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(400) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `pub_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_product_066eeaa4` (`producer_id`),
  CONSTRAINT `producer_id_refs_id_65967b6d` FOREIGN KEY (`producer_id`) REFERENCES `goods_producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_product`
--

LOCK TABLES `goods_product` WRITE;
/*!40000 ALTER TABLE `goods_product` DISABLE KEYS */;
INSERT INTO `goods_product` VALUES (1,'001','cap','zzz',1,'2014-02-11 09:02:24','2014-02-14 11:43:29'),(2,'2','Abs','abss',1,'2014-02-11 10:28:11','2014-02-11 10:28:11'),(3,'3','shoes','nice shoes',2,'2014-02-11 13:41:02','2014-02-11 14:22:05'),(4,'4','hands','handss',1,'2014-02-12 14:57:01','2014-02-12 14:57:01'),(5,'4','fingers1','fingers',1,'2014-02-12 14:57:24','2014-02-13 16:12:56'),(146,'31','Some product 1 of producer 3','some description',51,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(147,'32','Some product 2 of producer 3','some description',51,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(148,'33','Some product 3 of producer 3','some description',51,'2014-02-13 13:04:05','2014-02-13 13:06:03'),(149,'34','Some product 4 of producer 3','some description',51,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(150,'35','Some product 5 of producer 3','some description',51,'2014-02-13 13:04:05','2014-02-13 13:05:49'),(151,'41','Some product 1 of producer 4','some description',52,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(152,'42','Some product 2 of producer 4','some description',52,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(153,'43','Some product 3 of producer 4','some description',52,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(154,'44','Some product 4 of producer 4','some description',52,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(155,'45','Some product 5 of producer 4','some description',52,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(156,'51','Some product 1 of producer 5','some description',53,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(157,'52','Some product 2 of producer 5','some description',53,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(158,'53','Some product 3 of producer 5','some description',53,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(159,'54','Some product 4 of producer 5','some description',53,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(160,'55','Some product 5 of producer 5','some description',53,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(161,'61','Some product 1 of producer 6','some description',54,'2014-02-13 13:04:05','2014-02-14 11:43:38'),(162,'62','Some product 2 of producer 6','some description',54,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(163,'63','Some product 3 of producer 6','some description',54,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(164,'64','Some product 4 of producer 6','some description',54,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(165,'65','Some product 5 of producer 6','some description',54,'2014-02-13 13:04:05','2014-02-13 13:04:05'),(166,'71','Some product 1 of producer 7','some description',55,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(167,'72','Some product 2 of producer 7','some description',55,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(168,'73','Some product 3 of producer 7','some description',55,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(169,'74','Some product 4 of producer 7','some description',55,'2014-02-13 13:04:06','2014-02-14 13:27:51'),(170,'75','Some product 5 of producer 7','some description',55,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(171,'81','Some product 1 of producer 8','some description',56,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(172,'82','Some product 2 of producer 8','some description',56,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(173,'83','Some product 3 of producer 8','some description',56,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(174,'84','Some product 4 of producer 8','some description',56,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(175,'85','Some product 5 of producer 8','some description',56,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(176,'91','Some product 1 of producer 9','some description',57,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(177,'92','Some product 2 of producer 9','some description',57,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(178,'93','Some product 3 of producer 9','some description',57,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(179,'94','Some product 4 of producer 9','some description',57,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(180,'95','Some product 5 of producer 9','some description',57,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(181,'101','Some product 1 of producer 10','some description',58,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(182,'102','Some product 2 of producer 10','some description',58,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(183,'103','Some product 3 of producer 10','some description',58,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(184,'104','Some product 4 of producer 10','some description',58,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(185,'105','Some product 5 of producer 10','some description',58,'2014-02-13 13:04:06','2014-02-13 13:04:06'),(186,'832','Кружка','Чашка',1,'2014-02-13 16:12:35','2014-02-14 13:15:54');
/*!40000 ALTER TABLE `goods_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_product_user`
--

DROP TABLE IF EXISTS `goods_product_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_product_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`user_id`),
  KEY `goods_product_user_7f1b40ad` (`product_id`),
  KEY `goods_product_user_6340c63c` (`user_id`),
  CONSTRAINT `product_id_refs_id_97d05101` FOREIGN KEY (`product_id`) REFERENCES `goods_product` (`id`),
  CONSTRAINT `user_id_refs_id_8d8fddff` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_product_user`
--

LOCK TABLES `goods_product_user` WRITE;
/*!40000 ALTER TABLE `goods_product_user` DISABLE KEYS */;
INSERT INTO `goods_product_user` VALUES (10,1,1),(5,148,1),(4,150,1),(11,161,1),(17,169,2),(12,186,1),(15,186,2);
/*!40000 ALTER TABLE `goods_product_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$12000$XirQ5A88Hmo2$jmMMCkvHylhzb9p+9ynYShn4zheqClhcFS0oi80tO1w=','2014-02-14 13:16:23',0,'admin',1,1),(2,'pbkdf2_sha256$12000$VNi0bGFipG20$/eEBtN+B8g25Zr7xHKb2k3TaULnW/Ygxq3Dm+2oRhuY=','2014-02-14 13:27:31',0,'luck',1,0);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `users_user_groups_6340c63c` (`user_id`),
  KEY `users_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_52d270a4` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_cbec8e88` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `users_user_user_permissions_6340c63c` (`user_id`),
  KEY `users_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_01625f6a` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_7d077e6f` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-14 17:42:33

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tiantian
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add type info',8,'add_typeinfo'),(23,'Can change type info',8,'change_typeinfo'),(24,'Can delete type info',8,'delete_typeinfo'),(25,'Can add goods info',9,'add_goodsinfo'),(26,'Can change goods info',9,'change_goodsinfo'),(27,'Can delete goods info',9,'delete_goodsinfo'),(28,'Can add cart info',10,'add_cartinfo'),(29,'Can change cart info',10,'change_cartinfo'),(30,'Can delete cart info',10,'delete_cartinfo'),(31,'Can add order info',11,'add_orderinfo'),(32,'Can change order info',11,'change_orderinfo'),(33,'Can delete order info',11,'delete_orderinfo'),(34,'Can add order detail info',12,'add_orderdetailinfo'),(35,'Can change order detail info',12,'change_orderdetailinfo'),(36,'Can delete order detail info',12,'delete_orderdetailinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$tcrs91pae93Y$QUBbJjNQGSoKpVn4QsPhYyaBGG5CSRUBEteJ9rZ50qE=','2017-09-04 03:24:39.557359',1,'admin','','','ming9191@126.com',1,1,'2017-08-26 09:19:53.586486');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_cart_cartinfo`
--

DROP TABLE IF EXISTS `df_cart_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_cart_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_cart_cartinfo_goods_id_4357294f_fk_goods_goodsinfo_id` (`goods_id`),
  KEY `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_cart_cartinfo_goods_id_4357294f_fk_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goodsinfo` (`id`),
  CONSTRAINT `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_cart_cartinfo`
--

LOCK TABLES `df_cart_cartinfo` WRITE;
/*!40000 ALTER TABLE `df_cart_cartinfo` DISABLE KEYS */;
INSERT INTO `df_cart_cartinfo` VALUES (12,1,10,2),(16,1,15,5),(18,1,23,5),(19,3,11,5),(20,1,5,5),(21,1,2,5),(23,1,2,2),(26,4,10,2),(30,1,3,21),(31,1,2,21),(32,1,5,21),(37,1,23,2),(43,3,10,39),(54,1,3,38),(55,1,12,38),(60,1,11,48),(61,10,3,48),(64,1,16,1),(66,7,3,1),(67,3,14,1),(68,4,11,1),(72,1,2,55),(91,1,21,57),(94,8,17,60);
/*!40000 ALTER TABLE `df_cart_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderdetailinfo`
--

DROP TABLE IF EXISTS `df_order_orderdetailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_orderdetailinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(5,2) NOT NULL,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_orderdetailinfo_goods_id_d0acef4d_fk_goods_goodsinfo_id` (`goods_id`),
  KEY `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` (`order_id`),
  CONSTRAINT `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` FOREIGN KEY (`order_id`) REFERENCES `df_order_orderinfo` (`oid`),
  CONSTRAINT `df_order_orderdetailinfo_goods_id_d0acef4d_fk_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goodsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderdetailinfo`
--

LOCK TABLES `df_order_orderdetailinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderdetailinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderdetailinfo` VALUES (1,12.00,1,3,'2017090215560755'),(2,3.55,1,20,'2017090215560755'),(6,12.00,1,33,'2017090216354057'),(7,12.00,1,3,'2017090304191657'),(8,12.90,5,16,'201709021709444'),(9,18.90,7,18,'201709021709444'),(10,46.00,5,10,'201709021709444'),(11,46.00,3,9,'201709021709444'),(13,14.59,4,27,'201709021735114'),(14,25.90,5,14,'2017090220582957'),(15,18.90,5,18,'2017090220582957'),(16,30.00,1,5,'2017090301465157'),(17,30.00,1,11,'2017090301474957'),(18,18.90,1,18,'2017090301514357'),(19,29.90,1,15,'2017090301551557'),(20,15.00,4,12,'2017090302213558'),(21,46.00,4,9,'2017090302222758'),(22,30.00,1,5,'2017090302232758'),(23,13.00,1,2,'2017090302234958'),(24,22.90,5,13,'2017090302285058'),(25,12.00,1,3,'2017090401062157'),(26,30.00,3,5,'2017090401062157'),(27,4.39,4,24,'2017090402055057'),(28,5.50,1,6,'2017090402055057'),(29,12.00,5,3,'2017090402421157'),(30,4.58,6,21,'2017090306360557'),(31,46.00,3,9,'2017090306535260');
/*!40000 ALTER TABLE `df_order_orderdetailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderinfo`
--

DROP TABLE IF EXISTS `df_order_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_orderinfo` (
  `oid` varchar(20) NOT NULL,
  `odate` datetime(6) NOT NULL,
  `oIsPay` tinyint(1) NOT NULL,
  `ototal` decimal(6,2) NOT NULL,
  `oaddress` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderinfo`
--

LOCK TABLES `df_order_orderinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderinfo` VALUES ('2017090215560755','2017-09-02 15:56:07.526458',0,26.00,'北京 -海淀-西二旗 （wangjunzhao 收） ',55),('2017090216354057','2017-09-02 16:35:40.347558',0,22.00,'河南商丘兰考县 （lichong 收） ',57),('201709021709444','2017-09-02 17:09:44.784402',0,574.00,' （lichongchong 收） ',4),('201709021735114','2017-09-02 17:35:11.631301',0,68.00,' （lichongchong 收） ',4),('201709021812274','2017-09-02 18:12:27.904682',1,68.00,' （lichongchong 收） ',4),('2017090220582957','2017-09-02 20:58:29.046751',0,234.00,'河南商丘兰考县 （lichong 收） ',57),('2017090221210257','2017-09-02 21:21:02.611274',0,10.00,'河南商丘兰考县 （lichong 收） ',57),('2017090221210757','2017-09-02 21:21:07.710447',0,10.00,'河南商丘兰考县 （lichong 收） ',57),('2017090221213057','2017-09-02 21:21:30.825580',0,10.00,'河南商丘兰考县 （lichong 收） ',57),('2017090301465157','2017-09-03 01:46:51.308195',0,40.00,'河南商丘兰考县 （lichong 收） ',57),('2017090301474957','2017-09-03 01:47:49.151243',0,40.00,'河南商丘兰考县 （lichong 收） ',57),('2017090301514357','2017-09-03 01:51:43.658541',0,29.00,'河南商丘兰考县 （lichong 收） ',57),('2017090301551557','2017-09-03 01:55:15.763632',0,40.00,'河南商丘兰考县 （lichong 收） ',57),('2017090302213558','2017-09-03 02:21:35.301676',0,70.00,' （chong 收） ',58),('2017090302222758','2017-09-03 02:22:27.174450',0,194.00,' （chong 收） ',58),('2017090302232758','2017-09-03 02:23:27.438853',0,40.00,' （chong 收） ',58),('2017090302234958','2017-09-03 02:23:49.385767',0,23.00,' （chong 收） ',58),('2017090302285058','2017-09-03 02:28:50.853244',0,124.00,' （chong 收） ',58),('2017090304191657','2017-09-03 04:19:16.527965',1,22.00,'河南商丘兰考县 （lichong 收） ',57),('2017090304244757','2017-09-03 04:24:47.044411',0,10.00,'河南商丘兰考县 （lichong 收） ',57),('2017090306360557','2017-09-03 06:36:05.137881',0,37.00,'北京 唱平  （lichong 收） ',57),('2017090306535260','2017-09-03 06:53:53.009948',0,148.00,' （chongs 收） ',60),('2017090401062157','2017-09-04 01:06:21.126026',1,112.00,'河南商丘兰考县 （lichong 收） ',57),('2017090402055057','2017-09-04 02:05:50.679206',0,34.00,'河南商丘兰考县 （lichong 收） ',57),('2017090402421157','2017-09-04 02:42:11.810240',0,70.00,'河南商丘兰考县 （lichong 收） ',57),('2017090403281157','2017-09-04 03:28:11.665605',1,37.00,'北京 唱平  （lichong 收） ',57);
/*!40000 ALTER TABLE `df_order_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_userinfo`
--

DROP TABLE IF EXISTS `df_user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `umail` varchar(64) NOT NULL,
  `ureceiver` varchar(20) NOT NULL,
  `uadress` varchar(100) NOT NULL,
  `upostcode` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_userinfo`
--

LOCK TABLES `df_user_userinfo` WRITE;
/*!40000 ALTER TABLE `df_user_userinfo` DISABLE KEYS */;
INSERT INTO `df_user_userinfo` VALUES (1,'chenxiaochun','7c222fb2927d828af22f592134e8932480637c0d','222@qq.com','','北京 - 海淀 -上地 ','100000','17223456789'),(2,'chenmingsheng','7c222fb2927d828af22f592134e8932480637c0d','ming9191@163.com','','','',''),(4,'lichongchong','7c222fb2927d828af22f592134e8932480637c0d','aa@aa.com','','','',''),(5,'caixinxin','60cc86758df32d2c356ef6354da417763ffe7f4d','123@qq.com','','','',''),(6,'ewrwerewtrewt','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','weeeeeeeeeeeeeeeeetr','rrrrr','rrrrrr'),(7,'rewtewt','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','ertgdsgg','rewret','ewtewtew'),(8,'liuli','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(9,'zhangwuqiang','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(10,'dsafgdsrgsd','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','gggggggggggggggggg','dgsgds','sdgdsg'),(11,'caoxing','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','11111111111111111111','333333','17691104307'),(12,'xdljy','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(13,'张武强','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','sss','333333','17691104307'),(14,'wwwwwwwwwwww','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(15,'aaaaaaaa','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(16,'maozedong','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(17,'huodanyang','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(18,'luomiou','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(19,'zhangwu','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(20,'ffffffffffffffffffff','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','123@qq.com','','sssss','222222','12121'),(21,'caixinxin3','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','123@qq.com','','','',''),(22,'caixinxin4','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(23,'chenmingsheng1','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(24,'zhang','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(25,'lichong111','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(26,'chenmingsheng','7c222fb2927d828af22f592134e8932480637c0d','ming9191@126.com','','','',''),(27,'chenxiaochun','7c222fb2927d828af22f592134e8932480637c0d','ming9191@163.com','','','',''),(28,'chenxiaochun1','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(29,'caixinxin6','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(30,'caixinxin7','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@163.com','','','',''),(31,'chenxiaochun8','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','vdouquan@163.com','','','',''),(32,'chenxiaochun9','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@111.com','','','',''),(33,'huodanyang1','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@111.com','','','',''),(34,'caixinxin10','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@111.com','','','',''),(35,'caixinxin11','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(36,'caixinxin12','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(37,'caixinxin13','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(38,'caixinxin14','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','123@qq.com','','','',''),(39,'caixinxin15','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@111.com','','','',''),(40,'chenmingsheng','7c222fb2927d828af22f592134e8932480637c0d','ming9191@163.com','','','',''),(41,'caixinxin16','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(42,'chenxiaochun','7c222fb2927d828af22f592134e8932480637c0d','ming9191@139.com','','','',''),(43,'chenxiaochun','7c222fb2927d828af22f592134e8932480637c0d','ming9191@163.com','','','',''),(44,'caixinxin13','da39a3ee5e6b4b0d3255bfef95601890afd80709','','','','',''),(45,'12345677889','b480c074d6b75947c02681f31c90c668c46bf6b8','123@qq.com','','','',''),(46,'123456789','b480c074d6b75947c02681f31c90c668c46bf6b8','123@qq.com','','','',''),(47,'caixinxin12','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(48,'chenxiaochun','7c222fb2927d828af22f592134e8932480637c0d','ming9191@139.com','','北京-昌平-朱新庄','100000','17223456789'),(49,'tiantianshengxian','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(50,'tiantianshengxian','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(51,'zhangw','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@111.com','','','',''),(52,'caixinxin22','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','11@11.com','','','',''),(53,'caoxing1','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(54,'zhangwuqia','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(55,'wangjunzhao','7c222fb2927d828af22f592134e8932480637c0d','ming9191@126.com','','北京 -海淀-西二旗','100000','17223456789'),(56,'chenmingsheng','7c222fb2927d828af22f592134e8932480637c0d','ming9191@163.com','','','',''),(57,'lichong','7c222fb2927d828af22f592134e8932480637c0d','ming9191@163.com','','北京 唱平 ','10000','13729289999'),(58,'chong','7c222fb2927d828af22f592134e8932480637c0d','aaa@asdas.com','','','',''),(59,'tiantiansheng','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','',''),(60,'chongs','7c222fb2927d828af22f592134e8932480637c0d','asd@qq.com','','','',''),(61,'ttttttt','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','uuuuuuuuuuuu','666666','5'),(62,'tiantian1','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','111@11.com','','','','');
/*!40000 ALTER TABLE `df_user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-08-26 10:08:29.520589','7','新鲜水果',1,'[{\"added\": {}}]',8,1),(2,'2017-08-26 10:08:33.406858','8','新鲜水果',1,'[{\"added\": {}}]',8,1),(3,'2017-08-26 14:29:29.397605','9','新鲜水果',1,'[{\"added\": {}}]',8,1),(4,'2017-08-26 14:29:50.377839','10','海鲜水产',1,'[{\"added\": {}}]',8,1),(5,'2017-08-26 14:30:06.718823','11','猪牛羊肉',1,'[{\"added\": {}}]',8,1),(6,'2017-08-26 14:30:24.849191','12','禽类蛋品',1,'[{\"added\": {}}]',8,1),(7,'2017-08-26 14:30:35.023368','13','新鲜蔬菜',1,'[{\"added\": {}}]',8,1),(8,'2017-08-26 14:30:45.445098','14','速冻食品',1,'[{\"added\": {}}]',8,1),(9,'2017-08-26 14:38:07.185514','1','赣南橙子',1,'[{\"added\": {}}]',9,1),(10,'2017-08-26 14:44:38.287031','2','赣南橙子',1,'[{\"added\": {}}]',9,1),(11,'2017-08-26 14:54:02.734453','3','橙子',1,'[{\"added\": {}}]',9,1),(12,'2017-08-26 15:04:01.963416','4','青岛野生海捕大青虾',1,'[{\"added\": {}}]',9,1),(13,'2017-08-26 15:07:53.832433','5','草莓',1,'[{\"added\": {}}]',9,1),(14,'2017-08-26 15:11:06.928345','6','葡萄',1,'[{\"added\": {}}]',9,1),(15,'2017-08-26 15:15:41.183420','7','葡萄',1,'[{\"added\": {}}]',9,1),(16,'2017-08-26 15:18:11.732730','8','奇异果',1,'[{\"added\": {}}]',9,1),(17,'2017-08-26 15:24:50.260482','9','扇贝',1,'[{\"added\": {}}]',9,1),(18,'2017-08-26 15:31:26.516773','10','冷冻秋刀鱼',1,'[{\"added\": {}}]',9,1),(19,'2017-08-26 15:35:00.498736','11','螃蟹',1,'[{\"added\": {}}]',9,1),(20,'2017-08-26 15:38:15.229973','12','猪肉',1,'[{\"added\": {}}]',9,1),(21,'2017-08-26 15:40:59.493923','13','牛肉',1,'[{\"added\": {}}]',9,1),(22,'2017-08-26 15:46:11.619768','14','牛肉',1,'[{\"added\": {}}]',9,1),(23,'2017-08-26 15:56:51.408363','15','羊肉',1,'[{\"added\": {}}]',9,1),(24,'2017-08-26 15:59:44.008672','16','鸡蛋',1,'[{\"added\": {}}]',9,1),(25,'2017-08-26 16:02:06.697011','17','鸭蛋',1,'[{\"added\": {}}]',9,1),(26,'2017-08-26 16:04:04.624703','18','鹅蛋',1,'[{\"added\": {}}]',9,1),(27,'2017-08-26 16:07:21.788239','19','鹌鹑蛋',1,'[{\"added\": {}}]',9,1),(28,'2017-08-26 16:10:43.053746','20','白菜',1,'[{\"added\": {}}]',9,1),(29,'2017-08-26 16:14:18.943129','21','茄子',1,'[{\"added\": {}}]',9,1),(30,'2017-08-26 16:21:32.303012','22','豆角',1,'[{\"added\": {}}]',9,1),(31,'2017-08-26 16:24:26.599077','23','黄瓜',1,'[{\"added\": {}}]',9,1),(32,'2017-08-26 16:28:05.118394','24','速冻水饺',1,'[{\"added\": {}}]',9,1),(33,'2017-08-26 16:31:48.591995','25','速冻虾仁',1,'[{\"added\": {}}]',9,1),(34,'2017-08-26 16:36:46.461839','26','各种丸类',1,'[{\"added\": {}}]',9,1),(35,'2017-08-26 16:43:36.490450','27','速冻鱼肉',1,'[{\"added\": {}}]',9,1),(36,'2017-08-26 16:52:07.402685','15','闲时小吃',1,'[{\"added\": {}}]',8,1),(37,'2017-08-27 09:18:32.587320','28','葡萄干',1,'[{\"added\": {}}]',9,1),(38,'2017-08-27 09:21:39.205698','29','碧根果',1,'[{\"added\": {}}]',9,1),(39,'2017-08-27 09:24:36.247918','30','夏威夷果',1,'[{\"added\": {}}]',9,1),(40,'2017-08-27 09:27:40.700571','31','蚕豆',1,'[{\"added\": {}}]',9,1),(41,'2017-08-27 09:30:51.788726','32','瓜子',1,'[{\"added\": {}}]',9,1),(42,'2017-08-27 09:33:31.174451','33','话梅',1,'[{\"added\": {}}]',9,1),(43,'2017-08-27 14:52:13.083349','5','草莓',2,'[]',9,1),(44,'2017-08-27 15:10:18.220145','28','葡萄干',2,'[{\"changed\": {\"fields\": [\"gtj\"]}}]',9,1),(45,'2017-08-27 15:11:04.858672','28','葡萄干',2,'[{\"changed\": {\"fields\": [\"gtj\"]}}]',9,1),(46,'2017-08-27 15:11:36.836090','5','草莓',2,'[]',9,1),(47,'2017-08-27 15:12:45.969063','6','葡萄',2,'[]',9,1),(48,'2017-08-27 15:13:01.013352','8','奇异果',2,'[{\"changed\": {\"fields\": [\"gtj\"]}}]',9,1),(49,'2017-08-27 15:13:12.791969','8','奇异果',2,'[{\"changed\": {\"fields\": [\"gtj\"]}}]',9,1),(50,'2017-08-28 01:11:54.590117','33','话梅',2,'[{\"changed\": {\"fields\": [\"gimage\"]}}]',9,1),(51,'2017-08-28 01:12:06.934554','32','瓜子',2,'[{\"changed\": {\"fields\": [\"gimage\"]}}]',9,1),(52,'2017-08-28 01:12:20.084654','31','蚕豆',2,'[{\"changed\": {\"fields\": [\"gimage\"]}}]',9,1),(53,'2017-08-28 01:12:40.575824','30','夏威夷果',2,'[{\"changed\": {\"fields\": [\"gimage\"]}}]',9,1),(54,'2017-08-28 01:12:50.997526','29','碧根果',2,'[{\"changed\": {\"fields\": [\"gimage\"]}}]',9,1),(55,'2017-08-28 01:13:07.575250','28','葡萄干',2,'[{\"changed\": {\"fields\": [\"gimage\"]}}]',9,1),(56,'2017-08-28 02:30:33.942003','33','话梅',2,'[]',9,1),(57,'2017-08-28 02:30:53.449567','32','瓜子',2,'[]',9,1),(58,'2017-08-28 02:31:45.734002','31','蚕豆',2,'[]',9,1),(59,'2017-08-28 02:32:57.792398','33','话梅',2,'[]',9,1),(60,'2017-08-28 02:33:53.514307','33','话梅',2,'[{\"changed\": {\"fields\": [\"ginfo\"]}}]',9,1),(61,'2017-08-28 02:35:20.690418','33','话梅',2,'[{\"changed\": {\"fields\": [\"ginfo\"]}}]',9,1),(62,'2017-08-28 02:35:45.468461','33','话梅',2,'[]',9,1),(63,'2017-08-28 02:36:03.992356','33','话梅',3,'',9,1),(64,'2017-08-28 02:37:08.446516','34','话梅',1,'[{\"added\": {}}]',9,1),(65,'2017-08-28 02:39:28.622528','34','话梅',2,'[{\"changed\": {\"fields\": [\"ginfo\"]}}]',9,1),(66,'2017-08-28 02:39:54.487005','34','话梅',2,'[{\"changed\": {\"fields\": [\"ginfo\"]}}]',9,1),(67,'2017-08-28 05:45:52.731831','34','话梅',3,'',9,1),(68,'2017-09-01 07:45:55.625634','33','赣南橙子',1,'[{\"added\": {}}]',9,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'df_cart','cartinfo'),(12,'df_order','orderdetailinfo'),(11,'df_order','orderinfo'),(7,'df_user','userinfo'),(9,'goods','goodsinfo'),(8,'goods','typeinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-26 04:15:59.197541'),(2,'auth','0001_initial','2017-08-26 04:16:00.373706'),(3,'admin','0001_initial','2017-08-26 04:16:01.480323'),(4,'admin','0002_logentry_remove_auto_add','2017-08-26 04:16:01.557919'),(5,'contenttypes','0002_remove_content_type_name','2017-08-26 04:16:02.191326'),(6,'auth','0002_alter_permission_name_max_length','2017-08-26 04:16:02.504086'),(7,'auth','0003_alter_user_email_max_length','2017-08-26 04:16:03.755517'),(8,'auth','0004_alter_user_username_opts','2017-08-26 04:16:03.822303'),(9,'auth','0005_alter_user_last_login_null','2017-08-26 04:16:04.616297'),(10,'auth','0006_require_contenttypes_0002','2017-08-26 04:16:04.624657'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-26 04:16:04.654058'),(12,'auth','0008_alter_user_username_max_length','2017-08-26 04:16:04.753515'),(15,'sessions','0001_initial','2017-08-26 04:16:05.005239'),(16,'goods','0001_initial','2017-08-26 08:24:33.947254'),(17,'goods','0002_auto_20170827_1304','2017-08-27 13:05:00.183153'),(26,'df_user','0001_initial','2017-08-28 20:51:30.174517'),(27,'df_user','0002_auto_20170826_0415','2017-08-28 20:51:30.317223'),(31,'df_cart','0001_initial','2017-08-29 08:04:28.636145'),(32,'df_order','0001_initial','2017-08-31 03:50:14.090204');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00avnl5xc1z75z07d22sl6v0j9av36np','YmUyYjQ5MGU4Mzc5Yzc5ZWZjYTJmMDY4YmE1Y2JkNGYxYTFiZjllODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY2ZDQ4ZjZjNDg4YzdkMTM1ZWU2M2JhMmI4YzQ3MTg4YzAxZThmNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-09-09 16:50:12.867869'),('079j7ghdndrw95sdv0fmi3ci9477tsi1','NWFiZDZjNDIxM2ExZjQ3ZWQ3N2QwNjI3ZmRmZWI0YjQ1ZjcxMzZmZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6IndhbmdzaGVuZyJ9','2017-09-09 04:24:01.111024'),('34yuauuvrk9i1je206yehm5hct5h2t97','OGNlMTFmYzRkMmM2NTM5ZmE2MWM3ODA0N2ZhOWU1NzBmMzFmODcxNTp7InVzZXJfbmFtZSI6InRpYW50aWFuc2hlbmciLCJ1c2VyX2lkIjo1OX0=','2017-09-18 01:38:36.997099'),('3jtgthnunulfmbp3ulrmndw1785r2fwr','YjdjNTIyZTc1OTg0M2NiYzJjODc0OTU2NDgxZjBmYTUzMzk4OGE3MDp7InVzZXJfbmFtZSI6ImNob25ncyIsInVzZXJfaWQiOjYwfQ==','2017-09-17 06:43:04.563622'),('4b1vtvdgt35pm35eqpfwe5pom819f5ta','MDRmZDM5YjEwMzQxOGRmNjQ5YTk3YjdmYzA2YmY3MTJiYzVmYWUzOTp7InVzZXJfaWQiOjUyLCJ1c2VyX25hbWUiOiJjYWl4aW54aW4yMiJ9','2017-09-15 14:15:32.232331'),('6m9o6mqg3367tza4d26nj2k4mc4a21sx','OTEwYzNhZWFjNzEyZDViNDhkOWYwMDRiZmVhOTY2ZThlZTBiMTk2Njp7InVzZXJfaWQiOjU3LCJ1c2VyX25hbWUiOiJsaWNob25nIn0=','2017-09-17 06:37:09.501705'),('7tioqd6jnj9odstxfgkkxih2ec0db67a','NjNjZDhhNzJkOWRjNWM1NjA2OTM4YjA2N2QzOGFjZjA3MDkyOTdmNjp7InVzZXJfbmFtZSI6ImxpY2hvbmcxMTEiLCJ1c2VyX2lkIjoyNX0=','2017-09-14 09:43:57.496473'),('8thjyduog9wqp07x14hlzm8y8cciw5ms','NGE2MWNiZjY0MGY5ZDcxZDFkYTE4ZWY0ZmQ4YjEzZmU1NTY5ZDkwMjp7InVzZXJfaWQiOjMxLCJ1c2VyX25hbWUiOiJjaGVueGlhb2NodW44In0=','2017-09-14 11:37:34.177072'),('b8m7c999rwsongvsueyo23hny3d75fms','YzZhZjc3MWNlY2ZkYWNmNWZjNWRlYWRjYzNkMmQ5M2E2MmY2NzEwYTp7InVzZXJfbmFtZSI6InpoYW5nd3VxaWFuZyIsInVzZXJfaWQiOjd9','2017-09-13 07:47:34.664125'),('dj8qky21za3n3bbxfa171d3ooepl4fio','ZmZjNGJkYTA4ZmI3MDhhOTE2ZDgxMDA2YTVhOTU3Mzk2ZTAzNzVkZDp7InVzZXJfaWQiOjcsInVzZXJfbmFtZSI6InpoYW5nd3VxaWFuZyJ9','2017-09-13 07:40:34.434947'),('dqb6yjixbgnnw9bjqav75itiutb04z1g','MDI0ZjUxMjY0YzE4NWZlZTEwZjBiMTk4MGMzMzA5MWU5OTcyMDJlYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9pZCI6NTcsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY2ZDQ4ZjZjNDg4YzdkMTM1ZWU2M2JhMmI4YzQ3MTg4YzAxZThmNSIsInVzZXJfbmFtZSI6ImxpY2hvbmcifQ==','2017-09-18 03:25:31.392157'),('ew1847cvwpqlrh16oszl7ki19ssd0c7o','ZDcyODMxMTRmNzY4ZjRhYjJhMTc4NWU2MmU1MTE1YWNlNTg4NjBiNDp7InVzZXJfaWQiOjU3LCJ1c2VyX25hbWUiOiJsaWNob25nIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRmNmQ0OGY2YzQ4OGM3ZDEzNWVlNjNiYTJiOGM0NzE4OGMwMWU4ZjUifQ==','2017-09-18 06:07:46.903760'),('extamywv17843rssuzrvrl2plq8i7ggf','YzQzNmE2NTZhNmIxMGU0MTc4NjRjMjg4YTI1NGYyMTFlMGQyOGZmNTp7InVzZXJfbmFtZSI6ImNhaXhpbnhpbjE1IiwidXNlcl9pZCI6Mzl9','2017-09-15 00:36:49.009951'),('ezdqrd0mmf2judppvxwrcovd51ecaen4','OTAyYzg5MTk1NTY4NzQxMTA5MzNlMTk5MDBiNDJmODBmNDgzOTU5NDp7InVzZXJfaWQiOjM4LCJ1c2VyX25hbWUiOiJjYWl4aW54aW4xNCJ9','2017-09-15 15:35:20.798786'),('kajef3o7v4hdpdmucf3rb0c5y6ccqqec','ZDdjYjc1ZjQ0YTM4YWJkZDFkMTUyMjFjYzZkMzQ3ZDU3YjM1M2U1MDp7InVzZXJfbmFtZSI6InRpYW50aWFuMSIsInVzZXJfaWQiOjYyfQ==','2017-09-18 03:58:31.295810'),('kdoa3qhzujfn7wn326br5vvv243ifs4v','NmUyMDc1ODRmODY0MTZkNWNjZWNiZGJlY2RjODk0ZjNhNDMxNGIyODp7InVzZXJfaWQiOjMwLCJ1c2VyX25hbWUiOiJjYWl4aW54aW43In0=','2017-09-14 11:31:26.036141'),('lnigdd8u8lrnupvc4vtwl27d1mzm6e88','YWZmYzMwM2ZhYzE1MjhkODcxMGRkMjk5OTQ2MzdlMWQ1Y2FkNWMxODp7InVzZXJfaWQiOjQ5LCJ1c2VyX25hbWUiOiJ0aWFudGlhbnNoZW5neGlhbiJ9','2017-09-15 06:22:37.366154'),('mtn0g3kc65p94hwz1uubf293mi2olk56','MDBhOWE4OTJhOGFhZGJlODNjNDA2NWY1ZTI2YjEzZDRjZWQzMTY2NTp7InVzZXJfbmFtZSI6ImFhYWFhYWFhIiwidXNlcl9pZCI6MTV9','2017-09-14 02:37:02.140281'),('q2izcaxid3hib3z5e3lucw5gk1882er9','OGRjMGNhMTgwMThlODlhMzI1MmU5NWIxMzhhMzBhM2M2ODZiMTVlODp7InVzZXJfaWQiOjM5LCJ1c2VyX25hbWUiOiJjYWl4aW54aW4xNSJ9','2017-09-14 12:18:40.047504'),('qazh9hmnyr4e4ai8xeskau3lj7fxfi7q','ODE5OTljZjc0ZTUyNmNkZDA1MDNkYjc3ZDU2ZTllZDNlMjMxODkyOTp7InVzZXJfaWQiOjM0LCJ1c2VyX25hbWUiOiJjYWl4aW54aW4xMCJ9','2017-09-14 11:52:42.690004'),('v3diuj1r3s8qhzujlko6tq0i0gk77c37','ZWNjYTQ3ZmViMTljMDVlZDllNWU5ZmE1ZTk5YWZkZGJlOTYzY2I4Njp7InVzZXJfbmFtZSI6ImNhaXhpbnhpbjE2IiwidXNlcl9pZCI6NDF9','2017-09-14 13:01:08.518963'),('vifpskb5gwkbr0fwl37o8n09yw2gf23s','YTllMTg5NTlmM2I1ZTc5MDA5NTE1YjM3ZjM1NDhjMjcwMzRjZTYyOTp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImNoZW5taW5nc2hlbmcifQ==','2017-09-11 02:29:26.242027'),('vyudpl4wsnc5juc7a7aieccco2ylq73z','ZTc5ZTc5MTZjODBmODA2NmY3Y2Y2ODZkMTZlODE0MjllODJlYjQ5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9uYW1lIjoiY2FpeGlueGluIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY2ZDQ4ZjZjNDg4YzdkMTM1ZWU2M2JhMmI4YzQ3MTg4YzAxZThmNSIsInVzZXJfaWQiOjUsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-15 02:47:21.359021'),('xoyrhzrpydc1ryjpfge90tumzc5nkotr','OTY4YTMyN2ZhN2E1MzMzYjk4NzJkN2IxODg3ODNlMjNhNTMzYzc0Yjp7InVzZXJfaWQiOjQ2LCJ1c2VyX25hbWUiOiIxMjM0NTY3ODkifQ==','2017-09-14 14:34:03.976523'),('y1vinchrdgfjxxy2a2981sexbmpm3ogn','NjVlODIxYjllYzc5OTk3NTMwMzQwMDA5ZThhMzRmY2Y4MDc1MmIxMTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6ImxpY2hvbmcifQ==','2017-09-15 15:06:19.856533');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsinfo`
--

DROP TABLE IF EXISTS `goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(20) NOT NULL,
  `gimage` varchar(100) NOT NULL,
  `gprice` decimal(5,2) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gtime` datetime(6) NOT NULL,
  `gclick` int(11) NOT NULL,
  `isDetele` tinyint(1) NOT NULL,
  `gdigest` varchar(100) NOT NULL,
  `ginfo` longtext NOT NULL,
  `gkucun` int(11) NOT NULL,
  `gtj` tinyint(1) NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsinfo_gtype_id_b02b0e32_fk_goods_typeinfo_id` (`gtype_id`),
  CONSTRAINT `goods_goodsinfo_gtype_id_b02b0e32_fk_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsinfo`
--

LOCK TABLES `goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `goods_goodsinfo` VALUES (2,'赣南橙子','goods/u26408804811295783988fm72_IHXcKaT.jpg',13.00,'500g','2017-08-26 14:44:17.000000',0,0,'赣南脐橙，江西省赣州市特产，中国国家地理标志产品。','<p>赣南脐橙，江西省赣州市特产，中国国家地理标志产品。[1] 赣南脐橙年产量达百万吨，原产地江西省赣州市已经成为脐橙种植面积世界第一[2] ，年产量世界第三、全国最大的脐橙主产区。[3] 赣南脐橙果大形正，橙红鲜艳，光洁美观，可食率达85%，肉质脆嫩、化渣，风味浓甜芳香，含果汁55%以上。[4] 赣南脐橙已被列为全国十一大优势农产品之一，荣获&ldquo;中华名果&rdquo;等称号。赣南脐橙作为江西省唯一产品，入围商务部、质检总局中欧地理标志协定谈判的地理标志产品清单。[5] 2017年，赣南脐橙列入中欧&ldquo;100+100&rdquo;互认保护名单。[6]</p>',11,1,9),(3,'橙子','goods/c2cec3fdfc0392452c421b918394a4c27c1e25bd.jpg',12.00,'500g','2017-08-26 14:48:55.000000',0,0,'玫瑰香橙','<p>&nbsp; &nbsp; &nbsp;该品种从塔罗科血橙珠心系后代中选育而成。原产于意大利。1965年我国首次从阿尔巴尼亚引入，1972年后又从意大利、阿尔及利亚引入。四川、江西、重庆、湖南有少量栽培其树势强，枝粗叶大，多刺，缓和树势后丰产、稳产，以弱枝结果为主。果实倒卵形或短椭圆形，果梗部有明显沟纹，单果重200-250g，为血橙中最大的晶系，果皮特光滑，成熟时果皮及果肉血红色。果实一般1月下旬成熟，因外观极其美观，迎合中国人喜庆日子喜欢红色的习惯，[5] 玫瑰香橙树形特征 玫瑰香橙树形特征 果实可溶性固形物&ge;12﹪，固酸比&ge;10.0:1，总酸&le;1.3g/100ml,维生素C&ge;60mg/100ml果汁，果汁率&ge;69.0﹪，可食率&ge;70﹪。果大、皮薄、果皮和果肉有玫瑰红果实、无核、细嫩化渣、不枯水，有玫瑰香味。12月底成熟，供货期从12月底至四月底。营养成分中含有一定量的类黄酮甙、-&beta;胡萝卜素、花青素苷、内酯、生物碱、有机酸等。另含根皮酚-&beta;-D-葡萄糖甙及糖类、多种维生素、钙、磷、铁等。果皮还含挥发油1.5～2%。 &nbsp;&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;血橙的营养成分具有很好的保健作用。一个中等大小的血橙可以提供人一天所需的维生素C，提高身体抵挡细菌侵害的能力,清除体内对健康有害的自由基，抑制肿瘤细胞的生长。所有的水果中，柑橘类所含的抗氧化物质最高，包括60多种黄酮类和17种类胡萝卜素。黄酮类物质具有抗炎症、强化血管和抑制凝血的作用。类胡萝卜素具有很强的抗氧化功效。特别血橙富含花青素等成分使血橙对多种癌症的发生有抑制作用。有减少胆结石的发病率、可解油腻，消积食，止渴醒酒、增强毛细血管韧性、降低血脂的作用。[2]</p>',92,1,9),(4,'青岛野生海捕大青虾','goods/timg.jpg',38.00,'500g','2017-08-26 14:48:55.000000',0,0,'青虾','<p>青虾在分类学上隶属于节肢动物门，甲壳纲，十足目，游泳虾亚目，长臂虾科，沼虾属。又名河虾，是在中国广泛栖息的沼虾属中的一种。 由于是一种纯淡水虾，几乎在全国各地都有分布，其中以河北白洋淀地区、江苏太湖一带所产的最为有名。在国外，只有日本有这种虾，所以学名也叫日本沼虾。青虾栖息场所不限于淡水水域，在沿海的低盐度水域中也能生存。现在该虾已经成为我国的著名淡水养殖虾[</p>',100,1,10),(5,'草莓','goods/timg_1.jpg',30.00,'500g','2017-08-26 14:48:55.000000',0,0,'草莓 （蔷薇科草莓属植物）','<p>草莓（学名：Fragaria &times; ananassa Duch.），多年生草本植物。高10-40厘米，茎低于叶或近相等，密被开展黄色柔毛。叶三出，小叶具短柄，质地较厚，倒卵形或菱形，上面深绿色，几无毛，下面淡白绿色，疏生毛，沿脉较密；叶柄密被开展黄色柔毛。聚伞花序，花序下面具一短柄的小叶；花两性；萼片卵形，比副萼片稍长；花瓣白色，近圆形或倒卵椭圆形。聚合果大，宿存萼片直立，紧贴于果实；瘦果尖卵形，光滑。花期4-5月，果期6-7月[1] 。 原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。</p>',95,1,9),(6,'葡萄','goods/timg_2.jpg',5.50,'500g','2017-08-26 14:48:55.000000',0,0,'巨峰葡萄','<p>巨峰葡萄，属中熟类、四倍体品种，欧美杂交种，原产日本。大井上康于1937年用石原早生为母本，森田尼为父本杂交培育。1959年引入中国，并在全国各地大面积推广，成为深受果农欢迎的主栽品种。 巨峰葡萄是生产中的主栽品种之一，适应性强，抗病、抗寒性能好，喜肥水。果实穗大，粒大，平均穗重400-600克，平均果粒重12克左右，最大可达20克。8月下旬成熟，成熟时紫黑色，果皮厚，果粉多，果肉较软，味甜、多汁，有草莓香味，皮、肉和种子易分离，含糖量16%。 巨峰葡萄败花严重，坐果率低，果穗松散，重摘心可以提高巨峰葡萄坐果率，增加产量，改善品质。葡萄开花前7-10天，结果枝在花穗以上保留2-3张叶片、营养枝保留5-6张叶片摘心，主蔓延长枝到立秋前后摘心。结果枝和营养枝除保留先端1个副梢外，其余副梢全部抹除。结果枝和营养枝先端的副梢长到一定长度时分别保留6-8张叶片和8-10张叶片摘心，其上发生的两次副梢和主蔓延长枝的副梢均保留1张叶片反复摘心。在摘心和处理副梢的同时，根据负载量疏去多余果枝、营养枝和果穗，留下的果穗去掉穗尖的1/4至1/5，并去掉副穗。</p>',99,1,9),(7,'葡萄','goods/ning.jpg',3.90,'500g','2017-08-26 14:48:55.000000',0,0,'Villafranca（维拉法兰卡）柠檬','<p>原产意大利西西里岛，中国引自意大利、广东、四川、浙江等省有试种。果实椭圆形，单果重140g左右，少核，果顶部乳突明显，果皮浅黄色，较光滑，果肉柔软多汁，味酸，香气浓，品质佳。</p>\r\n<p>柠檬（学名：Citrus limon (L.) Burm. f.），芸香科柑橘属植物，柠檬又称柠果、洋柠檬、益母果等。[1] 小乔木，枝少刺或近于无刺，嫩叶及花芽暗紫红色，叶片厚纸质，卵形或椭圆形。单花腋生或少花簇生。果椭圆形或卵形，果皮厚，通常粗糙，柠檬黄色，果汁酸至甚酸，种子小，卵形，端尖；种皮平滑，子叶乳白色，通常单或兼有多胚。花期4-5月，果期9-11月。 柠檬产中国长江以南，[2] 原产东南亚，主要产地为美国、意大利、西班牙和希腊。[3] 柠檬因其味极酸，肝虚孕妇最喜食，故称益母果或益母子。柠檬中含有丰富的柠檬酸，因此被誉为&ldquo;柠檬酸仓库&rdquo;。它的果实汁多肉脆，有浓郁的芳香气。因为味道特酸，故只能作为上等调味料，用来调制饮料菜肴、化妆品和药品。[1] 此外，柠檬富含维生素C，能化痰止咳，生津健胃。用于支气管炎，百日咳，食欲不振，维生素缺乏，中暑烦渴等症状，它是\"坏血病\"的克星。[4]</p>',100,1,9),(8,'奇异果','goods/qiyiguo.jpg',25.80,'500g','2017-08-26 14:48:55.000000',0,0,'猕猴桃','<p>猕猴桃（学名：Actinidia chinensis Planch），也称奇异果（奇异果是猕猴桃的一个人工选育品种，因使用广泛而成为了猕猴桃的代称）[1] 。果形一般为椭圆状，早期外观呈绿褐色，成熟后呈红褐色，表皮覆盖浓密绒毛，可食用，其内是呈亮绿色的果肉和一排黑色或者红色的种子。因猕猴喜食，故名猕猴桃；亦有说法是因为果皮覆毛，貌似猕猴而得名，是一种品质鲜嫩，营养丰富，风味鲜美的水果。 猕猴桃的质地柔软，口感酸甜。味道被描述为草莓、香蕉、菠萝三者的混合。猕猴桃除含有猕猴桃碱、蛋白水解酶、单宁果胶和糖类等有机物，以及钙、钾、硒、锌、锗等微量元素和人体所需17种氨基酸外，还含有丰富的维生素C、葡萄酸、果糖、柠檬酸、苹果酸、脂肪。 猕猴桃原产地在中国湖南省湘西地区[2] ，秦岭北麓的陕西是中国猕猴桃资源最丰富的地区，民间人工栽培的历史达一千多年[2] 。</p>',100,1,9),(9,'扇贝','goods/shanbei.jpg',46.00,'500g','2017-08-26 14:48:55.000000',0,0,'虾夷扇贝','<p>&nbsp; &nbsp; 贝类软体动物中，含一种具有降低血清胆固醇作用的代尔太7-胆固醇和24-亚甲基胆固醇，它们兼有抑制胆固醇在肝脏合成和加速排泄胆固醇的独特作用，从而使体内胆固醇下降。它们的功效比常用的降胆固醇的药物胆固醇更强。人们在食用贝类食物后，常有一种清爽宜人的感觉，这对解除一些烦恼症状无疑是有益的。</p>\r\n<p>1、健脑：富含碳水化合物，维持大脑功能必须的能源。 2、明目：富含钙，增加眼球壁的弹力，防治近视的发生与发展。 3、健脾和胃:适用于脾气虚弱，运化无力所致的脘腹胀满，大便溏泄，食欲不振，肢倦乏力等症。暖胃，治疗胃寒症。 4、润肠：纤维素可以促进肠壁的蠕动，帮助消化，防止大便干燥。 5、养颜护肤：含有丰富的维生素E，抑制皮肤衰老、防止色素沉着。驱除因皮肤过敏或是感染而引起的皮肤干燥和瘙痒等皮肤损害。 6、通血：适宜肤色没有光华，失去红润、手脚冰冷的人群。铁的含量高，吸收好。 7、抑癌抗瘤：有效预防癌症，降低癌变的发生率。延缓和抑制癌细胞生长、扩散。使癌细胞退化、萎缩。</p>\r\n<p>&nbsp; &nbsp; 营养价值 以每100克计 能量60千卡 蛋白质11.1克 脂肪0.6克 碳水化合物2.6克 胆固醇140毫克 核黄素0.1毫克 烟酸0.2毫克 维生素E11.85毫克 钙142毫克 磷132毫克 钾122毫克 钠339毫克 镁39毫克 铁7.2毫克 锌11.69毫克 硒20.22微克 铜0.48毫克 锰0.7毫克</p>',90,1,10),(10,'冷冻秋刀鱼','goods/qiudaoyu.jpg',46.00,'500g','2017-08-26 14:48:55.000000',0,0,'秋刀鱼','<p>体内含丰富的蛋白质和脂肪等，味道鲜美，所以蒸、煮、煎、烤都可以，而且价格便宜（在日本产地市场的销价每公斤70-90日元之间）[6] 。从上海水产大学对秋刀鱼营养成分分析来看，秋刀鱼蛋白质含量为20.7%。[1] 秋刀鱼体内含有丰富的蛋白质、脂肪酸，据分析，秋刀鱼含有人体不可缺少的二十碳五烯酸（EPA）、二十二碳六烯酸（DHA）等不饱和脂肪酸，EPA、DHA有抑制高血压、心肌梗塞、动脉硬化的作用。 秋刀鱼鲜样的常规营养成分含量为：水分（60.62&plusmn;0.48）%；灰分（0.75&plusmn;0.01）%；粗蛋白质含量（17.63&plusmn;0.34）%，低于银鲳[5]，接近小黄鱼[6]，高于鳕鱼[6]、太平洋褶柔鱼[7]和四大家系大黄鱼[8]等海洋经济鱼类。粗脂肪含量达(21.04&plusmn;0.60)%，高于许多高脂海洋经济鱼类：带鱼和四大家系大黄鱼[8]等；低于挪威三文鱼[9]。实验结果表明，秋刀鱼属于高脂肪、高蛋白的海水鱼类。据报道，在一定的范围内，风味随肌肉脂肪含量的增加而增加，当肌肉脂肪含量达到鲜样的(3.5～4.5)%才会有良好的适口性。秋刀鱼的粗脂肪含量很高，故具有很好的口感。[7]</p>',95,1,10),(11,'螃蟹','goods/pangxie.jpg',30.00,'500g','2017-08-26 14:48:55.000000',0,0,'中华绒螯蟹','<p>中华绒螯蟹是一种经济蟹类，又称河蟹、毛蟹、清水蟹、大闸蟹。为中国久负盛名的美食。其螯足用于取食和抗敌，掌部内外缘密生绒毛，绒螯蟹因此而得名。杂食性动物，鱼、虾、螺、蚌、蠕虫、蚯蚓、昆虫及其幼虫等均可作为大闸蟹的动物性饵料。 蟹中含有较多的维生素A，对皮肤的角化有帮助；对儿童的佝偻病，老年人的骨质疏松也能起到补充钙质的作用。中国境内广泛分布于南北沿海各地湖泊，其中以长江水系产量最大，口感极其鲜美。其中又以固城湖大闸蟹最为著名，历来被称为蟹中之冠，是国家工商总局认定为中国驰名商标，其他较为著名的还有太湖大闸蟹、阳澄湖大闸蟹、长荡湖大闸蟹等</p>',99,1,10),(12,'猪肉','goods/zhurou.jpg',15.00,'500g','2017-08-26 14:48:55.000000',0,0,'鲜猪肉','<p>猪肉又名豚肉，是主要家畜之一、猪科动物家猪的肉。其性味甘咸平，含有丰富的蛋白质及脂肪、碳水化合物、钙、铁、磷等成分。 [1] 猪肉是日常生活的主要副食品，具有补虚强身，滋阴润燥、丰肌泽肤的作用。凡病后体弱、产后血虚、面黄赢瘦者，皆可用之作营养滋补之品。 猪肉是人们餐桌上重要的动物性食品之一。因为猪肉纤维较为细软，结缔组织较少，肌肉组织中含有较多的肌间脂肪，因此，经过烹调加工后肉味特别鲜美。</p>',96,1,11),(13,'牛肉','goods/lvrou.jpg',22.90,'500g','2017-08-26 14:48:55.000000',0,0,'鲜驴肉','<p>驴肉，是指驴的肉，它的不饱和脂肪酸含量，尤其是生物价值特高的亚油酸、亚麻酸的含量都远远高于猪肉、牛肉。[1] &ldquo;天上龙肉，地上驴肉&rdquo;，是人们对驴肉的最高褒扬。 鲁西、鲁东南、皖北、皖西、豫西北、晋东南、晋西北、陕北、河南，河北一带许多地方形成了独具特色的传统食品和地方名吃。如青州府夹河驴肉、肥东石塘训字驴肉、莒南老地方驴肉、二庙居村驴肉、高唐老王寨驴肉，河间驴肉烧饼、广饶肴驴肉、保定漕河驴肉火烧、曹记驴肉、米脂驴肉 ，上党腊驴肉、洛阳的驴肉汤、焦作闹汤驴肉、保店驴肉等</p>\r\n<p>简介】：驴肉具有&ldquo;两高两低&rdquo;的特点：高蛋白，低脂肪；高氨基酸，低胆固醇。对动脉硬化、冠心病、高血压有着良好的保健作用。另外还含有动物胶，骨胶朊和钙等成分，能为老人、儿童、体弱者和病后调养的人提供良好的营养补充。 【别名】：毛驴肉，漠骊肉 驴肉火烧 驴肉火烧 【英文名】：Donkeye as food 【详细介绍】：所属分类：肉类 【适宜人群】：一般人均可食用，身体瘦弱者尤宜。适于积年劳损，久病之后的气血亏虚，短气乏力，倦怠羸瘦，食欲不振，心悸眼差，阴血不足，风眩肢挛，不寐多梦、功能性子宫出血和出血性紫癜等症；平素脾胃虚寒，有慢性肠炎、腹泻者忌食驴肉。 【不适宜人群】：平素脾胃虚寒、有慢性肠炎、腹泻患者。 【选购宜】：挑选熟驴肉先要看包装，包装应密封、无破损、无胀袋，注意熟肉制品的色泽，尽量不要挑选色泽太艳的食品，因为色泽太艳可能是人为加入的合成色素或发色剂亚硝酸盐造成的。 【选购忌】：肌肉部分呈暗褐色无光泽为次鲜驴肉。 【烹调宜】：用驴肉做菜时，可用少量苏打水调和，这样可以去除驴肉的腥味。制作驴肉时，可配些蒜汁、姜末，既能杀菌，又可除味。 【烹调忌】：驴肉烹调忌荆芥。 【食用宜】：驴肉肉质鲜嫩可口，易于消化，是老年人的滋补佳品。驴肉具有补气血、益脏腑等功效，是久病初愈、气血亏虚者的食疗佳品。 【食用忌】：孕妇、脾胃虚寒、慢性肠炎、腹泻者最好不要食用。</p>',95,1,11),(14,'牛肉','goods/lvrou_KkvtbJC.jpg',25.90,'500g','2017-08-26 14:48:55.000000',0,0,'新鲜牛肉','<p>牛肉是世界第三消耗肉品，约占肉制品市场的25%。落后于猪肉（38%）和家禽（30%）。美国、巴西和中国是世界消费牛肉前三的国家。按2009年人年消费来看，阿根廷以64.6千克排名第一，美国为42.1千克，欧洲为11.9千克。最大的牛肉出口国包括印度、巴西、澳大利亚和美国。牛肉制品对于巴拉圭、阿根廷、爱尔兰、墨西哥、新西兰、尼加拉瓜、乌拉圭的经济有重要影响。</p>\r\n<p>牛肉含有丰富的蛋白质，氨基酸。其组成 牛肉 牛肉(5张) 比猪肉更接近人体需要，能提高机体抗病能力，对生长发育及手术后、病后调养 的人在补充失血和修复组织等方面特别适宜。 中医食疗认为：寒冬食牛肉，有暖胃作用，为寒冬补益佳品。中医认为：牛肉有补中益气、滋养脾胃、强健筋骨、化痰息风、止渴止涎的功能。适用于中气下陷、气短体虚，筋骨酸软和贫血久病及面黄目眩之人食用。</p>',95,1,11),(15,'羊肉','goods/yangrou.jpg',29.90,'500g','2017-08-26 15:55:42.000000',0,0,'内蒙古鄂尔多斯羊肉','<p>鄂尔多斯荒漠草原得天独厚的自然条件，经过长期的自然选择，孕育出世界一流的绒肉兼优型珍稀品种&mdash;&mdash;阿尔巴斯白绒山羊。阿尔巴斯白绒山羊被列为中国20个优良品种之一，其羊绒被誉为&ldquo;软黄金&rdquo;、&ldquo;纤维宝石&rdquo;，其肉被誉为&ldquo;肉中人参&rdquo;。</p>\r\n<p>羊肉鲜嫩，营养价值高，凡肾阳不足、腰膝酸软、腹中冷痛、虚劳不足者皆可用它作食疗品。羊肉营养丰富，对肺结核、气管炎、哮喘、贫血、产后气血两虚、腹部冷痛、体虚畏寒、营养不良、腰膝酸软,阳痿早泄以及一切虚寒病症均有很大裨益；具有补肾壮阳、补虚温中等作用，男士适合经常食用。</p>',119,0,11),(16,'鸡蛋','goods/jidan.jpg',12.90,'500g','2017-08-26 15:55:42.000000',0,0,'鲜鸡蛋','<p>据分析，每百克鸡蛋含蛋白质12.8克，主要为卵白蛋白和卵球蛋白，其中含有人体必需的8种氨基酸，并与人体蛋白的组成极为近似，人体对鸡蛋蛋白质的吸收率可高达98%。每百克鸡蛋含脂肪11～15克，主要集中在蛋黄里，也极易被人体消化吸收，蛋黄中含有丰富的卵磷脂、固醇类、蛋黄素以及钙、磷、铁、维生素A、维生素D及B族维生素。这些成分对增进神经系统的功能大有裨益，因此，鸡蛋又是较好的健脑食品。 一个鸡蛋所含的热量，相当于半个苹果或半杯牛奶的热量，但是它还拥有8%的磷、4%的锌、4%的铁、12. 6%的蛋白质、6%的维生素D、3%的维生素E、6%的维生素A、2%的维生素B、5%的维生素B2、4%的维生素B6。这些营养都是人体必不可少的，它们起着极其重要的作用，如修复人体组织、形成新的组织、消耗能量和参与复杂的新陈代谢过程等。</p>',115,0,12),(17,'鸭蛋','goods/yadan.jpg',15.90,'500g','2017-08-26 15:55:42.000000',0,0,'鲜鸭蛋','<p>鸭蛋性味甘、凉，具有滋阴清肺的作用，入肺、脾经；有大补虚劳、滋阴养血、润肺美肤等功效；适应于病后体虚、燥热咳嗽、咽干喉痛、高血压、腹泻痢疾等病患者食用。用于膈热、咳嗽、喉痛、齿痛。</p>\r\n<p>鸭蛋（Duck\'s egg），又名鸭子、鸭卵、太平、鸭春、青皮等，为鸭科动物家鸭的卵，可孵化成小鸭。主要含蛋白质、脂肪、钙、磷、铁、钾、钠、氯等营养成分。</p>',120,0,12),(18,'鹅蛋','goods/edan.jpg',18.90,'500g','2017-08-26 15:55:42.000000',0,0,'鲜鹅蛋','<p>鹅蛋（拼音：&eacute; d&agrave;n），是家禽鹅生下的卵。鹅蛋成椭圆形，个体很大，味道有些油，新鲜的鹅蛋必须烹饪后食用。鹅蛋中含有丰富的营养成分，如蛋白质、脂肪、矿物质和维生素等。 因为鹅蛋有一种叫卵磷脂的物质，能帮助消化，还富含丰富的蛋白质，比鸡蛋的鸭蛋要高出许多倍。此外，鹅蛋有一种碱性物质，对内脏有损坏。</p>\r\n<p>营养分析 鹅蛋中含有丰富的营养成分，如蛋白质、脂肪、矿物质和维生素等； 鹅蛋中含有多种蛋白质，最多和最主要的是蛋白中的卵白蛋白和蛋黄中的卵黄磷蛋白，蛋白质中富有人体所必须的各种氨基酸，是完全蛋白质，易于人体消化吸收； 鹅蛋中的脂肪绝大部分集中在蛋黄内，含有较多的磷脂，其中约一半是卵磷脂，这些成分对人的脑及神经组织的发育有重大作用； 鹅蛋中的矿物质主要含于蛋黄内，铁、磷和钙含量较多，也容易被人体吸收利用； 鹅蛋中的维生素也很丰富，蛋黄中有丰富的维生素A、D、E、核黄素和硫胺素，蛋白中的维生素以核黄素和尼克酸居多，这些维生素也是人体所必须的维生素。</p>',107,0,12),(19,'鹌鹑蛋','goods/edan_sDTkjDt.jpg',10.90,'500g','2017-08-26 15:55:42.000000',0,0,'鲜鹌鹑蛋','<p>鹌鹑蛋又名鹑鸟蛋、鹌鹑卵。鹌鹑蛋被认为是&ldquo;动物中的人参&rdquo;。宜常食为滋补食疗品。鹌鹑蛋在营养上有独特之处，故有\"卵中佳品\"之称。</p>\r\n<p>鹌鹑蛋每百克可食部含蛋白质12.8克，脂肪11.1克，碳水化合物2.1克，维生素A337微克，硫胺素0.11毫克，核黄素0.49毫克，维生素E3.08毫克，钾138毫克，钠106.6毫克，镁11毫克，锰0.04毫克，锌1.61毫克，结核病、高血压、代谢障碍等有助益。海外报道其对因食虾蟹或某些药物引致的过敏反应有抑制作用。 鹌鹑蛋丰富的蛋白质、脑磷脂、卵磷脂、赖氨酸、胱氨酸、维A、维B2、维B1.铁、磷、钙等营养物质，可补气益血，强筋壮骨。功效：补气益血，治风湿，强筋壮骨。 鹌鹑蛋中氨基酸种类齐全，含量丰富，还有高质量的多种磷脂，激素等人体必需成分，铁、核黄素、维生素A的含量均比同量鸡蛋高出两倍左右，而胆固醇则较鸡蛋低约三分之一，所以是各种虚弱病者及老人、儿童及孕妇的理想滋补食品。鹌鹑蛋含有较高的蛋白质，脑磷脂、卵磷脂、铁和维生素等。但是鹌鹑蛋胆固醇太高，不宜多食。</p>',110,0,12),(20,'白菜','goods/baicai.jpg',3.55,'500g','2017-08-26 15:55:42.000000',0,0,'包芯白菜','<p>白菜营养丰富，除含糖类、脂肪、蛋白质、粗纤维、钙、磷、铁、胡萝卜素、维生素B1、维生素B2外，尚含丰富的维生素，其维生素C、维生素B2的含量比苹果、梨分别高5倍、4倍；微量元素锌高于肉类，并含有能抑制亚硝酸胺吸收的钼。其中维生素C，可增加机体对感染的抵抗力，用于坏血病、牙龈出血、各种急慢性传染病的防治。白菜中含有的纤维素，可增强肠胃的蠕动，减少粪便在体内的存留时间，帮助消化和排泄，从而减轻肝、肾的负担，防止多种胃病的发生。 白菜中所含的果胶，可以帮助人体排除多余的胆固醇。更主要的白菜中还含有微量的钼，可抑制人体内亚硝酸胺的生成、吸收，起到一定的防癌作用。此外，白菜本身所含热量极少，不至于引起热量储存。白菜中含钠也很少，不会使机体保存多余水分，可以减轻心脏负担。中老年人和肥胖者，多吃白菜还可以减肥。 大白菜含水量丰富，高达95%。冬天天气干燥，多吃白菜，可以起到很好的滋阴润燥、护肤养颜的作用。大白菜含维生素丰富，常吃大白菜可以起到抗氧化、抗衰老作用。大白菜中还含有丰富的钙、锌、硒等矿物质。其膳食纤维也很丰富，常吃能起到润肠通便、促进排毒的作用，对预防肠癌有良好作用。</p>',99,0,13),(21,'茄子','goods/qiezi.jpg',4.58,'500g','2017-08-26 15:55:42.000000',0,0,'紫茄子','<p>⒈茄子的营养丰富，含有蛋白质、脂肪、碳水化合物、维生素以及钙、磷、铁等多种营养成分。 ⒉茄子中维生素P的含量很高，每100克中即含维生素P750毫克。能增强人体细胞间的黏着力，增强毛细血管的弹性，减低脆性及渗透性，防止微血管破裂出血。 ⒊茄子还含磷、钙、钾等微量元素和胆碱、胡芦巴碱、水苏碱、龙葵碱等多种生物碱。尤其是紫色茄子中维生素含量更高。可以抑制消化道肿瘤细胞的增值。 ⒋茄子纤维中所含的维生素C和皂草甙，具有降低胆固醇的功效。国外学者提出&ldquo;降低胆固醇12法&rdquo;，食用茄子即是其中方法之一。 ⒌茄子所含的B族维生素对痛经、慢性胃炎及肾炎水肿等也有一定辅助治疗作用。</p>',94,0,13),(22,'豆角','goods/doujiao.jpg',5.59,'500g','2017-08-26 15:55:42.000000',0,0,'虹豆豆角','<p>豆角的豆荚长而像管状，质脆而身软，从豆荚的长短可分为长豆角(30厘米以上)和短豆角;从豆角的颜色可分为白豆角、青豆角和红皮豆角。豆角富含蛋白质及少量胡萝卜素、维生素B和维生素C，是一种营养价值较高的蔬菜;豆角干物质中蛋白质含量约为2.7%，是很好的植物蛋白质来源。豆角所含的碳水化合物能起到类似粮食的作用，人们常将豆角作为主菜食用。豆角除了有健脾、和胃的作用外，最重要的是能够补肾。李时珍曾称赞它能够&ldquo;理中益气，补肾健胃，和五脏，调营卫，生精髓&rdquo;;所谓&ldquo;营卫&rdquo;，就是中医所说的营卫二气，调整好了，可充分保证人的睡眠质量;此外，多吃豆角还能治疗呕吐、打隔等不适;小孩食积、气胀的时候，用生豆角适量，细嚼后咽下，可以起到一定的缓解作用。豆角中的纤维有利于降低人体内的胆固醇，适用于高血脂人群;还能加强胃肠蠕动，有利于防止便秘。豆角具有较高的营养价值，又有多方面的功能，因此，深受人们的喜爱。[3]</p>',100,0,13),(23,'黄瓜','goods/huanggua.jpg',4.39,'500g','2017-08-26 15:55:42.000000',0,0,'青黄瓜','<p>黄瓜味甘，甜、性凉、苦、无毒，入脾、胃、大肠；具有除热，利水利尿，清热解毒的功效；主治烦渴，咽喉肿痛，火眼，火烫伤。还有减肥功效。 黄瓜皮所含营养素丰富，应当保留生吃。但为了预防农药残留对人体的伤害，黄瓜应先在盐水中泡15-20分钟再洗净生食。用盐水泡黄瓜时切勿掐头去根，要保持黄瓜的完整，以免营养素在泡的过程中从切面流失。另外，凉拌菜应现做现吃，不要做好后长时间放置，这样也会促使维生素损失。</p>',100,0,13),(24,'速冻水饺','goods/shuijiao.jpg',4.39,'500g','2017-08-26 15:55:42.000000',0,0,'速冻猪肉大葱水饺','<p>水饺选用的是五得利、中粮、益海嘉里等大厂专供无添加剂的专用饺子粉，通过真空和面机和纯净水和面，饺子皮首先保证麦香浓郁，其次达到微透爽滑的效果。什么是菜有菜香？通俗的说，就是芹菜就是芹菜、韭菜就是韭菜、大葱就是大葱，什么口味的饺子就要有什么蔬菜的味道，比如北方人们喜欢的猪肉大葱饺子，在吃的时候一定有地道的大葱味道，猪肉芹菜馅的饺子，在吃的时候必须有纯正浓郁的芹菜味道，而有些厂家因为成本问题在调馅儿时大量加入填充类蔬菜，大葱、芹菜的含量很少，吃的时候基本上没有芹菜的味道，双阳水饺在制作馅料时除了鲜肉和少量葱花、姜末、等天然香辛料之外都是地道的地产大葱、芹菜、韭菜，（至于有些口味比如大葱馅添加甘蓝是为了降低大葱的呛味和苦涩味，提升口味与成本无关）并且这种芹菜经过杀青去处芹菜本身的涩味，保持其清香，做出的饺子能够体现食材本身的香气。期待中的双阳小饺子更是把&ldquo;面有面味 菜有菜香&rdquo;发挥到极致。</p>',96,0,14),(25,'速冻虾仁','goods/xiaren.jpg',12.29,'500g','2017-08-26 15:55:42.000000',0,0,'速冻大虾仁','<p>冻虾仁是指冷冻了的虾仁，一般情况下将虾仁放在-18℃的库中冷藏。 把鲜对虾加冰送至加工车间分级，取规格较小的对虾简单清洗一遍，肃掉虾壳，去除肠腺，用冰水洗净，然后按虾仁大小规格分级，并再清洗一次，放入筛盘内控水[1] 10分钟，称重后摆盘，放进-25℃以下的冷冻间冻结（冻盘中应加入适量的水）冻结完成后，进行脱盘包装，放在-18℃的库中冷藏。</p>',100,0,14),(26,'各种丸类','goods/wanlei.jpg',12.29,'500g','2017-08-26 15:55:42.000000',0,0,'速冻火锅涮锅丸类','<p>冷却食品：不需要冻结，是将食品的温度降到接近冻结点，并在此温度下保藏的食品。 冻结食品：是冻结后在低于冻结点的温度保藏的食品。 冷却食品和冻结食品合称冷冻食品，可按原料及消费形式分为果蔬类、水产类、肉禽蛋类、米面制品[1] 、调理方便食品类这五大类。</p>',100,0,14),(27,'速冻鱼肉','goods/yu.jpg',14.59,'500g','2017-08-26 15:55:42.000000',0,0,'速冻鱼肉','<p>冷冻食品分为冷却食品和冻结食品，冷冻食品易保藏，广泛用于肉、禽、水产、乳、蛋、蔬菜和水果等易腐食品的生产、运输和贮藏；营养、方便、卫生、经济；市场需求量大，在发达国家占有重要的地位，在发展中国家发展迅速。</p>',96,0,14),(28,'葡萄干','goods/putaogan.jpg',12.90,'500g','2017-08-27 09:16:41.000000',100,0,'白葡萄干','<p>葡萄干内含大量葡萄糖，对心肌有营养作用，有助于冠心病患者的康复；[2] 葡萄干还含有多种矿物质和维生素、氨基酸，常食对神经衰弱和过度疲劳者有较好的补益作用，还是妇女病的食疗佳品。 不少干果都有其促进人体健康的绝招，而葡萄干所含的营养成分更是令营养学家赞叹不已，美国营养学家前不久做过的一项研究表明，如果每天摄食相当于400卡热量的葡萄干，能有效降低血中胆固醇，同时还能抑制血中坏胆固醇的氧化。此外，葡萄干能改善直肠的健康，因为葡萄干含有纤维和酒石酸，能让排泄物快速通过直肠，减少污物在肠中停留的时间。更令人兴奋的是，葡萄干中含有一种称为白藜芦醇的成分，它能有效地防止细胞恶变或抑制恶性肿瘤的增长，而且能阻止白血病细胞的分裂。另外，葡萄干中的纤维能防止果糖在血液中转化成三酸甘油酯&mdash;&mdash;&mdash;一种血液脂肪，从而降低罹患心脏病的危险。</p>',123,0,15),(29,'碧根果','goods/biganguo.jpg',23.29,'500g','2017-08-27 09:20:50.000000',68,0,'甜口碧根果','<p>碧根果[4] （pecan，又名美国山核桃（caryaillinoensiskoch）、长寿果）属胡桃科的山核桃属，又名薄壳山核桃或长山核桃，英文名为pecan或hickory。 碧根果 碧根果(5张) 碧根果果型如大橄榄状，肉多而香，是世界十大坚果之一。碧根果外形是长椭圆型的干果，原产北美大陆的美国和墨西哥北部现已成为世界性的干果类树种之一，其种仁有优异的食疗保健价值。 优质碧根果皮很薄，可以用手剥开，果仁的味道界于我们常吃的山核桃和大核桃之间，口感香浓酥脆令人赞不绝口。 它是全世界17种山核桃之一，属纯野生果类，是集山地之灵气哺育而成，无任何公害污染的天然绿色食品。</p>',134,0,15),(30,'夏威夷果','goods/xiaweiyiguo.jpg',25.00,'500g','2017-08-27 09:20:50.000000',68,0,'澳洲坚果','<p>澳洲坚果被认为是世界上最好的桌上坚果之一。他们含有高量的油，因此非常育肥。 澳洲坚果营养丰富，含油量 70% -79%， 尤其以富含不饱和脂肪酸为特点，以油酸和棕榈酸为主，光壳种澳洲坚果种仁的不饱和脂肪酸与饱和脂肪酸的比值为6.2，粗壳种为4.8；蛋白质9% ，还含有丰富的钙，磷 ，铁，维生素B1、B2和人体必需的8种氨基酸。 澳洲坚果果仁香酥滑嫩可口，有独特的奶油香味，是世界上品质较佳的食用坚果，素有&ldquo;干果皇后&rdquo;&ldquo;世界坚果之王&rdquo;之美称 ，风味和口感都远比腰果好 。</p>',134,0,15),(31,'蚕豆','goods/candou.jpg',12.29,'500g','2017-08-27 09:20:50.000000',68,0,'咸口兰花豆','<p>蚕豆含蛋白质、碳水化合物、粗纤维、磷脂、胆碱、维生素B1、维生素B2、烟酸、和钙、铁、磷、钾等多种矿物质，犹其是磷和钾含量较高。 祖国医学认为，扁豆味甘、微辛。归脾、胃经。有治疗脾胃不键、水肿等病症的功效。[4</p>',134,0,15),(32,'瓜子','goods/guazi.jpg',15.29,'500g','2017-08-27 09:20:50.000000',68,0,'洽洽瓜子','<p>瓜子本身营养就很高，其中所含有的维生素、蛋白质、油类含量都属佼佼者。 瓜子 瓜子 &ldquo;嗑&rdquo;更让人受益颇多，不仅能增强消化功能，这是因 为瓜子的香味刺激了舌头上的&ldquo;味蕾&rdquo;，使它呈兴奋状态，传至消化器官，各种消化酶的唾液、胃液等的分泌相应地旺盛起来，无疑利于消食化滞。饭前嗑，促进食欲；饭后嗑，促进消化食物。尤其是在吃了油腻的食物后嗑一 把瓜子，好处更大。 饭后嗑瓜子好，因为葵花子与西瓜子都富含脂肪、蛋白质、锌等微量元素，可增强消化功能。嗑瓜子能够使整个消化系统活跃起来。瓜子的香味刺激舌头上的味蕾，味蕾将这种神经冲动传导给大脑，大脑又反作用于唾液腺等消化器官，使含有多种消化酶的唾液、胃液等的分泌相对旺盛。</p>',134,0,15),(33,'赣南橙子','goods/timg_ZKUfmAY.jpg',12.00,'500g','2017-09-01 07:44:35.000000',6,0,'赣南脐橙，江西省赣州市特产，中国国家地理标志产品。[1]  赣南脐橙年产量达百万吨，原产地江西省赣州市已经成为脐橙种植面积世界第一[2]  ，年产量世界第三、全国最大的脐橙主产区。','<p>sfcsacsae</p>',121,1,9);
/*!40000 ALTER TABLE `goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_typeinfo`
--

DROP TABLE IF EXISTS `goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_typeinfo`
--

LOCK TABLES `goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `goods_typeinfo` DISABLE KEYS */;
INSERT INTO `goods_typeinfo` VALUES (9,'新鲜水果',0),(10,'海鲜水产',0),(11,'猪牛羊肉',0),(12,'禽类蛋品',0),(13,'新鲜蔬菜',0),(14,'速冻食品',0),(15,'闲时小吃',0);
/*!40000 ALTER TABLE `goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-04 19:44:05

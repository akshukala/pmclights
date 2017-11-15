-- MySQL dump 10.13  Distrib 5.7.11, for Linux (x86_64)
--
-- Host: localhost    Database: pmclights
-- ------------------------------------------------------
-- Server version	5.7.11-0ubuntu6

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'pmcadmin');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add subdivision',7,'add_subdivision'),(20,'Can change subdivision',7,'change_subdivision'),(21,'Can delete subdivision',7,'delete_subdivision'),(22,'Can add feederdata',8,'add_feederdata'),(23,'Can change feederdata',8,'change_feederdata'),(24,'Can delete feederdata',8,'delete_feederdata'),(25,'Can add feeder',9,'add_feeder'),(26,'Can change feeder',9,'change_feeder'),(27,'Can delete feeder',9,'delete_feeder'),(28,'Can add division',10,'add_division'),(29,'Can change division',10,'change_division'),(30,'Can delete division',10,'delete_division'),(31,'Can add alaram',11,'add_alaram'),(32,'Can change alaram',11,'change_alaram'),(33,'Can delete alaram',11,'delete_alaram'),(34,'Can add user data',12,'add_userdata'),(35,'Can change user data',12,'change_userdata'),(36,'Can delete user data',12,'delete_userdata'),(37,'Can add alarm',11,'add_alarm'),(38,'Can change alarm',11,'change_alarm'),(39,'Can delete alarm',11,'delete_alarm'),(40,'Can add send to client',13,'add_sendtoclient'),(41,'Can change send to client',13,'change_sendtoclient'),(42,'Can delete send to client',13,'delete_sendtoclient'),(43,'Can add error log',14,'add_errorlog'),(44,'Can change error log',14,'change_errorlog'),(45,'Can delete error log',14,'delete_errorlog');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$WJovvUsLPjw4$/Sxo2K01NkowTxHNrJVm9J20TdVSvODFkgV1WVR7k0E=','2017-05-13 07:47:52.202592',1,'ledtek','','','ledtekindia@gmail.com',1,1,'2017-05-04 07:21:01.635903'),(2,'pbkdf2_sha256$36000$6HKNIlIp6CFE$mFArTAEsVMZQdGOUZe1DuS9+62nu00+G9ohOBXSbHdU=','2017-05-18 11:44:19.487682',0,'test_user','','','',0,1,'2017-05-04 07:22:20.000000'),(3,'pbkdf2_sha256$36000$uKk0Qfs36r6K$AfmZo32kPxjEGXQl5zKnVcbnB6Xe9K8sSc9gc4eqcOs=','2017-05-12 11:50:02.847835',0,'akshay','Akshay','Kale','',0,1,'2017-05-09 17:02:40.092830'),(4,'pbkdf2_sha256$36000$O4G1fR1TdCPd$Om+OxHX1uXU6TLlxzz1n9d8l+oik7Z7zrLdYlZ0OwUM=','2017-05-18 11:40:28.020470',0,'ganesh','Ganesh','Bodkhe','',0,1,'2017-05-09 17:04:50.302161'),(5,'pbkdf2_sha256$36000$TA5giHn8QYYD$vEKXG5Mg1iZK1/walRFyF4QSFGzl4X0vRGZtPpBwg7U=',NULL,0,'amol','Amol','Suryawanshi','',0,1,'2017-05-09 17:05:47.439062'),(6,'pbkdf2_sha256$36000$NiEUzWJIqTEG$kcVDdwIYx6VFZGHTjF+sCYwAZ2XjxvaoOq67cy3ZI6M=',NULL,0,'akash','Akash','Sangle','',0,1,'2017-05-12 12:18:15.719851'),(7,'pbkdf2_sha256$36000$awI5Pclt1vEE$QHuYGm7PwnkI2qyo6Un5nv8FxPkD99h+nu/fw9KGua4=',NULL,0,'rahul','Rahul','Wagh','',0,1,'2017-05-12 12:20:56.460251'),(8,'pbkdf2_sha256$36000$389J0jgPw4P3$kIcfqLU+y9PnptSe/BGzVJJOenGpNjNwbNURnRPbOZ4=',NULL,0,'kailas','Kailas','Hajbe','',0,1,'2017-05-12 12:30:40.310409'),(9,'pbkdf2_sha256$36000$qVhwr90GhOj1$pGaKlqkEfQepMG2YGrfW56iHZfB0U0ftpQwhU3iypL8=',NULL,0,'test','test','test','',0,1,'2017-05-15 11:07:10.315077'),(10,'pbkdf2_sha256$36000$pLP9THlJ0ZPo$9XEbtneopTqo9hKWwnU0CswSdZhEvieo/D8g0SDrrsM=',NULL,0,'kiran','Kiran','Mali','',0,1,'2017-05-15 11:26:55.283133'),(11,'pbkdf2_sha256$36000$O62NbFZ4BMzg$uVehecezrPRtulA0LipUfIKpvnBwap0ff0zzVtwc+nw=',NULL,0,'as','as','as','',0,1,'2017-05-17 09:36:41.825969');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-05-04 07:22:20.817450','2','test_user',1,'[{\"added\": {}}]',4,1),(2,'2017-05-13 07:40:23.271165','1','pmcadmin',1,'[{\"added\": {}}]',2,1),(3,'2017-05-13 07:41:03.858841','2','test_user',2,'[]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'pmc','alarm'),(10,'pmc','division'),(14,'pmc','errorlog'),(9,'pmc','feeder'),(8,'pmc','feederdata'),(13,'pmc','sendtoclient'),(7,'pmc','subdivision'),(12,'pmc','userdata'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-03 10:48:35.305235'),(2,'auth','0001_initial','2017-05-03 10:48:53.020457'),(3,'admin','0001_initial','2017-05-03 10:48:55.622399'),(4,'admin','0002_logentry_remove_auto_add','2017-05-03 10:48:55.778191'),(5,'contenttypes','0002_remove_content_type_name','2017-05-03 10:48:57.914661'),(6,'auth','0002_alter_permission_name_max_length','2017-05-03 10:48:58.137165'),(7,'auth','0003_alter_user_email_max_length','2017-05-03 10:48:58.303558'),(8,'auth','0004_alter_user_username_opts','2017-05-03 10:48:58.359753'),(9,'auth','0005_alter_user_last_login_null','2017-05-03 10:48:59.220817'),(10,'auth','0006_require_contenttypes_0002','2017-05-03 10:48:59.276497'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-03 10:48:59.350889'),(12,'auth','0008_alter_user_username_max_length','2017-05-03 10:48:59.875109'),(13,'pmc','0001_initial','2017-05-03 10:49:05.453891'),(14,'sessions','0001_initial','2017-05-03 10:49:06.427907'),(15,'pmc','0002_auto_20170503_1251','2017-05-03 12:51:49.554078'),(16,'pmc','0003_auto_20170504_0635','2017-05-04 06:36:09.506879'),(17,'pmc','0004_auto_20170504_1240','2017-05-04 12:50:07.293627'),(18,'pmc','0005_auto_20170505_1004','2017-05-05 11:14:33.334847'),(19,'pmc','0006_auto_20170506_1100','2017-05-06 13:29:37.908969'),(20,'pmc','0007_alaram_userdata','2017-05-09 12:31:22.873818'),(21,'pmc','0008_auto_20170509_0614','2017-05-09 12:31:23.733456'),(22,'pmc','0009_auto_20170509_1053','2017-05-09 12:31:24.013568'),(23,'pmc','0010_auto_20170509_1207','2017-05-09 12:31:24.806226'),(24,'pmc','0011_auto_20170509_1220','2017-05-09 12:31:26.668456'),(25,'pmc','0012_auto_20170509_1315','2017-05-09 13:16:01.046480'),(26,'pmc','0013_auto_20170511_0502','2017-05-11 05:03:00.496053'),(27,'pmc','0014_userdata_password','2017-05-12 12:52:24.127979'),(28,'pmc','0015_auto_20170516_1115','2017-05-16 11:15:35.964691'),(29,'pmc','0016_auto_20170516_1122','2017-05-16 11:23:06.696504'),(30,'pmc','0017_sendtoclient','2017-05-21 05:25:54.644020'),(31,'pmc','0018_auto_20170522_1137','2017-05-22 12:46:30.108226'),(32,'pmc','0019_errorlog','2017-05-23 09:35:37.781469');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('04t2dh6tew3xu7097or9bsc2p2ba2ukl','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-19 13:06:49.795692'),('5qvv2x4qbonp4w2xslhe7g5m2cotmx6s','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-23 11:08:49.169746'),('716hfqm9xloo5ckjqecc06po5w5vy1z0','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-20 07:22:32.174622'),('7lm3jslmoqfwozba3gdsie7egaj2izpz','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-19 17:14:58.400319'),('p3idacxre91g6al5dd4e7gvq7jnqw055','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-23 11:30:08.193371'),('s9g2bezmg1c30frv8k13vhbp40xf1f8l','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-01 11:44:19.554348'),('t7hvbfba4rfw8n1wr5z5dfjl7rvgqofy','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-19 12:19:05.402465'),('v09aiewpkdfr0n2o6x08jl87mb3prwwx','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-23 11:34:19.206271'),('wovv5p2jkiffte1x9s7rn831delhfdf0','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-19 15:53:57.177350'),('wylkcppkzj1bxln1og54r8etdi9qef8x','MGM0ZjQwYjM3ZWFjZTA3MDViN2NiNTE2MjliMjE1MGM3ZGZlYjBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYWI2NDc4NjJiN2QwNDBhZDQ4Y2ZkZjM4ZTc3NWNhMDE3NzUyYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-18 07:22:41.116852');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_alarm`
--

DROP TABLE IF EXISTS `pmc_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fault_type` varchar(255) NOT NULL,
  `number_1` varchar(20) NOT NULL,
  `number_2` varchar(20) NOT NULL,
  `number_3` varchar(20) NOT NULL,
  `number_4` varchar(20) NOT NULL,
  `number_5` varchar(20) NOT NULL,
  `number_6` varchar(20) NOT NULL,
  `feeder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pmc_alaram_feeder_id_0272fd69_fk_pmc_feeder_id` (`feeder_id`),
  CONSTRAINT `pmc_alaram_feeder_id_0272fd69_fk_pmc_feeder_id` FOREIGN KEY (`feeder_id`) REFERENCES `pmc_feeder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_alarm`
--

LOCK TABLES `pmc_alarm` WRITE;
/*!40000 ALTER TABLE `pmc_alarm` DISABLE KEYS */;
INSERT INTO `pmc_alarm` VALUES (1,'Voltage(R,Y,B)','9999999999','0000000000','0000000000','0000000000','0000000000','0000000000',11),(2,'Current(R,Y,B)','0000000000','9999999999','0000000000','0000000000','0000000000','0000000000',11),(3,'Fuse(R,Y,B)','0000000000','0000000000','9999999999','0000000000','0000000000','0000000000',11),(4,'Open Door Fault','9545555555','0000000000','0000000000','9999999999','0000000000','0000000000',11),(5,'Voltage(R,Y,B)','0000000000','0000000000','0000000000','9999999999','0000000000','0000000000',12),(6,'Current(R,Y,B)','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',12),(7,'Fuse(R,Y,B)','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',12),(8,'Open Door Fault','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',12),(9,'Voltage(R,Y,B)','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',13),(10,'Current(R,Y,B)','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',13),(11,'Fuse(R,Y,B)','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',13),(12,'Open Door Fault','0000000000','0000000000','0000000000','0000000000','0000000000','0000000000',13);
/*!40000 ALTER TABLE `pmc_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_division`
--

DROP TABLE IF EXISTS `pmc_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_division`
--

LOCK TABLES `pmc_division` WRITE;
/*!40000 ALTER TABLE `pmc_division` DISABLE KEYS */;
INSERT INTO `pmc_division` VALUES (1,'BALGANDHARV','Ganesh','2017-05-03 13:11:38.454725','Ganesh','2017-05-03 13:11:38.455265',1),(2,'KOTHRUD','Ganesh','2017-05-03 13:12:21.231249','Ganesh','2017-05-03 13:12:21.231335',1),(3,'SHIVAJINAGAR','Ganesh','2017-05-03 13:12:32.617671','Ganesh','2017-05-03 13:12:32.617790',1),(4,'BANNER','Ganesh','2017-05-03 13:12:42.718802','Ganesh','2017-05-03 13:12:42.718880',1),(5,'WARJE','Ganesh','2017-05-03 13:12:52.317793','Ganesh','2017-05-03 13:12:52.317899',1),(6,'HADPASAR','Ganesh','2017-05-03 13:13:36.662648','Ganesh','2017-05-03 13:13:36.662771',1),(7,'KATRAJ','Ganesh','2017-05-03 13:14:13.881757','Ganesh','2017-05-03 13:14:13.881883',1);
/*!40000 ALTER TABLE `pmc_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_errorlog`
--

DROP TABLE IF EXISTS `pmc_errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_errorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_data` longtext,
  `created_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_errorlog`
--

LOCK TABLES `pmc_errorlog` WRITE;
/*!40000 ALTER TABLE `pmc_errorlog` DISABLE KEYS */;
INSERT INTO `pmc_errorlog` VALUES (1,'&@!&?Z&NT&TESTGPRSOK&18-32&73-52&18-30&03-30&05-30&06-45&OFF&OFF&15&11&02&23&54&18-30&03-30&05-30&06-45&234.75&007.03&50&-0.98&-001.64&+001.65&25-5&13&11&234.86&000.00&49&+0.00&+000.00&+000.00&45:0&13&11&234.96&000.00&49&+0.00&+000.00&+000.00&50-0&13&11&999999&9999','2012-12-12 00:00:00.000000'),(2,'&@!&?Z&NT&TESTGPRSOK&18-32&73-52&18-30&03-30&05-30&06-45&OFF&OFF&15&11&02&23&54&18-30&03-30&05-30&06-45&234.75&007.03&50&-0.98&-001.64&+001.65&25-5&13&11&234.86&000.00&49&+0.00&+000.00&+000.00&45:0&13&11&234.96&000.00&49&+0.00&+000.00&+000.00&50-0&13&11&999999&9999','0009-09-09 00:00:00.000000');
/*!40000 ALTER TABLE `pmc_errorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_feeder`
--

DROP TABLE IF EXISTS `pmc_feeder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_feeder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feeder_name` varchar(255) NOT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `subdivision_id` int(11) NOT NULL,
  `b_current_ll` varchar(50) DEFAULT NULL,
  `b_current_ul` varchar(50) DEFAULT NULL,
  `b_volt_ll` varchar(50) DEFAULT NULL,
  `b_volt_ul` varchar(50) DEFAULT NULL,
  `bct_ratio` varchar(20) DEFAULT NULL,
  `r_current_ll` varchar(50) DEFAULT NULL,
  `r_current_ul` varchar(50) DEFAULT NULL,
  `r_volt_ll` varchar(50) DEFAULT NULL,
  `r_volt_ul` varchar(50) DEFAULT NULL,
  `rct_ratio` varchar(20) DEFAULT NULL,
  `y_current_ll` varchar(50) DEFAULT NULL,
  `y_current_ul` varchar(50) DEFAULT NULL,
  `y_volt_ll` varchar(50) DEFAULT NULL,
  `y_volt_ul` varchar(50) DEFAULT NULL,
  `yct_ratio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pmc_feeder_subdivision_id_75c224ca_fk_pmc_subdivision_id` (`subdivision_id`),
  CONSTRAINT `pmc_feeder_subdivision_id_75c224ca_fk_pmc_subdivision_id` FOREIGN KEY (`subdivision_id`) REFERENCES `pmc_subdivision` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_feeder`
--

LOCK TABLES `pmc_feeder` WRITE;
/*!40000 ALTER TABLE `pmc_feeder` DISABLE KEYS */;
INSERT INTO `pmc_feeder` VALUES (1,'Sambhaji Park','18.5233427','73.8710766','Ganesh','2017-05-04 05:49:03.436178','Ganesh','2017-05-04 05:49:03.436313',1,1,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(2,'MIT Signal','18.5087086','73.8124914','Ganesh','2017-05-04 05:50:36.442763','Ganesh','2017-05-04 05:50:36.442847',1,2,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(3,'Midi Point Signal','18.5311','73.8322','Ganesh','2017-05-04 05:51:45.563845','Ganesh','2017-05-04 05:51:45.563933',1,3,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(4,'Midi Point','18.559658','73.779938','Ganesh','2017-05-04 05:52:13.069385','Ganesh','2017-05-04 05:52:13.069510',1,4,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(5,'Maharshi Karve Signal','18.522329','73.847712','Ganesh','2017-05-04 05:53:28.769805','Ganesh','2017-05-04 05:53:28.769877',1,5,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(6,'Main Signal','18.522329','73.847712','Ganesh','2017-05-04 05:53:55.703352','Ganesh','2017-05-04 05:53:55.703441',1,6,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(7,'JSPM Signal','18.522329','73.847712','Ganesh','2017-05-04 05:54:21.230281','Ganesh','2017-05-04 05:54:21.230379',1,7,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(8,'Deccan Stand Signal','18.522329','73.847712','Ganesh','2017-05-04 05:55:27.474194','Ganesh','2017-05-04 05:55:27.474254',1,1,'270','270','210','280','3:2','210','250','100','280','4:7','80','200','130','280','7:8'),(9,'Reliance Mall',NULL,NULL,'test_user','2017-05-09 13:16:59.727786','test_user','2017-05-09 13:16:59.728500',1,4,'88','88','66','65','88','8','888','83','374','29','65','88','54','66','88'),(10,'IT Park',NULL,NULL,'test_user','2017-05-09 13:20:14.274156','test_user','2017-05-09 13:20:14.274308',1,4,'88','778','77','656','77','65','77','77','66','56','77','56','88','77','67'),(11,'FC Road','232','432','test_user','2017-05-09 15:44:29.489411','test_user','2017-05-09 15:44:29.489557',1,1,'20','200','200','290','2:1','22','221','212','321','3:2','20','302','23','233','3:2'),(12,'Warje ','18.9856','73.9876','test_user','2017-05-16 05:24:06.938793','test_user','2017-05-16 05:24:06.938868',1,8,'230.14','230.14','230.14','230.14','99/99','230.14','230.14','230.14','210','89/89','230.14','230.14','230.14','230.14','67/89'),(13,'Bus Stand','','','test_user','2017-05-22 09:55:28.099300','test_user','2017-05-22 09:55:28.099380',1,3,'230.14','230.14','230.14','230.14','99/99','230.14','230.14','230.14','230.14','99/99','230.14','230.14','230.14','230.14','99/99');
/*!40000 ALTER TABLE `pmc_feeder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_feederdata`
--

DROP TABLE IF EXISTS `pmc_feederdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_feederdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twlon_time` varchar(20) NOT NULL,
  `dimon_time` varchar(20) NOT NULL,
  `dimoff_time` varchar(20) NOT NULL,
  `twloff_time` varchar(20) NOT NULL,
  `auto_mode` tinyint(1) NOT NULL,
  `man_mode` tinyint(1) NOT NULL,
  `date_filed` datetime(6) NOT NULL,
  `r_voltage` varchar(20) NOT NULL,
  `r_current` varchar(20) NOT NULL,
  `r_frequency` varchar(20) NOT NULL,
  `r_pf` varchar(20) NOT NULL,
  `r_ap` varchar(20) NOT NULL,
  `r_app` varchar(20) NOT NULL,
  `r_ph_rotio` varchar(20) NOT NULL,
  `r_on` varchar(20) NOT NULL,
  `r_off` varchar(20) NOT NULL,
  `r_vf` tinyint(1) NOT NULL,
  `r_cf` tinyint(1) NOT NULL,
  `r_ff` tinyint(1) NOT NULL,
  `y_voltage` varchar(20) NOT NULL,
  `y_current` varchar(20) NOT NULL,
  `y_frequency` varchar(20) NOT NULL,
  `y_pf` varchar(20) NOT NULL,
  `y_ap` varchar(20) NOT NULL,
  `y_app` varchar(20) NOT NULL,
  `y_ph_rotio` varchar(20) NOT NULL,
  `y_on` varchar(20) NOT NULL,
  `y_off` varchar(20) NOT NULL,
  `y_vf` tinyint(1) NOT NULL,
  `y_cf` tinyint(1) NOT NULL,
  `y_ff` tinyint(1) NOT NULL,
  `b_voltage` varchar(20) NOT NULL,
  `b_current` varchar(20) NOT NULL,
  `b_frequency` varchar(20) NOT NULL,
  `b_pf` varchar(20) NOT NULL,
  `b_ap` varchar(20) NOT NULL,
  `b_app` varchar(20) NOT NULL,
  `b_ph_rotio` varchar(20) NOT NULL,
  `b_on` varchar(20) NOT NULL,
  `b_off` varchar(20) NOT NULL,
  `b_vf` tinyint(1) NOT NULL,
  `b_cf` tinyint(1) NOT NULL,
  `b_ff` tinyint(1) NOT NULL,
  `dof` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `feeder_id` int(11) NOT NULL,
  `lp_off1` varchar(20) DEFAULT NULL,
  `lp_off2` varchar(20) DEFAULT NULL,
  `lp_on1` varchar(20) DEFAULT NULL,
  `lp_on2` varchar(20) DEFAULT NULL,
  `spare_field3` varchar(20) DEFAULT NULL,
  `meter_kva` varchar(20) DEFAULT NULL,
  `meter_kwh` varchar(20) DEFAULT NULL,
  `dimming_percent` varchar(20) DEFAULT NULL,
  `signal_strength` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pmc_feederdata_feeder_id_6ea27ad4_fk_pmc_feeder_id` (`feeder_id`),
  CONSTRAINT `pmc_feederdata_feeder_id_6ea27ad4_fk_pmc_feeder_id` FOREIGN KEY (`feeder_id`) REFERENCES `pmc_feeder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_feederdata`
--

LOCK TABLES `pmc_feederdata` WRITE;
/*!40000 ALTER TABLE `pmc_feederdata` DISABLE KEYS */;
INSERT INTO `pmc_feederdata` VALUES (1,'18:30','03:30','05:30','06:45',0,0,'2017-05-04 11:54:21.230281','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,1,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,0,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:46:37.431078','Ganesh','2017-05-04 06:46:37.431112',1,1,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','00'),(2,'11:30','05:30','01:30','06:45',0,0,'2017-05-04 12:20:20.230245','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,1,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,0,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:50:02.593912','Ganesh','2017-05-04 06:50:02.593948',1,1,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','G'),(3,'11:30','05:30','01:30','06:45',0,0,'2017-05-04 12:20:20.230245','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,1,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,1,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:50:15.235038','Ganesh','2017-05-04 06:50:15.235079',1,2,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','N'),(4,'18:30','03:30','05:30','06:45',0,0,'2017-05-04 11:54:21.230281','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,1,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,1,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:50:24.825826','Ganesh','2017-05-04 06:50:24.825861',1,2,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','W'),(5,'18:30','03:30','05:30','06:45',0,0,'2017-05-04 12:54:21.230281','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,0,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,0,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:51:32.133237','Ganesh','2017-05-04 06:51:32.133272',1,3,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','00'),(6,'18:30','03:30','05:30','06:45',0,0,'2017-05-04 01:05:21.230281','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,0,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,0,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:51:50.927453','Ganesh','2017-05-04 06:51:50.927498',1,3,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','S'),(7,'18:30','03:30','05:30','06:45',0,0,'2017-05-04 12:22:21.230281','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,1,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,1,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:52:25.798651','Ganesh','2017-05-04 06:52:25.798686',1,4,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','W'),(8,'18:30','03:30','05:30','06:45',0,0,'2017-05-04 12:37:45.230081','230.14','017.23','49','0.95','45621','32569','25:5','13','11',0,0,1,'230.14','017.23','0.95','45621','45621','32569','45:5','13','11',0,0,1,'230.14','017.23','49','0.95','45621','32569','50:5','13','11',0,0,1,0,'Ganesh','2017-05-04 06:52:47.209991','Ganesh','2017-05-04 06:52:47.210032',1,4,'18:30',NULL,'03:30',NULL,NULL,'999999','999999','22','N');
/*!40000 ALTER TABLE `pmc_feederdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_sendtoclient`
--

DROP TABLE IF EXISTS `pmc_sendtoclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_sendtoclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(20) NOT NULL,
  `output_code` varchar(20) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `is_send` tinyint(1) NOT NULL,
  `feeder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pmc_sendtoclient_feeder_id_8cc4974b_fk_pmc_feeder_id` (`feeder_id`),
  CONSTRAINT `pmc_sendtoclient_feeder_id_8cc4974b_fk_pmc_feeder_id` FOREIGN KEY (`feeder_id`) REFERENCES `pmc_feeder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_sendtoclient`
--

LOCK TABLES `pmc_sendtoclient` WRITE;
/*!40000 ALTER TABLE `pmc_sendtoclient` DISABLE KEYS */;
INSERT INTO `pmc_sendtoclient` VALUES (1,'55','FF','2017-05-21 05:49:54.027814',0,1);
/*!40000 ALTER TABLE `pmc_sendtoclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_subdivision`
--

DROP TABLE IF EXISTS `pmc_subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_subdivision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subdivision_name` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `division_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pmc_subdivision_division_id_fa9345bf_fk_pmc_division_id` (`division_id`),
  CONSTRAINT `pmc_subdivision_division_id_fa9345bf_fk_pmc_division_id` FOREIGN KEY (`division_id`) REFERENCES `pmc_division` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_subdivision`
--

LOCK TABLES `pmc_subdivision` WRITE;
/*!40000 ALTER TABLE `pmc_subdivision` DISABLE KEYS */;
INSERT INTO `pmc_subdivision` VALUES (1,'JM Road','Ganesh','2017-05-03 13:21:26.097858','Ganesh','2017-05-03 13:21:26.097962',1,1),(2,'MIT Stop','Ganesh','2017-05-03 13:22:13.926867','Ganesh','2017-05-03 13:22:13.926931',1,2),(3,'Corporation','Ganesh','2017-05-03 13:22:41.455325','Ganesh','2017-05-03 13:22:41.455428',1,3),(4,'Parihar Chowk','Ganesh','2017-05-03 13:23:23.214250','Ganesh','2017-05-03 13:23:23.214365',1,4),(5,'Karave Nagar','Ganesh','2017-05-03 13:23:49.698347','Ganesh','2017-05-03 13:23:49.698410',1,5),(6,'Fatimanagar','Ganesh','2017-05-03 13:25:46.730432','Ganesh','2017-05-03 13:25:46.730525',1,6),(7,'Katraj Milk Dairy','Ganesh','2017-05-03 13:26:34.068013','Ganesh','2017-05-03 13:26:34.068133',1,7),(8,'Tapodham','test_user','2017-05-16 05:21:57.925750','test_user','2017-05-16 05:21:57.925819',1,5);
/*!40000 ALTER TABLE `pmc_subdivision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmc_userdata`
--

DROP TABLE IF EXISTS `pmc_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmc_userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pmc_userdata_user_id_b78045a0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `pmc_userdata_user_id_b78045a0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmc_userdata`
--

LOCK TABLES `pmc_userdata` WRITE;
/*!40000 ALTER TABLE `pmc_userdata` DISABLE KEYS */;
INSERT INTO `pmc_userdata` VALUES (1,'Superintendent Enggineer','All Divisions, ','test_user','2017-05-09 17:02:40.254237','test_user','2017-05-18 12:05:40.413018',1,3,'akshay'),(2,'Deputy Engineer','All Divisions, Multiple Division, ','test_user','2017-05-09 17:04:50.537126','test_user','2017-05-12 13:06:12.730682',1,4,'ganesh'),(3,'Deputy Engineer','Multiple Division, Multiple Sub-Division, ','test_user','2017-05-09 17:05:47.558578','test_user','2017-05-17 07:54:37.821249',1,5,'amol'),(4,'Superintendent Enggineer','All Divisions, Multiple Division, Division, ','ganesh','2017-05-12 12:18:15.815282','ganesh','2017-05-12 13:11:57.549471',1,6,'akash'),(5,'Executive Enggineer','Multiple Division, ','ganesh','2017-05-12 12:20:56.547452','ganesh','2017-05-17 12:50:44.350204',1,7,'rahul'),(6,'Superintendent Enggineer','Multiple Division, Division, ','ganesh','2017-05-12 12:30:40.410203','ganesh','2017-05-12 13:10:11.698283',1,8,'kailas'),(7,'Superintendent Enggineer','All Divisions, ','test_user','2017-05-15 11:07:10.570692','test_user','2017-05-15 11:07:10.570772',1,9,'test'),(8,'Superintendent Enggineer','Multiple Division, Division, ','test_user','2017-05-15 11:26:55.386111','test_user','2017-05-17 07:55:32.183030',1,10,'kiran'),(9,'select','All Divisions, ','test_user','2017-05-17 09:36:41.926115','test_user','2017-05-17 09:36:41.926177',1,11,'as');
/*!40000 ALTER TABLE `pmc_userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-23 16:59:20

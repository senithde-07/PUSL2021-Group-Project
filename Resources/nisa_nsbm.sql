-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: aws.connect.psdb.cloud    Database: nisa_nsbm
-- ------------------------------------------------------
-- Server version	8.0.23-PlanetScale

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '6121823e-d8f1-11ed-8bd4-f28b393f8656:1-890';

--
-- Table structure for table `academic_staff`
--

DROP TABLE IF EXISTS `academic_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_staff`
--

LOCK TABLES `academic_staff` WRITE;
/*!40000 ALTER TABLE `academic_staff` DISABLE KEYS */;
INSERT INTO `academic_staff` VALUES (1,'Pramudya Thilakarathne','pramudya.h@nsbm.ac.lk','0786545672',1),(2,'Chamindra Attanayake','chamindra.a@nsbm.ac.lk','0745623457',2);
/*!40000 ALTER TABLE `academic_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_batches`
--

DROP TABLE IF EXISTS `active_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_batches` (
  `batch_number` decimal(3,1) NOT NULL,
  `intake_date` date NOT NULL,
  PRIMARY KEY (`batch_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_batches`
--

LOCK TABLES `active_batches` WRITE;
/*!40000 ALTER TABLE `active_batches` DISABLE KEYS */;
INSERT INTO `active_batches` VALUES (21.1,'2021-06-15'),(21.2,'2021-09-10');
/*!40000 ALTER TABLE `active_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_account`
--

DROP TABLE IF EXISTS `admin_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_account` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_account`
--

LOCK TABLES `admin_account` WRITE;
/*!40000 ALTER TABLE `admin_account` DISABLE KEYS */;
INSERT INTO `admin_account` VALUES (1,'nsbmnisa@gmail.com','Sam','4cc3c7251752fa4c9c9431dd2907fec0');
/*!40000 ALTER TABLE `admin_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_hall_allocation`
--

DROP TABLE IF EXISTS `daily_hall_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_hall_allocation` (
  `day` date NOT NULL,
  `timetable_link` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_hall_allocation`
--

LOCK TABLES `daily_hall_allocation` WRITE;
/*!40000 ALTER TABLE `daily_hall_allocation` DISABLE KEYS */;
INSERT INTO `daily_hall_allocation` VALUES ('2023-04-04','google.lk'),('2023-04-07','www.google.lk'),('2023-04-10','www.google.lk'),('2023-04-19','www.google.lk'),('2023-04-20','www.google.lk'),('2023-04-21','google.lk'),('2023-04-23','sajeewa.com'),('2023-04-29','www.google.lk'),('2023-05-05','www.google.lk'),('2023-05-06','nsbm.ac.lk');
/*!40000 ALTER TABLE `daily_hall_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `degree_id` int NOT NULL AUTO_INCREMENT,
  `degree_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`degree_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,'BSc (Honours) in Data Science - (UGC Approved - Offered By N',1),(2,'BSc (Hons) Computer Networks - (Plymouth University - United',2);
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_offerer`
--

DROP TABLE IF EXISTS `degree_offerer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_offerer` (
  `offerer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `university` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`offerer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_offerer`
--

LOCK TABLES `degree_offerer` WRITE;
/*!40000 ALTER TABLE `degree_offerer` DISABLE KEYS */;
INSERT INTO `degree_offerer` VALUES (1,'Plymouth','University of Plymouth','United Kingdom'),(2,'VU','Victoria University','Australia'),(3,'UGC','NSBM','Sri Lanka');
/*!40000 ALTER TABLE `degree_offerer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_head` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Department of Data Science','Mr. Pramudya Thilakarathne'),(2,'Department of Network and Security','Mr. Chamindra Attanayake');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_degree`
--

DROP TABLE IF EXISTS `module_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_degree` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `degree_id` int NOT NULL,
  `module_no` int NOT NULL,
  `sem_year` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `degree_id` (`degree_id`),
  KEY `module_no` (`module_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_degree`
--

LOCK TABLES `module_degree` WRITE;
/*!40000 ALTER TABLE `module_degree` DISABLE KEYS */;
INSERT INTO `module_degree` VALUES (1,1,1,'Y2'),(2,1,2,'Y2S2');
/*!40000 ALTER TABLE `module_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_no` int NOT NULL AUTO_INCREMENT,
  `module_code` varchar(60) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no-code',
  `module_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `lecturer` varchar(90) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`module_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'PUSL2021','Computing Group Project','Pramudya Thilakarathne'),(2,'PUSL2026','Computer Networks','Chamindra Attanayake');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `staff_id` int NOT NULL,
  `position` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Leg');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `problem` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` int NOT NULL,
  `status` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1,'Office account got locked',21939,'ok'),(2,'Exam results not received',22345,'ok'),(4,'Won’t receive emails.',22645,'ok'),(5,'Can’t connect to the Wi-Fi network',21432,'ok'),(6,'Can’t connect to the Wi-Fi network',21432,'ok'),(7,'Forgot microsoft account password',21891,'ok'),(8,'Forgot the passwords of the Nlearn',23233,'ok'),(9,'Office account got locked',22345,'ok'),(10,'Forgot the passwords of the Nlearn',22365,'ig'),(11,'Can’t connect to the Wi-Fi network',21939,'ok'),(12,'Can’t connect to the Wi-Fi network',21939,'ok'),(13,'Office account got locked',21346,'ok'),(14,'Office account got locked',21346,'ok'),(15,'Office account got locked',21346,'ok'),(16,'Wifi signal problems',23125,'ok'),(17,'Can’t connect to the Wi-Fi network',21212,'ok'),(18,'Can’t connect to the Wi-Fi network',22345,'ok'),(19,'connect to wifi',21939,'ok'),(20,'connect to wifi',21939,'ok'),(21,'Won’t receive emails.',21939,'ok'),(22,'issue',25469,'ok'),(23,'Can’t connect to the Wi-Fi network',23364,'nw');
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `session` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'2969fe-09c-c86-df3-874991ee1','2023-04-14'),(2,'0bb9dd-5ee-d3c-890-184c5f9e1','2023-04-14'),(3,'c4b49a-818-de4-472-e6795401b','2023-04-14'),(4,'817b28-1a0-367-cc2-77e3e9df6','2023-04-14'),(5,'dfMessenger-14622312','2023-04-14'),(6,'dfMessenger-28374888','2023-04-14'),(7,'dfMessenger-37844310','2023-04-14'),(8,'ab77eb-15a-06d-c24-02bba36e4','2023-04-14'),(9,'f4ebcf-49a-a23-914-e5b8e9565','2023-04-14'),(10,'ebb2f1-698-db1-c24-3809b4520','2023-04-14'),(11,'7f6b9c-bbe-ad8-ba9-7e3df8220','2023-04-14'),(12,'dfMessenger-93302825','2023-04-14'),(13,'dfMessenger-72156249','2023-04-14'),(14,'dfMessenger-79028275','2023-04-14'),(15,'dfMessenger-56216475','2023-04-14'),(16,'dfMessenger-76180649','2023-04-14'),(17,'dfMessenger-95544310','2023-04-14'),(18,'dfMessenger-72256617','2023-04-14'),(19,'dfMessenger-94206799','2023-04-14'),(20,'dfMessenger-42393986','2023-04-14'),(21,'dfMessenger-64001255','2023-04-14'),(22,'dfMessenger-27007367','2023-04-14'),(23,'dfMessenger-45346541','2023-04-14'),(24,'dfMessenger-1473262','2023-04-14'),(25,'86ef80-8b2-eb9-788-3dae7c280','2023-04-14'),(26,'631d5f-94d-c0c-fb9-3517d8987','2023-04-14'),(27,'dfMessenger-42507840','2023-04-14'),(28,'dfMessenger-6366152','2023-04-14'),(29,'dfMessenger-55504389','2023-04-14'),(30,'dfMessenger-79346535','2023-04-14'),(31,'dfMessenger-89269076','2023-04-14'),(32,'dfMessenger-46942773','2023-04-14'),(33,'dfMessenger-58336484','2023-04-14'),(34,'2eb2f7-c35-c06-4a3-5777ed806','2023-04-14'),(35,'dfMessenger-10369387','2023-04-14'),(36,'dfMessenger-81524584','2023-04-14'),(37,'dfMessenger-99308387','2023-04-14'),(38,'dfMessenger-15796946','2023-04-14'),(39,'462cff-560-f35-fef-993c6dc99','2023-04-15'),(40,'cfeebe-07e-4d9-59a-e0138b4ea','2023-04-15'),(41,'bd3ecc-a9f-96a-94c-0d15d8b29','2023-04-15'),(42,'45d72b-421-372-3cc-87da8b33f','2023-04-15'),(43,'6bce8a-46b-912-493-9bc83bcae','2023-04-15'),(44,'dfMessenger-68665609','2023-04-15'),(45,'dfMessenger-30242726','2023-04-15'),(46,'dfMessenger-4159298','2023-04-15'),(47,'dfMessenger-47699626','2023-04-15'),(48,'dfMessenger-63567111','2023-04-15'),(49,'dfMessenger-49974107','2023-04-15'),(50,'dfMessenger-33591119','2023-04-15'),(51,'dfMessenger-35983289','2023-04-15'),(52,'dfMessenger-69327918','2023-04-15'),(53,'dfMessenger-40742453','2023-04-15'),(54,'47d3b0-d13-7be-100-46ed8efe9','2023-04-15'),(55,'a295fc-4e2-b91-86b-b9fe032f9','2023-04-15'),(56,'683d2e-cd6-806-b49-1e1dc544f','2023-04-15'),(57,'dba678-cba-4d6-697-d9a8c3ab5','2023-04-15'),(58,'298912-9b3-418-41b-da6ab1927','2023-04-15'),(59,'6439704c-0000-29c1-b6fc-d4f547f685e8','2023-04-15'),(60,'08fd4c-ead-9a1-7f7-45233ab61','2023-04-15'),(61,'64397b1a-0000-28d5-93f4-f40304394dbc','2023-04-15'),(62,'64397c0c-0000-284e-9b4b-f4030438c01c','2023-04-15'),(63,'58cc31-393-eb1-c3d-9521dbe8d','2023-04-16'),(64,'42876d-31f-79b-e1f-0d73a0726','2023-04-16'),(65,'14a579-a4a-d7d-212-4213a2d1a','2023-04-16'),(66,'be24a0-0ad-5aa-eef-e7faea249','2023-04-16'),(67,'1f206a-411-517-513-4b462630f','2023-04-16'),(68,'e5ab61-736-d47-c0f-30a92506f','2023-04-16'),(69,'d5a13f-77b-d44-d4d-b24054e93','2023-04-16'),(70,'e60afc-592-962-9ef-9c2cb2f67','2023-04-16'),(71,'4b8b1a-891-bf3-c65-3a843fbe2','2023-04-16'),(72,'d63e1b-bfa-2f0-a40-2d55a1369','2023-04-16'),(73,'e07eae-ace-b58-fe7-5b38023d8','2023-04-16'),(74,'dedaa3-1d8-c79-2ab-e5e7c13f5','2023-04-16'),(75,'faa77d-902-4f7-051-c4f78d916','2023-04-16'),(76,'7add68-0a4-d1e-875-b6ee93cdb','2023-04-16'),(77,'bebf8f-146-5ec-335-76eabbf04','2023-04-16'),(78,'653c61-936-8a7-a01-50a6992db','2023-04-16'),(79,'0b33d0-7f6-fe3-dbd-36c53fa69','2023-04-16'),(80,'6d1aee-6e4-e30-14e-e8dffd4f4','2023-04-16'),(81,'33324f-cda-9cb-981-82dacfaab','2023-04-16'),(82,'b66073-02a-27f-11a-d6a573e02','2023-04-16'),(83,'7130c6-22c-a94-9c4-52af96f00','2023-04-16'),(84,'c51984-471-d8d-8ac-bc5716abe','2023-04-16'),(85,'a1eac4-c22-ada-b64-a66e3c1bc','2023-04-16'),(86,'3445a6-249-a35-68d-be072131d','2023-04-16'),(87,'a4600a-fb2-a2b-f63-7bed7708a','2023-04-16'),(88,'838ca5-2b9-092-03b-b648ee335','2023-04-16'),(89,'408624-990-74d-a7f-d6b28854e','2023-04-16'),(90,'7ac039-c4d-33d-521-ac8c07685','2023-04-16'),(91,'ae85e7-e7b-42d-910-0e38f2c2a','2023-04-16'),(92,'4765d7-952-ff2-ccf-02d4342d6','2023-04-16'),(93,'2beaba-209-0f8-384-323da6265','2023-04-16'),(94,'537981-992-13e-51b-1b9276fe0','2023-04-16'),(95,'7eae9e-98b-6ae-d5f-0c2281a16','2023-04-19'),(96,'548dd7-316-ad3-820-5b26de8ae','2023-04-19'),(97,'dfMessenger-15773383','2023-04-19'),(98,'1e30e7-e50-861-deb-cae180ed1','2023-04-19'),(99,'0242dd-9f3-e14-c46-a5f41d13e','2023-04-19'),(100,'11bc47-71b-bef-034-797cc29dd','2023-04-19'),(101,'27c1f2-da4-add-024-c0e7afb2b','2023-04-19'),(102,'fafc1a-618-fa2-918-8a658e91f','2023-04-19'),(103,'cb292b-eaa-9a6-742-fb7979463','2023-04-19'),(104,'360dae-dcf-7f0-472-ccdc90398','2023-04-19'),(105,'01bbcc-a88-47c-77b-dedb3f985','2023-04-19'),(106,'f9e0a4-872-87a-8d8-c693fa343','2023-04-19'),(107,'53478c-e65-2cd-935-d7d80c7f1','2023-04-19'),(108,'b5e9ba-021-66e-ba1-8457c6fa7','2023-04-19'),(109,'2977b5-c90-ad2-9d0-5bf4307ef','2023-04-20'),(110,'dfMessenger-16102796','2023-04-20'),(111,'b1e252-970-7f7-583-bc88c53b5','2023-04-20'),(112,'dfMessenger-84792962','2023-04-20'),(113,'dfMessenger-38752999','2023-04-20'),(114,'dfMessenger-76230566','2023-04-20'),(115,'dfMessenger-6333715','2023-04-20'),(116,'c9d425-ca3-a26-219-9b9fb0e73','2023-04-20'),(117,'dfMessenger-22066447','2023-04-20'),(118,'dfMessenger-89359348','2023-04-20'),(119,'dfMessenger-88974645','2023-04-20'),(120,'dfMessenger-63741144','2023-04-21'),(121,'dfMessenger-85999954','2023-04-21'),(122,'dfMessenger-56797831','2023-04-21'),(123,'dfMessenger-82133313','2023-04-21'),(124,'dfMessenger-81433720','2023-04-21'),(125,'dfMessenger-89359348','2023-04-22'),(126,'1f5ab3-a26-16b-da5-6738e8d86','2023-04-22'),(127,'senger-69850049','2023-04-22'),(128,'senger-90344652','2023-04-22'),(129,'senger-68419603','2023-04-22'),(130,'senger-36006179','2023-04-22'),(131,'dfMessenger-15194910','2023-04-22'),(132,'4-95e-df5-a7f-8abd49cff','2023-04-22'),(133,'3-88c-2e5-fc8-242c9bbbe','2023-04-22'),(134,'133b16-b7c-a47-b0e-c7325d6d5','2023-04-22'),(135,'2-14f-e6f-ce3-edd339762','2023-04-22'),(136,'4-71a-a5b-44f-b0183e89d','2023-04-22'),(137,'c-ad0-111-023-f9957c330','2023-04-22'),(138,'dfMessenger-68821233','2023-04-22'),(139,'dfMessenger-96735712','2023-04-22'),(140,'dfMessenger-24712319','2023-04-22'),(141,'dfMessenger-36277163','2023-04-22'),(142,'dfMessenger-4158362','2023-04-22'),(143,'dfMessenger-88281613','2023-04-22'),(144,'dfMessenger-11819732','2023-04-22'),(145,'dfMessenger-88530545','2023-04-22'),(146,'dfMessenger-32806029','2023-04-22'),(147,'senger-75827192','2023-04-22'),(148,'senger-96632529','2023-04-22'),(149,'senger-39888134','2023-04-22'),(150,'senger-11002681','2023-04-22'),(151,'senger-19761163','2023-04-22'),(152,'senger-93307427','2023-04-22'),(153,'senger-10760726','2023-04-22'),(154,'senger-17853741','2023-04-22'),(155,'senger-21919377','2023-04-22'),(156,'senger-33744159','2023-04-22'),(157,'senger-90412357','2023-04-22'),(158,'senger-23507148','2023-04-22'),(159,'1-7a9-c03-ca0-3dbe14976','2023-04-22'),(160,'9-1d1-6b2-78d-0a181c3be','2023-04-22'),(161,'senger-75406666','2023-04-22'),(162,'2-3b8-957-436-d6f52a114','2023-04-22'),(163,'senger-42321464','2023-04-23'),(164,'senger-72828376','2023-04-23'),(165,'senger-93455217','2023-04-23'),(166,'senger-40596312','2023-04-23'),(167,'3-134-678-ca0-b73dd05f9','2023-04-23'),(168,'f-a48-b6a-fd2-05db60d45','2023-04-23'),(169,'0-7e8-219-24e-8d50323c2','2023-04-23'),(170,'senger-71846528','2023-04-23'),(171,'senger-19073748','2023-04-23'),(172,'5-ed7-1ed-438-db0e2c2d4','2023-04-23'),(173,'3-bda-95c-ccf-329d9b9a8','2023-04-23'),(174,'e-cd9-e40-753-92bb88ae7','2023-04-23'),(175,'d-7ba-679-c7b-1258fd30c','2023-04-23'),(176,'senger-39964575','2023-04-23'),(177,'senger-40633833','2023-04-23'),(178,'senger-87975477','2023-04-23'),(179,'senger-23910121','2023-04-23'),(180,'dfMessenger-6255656','2023-04-23'),(181,'dfMessenger-42579253','2023-04-23'),(182,'senger-15552769','2023-04-23'),(183,'senger-5118324','2023-04-23'),(184,'senger-7008624','2023-04-23'),(185,'senger-17243963','2023-04-23');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(600) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `batch_number` decimal(3,1) NOT NULL,
  `degree_id` int NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `batch_number` (`batch_number`),
  KEY `degree_id` (`degree_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (21432,'SD Edirisighe','pannipitiya','sdedirisighe@students.nsbm.ac.lk','765678452',21.2,2,2),(21939,'DLS Anupama','2/8, Opathella road, Uduthuthiripitiya','dlsanupama@students.nsbm.ac.lk','0703727927',21.1,2,2),(22345,'MA Perera','Henegama, Mannar','saniduanupama12@gmail.com','0745623457',21.2,1,1),(22645,'RANT Ranasingha','Ballapana,Divulapitiya','rantranasingha@students.nsbm.ac.lk','0772356728',21.1,2,2);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_message`
--

DROP TABLE IF EXISTS `template_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_message` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(5000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_message`
--

LOCK TABLES `template_message` WRITE;
/*!40000 ALTER TABLE `template_message` DISABLE KEYS */;
INSERT INTO `template_message` VALUES (1,'A module missing in Nlearn','I\'m glad to inform you that the issue regarding the missing modules in Nlearn  has been fixed. You should now be able to access all the necessary modules without any problems.\r\nPlease let us know if you encounter any further issues or if you have any questions.\r\nThank you for bringing this to our attention and for your patience while we worked to resolve the issue'),(2,'Can’t access Nlearn','Thank you for reaching out to us. We are pleased to inform you that the issue with accessing Nlearn  has been resolved. You should now be able to access it without any problems.\r\nIf you encounter any further issues or have any questions, please don\'t hesitate to let us know.\r\nThank you for your patience and understanding.'),(3,'Can’t access DLE','Thank you for reaching out to us. We are pleased to inform you that the issue with accessing DLE  has been resolved. You should now be able to access it without any problems.\r\nIf you encounter any further issues or have any questions, please don\'t hesitate to let us know.\r\nThank you for your patience and understanding\r\n'),(4,'Can’t connect to the Wi-Fi network','Thank you for reaching out to us regarding your issue with connecting to the Wi-Fi network. After reviewing your concern, it appears that the issue might be on your side. We recommend that you try some troubleshooting steps such as resetting your Wi-Fi router or checking the network settings on your device.\r\n However, if the issue persists, we would suggest meeting our technical team who can assist you further with the issue.\r\n Please let us know if you require any further assistance or would like to schedule an appointment with our technical team.'),(5,'Won’t receive emails.','Following up on the issue you reported regarding not receiving emails, I wanted to inform you that our team has taken the necessary steps to fix the issue.\r\nCould you please check your email now and let us know if you are still experiencing the same problem? We want to ensure that everything is working as expected and that you are receiving all important communications.\r\nPlease do not hesitate to reach out to us if you have any further concerns or questions. We are always here to assist you.\r\nThank you for your patience and understanding.'),(6,'Exam results not received','Thank you for reaching out to us regarding the issue of not receiving your exam results. We apologize for any inconvenience this may have caused.\r\nAfter reviewing our records, we have resent the email containing your exam results to the email address on file. We kindly suggest that you check your email inbox, spam folder, and other email filters to ensure that you have received the email.\r\nIf you have still not received the email, please let us know and we will investigate the matter further to ensure that you receive your exam results promptly.\r\nThank you for your patience and understanding.'),(7,'Cannot log into microsoft account','Thank you for reaching out to us regarding the issue with logging into your Microsoft account. We are glad to inform you that we have fixed the issue and you should now be able to log in without any problems.\r\nWe recommend that you try logging into your Microsoft account again to confirm that the issue has been resolved. If you encounter any further issues, please do not hesitate to contact us again.\r\nThank you for your patience and understanding in this matter.'),(8,'Office account got locked','I am writing in response to your recent inquiry regarding the issue of your Office account being locked. I am pleased to inform you that we have taken immediate action to resolve this matter, and your account has been unlocked.\r\nTo verify that your account is now accessible, please log in to your Microsoft account and check the status of your Office subscription. You should now be able to access all of the features and services associated with your Office account.\r\n If you have any further questions or concerns, please do not hesitate to contact us. We are always here to assist you with any issues related to your Office account.'),(9,'Forgot the passwords of the Nlearn','Thank you for contacting us regarding the issue of forgetting your Nlearn password. In order to resolve this matter, we require you to prove your identity to ensure the security of your account. To do this, we kindly request that you meet with a member of our technical team in person.\r\nOur team members will assist you in resetting your password and securing your account. We apologize for any inconvenience this may cause, but we take the security of our users\' accounts very seriously.\r\nWe appreciate your cooperation in this matter.'),(10,'Forgot the passwords of the DLE','Thank you for reaching out regarding the issue of forgetting the passwords of the DLE.\r\nOne solution to this issue is resetting your password yourself. However, if you are still unable to resolve the issue or require further assistance, please let us know, and one of our technical team member who can guide you through the process.\r\nPlease feel free to contact us if you have any further questions or concerns.'),(11,'Forgot microsoft account password','Regarding the issue of forgetting your Microsoft account password. \r\nWe recommend resetting your password yourself, which is a quick and easy process. To do so, please follow these steps:\r\nGo to the Microsoft sign-in page and click on \"Forgot my password.\"\r\nEnter the email address or phone number associated with your account and follow the instructions on the screen.\r\nMicrosoft will send you a security code that you can use to reset your password.\r\nEnter the security code and create a new password.\r\nIf you have any difficulty resetting your password, please let us know and we can arrange for a technical team member to assist you further.'),(12,'Attendance cannot be marked','Regarding the issue with attendance marking. I understand that you are unable to mark attendance and require assistance to resolve the issue.\r\nIn order to address this issue, I suggest you meet with a technical team member who can provide you with the necessary support and guidance to resolve the issue. They will be able to analyze the issue in more detail and offer a tailored solution to get you back on track.\r\nThank you for your patience and cooperation. We look forward to resolving this issue as soon as possible.'),(13,'Payment was made but the account is still not activated','Thank you for bringing to our attention the issue regarding the activation of your account. We understand that you have made the payment, but your account is still not activated.\r\nWe apologize for any inconvenience caused and we assure you that we are working to resolve the issue as soon as possible.\r\nThank you for your patience and understanding. If you have any further questions or concerns, please don\'t hesitate to reach out to us.'),(14,'Wifi signal problems','Thank you for bringing to our attention the issue with the WiFi signal.\r\nAs per your concern, we will investigate the connection issues with the WiFi signal. It\'s possible that the problem may be due to the large number of people using the WiFi network, which can cause congestion and slow down the connection. \r\nWe will look into this matter and take the necessary steps to ensure that you have a better experience with our WiFi network. In the meantime, please bear with us as we work towards resolving this issue.\r\nThank you for your patience and understanding.');
/*!40000 ALTER TABLE `template_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_table` (
  `timetable_id` int NOT NULL AUTO_INCREMENT,
  `batch_number` decimal(3,1) NOT NULL,
  `degree_offerer` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `timetable_link` varchar(6000) COLLATE utf8mb4_general_ci NOT NULL,
  `year_sem` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`timetable_id`),
  KEY `batch_number` (`batch_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_table`
--

LOCK TABLES `time_table` WRITE;
/*!40000 ALTER TABLE `time_table` DISABLE KEYS */;
INSERT INTO `time_table` VALUES (1,21.1,'Plymouth','https://nsbm365.sharepoint.com/:x:/r/SOC/_layouts/15/Doc.aspx?sourcedoc=%7BEB8CFDE9-4CAD-4984-84AF-F28813BB38BF%7D&file=Plymouth%20Semester%20II%20Time%20Table%202022%2C2023.xlsx&action=default&mobileredirect=true&DefaultItemOpen=1&login_hint=dlsanupama%40students.nsbm.ac.lk&ct=1680800592902&wdOrigin=OFFICECOM-WEB.MAIN.REC&cid=0af23c71-2dbc-4620-9924-2998b15a4d9f','Y2S2'),(9,21.2,'Plymouth','hi','Y2S1');
/*!40000 ALTER TABLE `time_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_questions`
--

DROP TABLE IF EXISTS `user_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `intent_name` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `session` varchar(255) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_questions`
--

LOCK TABLES `user_questions` WRITE;
/*!40000 ALTER TABLE `user_questions` DISABLE KEYS */;
INSERT INTO `user_questions` VALUES (1,'Default Welcome Intent','2023-04-14','2969fe-09c-c86-df3-874991ee1'),(2,'static.available.degrees','2023-04-14','2969fe-09c-c86-df3-874991ee1'),(3,'Default Welcome Intent','2023-04-14','0bb9dd-5ee-d3c-890-184c5f9e1'),(4,'static.webhook.hall.allocation','2023-04-14','c4b49a-818-de4-472-e6795401b'),(5,'static.webhook.hall.allocation','2023-04-14','817b28-1a0-367-cc2-77e3e9df6'),(6,'static.webhook.hall.allocation','2023-04-14','dfMessenger-14622312'),(7,'follow.lec.timetable','2023-04-14','dfMessenger-14622312'),(8,'follow.lec.timetable','2023-04-14','dfMessenger-28374888'),(9,'follow.lec.timetable','2023-04-14','dfMessenger-37844310'),(10,'static.available.degrees','2023-04-14','dfMessenger-37844310'),(11,'vary.dept.head','2023-04-14','dfMessenger-37844310'),(12,'static.other.questions','2023-04-14','dfMessenger-37844310'),(13,'thanks','2023-04-14','dfMessenger-37844310'),(14,'vary.lecturer.info','2023-04-14','dfMessenger-37844310'),(15,'vary.lecturer.info','2023-04-14','ab77eb-15a-06d-c24-02bba36e4'),(16,'vary.lecturer.info','2023-04-14','f4ebcf-49a-a23-914-e5b8e9565'),(17,'vary.lecturer.info','2023-04-14','ebb2f1-698-db1-c24-3809b4520'),(18,'vary.lecturer.email','2023-04-14','dfMessenger-37844310'),(19,'thanks','2023-04-14','7f6b9c-bbe-ad8-ba9-7e3df8220'),(20,'Default Welcome Intent','2023-04-14','dfMessenger-93302825'),(21,'prob.general','2023-04-14','dfMessenger-93302825'),(22,'thanks','2023-04-14','dfMessenger-93302825'),(23,'follow.lec.timetable','2023-04-14','dfMessenger-93302825'),(24,'Default Welcome Intent','2023-04-14','dfMessenger-72156249'),(25,'vary.dept.head','2023-04-14','dfMessenger-79028275'),(26,'vary.dept.head','2023-04-14','dfMessenger-56216475'),(27,'vary.dept.info','2023-04-14','dfMessenger-56216475'),(28,'vary.dept.info','2023-04-14','dfMessenger-76180649'),(29,'Default Welcome Intent','2023-04-14','dfMessenger-95544310'),(30,'vary.dept.head','2023-04-14','dfMessenger-95544310'),(31,'prob.general','2023-04-14','dfMessenger-95544310'),(32,'static.webhook.hall.allocation','2023-04-14','dfMessenger-95544310'),(33,'static.dean.foc','2023-04-14','dfMessenger-95544310'),(34,'vary.dept.info','2023-04-14','dfMessenger-95544310'),(35,'vary.dept.info','2023-04-14','dfMessenger-72256617'),(36,'vary.dept.info','2023-04-14','dfMessenger-94206799'),(37,'vary.dept.info','2023-04-14','dfMessenger-42393986'),(38,'vary.dept.info','2023-04-14','dfMessenger-64001255'),(39,'vary.dept.info','2023-04-14','dfMessenger-27007367'),(40,'vary.dept.info','2023-04-14','dfMessenger-45346541'),(41,'static.exam.reattempt','2023-04-14','dfMessenger-1473262'),(42,'static.exam.reattempt','2023-04-14','86ef80-8b2-eb9-788-3dae7c280'),(43,'static.submit.ec','2023-04-14','631d5f-94d-c0c-fb9-3517d8987'),(44,'static.submit.ec','2023-04-14','dfMessenger-42507840'),(45,'vary.lecturer.info','2023-04-14','dfMessenger-42507840'),(46,'vary.lecturer.email','2023-04-14','dfMessenger-42507840'),(47,'vary.lecturer.email','2023-04-14','dfMessenger-6366152'),(48,'vary.lecturer.email','2023-04-14','dfMessenger-55504389'),(49,'vary.lecturer.info','2023-04-14','dfMessenger-79346535'),(50,'vary.lecturer.info','2023-04-14','dfMessenger-89269076'),(51,'vary.lecturer.info','2023-04-14','dfMessenger-46942773'),(52,'vary.lecturer.email','2023-04-14','dfMessenger-46942773'),(53,'vary.lecturer.info','2023-04-14','dfMessenger-58336484'),(54,'vary.lecturer.email','2023-04-14','2eb2f7-c35-c06-4a3-5777ed806'),(55,'vary.lecturer.email','2023-04-14','dfMessenger-10369387'),(56,'vary.lecturer.email','2023-04-14','dfMessenger-81524584'),(57,'vary.lecturer.info','2023-04-14','dfMessenger-81524584'),(58,'vary.lecturer.info','2023-04-14','dfMessenger-99308387'),(59,'vary.lecturer.email','2023-04-14','dfMessenger-99308387'),(60,'vary.lecturer.info','2023-04-14','dfMessenger-15796946'),(61,'vary.dept.info','2023-04-14','dfMessenger-15796946'),(62,'follow.lec.timetable','2023-04-15','462cff-560-f35-fef-993c6dc99'),(63,'static.change.degree','2023-04-15','cfeebe-07e-4d9-59a-e0138b4ea'),(64,'static.available.degrees','2023-04-15','cfeebe-07e-4d9-59a-e0138b4ea'),(65,'static.change.degree','2023-04-15','bd3ecc-a9f-96a-94c-0d15d8b29'),(66,'follow.lec.timetable','2023-04-15','45d72b-421-372-3cc-87da8b33f'),(67,'follow.lec.timetable','2023-04-15','6bce8a-46b-912-493-9bc83bcae'),(68,'Default Welcome Intent','2023-04-15','dfMessenger-68665609'),(69,'follow.lec.timetable','2023-04-15','dfMessenger-68665609'),(70,'Default Welcome Intent','2023-04-15','dfMessenger-30242726'),(71,'Default Welcome Intent','2023-04-15','dfMessenger-4159298'),(72,'follow.lec.timetable','2023-04-15','dfMessenger-4159298'),(73,'Default Welcome Intent','2023-04-15','dfMessenger-47699626'),(74,'follow.lec.timetable','2023-04-15','dfMessenger-47699626'),(75,'Default Welcome Intent','2023-04-15','dfMessenger-63567111'),(76,'follow.lec.timetable','2023-04-15','dfMessenger-63567111'),(77,'Default Welcome Intent','2023-04-15','dfMessenger-49974107'),(78,'follow.lec.timetable','2023-04-15','dfMessenger-49974107'),(79,'Default Welcome Intent','2023-04-15','dfMessenger-33591119'),(80,'follow.lec.timetable','2023-04-15','dfMessenger-33591119'),(81,'static.webhook.hall.allocation','2023-04-15','dfMessenger-35983289'),(82,'static.webhook.hall.allocation','2023-04-15','dfMessenger-69327918'),(83,'static.webhook.hall.allocation','2023-04-15','dfMessenger-40742453'),(84,'Default Welcome Intent','2023-04-15','47d3b0-d13-7be-100-46ed8efe9'),(85,'static.webhook.hall.allocation','2023-04-15','47d3b0-d13-7be-100-46ed8efe9'),(86,'Default Welcome Intent','2023-04-15','a295fc-4e2-b91-86b-b9fe032f9'),(87,'static.webhook.hall.allocation','2023-04-15','a295fc-4e2-b91-86b-b9fe032f9'),(88,'Default Welcome Intent','2023-04-15','683d2e-cd6-806-b49-1e1dc544f'),(89,'prob.general','2023-04-15','683d2e-cd6-806-b49-1e1dc544f'),(90,'Default Welcome Intent','2023-04-15','dba678-cba-4d6-697-d9a8c3ab5'),(91,'prob.general','2023-04-15','dba678-cba-4d6-697-d9a8c3ab5'),(92,'Default Welcome Intent','2023-04-15','298912-9b3-418-41b-da6ab1927'),(93,'prob.general','2023-04-15','298912-9b3-418-41b-da6ab1927'),(94,'Default Welcome Intent','2023-04-15','6439704c-0000-29c1-b6fc-d4f547f685e8'),(95,'prob.general','2023-04-15','6439704c-0000-29c1-b6fc-d4f547f685e8'),(96,'Default Welcome Intent','2023-04-15','08fd4c-ead-9a1-7f7-45233ab61'),(97,'static.webhook.hall.allocation','2023-04-15','08fd4c-ead-9a1-7f7-45233ab61'),(98,'Default Welcome Intent','2023-04-15','64397b1a-0000-28d5-93f4-f40304394dbc'),(99,'static.webhook.hall.allocation','2023-04-15','64397b1a-0000-28d5-93f4-f40304394dbc'),(100,'Default Welcome Intent','2023-04-15','64397c0c-0000-284e-9b4b-f4030438c01c'),(101,'static.webhook.hall.allocation','2023-04-15','64397c0c-0000-284e-9b4b-f4030438c01c'),(102,'static.change.degree','2023-04-16','58cc31-393-eb1-c3d-9521dbe8d'),(103,'static.hardest.degree','2023-04-16','58cc31-393-eb1-c3d-9521dbe8d'),(104,'static.change.degree','2023-04-16','42876d-31f-79b-e1f-0d73a0726'),(105,'static.free.mail.services','2023-04-16','14a579-a4a-d7d-212-4213a2d1a'),(106,'static.late.payments','2023-04-16','be24a0-0ad-5aa-eef-e7faea249'),(107,'static.late.payments','2023-04-16','1f206a-411-517-513-4b462630f'),(108,'static.free.mail.services','2023-04-16','1f206a-411-517-513-4b462630f'),(109,'static.late.payments','2023-04-16','e5ab61-736-d47-c0f-30a92506f'),(110,'static.free.mail.services','2023-04-16','d5a13f-77b-d44-d4d-b24054e93'),(111,'static.late.payments','2023-04-16','e60afc-592-962-9ef-9c2cb2f67'),(112,'static.exam.results.dle','2023-04-16','e60afc-592-962-9ef-9c2cb2f67'),(113,'static.other.questions','2023-04-16','e60afc-592-962-9ef-9c2cb2f67'),(114,'static.free.mail.services','2023-04-16','e60afc-592-962-9ef-9c2cb2f67'),(115,'static.free.mail.services','2023-04-16','4b8b1a-891-bf3-c65-3a843fbe2'),(116,'static.other.questions','2023-04-16','d63e1b-bfa-2f0-a40-2d55a1369'),(117,'static.other.questions','2023-04-16','e07eae-ace-b58-fe7-5b38023d8'),(118,'static.exam.results.dle','2023-04-16','e07eae-ace-b58-fe7-5b38023d8'),(119,'static.other.questions','2023-04-16','dedaa3-1d8-c79-2ab-e5e7c13f5'),(120,'static.exam.results.dle','2023-04-16','dedaa3-1d8-c79-2ab-e5e7c13f5'),(121,'static.stupid.questions','2023-04-16','faa77d-902-4f7-051-c4f78d916'),(122,'static.stupid.questions','2023-04-16','7add68-0a4-d1e-875-b6ee93cdb'),(123,'static.nsbm.stands.for','2023-04-16','7add68-0a4-d1e-875-b6ee93cdb'),(124,'static.foc.lecturers.count','2023-04-16','7add68-0a4-d1e-875-b6ee93cdb'),(125,'static.foc.lecture.halls.count','2023-04-16','7add68-0a4-d1e-875-b6ee93cdb'),(126,'static.foc.lecture.halls.count','2023-04-16','bebf8f-146-5ec-335-76eabbf04'),(127,'static.foc.lecture.halls.count','2023-04-16','653c61-936-8a7-a01-50a6992db'),(128,'static.dean.foc','2023-04-16','653c61-936-8a7-a01-50a6992db'),(129,'static.dvc.nsbm','2023-04-16','653c61-936-8a7-a01-50a6992db'),(130,'static.vc.nsbm','2023-04-16','653c61-936-8a7-a01-50a6992db'),(131,'static.other.questions','2023-04-16','653c61-936-8a7-a01-50a6992db'),(132,'Static.lecturer.personal.detail','2023-04-16','653c61-936-8a7-a01-50a6992db'),(133,'vary.lecturer.email','2023-04-16','653c61-936-8a7-a01-50a6992db'),(134,'vary.lecturer.info','2023-04-16','653c61-936-8a7-a01-50a6992db'),(135,'Static.lecturer.personal.detail','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(136,'vary.lecturer.info','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(137,'vary.lecturer.email','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(138,'static.is.degree.hard','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(139,'static.hardest.degree','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(140,'static.exam.reattempt','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(141,'static.free.mail.services','2023-04-16','0b33d0-7f6-fe3-dbd-36c53fa69'),(142,'static.exam.reattempt','2023-04-16','6d1aee-6e4-e30-14e-e8dffd4f4'),(143,'vary.societies','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(144,'static.foc.societies','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(145,'static.foc.departments','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(146,'static.retake.absence.exam','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(147,'static.blame.scold','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(148,'static.dean.foc','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(149,'static.other.questions','2023-04-16','33324f-cda-9cb-981-82dacfaab'),(150,'prob.nlearn.no.access','2023-04-16','b66073-02a-27f-11a-d6a573e02'),(151,'static.other.questions','2023-04-16','7130c6-22c-a94-9c4-52af96f00'),(152,'prob.no.email','2023-04-16','c51984-471-d8d-8ac-bc5716abe'),(153,'static.free.mail.services','2023-04-16','c51984-471-d8d-8ac-bc5716abe'),(154,'static.free.mail.services','2023-04-16','a1eac4-c22-ada-b64-a66e3c1bc'),(155,'static.free.mail.services','2023-04-16','3445a6-249-a35-68d-be072131d'),(156,'static.free.mail.services','2023-04-16','a4600a-fb2-a2b-f63-7bed7708a'),(157,'static.other.questions','2023-04-16','838ca5-2b9-092-03b-b648ee335'),(158,'static.exam.results.dle','2023-04-16','838ca5-2b9-092-03b-b648ee335'),(159,'prob.cant.microsoft.acc','2023-04-16','838ca5-2b9-092-03b-b648ee335'),(160,'static.other.questions','2023-04-16','408624-990-74d-a7f-d6b28854e'),(161,'static.other.questions','2023-04-16','7ac039-c4d-33d-521-ac8c07685'),(162,'prob.cant.microsoft.acc','2023-04-16','7ac039-c4d-33d-521-ac8c07685'),(163,'static.other.questions','2023-04-16','ae85e7-e7b-42d-910-0e38f2c2a'),(164,'static.other.questions','2023-04-16','4765d7-952-ff2-ccf-02d4342d6'),(165,'static.other.questions','2023-04-16','2beaba-209-0f8-384-323da6265'),(166,'static.other.questions','2023-04-16','537981-992-13e-51b-1b9276fe0'),(167,'prob.weak.wifi','2023-04-19','7eae9e-98b-6ae-d5f-0c2281a16'),(168,'static.webhook.hall.allocation','2023-04-19','548dd7-316-ad3-820-5b26de8ae'),(169,'static.other.questions','2023-04-19','dfMessenger-15773383'),(170,'static.other.questions','2023-04-19','1e30e7-e50-861-deb-cae180ed1'),(171,'prob.weak.wifi','2023-04-19','0242dd-9f3-e14-c46-a5f41d13e'),(172,'prob.weak.wifi','2023-04-19','11bc47-71b-bef-034-797cc29dd'),(173,'prob.office-acc.locked','2023-04-19','11bc47-71b-bef-034-797cc29dd'),(174,'prob.cant.microsoft.acc','2023-04-19','27c1f2-da4-add-024-c0e7afb2b'),(175,'prob.cant-connect.wifi','2023-04-19','fafc1a-618-fa2-918-8a658e91f'),(176,'prob.weak.wifi','2023-04-19','cb292b-eaa-9a6-742-fb7979463'),(177,'prob.weak.wifi','2023-04-19','360dae-dcf-7f0-472-ccdc90398'),(178,'prob.weak.wifi','2023-04-19','01bbcc-a88-47c-77b-dedb3f985'),(179,'prob.weak.wifi','2023-04-19','f9e0a4-872-87a-8d8-c693fa343'),(180,'prob.weak.wifi','2023-04-19','53478c-e65-2cd-935-d7d80c7f1'),(181,'prob.weak.wifi','2023-04-19','b5e9ba-021-66e-ba1-8457c6fa7'),(182,'prob.weak.wifi','2023-04-20','2977b5-c90-ad2-9d0-5bf4307ef'),(183,'static.webhook.hall.allocation','2023-04-20','dfMessenger-16102796'),(184,'follow.lec.timetable','2023-04-20','dfMessenger-16102796'),(185,'static.webhook.hall.allocation','2023-04-20','b1e252-970-7f7-583-bc88c53b5'),(186,'static.webhook.hall.allocation','2023-04-20','dfMessenger-84792962'),(187,'Default Welcome Intent','2023-04-20','dfMessenger-38752999'),(188,'Default Welcome Intent','2023-04-20','dfMessenger-76230566'),(189,'static.webhook.hall.allocation','2023-04-20','dfMessenger-76230566'),(190,'Default Welcome Intent','2023-04-20','dfMessenger-6333715'),(191,'static.webhook.hall.allocation','2023-04-20','dfMessenger-6333715'),(192,'prob.general','2023-04-20','dfMessenger-6333715'),(193,'static.webhook.hall.allocation','2023-04-20','c9d425-ca3-a26-219-9b9fb0e73'),(194,'prob.weak.wifi','2023-04-20','c9d425-ca3-a26-219-9b9fb0e73'),(195,'vary.dept.info','2023-04-20','dfMessenger-22066447'),(196,'static.webhook.hall.allocation','2023-04-20','dfMessenger-89359348'),(197,'static.webhook.hall.allocation','2023-04-20','dfMessenger-88974645'),(198,'Default Welcome Intent','2023-04-21','dfMessenger-63741144'),(199,'prob.weak.wifi','2023-04-21','dfMessenger-63741144'),(200,'Default Welcome Intent','2023-04-21','dfMessenger-85999954'),(201,'vary.lecturer.email','2023-04-21','dfMessenger-85999954'),(202,'Default Welcome Intent','2023-04-21','dfMessenger-56797831'),(203,'static.webhook.hall.allocation','2023-04-21','dfMessenger-82133313'),(204,'follow.lec.timetable','2023-04-21','dfMessenger-82133313'),(205,'static.available.degrees','2023-04-21','dfMessenger-82133313'),(206,'vary.dept.head','2023-04-21','dfMessenger-82133313'),(207,'vary.lecturer.email','2023-04-21','dfMessenger-82133313'),(208,'static.submit.ec','2023-04-21','dfMessenger-82133313'),(209,'static.change.degree','2023-04-21','dfMessenger-82133313'),(210,'Default Welcome Intent','2023-04-21','dfMessenger-82133313'),(211,'static.webhook.hall.allocation','2023-04-21','dfMessenger-81433720'),(212,'Default Welcome Intent','2023-04-22','dfMessenger-89359348'),(213,'static.webhook.hall.allocation','2023-04-22','dfMessenger-89359348'),(214,'Default Welcome Intent','2023-04-22','1f5ab3-a26-16b-da5-6738e8d86'),(215,'vary.lecturer.info','2023-04-22','1f5ab3-a26-16b-da5-6738e8d86'),(216,'static.foc.departments','2023-04-22','1f5ab3-a26-16b-da5-6738e8d86'),(217,'vary.dept.info','2023-04-22','1f5ab3-a26-16b-da5-6738e8d86'),(218,'static.webhook.hall.allocation','2023-04-22','senger-69850049'),(219,'follow.lec.timetable','2023-04-22','senger-90344652'),(220,'vary.lecturer.info','2023-04-22','senger-90344652'),(221,'vary.lecturer.email','2023-04-22','senger-90344652'),(222,'prob.cant-connect.wifi','2023-04-22','senger-90344652'),(223,'prob.weak.wifi','2023-04-22','senger-90344652'),(224,'prob.general','2023-04-22','senger-68419603'),(225,'prob.general','2023-04-22','senger-36006179'),(226,'static.webhook.hall.allocation','2023-04-22','senger-36006179'),(227,'follow.lec.timetable','2023-04-22','dfMessenger-15194910'),(228,'prob.general','2023-04-22','4-95e-df5-a7f-8abd49cff'),(229,'vary.lecturer.info','2023-04-22','3-88c-2e5-fc8-242c9bbbe'),(230,'vary.lecturer.info','2023-04-22','133b16-b7c-a47-b0e-c7325d6d5'),(231,'vary.dept.info','2023-04-22','3-88c-2e5-fc8-242c9bbbe'),(232,'prob.cant.microsoft.acc','2023-04-22','2-14f-e6f-ce3-edd339762'),(233,'prob.cant.microsoft.acc','2023-04-22','133b16-b7c-a47-b0e-c7325d6d5'),(234,'Default Welcome Intent','2023-04-22','4-71a-a5b-44f-b0183e89d'),(235,'Default Welcome Intent','2023-04-22','c-ad0-111-023-f9957c330'),(236,'follow.lec.timetable','2023-04-22','dfMessenger-68821233'),(237,'vary.lecturer.info','2023-04-22','dfMessenger-96735712'),(238,'static.other.questions','2023-04-22','dfMessenger-24712319'),(239,'static.dean.foc','2023-04-22','dfMessenger-24712319'),(240,'Static.lecturer.personal.detail','2023-04-22','dfMessenger-24712319'),(241,'static.webhook.hall.allocation','2023-04-22','dfMessenger-36277163'),(242,'static.webhook.hall.allocation','2023-04-22','dfMessenger-4158362'),(243,'Default Welcome Intent','2023-04-22','dfMessenger-88281613'),(244,'Default Welcome Intent','2023-04-22','dfMessenger-11819732'),(245,'Default Welcome Intent','2023-04-22','dfMessenger-88530545'),(246,'Default Welcome Intent','2023-04-22','dfMessenger-32806029'),(247,'Default Welcome Intent','2023-04-22','senger-75827192'),(248,'static.hardest.degree','2023-04-22','senger-96632529'),(249,'prob.weak.wifi','2023-04-22','senger-39888134'),(250,'prob.cant.microsoft.acc','2023-04-22','senger-11002681'),(251,'vary.dept.info','2023-04-22','senger-11002681'),(252,'vary.dept.info','2023-04-22','senger-19761163'),(253,'static.acc.still-locked','2023-04-22','senger-93307427'),(254,'static.acc.still-locked','2023-04-22','senger-10760726'),(255,'static.attendance.cant.mark','2023-04-22','senger-17853741'),(256,'static.hardest.degree','2023-04-22','senger-17853741'),(257,'static.hardest.degree','2023-04-22','senger-21919377'),(258,'static.hardest.degree','2023-04-22','senger-33744159'),(259,'static.stupid.questions','2023-04-22','senger-90412357'),(260,'static.other.questions','2023-04-22','senger-90412357'),(261,'static.foc.lecturers.count','2023-04-22','senger-23507148'),(262,'static.foc.lecturers.count','2023-04-22','1-7a9-c03-ca0-3dbe14976'),(263,'static.foc.lecturers.count','2023-04-22','9-1d1-6b2-78d-0a181c3be'),(264,'static.foc.lecturers.count','2023-04-22','senger-75406666'),(265,'static.foc.lecturers.count','2023-04-22','2-3b8-957-436-d6f52a114'),(266,'prob.general','2023-04-23','senger-42321464'),(267,'static.exam.reattempt','2023-04-23','senger-72828376'),(268,'static.exam.reattempt','2023-04-23','senger-93455217'),(269,'follow.lec.timetable','2023-04-23','senger-40596312'),(270,'static.exam.reattempt','2023-04-23','3-134-678-ca0-b73dd05f9'),(271,'static.exam.reattempt','2023-04-23','f-a48-b6a-fd2-05db60d45'),(272,'static.exam.reattempt','2023-04-23','0-7e8-219-24e-8d50323c2'),(273,'static.exam.reattempt','2023-04-23','senger-71846528'),(274,'static.exam.reattempt','2023-04-23','senger-19073748'),(275,'static.exam.reattempt','2023-04-23','5-ed7-1ed-438-db0e2c2d4'),(276,'follow.lec.timetable','2023-04-23','3-bda-95c-ccf-329d9b9a8'),(277,'follow.lec.timetable','2023-04-23','e-cd9-e40-753-92bb88ae7'),(278,'Default Welcome Intent','2023-04-23','d-7ba-679-c7b-1258fd30c'),(279,'follow.lec.timetable','2023-04-23','senger-39964575'),(280,'prob.cant-connect.wifi','2023-04-23','senger-39964575'),(281,'static.webhook.hall.allocation','2023-04-23','senger-40633833'),(282,'static.attendance.cant.mark','2023-04-23','senger-40633833'),(283,'static.foc.departments','2023-04-23','senger-40633833'),(284,'vary.lecturer.email','2023-04-23','senger-40633833'),(285,'prob.forgot-pw.nlearn','2023-04-23','senger-40633833'),(286,'static.hall.book','2023-04-23','senger-87975477'),(287,'prob.general','2023-04-23','senger-23910121'),(288,'Default Welcome Intent','2023-04-23','dfMessenger-6255656'),(289,'static.webhook.hall.allocation','2023-04-23','dfMessenger-6255656'),(290,'Default Welcome Intent','2023-04-23','dfMessenger-42579253'),(291,'static.dean.foc','2023-04-23','dfMessenger-42579253'),(292,'static.webhook.hall.allocation','2023-04-23','dfMessenger-42579253'),(293,'static.webhook.hall.allocation','2023-04-23','senger-15552769'),(294,'vary.lecturer.info','2023-04-23','senger-5118324'),(295,'static.webhook.hall.allocation','2023-04-23','senger-7008624'),(296,'vary.lecturer.info','2023-04-23','senger-17243963');
/*!40000 ALTER TABLE `user_questions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 14:50:38

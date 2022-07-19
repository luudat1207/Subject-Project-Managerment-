CREATE DATABASE  IF NOT EXISTS `student_project_managerment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_project_managerment`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: student_project_managerment
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_code` varchar(45) NOT NULL,
  `trainer_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_year` int NOT NULL,
  `class_term` varchar(45) NOT NULL,
  `gitlab_id` int NOT NULL,
  `block5_class` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `subject_di_idx` (`subject_id`),
  KEY `traner_id_idx` (`trainer_id`),
  CONSTRAINT `subject_di` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `traner_id` FOREIGN KEY (`trainer_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SE1620',3,1,2022,'Summer',55253129,1,1,NULL),(2,'Se16033',3,1,2022,'Summer',55253129,1,1,NULL),(3,'SE1612',11,3,2022,'Summer',55253129,0,1,NULL),(4,'SE1613',13,4,2022,'Summer',55253129,0,1,NULL),(5,'Se1614',14,1,2016,'Fall',55253129,0,0,NULL),(6,'SE1671',11,3,2022,'Summer',55253129,1,1,NULL),(7,'SE1670',15,3,2020,'Fall',55253129,1,0,NULL),(8,'SE1632',13,2,2020,'Spring',55253129,0,0,NULL),(9,'SE1640',11,1,2020,'Fall',55253129,1,0,NULL),(10,'SE1633',15,4,2022,'Summer',55253129,0,1,NULL),(11,'SE1676',11,1,2021,'Fall',55253129,1,0,NULL),(12,'SE1665',15,2,2020,'Fall',55253129,0,0,NULL),(13,'SE1655',13,3,2020,'Spring',55253129,1,0,NULL),(14,'SE1652',13,1,2022,'Spring',55253129,0,0,NULL),(15,'SE1684',11,4,2020,'Fall',55253129,0,0,NULL),(16,'SE1621',3,1,2022,'Summer',55253129,1,1,NULL),(17,'Se16030',7,3,2022,'Summer',55253129,0,1,NULL),(18,'Se16032',2,1,2022,'Summer',55253129,1,1,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_setting`
--

DROP TABLE IF EXISTS `class_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_setting` (
  `class_setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `type_title` varchar(45) NOT NULL,
  `type_value` varchar(45) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `class_id` int NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`class_setting_id`),
  KEY `class_id_class_idx` (`class_id`),
  KEY `classs_setting_idx` (`type_id`),
  CONSTRAINT `class_id_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `classs_setting` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_setting`
--

LOCK TABLES `class_setting` WRITE;
/*!40000 ALTER TABLE `class_setting` DISABLE KEYS */;
INSERT INTO `class_setting` VALUES (1,5,'To_do','1','#ffa8a8',1,''),(2,5,'Doing','2','#f50000',1,''),(3,5,'Done','3','#ede8e8',1,''),(4,5,'Open','4','#9372ee',1,''),(5,5,'Close','5','#1cf247',1,''),(6,6,'WP','1','#559bf7',1,''),(7,6,'Q&A','2','#40f2c5',1,''),(8,6,'Task','3','#e4ff14',1,''),(9,6,'Defect','4','#a4f4cf',1,''),(10,6,'Leakage','5','#7357db',1,''),(11,9,'T_Do','1','#c7c4ee',1,''),(12,9,'Analysis','2','#e59915',1,''),(13,9,'Design','3','#4f4040',1,''),(14,9,'Coded','4','#8296f7',1,''),(15,9,'Tested','5','#d3d1ea',1,''),(16,9,'Done','6','#581109',1,''),(17,9,'Close','7','#367d1c',1,''),(19,5,'Fixed','6','#ffccff',1,''),(20,5,'Defect again','7','#00e07f',1,'');
/*!40000 ALTER TABLE `class_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_user` (
  `class_id` int NOT NULL,
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  `team_leader` tinyint NOT NULL,
  `dropout_date` datetime DEFAULT NULL,
  `user_notes` varchar(45) DEFAULT NULL,
  `ongoing_eval` double DEFAULT NULL,
  `final_pres_eval` double DEFAULT NULL,
  `final_topic_eval` double DEFAULT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`class_id`,`team_id`,`user_id`),
  KEY `team_id_idx` (`team_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci KEY_BLOCK_SIZE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
INSERT INTO `class_user` VALUES (1,1,9,1,NULL,NULL,NULL,NULL,NULL,1),(1,1,16,0,NULL,NULL,0,NULL,NULL,1),(1,1,17,0,NULL,'',0,0,0,0),(1,2,18,1,NULL,NULL,NULL,NULL,NULL,1),(1,2,19,0,NULL,NULL,NULL,NULL,NULL,1),(1,2,20,0,NULL,NULL,NULL,NULL,NULL,1),(1,3,21,1,NULL,NULL,NULL,NULL,NULL,1),(1,3,22,0,NULL,NULL,NULL,NULL,NULL,1),(1,3,23,0,NULL,NULL,NULL,NULL,NULL,0),(1,3,24,0,NULL,NULL,NULL,NULL,NULL,1),(3,4,25,1,NULL,NULL,NULL,NULL,NULL,1),(3,4,26,0,NULL,NULL,NULL,NULL,NULL,1),(3,4,27,0,NULL,NULL,NULL,NULL,NULL,1),(3,5,28,1,NULL,NULL,NULL,NULL,NULL,1),(3,5,29,0,NULL,NULL,NULL,NULL,NULL,1),(3,5,30,0,NULL,NULL,NULL,NULL,NULL,1),(3,5,31,0,NULL,NULL,NULL,NULL,NULL,1),(3,6,32,1,NULL,NULL,NULL,NULL,NULL,1),(3,6,33,0,NULL,NULL,NULL,NULL,NULL,1),(3,6,34,0,NULL,NULL,NULL,NULL,NULL,1),(4,7,35,1,NULL,NULL,NULL,NULL,NULL,1),(4,7,36,0,NULL,NULL,NULL,NULL,NULL,1),(4,7,37,0,NULL,NULL,NULL,NULL,NULL,1),(4,7,38,0,NULL,NULL,NULL,NULL,NULL,1),(4,8,39,1,NULL,NULL,NULL,NULL,NULL,1),(4,8,40,0,NULL,NULL,NULL,NULL,NULL,1),(4,8,41,0,NULL,NULL,NULL,NULL,NULL,1),(4,9,42,1,NULL,NULL,NULL,NULL,NULL,1),(4,9,43,0,NULL,NULL,NULL,NULL,NULL,1),(4,9,44,0,NULL,NULL,NULL,NULL,NULL,1),(6,10,45,1,NULL,NULL,NULL,NULL,NULL,1),(6,10,46,0,NULL,NULL,NULL,NULL,NULL,1),(6,10,47,0,NULL,NULL,NULL,NULL,NULL,1),(6,11,48,1,NULL,NULL,NULL,NULL,NULL,1),(6,11,49,0,NULL,NULL,NULL,NULL,NULL,1),(6,11,50,0,NULL,NULL,NULL,NULL,NULL,1),(6,12,51,1,NULL,NULL,NULL,NULL,NULL,1),(6,12,52,0,NULL,NULL,NULL,NULL,NULL,1),(6,12,53,0,NULL,NULL,NULL,NULL,NULL,1),(6,12,54,0,NULL,NULL,NULL,NULL,NULL,1),(10,13,55,1,NULL,NULL,NULL,NULL,NULL,1),(10,13,56,0,NULL,NULL,NULL,NULL,NULL,1),(10,13,57,0,NULL,NULL,NULL,NULL,NULL,1),(10,14,58,1,NULL,NULL,NULL,NULL,NULL,1),(10,14,59,0,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evalution_criteria`
--

DROP TABLE IF EXISTS `evalution_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evalution_criteria` (
  `criterial_id` int NOT NULL AUTO_INCREMENT,
  `iteration_id` int NOT NULL,
  `evalution_title` varchar(45) DEFAULT NULL,
  `evalution_weight` int NOT NULL,
  `team_evaluation` varchar(45) NOT NULL,
  `criteria_order` varchar(45) NOT NULL,
  `max_loc` int NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`criterial_id`),
  KEY `ever_inter_idx` (`iteration_id`),
  CONSTRAINT `ever_inter` FOREIGN KEY (`iteration_id`) REFERENCES `iteration` (`iteration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evalution_criteria`
--

LOCK TABLES `evalution_criteria` WRITE;
/*!40000 ALTER TABLE `evalution_criteria` DISABLE KEYS */;
INSERT INTO `evalution_criteria` VALUES (1,1,'Coding Logic',30,'team','2',180,1),(2,1,'Coding Logic',18,'team','2',180,1),(3,2,'Team Work',30,'team','1',180,0),(4,2,'Team Work',19,'team','1',180,0);
/*!40000 ALTER TABLE `evalution_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `feature_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `feature_name` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`feature_id`),
  KEY `feard_team_idx` (`team_id`),
  CONSTRAINT `feard_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,1,'Home',1,''),(2,2,'Register',1,NULL),(3,3,'View',1,NULL),(4,4,'Up load file',1,NULL),(5,5,'Comment',1,NULL),(6,6,'Login',1,NULL),(7,7,'Forgot Pass',1,NULL),(8,8,'View Class',1,NULL),(9,9,'View Grade',1,NULL),(10,10,'View Team',1,NULL),(11,11,'View User',1,NULL),(12,12,'Update user',1,NULL),(13,13,'Update Name',1,NULL),(14,14,'Add User',1,NULL),(15,2,'Common',1,NULL),(16,2,'Admin',1,NULL),(17,2,'Author',1,NULL);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function` (
  `function_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `function_name` varchar(45) NOT NULL,
  `feature_id` int NOT NULL,
  `access_roles` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `complexity_id` varchar(45) NOT NULL,
  `owner_id` int NOT NULL,
  `priority` varchar(45) DEFAULT NULL,
  `function_status` int NOT NULL,
  PRIMARY KEY (`function_id`),
  KEY `feat_funticon_idx` (`feature_id`),
  KEY `funtionc_team_idx` (`team_id`),
  KEY `function_onew_idx` (`owner_id`),
  KEY `function_statusss_idx` (`function_status`),
  CONSTRAINT `feat_funticon` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`),
  CONSTRAINT `function_onew` FOREIGN KEY (`owner_id`) REFERENCES `class_user` (`user_id`),
  CONSTRAINT `function_statusss` FOREIGN KEY (`function_status`) REFERENCES `class_setting` (`class_setting_id`),
  CONSTRAINT `funtionc_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
INSERT INTO `function` VALUES (1,2,'User Profile',15,'common','','1',18,'1',11),(2,2,'Change Password',15,'common','','1',18,'1',11),(3,2,'User List',16,'admin','','1',19,'1',11),(4,2,'User Details',16,'admin','','1',19,'1',11),(5,2,'Subject List',16,'admin','','1',20,'1',11),(6,4,'Home',4,'Common','','1',25,'1',11),(7,4,'User Register',4,'Common','','1',25,'2',11),(8,4,'Setting List',4,'Admin','','2',25,'3',11),(9,4,'Setting Details',4,'Admin','','2',25,'4',11),(10,4,'User Login',4,'User','','2',25,'5',11),(11,4,'Reset Password',4,'User','','1',25,'6',11),(12,4,'Dashboard',4,'User','','3',26,'7',11),(18,4,'Subject Details',4,'Admin','','2',27,'13',11),(19,4,'Subject Setting List',4,'Author, Admin','','2',27,'14',11),(20,4,'Subject Setting Details',4,'Author, Admin','','3',27,'15',11),(21,4,'Iteration List',4,'Author, Admin','','2',27,'16',11),(22,4,'Iteration Details',4,'Author, Admin','','2',27,'17',11),(74,1,'Home',1,'Common','','1',9,'1',11),(75,1,'User Register',1,'Common','','1',9,'2',11),(76,1,'Setting List',1,'Admin','','2',9,'3',11),(77,1,'Setting Details',1,'Admin','','2',9,'4',11),(78,1,'User Login',1,'User','','2',9,'5',11),(79,1,'Reset Password',1,'User','','1',9,'6',11),(80,1,'Dashboard',1,'User','','3',9,'7',11),(81,1,'User Profile',1,'User','','3',9,'8',11),(82,1,'Change Password',1,'User','','3',9,'9',11),(83,1,'User List',1,'Admin','','3',16,'10',11),(84,1,'User Details',1,'Admin','','2',16,'11',11),(85,1,'Subject List',1,'Admin','','3',16,'12',11),(86,1,'Subject Details',1,'Admin','','2',16,'13',11),(87,1,'Subject Setting List',1,'Author, Admin','','2',16,'14',11),(88,1,'Subject Setting Details',1,'Author, Admin','','3',16,'15',11),(89,1,'Iteration List',1,'Author, Admin','','2',16,'16',11),(90,1,'Iteration Details',1,'Author, Admin','','2',16,'17',11),(91,3,'Home',3,'Common','','1',21,'1',11),(92,3,'User Register',3,'Common','','1',21,'2',11),(93,3,'Setting List',3,'Admin','','2',21,'3',11),(94,3,'Setting Details',3,'Admin','','2',21,'4',11),(95,3,'User Login',3,'User','','2',21,'5',11),(96,3,'Reset Password',3,'User','','1',21,'6',11),(97,3,'Dashboard',3,'User','','3',22,'7',11),(98,3,'User Profile',3,'User','','3',22,'8',11),(99,3,'Change Password',3,'User','','3',22,'9',11),(100,3,'User List',3,'Admin','','3',22,'10',11),(101,3,'User Details',3,'Admin','','2',22,'11',11),(102,3,'Subject List',3,'Admin','','3',24,'12',11),(103,3,'Subject Details',3,'Admin','','2',24,'13',11),(104,3,'Subject Setting List',3,'Author, Admin','','2',24,'14',11),(105,3,'Subject Setting Details',3,'Author, Admin','','3',24,'15',11),(106,3,'Iteration List',3,'Author, Admin','','2',24,'16',11),(107,3,'Iteration Details',3,'Author, Admin','','2',24,'17',11),(108,2,'Home',2,'Common','','1',18,'1',11),(109,2,'User Register',15,'Common','','1',18,'1',11),(110,2,'Setting List',16,'Admin','','2',18,'1',11),(111,2,'Setting Details',17,'Admin','','2',18,'1',11),(112,2,'User Login',2,'User','','2',18,'1',11),(113,2,'Reset Password',15,'User','','1',18,'1',11),(114,2,'Dashboard',16,'User','','3',18,'1',11),(115,2,'User Profile',17,'User','','3',18,'1',11),(116,2,'Change Password',2,'User','','3',19,'1',11),(117,2,'User List',15,'Admin','','3',19,'1',11),(118,2,'User Details',16,'Admin','','2',19,'1',11),(119,2,'Subject List',17,'Admin','','3',19,'1',11),(120,2,'Subject Details',2,'Admin','','2',19,'1',11),(121,2,'Subject Setting List',15,'Author, Admin','','2',20,'1',11),(122,2,'Subject Setting Details',16,'Author, Admin','','3',20,'1',11),(123,2,'Iteration List',17,'Author, Admin','','2',20,'1',11),(124,2,'Iteration Details',2,'Author, Admin','','2',20,'1',11);
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `issue_id` int NOT NULL,
  `issue_title` varchar(200) NOT NULL,
  `assignee_id` int NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `gitlab_id` int NOT NULL,
  `gitlab_url` varchar(100) NOT NULL,
  `created_at` varchar(45) NOT NULL,
  `due_date` varchar(45) DEFAULT NULL,
  `team_id` int NOT NULL,
  `milestone_id` int NOT NULL,
  `function_ids` int NOT NULL,
  `labels` varchar(45) DEFAULT NULL,
  `status` int NOT NULL,
  `issue_type` int NOT NULL,
  `issue_status` int NOT NULL,
  PRIMARY KEY (`issue_id`),
  UNIQUE KEY `issue_title_UNIQUE` (`issue_title`),
  KEY `assignee_idx` (`assignee_id`),
  KEY `milestone_id_idx` (`milestone_id`),
  KEY `issue_team_idx` (`team_id`),
  KEY `issue_funtion_idx` (`function_ids`),
  KEY `isssue_tattus_idx` (`issue_status`),
  KEY `issue_type_idx` (`issue_type`),
  CONSTRAINT `assignee` FOREIGN KEY (`assignee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `isssue_tattus` FOREIGN KEY (`issue_status`) REFERENCES `class_setting` (`class_setting_id`),
  CONSTRAINT `issue_funtion` FOREIGN KEY (`function_ids`) REFERENCES `function` (`function_id`),
  CONSTRAINT `issue_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `issue_type` FOREIGN KEY (`issue_type`) REFERENCES `class_setting` (`class_setting_id`),
  CONSTRAINT `milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (6,'Subject List not respon',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/6','2022-07-06','',2,11,5,'Doing,To_do',1,9,1),(7,'Subject List do not filter',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/7','2022-07-06','',2,2,5,'Doing,To_do',1,9,1),(8,'User Details doesn\'t have filter',19,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/8','2022-07-06','',2,12,4,'Doing,To_do',1,9,1),(9,'User profile didn\'t have paladin',18,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/9','2022-07-06','2022-07-30',2,1,1,'Doing,To_do',1,9,1),(26,'User Profile not run',18,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/26','2022-07-07','',2,1,1,'Defect,Doing',0,9,2),(39,'Iteration list not run',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/39','2022-07-10','',2,11,123,'Doing,To_do',1,10,1),(42,'Iteration details bị trắng trang',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/42','2022-07-10','',2,1,124,'Doing,To_do',1,10,1),(43,'Subject setting details không add được',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/43','2022-07-10','',2,12,122,'Doing,Leakage',0,10,2),(44,'subject Setting list Bị lỗi không truy cập được',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/44','2022-07-10','',2,1,121,'Defect,Doing',1,9,2),(45,'subject setting list bị trắng trang',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/45','2022-07-10','',2,11,121,'Defect,Doing',1,9,2),(46,'Subject setting list không list được',20,'',37597853,'https://gitlab.com/demo1304/swptest/-/issues/46','2022-07-10','',2,1,121,'Defect,Doing',0,9,2);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iteration`
--

DROP TABLE IF EXISTS `iteration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iteration` (
  `iteration_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `iteration_name` varchar(45) NOT NULL,
  `duration` int NOT NULL,
  `iteration_weight` int NOT NULL,
  `is_ongoin` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`iteration_id`),
  KEY `student_inter_idx` (`subject_id`),
  KEY `subject_inter_idx` (`subject_id`),
  CONSTRAINT `subject_inter` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteration`
--

LOCK TABLES `iteration` WRITE;
/*!40000 ALTER TABLE `iteration` DISABLE KEYS */;
INSERT INTO `iteration` VALUES (1,4,'Iteration_Block',5,25,0,0),(2,4,'Iteration_Summer',8,30,0,1),(3,4,'Iteration_Spring',8,10,0,1),(4,4,'Iteration_Fall',8,25,0,1),(5,1,'IterationBlock',5,15,0,1),(6,2,'Iteration 1',5,10,0,1),(7,3,'Iteration 1',2,15,0,1);
/*!40000 ALTER TABLE `iteration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iteration_evaluation`
--

DROP TABLE IF EXISTS `iteration_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iteration_evaluation` (
  `evaluation_id` int NOT NULL AUTO_INCREMENT,
  `iteration_id` int NOT NULL,
  `class_id` int NOT NULL,
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  `bonus` int NOT NULL,
  `grade` int NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `class_interid_idx` (`class_id`,`team_id`,`user_id`),
  KEY `inter_eva_idx` (`iteration_id`),
  CONSTRAINT `class_interid` FOREIGN KEY (`class_id`, `team_id`, `user_id`) REFERENCES `class_user` (`class_id`, `team_id`, `user_id`),
  CONSTRAINT `eva_team_eva` FOREIGN KEY (`evaluation_id`) REFERENCES `team_evaluation` (`evaluation_id`),
  CONSTRAINT `inter_eva` FOREIGN KEY (`iteration_id`) REFERENCES `iteration` (`iteration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iteration_evaluation`
--

LOCK TABLES `iteration_evaluation` WRITE;
/*!40000 ALTER TABLE `iteration_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `iteration_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc_evaluation`
--

DROP TABLE IF EXISTS `loc_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loc_evaluation` (
  `evaluation_id` int NOT NULL AUTO_INCREMENT,
  `evaluation_time` varchar(45) NOT NULL,
  `evaluation_note` varchar(45) NOT NULL,
  `complexity_id` int NOT NULL,
  `quality_id` int NOT NULL,
  `tracking_id` int NOT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `tracking_id_idx` (`tracking_id`),
  CONSTRAINT `tracking_id` FOREIGN KEY (`tracking_id`) REFERENCES `tracking` (`tracking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_evaluation`
--

LOCK TABLES `loc_evaluation` WRITE;
/*!40000 ALTER TABLE `loc_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `loc_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_evaluation`
--

DROP TABLE IF EXISTS `member_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_evaluation` (
  `member_eval_id` int NOT NULL AUTO_INCREMENT,
  `evaluation_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `converted_loc` varchar(45) NOT NULL,
  `grade` int NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`member_eval_id`),
  KEY `criteria_id_idx` (`criteria_id`),
  KEY `member_eva_idx` (`evaluation_id`),
  CONSTRAINT `criteria_id` FOREIGN KEY (`criteria_id`) REFERENCES `evalution_criteria` (`criterial_id`),
  CONSTRAINT `member_eva` FOREIGN KEY (`evaluation_id`) REFERENCES `iteration_evaluation` (`evaluation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_evaluation`
--

LOCK TABLES `member_evaluation` WRITE;
/*!40000 ALTER TABLE `member_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone` (
  `milestone_id` int NOT NULL AUTO_INCREMENT,
  `milestone_name` varchar(45) NOT NULL,
  `iteration_id` int NOT NULL,
  `class_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`milestone_id`),
  KEY `class_id_idx` (`class_id`),
  KEY `iteration_id_idx` (`iteration_id`),
  KEY `class_id` (`class_id`),
  KEY `iteration_id` (`iteration_id`),
  CONSTRAINT `clas_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `iter_id` FOREIGN KEY (`iteration_id`) REFERENCES `iteration` (`iteration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
INSERT INTO `milestone` VALUES (1,'Iter_3',5,1,'2022-06-19','2022-07-24','Milestone_3',1),(2,'Iter_4',5,1,'2022-05-01','2022-06-05','',1),(3,'Name 1',5,16,'2022-06-19','2022-07-24','',0),(4,'Nam 2',1,15,'2022-06-19','2022-07-24','',0),(5,'Name 3',2,15,'2022-06-19','2022-08-14','',0),(6,'Name 4',3,15,'2022-06-19','2022-08-14','',0),(7,'Name 5',3,15,'2022-06-19','2022-08-14','',0),(8,'Name 6',7,6,'2022-06-19','2022-07-03','',1),(9,'Nam3 7',7,6,'2022-06-19','2022-07-03','',1),(10,'Nam3 8',7,6,'2022-07-10','2022-07-24','',1),(11,'Iteration 1',5,1,'2022-06-19','2022-07-24','',1),(12,'Iteration 2',5,1,'2022-06-19','2022-07-24','',1),(13,'Iter_5',5,1,'2022-06-19','2022-08-14',NULL,1);
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `setting_title` varchar(45) NOT NULL,
  `setting_value` varchar(45) NOT NULL,
  `display_order` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_title_UNIQUE` (`setting_title`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,1,'Admin','1','1',1),(2,1,'Author','2','1',1),(3,1,'Trainer','3','2',1),(4,1,'Student','4','3',1),(5,2,'Issue Status','1','2',1),(6,2,'Issue Type','2','1',1),(7,3,'Subject Complexity','1','1',1),(8,3,'Subject Quality','2','4',1),(9,2,'Function Status','3','1',1);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(45) NOT NULL,
  `subject_name` varchar(70) NOT NULL,
  `author_id` int NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `author_id_idx` (`author_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'PRJ301','Java Web Application Development',1,1),(2,'LAB211','OOP with Java Lab	',1,1),(3,'PRN211','Basic Cross-Platform Application Programming With .NET',1,1),(4,'SWP391','Application development project',1,1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_setting`
--

DROP TABLE IF EXISTS `subject_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `type_id` int NOT NULL,
  `setting_title` varchar(45) NOT NULL,
  `setting_value` varchar(45) NOT NULL,
  `display_order` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `subject_id_idx` (`subject_id`),
  KEY `setting_subject_idx` (`setting_id`),
  KEY `setting_subject_idx1` (`type_id`),
  CONSTRAINT `setting_subject` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_setting`
--

LOCK TABLES `subject_setting` WRITE;
/*!40000 ALTER TABLE `subject_setting` DISABLE KEYS */;
INSERT INTO `subject_setting` VALUES (1,2,7,'Subject Complexity : Simple','60','5',1),(2,3,8,'Subject Quality : Zero','0','3',1),(3,2,8,'Subject Quality : Low','5','5',1),(7,4,7,'Subject Complexity : Complex','160','3',1),(8,4,7,'Subject Complexity : Medium','120','3',1),(9,4,7,'Subject Complexity : Simple','60','3',1),(10,4,8,'Subject Quality : Zero','0','4',1),(11,4,8,'Subject Quality : Low','5','4',1),(12,4,8,'Subject Quality : Medium','7','4',1),(13,4,8,'Subject Quality : Hight','10','4',1),(27,2,8,'Zero','0','2',1),(28,2,8,'Medium','5','2',1);
/*!40000 ALTER TABLE `subject_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `topic_code` varchar(45) DEFAULT NULL,
  `topic_name` varchar(45) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `team_token` varchar(100) NOT NULL,
  `gitlab_url` varchar(200) DEFAULT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `class_id_idx` (`class_id`),
  KEY `team_class_idx` (`class_id`),
  CONSTRAINT `team_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,'Team1',NULL,NULL,'37597853','glpat-BHfEsGqeyvhXhhi8myTo','https://gitlab.com/anhpthe150124/swptest',1),(2,1,'Team2','SMP','Student Manager Project','37597853','glpat-BHfEsGqeyvhXhhi8myTo','https://gitlab.com/anhpthe150124/swptest',1),(3,1,'Team3',NULL,NULL,'','',NULL,1),(4,3,'Team1','Sm','Subject manager','','','',1),(5,3,'Team2','PRJ','Fruit','','','',1),(6,3,'Team3','PRO','Sale Shose','','','',1),(7,4,'Team1',NULL,NULL,'','',NULL,1),(8,4,'Team2',NULL,NULL,'','',NULL,1),(9,4,'Team3',NULL,NULL,'','',NULL,1),(10,6,'Team1',NULL,NULL,'','',NULL,1),(11,6,'Team2',NULL,NULL,'','',NULL,1),(12,6,'Team3',NULL,NULL,'','',NULL,1),(13,10,'Team1',NULL,NULL,'','',NULL,1),(14,10,'Team2',NULL,NULL,'','',NULL,1);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_evaluation`
--

DROP TABLE IF EXISTS `team_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_evaluation` (
  `team_eval_id` int NOT NULL AUTO_INCREMENT,
  `evaluation_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `team_id` int NOT NULL,
  `grade` int NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team_eval_id`),
  KEY `criteria_id_idx` (`criteria_id`),
  KEY `loc_id_idx` (`evaluation_id`),
  KEY `teameva_id_idx` (`team_id`),
  CONSTRAINT `loc_id` FOREIGN KEY (`evaluation_id`) REFERENCES `loc_evaluation` (`evaluation_id`),
  CONSTRAINT `team_eva` FOREIGN KEY (`criteria_id`) REFERENCES `evalution_criteria` (`criterial_id`),
  CONSTRAINT `teameva_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_evaluation`
--

LOCK TABLES `team_evaluation` WRITE;
/*!40000 ALTER TABLE `team_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `tracking_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `milestone_id` int NOT NULL,
  `function_id` int NOT NULL,
  `assigner_id` int NOT NULL,
  `assignee_id` int NOT NULL,
  `tracking_note` varchar(45) DEFAULT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`tracking_id`),
  KEY `tracking_f_idx` (`function_id`),
  KEY `tranking_t_idx` (`team_id`),
  KEY `tracking_m_idx` (`milestone_id`),
  KEY `tracking_ner_idx` (`assigner_id`),
  KEY `tracking_nee_idx` (`assignee_id`),
  CONSTRAINT `tracking_f` FOREIGN KEY (`function_id`) REFERENCES `function` (`function_id`),
  CONSTRAINT `tracking_m` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `tracking_nee` FOREIGN KEY (`assignee_id`) REFERENCES `class_user` (`user_id`),
  CONSTRAINT `tracking_ner` FOREIGN KEY (`assigner_id`) REFERENCES `class_user` (`user_id`),
  CONSTRAINT `tranking_t` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES (1,2,1,1,18,19,NULL,1),(2,1,11,74,9,9,'',1);
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update`
--

DROP TABLE IF EXISTS `update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `update` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `tracking_id` int NOT NULL,
  `update_title` varchar(100) NOT NULL,
  `milestone_id` int NOT NULL,
  `Date` date NOT NULL,
  `Note` varchar(500) NOT NULL,
  PRIMARY KEY (`update_id`),
  KEY `trackingg_update_idx` (`tracking_id`),
  CONSTRAINT `trackingg_update` FOREIGN KEY (`tracking_id`) REFERENCES `tracking` (`tracking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update`
--

LOCK TABLES `update` WRITE;
/*!40000 ALTER TABLE `update` DISABLE KEYS */;
INSERT INTO `update` VALUES (1,2,'',1,'2022-07-09','- Update'),(2,1,'',1,'2022-07-09',''),(3,1,'',2,'2022-07-09','ACCC');
/*!40000 ALTER TABLE `update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `roll_number` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `date_of_birth` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `avatar_link` varchar(45) DEFAULT NULL,
  `facebook_link` varchar(45) DEFAULT NULL,
  `token_user` varchar(45) DEFAULT NULL,
  `role_id` int NOT NULL,
  `status` tinyint NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `roll_number_UNIQUE` (`roll_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'he150124','Pham Tuan Anh','male','2022-05-14','anhpthe150124@fpt.edu.vn','0827523006','services/image/avatar_1.jpg','https://www.facebook.com/mrtom.tuananh','glpat-BHfEsGqeyvhXhhi8myTo',1,0,'$2a$12$qZrT0vQ/nylCA61zBQIjPeg1R4y91IOarroycVcBmVcKW108OjoSm'),(2,'ananh170','AnhTuan','female','2022-05-20','ptuananh170@fpt.edu.vn','0827523006','services/image/avatar_2.jpg','https://www.facebook.com/','glpat-BHfEsGqeyvhXhhi8myTo',2,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(3,'he150125','tuananh','male','2022-05-20','anhpthe150125@fpt.edu.vn','0827526003','null','https://www.facebook.com/','glpat-BHfEsGqeyvhXhhi8myTo',3,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(4,'he150126','Xuan Tuan','male','2022-05-20','anhpthe150126@fpt.edu.vn','0827526003','null','null','glpat-BHfEsGqeyvhXhhi8myTo',2,1,'$2a$12$EZ.4RswiEfJizrH/o8H/6.xE70aOLNLnuGXbuLkDLch8vQm1TRJzK'),(7,'hs153228','Sim','male','2022-06-28','simttths153228@fpt.edu.vn','0827523009','null','https://www.facebook.com/','glpat-BHfEsGqeyvhXhhi8myTo',2,1,'$2a$12$WkR9.m9U6YgF1p5Sa5fWP.xqFuo1XuObjOmAJfTuv.76hzLwUmQtO'),(8,'he150457','Luu Tien DAt','male','2022-06-19','datlthe150457@fpt.edu.vn','0827523006','null','null','glpat-BHfEsGqeyvhXhhi8myTo',3,1,'$2a$12$A7L2a6RToZMt5YjVSfKoRuj28bxmqjtVQcC6L/Tf8FKmAs2AANfKu'),(9,'HE189700','Hort Cato','Male','2/1/2004','hcato0@blogs.com',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(11,'HE180999','Issy Singleton','Female','7/17/2005','isingleton1@livejournal.com',NULL,NULL,NULL,'glpat-BHfEsGqeyvhXhhi8myTo',3,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(12,'HE184079','Gregoor Burlingham','Male','2/28/2004','gburlingham2@google.pl',NULL,NULL,NULL,'glpat-BHfEsGqeyvhXhhi8myTo',3,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(13,'HE132573','Baxy Sonier','Male','3/20/2003','bsonier3@army.mil',NULL,NULL,NULL,'glpat-BHfEsGqeyvhXhhi8myTo',3,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(14,'HE103815','Shurlocke Bradshaw','Male','10/30/2006','sbradshaw4@domainmarket.com',NULL,NULL,NULL,'glpat-BHfEsGqeyvhXhhi8myTo',3,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(15,'HE196268','Berti Worsall','Female','12/28/1999','bworsall5@trellian.com',NULL,NULL,NULL,'glpat-BHfEsGqeyvhXhhi8myTo',3,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(16,'HE171830','Harry McCully','Male','8/14/2006','hmccully6@jalbum.net',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(17,'HE165042','Dew Dyball','Male','11/3/2000','ddyball7@kickstarter.com',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(18,'HE108748','Channa Cayser','Female','10/18/2005','ccayser8@desdev.cn',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(19,'HE194152','Hestia Thurner','Non-binary','6/2/2005','hthurner9@unesco.org',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(20,'HE155480','Paola Toombs','Female','5/1/2007','ptoombsa@bloglovin.com',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(21,'HE104869','Kendal Payfoot','Male','6/4/2004','kpayfootb@noaa.gov',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(22,'HE142452','Arleyne Tregenna','Female','3/17/2000','atregennac@sciencedaily.com',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(23,'HE144154','Durant Ferrieroi','Male','3/10/2006','dferrieroid@fotki.com',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(24,'HE136151','Urbain Phant','Male','4/24/2006','uphante@wikimedia.org',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(25,'HE110036','Lindsey Pierpoint','Female','1/26/2004','lpierpointf@psu.edu',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(26,'HE198235','Aloise Malim','Female','8/9/1999','amalimg@seesaa.net',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(27,'HE117111','Dexter Vinker','Male','10/14/2004','dvinkerh@unc.edu',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(28,'HE190008','Lynnett Hillam','Female','1/4/2002','lhillami@fastcompany.com',NULL,NULL,NULL,NULL,4,1,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(29,'HE170280','Dulcinea Avrasin','Female','9/14/2007','davrasinj@bizjournals.com',NULL,NULL,NULL,NULL,4,0,'$2a$12$4XInRx3KENP7nihyvMc3WOs3ndLZdwVDxBDNfe.8TDBscHk7s2Ve6'),(30,'HE166909','Berti Jancey','Female','9/15/2006','bjanceyk@zimbio.com',NULL,NULL,NULL,NULL,4,0,'7f14670fe489500b2f0f644d93b73dde'),(31,'HE125064','Amber Velti','Female','2/8/2002','aveltil@answers.com',NULL,NULL,NULL,NULL,4,1,'ae9a0763be3565450627ff2b66325fb5'),(32,'HE131436','Spense De Rechter','Male','2/1/2007','sdem@godaddy.com',NULL,NULL,NULL,NULL,4,0,'c999bb4efdc8a8f1c8a1c515d1d263ae'),(33,'HE140718','Carolynn Mabe','Female','10/12/2002','cmaben@mashable.com',NULL,NULL,NULL,NULL,4,1,'cb14b988e36396fc18bbe446cdb1e3fb'),(34,'HE146501','Anne Wainscoat','Female','3/7/2003','awainscoato@taobao.com',NULL,NULL,NULL,NULL,4,0,'c64fef0c4b8a0eb164871731156a48cf'),(35,'HE113773','Brendan Papps','Male','11/6/2001','bpappsp@diigo.com',NULL,NULL,NULL,NULL,4,1,'7397b91837896101f4bcc1f7c13705af'),(36,'HE174293','Robbert Gaukrodge','Male','7/28/2003','rgaukrodgeq@behance.net',NULL,NULL,NULL,NULL,4,0,'1ca1dbf26d033627305bc767ab1ddf9f'),(37,'HE172425','Mikey Morat','Male','6/23/2004','mmoratr@nature.com',NULL,NULL,NULL,NULL,4,1,'aecc9dae1a0e22d92ef4c5a1362d5c56'),(38,'HE168237','Delmer Lurriman','Male','2/28/2004','dlurrimans@usnews.com',NULL,NULL,NULL,NULL,4,1,'d53240d3eca175c95e6292f96e5a6880'),(39,'HE128056','Phoebe Poure','Female','5/20/2001','ppouret@1und1.de',NULL,NULL,NULL,NULL,4,1,'2c8a5eb6ede15c5081db29034a9558f9'),(40,'HE195780','Sylvia Grigoliis','Female','1/18/2008','sgrigoliisu@desdev.cn',NULL,NULL,NULL,NULL,4,0,'e649a89856545fac4aaaa5ca014d5653'),(41,'HE115830','Teodoor Dannel','Male','10/4/2007','tdannelv@marriott.com',NULL,NULL,NULL,NULL,4,1,'f5d2d247e7ed8aa5ceea86b52137218c'),(42,'HE161953','Jefferey O\'Brien','Male','8/23/2003','jobrienw@1und1.de',NULL,NULL,NULL,NULL,4,1,'dbe090f7cd689e30af2ff72f4a960df3'),(43,'HE175162','Jethro Demeter','Male','9/6/2003','jdemeterx@biglobe.ne.jp',NULL,NULL,NULL,NULL,4,0,'11b83751a775de1da20166a92ead198e'),(44,'HE147720','Dorthy Georgeson','Genderfluid','8/13/2002','dgeorgesony@economist.com',NULL,NULL,NULL,NULL,4,0,'c9f0e2d4aa9561fd96c157f803cd3c15'),(45,'HE127535','Felizio Furmagier','Male','5/14/2006','ffurmagierz@spiegel.de',NULL,NULL,NULL,NULL,4,0,'4b5cd9806222c766cfd10c57dce7effe'),(46,'HE136238','Scarface Lilie','Male','12/16/2007','slilie10@newyorker.com',NULL,NULL,NULL,NULL,4,0,'749a62fa385e91abb77f3c2fee55a077'),(47,'HE128715','Manny Elion','Male','2/28/2008','melion11@w3.org',NULL,NULL,NULL,NULL,4,0,'d7b9bb919e100fea9a22d68591a5c2d0'),(48,'HE150308','Abel Novotna','Genderfluid','2/5/2005','anovotna12@mediafire.com',NULL,NULL,NULL,NULL,4,0,'6eecc42852236c85cd0227eda45fd6b2'),(49,'HE101032','Fey Cheverell','Female','8/7/2001','fcheverell13@reuters.com',NULL,NULL,NULL,NULL,4,0,'c1d673da2691d73803a30b65bb8645a4'),(50,'HE114077','Eunice Glackin','Female','10/23/2007','eglackin14@microsoft.com',NULL,NULL,NULL,NULL,4,0,'c129c20881d02feae7f339bc3021f617'),(51,'HE139425','Vail Christian','Male','3/13/2007','vchristian15@skype.com',NULL,NULL,NULL,NULL,4,0,'52686108082fc7dbe479c4e9f8bb6f08'),(52,'HE146309','Ethyl Lages','Female','11/1/2004','elages16@thetimes.co.uk',NULL,NULL,NULL,NULL,4,0,'d68a6b1a01309be5ab2dae2457c1470c'),(53,'HE129308','Sherwood Townshend','Male','11/13/2007','stownshend17@cloudflare.com',NULL,NULL,NULL,NULL,4,0,'f2b7603334f19238667499e35487e67e'),(54,'HE167886','Pietra Toler','Female','5/22/2005','ptoler18@house.gov',NULL,NULL,NULL,NULL,4,1,'d7a07cd402defe797fdd983e364a0105'),(55,'HE186135','Patten Marvell','Male','6/3/2004','pmarvell19@mayoclinic.com',NULL,NULL,NULL,NULL,4,1,'e495c9a1a8d5ac27dbdc8f3d9b2bee14'),(56,'HE115741','Gibbie Hurran','Male','9/29/2004','ghurran1a@wired.com',NULL,NULL,NULL,NULL,4,0,'3ebeeb777fa29b445800f5a782d8a0e1'),(57,'HE134216','Trevor Pontefract','Male','7/26/2005','tpontefract1b@gizmodo.com',NULL,NULL,NULL,NULL,4,1,'f8460b92d29abc22cd16311a5d72e9cf'),(58,'HE163817','Hew Bhar','Male','10/27/2003','hbhar1c@twitter.com',NULL,NULL,NULL,NULL,4,1,'6b82e42de61c00a3703e5c4ca021603e'),(59,'HE199137','Kacey Norledge','Female','4/10/2000','knorledge1d@vkontakte.ru',NULL,NULL,NULL,NULL,4,1,'0132ebf92b56e9af3d1e70c11f50cb1a');
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

-- Dump completed on 2022-07-18 20:02:03

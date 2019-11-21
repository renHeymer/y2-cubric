CREATE DATABASE  IF NOT EXISTS `cm6211_1819_team_5` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cm6211_1819_team_5`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cm6211_1819_team_5
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `username` varchar(50) NOT NULL,
  `feedback_date` date DEFAULT NULL,
  `enjoyed` int(11) DEFAULT NULL,
  `task_right_level` int(11) DEFAULT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `recommend` int(1) DEFAULT NULL,
  KEY `username` (`username`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1.0','init','SQL','V1_0__init.sql',-1889457815,'root','2019-03-05 08:20:26',628,1),(2,'1.1','add user roles table','SQL','V1_1__add_user_roles_table.sql',433191651,'root','2019-03-05 08:20:26',74,1),(3,'1.2','add db logic for returning training images and test results','SQL','V1_2__add_db_logic_for_returning_training_images_and_test_results.sql',-388592967,'root','2019-03-05 08:20:26',37,1),(4,'1.3','add primary key constraint to swipes','SQL','V1_3__add_primary_key_constraint_to_swipes.sql',-2027547387,'root','2019-03-05 08:20:26',71,1),(5,'1.4','add unique constraint to user equality','SQL','V1_4__add_unique_constraint_to_user_equality.sql',-295422367,'root','2019-03-05 08:20:26',69,1),(6,'1.5','allow all columns apart from username to be null in user equality','SQL','V1_5__allow_all_columns_apart_from_username_to_be_null_in_user_equality.sql',1280713738,'root','2019-03-05 08:20:26',61,1),(7,'1.6','improved stored procedure to discount users','SQL','V1_6__improved_stored_procedure_to_discount_users.sql',-76568980,'root','2019-03-05 08:20:26',2,1),(8,'1.7','add procedure to calculate percentage of correct and incorrect answers','SQL','V1_7__add_procedure_to_calculate_percentage_of_correct_and_incorrect_answers.sql',-327041862,'root','2019-03-05 08:20:26',3,1),(9,'1.8','persist password confirm','SQL','V1_8__persist_password_confirm.sql',1957655664,'root','2019-03-05 08:20:26',97,1),(10,NULL,'add feedback dummy data','SQL','R__add_feedback_dummy_data.sql',1022527966,'root','2019-03-05 08:20:26',2,1),(11,NULL,'test dummy data','SQL','R__test_dummy_data.sql',-1790357021,'root','2019-03-05 08:20:26',14,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_folders`
--

DROP TABLE IF EXISTS `image_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_folders` (
  `folder_prefix` varchar(100) NOT NULL,
  PRIMARY KEY (`folder_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_folders`
--

LOCK TABLES `image_folders` WRITE;
/*!40000 ALTER TABLE `image_folders` DISABLE KEYS */;
INSERT INTO `image_folders` VALUES ('/images/Swipe_R_Jpgs/Jpgs_V1/'),('/images/Swipe_R_Jpgs/Jpgs_V2/'),('/images/Swipe_R_Jpgs/Jpgs_V3/');
/*!40000 ALTER TABLE `image_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scans`
--

DROP TABLE IF EXISTS `scans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scans` (
  `scan_id` varchar(100) NOT NULL,
  `correct_answer` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`scan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scans`
--

LOCK TABLES `scans` WRITE;
/*!40000 ALTER TABLE `scans` DISABLE KEYS */;
INSERT INTO `scans` VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_L_SLF_1.jpg',1),('10046A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10069A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10109A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10154A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10175A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10195A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10235A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10241A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10247A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10254A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10255A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10278A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10297A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10303A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('10316A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10348A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10349A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10376A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('10388A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10428A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10447A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1044A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10500A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10514A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10527A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1053A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('10551A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10609A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10640A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10657A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('10663A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1072A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10760A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10786A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10817A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10855A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('10879A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10901A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10956A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10959A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10989A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('10990A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11068A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11076A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11102A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11194A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11211A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11212A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11233A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11290A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11310A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('11321A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11352A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('11362A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('113A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11453A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11485A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11521B_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11524A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11544A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11588A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11662A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11691A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11704A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11725A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11741A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11743A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11786A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11800A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11802A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11809A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11811A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11828A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11841A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11847A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11897A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11941A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11948A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('11965A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12020A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12075A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12128A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12150A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12161A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12193A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12210A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12241A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12252A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12262A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12301A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12359A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12401A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12437A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12448A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12466A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12479A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12484A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12515A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12529A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12543A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1255A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12570A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1261A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12654A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12673A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12697A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12777A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12789A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1278A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12794A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12819A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('12888A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12941A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12953A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('12972A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13074A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13083A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13089A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13121A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13171A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13219A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13262A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('132A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13369A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13377A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13428A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13434A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13452A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13480A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13484A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13501A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13527A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13530A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13548A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13561A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13576A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13617A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13619A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13640A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13643A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13645A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13646A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('13676A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13710A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13720A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1377A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13784A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13790A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13794A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13838A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13841A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13858A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13864A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13870A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13873A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13923A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1393A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1396A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('13998A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14024A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14062A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1410A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14152A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14163A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14172A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14175A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14225A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14300A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14364A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14386A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('14394A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14407A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14409A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('14517A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14519A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14531A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14619A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1465A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14733A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14735A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14765A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('14788A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14839A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14893A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14936A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1495A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('14995A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1500A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15068A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15193A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15196A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15269A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15273A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15283A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15284A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15290A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15299A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15324A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15359A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15395A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15453A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15467A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15482A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15517A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15557A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15574A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15611A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1562A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15665A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15741A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15754A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15762A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15804A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15822A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15853A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15902A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1592A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15935A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15950A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15966A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('15978A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16013A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16017A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1604A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16084A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16146A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1614A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16164A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16170A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16253A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16293A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16319A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16324A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16338A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16417A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16419A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16443A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16500A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16526A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16602A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16628A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16694A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16705A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('1670A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16720A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16736A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16760A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16790A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16833A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16954A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16988A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('16990A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17125A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17150A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17182A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17213A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17235A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17244A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17274A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1727A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17307A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17343A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17349A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17351A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17417A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17435A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17442A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17536A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17538A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17556A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17560A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17609A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17616A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17630A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17648A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17667A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17681A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17735A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17743A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17836A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17888A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17916A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17940A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17942A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('17948A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1794A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1795A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18006A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('18011A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1805A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('18082A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18087A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18108A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18114A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18136A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('18150A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18165A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18192A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18309A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1831A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18320A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1833A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18362A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18368A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1840A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18428A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('18610A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18631A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18718A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18730A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18749A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18812A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18849A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18935A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18949A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18986A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('18995A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('19002A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19061A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19092A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19096A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19103A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19107A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19145A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19158A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19234A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1928A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19317A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19322A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19343A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19351A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19425A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19432A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19449A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19470A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1953A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19570A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19577A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19585A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('1964A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19714A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19734A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19764A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('19778A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19787A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('197A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19803A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19846A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19918A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('19937A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20025A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20075A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20143A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20154A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20171A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('20172A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20225A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('20265A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2028A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20378A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20390A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2047A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20480A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20498A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20536A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20579A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20652A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20661A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('20674A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20697A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20727A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20810A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('20885A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21017A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21024A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21033A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21048A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21170A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21177A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('21245A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('228A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2294A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2332A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2338A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2352A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('2411A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2444A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2488A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2491A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2497A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2558A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('257A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2581A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2605A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2612A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2618A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2647A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2684A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2764A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2793A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2841A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2849A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2877A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2962A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('2965A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('315A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3177A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3210A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3244A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3283A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3392A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3392B_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3415A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3451A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3564A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3624A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('3644A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3660A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3667A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3690A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3702A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3726A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3769A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3784A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3802A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('381A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3846A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('3869A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4011A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4107A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4118A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4179A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4194A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4216A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('435A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4404A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('4435A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4440A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4489A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4527A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4537A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('4549A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4550A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4574A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4674A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4785A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4820A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4835A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4839A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4844A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4884A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4898A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('4925A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('4936A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('5011A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5023A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('504A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5053A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5060A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('5077A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5136A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5139A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5177A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('5179A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('517A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5196A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5260A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5275A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5315A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5325A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5341A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('5345A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5353A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5379A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5400A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5418A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('543A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5452A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5494A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5527A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5537A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5612A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5625A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5642A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5687A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5707A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5726A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5745A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5777A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5790A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5817A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5827A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5846A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('5904A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('594A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('595A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6022A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6038A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6057A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6087A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6093A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6125A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6137A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('6188A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6192A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6194A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('619A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6239A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('6331A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6343A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6385A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6401A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6475A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6524A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6578A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6613A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6652A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6663A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6673A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6677A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6678A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('66A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6733A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6741A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6780A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6785A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6791A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('67A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6873A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('6920A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6929A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6960A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('6979A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('6984A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7004A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7021A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('7059A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7083A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7086A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7091A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('70A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7146A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7168A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7179A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7265A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7278A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7288A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7307A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7350A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7358A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7398A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7427A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7436A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7460A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('748A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7509A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7582A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7595A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7598A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7601A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7605A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('761A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7622A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7629A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7653A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7667A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7672A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7696A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('778A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('77A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7805A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('7839A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('787A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7893A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7932A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7940A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('796A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7972A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7984A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('7989A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8003A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('800A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8030A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('803A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8064A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8099A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8107A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8126A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8218A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('823A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8240A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8249A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8289A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8324A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8356A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8367A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8373A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8377A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8378A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8403A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8404A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8409A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8412A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8587A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('86A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8712A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8713A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8770A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8800A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8805A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8807A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8811A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8814A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('882A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8834A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8845A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('884A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8855A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8856A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8861A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8904A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8936A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('8980A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9059A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9075A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9091A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9106A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9153A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9211A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9334A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9397A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9430A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9493A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9522A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9529A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('9556A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9565A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9595A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9609A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9663A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9667A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9674A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9689A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('9796A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9802A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9805A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9817A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9823A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9835A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9842A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9845A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9857A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('986A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('988A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9906A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9907A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9945A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9954A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('9986A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('99A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1);
/*!40000 ALTER TABLE `scans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('1313cc98-2b43-4977-8984-c102b5021c7d','2f74e790-c811-4d1c-a50a-ddc0c59fdc10',1544136132446,1544137618145,1800,1544139418145,'admin');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('1313cc98-2b43-4977-8984-c102b5021c7d','SPRING_SECURITY_CONTEXT','??\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0?\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0?\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken?(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0??^?\0L\0cq\0~\0xpsr\0java.util.ArrayListx????a?\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0?\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0?\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$d501df4e-b272-406b-b0c2-e0dce2796338psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0?\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet?????U\0\0xq\0~\0\nsr\0java.util.TreeSet?P???[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0?\0\0xpw\0\0\0q\0~\0xpt\0admin');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swipes`
--

DROP TABLE IF EXISTS `swipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swipes` (
  `scan_id` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `is_good_scan` tinyint(1) NOT NULL,
  `swipe_datetime` datetime NOT NULL,
  PRIMARY KEY (`username`,`scan_id`),
  KEY `scan_id` (`scan_id`),
  KEY `username` (`username`),
  CONSTRAINT `swipes_ibfk_1` FOREIGN KEY (`scan_id`) REFERENCES `scans` (`scan_id`) ON DELETE CASCADE,
  CONSTRAINT `swipes_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swipes`
--

LOCK TABLES `swipes` WRITE;
/*!40000 ALTER TABLE `swipes` DISABLE KEYS */;
INSERT INTO `swipes` VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','Arron',0,'2019-03-05 08:20:26'),('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','dan',1,'2019-03-05 08:20:26'),('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','Holly',1,'2019-03-05 08:20:26'),('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','Hristo',1,'2019-03-05 08:20:26');
/*!40000 ALTER TABLE `swipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_spent_on_training`
--

DROP TABLE IF EXISTS `time_spent_on_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_spent_on_training` (
  `username` varchar(50) DEFAULT NULL,
  `time_spent` time DEFAULT NULL,
  KEY `username` (`username`),
  CONSTRAINT `time_spent_on_training_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_spent_on_training`
--

LOCK TABLES `time_spent_on_training` WRITE;
/*!40000 ALTER TABLE `time_spent_on_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_spent_on_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_swipes`
--

DROP TABLE IF EXISTS `training_swipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_swipes` (
  `username` varchar(50) NOT NULL,
  `scan_id` varchar(100) NOT NULL,
  `is_good_scan` tinyint(1) DEFAULT NULL,
  KEY `username` (`username`),
  KEY `scan_id` (`scan_id`),
  CONSTRAINT `training_swipes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `training_swipes_ibfk_2` FOREIGN KEY (`scan_id`) REFERENCES `scans` (`scan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_swipes`
--

LOCK TABLES `training_swipes` WRITE;
/*!40000 ALTER TABLE `training_swipes` DISABLE KEYS */;
INSERT INTO `training_swipes` VALUES ('jamie','10316A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','10303A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','10235A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','4404A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','1495A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','1072A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','1795A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',1),('jamie','2352A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('jamie','2338A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0),('jamie','2047A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg',0);
/*!40000 ALTER TABLE `training_swipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_equality`
--

DROP TABLE IF EXISTS `user_equality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_equality` (
  `username` varchar(50) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `disability` tinyint(1) DEFAULT NULL,
  `disability_explanation` varchar(200) DEFAULT NULL,
  `post_code_fh` varchar(10) DEFAULT NULL,
  `religion` varchar(40) DEFAULT NULL,
  UNIQUE KEY `username_2` (`username`),
  KEY `username` (`username`),
  CONSTRAINT `user_equality_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_equality`
--

LOCK TABLES `user_equality` WRITE;
/*!40000 ALTER TABLE `user_equality` DISABLE KEYS */;
INSERT INTO `user_equality` VALUES ('jamie',3,0,1,'0','null','null'),('scmjo',3,0,1,'0','null','null');
/*!40000 ALTER TABLE `user_equality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `username` (`username`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (5,'bazza','ROLE_ADMIN'),(6,'bazza','ROLE_USER'),(7,'loz','ROLE_ADMIN'),(8,'loz','ROLE_USER'),(9,'admin','ROLE_ADMIN'),(10,'admin','ROLE_USER'),(11,'user','ROLE_USER'),(12,'scmjo','ROLE_USER'),(13,'jamie','ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userconfidence`
--

DROP TABLE IF EXISTS `userconfidence`;
/*!50001 DROP VIEW IF EXISTS `userconfidence`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userconfidence` AS SELECT 
 1 AS `scan_id`,
 1 AS `answerGood`,
 1 AS `answerBad`,
 1 AS `totalSwipes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `user_email` varchar(100) NOT NULL,
  `completed_training` tinyint(1) DEFAULT '0',
  `discounted` tinyint(1) DEFAULT '0',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `time_created` varchar(100) default null,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'admin@gmail.com',1,0,NULL,NULL,'$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS'),('Arron','$2a$10$iW/BvjbeFjM4Px798U9x.ODHylQpt2xeB/BIpvXyObPO5rwgKRyGC',1,'a@gmail.com',0,0,NULL,NULL,NULL),('bazza','$2a$10$gzkExf/YjPVmDWHSncyyFuJ4gCqe3u6SObVdB5sfV97nNxa0V3kWC',1,'baz@baz.com',0,0,NULL,NULL,NULL),('carl','$2a$10$W5yMhmPOMcKJbyd/j8oMROy3JTPuHiFsLvn9NfgaUZO9XhddR3yru',1,'carl@gmail.com',0,0,NULL,NULL,NULL),('dan','$2a$10$YO0VEcwj5BoOm0Ws/1M02uRc1vcZTClqiE/YsTcHSd5XwMNpRIDY.',1,'dnorth@gmail.com',0,1,NULL,NULL,NULL),('fleureast','$2a$10$1jAy4P.PQCzD1DuXUxHQhO0WTFATTkaBlDXvQ4vj.hKRCbRyq4pqe',1,'flear@east.com',0,0,NULL,NULL,NULL),('floiz','$2a$10$vGctvAmFmxvflvVXp52Ky.2.xglk1VUoyo0wo3iTZS52wvE5uU5ry',1,'floiz@gmail.com',0,0,NULL,NULL,NULL),('Holly','$2a$10$zxELD1hYpaJujyOcATrCMuzGB380Pbxo8NYg0LcJ2KdNJjtsbJ9QG',1,'hollys@gmail.com',0,0,NULL,NULL,NULL),('Hristo','$2a$10$rjsSvcXbvdeEkXZ8NkyonOtWOnv6OSxUEsaUEKPzNRFC2xreptWGG',1,'h@gmail.com',0,0,NULL,NULL,NULL),('ian','$2a$10$z0JxH7IHpFHXeh67F4wjNOAAjrUIPdHa6XwSgyTpQDNEv4K/YeG3e',1,'ian@gmail.com',0,0,NULL,NULL,NULL),('jamie','$2a$10$A7bYnXK28COrfy.hGxNA0.WSLxwtgMgfXyA4SShIzWET17DQreIRG',1,'jamie@gmail.com',1,0,NULL,NULL,'AnnaLoka2017'),('lauren','$2a$10$/36fjWZn7jFRcbfLg.Wqk.dnDaKKrvDqGoqgPiQYzs2DXF1XaByLC',1,'laurenheymer@gmail.com',0,0,NULL,NULL,NULL),('loz','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'loz@gmail.com',1,0,NULL,NULL,'$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS'),('LukeA','$2a$10$PJqRJPMn16DMJeSnx1ISru60mzwXjQuODhKP5YWmfx.GNOxcBOFYS',1,'l@gmail.com',0,0,NULL,NULL,NULL),('lulu','$2a$10$9gRS78dakVtoHuGBqM1lY.JySWqXkYpBP9hxriHG2RtecuRMfJLne',1,'lu@lu.com',0,0,NULL,NULL,NULL),('peter','$2a$10$4TcbWTw93UK4PNNin7xoMeP70T2TBxHGaGY6EP8u79kTeHPUnlCES',1,'pblack@gmail.com',0,0,NULL,NULL,NULL),('polly','$2a$10$XKsoGtCNSQ7QT3tCEE9Hl.Cohm4kYvnzPi/l6Jwwg0UlHdUNCbfDC',1,'polly@gmail.com',0,0,NULL,NULL,NULL),('scmjo','$2a$10$/4i6hGGo82.jxiRWX8WNeOxXUAAWGHwzPo.j9qpbevnp00sypVbZi',1,'scmjo@cardiff.ac.uk',0,0,NULL,NULL,'AnnaLoka2017'),('user','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'user@gmail.com',1,0,NULL,NULL,'$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS'),('wendy','$2a$10$ay3hldBXyeDg6ZlyZXefdOcGSdLM4GxrI4BJew5nIgosPDisUudLa',1,'wendy@gmail.com',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cm6211_1819_team_5'
--

--
-- Dumping routines for database 'cm6211_1819_team_5'
--
/*!50003 DROP FUNCTION IF EXISTS `calculateNumberOfCorrectSwipes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculateNumberOfCorrectSwipes`(varUsername VARCHAR(50)) RETURNS int(11)
BEGIN



RETURN (SELECT COUNT(*) FROM swipes s inner join scans sc on sc.scan_id=s.scan_id where sc.correct_answer = s.is_good_scan and s.username=varUsername);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculateNumberOfIncorrectSwipes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculateNumberOfIncorrectSwipes`(varUsername VARCHAR(50)) RETURNS int(11)
BEGIN



RETURN (SELECT COUNT(*) FROM swipes s inner join scans sc on sc.scan_id=s.scan_id where sc.correct_answer != s.is_good_scan and s.username=varUsername);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculatePercentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculatePercentage`(a INT, b INT) RETURNS double
BEGIN



RETURN ROUND(((a / b) * 100 ));



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `answersRatio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answersRatio`(OUT percentageOfCorrectAnswers DOUBLE, OUT percentageOfIncorrectAnswers DOUBLE)
BEGIN



DECLARE finished INTEGER DEFAULT 0;

DECLARE numOfCorrectAnswers INTEGER;

DECLARE numOfIncorrectAnswers INTEGER;

DECLARE varUsername VARCHAR(50);

DECLARE numOfSwipes INTEGER;





 DEClARE users_cursor CURSOR FOR

 SELECT username FROM users;



DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;



OPEN users_cursor;



SET numOfCorrectAnswers = 0;

SET numOfIncorrectAnswers = 0;



		 get_users_loop: LOOP



				 FETCH users_cursor INTO varUsername;



				 IF finished = 1 THEN

				   LEAVE get_users_loop;

				 END IF;



                 SET numOfCorrectAnswers = numOfCorrectAnswers + calculateNumberOfCorrectSwipes(varUsername);

                 SET numOfIncorrectAnswers = numOfIncorrectAnswers + calculateNumberOfIncorrectSwipes(varUsername);



		 END LOOP get_users_loop;

     SET numOfSwipes = numOfCorrectAnswers + numOfIncorrectAnswers;



     SELECT calculatePercentage(numOfCorrectAnswers, numOfSwipes)  INTO percentageOfCorrectAnswers;

     SELECT calculatePercentage(numOfIncorrectAnswers, numOfSwipes) INTO percentageOfIncorrectAnswers;



 CLOSE users_cursor; -- close the cursor



 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNewBatchForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewBatchForUser`(IN var_username VARCHAR(50))
BEGIN

(SELECT sc.scan_id FROM scans sc

  WHERE sc.correct_answer = 1 AND NOT EXISTS

    (SELECT sw.scan_id, sw.username FROM swipes sw WHERE sw.scan_id = sc.scan_id AND sw.username = var_username)

      LIMIT 75)

      UNION

      (SELECT sc.scan_id FROM scans sc



        WHERE sc.correct_answer = 0 AND NOT EXISTS

          (SELECT sw.scan_id, sw.username FROM swipes sw WHERE sw.scan_id = sc.scan_id AND sw.username = var_username)

            LIMIT 25);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetScanStatsTheMajorityGotWrong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetScanStatsTheMajorityGotWrong`()
BEGIN

DECLARE finished INTEGER;

DECLARE numSayGood INTEGER;

DECLARE numSayBad INTEGER;

DECLARE varScanId VARCHAR(100);

DECLARE varPercentageOfMajority DOUBLE;

DECLARE varMajorityOpinion TINYINT(1);

DECLARE scan_cursor CURSOR FOR SELECT scan_id FROM scans;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;



-- Table to hold all scans where the majority opinion is wrong

DROP TABLE IF EXISTS dodgy_mass_opinions;

CREATE TABLE IF NOT EXISTS dodgy_mass_opinions

(

	scan_id VARCHAR(100),

    mass_opinion TINYINT(1),

    percentage DOUBLE

);



OPEN scan_cursor;



    get_scans_loop : LOOP



		FETCH scan_cursor INTO varScanId;



         IF finished = 1 THEN

				 LEAVE get_scans_loop;

				 END IF;



		SELECT COUNT(*) FROM swipes WHERE scan_id = varScanId AND is_good_scan = 1 INTO numSayGood;

		SELECT COUNT(*) FROM swipes WHERE scan_id = varScanId AND is_good_scan = 0 INTO numSayBad;



        IF(numSayGood > numSayBad)

		THEN

			SET varMajorityOpinion = 1;

            SET varPercentageOfMajority = (numSayGood / (numSayGood + numSayBad)) * 100;

		END IF;

		IF(numSayGood < numSayBad)

        THEN

			SET varMajorityOpinion = 0;

            SET varPercentageOfMajority = (numSayBad / (numSayGood + numSayBad)) * 100;

		END IF;

		IF(numSayGood = 0 AND numSayBad = 0)

		THEN

			SET varMajorityOpinion = NULL;

			SET varPercentageOfMajority = NULL;

		END IF;



		IF (varMajorityOpinion != (SELECT correct_answer FROM scans WHERE scan_id = varScanId))

        THEN

			INSERT INTO dodgy_mass_opinions VALUES (varScanId, varMajorityOpinion, varPercentageOfMajority);

		END IF;



	END LOOP get_scans_loop;



CLOSE scan_cursor;



SELECT * FROM dodgy_mass_opinions;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTrainingBatch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTrainingBatch`(IN var_username VARCHAR(50))
BEGIN

(SELECT sc.scan_id, sc.correct_answer FROM scans sc

  WHERE sc.scan_id LIKE '4404%' OR sc.scan_id LIKE '4537%' OR sc.scan_id LIKE '6979%' OR sc.scan_id LIKE '2352%'

  OR sc.scan_id LIKE '823%' OR sc.scan_id LIKE '1072%' OR sc.scan_id LIKE '2047%' OR sc.scan_id LIKE '1495%' OR sc.scan_id LIKE '2411%'

  OR sc.scan_id LIKE '988%' OR sc.scan_id LIKE '10014%' OR sc.scan_id LIKE '10046%' OR sc.scan_id LIKE '10235%'

  OR sc.scan_id LIKE '10376%' OR sc.scan_id LIKE '10316%' OR sc.scan_id LIKE '1795%' OR sc.scan_id LIKE '2338%'

  OR sc.scan_id LIKE '10297%' OR sc.scan_id LIKE '10303%');



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateDiscountedUsersLive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDiscountedUsersLive`(OUT totalActiveUsers INTEGER, OUT totalOutliers INTEGER)
BEGIN



DECLARE finished INTEGER DEFAULT 0;

DECLARE numberSayGood INTEGER;

DECLARE numberSayBad INTEGER;

DECLARE userAnswer INTEGER;

DECLARE percentageMajoritySayCorrect DOUBLE;

DECLARE numUserHasGottenCorrect INTEGER;

DECLARE totalSwipesForUser INTEGER;

DECLARE percentageUserHasCorrect DOUBLE;

DECLARE varUsername VARCHAR(50);

DECLARE numOfUserSwipesSoFar INTEGER;

DECLARE varScanId VARCHAR(100);

-- Constants

DECLARE MIN_ROWS_NEEDED INTEGER;

DECLARE MIN_CORRECT_ANSWERS DOUBLE;





 DECLARE users_cursor CURSOR FOR

 SELECT u.username FROM users u WHERE u.username IN (SELECT username FROM swipes s GROUP BY s.username HAVING COUNT(s.username) > 20);



 DECLARE scan_cursor CURSOR FOR

 SELECT scan_id FROM userconfidence;





DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;



OPEN users_cursor;



		 get_users_loop: LOOP



				 FETCH users_cursor INTO varUsername;

                  -- Set it to 0 for each user

				 SET numUserHasGottenCorrect = 0;

				 SET totalSwipesForUser = 0;



				 IF finished = 1 THEN

				   LEAVE get_users_loop;

				 END IF;



                 OPEN scan_cursor;



					 get_decided_scans_loop: LOOP



					 FETCH scan_cursor INTO varScanId;



                      IF finished = 1 THEN

						LEAVE get_decided_scans_loop;

                        SET finished = 0;

					  END IF;



                     SELECT answerGood FROM userconfidence WHERE scan_id = varScanId INTO numberSayGood;

					 SELECT answerBad FROM userconfidence WHERE scan_id = varScanId INTO numberSayBad;

                     SET percentageMajoritySayCorrect = calculatePercentage(numberSayGood, (numberSayGood + numberSayBad));

                     SELECT is_good_scan FROM swipes WHERE username = varUsername AND scan_id = varScanId INTO userAnswer;

                     SET totalSwipesForUser = totalSwipesForUser + 1;

                         IF (percentageMajoritySayCorrect >= 80 && userAnswer = 1)

							THEN

								SET numUserHasGottenCorrect = numUserHasGottenCorrect + 1;

						END IF;

                        IF (percentageMajoritySayCorrect < 40 && userAnswer = 0)

							THEN

								SET numUserHasGottenCorrect = numUserHasGottenCorrect + 1;

						END IF;



					END LOOP get_decided_scans_loop;

                    CLOSE scan_cursor;



					IF ((numUserHasGottenCorrect / totalSwipesForUser) * 100 < 70)

                    THEN

                    UPDATE `CM6211_1819_TEAM_5`.`users` SET discounted = 1 WHERE username = varUsername;

                    END IF;





		 END LOOP get_users_loop;



 CLOSE users_cursor; -- close the cursor



 SELECT COUNT(username) FROM users WHERE discounted = 1 INTO totalOutliers;

 SELECT COUNT(*) FROM users INTO totalActiveUsers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `userconfidence`
--

/*!50001 DROP VIEW IF EXISTS `userconfidence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userconfidence` AS select `sw`.`scan_id` AS `scan_id`,ifnull((select count(`swipes`.`scan_id`) from `swipes` where ((`swipes`.`is_good_scan` = 1) and (`swipes`.`scan_id` = `sw`.`scan_id`)) group by `swipes`.`scan_id`),0) AS `answerGood`,ifnull((select count(`swipes`.`scan_id`) from `swipes` where ((`swipes`.`is_good_scan` = 0) and (`swipes`.`scan_id` = `sw`.`scan_id`)) group by `swipes`.`scan_id`),0) AS `answerBad`,(select count(`swipes`.`scan_id`) from `swipes` where (`swipes`.`scan_id` = `sw`.`scan_id`) group by `swipes`.`scan_id`) AS `totalSwipes` from `swipes` `sw` group by `sw`.`scan_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-06  9:42:58

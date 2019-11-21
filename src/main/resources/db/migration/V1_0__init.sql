DROP SCHEMA IF EXISTS cm6211_1819_team_5;
CREATE SCHEMA cm6211_1819_team_5;
USE cm6211_1819_team_5;
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
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2a$10$2h7ZD0x.JlTruV2qu5UyQuXRYdKoyym6lWwR9qRj1UVgD/upNuCiO',1,'seed@admin.com',0,0,NULL,NULL),('Arron','$2a$10$iW/BvjbeFjM4Px798U9x.ODHylQpt2xeB/BIpvXyObPO5rwgKRyGC',1,'a@gmail.com',0,0,NULL,NULL),('bazza','$2a$10$gzkExf/YjPVmDWHSncyyFuJ4gCqe3u6SObVdB5sfV97nNxa0V3kWC',1,'baz@baz.com',0,0,NULL,NULL),('carl','$2a$10$W5yMhmPOMcKJbyd/j8oMROy3JTPuHiFsLvn9NfgaUZO9XhddR3yru',1,'carl@gmail.com',0,0,NULL,NULL),('dan','$2a$10$YO0VEcwj5BoOm0Ws/1M02uRc1vcZTClqiE/YsTcHSd5XwMNpRIDY.',1,'dnorth@gmail.com',0,1,NULL,NULL),('fleureast','$2a$10$1jAy4P.PQCzD1DuXUxHQhO0WTFATTkaBlDXvQ4vj.hKRCbRyq4pqe',1,'flear@east.com',0,0,NULL,NULL),('floiz','$2a$10$vGctvAmFmxvflvVXp52Ky.2.xglk1VUoyo0wo3iTZS52wvE5uU5ry',1,'floiz@gmail.com',0,0,NULL,NULL),('Holly','$2a$10$zxELD1hYpaJujyOcATrCMuzGB380Pbxo8NYg0LcJ2KdNJjtsbJ9QG',1,'hollys@gmail.com',0,0,NULL,NULL),('Hristo','$2a$10$rjsSvcXbvdeEkXZ8NkyonOtWOnv6OSxUEsaUEKPzNRFC2xreptWGG',1,'h@gmail.com',0,0,NULL,NULL),('ian','$2a$10$z0JxH7IHpFHXeh67F4wjNOAAjrUIPdHa6XwSgyTpQDNEv4K/YeG3e',1,'ian@gmail.com',0,0,NULL,NULL),('lauren','$2a$10$/36fjWZn7jFRcbfLg.Wqk.dnDaKKrvDqGoqgPiQYzs2DXF1XaByLC',1,'laurenheymer@gmail.com',0,0,NULL,NULL),('loz','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'loz@gmail.com',0,0,NULL,NULL),('LukeA','$2a$10$PJqRJPMn16DMJeSnx1ISru60mzwXjQuODhKP5YWmfx.GNOxcBOFYS',1,'l@gmail.com',0,0,NULL,NULL),('lulu','$2a$10$9gRS78dakVtoHuGBqM1lY.JySWqXkYpBP9hxriHG2RtecuRMfJLne',1,'lu@lu.com',0,0,NULL,NULL),('peter','$2a$10$4TcbWTw93UK4PNNin7xoMeP70T2TBxHGaGY6EP8u79kTeHPUnlCES',1,'pblack@gmail.com',0,0,NULL,NULL),('polly','$2a$10$XKsoGtCNSQ7QT3tCEE9Hl.Cohm4kYvnzPi/l6Jwwg0UlHdUNCbfDC',1,'polly@gmail.com',0,0,NULL,NULL),('wendy','$2a$10$ay3hldBXyeDg6ZlyZXefdOcGSdLM4GxrI4BJew5nIgosPDisUudLa',1,'wendy@gmail.com',0,0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,'admin','ROLE_ADMIN'),(10,'Arron','ROLE_USER'),(11,'bazza','ROLE_USER'),(13,'fleureast','ROLE_USER'),(5,'Holly','ROLE_USER'),(8,'Hristo','ROLE_USER'),(3,'lauren','ROLE_USER'),(1,'loz','ROLE_USER'),(9,'LukeA','ROLE_USER'),(12,'lulu','ROLE_USER'),(6,'peter','ROLE_USER'),(4,'polly','ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_data`
--

DROP TABLE IF EXISTS `batch_data`;

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
INSERT INTO `feedback` VALUES ('loz','2018-11-07',3,3,'',3),('loz','2018-11-06',3,3,'',3),('loz','2018-11-01',3,3,'',3),('loz','2018-11-13',3,3,'',3),('loz','2018-11-07',3,3,'',3),('loz','2018-11-16',3,3,'',3),('loz','2018-11-08',3,3,'',3),('loz','2018-11-13',4,4,'',1),('loz','2018-11-07',3,3,'',3),('loz','2018-11-20',3,3,'',3),('loz','2018-11-20',3,3,'',3),('loz','2018-11-15',3,3,'',3),('loz','2018-11-24',2,2,'',4);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
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
INSERT INTO `spring_session_attributes` VALUES ('1313cc98-2b43-4977-8984-c102b5021c7d','SPRING_SECURITY_CONTEXT','�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0�\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0�\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$d501df4e-b272-406b-b0c2-e0dce2796338psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0�\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0�\0\0xpw\0\0\0q\0~\0xpt\0admin');
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
INSERT INTO `swipes` VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_L_SLF_1.jpg','admin',1,'2018-12-06 00:00:00'),('10046A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10069A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10109A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10154A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10175A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10195A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10235A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10241A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10247A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10254A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10255A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10278A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10297A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10303A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10316A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10348A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10349A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10376A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10388A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10428A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10447A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('1044A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10500A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10514A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10527A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('1053A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10551A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10609A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10640A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10657A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10663A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('1072A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10760A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10786A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10817A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10855A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10879A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10901A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10956A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10959A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10989A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('10990A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11068A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11076A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11102A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11194A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11211A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11212A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11233A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11290A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11310A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11321A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11352A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',0,'2018-12-06 00:00:00'),('11362A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('113A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11453A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11485A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11521B_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11524A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11544A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11588A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11662A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11691A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11704A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11725A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11741A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11743A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11786A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',0,'2018-12-06 00:00:00'),('11800A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11802A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11809A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11811A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',0,'2018-12-06 00:00:00'),('11828A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11841A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11847A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11897A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11941A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11948A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('11965A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12020A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12075A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12128A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12150A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12161A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12193A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12210A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12241A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12252A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12262A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',0,'2018-12-06 00:00:00'),('12301A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12359A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12401A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12437A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12448A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12466A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12479A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12484A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12515A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12529A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',0,'2018-12-06 00:00:00'),('12543A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('1255A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12570A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('1261A_30DTI_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00'),('12654A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg','admin',1,'2018-12-06 00:00:00');
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
-- Table structure for table `user_equality`
--

DROP TABLE IF EXISTS `user_equality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_equality` (
  `username` varchar(50) NOT NULL,
  `gender` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `disability` tinyint(4) NOT NULL,
  `disability_explanation` varchar(200) DEFAULT NULL,
  `post_code_fh` varchar(10) DEFAULT NULL,
  `religion` varchar(40) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `user_equality_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_equality`
--

LOCK TABLES `user_equality` WRITE;
/*!40000 ALTER TABLE `user_equality` DISABLE KEYS */;
INSERT INTO `user_equality` VALUES ('ian',1,40,0,'','CF10 ','Atheist'),('dan',1,40,0,'','CF10 ','Buddhism'),('wendy',2,50,1,'dyslexia','NP20','Christianity'),('floiz',1,40,1,'deaf','NP11','Rastafarianism'),('admin',3,30,0,'','CF10','Nonreligious'),('lauren',1,20,0,'','CF10 3EX','African Traditional '),('polly',2,20,0,'','CF10 3EX','Atheist'),('Holly',2,20,0,'','CF10 ','Atheist'),('peter',1,80,0,'','CF10 3EX','African Traditional '),('Hristo',1,20,0,'','CF10 ','Atheist'),('LukeA',1,20,0,'','CF10 ','Atheist'),('Arron',1,20,0,'','CF10 3EX','Atheist');
/*!40000 ALTER TABLE `user_equality` ENABLE KEYS */;
UNLOCK TABLES;


 -- Stored procedure to fetch a new batch of images the user hasn't yet swiped on
DROP PROCEDURE IF EXISTS getNewBatchForUser;
DELIMITER //

-- Takes the user_id  as an input parameter
-- Returns a result set of scans the user hasn't swiped on yet weighted with bad images
CREATE PROCEDURE getNewBatchForUser(IN var_username VARCHAR(50))
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

END//

DELIMITER ;

-- View that holds all
DROP VIEW IF EXISTS userconfidence;
CREATE VIEW userconfidence AS
SELECT sw.scan_id,
ifnull((SELECT COUNT(scan_id) FROM swipes WHERE is_good_scan = 1 AND scan_id = sw.scan_id GROUP BY scan_id), 0) AS answerGood,
ifnull((SELECT COUNT(scan_id) FROM swipes WHERE is_good_scan = 0 AND scan_id = sw.scan_id GROUP BY scan_id), 0) AS answerBad,
(SELECT COUNT(scan_id) FROM swipes WHERE scan_id = sw.scan_id GROUP BY scan_id) AS totalSwipes
FROM swipes sw GROUP BY sw.scan_id;

DELIMITER ;

-- Procedure to populate table with all scans that the majority got wrong
DROP PROCEDURE IF EXISTS GetScanStatsTheMajorityGotWrong;

DELIMITER //
CREATE PROCEDURE GetScanStatsTheMajorityGotWrong()
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
END //

-- Updated procedure to identify and discount data from outliers as decided by crowd confidence
DELIMITER ;

DROP PROCEDURE IF EXISTS updateDiscountedUsersLive;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE updateDiscountedUsersLive(OUT totalActiveUsers INTEGER, OUT totalOutliers INTEGER)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE numberSayGood INTEGER;
DECLARE numberSayBad INTEGER;
DECLARE userAnswer INTEGER;
DECLARE percentageCorrect DOUBLE;
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
                     SELECT calculatePercentage(numberSayGood, (numberSayGood + numberSayBad)) INTO percentageCorrect;
                     SELECT is_good_scan FROM swipes WHERE username = varUsername AND scan_id = varScanId LIMIT 1 INTO userAnswer;

						 IF (percentageCorrect >= 80 && userAnswer = 0)
							THEN
								UPDATE `cm6211_1819_team_5`.`users` SET discounted = 1 WHERE username = varUsername;
						END IF;
                         IF (percentageCorrect < 80 && userAnswer = 1)
							THEN
								UPDATE `cm6211_1819_team_5`.`users` SET discounted = 1 WHERE username = varUsername;
						END IF;

					END LOOP get_decided_scans_loop;
                    CLOSE scan_cursor;

		 END LOOP get_users_loop;

 CLOSE users_cursor; -- close the cursor

 SELECT COUNT(username) FROM users WHERE discounted = 1 INTO totalOutliers;
 SELECT COUNT(*) FROM users INTO totalActiveUsers;
END ;;
DELIMITER ;


DROP FUNCTION IF EXISTS calculateNumberOfCorrectSwipes;
DELIMITER $$

CREATE FUNCTION calculateNumberOfCorrectSwipes(varUsername VARCHAR(50))
RETURNS INTEGER
BEGIN

RETURN (SELECT COUNT(*) FROM swipes s inner join scans sc on sc.scan_id=s.scan_id where sc.correct_answer = s.is_good_scan and s.username=varUsername);

END $$
DELIMITER ;

DROP FUNCTION IF EXISTS calculateNumberOfIncorrectSwipes;

DELIMITER $$

CREATE FUNCTION calculateNumberOfIncorrectSwipes(varUsername VARCHAR(50))
RETURNS INTEGER
BEGIN

RETURN (SELECT COUNT(*) FROM swipes s inner join scans sc on sc.scan_id=s.scan_id where sc.correct_answer != s.is_good_scan and s.username=varUsername);

END $$
DELIMITER ;


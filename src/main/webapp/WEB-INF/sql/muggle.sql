-- MySQL dump 10.13  Distrib 5.7.15, for osx10.11 (x86_64)
--
-- Host: localhost    Database: muggle
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `Advice`
--

DROP TABLE IF EXISTS `Advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Advice` (
  `id` char(16) NOT NULL,
  `user` char(16) NOT NULL,
  `content` text NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_advice_user` (`user`),
  CONSTRAINT `FK_advice_user` FOREIGN KEY (`user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advice`
--

LOCK TABLES `Advice` WRITE;
/*!40000 ALTER TABLE `Advice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer`
--

DROP TABLE IF EXISTS `Answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer` (
  `a_id` char(16) NOT NULL,
  `a_content` text NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer`
--

LOCK TABLES `Answer` WRITE;
/*!40000 ALTER TABLE `Answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Examination`
--

DROP TABLE IF EXISTS `Examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Examination` (
  `e_id` char(16) NOT NULL,
  `e_type` int(11) NOT NULL,
  `e_rank` int(11) NOT NULL,
  `e_path` char(16) NOT NULL,
  `e_keys` char(16) DEFAULT NULL,
  `e_radio` char(16) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `FK_exam_type` (`e_type`),
  KEY `FK_exam_rank` (`e_rank`),
  KEY `FK_exam_radio` (`e_radio`),
  KEY `FK_exam_path` (`e_path`),
  KEY `FK_exam_keys` (`e_keys`),
  CONSTRAINT `FK_exam_keys` FOREIGN KEY (`e_keys`) REFERENCES `KeyResource` (`kr_id`),
  CONSTRAINT `FK_exam_path` FOREIGN KEY (`e_path`) REFERENCES `ExaminationResource` (`er_id`),
  CONSTRAINT `FK_exam_radio` FOREIGN KEY (`e_radio`) REFERENCES `RadioResource` (`rr_id`),
  CONSTRAINT `FK_exam_rank` FOREIGN KEY (`e_rank`) REFERENCES `Rank` (`id`),
  CONSTRAINT `FK_exam_type` FOREIGN KEY (`e_type`) REFERENCES `Type` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Examination`
--

LOCK TABLES `Examination` WRITE;
/*!40000 ALTER TABLE `Examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `Examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExaminationCollection`
--

DROP TABLE IF EXISTS `ExaminationCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExaminationCollection` (
  `ec_id` char(16) NOT NULL,
  `ec_user` char(16) NOT NULL,
  `ec_exam` char(16) NOT NULL,
  `ec_date` date NOT NULL,
  `ec_status` bit(1) NOT NULL,
  PRIMARY KEY (`ec_id`),
  KEY `FK_ec_user` (`ec_user`),
  KEY `FK_ec_exam` (`ec_exam`),
  CONSTRAINT `FK_ec_exam` FOREIGN KEY (`ec_exam`) REFERENCES `Examination` (`e_id`),
  CONSTRAINT `FK_ec_user` FOREIGN KEY (`ec_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExaminationCollection`
--

LOCK TABLES `ExaminationCollection` WRITE;
/*!40000 ALTER TABLE `ExaminationCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExaminationCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExaminationDownload`
--

DROP TABLE IF EXISTS `ExaminationDownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExaminationDownload` (
  `ed_id` char(16) NOT NULL,
  `ed_user` char(16) NOT NULL,
  `ed_exam` char(16) NOT NULL,
  `ed_date` date NOT NULL,
  PRIMARY KEY (`ed_id`),
  KEY `FK_ed_user` (`ed_user`),
  KEY `FK_ed_exam` (`ed_exam`),
  CONSTRAINT `FK_ed_exam` FOREIGN KEY (`ed_exam`) REFERENCES `Examination` (`e_id`),
  CONSTRAINT `FK_ed_user` FOREIGN KEY (`ed_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExaminationDownload`
--

LOCK TABLES `ExaminationDownload` WRITE;
/*!40000 ALTER TABLE `ExaminationDownload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExaminationDownload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExaminationResource`
--

DROP TABLE IF EXISTS `ExaminationResource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExaminationResource` (
  `er_id` char(16) NOT NULL,
  `er_name` varchar(50) NOT NULL,
  `er_path` text,
  `er_volidate` char(16) DEFAULT NULL,
  PRIMARY KEY (`er_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExaminationResource`
--

LOCK TABLES `ExaminationResource` WRITE;
/*!40000 ALTER TABLE `ExaminationResource` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExaminationResource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExaminationStar`
--

DROP TABLE IF EXISTS `ExaminationStar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExaminationStar` (
  `es_id` char(16) NOT NULL,
  `es_user` char(16) NOT NULL,
  `es_exam` char(16) NOT NULL,
  `es_date` date NOT NULL,
  `es_value` double NOT NULL,
  PRIMARY KEY (`es_id`),
  KEY `FK_es_user` (`es_user`),
  KEY `FK_es_exam` (`es_exam`),
  CONSTRAINT `FK_es_exam` FOREIGN KEY (`es_exam`) REFERENCES `Examination` (`e_id`),
  CONSTRAINT `FK_es_user` FOREIGN KEY (`es_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExaminationStar`
--

LOCK TABLES `ExaminationStar` WRITE;
/*!40000 ALTER TABLE `ExaminationStar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExaminationStar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExaminationUpload`
--

DROP TABLE IF EXISTS `ExaminationUpload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExaminationUpload` (
  `id` char(16) NOT NULL,
  `exam` char(16) NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExaminationUpload`
--

LOCK TABLES `ExaminationUpload` WRITE;
/*!40000 ALTER TABLE `ExaminationUpload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExaminationUpload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExaminationVisit`
--

DROP TABLE IF EXISTS `ExaminationVisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExaminationVisit` (
  `ev_id` char(16) NOT NULL,
  `ev_user` char(16) NOT NULL,
  `ev_exam` char(16) NOT NULL,
  `ev_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`ev_id`),
  KEY `FK_ev_user` (`ev_user`),
  KEY `FK_ev_exam` (`ev_exam`),
  CONSTRAINT `FK_ev_exam` FOREIGN KEY (`ev_exam`) REFERENCES `Examination` (`e_id`),
  CONSTRAINT `FK_ev_user` FOREIGN KEY (`ev_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExaminationVisit`
--

LOCK TABLES `ExaminationVisit` WRITE;
/*!40000 ALTER TABLE `ExaminationVisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExaminationVisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KeyResource`
--

DROP TABLE IF EXISTS `KeyResource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KeyResource` (
  `kr_id` char(16) NOT NULL,
  `kr_name` varchar(50) NOT NULL,
  `kr_path` text,
  `kr_volidate` char(16) DEFAULT NULL,
  PRIMARY KEY (`kr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KeyResource`
--

LOCK TABLES `KeyResource` WRITE;
/*!40000 ALTER TABLE `KeyResource` DISABLE KEYS */;
/*!40000 ALTER TABLE `KeyResource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Place`
--

DROP TABLE IF EXISTS `Place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Place` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Place`
--

LOCK TABLES `Place` WRITE;
/*!40000 ALTER TABLE `Place` DISABLE KEYS */;
INSERT INTO `Place` VALUES (1,'北京'),(2,'天津'),(3,'上海'),(4,'重庆'),(5,'河北'),(6,'山西'),(7,'辽宁'),(8,'吉林'),(9,'黑龙江'),(10,'江苏'),(11,'浙江'),(12,'安徽'),(13,'福建'),(14,'江西'),(15,'山东'),(16,'河南'),(17,'湖北'),(18,'湖南'),(19,'广东'),(20,'海南'),(21,'四川'),(22,'贵州'),(23,'云南'),(24,'陕西'),(25,'甘肃'),(26,'青海'),(27,'台湾'),(28,'内蒙古'),(29,'广西'),(30,'西藏'),(31,'宁夏'),(32,'新疆'),(33,'香港'),(34,'澳门');
/*!40000 ALTER TABLE `Place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `q_id` char(16) NOT NULL,
  `q_type` int(11) NOT NULL,
  `q_rank` int(11) NOT NULL,
  `q_key` char(16) NOT NULL,
  `q_content` text NOT NULL,
  `q_tag` int(11) DEFAULT NULL,
  `q_exam` char(16) DEFAULT NULL,
  `q_number` varchar(10) DEFAULT NULL,
  `q_radio` char(16) DEFAULT NULL,
  PRIMARY KEY (`q_id`),
  KEY `FK_question_exam` (`q_exam`),
  KEY `FK_question_type` (`q_type`),
  KEY `FK_question_rank` (`q_rank`),
  KEY `FK_question_key` (`q_key`),
  KEY `FK_question_tag` (`q_tag`),
  KEY `FK_question_radio` (`q_radio`),
  CONSTRAINT `FK_question_exam` FOREIGN KEY (`q_exam`) REFERENCES `Examination` (`e_id`),
  CONSTRAINT `FK_question_key` FOREIGN KEY (`q_key`) REFERENCES `Answer` (`a_id`),
  CONSTRAINT `FK_question_radio` FOREIGN KEY (`q_radio`) REFERENCES `RadioResource` (`rr_id`),
  CONSTRAINT `FK_question_rank` FOREIGN KEY (`q_rank`) REFERENCES `Rank` (`id`),
  CONSTRAINT `FK_question_tag` FOREIGN KEY (`q_tag`) REFERENCES `Tag` (`tag_id`),
  CONSTRAINT `FK_question_type` FOREIGN KEY (`q_type`) REFERENCES `Type` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionCollection`
--

DROP TABLE IF EXISTS `QuestionCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionCollection` (
  `qc_id` char(16) NOT NULL,
  `qc_user` char(16) NOT NULL,
  `qc_question` char(16) NOT NULL,
  `qc_date` date NOT NULL,
  `qc_status` bit(1) NOT NULL,
  PRIMARY KEY (`qc_id`),
  KEY `FK_qc_user` (`qc_user`),
  KEY `FK_qc_question` (`qc_question`),
  CONSTRAINT `FK_qc_question` FOREIGN KEY (`qc_question`) REFERENCES `Question` (`q_id`),
  CONSTRAINT `FK_qc_user` FOREIGN KEY (`qc_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionCollection`
--

LOCK TABLES `QuestionCollection` WRITE;
/*!40000 ALTER TABLE `QuestionCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionStar`
--

DROP TABLE IF EXISTS `QuestionStar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionStar` (
  `qs_id` char(16) NOT NULL,
  `qs_user` char(16) NOT NULL,
  `qs_question` char(16) NOT NULL,
  `qs_date` date NOT NULL,
  `qs_value` double NOT NULL,
  PRIMARY KEY (`qs_id`),
  KEY `FK_qs_user` (`qs_user`),
  KEY `FK_qs_question` (`qs_question`),
  CONSTRAINT `FK_qs_question` FOREIGN KEY (`qs_question`) REFERENCES `Question` (`q_id`),
  CONSTRAINT `FK_qs_user` FOREIGN KEY (`qs_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionStar`
--

LOCK TABLES `QuestionStar` WRITE;
/*!40000 ALTER TABLE `QuestionStar` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionStar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionVisit`
--

DROP TABLE IF EXISTS `QuestionVisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionVisit` (
  `qv_id` char(16) NOT NULL,
  `qv_user` char(16) NOT NULL,
  `qv_question` char(16) NOT NULL,
  `qv_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`qv_id`),
  KEY `FK_qv_user` (`qv_user`),
  KEY `FK_qv_question` (`qv_question`),
  CONSTRAINT `FK_qv_question` FOREIGN KEY (`qv_question`) REFERENCES `Question` (`q_id`),
  CONSTRAINT `FK_qv_user` FOREIGN KEY (`qv_user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionVisit`
--

LOCK TABLES `QuestionVisit` WRITE;
/*!40000 ALTER TABLE `QuestionVisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionVisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RadioResource`
--

DROP TABLE IF EXISTS `RadioResource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RadioResource` (
  `rr_id` char(16) NOT NULL,
  `rr_name` varchar(50) NOT NULL,
  `rr_path` text,
  `rr_volidate` char(16) DEFAULT NULL,
  PRIMARY KEY (`rr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RadioResource`
--

LOCK TABLES `RadioResource` WRITE;
/*!40000 ALTER TABLE `RadioResource` DISABLE KEYS */;
/*!40000 ALTER TABLE `RadioResource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rank`
--

DROP TABLE IF EXISTS `Rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rank` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rank`
--

LOCK TABLES `Rank` WRITE;
/*!40000 ALTER TABLE `Rank` DISABLE KEYS */;
INSERT INTO `Rank` VALUES (1,'雅思'),(2,'托福'),(3,'专8'),(4,'CET6'),(5,'CET4'),(6,'CET3');
/*!40000 ALTER TABLE `Rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'基础训练'),(2,'提高训练'),(3,'挑战测试');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Type` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(50) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type`
--

LOCK TABLES `Type` WRITE;
/*!40000 ALTER TABLE `Type` DISABLE KEYS */;
INSERT INTO `Type` VALUES (1,'听力'),(2,'口语'),(3,'笔试'),(4,'综合');
/*!40000 ALTER TABLE `Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `u_id` char(16) NOT NULL,
  `u_telephone` char(11) NOT NULL,
  `u_admin` bit(1) NOT NULL DEFAULT b'0',
  `u_password` char(16) NOT NULL,
  `u_header` text,
  `u_nick_name` varchar(100) NOT NULL,
  `u_sex` bit(1) DEFAULT NULL,
  `u_age` int(11) DEFAULT NULL,
  `u_place` int(11) DEFAULT NULL,
  `u_sign` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_telephone` (`u_telephone`),
  KEY `FK_user_place` (`u_place`),
  CONSTRAINT `FK_user_place` FOREIGN KEY (`u_place`) REFERENCES `Place` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserStudyStatus`
--

DROP TABLE IF EXISTS `UserStudyStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserStudyStatus` (
  `id` char(16) NOT NULL,
  `user` char(16) NOT NULL,
  `rank` int(11) NOT NULL,
  `time` date NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_status_user` (`user`),
  KEY `FK_status_rank` (`rank`),
  CONSTRAINT `FK_status_rank` FOREIGN KEY (`rank`) REFERENCES `Rank` (`id`),
  CONSTRAINT `FK_status_user` FOREIGN KEY (`user`) REFERENCES `User` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserStudyStatus`
--

LOCK TABLES `UserStudyStatus` WRITE;
/*!40000 ALTER TABLE `UserStudyStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserStudyStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'muggle'
--
/*!50003 DROP PROCEDURE IF EXISTS `collect` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `collect`(
    in id char(16),
    in user char(16),
    in exam char(16),
    out resultCode int
  )
BEGIN
    insert into ExaminationCollection values(id,user,exam,curdate(),b'1');
    set resultCode = 1;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `download` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `download`(
    in id char(16),
    in user char(16),
    in exam char(16),
    out resultCode int
  )
BEGIN
    insert into ExaminationDownload values(id,user,exam,curdate());
    set resultCode = 1;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdviceId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdviceId`()
BEGIN
	select id from Advice order by id desc limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAnswer`(
    in id char(16)
  )
BEGIN
    select a_content from Answer join Question on Answer.a_id = Question.q_key where q_id = id;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCollectionId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCollectionId`()
BEGIN
    select ec_id from ExaminationCollection order by ec_id desc limit 1;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDownloadId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDownloadId`()
BEGIN
    select ed_id from ExaminationDownload order by ed_id desc limit 1;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamination`(
    in exam char(16)
  )
BEGIN
    select q_id,q_content,q_number,a_content,rr_path from Question left join Answer on Question.q_key = Answer.a_id
      left join RadioResource on Question.q_radio = RadioResource.rr_id where q_exam = exam;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMd5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMd5`(
    in exam char(16)
  )
BEGIN
    select e_id,er_volidate,kr_volidate,rr_volidate from Examination left join ExaminationResource on ExaminationResource.er_id = Examination.e_path
      left join KeyResource on Examination.e_keys = KeyResource.kr_id left join RadioResource on Examination.e_radio = RadioResource.rr_id
    where e_id = exam;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNews`()
BEGIN
    select distinct exam,er_name,time from ExaminationUpload join Examination on ExaminationUpload.exam = Examination.e_id
      join ExaminationResource on Examination.e_path = ExaminationResource.er_id order by time desc limit 3;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResource`(
    in exam char(16)
  )
BEGIN
    select e_id,er_path,er_volidate,kr_path,kr_volidate,rr_path,rr_volidate from Examination left join ExaminationResource on ExaminationResource.er_id = Examination.e_path
    left join KeyResource on Examination.e_keys = KeyResource.kr_id left join RadioResource on Examination.e_radio = RadioResource.rr_id
    where e_id = exam;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStarId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStarId`()
BEGIN
    select es_id from ExaminationStar order by es_id desc limit 1;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudyStatusId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudyStatusId`()
BEGIN
	select id from UserStudyStatus order by id desc limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserId`()
BEGIN
	select u_id from User order by u_id desc limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `giveAdvice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `giveAdvice`(
	in id char(16),
	in user char(16),
	in content text,
	out resultCode int
)
BEGIN
	insert into Advice values(id,user,content,curdate());
	set resultCode = 1;			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
	in telephone char(11),
	in password char(16),
	out resultCode int
)
BEGIN
	declare phone char(11);
	declare pwd char(16);
	declare counts int default 0;
	declare var int default 0;
	declare flag int default 0;
	declare cursor_user cursor for select u_telephone,u_password from User;
	open cursor_user;
	set counts = (select count(*) from User);
	while var < counts do
		fetch cursor_user into phone,pwd;
		if phone = telephone and pwd = password then
			set var = counts;
			set flag = 1;
		end if;
		set var = var + 1;
	end while;
	close cursor_user;

	if flag = 1 then
		select * from User where u_telephone = telephone;
		set resultCode = 1;
	else
		set resultCode = 0;
	end if;
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifyAge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyAge`(
	in id char(16),
	in age int,
	out resultCode int
)
BEGIN
	update User
		set u_age = age where u_id = id;
	set resultCode = 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifyHeader` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyHeader`(
	in id char(16),
	in header text,
	out resultCode int
)
BEGIN
	update User
		set u_header = header where u_id = id;
	set resultCode = 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifyNickName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyNickName`(
	in id char(16),
	in nick varchar(100),
	out resultCode int
)
BEGIN
	update User
		set u_nick_name = nick where u_id = id;
	set resultCode = 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifyPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyPassword`(
	in id char(16),
	in o_pwd char(16),
	in n_pwd char(16),
	out resultCode int
)
BEGIN
	declare p char(16);
	set p = (select u_password from User where u_id = id);
	if p is not null then
		if p = o_pwd then
			update User set u_password = n_pwd where u_id = id;
			set resultCode = 1;
		else
			set resultCode = -1;
		end if;
	else
		set resultCode = 0;
	end if;					
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifyPlace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyPlace`(
	in id char(16),
	in place int,
	out resultCode int
)
BEGIN
	update User
		set u_place = place where u_id = id;
	set resultCode = 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifySex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifySex`(
	in id char(16),
	in sex bit,
	out resultCode int
)
BEGIN
	update User
		set u_sex = sex where u_id = id;
	set resultCode = 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifySign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifySign`(
	in id char(16),
	in sign varchar(50),
	out resultCode int
)
BEGIN
	update User
		set u_sign = sign where u_id = id;
	set resultCode = 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(
	in id char(16),
	in telephone char(11),
	in password char(16),
	in nick varchar(100),
	out resultCode int
)
BEGIN
	declare phone char(11);
	declare counts int default 0;
	declare var int default 0;
	declare flag int default 0;
	declare cursor_telephone cursor for select u_telephone from User;
	open cursor_telephone;
	set counts = (select count(*) from User);
	if counts > 0 then
		while var < counts do
			fetch cursor_telephone into phone;
			if phone = telephone then
				set flag = 1;
				set resultCode = 0;
				set var = counts;
			end if;
			set var = var + 1;
		end while;
	end if;
	close cursor_telephone;

	if flag = 0 then
		insert into User values(id,telephone,b'0',password,null,nick,null,null,null,null);
		set resultCode = 1;
	end if;				
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchExamination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchExamination`(
	in keyword varchar(20),
	in type int,
	in rank int,
	in method int
)
BEGIN
	if method = 0 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id;
			end if;			 
		end if;
	end if;	
	if method = 1 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id
				order by er_name;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id
				order by er_name;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id
				order by er_name;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id
				order by er_name;
			end if;			 
		end if;
	end if;	
	if method = 2 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id
				order by er_name desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id
				order by er_name desc;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id
				order by er_name desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id
				order by er_name desc;
			end if;			 
		end if;
	end if;	
	if method = 3 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id
				order by count(ev_time) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id
				order by count(ev_time) desc;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id
				order by count(ev_time) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id
				order by count(ev_time) desc;
			end if;			 
		end if;
	end if;	
	if method = 4 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id
				order by avg(es_value) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id
				order by avg(es_value) desc;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id
				order by avg(es_value) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id
				order by avg(es_value) desc;
			end if;			 
		end if;
	end if;	
	if method = 5 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id
				order by count(ec_id) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id
				order by count(ec_id) desc;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id
				order by count(ec_id) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id
				order by count(ec_id) desc;
			end if;			 
		end if;
	end if;	
	if method = 6 then
		if type = -1 then
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%'))
				group by e_id
				order by (count(ec_id)*0.3+count(ev_time)*0.2+avg(es_value)*0.5) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank)
				group by e_id
				order by (count(ec_id)*0.3+count(ev_time)*0.2+avg(es_value)*0.5) desc;
			end if;
		else
			if rank = -1 then
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_type = type)
				group by e_id
				order by (count(ec_id)*0.3+count(ev_time)*0.2+avg(es_value)*0.5) desc;
			else			
			select e_id,count(ec_id),count(ev_time),avg(es_value),count(ed_id)
				from Examination left join ExaminationCollection on Examination.e_id = ExaminationCollection.ec_exam left join ExaminationVisit on ExaminationCollection.ec_exam = ExaminationVisit.ev_exam
				left join ExaminationStar on ExaminationCollection.ec_exam = ExaminationStar.es_exam left join ExaminationDownload on ExaminationCollection.ec_exam = ExaminationDownload.ed_exam
				where e_id in (select e_id from Examination join ExaminationResource on Examination.e_path = ExaminationResource.er_id where er_name like concat('%',keyword,'%') and e_rank = rank and e_type = type)
				group by e_id
				order by (count(ec_id)*0.3+count(ev_time)*0.2+avg(es_value)*0.5) desc;
			end if;			 
		end if;	
	end if;						
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchQuestion`(
	in keyword varchar(20),
	in type int,
	in rank int,
	in method int
)
BEGIN
	if method = 0 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id;
			else			
			 select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id;
			end if;			 
		end if;
	end if;	
	if method = 1 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id
				order by q_id;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id
				order by q_id;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id
				order by q_id;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id
				order by q_id;
			end if;			 
		end if;
	end if;	
	if method = 2 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id
				order by q_id desc;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id
				order by q_id desc;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id
				order by q_id desc;
			else			
			 select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id
				order by q_id desc;
			end if;			 
		end if;
	end if;	
	if method = 3 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id
				order by count(qv_time) desc;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id
				order by count(qv_time) desc;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id
				order by count(qv_time) desc;
			else			
			 select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id
				order by count(qv_time) desc;
			end if;			 
		end if;
	end if;	
	if method = 4 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id
				order by avg(qs_value) desc;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id
				order by avg(qs_value) desc;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id
				order by avg(qs_value) desc;
			else			
			 select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id
				order by avg(qs_value) desc;
			end if;			 
		end if;
	end if;	
	if method = 5 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id
				order by count(qc_id) desc;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id
				order by count(qc_id) desc;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id
				order by count(qc_id) desc;
			else			
			 select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id
				order by count(qc_id) desc;
			end if;			 
		end if;
	end if;	
	if method = 6 then
		if type = -1 then
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%'))
				group by q_id
				order by (count(qc_id)*0.3+count(qv_time)*0.2+avg(qs_value)*0.5) desc;
			else			
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank)
				group by q_id
				order by (count(qc_id)*0.3+count(qv_time)*0.2+avg(qs_value)*0.5) desc;
			end if;
		else
			if rank = -1 then
			select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_type = type)
				group by q_id
				order by (count(qc_id)*0.3+count(qv_time)*0.2+avg(qs_value)*0.5) desc;
			else			
			 select q_id,count(qc_id),count(qv_time),avg(qs_value) 
				from Question left join QuestionCollection on Question.q_id = QuestionCollection.qc_question left join QuestionVisit on QuestionCollection.qc_question = QuestionVisit.qv_question
				left join QuestionStar on QuestionCollection.qc_question = QuestionStar.qs_question
				where q_id in (select q_id from Question where q_content like concat('%',keyword,'%') and q_rank = rank and q_type = type)
				group by q_id
				order by (count(qc_id)*0.3+count(qv_time)*0.2+avg(qs_value)*0.5) desc;
			end if;			 
		end if;	
	end if;						
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setStudyStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setStudyStatus`(
	in id char(16),
	in user char(16),
	in rank int,
	out resultCode int
)
BEGIN
	insert into UserStudyStatus values(id,user,rank,curdate(),0);
	set resultCode = 1;					
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `star` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `star`(
    in id char(16),
    in user char(16),
    in exam char(16),
    in value double,
    out resultCode int
  )
BEGIN
    insert into ExaminationStar values(id,user,exam,curdate(),value);
    set resultCode = 1;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateStudyStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateStudyStatus`(
	in id char(16),
	in user char(16),
	in rank int,
	in rate double,
	out resultCode int
)
BEGIN
	insert into UserStudyStatus values(id,user,rank,curdate(),rate);
	set resultCode = 1;				
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-30 13:06:50

-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: aurora-ad.cumhj5e8im1y.us-west-2.rds.amazonaws.com    Database: adplatform
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `setting_affiliate_offer_payout`
--

DROP TABLE IF EXISTS `setting_affiliate_offer_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_affiliate_offer_payout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `payout_value` decimal(11,4) DEFAULT NULL COMMENT '设定单价',
  `daily_cap` int(11) DEFAULT NULL COMMENT '设定每日cap',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_offerId` (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道单价或cap调整设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_affiliate_offer_payout`
--

LOCK TABLES `setting_affiliate_offer_payout` WRITE;
/*!40000 ALTER TABLE `setting_affiliate_offer_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_affiliate_offer_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_affiliate_offer_payout_pecent`
--

DROP TABLE IF EXISTS `setting_affiliate_offer_payout_pecent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_affiliate_offer_payout_pecent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `pecent` decimal(11,4) DEFAULT NULL COMMENT '调价百分比，如1.2为1.2倍',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='渠道单价百分比调整设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_affiliate_offer_payout_pecent`
--

LOCK TABLES `setting_affiliate_offer_payout_pecent` WRITE;
/*!40000 ALTER TABLE `setting_affiliate_offer_payout_pecent` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_affiliate_offer_payout_pecent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_affiliate_source_payout`
--

DROP TABLE IF EXISTS `setting_affiliate_source_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_affiliate_source_payout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `daily_cap` int(11) DEFAULT NULL COMMENT '每日的cap设置',
  `operator_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_sourceId` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道单价或cap调整设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_affiliate_source_payout`
--

LOCK TABLES `setting_affiliate_source_payout` WRITE;
/*!40000 ALTER TABLE `setting_affiliate_source_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_affiliate_source_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_postback_adjust_rate`
--

DROP TABLE IF EXISTS `setting_postback_adjust_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_postback_adjust_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_sub` varchar(255) DEFAULT NULL COMMENT '子渠道',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `rate_weight` int(11) DEFAULT NULL COMMENT '优先级',
  `rate` decimal(11,4) DEFAULT NULL COMMENT '扣量概率。20表示20%',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='postback调量概率，优先级排序是 affiliate_id > offer_id > source_id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_postback_adjust_rate`
--

LOCK TABLES `setting_postback_adjust_rate` WRITE;
/*!40000 ALTER TABLE `setting_postback_adjust_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_postback_adjust_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_postbck_affiliate_adjust`
--

DROP TABLE IF EXISTS `setting_postbck_affiliate_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_postbck_affiliate_adjust` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='设置渠道调量基数，没有对应渠道号，则选取默认值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_postbck_affiliate_adjust`
--

LOCK TABLES `setting_postbck_affiliate_adjust` WRITE;
/*!40000 ALTER TABLE `setting_postbck_affiliate_adjust` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_postbck_affiliate_adjust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_whitelist_offer_affiliate`
--

DROP TABLE IF EXISTS `setting_whitelist_offer_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_whitelist_offer_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `operator_id` int(11) DEFAULT NULL COMMENT '后台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='开放offer给渠道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_whitelist_offer_affiliate`
--

LOCK TABLES `setting_whitelist_offer_affiliate` WRITE;
/*!40000 ALTER TABLE `setting_whitelist_offer_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_whitelist_offer_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_whitelist_source_affiliate`
--

DROP TABLE IF EXISTS `setting_whitelist_source_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_whitelist_source_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sourceId` (`source_id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COMMENT='开放某广告主全部offer给渠道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_whitelist_source_affiliate`
--

LOCK TABLES `setting_whitelist_source_affiliate` WRITE;
/*!40000 ALTER TABLE `setting_whitelist_source_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_whitelist_source_affiliate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-04  9:03:21

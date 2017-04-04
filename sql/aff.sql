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
-- Table structure for table `affiliate`
--

DROP TABLE IF EXISTS `affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','PENDING') NOT NULL DEFAULT 'ACTIVE',
  `postback_url` varchar(1023) DEFAULT '' COMMENT '回调渠道的url',
  `code` char(32) NOT NULL DEFAULT '' COMMENT 'api接入token设置，32位',
  `adjusted` enum('ENABLE','DISABLE') NOT NULL DEFAULT 'DISABLE' COMMENT '是否已开启扣量',
  `access_type` enum('FULL','AFF') NOT NULL DEFAULT 'AFF' COMMENT '接入类型－FULL：查看全信息，包含广告主维度；AFF：查看渠道offer信息，渠道接入都是AFF',
  `cr_limit` decimal(6,4) DEFAULT '0.0004' COMMENT '渠道cr监控最低阀值,低于这个阀值的offer一般都会列入该渠道的黑名单',
  `description` varchar(255) DEFAULT NULL COMMENT '一般描述信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate`
--

LOCK TABLES `affiliate` WRITE;
/*!40000 ALTER TABLE `affiliate` DISABLE KEYS */;
INSERT INTO `affiliate` VALUES (1,'chestnut',NULL,NULL,NULL,NULL,'ACTIVE','','','DISABLE','AFF',0.0004,NULL,'2017-03-31 09:50:38',NULL),(2,'default',NULL,NULL,NULL,NULL,'ACTIVE','','','DISABLE','AFF',0.0004,NULL,'2017-03-31 09:50:52',NULL);
/*!40000 ALTER TABLE `affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_setting`
--

DROP TABLE IF EXISTS `affiliate_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `conversion_cap_daily` int(11) DEFAULT NULL COMMENT '每日的转化cap',
  `account_cap_daily` decimal(11,2) DEFAULT NULL COMMENT '每日的金额cap',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_sourceId` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_setting`
--

LOCK TABLES `affiliate_setting` WRITE;
/*!40000 ALTER TABLE `affiliate_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_sync_setting`
--

DROP TABLE IF EXISTS `affiliate_sync_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_sync_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL COMMENT '渠道id',
  `operation` enum('AND','OR') NOT NULL DEFAULT 'AND' COMMENT '过滤条件类型',
  `regex_text` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道拉取offer的过滤规则，如筛选地区等',
  `operator_id` int(11) NOT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='渠道api接口拉取offer根据渠道特性主动设置过滤条件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_sync_setting`
--

LOCK TABLES `affiliate_sync_setting` WRITE;
/*!40000 ALTER TABLE `affiliate_sync_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_sync_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_affiliate_offer`
--

DROP TABLE IF EXISTS `blacklist_affiliate_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_affiliate_offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `tag` varchar(255) DEFAULT NULL COMMENT '记录标签，添加入黑名单的类型，如转化异常还是质量太差',
  `description` varchar(255) DEFAULT NULL COMMENT '详情描述',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3653 DEFAULT CHARSET=utf8mb4 COMMENT='渠道offer黑名单记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_affiliate_offer`
--

LOCK TABLES `blacklist_affiliate_offer` WRITE;
/*!40000 ALTER TABLE `blacklist_affiliate_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_affiliate_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_affiliate_source`
--

DROP TABLE IF EXISTS `blacklist_affiliate_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_affiliate_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `tag` varchar(255) DEFAULT NULL COMMENT '记录标签，添加入黑名单的类型，如转化异常还是质量太差',
  `desc` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_sourceId` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='渠道屏蔽广告主的黑名单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_affiliate_source`
--

LOCK TABLES `blacklist_affiliate_source` WRITE;
/*!40000 ALTER TABLE `blacklist_affiliate_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_affiliate_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_affiliate_sub_offer`
--

DROP TABLE IF EXISTS `blacklist_affiliate_sub_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_affiliate_sub_offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `affiliate_sub` varchar(255) DEFAULT NULL COMMENT '子渠道号',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `tag` varchar(255) DEFAULT NULL COMMENT '记录标签，添加入黑名单的类型，如转化异常还是质量太差',
  `description` varchar(255) DEFAULT NULL COMMENT '详情描述',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_affiliateSub` (`affiliate_sub`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子渠道offer黑名单记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_affiliate_sub_offer`
--

LOCK TABLES `blacklist_affiliate_sub_offer` WRITE;
/*!40000 ALTER TABLE `blacklist_affiliate_sub_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_affiliate_sub_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_affiliate`
--

DROP TABLE IF EXISTS `block_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_date` date DEFAULT NULL COMMENT '生效日期',
  `affiliate_id` int(11) NOT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sourceId` (`source_id`),
  KEY `idx_blockDate` (`block_date`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='渠道屏蔽广告主记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_affiliate`
--

LOCK TABLES `block_affiliate` WRITE;
/*!40000 ALTER TABLE `block_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_affiliate_offer`
--

DROP TABLE IF EXISTS `block_affiliate_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_affiliate_offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_date` date DEFAULT NULL COMMENT '生效日期',
  `affiliate_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_sourceId` (`source_id`),
  KEY `idx_blockDate` (`block_date`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_affiliate_offer`
--

LOCK TABLES `block_affiliate_offer` WRITE;
/*!40000 ALTER TABLE `block_affiliate_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_affiliate_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_source`
--

DROP TABLE IF EXISTS `block_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_date` date NOT NULL COMMENT '生效日期',
  `source_id` int(11) NOT NULL COMMENT '广告主id',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按日期对全渠道屏蔽广告主记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_source`
--

LOCK TABLES `block_source` WRITE;
/*!40000 ALTER TABLE `block_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_source` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-04  8:57:30

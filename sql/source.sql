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
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL COMMENT '名称',
  `addr` varchar(1023) DEFAULT NULL,
  `sign_name` varchar(63) NOT NULL DEFAULT '' COMMENT '标志名',
  `enable` enum('ENABLE','DISABLE') NOT NULL DEFAULT 'ENABLE' COMMENT '是否有效，无效则offer关闭',
  `whitelist_limited` enum('YES','NO') NOT NULL DEFAULT 'NO' COMMENT '是否开启白名单保护',
  `weightiness` int(11) DEFAULT NULL COMMENT '权重',
  `description` varchar(1023) DEFAULT NULL,
  `traffic_status` enum('PRIVATE','PUBLIC') DEFAULT 'PUBLIC' COMMENT '是否屏蔽referrer',
  `sync_url` varchar(2047) DEFAULT NULL COMMENT '同步api url',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='广告主信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES (1,'GOMO',NULL,'wecloud','ENABLE','YES',1,NULL,'PUBLIC','http://advapi.wecloud.io/api/v1/extOffer?prodKey=CAEET0GM53FQ5OCB3NXZVZP7&accessKey=HWXFOASXKSV82IRH264D58SNWXYEWJPM&advposId=1339','2017-03-31 02:07:33',NULL),(23,'Chestnut Tech','Guangzhou','chestnut','ENABLE','YES',6,NULL,'PUBLIC','http://api.ichestnut.net/v1/apps/get?code=uyhbhsxejoi6popnhfxar2t8gz3oikjy','2017-02-21 08:15:01',NULL);
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_setting`
--

DROP TABLE IF EXISTS `source_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL COMMENT '广告主id',
  `account_cap_daily` decimal(11,4) DEFAULT NULL COMMENT '每日金额cap',
  `conversion_cap_daily` int(11) DEFAULT NULL COMMENT '每日转化数cap',
  `operator_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='广告主设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_setting`
--

LOCK TABLES `source_setting` WRITE;
/*!40000 ALTER TABLE `source_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist_s2s`
--

DROP TABLE IF EXISTS `whitelist_s2s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist_s2s` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL COMMENT '源（广告主ID）',
  `ip_start` varchar(15) DEFAULT NULL COMMENT '起始IP',
  `ip_end` varchar(15) DEFAULT NULL COMMENT '结束IP',
  `ip_start_num` bigint(20) DEFAULT NULL COMMENT '起始ip移位运算数',
  `ip_end_num` bigint(20) DEFAULT NULL COMMENT '结束ip移位运算数',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='广告主回调ip白名单过滤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist_s2s`
--

LOCK TABLES `whitelist_s2s` WRITE;
/*!40000 ALTER TABLE `whitelist_s2s` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist_s2s` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-04  9:03:53

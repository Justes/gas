-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gas
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `w_admin_menu`
--

DROP TABLE IF EXISTS `w_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_menu`
--

LOCK TABLES `w_admin_menu` WRITE;
/*!40000 ALTER TABLE `w_admin_menu` DISABLE KEYS */;
INSERT INTO `w_admin_menu` VALUES (1,0,1,'首页','fa-dashboard','/',NULL,NULL,'2020-12-02 23:18:51'),(2,0,3,'Admin','fa-tasks','',NULL,NULL,'2020-12-02 23:20:04'),(3,2,4,'Users','fa-gear','auth/users',NULL,NULL,'2020-12-03 18:49:09'),(4,2,5,'Roles','fa-user','auth/roles',NULL,NULL,'2020-12-02 23:20:04'),(5,2,6,'Permission','fa-ban','auth/permissions',NULL,NULL,'2020-12-02 23:20:04'),(6,2,7,'Menu','fa-bars','auth/menu',NULL,NULL,'2020-12-02 23:20:04'),(7,2,8,'Operation log','fa-history','auth/logs',NULL,NULL,'2020-12-02 23:20:04'),(8,0,10,'燃气公司','fa-building','companies',NULL,'2020-12-02 22:50:37','2020-12-03 18:54:04'),(9,0,2,'系统公告','fa-bell','notices',NULL,'2020-12-02 23:19:58','2020-12-15 02:46:21'),(10,0,9,'基础信息','fa-align-justify',NULL,NULL,'2020-12-02 23:21:17','2020-12-03 18:53:04'),(11,0,11,'燃气站场','fa-institution','stations',NULL,'2020-12-03 18:51:54','2020-12-04 08:30:23'),(12,0,13,'工作人员','fa-users','workers',NULL,'2020-12-03 18:52:16','2020-12-05 02:32:47'),(13,0,27,'账号管理','fa-user-plus','admin-users',NULL,'2020-12-04 07:21:01','2020-12-11 02:57:20'),(14,0,12,'设备管理','fa-cubes','devices',NULL,'2020-12-05 02:20:56','2020-12-05 02:32:47'),(15,0,14,'区域管理','fa-globe','zones',NULL,'2020-12-05 06:59:48','2020-12-05 06:59:53'),(16,0,21,'公告通知','fa-bullhorn','articles',NULL,'2020-12-05 09:04:11','2020-12-11 02:57:20'),(17,0,22,'类型管理','fa-align-right','categories',NULL,'2020-12-05 09:15:09','2020-12-11 02:57:20'),(18,0,23,'安全教育','fa-shield','article-secs',NULL,'2020-12-07 02:49:47','2020-12-11 02:57:20'),(19,0,24,'政策法规','fa-list-alt','article-govs',NULL,'2020-12-07 02:50:34','2020-12-11 02:57:20'),(20,0,25,'文件下载','fa-files-o','attachments',NULL,'2020-12-07 06:59:27','2020-12-11 02:57:20'),(21,0,26,'存储空间','fa-stack-overflow','stores',NULL,'2020-12-07 08:53:56','2020-12-11 02:57:20'),(22,0,19,'事件管理','fa-calendar','events',NULL,'2020-12-08 03:25:23','2020-12-11 02:57:20'),(23,0,20,'事件时限','fa-clock-o','event-types',NULL,'2020-12-08 06:28:19','2020-12-11 02:57:20'),(24,0,15,'事件统计','fa-area-chart','event-stats',NULL,'2020-12-08 07:53:07','2020-12-08 07:53:53'),(25,0,18,'瓶装液化气补贴标准','fa-flask','bottle-stds',NULL,'2020-12-09 09:33:49','2020-12-11 02:57:20'),(26,0,16,'企业用气量','fa-hourglass-1','gas-stats',NULL,'2020-12-09 10:15:37','2020-12-09 10:15:44'),(27,0,17,'用气量监控','fa-line-chart','gas-used-details',NULL,'2020-12-11 02:44:28','2020-12-11 02:58:19'),(28,0,28,'组织管理','fa-list-ul','organs',NULL,'2020-12-17 07:09:05','2020-12-17 07:09:21');
/*!40000 ALTER TABLE `w_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_operation_log`
--

DROP TABLE IF EXISTS `w_admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_operation_log`
--

LOCK TABLES `w_admin_operation_log` WRITE;
/*!40000 ALTER TABLE `w_admin_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_permissions`
--

DROP TABLE IF EXISTS `w_admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `w_admin_permissions_name_unique` (`name`),
  UNIQUE KEY `w_admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_permissions`
--

LOCK TABLES `w_admin_permissions` WRITE;
/*!40000 ALTER TABLE `w_admin_permissions` DISABLE KEYS */;
INSERT INTO `w_admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);
/*!40000 ALTER TABLE `w_admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_role_menu`
--

DROP TABLE IF EXISTS `w_admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `w_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_role_menu`
--

LOCK TABLES `w_admin_role_menu` WRITE;
/*!40000 ALTER TABLE `w_admin_role_menu` DISABLE KEYS */;
INSERT INTO `w_admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `w_admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_role_permissions`
--

DROP TABLE IF EXISTS `w_admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `w_admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_role_permissions`
--

LOCK TABLES `w_admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `w_admin_role_permissions` DISABLE KEYS */;
INSERT INTO `w_admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `w_admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_role_users`
--

DROP TABLE IF EXISTS `w_admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `w_admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_role_users`
--

LOCK TABLES `w_admin_role_users` WRITE;
/*!40000 ALTER TABLE `w_admin_role_users` DISABLE KEYS */;
INSERT INTO `w_admin_role_users` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `w_admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_roles`
--

DROP TABLE IF EXISTS `w_admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `w_admin_roles_name_unique` (`name`),
  UNIQUE KEY `w_admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_roles`
--

LOCK TABLES `w_admin_roles` WRITE;
/*!40000 ALTER TABLE `w_admin_roles` DISABLE KEYS */;
INSERT INTO `w_admin_roles` VALUES (1,'管理员','administrator','2020-12-02 20:04:42','2020-12-03 19:19:54'),(2,'配送员','deliver','2020-12-05 02:38:37','2020-12-05 02:38:37');
/*!40000 ALTER TABLE `w_admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_user_permissions`
--

DROP TABLE IF EXISTS `w_admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `w_admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_user_permissions`
--

LOCK TABLES `w_admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `w_admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_admin_users`
--

DROP TABLE IF EXISTS `w_admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'token',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '连接id',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `station_id` int(11) DEFAULT '0' COMMENT '站点id',
  `gender` tinyint(4) DEFAULT '1' COMMENT '性别 0女 1男',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `mobile` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机',
  `job_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '工作内容',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `organ_id` int(11) DEFAULT '0' COMMENT '组织id',
  `organ_id2` int(11) DEFAULT '0' COMMENT '组织id2',
  `organ_id3` int(11) DEFAULT '0' COMMENT '组织id3',
  `status` tinyint(4) DEFAULT '0' COMMENT '0正常, 1禁用',
  `type` tinyint(4) DEFAULT '0' COMMENT '0管理员, 1工作人员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `w_admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_admin_users`
--

LOCK TABLES `w_admin_users` WRITE;
/*!40000 ALTER TABLE `w_admin_users` DISABLE KEYS */;
INSERT INTO `w_admin_users` VALUES (1,'admin','$2y$10$h0KFkexuKOW7PJ.xdeerG.wdKM0AF7P6cAJ.FH3.LFZ5A4i8GkFCW','Admin',NULL,'e00cf25ad42683b3df678c61f42c6bda','02a9da8e-2477-4ad3-8a46-4c5b00b85240','34rHuV4Zv7pCtjCJg9VGzjjRWK0eXyc0Ay6gdlU6VeiG4KESJsQlRNTW3an2','2020-12-02 20:04:42','2020-12-17 09:42:10',1,1,0,'13211111111','配送',NULL,1,5,13,0,0),(2,'sanpang','$2y$10$7tkvHGoBAjgitsI366CjzeYplP10QVVB9GQhGQJfVBCdDp1U/GKPm','三胖',NULL,'78b5057f77df4493a4c71df016983367','582734b1-533b-441d-8bc1-08f57188ba71',NULL,'2020-12-05 02:40:31','2020-12-16 07:36:57',2,1,30,'13211111111','配送',NULL,0,0,0,0,1);
/*!40000 ALTER TABLE `w_admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_articles`
--

DROP TABLE IF EXISTS `w_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `article_type` tinyint(4) DEFAULT '0' COMMENT '0公告 1安全 2政策',
  `cate_id` tinyint(4) DEFAULT '0' COMMENT '文章类型',
  `content` text COMMENT '内容',
  `effect_type` tinyint(4) DEFAULT '0' COMMENT '有效 0 永久, 1限时',
  `effect_status` tinyint(4) DEFAULT '0' COMMENT '有效状态 0正常 1已过期',
  `effect_days` int(11) DEFAULT '0' COMMENT '有效天数',
  `send_type` tinyint(4) DEFAULT '0' COMMENT '发送 0立即, 1定时',
  `send_time` varchar(32) DEFAULT NULL COMMENT '发送时间',
  `receive_type` tinyint(4) DEFAULT '0' COMMENT '接收 0全部 1指定人',
  `receive_user_ids` varchar(1000) DEFAULT NULL COMMENT '接收人id',
  `post_user_id` int(11) DEFAULT '0' COMMENT '发布人id',
  `post_status` tinyint(4) DEFAULT '0' COMMENT '发布状态 0已发布 1草稿',
  `attaches` varchar(255) DEFAULT NULL COMMENT '附件',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_articles`
--

LOCK TABLES `w_articles` WRITE;
/*!40000 ALTER TABLE `w_articles` DISABLE KEYS */;
INSERT INTO `w_articles` VALUES (1,'公告',0,2,'<p>这是一个公告</p>',1,0,100,0,'2020-12-23 21:59:59',1,'1,2',1,0,NULL,'2020-12-05 17:28:44','2020-12-07 11:25:57'),(2,'公告2',0,1,'<p>公告公告</p>\r\n\r\n<p>公告公告</p>\r\n\r\n<p>公告公告</p>',0,0,0,1,'2020-12-30 23:00:00',0,'',1,1,NULL,'2020-12-07 11:20:12','2020-12-07 11:20:12'),(3,'公告3',0,3,'<p>公告3</p>\r\n\r\n<p>公告3</p>\r\n\r\n<p>公告3</p>',0,0,0,1,'2020-12-30 23:59:00',0,'',1,1,NULL,'2020-12-07 11:25:33','2020-12-07 11:25:33'),(4,'公告告',0,4,'<p>公告告公告告</p>',0,0,1000,0,'2020-12-16 00:00:00',0,'',1,0,'files/home_icon_g806_d@3x.png','2020-12-07 11:26:22','2020-12-15 14:43:43'),(5,'公告',0,1,'<p>送到的</p>',0,0,0,0,'2020-12-30 23:59:00',0,'',1,0,'files/ckeditor_4.15.1_standard.zip','2020-12-07 11:27:58','2020-12-07 15:46:18'),(6,'111',0,1,'<p>111</p>',0,0,0,0,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:16:36','2020-12-15 15:16:36'),(7,'222',0,1,'<p>222</p>',0,0,0,0,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:16:42','2020-12-15 15:16:42'),(8,'333',0,1,'<p>333</p>',0,0,0,0,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:16:47','2020-12-15 15:16:47'),(9,'444',0,1,'<p>444</p>',1,1,1,0,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:16:58','2020-12-17 14:10:20'),(10,'555',0,1,'<p>555</p>',0,0,0,0,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:17:10','2020-12-15 15:17:10'),(11,'666',0,1,'<p>666</p>',1,1,1,1,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:18:58','2020-12-17 14:13:25'),(12,'777',0,1,'<p>777</p>',0,0,0,1,'2020-12-17 00:00:00',0,'',1,1,NULL,'2020-12-15 15:19:12','2020-12-15 15:19:12'),(13,'888',0,1,'<p>888</p>',0,0,0,0,'2020-12-15 15:19:36',0,'',1,0,NULL,'2020-12-15 15:19:36','2020-12-15 15:19:36'),(14,'14',0,1,'<p>144</p>',0,0,0,0,'2020-12-15 15:31:22',0,'',1,0,NULL,'2020-12-15 15:31:22','2020-12-15 15:31:22'),(15,'999',2,1,'<p>999</p>',0,0,0,0,'2020-12-15 15:31:32',0,'',1,0,NULL,'2020-12-15 15:31:32','2020-12-15 15:31:32');
/*!40000 ALTER TABLE `w_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_attachments`
--

DROP TABLE IF EXISTS `w_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT '0' COMMENT '文章id',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_attachments`
--

LOCK TABLES `w_attachments` WRITE;
/*!40000 ALTER TABLE `w_attachments` DISABLE KEYS */;
INSERT INTO `w_attachments` VALUES (6,5,'files/9aa5e254fc0d5fb23228a268c05a7dcb.png','2020-12-07 15:48:32','2020-12-07 15:48:32'),(7,5,'files/equipment_icon_d3@3x (1).png','2020-12-07 15:49:33','2020-12-07 15:49:33'),(9,4,'files/equipment_icon_g806@3x.png','2020-12-07 15:58:43','2020-12-07 15:58:43'),(10,4,'files/equipment_icon_uwat@3x.png','2020-12-07 15:58:43','2020-12-07 15:58:43'),(11,2,'files/x.zip','2020-12-07 16:00:25','2020-12-07 16:00:25'),(12,2,'files/home_slices.zip','2020-12-07 16:00:25','2020-12-07 16:00:25');
/*!40000 ALTER TABLE `w_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_categories`
--

DROP TABLE IF EXISTS `w_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(255) DEFAULT NULL COMMENT '类型名',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='文章类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_categories`
--

LOCK TABLES `w_categories` WRITE;
/*!40000 ALTER TABLE `w_categories` DISABLE KEYS */;
INSERT INTO `w_categories` VALUES (1,'通知','2020-12-05 17:16:08','2020-12-05 17:16:08'),(2,'公告','2020-12-05 17:16:49','2020-12-05 17:16:49'),(3,'法规','2020-12-05 17:16:54','2020-12-05 17:16:54'),(4,'消防','2020-12-05 17:16:59','2020-12-05 17:16:59');
/*!40000 ALTER TABLE `w_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_companies`
--

DROP TABLE IF EXISTS `w_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT '' COMMENT '公司名',
  `addr` varchar(255) DEFAULT '' COMMENT '地址',
  `lng` varchar(255) DEFAULT '' COMMENT '经度',
  `lat` varchar(255) DEFAULT '' COMMENT '纬度',
  `contact_user` varchar(255) DEFAULT '' COMMENT '联系人',
  `contact_user_mobile` varchar(255) DEFAULT '' COMMENT '联系人手机',
  `contact_user_tel` varchar(255) DEFAULT '' COMMENT '联系人电话',
  `permit` tinyint(4) DEFAULT '1' COMMENT '营业执照',
  `permit_pic` varchar(255) DEFAULT NULL COMMENT '营业执照图片',
  `website` varchar(255) DEFAULT '' COMMENT '网站',
  `legal_name` varchar(255) DEFAULT '' COMMENT '法人',
  `legal_mobile` varchar(255) DEFAULT '' COMMENT '法人手机',
  `legal_idnum` varchar(255) DEFAULT '' COMMENT '法人身份证',
  `secure_name` varchar(255) DEFAULT '' COMMENT '安全责任人',
  `secure_mobile` varchar(255) DEFAULT '' COMMENT '安全责任人手机',
  `secure_idnum` varchar(255) DEFAULT '' COMMENT '安全责任人身份证',
  `ck_status` tinyint(4) DEFAULT '0' COMMENT '审核状态0未审核 1已审核',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='燃气公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_companies`
--

LOCK TABLES `w_companies` WRITE;
/*!40000 ALTER TABLE `w_companies` DISABLE KEYS */;
INSERT INTO `w_companies` VALUES (1,'公司1','深圳市福田区','114.011732','22.578207','1','1',NULL,1,NULL,NULL,'2','2','2','3','3','3',0,'2020-12-03 09:48:13','2020-12-04 17:03:44'),(2,'公司2','深圳市福田区润田路13','114.022003','22.554098','2','2',NULL,1,'images/e550ed098e98994c2592a23980040682.png',NULL,'2','2','2','2','2','2',0,'2020-12-03 10:07:06','2020-12-04 18:13:46');
/*!40000 ALTER TABLE `w_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_devices`
--

DROP TABLE IF EXISTS `w_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) DEFAULT '0' COMMENT '站点id',
  `device_no` varchar(255) DEFAULT '' COMMENT '设备编号',
  `device_name` varchar(255) DEFAULT '' COMMENT '设备名',
  `device_type` varchar(255) DEFAULT '' COMMENT '设备型号',
  `admin_user_id` int(11) DEFAULT '0' COMMENT '负责人id',
  `device_status` tinyint(4) DEFAULT '0' COMMENT '0正常, 1维修中, 2已报废',
  `device_pic` varchar(255) DEFAULT '' COMMENT '设备图片',
  `fix_logs` text COMMENT '维修记录',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='设备';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_devices`
--

LOCK TABLES `w_devices` WRITE;
/*!40000 ALTER TABLE `w_devices` DISABLE KEYS */;
INSERT INTO `w_devices` VALUES (1,2,'11','11','GAS',2,1,'',NULL,'2020-12-05 10:33:48','2020-12-05 14:29:38'),(2,2,'22','22','22',2,0,'',NULL,'2020-12-05 14:29:47','2020-12-05 14:29:47');
/*!40000 ALTER TABLE `w_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_event_types`
--

DROP TABLE IF EXISTS `w_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_event_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etype_name` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名',
  `deal_time` char(12) DEFAULT '' COMMENT '处理时间 (时:分)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='事件类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_event_types`
--

LOCK TABLES `w_event_types` WRITE;
/*!40000 ALTER TABLE `w_event_types` DISABLE KEYS */;
INSERT INTO `w_event_types` VALUES (1,'非常紧急','00:59',NULL,'2020-12-08 14:45:13'),(2,'紧急','22:00',NULL,'2020-12-08 14:35:39'),(3,'一般','00:00',NULL,'2020-12-08 14:35:53'),(4,'不紧急','00:00',NULL,'2020-12-08 15:42:01');
/*!40000 ALTER TABLE `w_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_events`
--

DROP TABLE IF EXISTS `w_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL DEFAULT '' COMMENT '事件名',
  `event_type_id` tinyint(4) DEFAULT '0' COMMENT '事件类型',
  `station_id` int(11) DEFAULT '0' COMMENT '站点id',
  `admin_user_id` int(11) DEFAULT '0' COMMENT '人员分配id',
  `event_status` tinyint(4) DEFAULT '0' COMMENT '0未解决, 1已解决',
  `deal_content` varchar(1000) DEFAULT '' COMMENT '处理过程',
  `solved_time` varchar(32) DEFAULT NULL COMMENT '解决时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `solved_minutes` varchar(32) DEFAULT NULL COMMENT '解决时长(分钟)',
  `created_year` varchar(32) DEFAULT NULL COMMENT '创建年份',
  `created_month` varchar(32) DEFAULT NULL COMMENT '创建月份',
  `solved_at` datetime DEFAULT NULL COMMENT '解决时间',
  `created_day` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='事件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_events`
--

LOCK TABLES `w_events` WRITE;
/*!40000 ALTER TABLE `w_events` DISABLE KEYS */;
INSERT INTO `w_events` VALUES (1,'紧急',2,2,2,0,NULL,NULL,'2020-12-08 14:13:11','2020-12-08 14:13:11',NULL,'2020','12',NULL,'2020-12-01','2020-12-08 14:13:11'),(2,'十万火急',1,2,2,0,NULL,NULL,'2020-12-08 16:13:10','2020-12-08 16:44:37',NULL,'2020','12',NULL,'2020-12-02','2020-12-08 16:44:37'),(3,'一般般',3,2,2,1,'1. xxx\r\n2. xxx\r\n3. xxx','1607481671','2020-12-08 16:20:40','2020-12-09 10:41:11','1100','2020','12',NULL,'2020-12-03','2020-12-09 10:41:11'),(4,'不紧急',4,1,2,1,NULL,'1607496591','2020-12-08 17:07:43','2020-12-09 14:49:51','1302','2020','12','2020-12-09 14:49:51','2020-12-04','2020-12-08 17:07:43'),(5,'急急急',1,2,2,1,NULL,'1607496585','2020-12-08 17:07:54','2020-12-09 14:49:45','1301','2020','12','2020-12-09 14:49:45','2020-12-08','2020-12-08 17:07:54'),(6,'急急急',1,3,2,1,NULL,'1607496579','2020-12-09 11:14:01','2020-12-09 14:49:39','215','2020','12','2020-12-09 14:49:39','2020-12-08','2020-12-09 11:14:01'),(7,'紧急',2,3,2,1,NULL,'1607494427','2020-12-09 11:31:37','2020-12-09 14:13:47','162','2020','12','2020-12-09 14:13:47','2020-12-09','2020-12-09 11:31:28');
/*!40000 ALTER TABLE `w_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_gas_stats`
--

DROP TABLE IF EXISTS `w_gas_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_gas_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `used_year` char(12) DEFAULT '' COMMENT '使用年份',
  `company_id` int(11) DEFAULT '0' COMMENT '公司id',
  `used_gas` int(11) DEFAULT '0' COMMENT '用气量(L)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用气量统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_gas_stats`
--

LOCK TABLES `w_gas_stats` WRITE;
/*!40000 ALTER TABLE `w_gas_stats` DISABLE KEYS */;
INSERT INTO `w_gas_stats` VALUES (1,'2020',1,1000,'2020-12-09 18:28:17','2020-12-09 18:28:17'),(2,'2020',2,2020,'2020-12-09 18:28:27','2020-12-09 18:28:27');
/*!40000 ALTER TABLE `w_gas_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_gas_used_details`
--

DROP TABLE IF EXISTS `w_gas_used_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_gas_used_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT '0' COMMENT '所属公司id',
  `data_pic` varchar(255) DEFAULT '' COMMENT '数据图片',
  `report_user_name` varchar(32) DEFAULT '' COMMENT '上报人',
  `report_time` varchar(32) DEFAULT '' COMMENT '上报时间',
  `used_gas` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用气量',
  `created_year` varchar(32) DEFAULT NULL COMMENT '创建年份',
  `created_month` varchar(32) DEFAULT NULL COMMENT '创建月份',
  `created_day` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `created_date` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='用气量明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_gas_used_details`
--

LOCK TABLES `w_gas_used_details` WRITE;
/*!40000 ALTER TABLE `w_gas_used_details` DISABLE KEYS */;
INSERT INTO `w_gas_used_details` VALUES (1,1,'images/ce8507e126abc2018e76ce0ad9991986.png','三胖','2020-11-01 11:00:00',101.00,'2020','11','2020-11-01','2020-11-01 12:00:00','2020-12-11 11:07:54','2020-11-01 12:00:00','2020-12-11 11:09:03'),(2,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-11-02 11:00:00',22.00,'2020','11','2020-11-02','2020-11-02 11:00:00','2020-12-11 11:19:33','2020-11-02 11:00:00','2020-12-11 11:20:21'),(3,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-11-03 11:00:00',333.00,'2020','11','2020-11-03','2020-11-03 11:00:00','2020-12-11 11:19:33','2020-11-03 11:00:00','2020-12-11 11:20:21'),(4,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-11-04 11:00:00',444.00,'2020','11','2020-11-04','2020-11-04 11:00:00','2020-12-11 11:19:33','2020-11-04 11:00:00','2020-12-11 11:20:21'),(5,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-11-05 11:00:00',555.00,'2020','11','2020-11-05','2020-11-05 11:00:00','2020-12-11 11:19:33','2020-11-05 11:00:00','2020-12-11 11:20:21'),(6,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-11-06 11:00:00',66.00,'2020','11','2020-11-06','2020-11-06 11:00:00','2020-12-11 11:19:33','2020-11-06 11:00:00','2020-12-11 11:20:21'),(7,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-12-01 11:00:00',66.00,'2020','12','2020-12-01','2020-12-01 11:00:00','2020-12-01 11:19:33','2020-12-01 11:00:00','2020-12-01 11:20:21'),(8,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-12-02 11:00:00',666.00,'2020','12','2020-12-02','2020-12-02 11:00:00','2020-12-02 11:19:33','2020-12-02 11:00:00','2020-12-01 11:20:21'),(9,1,'images/901a9096d6762d03cf9a7edb0f71558a.png','三胖','2020-12-03 11:00:00',366.00,'2020','12','2020-12-03','2020-12-03 11:00:00','2020-12-03 11:19:33','2020-12-03 11:00:00','2020-12-01 11:20:21');
/*!40000 ALTER TABLE `w_gas_used_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_migrations`
--

DROP TABLE IF EXISTS `w_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_migrations`
--

LOCK TABLES `w_migrations` WRITE;
/*!40000 ALTER TABLE `w_migrations` DISABLE KEYS */;
INSERT INTO `w_migrations` VALUES (1,'2016_01_04_173148_create_admin_tables',1),(2,'2018_08_08_100000_create_telescope_entries_table',2);
/*!40000 ALTER TABLE `w_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_organs`
--

DROP TABLE IF EXISTS `w_organs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_organs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organ_name` varchar(255) NOT NULL DEFAULT '' COMMENT '组织名',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='组织管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_organs`
--

LOCK TABLES `w_organs` WRITE;
/*!40000 ALTER TABLE `w_organs` DISABLE KEYS */;
INSERT INTO `w_organs` VALUES (1,'公司1',0,0,'2020-12-17 16:37:57','2020-12-17 16:37:57'),(2,'公司2',0,0,'2020-12-17 16:44:17','2020-12-17 16:44:17'),(3,'公司3',0,0,'2020-12-17 16:47:59','2020-12-17 16:47:59'),(4,'站点1',0,1,'2020-12-17 16:48:06','2020-12-17 16:48:06'),(5,'站点2',0,1,'2020-12-17 16:48:12','2020-12-17 16:50:40'),(6,'站点3',0,1,'2020-12-17 17:09:04','2020-12-17 17:15:25'),(7,'站点4',0,2,'2020-12-17 17:15:38','2020-12-17 17:15:38'),(8,'站点5',0,3,'2020-12-17 17:22:00','2020-12-17 17:22:00'),(9,'财务部',0,4,'2020-12-17 17:27:02','2020-12-17 17:27:02'),(10,'运营部',0,4,'2020-12-17 17:27:09','2020-12-17 17:27:21'),(11,'技术部',0,4,'2020-12-17 17:27:14','2020-12-17 17:27:14'),(12,'运营部',0,5,'2020-12-17 17:41:51','2020-12-17 17:41:51'),(13,'策划部',0,5,'2020-12-17 17:42:00','2020-12-17 17:42:00');
/*!40000 ALTER TABLE `w_organs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_room_users`
--

DROP TABLE IF EXISTS `w_room_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_room_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT '0' COMMENT '聊天室id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_type` int(11) NOT NULL DEFAULT '0' COMMENT '用户类型 0普通用户 1群主',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='聊天室用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_room_users`
--

LOCK TABLES `w_room_users` WRITE;
/*!40000 ALTER TABLE `w_room_users` DISABLE KEYS */;
INSERT INTO `w_room_users` VALUES (1,1,1,1,'2020-12-16 16:55:41','2020-12-16 16:55:41'),(2,1,2,0,'2020-12-16 16:55:41','2020-12-16 16:55:41'),(3,2,1,1,'2020-12-16 16:56:02','2020-12-16 16:56:02'),(4,2,2,0,'2020-12-16 16:56:02','2020-12-16 16:56:02');
/*!40000 ALTER TABLE `w_room_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_rooms`
--

DROP TABLE IF EXISTS `w_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(32) NOT NULL DEFAULT '' COMMENT '群组名',
  `room_pic` varchar(255) NOT NULL DEFAULT 'http://gas.micyi.com/pics/images/group.png' COMMENT '群组图标',
  `user_cnt` int(11) DEFAULT '0' COMMENT '用户数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='聊天室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_rooms`
--

LOCK TABLES `w_rooms` WRITE;
/*!40000 ALTER TABLE `w_rooms` DISABLE KEYS */;
INSERT INTO `w_rooms` VALUES (1,'聊天群1','http://gas.micyi.com/pics/images/group.png',2,'2020-12-16 16:55:41','2020-12-16 16:55:41'),(2,'聊天群2','',2,'2020-12-16 16:56:02','2020-12-16 16:56:02');
/*!40000 ALTER TABLE `w_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_standards`
--

DROP TABLE IF EXISTS `w_standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) DEFAULT '' COMMENT '项目',
  `weight` int(11) DEFAULT '0' COMMENT '权重',
  `standard` int(11) DEFAULT '0' COMMENT '标准',
  `bonus` int(11) DEFAULT '0' COMMENT '补贴金额',
  `real_data` int(11) DEFAULT '0' COMMENT '实际数据',
  `result` varchar(32) DEFAULT NULL COMMENT '结果 0未通过 1通过',
  `std_type` tinyint(4) DEFAULT '0' COMMENT '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='标准';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_standards`
--

LOCK TABLES `w_standards` WRITE;
/*!40000 ALTER TABLE `w_standards` DISABLE KEYS */;
INSERT INTO `w_standards` VALUES (1,'项目1',30,100,200,0,NULL,0,'2020-12-09 17:39:51','2020-12-09 17:41:45'),(2,'项目2',30,100,100,0,NULL,0,'2020-12-11 17:13:20','2020-12-11 17:13:20'),(3,'项目3',30,300,300,0,NULL,0,'2020-12-11 17:13:33','2020-12-11 17:13:33');
/*!40000 ALTER TABLE `w_standards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_stations`
--

DROP TABLE IF EXISTS `w_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) DEFAULT '' COMMENT '燃气站名',
  `company_id` int(11) DEFAULT '0' COMMENT '所属公司id',
  `type` tinyint(4) DEFAULT '0' COMMENT '0换瓶站, 1 LNG气站, 2 CNG气站',
  `addr` varchar(255) DEFAULT '' COMMENT '地址',
  `lng` varchar(255) DEFAULT '' COMMENT '经度',
  `lat` varchar(255) DEFAULT '' COMMENT '纬度',
  `contact_user` varchar(255) DEFAULT '' COMMENT '联系人',
  `contact_user_mobile` varchar(255) DEFAULT '' COMMENT '联系人手机',
  `contact_user_tel` varchar(255) DEFAULT '' COMMENT '联系人电话',
  `permit` tinyint(4) DEFAULT '1' COMMENT '经营许可证',
  `permit_no` varchar(255) DEFAULT '' COMMENT '许可证编号',
  `permit_pic` varchar(255) DEFAULT NULL COMMENT '经营许可证图片',
  `schedule` varchar(1000) DEFAULT NULL COMMENT '值班信息',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `backup_no` varchar(255) DEFAULT '' COMMENT '备案编号',
  `backup_company_id` varchar(255) DEFAULT '' COMMENT '申报单位',
  `ck_status` tinyint(4) DEFAULT '0' COMMENT '备案状态 0未审核 1已审核',
  `license` tinyint(4) DEFAULT '1' COMMENT '营业执照',
  `license_no` varchar(255) DEFAULT '' COMMENT '营业执照编号',
  `license_pic` varchar(255) DEFAULT '' COMMENT '营业执照图片',
  `device_ids` varchar(1000) DEFAULT '' COMMENT '站点设备',
  `admin_user_id` int(11) DEFAULT '0' COMMENT '人员分配id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='燃气站';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_stations`
--

LOCK TABLES `w_stations` WRITE;
/*!40000 ALTER TABLE `w_stations` DISABLE KEYS */;
INSERT INTO `w_stations` VALUES (1,'昌平',1,1,'深圳市福田区园博东街118','114.010676','22.543101','233','222','1',0,'111',NULL,NULL,NULL,'222','2',0,1,'111','images/993e4cfa7a760dfb3a612f9744e96e7a.png','',2,'2020-12-04 17:08:12','2020-12-14 18:11:58'),(2,'大兴',1,0,'深圳市福田区润田路28号-2','114.020786','22.552443','333','33','333',1,'3','images/c52d1fc1223cba23e36ad10268ac3f9b.png','111\r\n222\r\n333\r\n111\r\n111\r\n111\r\n111',NULL,'3','1',0,1,'3','','',2,'2020-12-05 10:32:32','2020-12-14 18:10:28'),(3,'朝阳',2,2,'深圳市福田区建业二路','114.017768','22.548337','33','33',NULL,1,'3',NULL,NULL,NULL,'33','2',0,1,'3','','',2,'2020-12-05 15:54:51','2020-12-05 15:54:51');
/*!40000 ALTER TABLE `w_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_telescope_entries`
--

DROP TABLE IF EXISTS `w_telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `w_telescope_entries_uuid_unique` (`uuid`),
  KEY `w_telescope_entries_batch_id_index` (`batch_id`),
  KEY `w_telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  KEY `w_telescope_entries_family_hash_index` (`family_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_telescope_entries`
--

LOCK TABLES `w_telescope_entries` WRITE;
/*!40000 ALTER TABLE `w_telescope_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_telescope_entries_tags`
--

DROP TABLE IF EXISTS `w_telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `w_telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `w_telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `w_telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `w_telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_telescope_entries_tags`
--

LOCK TABLES `w_telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `w_telescope_entries_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_telescope_monitoring`
--

DROP TABLE IF EXISTS `w_telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_telescope_monitoring`
--

LOCK TABLES `w_telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `w_telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_users`
--

DROP TABLE IF EXISTS `w_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(171) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_users`
--

LOCK TABLES `w_users` WRITE;
/*!40000 ALTER TABLE `w_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_zones`
--

DROP TABLE IF EXISTS `w_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(32) NOT NULL DEFAULT '' COMMENT '区域名称',
  `zone_range` varchar(1000) NOT NULL DEFAULT '' COMMENT '区域范围',
  `station_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '站点',
  `gas_type` tinyint(4) DEFAULT '0' COMMENT '供气方式',
  `tube_length` int(11) DEFAULT '0' COMMENT '管道长度',
  `cover_area` int(11) DEFAULT '0' COMMENT '供气面积',
  `population` int(11) DEFAULT '0' COMMENT '供气人口',
  `zone_status` tinyint(4) DEFAULT '0' COMMENT '区域状态 0可用 1禁用',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='区域管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_zones`
--

LOCK TABLES `w_zones` WRITE;
/*!40000 ALTER TABLE `w_zones` DISABLE KEYS */;
INSERT INTO `w_zones` VALUES (1,'奥林匹克公园','北五环，朝阳街，中关村','1,2',1,10,1000,2000,1,'2020-12-05 15:15:57','2020-12-05 15:58:54');
/*!40000 ALTER TABLE `w_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 18:36:19

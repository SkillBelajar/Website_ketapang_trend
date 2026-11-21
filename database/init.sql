/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:8:{i:1795231587;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1795231606;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1795233132;a:1:{s:26:\"rediscache_discard_metrics\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1795271187;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1795272987;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1795310806;a:3:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:41:\"wp_privacy_personal_data_cleanup_requests\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1795829210;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','https://ketapang.pawandigital.id','on'),
(3,'home','https://ketapang.pawandigital.id','on'),
(4,'blogname','WP Ultra-Fast Stack','on'),
(5,'blogdescription','','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','admin@example.com','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','mail.example.com','on'),
(16,'mailserver_login','login@example.com','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','F j, Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','F j, Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','','on'),
(30,'rewrite_rules','','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:1:{i:0;s:27:\"redis-cache/redis-cache.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','https://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','detik-ketapang','on'),
(42,'stylesheet','detik-ketapang','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','61833','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','posts','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:0:{}','on'),
(78,'widget_text','a:0:{}','on'),
(79,'widget_rss','a:0:{}','on'),
(80,'uninstall_plugins','a:0:{}','off'),
(81,'timezone_string','','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','0','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','0','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1810776387','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','0','on'),
(101,'wp_notes_notify','1','on'),
(102,'initial_db_version','61833','on'),
(103,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','on'),
(104,'fresh_site','0','off'),
(105,'user_count','1','off'),
(106,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(107,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','auto'),
(108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(134,'theme_mods_twentytwentyfive','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1795230183;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','off'),
(135,'recovery_keys','a:0:{}','off'),
(138,'current_theme','detikKetapang','auto'),
(139,'theme_switched','','auto'),
(140,'theme_mods_detik-ketapang','a:2:{s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}','auto'),
(141,'wp_calendar_block_has_published_posts','1','auto'),
(152,'category_children','a:0:{}','auto');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(1,2,'_wp_page_template','default'),
(2,3,'_wp_page_template','default'),
(5,5,'post_views_count','15420'),
(8,6,'post_views_count','12890'),
(11,7,'post_views_count','9840'),
(14,8,'post_views_count','8510'),
(17,9,'post_views_count','7200'),
(20,10,'post_views_count','6340'),
(23,11,'post_views_count','8921'),
(26,12,'post_views_count','5120'),
(29,13,'post_views_count','4312'),
(30,14,'_wp_attached_file','2026/11/news_5.jpg'),
(31,14,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:18:\"2026/11/news_5.jpg\";s:8:\"filesize\";i:94769;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"news_5-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19896;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"news_5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9590;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"news_5-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:97443;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:18:\"news_5-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:35892;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:18:\"news_5-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14490;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 616\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 616\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(32,5,'_thumbnail_id','14'),
(33,15,'_wp_attached_file','2026/11/news_6.jpg'),
(34,15,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:18:\"2026/11/news_6.jpg\";s:8:\"filesize\";i:85052;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"news_6-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17627;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"news_6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9211;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"news_6-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:86915;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:18:\"news_6-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:31799;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:18:\"news_6-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13214;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 361\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 361\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(35,6,'_thumbnail_id','15'),
(36,16,'_wp_attached_file','2026/11/news_7.jpg'),
(37,16,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:18:\"2026/11/news_7.jpg\";s:8:\"filesize\";i:25165;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"news_7-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6732;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"news_7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3718;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"news_7-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:27852;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:18:\"news_7-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11040;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:18:\"news_7-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5178;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 901\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 901\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(38,7,'_thumbnail_id','16'),
(39,17,'_wp_attached_file','2026/11/news_8.jpg'),
(40,17,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:18:\"2026/11/news_8.jpg\";s:8:\"filesize\";i:42477;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"news_8-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10826;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"news_8-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5649;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"news_8-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:45917;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:18:\"news_8-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17863;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:18:\"news_8-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8213;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 449\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 449\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(41,8,'_thumbnail_id','17'),
(42,18,'_wp_attached_file','2026/11/news_9.jpg'),
(43,18,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:18:\"2026/11/news_9.jpg\";s:8:\"filesize\";i:44255;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"news_9-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9420;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"news_9-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4937;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"news_9-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:47204;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:18:\"news_9-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17053;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:18:\"news_9-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7251;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 474\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 474\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(44,9,'_thumbnail_id','18'),
(45,19,'_wp_attached_file','2026/11/news_10.jpg'),
(46,19,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:19:\"2026/11/news_10.jpg\";s:8:\"filesize\";i:42499;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"news_10-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10659;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"news_10-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5599;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"news_10-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:45664;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:19:\"news_10-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17844;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:19:\"news_10-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8171;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 362\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 362\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(47,10,'_thumbnail_id','19'),
(48,20,'_wp_attached_file','2026/11/news_11.jpg'),
(49,20,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:19:\"2026/11/news_11.jpg\";s:8:\"filesize\";i:53845;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"news_11-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11868;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"news_11-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5974;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"news_11-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:56562;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:19:\"news_11-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:20691;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:19:\"news_11-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8757;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 417\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 417\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(50,11,'_thumbnail_id','20'),
(51,21,'_wp_attached_file','2026/11/news_12.jpg'),
(52,21,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:19:\"2026/11/news_12.jpg\";s:8:\"filesize\";i:34182;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"news_12-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10341;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"news_12-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5596;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"news_12-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:38110;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:19:\"news_12-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16296;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:19:\"news_12-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8088;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 793\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 793\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(53,12,'_thumbnail_id','21'),
(54,22,'_wp_attached_file','2026/11/news_13.jpg'),
(55,22,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:450;s:4:\"file\";s:19:\"2026/11/news_13.jpg\";s:8:\"filesize\";i:63777;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"news_13-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12019;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"news_13-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6150;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"news_13-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:66127;}s:9:\"detik-sub\";a:5:{s:4:\"file\";s:19:\"news_13-400x250.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22506;}s:11:\"detik-thumb\";a:5:{s:4:\"file\";s:19:\"news_13-240x150.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8905;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 851\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 851\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(56,13,'_thumbnail_id','22'),
(59,13,'_wp_old_date','2026-11-21'),
(62,12,'_wp_old_date','2026-11-21'),
(65,11,'_wp_old_date','2026-11-21'),
(68,10,'_wp_old_date','2026-11-21'),
(71,9,'_wp_old_date','2026-11-21'),
(74,8,'_wp_old_date','2026-11-21'),
(77,7,'_wp_old_date','2026-11-21'),
(80,6,'_wp_old_date','2026-11-21'),
(83,5,'_wp_old_date','2026-11-21');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(2,1,'2026-11-21 01:26:27','2026-11-21 01:26:27','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://ketapang.pawandigital.id/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2026-11-21 01:26:27','2026-11-21 01:26:27','',0,'https://ketapang.pawandigital.id/?page_id=2',0,'page','',0),
(3,1,'2026-11-21 01:26:27','2026-11-21 01:26:27','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: https://ketapang.pawandigital.id.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n','Privacy Policy','','draft','closed','open','','privacy-policy','','','2026-11-21 01:26:27','2026-11-21 01:26:27','',0,'https://ketapang.pawandigital.id/?page_id=3',0,'page','',0),
(4,0,'2026-11-21 01:27:38','2026-11-21 01:27:38','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2026-11-21 01:27:38','2026-11-21 01:27:38','',0,'https://ketapang.pawandigital.id/?p=4',0,'wp_navigation','',0),
(5,0,'2026-11-20 11:53:22','2026-11-20 11:53:22','<p>Pemerintah Kabupaten Ketapang melalui Dinas Pekerjaan Umum dan Tata Ruang (PUTR) resmi mempercepat pengerjaan perbaikan sejumlah titik krusial di jalur Trans Kalimantan serta penguatan struktur penyangga Jembatan Pawan.</p><p>Langkah taktis ini diambil menyusul peningkatan volume mobilitas angkutan komoditas perkebunan dan sembako yang melintasi kawasan Delta Pawan menuju pelabuhan bongkar muat Sukabangun.</p><p>Bupati Ketapang menegaskan bahwa konektivitas jalan darat merupakan urat nadi perputaran ekonomi daerah. \'Kami menargetkan sebelum pergantian tahun, titik-titik jalan berlubang sudah tuntas dilapisi aspal hotmix sehingga risiko kecelakaan dapat diminimalisir dan distribusi barang semakin lancar,\' tegasnya.</p><p>Pihak kepolisian resort setempat turut mengimbau para pengendara truk muatan over dimension over load (ODOL) agar mematuhi batas tonase jembatan guna menjaga ketahanan konstruksi jangka panjang.</p>','Pemkab Ketapang Kebut Revitalisasi Ruas Jalan Trans Kalimantan dan Jembatan Pawan Jelang Akhir Tahun','Pemerintah Kabupaten Ketapang mengalokasikan anggaran percepatan peningkatan jalan utama dan penguatan struktur Jembatan Pawan demi memperlancar arus logistik komoditas sawit dan sembako.','publish','open','open','','pemkab-ketapang-kebut-revitalisasi-ruas-jalan-trans-kalimantan-dan-jembatan-pawan-jelang-akhir-tahun','','','2026-11-21 03:13:35','2026-11-21 03:13:35','',0,'https://ketapang.pawandigital.id/?p=5',0,'post','',0),
(6,0,'2026-11-20 14:03:22','2026-11-20 14:03:22','<p>Kabar menggembirakan menyelimuti para pekebun kelapa sawit di Kabupaten Ketapang. Berdasarkan penetapan resmi Dinas Perkebunan Provinsi Kalimantan Barat, harga Tandan Buah Segar (TBS) kelapa sawit untuk tanaman umur 10-20 tahun tercatat menembus angka Rp 3.140 per kilogram.</p><p>Penguatan harga ini dipicu oleh tren positif permintaan minyak sawit mentah (CPO) global dan kestabilan ekspor komoditas perkebunan nasional.</p><p>Ketua Asosiasi Petani Kelapa Sawit Indonesia (Apkasindo) Ketapang menyatakan kenaikan ini memberi angin segar bagi kesejahteraan keluarga petani setelah beberapa bulan menghadapi tantangan cuaca dan fluktuasi biaya pupuk.</p>','Harga TBS Sawit Kalbar Naik Menembus Rp 3.140 per Kg, Petani Swadaya Ketapang Sambut Positif','Kenaikan harga Tandan Buah Segar (TBS) kelapa sawit di wilayah Kalimantan Barat periode November 2026 disambut antusias oleh para petani sawit mandiri di Ketapang.','publish','open','open','','harga-tbs-sawit-kalbar-naik-menembus-rp-3-140-per-kg-petani-swadaya-ketapang-sambut-positif','','','2026-11-21 03:13:34','2026-11-21 03:13:34','',0,'https://ketapang.pawandigital.id/?p=6',0,'post','',0),
(7,0,'2026-11-20 15:53:22','2026-11-20 15:53:22','<p>Kabupaten Ketapang bersiap menyambut kemeriahan Festival Budaya Keraton Matan yang dijadwalkan berlangsung meriah pekan depan di kawasan cagar budaya Keraton Muhammad Saunan.</p><p>Acara tahunan ini akan menampilkan beragam atraksi seni tradisional, termasuk parade perahu naga di aliran Sungai Pawan, tari jepin massal, serta pameran pusaka kuno peninggalan Kesultanan Matan.</p><p>Kepala Dinas Pariwisata dan Kebudayaan Ketapang menuturkan festival ini ditargetkan menyedot ribuan wisatawan domestik maupun regional untuk menggairahkan roda perhotelan dan kuliner khas lokal seperti Ale-ale dan Jenang Ketapang.</p>','Festival Seni & Budaya Keraton Matan Digelar Pekan Depan, Angkat Warisan Sejarah Melayu Ketapang','Perhelatan akbar Festival Seni dan Budaya Keraton Matan Ketapang siap dibuka dengan menghadirkan parade perahu hias di Sungai Pawan serta aneka kuliner tradisional nusantara.','publish','open','open','','festival-seni-budaya-keraton-matan-digelar-pekan-depan-angkat-warisan-sejarah-melayu-ketapang','','','2026-11-21 03:13:32','2026-11-21 03:13:32','',0,'https://ketapang.pawandigital.id/?p=7',0,'post','',0),
(8,0,'2026-11-20 17:23:22','2026-11-20 17:23:22','<p>Menjaga keamanan dan ketertiban berlalu lintas, Satuan Lalu Lintas Polres Ketapang menggelar razia terpadu Operasi Zebra Kapuas dengan memusatkan patroli pada koridor akses keluar masuk Pelabuhan Sukabangun.</p><p>Langkah preventif ini difokuskan pada pengecekan kelayakan uji kir kendaraan angkutan barang, penertiban parkir liar yang kerap memicu kemacetan, serta pengawasan kelengkapan administrasi pengemudi.</p><p>Kasat Lantas Polres Ketapang mengingatkan bahwa kelancaran transportasi di sekitar gerbang logistik sangat vital bagi stabilitas harga barang kebutuhan pokok di seluruh penjuru kabupaten.</p>','Polres Ketapang Amankan Jalur Logistik Pelabuhan Sukabangun Lewat Operasi Zebra Kapuas','Satlantas Polres Ketapang mengintensifkan razia dan pengaturan lalu lintas di sekitar koridor Pelabuhan Sukabangun guna memastikan kelancaran angkutan barang.','publish','open','open','','polres-ketapang-amankan-jalur-logistik-pelabuhan-sukabangun-lewat-operasi-zebra-kapuas','','','2026-11-21 03:13:30','2026-11-21 03:13:30','',0,'https://ketapang.pawandigital.id/?p=8',0,'post','',0),
(9,0,'2026-11-20 18:43:22','2026-11-20 18:43:22','<p>Tim gabungan Dinas Koperasi, Usaha Kecil Menengah, Perindustrian dan Perdagangan (Disperindag) Ketapang turun langsung melakukan peninjauan harga di Pasar Tradisional Rangga Sentap, Delta Pawan.</p><p>Dari hasil dialog dengan para pedagang, stok komoditas strategis seperti beras premium, gula pasir, telur ayam, dan minyak goreng curah maupun kemasan berada pada batas aman dengan pasokan rutin dari Pontianak dan Semarang.</p><p>Pemerintah daerah berjanji akan terus memantau mata rantai distribusi agar spekulan tidak memainkan harga menjelang momentum libur panjang natal dan tahun baru.</p>','Disperindag Ketapang Sidak Pasar Rangga Sentap: Pasokan Beras dan Minyak Goreng Terpantau Aman','Hasil inspeksi mendadak di pasar tradisional Rangga Sentap menunjukkan stok kebutuhan bahan pangan pokok mencukupi tanpa ada lonjakan harga yang mengkhawatirkan.','publish','open','open','','disperindag-ketapang-sidak-pasar-rangga-sentap-pasokan-beras-dan-minyak-goreng-terpantau-aman','','','2026-11-21 03:13:29','2026-11-21 03:13:29','',0,'https://ketapang.pawandigital.id/?p=9',0,'post','',0),
(10,0,'2026-11-20 20:03:22','2026-11-20 20:03:22','<p>Keberhasilan membanggakan ditorehkan oleh kelompok tani perkebunan kopi di pedalaman Ketapang. Biji kopi varietas Liberika khas tanah gambut lokal sukses menembus pesanan ekspor perdana ke sejumlah coffee shop di Singapura dan Taiwan.</p><p>Dikenal memiliki cita rasa unik menyerupai jackfruit dengan aftertaste manis yang lembut, kopi Liberika Ketapang dibudidayakan secara organik dengan prinsip ramah lingkungan.</p><p>Fasilitasi pendampingan kemasan dan sertifikasi organik dari Pemprov Kalbar diakui kelompok tani sangat membantu produk lokal ini bersaing di panggung global.</p>','Geliat UMKM Kopi Liberika Asli Ketapang Mulai Tembus Pasar Ekspor Mancanegara','Kopi jenis Liberika yang dibudidayakan di lahan gambut Ketapang kian diminati pasar pecinta kopi spesialti internasional karena aroma floral dan keasaman seimbangnya.','publish','open','open','','geliat-umkm-kopi-liberika-asli-ketapang-mulai-tembus-pasar-ekspor-mancanegara','','','2026-11-21 03:13:27','2026-11-21 03:13:27','',0,'https://ketapang.pawandigital.id/?p=10',0,'post','',0),
(11,0,'2026-11-20 20:58:22','2026-11-20 20:58:22','<p>Badan Meteorologi, Klimatologi, dan Geofisika (BMKG) Stasiun Meteorologi Rahadi Oesman Ketapang mengeluarkan peringatan dini terkait potensi cuaca buruk dan kenaikan tinggi gelombang laut di Selat Karimata.</p><p>Fenomena angin kencang berkecepatan hingga 25 knot diprakirakan masih berpeluang terjadi dalam rentang 3 hari ke depan, disertai hujan berintensitas sedang hingga lebat pada sore dan malam hari.</p><p>Kantor Kesyahbandaran dan Otoritas Pelabuhan (KSOP) mengingatkan nakhoda kapal cepat dan nelayan pesisir untuk selalu melengkapi alat keselamatan pelampung dan memantau update cuaca sebelum bertolak melaut.</p>','BMKG Rilis Waspada Cuaca Ekstrem dan Gelombang Tinggi di Perairan Selat Karimata','Stasiun Meteorologi mengimbau para nelayan tradisional dan operator kapal rute Ketapang-Semarang untuk waspada terhadap potensi gelombang mencapai 2,5 meter.','publish','open','open','','bmkg-rilis-waspada-cuaca-ekstrem-dan-gelombang-tinggi-di-perairan-selat-karimata','','','2026-11-21 03:13:26','2026-11-21 03:13:26','',0,'https://ketapang.pawandigital.id/?p=11',0,'post','',0),
(12,0,'2026-11-20 21:35:22','2026-11-20 21:35:22','<p>Transformasi birokrasi ramah warga kian nyata dirasakan masyarakat Ketapang. Dinas Kependudukan dan Pencatatan Sipil (Disdukcapil) resmi mengoperasikan mesin Anjungan Dukcapil Mandiri (ADM) di Mall Pelayanan Publik.</p><p>Melalui inovasi ini, warga yang telah mengajukan permohonan melalui aplikasi online cukup memindai QR code dan sidik jari untuk mencetak fisik e-KTP, KIA, maupun KK tanpa perlu mengantre di loket konvensional.</p><p>Masyarakat mengapresiasi terobosan ini karena dinilai sangat efisien, transparan, dan memangkas waktu tunggu secara signifikan.</p>','Inovasi Layanan Publik Digital: Cetak Adminduk di Ketapang Kini Bisa Selesai Hitungan Menit Lewat Mesin ADM','Disdukcapil Ketapang menempatkan Anjungan Dukcapil Mandiri (ADM) di sejumlah titik strategis guna mempermudah warga mengurus KTP elektronik dan Kartu Keluarga.','publish','open','open','','inovasi-layanan-publik-digital-cetak-adminduk-di-ketapang-kini-bisa-selesai-hitungan-menit-lewat-mesin-adm','','','2026-11-21 03:13:24','2026-11-21 03:13:24','',0,'https://ketapang.pawandigital.id/?p=12',0,'post','',0),
(13,0,'2026-11-20 21:59:22','2026-11-20 21:59:22','<p>Ekowisata Hutan Mangrove Sukabangun di Delta Pawan semakin populer sebagai lokasi rekreasi sekaligus edukasi pelestarian lingkungan hidup bagi pelajar dan keluarga di Ketapang.</p><p>Pengelola kawasan bersama komunitas pecinta lingkungan menyediakan jalur trekking kayu ramah lingkungan yang membelah rimbunnya pohon bakau, dilengkapi gazebo pandang untuk mengamati aneka burung pesisir.</p><p>Inisiatif ini membuktikan bahwa perlindungan ekosistem pesisir dari ancaman abrasi laut dapat berjalan beriringan dengan tumbuhnya ekonomi kreatif masyarakat setempat.</p>','Pesona Wisata Alam Hutan Mangrove Sukabangun Jadi Magnet Edukasi Pelestarian Lingkungan','Kawasan konservasi mangrove di pesisir Sukabangun terus berbenah dengan melengkapi jembatan titian kayu estetik dan spot edukasi pembibitan pohon bakau.','publish','open','open','','pesona-wisata-alam-hutan-mangrove-sukabangun-jadi-magnet-edukasi-pelestarian-lingkungan','','','2026-11-21 03:13:23','2026-11-21 03:13:23','',0,'https://ketapang.pawandigital.id/?p=13',0,'post','',0),
(14,0,'2026-11-21 03:06:10','2026-11-21 03:06:10','','Picsum ID: 616','Picsum ID: 616','inherit','open','closed','','picsum-id-616','','','2026-11-21 03:06:10','2026-11-21 03:06:10','',5,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_5.jpg',0,'attachment','image/jpeg',0),
(15,0,'2026-11-21 03:06:11','2026-11-21 03:06:11','','Picsum ID: 361','Picsum ID: 361','inherit','open','closed','','picsum-id-361','','','2026-11-21 03:06:11','2026-11-21 03:06:11','',6,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_6.jpg',0,'attachment','image/jpeg',0),
(16,0,'2026-11-21 03:06:12','2026-11-21 03:06:12','','Picsum ID: 901','Picsum ID: 901','inherit','open','closed','','picsum-id-901','','','2026-11-21 03:06:12','2026-11-21 03:06:12','',7,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_7.jpg',0,'attachment','image/jpeg',0),
(17,0,'2026-11-21 03:06:14','2026-11-21 03:06:14','','Picsum ID: 449','Picsum ID: 449','inherit','open','closed','','picsum-id-449','','','2026-11-21 03:06:14','2026-11-21 03:06:14','',8,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_8.jpg',0,'attachment','image/jpeg',0),
(18,0,'2026-11-21 03:06:15','2026-11-21 03:06:15','','Picsum ID: 474','Picsum ID: 474','inherit','open','closed','','picsum-id-474','','','2026-11-21 03:06:15','2026-11-21 03:06:15','',9,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_9.jpg',0,'attachment','image/jpeg',0),
(19,0,'2026-11-21 03:06:17','2026-11-21 03:06:17','','Picsum ID: 362','Picsum ID: 362','inherit','open','closed','','picsum-id-362','','','2026-11-21 03:06:17','2026-11-21 03:06:17','',10,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_10.jpg',0,'attachment','image/jpeg',0),
(20,0,'2026-11-21 03:06:18','2026-11-21 03:06:18','','Picsum ID: 417','Picsum ID: 417','inherit','open','closed','','picsum-id-417','','','2026-11-21 03:06:18','2026-11-21 03:06:18','',11,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_11.jpg',0,'attachment','image/jpeg',0),
(21,0,'2026-11-21 03:06:19','2026-11-21 03:06:19','','Picsum ID: 793','Picsum ID: 793','inherit','open','closed','','picsum-id-793','','','2026-11-21 03:06:19','2026-11-21 03:06:19','',12,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_12.jpg',0,'attachment','image/jpeg',0),
(22,0,'2026-11-21 03:06:21','2026-11-21 03:06:21','','Picsum ID: 851','Picsum ID: 851','inherit','open','closed','','picsum-id-851','','','2026-11-21 03:06:21','2026-11-21 03:06:21','',13,'https://ketapang.pawandigital.id/wp-content/uploads/2026/11/news_13.jpg',0,'attachment','image/jpeg',0),
(23,0,'2026-11-21 03:13:23','2026-11-21 03:13:23','<p>Ekowisata Hutan Mangrove Sukabangun di Delta Pawan semakin populer sebagai lokasi rekreasi sekaligus edukasi pelestarian lingkungan hidup bagi pelajar dan keluarga di Ketapang.</p><p>Pengelola kawasan bersama komunitas pecinta lingkungan menyediakan jalur trekking kayu ramah lingkungan yang membelah rimbunnya pohon bakau, dilengkapi gazebo pandang untuk mengamati aneka burung pesisir.</p><p>Inisiatif ini membuktikan bahwa perlindungan ekosistem pesisir dari ancaman abrasi laut dapat berjalan beriringan dengan tumbuhnya ekonomi kreatif masyarakat setempat.</p>','Pesona Wisata Alam Hutan Mangrove Sukabangun Jadi Magnet Edukasi Pelestarian Lingkungan','Kawasan konservasi mangrove di pesisir Sukabangun terus berbenah dengan melengkapi jembatan titian kayu estetik dan spot edukasi pembibitan pohon bakau.','inherit','closed','closed','','13-revision-v1','','','2026-11-21 03:13:23','2026-11-21 03:13:23','',13,'https://ketapang.pawandigital.id/?p=23',0,'revision','',0),
(24,0,'2026-11-21 03:13:24','2026-11-21 03:13:24','<p>Transformasi birokrasi ramah warga kian nyata dirasakan masyarakat Ketapang. Dinas Kependudukan dan Pencatatan Sipil (Disdukcapil) resmi mengoperasikan mesin Anjungan Dukcapil Mandiri (ADM) di Mall Pelayanan Publik.</p><p>Melalui inovasi ini, warga yang telah mengajukan permohonan melalui aplikasi online cukup memindai QR code dan sidik jari untuk mencetak fisik e-KTP, KIA, maupun KK tanpa perlu mengantre di loket konvensional.</p><p>Masyarakat mengapresiasi terobosan ini karena dinilai sangat efisien, transparan, dan memangkas waktu tunggu secara signifikan.</p>','Inovasi Layanan Publik Digital: Cetak Adminduk di Ketapang Kini Bisa Selesai Hitungan Menit Lewat Mesin ADM','Disdukcapil Ketapang menempatkan Anjungan Dukcapil Mandiri (ADM) di sejumlah titik strategis guna mempermudah warga mengurus KTP elektronik dan Kartu Keluarga.','inherit','closed','closed','','12-revision-v1','','','2026-11-21 03:13:24','2026-11-21 03:13:24','',12,'https://ketapang.pawandigital.id/?p=24',0,'revision','',0),
(25,0,'2026-11-21 03:13:26','2026-11-21 03:13:26','<p>Badan Meteorologi, Klimatologi, dan Geofisika (BMKG) Stasiun Meteorologi Rahadi Oesman Ketapang mengeluarkan peringatan dini terkait potensi cuaca buruk dan kenaikan tinggi gelombang laut di Selat Karimata.</p><p>Fenomena angin kencang berkecepatan hingga 25 knot diprakirakan masih berpeluang terjadi dalam rentang 3 hari ke depan, disertai hujan berintensitas sedang hingga lebat pada sore dan malam hari.</p><p>Kantor Kesyahbandaran dan Otoritas Pelabuhan (KSOP) mengingatkan nakhoda kapal cepat dan nelayan pesisir untuk selalu melengkapi alat keselamatan pelampung dan memantau update cuaca sebelum bertolak melaut.</p>','BMKG Rilis Waspada Cuaca Ekstrem dan Gelombang Tinggi di Perairan Selat Karimata','Stasiun Meteorologi mengimbau para nelayan tradisional dan operator kapal rute Ketapang-Semarang untuk waspada terhadap potensi gelombang mencapai 2,5 meter.','inherit','closed','closed','','11-revision-v1','','','2026-11-21 03:13:26','2026-11-21 03:13:26','',11,'https://ketapang.pawandigital.id/?p=25',0,'revision','',0),
(26,0,'2026-11-21 03:13:27','2026-11-21 03:13:27','<p>Keberhasilan membanggakan ditorehkan oleh kelompok tani perkebunan kopi di pedalaman Ketapang. Biji kopi varietas Liberika khas tanah gambut lokal sukses menembus pesanan ekspor perdana ke sejumlah coffee shop di Singapura dan Taiwan.</p><p>Dikenal memiliki cita rasa unik menyerupai jackfruit dengan aftertaste manis yang lembut, kopi Liberika Ketapang dibudidayakan secara organik dengan prinsip ramah lingkungan.</p><p>Fasilitasi pendampingan kemasan dan sertifikasi organik dari Pemprov Kalbar diakui kelompok tani sangat membantu produk lokal ini bersaing di panggung global.</p>','Geliat UMKM Kopi Liberika Asli Ketapang Mulai Tembus Pasar Ekspor Mancanegara','Kopi jenis Liberika yang dibudidayakan di lahan gambut Ketapang kian diminati pasar pecinta kopi spesialti internasional karena aroma floral dan keasaman seimbangnya.','inherit','closed','closed','','10-revision-v1','','','2026-11-21 03:13:27','2026-11-21 03:13:27','',10,'https://ketapang.pawandigital.id/?p=26',0,'revision','',0),
(27,0,'2026-11-21 03:13:29','2026-11-21 03:13:29','<p>Tim gabungan Dinas Koperasi, Usaha Kecil Menengah, Perindustrian dan Perdagangan (Disperindag) Ketapang turun langsung melakukan peninjauan harga di Pasar Tradisional Rangga Sentap, Delta Pawan.</p><p>Dari hasil dialog dengan para pedagang, stok komoditas strategis seperti beras premium, gula pasir, telur ayam, dan minyak goreng curah maupun kemasan berada pada batas aman dengan pasokan rutin dari Pontianak dan Semarang.</p><p>Pemerintah daerah berjanji akan terus memantau mata rantai distribusi agar spekulan tidak memainkan harga menjelang momentum libur panjang natal dan tahun baru.</p>','Disperindag Ketapang Sidak Pasar Rangga Sentap: Pasokan Beras dan Minyak Goreng Terpantau Aman','Hasil inspeksi mendadak di pasar tradisional Rangga Sentap menunjukkan stok kebutuhan bahan pangan pokok mencukupi tanpa ada lonjakan harga yang mengkhawatirkan.','inherit','closed','closed','','9-revision-v1','','','2026-11-21 03:13:29','2026-11-21 03:13:29','',9,'https://ketapang.pawandigital.id/?p=27',0,'revision','',0),
(28,0,'2026-11-21 03:13:30','2026-11-21 03:13:30','<p>Menjaga keamanan dan ketertiban berlalu lintas, Satuan Lalu Lintas Polres Ketapang menggelar razia terpadu Operasi Zebra Kapuas dengan memusatkan patroli pada koridor akses keluar masuk Pelabuhan Sukabangun.</p><p>Langkah preventif ini difokuskan pada pengecekan kelayakan uji kir kendaraan angkutan barang, penertiban parkir liar yang kerap memicu kemacetan, serta pengawasan kelengkapan administrasi pengemudi.</p><p>Kasat Lantas Polres Ketapang mengingatkan bahwa kelancaran transportasi di sekitar gerbang logistik sangat vital bagi stabilitas harga barang kebutuhan pokok di seluruh penjuru kabupaten.</p>','Polres Ketapang Amankan Jalur Logistik Pelabuhan Sukabangun Lewat Operasi Zebra Kapuas','Satlantas Polres Ketapang mengintensifkan razia dan pengaturan lalu lintas di sekitar koridor Pelabuhan Sukabangun guna memastikan kelancaran angkutan barang.','inherit','closed','closed','','8-revision-v1','','','2026-11-21 03:13:30','2026-11-21 03:13:30','',8,'https://ketapang.pawandigital.id/?p=28',0,'revision','',0),
(29,0,'2026-11-21 03:13:32','2026-11-21 03:13:32','<p>Kabupaten Ketapang bersiap menyambut kemeriahan Festival Budaya Keraton Matan yang dijadwalkan berlangsung meriah pekan depan di kawasan cagar budaya Keraton Muhammad Saunan.</p><p>Acara tahunan ini akan menampilkan beragam atraksi seni tradisional, termasuk parade perahu naga di aliran Sungai Pawan, tari jepin massal, serta pameran pusaka kuno peninggalan Kesultanan Matan.</p><p>Kepala Dinas Pariwisata dan Kebudayaan Ketapang menuturkan festival ini ditargetkan menyedot ribuan wisatawan domestik maupun regional untuk menggairahkan roda perhotelan dan kuliner khas lokal seperti Ale-ale dan Jenang Ketapang.</p>','Festival Seni & Budaya Keraton Matan Digelar Pekan Depan, Angkat Warisan Sejarah Melayu Ketapang','Perhelatan akbar Festival Seni dan Budaya Keraton Matan Ketapang siap dibuka dengan menghadirkan parade perahu hias di Sungai Pawan serta aneka kuliner tradisional nusantara.','inherit','closed','closed','','7-revision-v1','','','2026-11-21 03:13:32','2026-11-21 03:13:32','',7,'https://ketapang.pawandigital.id/?p=29',0,'revision','',0),
(30,0,'2026-11-21 03:13:34','2026-11-21 03:13:34','<p>Kabar menggembirakan menyelimuti para pekebun kelapa sawit di Kabupaten Ketapang. Berdasarkan penetapan resmi Dinas Perkebunan Provinsi Kalimantan Barat, harga Tandan Buah Segar (TBS) kelapa sawit untuk tanaman umur 10-20 tahun tercatat menembus angka Rp 3.140 per kilogram.</p><p>Penguatan harga ini dipicu oleh tren positif permintaan minyak sawit mentah (CPO) global dan kestabilan ekspor komoditas perkebunan nasional.</p><p>Ketua Asosiasi Petani Kelapa Sawit Indonesia (Apkasindo) Ketapang menyatakan kenaikan ini memberi angin segar bagi kesejahteraan keluarga petani setelah beberapa bulan menghadapi tantangan cuaca dan fluktuasi biaya pupuk.</p>','Harga TBS Sawit Kalbar Naik Menembus Rp 3.140 per Kg, Petani Swadaya Ketapang Sambut Positif','Kenaikan harga Tandan Buah Segar (TBS) kelapa sawit di wilayah Kalimantan Barat periode November 2026 disambut antusias oleh para petani sawit mandiri di Ketapang.','inherit','closed','closed','','6-revision-v1','','','2026-11-21 03:13:34','2026-11-21 03:13:34','',6,'https://ketapang.pawandigital.id/?p=30',0,'revision','',0),
(31,0,'2026-11-21 03:13:35','2026-11-21 03:13:35','<p>Pemerintah Kabupaten Ketapang melalui Dinas Pekerjaan Umum dan Tata Ruang (PUTR) resmi mempercepat pengerjaan perbaikan sejumlah titik krusial di jalur Trans Kalimantan serta penguatan struktur penyangga Jembatan Pawan.</p><p>Langkah taktis ini diambil menyusul peningkatan volume mobilitas angkutan komoditas perkebunan dan sembako yang melintasi kawasan Delta Pawan menuju pelabuhan bongkar muat Sukabangun.</p><p>Bupati Ketapang menegaskan bahwa konektivitas jalan darat merupakan urat nadi perputaran ekonomi daerah. \'Kami menargetkan sebelum pergantian tahun, titik-titik jalan berlubang sudah tuntas dilapisi aspal hotmix sehingga risiko kecelakaan dapat diminimalisir dan distribusi barang semakin lancar,\' tegasnya.</p><p>Pihak kepolisian resort setempat turut mengimbau para pengendara truk muatan over dimension over load (ODOL) agar mematuhi batas tonase jembatan guna menjaga ketahanan konstruksi jangka panjang.</p>','Pemkab Ketapang Kebut Revitalisasi Ruas Jalan Trans Kalimantan dan Jembatan Pawan Jelang Akhir Tahun','Pemerintah Kabupaten Ketapang mengalokasikan anggaran percepatan peningkatan jalan utama dan penguatan struktur Jembatan Pawan demi memperlancar arus logistik komoditas sawit dan sembako.','inherit','closed','closed','','5-revision-v1','','','2026-11-21 03:13:35','2026-11-21 03:13:35','',5,'https://ketapang.pawandigital.id/?p=31',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(5,4,0),
(6,7,0),
(7,2,0),
(8,6,0),
(9,3,0),
(10,3,0),
(11,5,0),
(12,4,0),
(13,2,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,0),
(2,2,'category','',0,2),
(3,3,'category','',0,2),
(4,4,'category','',0,2),
(5,5,'category','',0,1),
(6,6,'category','',0,1),
(7,7,'category','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorized','uncategorized',0),
(2,'Ketapang Terkini','budaya-wisata',0),
(3,'Hukum &amp; Kriminal','ekonomi-bisnis',0),
(4,'Sawit &amp; Bisnis','ketapang-terkini',0),
(5,'Pemerintahan','peristiwa',0),
(6,'Budaya &amp; Wisata','politik-hukum',0),
(7,'Sawit &amp; Komoditas','sawit-komoditas',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','admin'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'infinite_scrolling','true'),
(8,1,'comment_shortcuts','false'),
(9,1,'admin_color','modern'),
(10,1,'use_ssl','0'),
(11,1,'show_admin_bar_front','true'),
(12,1,'locale',''),
(13,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(14,1,'wp_user_level','10'),
(15,1,'dismissed_wp_pointers',''),
(16,1,'show_welcome_panel','1');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'admin','$wp$2y$10$AuDKJAo8botjTPf191hoNe7rwfvLuiycZoaLXR64i650doRcnbUm2','admin','admin@example.com','https://ketapang.pawandigital.id','2026-11-21 01:26:27','',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-21  3:21:37

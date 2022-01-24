-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                5.7.24 - MySQL Community Server (GPL)
-- Server-OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumpar struktur för tabell base-installation.wp_commentmeta
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_commentmeta: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_comments
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_comments: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_draft_submissions
CREATE TABLE IF NOT EXISTS `wp_gf_draft_submissions` (
  `uuid` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `submission` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_draft_submissions: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_draft_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_draft_submissions` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_entry
CREATE TABLE IF NOT EXISTS `wp_gf_entry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_agent` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `currency` varchar(5) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `form_id_status` (`form_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_entry: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_entry` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_entry_meta
CREATE TABLE IF NOT EXISTS `wp_gf_entry_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `entry_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  `item_index` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `entry_id` (`entry_id`),
  KEY `meta_value` (`meta_value`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_entry_meta: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_entry_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_entry_meta` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_entry_notes
CREATE TABLE IF NOT EXISTS `wp_gf_entry_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci,
  `note_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sub_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `entry_user_key` (`entry_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_entry_notes: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_entry_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_entry_notes` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_form
CREATE TABLE IF NOT EXISTS `wp_gf_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_form: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_form` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_form_meta
CREATE TABLE IF NOT EXISTS `wp_gf_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `entries_grid_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `confirmations` longtext COLLATE utf8mb4_unicode_520_ci,
  `notifications` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_form_meta: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_form_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_form_meta` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_form_revisions
CREATE TABLE IF NOT EXISTS `wp_gf_form_revisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_form_revisions: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_form_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_form_revisions` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_gf_form_view
CREATE TABLE IF NOT EXISTS `wp_gf_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_gf_form_view: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_gf_form_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gf_form_view` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_links
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_links: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_options
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_options: ~176 rows (ungefär)
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
	(1, 'siteurl', 'http://base-installation.awave.site', 'yes'),
	(2, 'home', 'http://base-installation.awave.site', 'yes'),
	(3, 'blogname', 'Base theme', 'yes'),
	(4, 'blogdescription', '', 'yes'),
	(5, 'users_can_register', '0', 'yes'),
	(6, 'admin_email', 'wpsupport@awave.com', 'yes'),
	(7, 'start_of_week', '1', 'yes'),
	(8, 'use_balanceTags', '0', 'yes'),
	(9, 'use_smilies', '1', 'yes'),
	(10, 'require_name_email', '1', 'yes'),
	(11, 'comments_notify', '1', 'yes'),
	(12, 'posts_per_rss', '10', 'yes'),
	(13, 'rss_use_excerpt', '0', 'yes'),
	(14, 'mailserver_url', 'mail.example.com', 'yes'),
	(15, 'mailserver_login', 'login@example.com', 'yes'),
	(16, 'mailserver_pass', 'password', 'yes'),
	(17, 'mailserver_port', '110', 'yes'),
	(18, 'default_category', '1', 'yes'),
	(19, 'default_comment_status', 'open', 'yes'),
	(20, 'default_ping_status', 'open', 'yes'),
	(21, 'default_pingback_flag', '0', 'yes'),
	(22, 'posts_per_page', '10', 'yes'),
	(23, 'date_format', 'F j, Y', 'yes'),
	(24, 'time_format', 'g:i a', 'yes'),
	(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
	(26, 'comment_moderation', '0', 'yes'),
	(27, 'moderation_notify', '1', 'yes'),
	(28, 'permalink_structure', '/%postname%/', 'yes'),
	(30, 'hack_file', '0', 'yes'),
	(31, 'blog_charset', 'UTF-8', 'yes'),
	(32, 'moderation_keys', '', 'no'),
	(33, 'active_plugins', 'a:7:{i:0;s:29:"gravityforms/gravityforms.php";i:1;s:37:"acf-header-field/acf-header-field.php";i:2;s:34:"advanced-custom-fields-pro/acf.php";i:3;s:41:"awave-color-scheme/awave-color-scheme.php";i:4;s:31:"cookie-notice/cookie-notice.php";i:5;s:24:"wordpress-seo/wp-seo.php";i:6;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
	(34, 'category_base', '', 'yes'),
	(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
	(36, 'comment_max_links', '2', 'yes'),
	(37, 'gmt_offset', '0', 'yes'),
	(38, 'default_email_category', '1', 'yes'),
	(39, 'recently_edited', 'a:2:{i:0;s:59:"C:\\WORK\\test\\wp/wp-content/themes/awave-gutenberg/style.css";i:1;s:0:"";}', 'no'),
	(40, 'template', 'awave-gutenberg', 'yes'),
	(41, 'stylesheet', 'awave-gutenberg', 'yes'),
	(42, 'comment_whitelist', '1', 'yes'),
	(43, 'blacklist_keys', '', 'no'),
	(44, 'comment_registration', '0', 'yes'),
	(45, 'html_type', 'text/html', 'yes'),
	(46, 'use_trackback', '0', 'yes'),
	(47, 'default_role', 'subscriber', 'yes'),
	(48, 'db_version', '44719', 'yes'),
	(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
	(50, 'upload_path', '', 'yes'),
	(51, 'blog_public', '0', 'yes'),
	(52, 'default_link_category', '2', 'yes'),
	(53, 'show_on_front', 'page', 'yes'),
	(54, 'tag_base', '', 'yes'),
	(55, 'show_avatars', '1', 'yes'),
	(56, 'avatar_rating', 'G', 'yes'),
	(57, 'upload_url_path', '', 'yes'),
	(58, 'thumbnail_size_w', '150', 'yes'),
	(59, 'thumbnail_size_h', '150', 'yes'),
	(60, 'thumbnail_crop', '1', 'yes'),
	(61, 'medium_size_w', '300', 'yes'),
	(62, 'medium_size_h', '300', 'yes'),
	(63, 'avatar_default', 'mystery', 'yes'),
	(64, 'large_size_w', '1024', 'yes'),
	(65, 'large_size_h', '1024', 'yes'),
	(66, 'image_default_link_type', 'none', 'yes'),
	(67, 'image_default_size', '', 'yes'),
	(68, 'image_default_align', '', 'yes'),
	(69, 'close_comments_for_old_posts', '0', 'yes'),
	(70, 'close_comments_days_old', '14', 'yes'),
	(71, 'thread_comments', '1', 'yes'),
	(72, 'thread_comments_depth', '5', 'yes'),
	(73, 'page_comments', '0', 'yes'),
	(74, 'comments_per_page', '50', 'yes'),
	(75, 'default_comments_page', 'newest', 'yes'),
	(76, 'comment_order', 'asc', 'yes'),
	(77, 'sticky_posts', 'a:0:{}', 'yes'),
	(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
	(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
	(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
	(81, 'uninstall_plugins', 'a:1:{s:27:"autoptimize/autoptimize.php";s:29:"autoptimizeMain::on_uninstall";}', 'no'),
	(82, 'timezone_string', '', 'yes'),
	(83, 'page_for_posts', '0', 'yes'),
	(84, 'page_on_front', '2', 'yes'),
	(85, 'default_post_format', '0', 'yes'),
	(86, 'link_manager_enabled', '0', 'yes'),
	(87, 'finished_splitting_shared_terms', '1', 'yes'),
	(88, 'site_icon', '0', 'yes'),
	(89, 'medium_large_size_w', '768', 'yes'),
	(90, 'medium_large_size_h', '0', 'yes'),
	(91, 'wp_page_for_privacy_policy', '3', 'yes'),
	(92, 'show_comments_cookies_opt_in', '1', 'yes'),
	(93, 'initial_db_version', '44719', 'yes'),
	(94, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:20:"wpseo_manage_options";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:13:"wpseo_manager";a:2:{s:4:"name";s:11:"SEO Manager";s:12:"capabilities";a:37:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;s:28:"wpseo_edit_advanced_metadata";b:1;s:20:"wpseo_manage_options";b:1;}}s:12:"wpseo_editor";a:2:{s:4:"name";s:10:"SEO Editor";s:12:"capabilities";a:36:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;s:28:"wpseo_edit_advanced_metadata";b:1;}}}', 'yes'),
	(95, 'fresh_site', '0', 'yes'),
	(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
	(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
	(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
	(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
	(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
	(101, 'sidebars_widgets', 'a:2:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
	(102, 'cron', 'a:9:{i:1565963592;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1565981592;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1565982006;a:1:{s:15:"ao_cachechecker";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1566024792;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1566024800;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1566024801;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1566025206;a:1:{s:19:"wpseo-reindex-links";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1566025213;a:1:{s:17:"gravityforms_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
	(103, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(104, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(105, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(106, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(107, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(108, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(109, 'nonce_key', '[!g#9;L+I;xA-y[eXe*1T$6Lr5wKf`{3d>Y!F)<]dWw}|a6 =OZ.T*hynAI<;e`]', 'no'),
	(110, 'nonce_salt', 'sfsomm5bnl7W[1*Bcyc{[{Zp|,=j,DxK%rPU56yi>BCIa9sCsOCS`-0-XU,f7BT2', 'no'),
	(111, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(112, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(113, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(115, 'recovery_keys', 'a:0:{}', 'yes'),
	(123, 'auth_key', 'xJk`93 t]6(TSC;Wx(/.,B|U~m#6S< e$RI,ef@M9a~~NfwIJL?uL+)5qTZaO}RZ', 'no'),
	(124, 'auth_salt', 'eABGwGrrLGzL%]eMELz]4.9L3(q~>T_@bN_W&i=G^M1D)DPXOwuh7^)e14Nn]qvn', 'no'),
	(125, 'logged_in_key', 'a}T}MK6p!a;;+500K&|FT?-z+}Pn7d9|%4^M*xxve(xk&=SlrXa1i>&hVhcMfZ&i', 'no'),
	(126, 'logged_in_salt', '63U`Q2x939^=dxlIaeOL(!ceG|IYt3qgt8G*dv?g&hOh&U=o8Mknym@-QLJi,X<-', 'no'),
	(132, 'can_compress_scripts', '0', 'no'),
	(147, 'recently_activated', 'a:0:{}', 'yes'),
	(148, 'theme_mods_twentynineteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1557903270;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
	(149, 'current_theme', 'Awave Flexible Clean', 'yes'),
	(150, 'theme_mods_awave-gutenberg', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;}', 'yes'),
	(151, 'theme_switched', '', 'yes'),
	(162, 'cookie_notice_options', 'a:24:{s:8:"position";s:6:"bottom";s:12:"message_text";s:153:"We use cookies to ensure that we give you the best experience on our website. If you continue to use this site we will assume that you are happy with it.";s:9:"css_style";s:9:"bootstrap";s:9:"css_class";s:6:"button";s:11:"accept_text";s:2:"Ok";s:11:"refuse_text";s:2:"No";s:10:"refuse_opt";s:2:"no";s:11:"refuse_code";s:0:"";s:16:"refuse_code_head";s:0:"";s:14:"revoke_cookies";b:0;s:18:"revoke_cookies_opt";s:9:"automatic";s:11:"revoke_text";s:14:"Revoke cookies";s:11:"redirection";b:0;s:8:"see_more";s:2:"no";s:11:"link_target";s:6:"_blank";s:4:"time";s:5:"month";s:11:"hide_effect";s:4:"fade";s:9:"on_scroll";b:0;s:16:"on_scroll_offset";i:100;s:6:"colors";a:2:{s:4:"text";s:4:"#fff";s:3:"bar";s:4:"#000";}s:12:"see_more_opt";a:5:{s:4:"text";s:14:"Privacy policy";s:9:"link_type";s:4:"page";s:2:"id";s:5:"empty";s:4:"link";s:0:"";s:4:"sync";b:0;}s:16:"script_placement";s:6:"header";s:9:"translate";b:0;s:19:"deactivation_delete";s:2:"no";}', 'no'),
	(163, 'cookie_notice_version', '1.2.46', 'no'),
	(164, 'gf_db_version', '2.4.11', 'no'),
	(165, 'rg_form_version', '2.4.11', 'yes'),
	(166, 'gform_enable_background_updates', '1', 'yes'),
	(167, 'gform_pending_installation', '', 'yes'),
	(168, 'wpseo', 'a:20:{s:15:"ms_defaults_set";b:0;s:7:"version";s:4:"11.8";s:20:"disableadvanced_meta";b:1;s:19:"onpage_indexability";b:1;s:11:"baiduverify";s:0:"";s:12:"googleverify";s:0:"";s:8:"msverify";s:0:"";s:12:"yandexverify";s:0:"";s:9:"site_type";s:0:"";s:20:"has_multiple_authors";s:0:"";s:16:"environment_type";s:0:"";s:23:"content_analysis_active";b:1;s:23:"keyword_analysis_active";b:1;s:21:"enable_admin_bar_menu";b:1;s:26:"enable_cornerstone_content";b:1;s:18:"enable_xml_sitemap";b:1;s:24:"enable_text_link_counter";b:1;s:22:"show_onboarding_notice";b:1;s:18:"first_activated_on";i:1557903606;s:13:"myyoast-oauth";b:0;}', 'yes'),
	(169, 'wpseo_titles', 'a:68:{s:10:"title_test";i:0;s:17:"forcerewritetitle";b:0;s:9:"separator";s:7:"sc-dash";s:16:"title-home-wpseo";s:42:"%%sitename%% %%page%% %%sep%% %%sitedesc%%";s:18:"title-author-wpseo";s:41:"%%name%%, Author at %%sitename%% %%page%%";s:19:"title-archive-wpseo";s:38:"%%date%% %%page%% %%sep%% %%sitename%%";s:18:"title-search-wpseo";s:63:"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%";s:15:"title-404-wpseo";s:35:"Page not found %%sep%% %%sitename%%";s:19:"metadesc-home-wpseo";s:0:"";s:21:"metadesc-author-wpseo";s:0:"";s:22:"metadesc-archive-wpseo";s:0:"";s:9:"rssbefore";s:0:"";s:8:"rssafter";s:53:"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.";s:20:"noindex-author-wpseo";b:0;s:28:"noindex-author-noposts-wpseo";b:1;s:21:"noindex-archive-wpseo";b:1;s:14:"disable-author";b:1;s:12:"disable-date";b:1;s:19:"disable-post_format";b:0;s:18:"disable-attachment";b:1;s:23:"is-media-purge-relevant";b:0;s:20:"breadcrumbs-404crumb";s:25:"Error 404: Page not found";s:29:"breadcrumbs-display-blog-page";b:0;s:20:"breadcrumbs-boldlast";b:0;s:25:"breadcrumbs-archiveprefix";s:12:"Archives for";s:18:"breadcrumbs-enable";b:0;s:16:"breadcrumbs-home";s:4:"Home";s:18:"breadcrumbs-prefix";s:0:"";s:24:"breadcrumbs-searchprefix";s:16:"You searched for";s:15:"breadcrumbs-sep";s:2:"»";s:12:"website_name";s:0:"";s:11:"person_name";s:0:"";s:22:"alternate_website_name";s:0:"";s:12:"company_logo";s:0:"";s:12:"company_name";s:0:"";s:17:"company_or_person";s:7:"company";s:25:"company_or_person_user_id";b:0;s:17:"stripcategorybase";b:0;s:10:"title-post";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-post";s:0:"";s:12:"noindex-post";b:0;s:13:"showdate-post";b:0;s:23:"display-metabox-pt-post";b:1;s:23:"post_types-post-maintax";i:0;s:10:"title-page";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-page";s:0:"";s:12:"noindex-page";b:0;s:13:"showdate-page";b:0;s:23:"display-metabox-pt-page";b:1;s:23:"post_types-page-maintax";s:1:"0";s:16:"title-attachment";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:19:"metadesc-attachment";s:0:"";s:18:"noindex-attachment";b:0;s:19:"showdate-attachment";b:0;s:29:"display-metabox-pt-attachment";b:1;s:29:"post_types-attachment-maintax";s:1:"0";s:18:"title-tax-category";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-category";s:0:"";s:28:"display-metabox-tax-category";b:1;s:20:"noindex-tax-category";b:0;s:18:"title-tax-post_tag";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-post_tag";s:0:"";s:28:"display-metabox-tax-post_tag";b:1;s:20:"noindex-tax-post_tag";b:0;s:21:"title-tax-post_format";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-post_format";s:0:"";s:31:"display-metabox-tax-post_format";b:0;s:23:"noindex-tax-post_format";b:1;}', 'yes'),
	(170, 'wpseo_social', 'a:19:{s:13:"facebook_site";s:0:"";s:13:"instagram_url";s:0:"";s:12:"linkedin_url";s:0:"";s:11:"myspace_url";s:0:"";s:16:"og_default_image";s:0:"";s:19:"og_default_image_id";s:0:"";s:18:"og_frontpage_title";s:0:"";s:17:"og_frontpage_desc";s:0:"";s:18:"og_frontpage_image";s:0:"";s:21:"og_frontpage_image_id";s:0:"";s:9:"opengraph";b:1;s:13:"pinterest_url";s:0:"";s:15:"pinterestverify";s:0:"";s:7:"twitter";b:1;s:12:"twitter_site";s:0:"";s:17:"twitter_card_type";s:19:"summary_large_image";s:11:"youtube_url";s:0:"";s:13:"wikipedia_url";s:0:"";s:10:"fbadminapp";s:0:"";}', 'yes'),
	(171, 'wpseo_flush_rewrite', '1', 'yes'),
	(172, 'autoptimize_version', '2.5.0', 'yes'),
	(173, 'autoptimize_service_availablity', 'a:2:{s:12:"extra_imgopt";a:3:{s:6:"status";s:2:"up";s:5:"hosts";a:1:{i:1;s:26:"https://cdn.shortpixel.ai/";}s:16:"launch-threshold";s:4:"4096";}s:7:"critcss";a:2:{s:6:"status";s:2:"up";s:5:"hosts";a:1:{i:1;s:24:"https://criticalcss.com/";}}}', 'yes'),
	(179, 'widget_gform_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
	(181, 'gravityformsaddon_gravityformswebapi_version', '1.0', 'yes'),
	(182, 'gform_version_info', 'a:10:{s:12:"is_valid_key";b:1;s:6:"reason";s:0:"";s:7:"version";s:6:"2.4.11";s:3:"url";s:170:"https://s3.amazonaws.com/gravityforms/releases/gravityforms_2.4.11.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Wl52p%2F9xnJGaiPNntXxXt9LAb%2F8%3D";s:15:"expiration_time";i:1595260800;s:9:"offerings";a:53:{s:12:"gravityforms";a:5:{s:12:"is_available";b:1;s:7:"version";s:6:"2.4.11";s:14:"version_latest";s:8:"2.4.11.4";s:3:"url";s:170:"https://s3.amazonaws.com/gravityforms/releases/gravityforms_2.4.11.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Wl52p%2F9xnJGaiPNntXxXt9LAb%2F8%3D";s:10:"url_latest";s:168:"https://s3.amazonaws.com/gravityforms/releases/gravityforms_2.4.11.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=G9PTGqx8j04KOFGiioBKhfutC4U%3D";}s:21:"gravityforms2checkout";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.0";s:14:"version_latest";s:3:"1.0";s:3:"url";s:182:"https://s3.amazonaws.com/gravityforms/addons/2checkout/gravityforms2checkout_1.0.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=WlhNe%2F5lWrc53kUZO22GjtOuEV8%3D";s:10:"url_latest";s:182:"https://s3.amazonaws.com/gravityforms/addons/2checkout/gravityforms2checkout_1.0.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=WlhNe%2F5lWrc53kUZO22GjtOuEV8%3D";}s:26:"gravityformsactivecampaign";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.6";s:14:"version_latest";s:3:"1.6";s:3:"url";s:194:"https://s3.amazonaws.com/gravityforms/addons/activecampaign/gravityformsactivecampaign_1.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=b%2FmMyQDOm18br5e%2FkK1c13z0tFQ%3D";s:10:"url_latest";s:194:"https://s3.amazonaws.com/gravityforms/addons/activecampaign/gravityformsactivecampaign_1.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=b%2FmMyQDOm18br5e%2FkK1c13z0tFQ%3D";}s:32:"gravityformsadvancedpostcreation";a:5:{s:12:"is_available";b:1;s:7:"version";s:10:"1.0-beta-3";s:14:"version_latest";s:10:"1.0-beta-3";s:3:"url";s:209:"https://s3.amazonaws.com/gravityforms/addons/advancedpostcreation/gravityformsadvancedpostcreation_1.0-beta-3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=cOQgiApkjq9qoPkLxQ98UO7hl10%3D";s:10:"url_latest";s:209:"https://s3.amazonaws.com/gravityforms/addons/advancedpostcreation/gravityformsadvancedpostcreation_1.0-beta-3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=cOQgiApkjq9qoPkLxQ98UO7hl10%3D";}s:20:"gravityformsagilecrm";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:178:"https://s3.amazonaws.com/gravityforms/addons/agilecrm/gravityformsagilecrm_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=sO65APGFashtWmFpZPQsvZKf8HI%3D";s:10:"url_latest";s:178:"https://s3.amazonaws.com/gravityforms/addons/agilecrm/gravityformsagilecrm_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=sO65APGFashtWmFpZPQsvZKf8HI%3D";}s:24:"gravityformsauthorizenet";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.7";s:14:"version_latest";s:3:"2.7";s:3:"url";s:190:"https://s3.amazonaws.com/gravityforms/addons/authorizenet/gravityformsauthorizenet_2.7.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=QYkPMFrsUMTUej%2F1wOs6M%2BXfH1U%3D";s:10:"url_latest";s:190:"https://s3.amazonaws.com/gravityforms/addons/authorizenet/gravityformsauthorizenet_2.7.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=QYkPMFrsUMTUej%2F1wOs6M%2BXfH1U%3D";}s:18:"gravityformsaweber";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.9";s:14:"version_latest";s:3:"2.9";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/aweber/gravityformsaweber_2.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=UAqPwab5Jqdn4Bh%2Bwsz00BRwiXQ%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/aweber/gravityformsaweber_2.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=UAqPwab5Jqdn4Bh%2Bwsz00BRwiXQ%3D";}s:21:"gravityformsbatchbook";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:182:"https://s3.amazonaws.com/gravityforms/addons/batchbook/gravityformsbatchbook_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=WCO%2FiCsjC3IyeMuDBcMFsKRrDrQ%3D";s:10:"url_latest";s:182:"https://s3.amazonaws.com/gravityforms/addons/batchbook/gravityformsbatchbook_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=WCO%2FiCsjC3IyeMuDBcMFsKRrDrQ%3D";}s:18:"gravityformsbreeze";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/breeze/gravityformsbreeze_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=fe00j%2BXJCgzfGMpbH4XReq0AJyE%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/breeze/gravityformsbreeze_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=fe00j%2BXJCgzfGMpbH4XReq0AJyE%3D";}s:27:"gravityformscampaignmonitor";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.7";s:14:"version_latest";s:3:"3.7";s:3:"url";s:194:"https://s3.amazonaws.com/gravityforms/addons/campaignmonitor/gravityformscampaignmonitor_3.7.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=6Hmn0%2BDAHO7f3ZMri7UlQ2YdzmU%3D";s:10:"url_latest";s:194:"https://s3.amazonaws.com/gravityforms/addons/campaignmonitor/gravityformscampaignmonitor_3.7.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=6Hmn0%2BDAHO7f3ZMri7UlQ2YdzmU%3D";}s:20:"gravityformscampfire";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.1";s:14:"version_latest";s:5:"1.2.2";s:3:"url";s:182:"https://s3.amazonaws.com/gravityforms/addons/campfire/gravityformscampfire_1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=%2BYN61TINSXH%2F71ZRyPcENbmBovs%3D";s:10:"url_latest";s:182:"https://s3.amazonaws.com/gravityforms/addons/campfire/gravityformscampfire_1.2.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Jo1inHJwJRvGRTAijwqual%2F7oYY%3D";}s:22:"gravityformscapsulecrm";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:5:"1.3.1";s:3:"url";s:184:"https://s3.amazonaws.com/gravityforms/addons/capsulecrm/gravityformscapsulecrm_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=q%2BfRHV4m1sFGULvcB6eMo95mAxc%3D";s:10:"url_latest";s:186:"https://s3.amazonaws.com/gravityforms/addons/capsulecrm/gravityformscapsulecrm_1.3.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=eqFB%2FLRHGvFg1RpXR4nVvOjqanI%3D";}s:26:"gravityformschainedselects";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:190:"https://s3.amazonaws.com/gravityforms/addons/chainedselects/gravityformschainedselects_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=NdbMfrdiUogTrjEtXBsMmJylwnw%3D";s:10:"url_latest";s:190:"https://s3.amazonaws.com/gravityforms/addons/chainedselects/gravityformschainedselects_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=NdbMfrdiUogTrjEtXBsMmJylwnw%3D";}s:23:"gravityformscleverreach";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.5";s:14:"version_latest";s:5:"1.5.1";s:3:"url";s:184:"https://s3.amazonaws.com/gravityforms/addons/cleverreach/gravityformscleverreach_1.5.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=QcwY7aGFu6zmLJ6roHdtbdkFeAU%3D";s:10:"url_latest";s:190:"https://s3.amazonaws.com/gravityforms/addons/cleverreach/gravityformscleverreach_1.5.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=eh4l%2FZITulJdiApDO2mt3%2FPCjGc%3D";}s:27:"gravityformsconstantcontact";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.0";s:14:"version_latest";s:3:"1.1";s:3:"url";s:192:"https://s3.amazonaws.com/gravityforms/addons/constantcontact/gravityformsconstantcontact_1.0.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=5VhOD6w8FmKf7aMW15958Me8rtE%3D";s:10:"url_latest";s:194:"https://s3.amazonaws.com/gravityforms/addons/constantcontact/gravityformsconstantcontact_1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=oiWpjE5%2F7zuxMlYMrZjgKNuNa8A%3D";}s:19:"gravityformscoupons";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.9";s:14:"version_latest";s:3:"2.9";s:3:"url";s:178:"https://s3.amazonaws.com/gravityforms/addons/coupons/gravityformscoupons_2.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Ba6mAwTXUtN96HxxLYu%2FCsQw4v8%3D";s:10:"url_latest";s:178:"https://s3.amazonaws.com/gravityforms/addons/coupons/gravityformscoupons_2.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Ba6mAwTXUtN96HxxLYu%2FCsQw4v8%3D";}s:17:"gravityformsdebug";a:5:{s:12:"is_available";b:1;s:7:"version";s:0:"";s:14:"version_latest";s:10:"1.0.beta11";s:3:"url";s:0:"";s:10:"url_latest";s:181:"https://s3.amazonaws.com/gravityforms/addons/debug/gravityformsdebug_1.0.beta11.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=lZg5%2FJ2ZvuuF5YyEO0rfXxlkfss%3D";}s:19:"gravityformsdropbox";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.4";s:14:"version_latest";s:3:"2.4";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/dropbox/gravityformsdropbox_2.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=LFPgXuTLnvw5LvhpbI7uWmXwu4M%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/dropbox/gravityformsdropbox_2.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=LFPgXuTLnvw5LvhpbI7uWmXwu4M%3D";}s:16:"gravityformsemma";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.5";s:3:"url";s:170:"https://s3.amazonaws.com/gravityforms/addons/emma/gravityformsemma_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=L1gNNpLpnizrCwe21iFnx9rMsHc%3D";s:10:"url_latest";s:172:"https://s3.amazonaws.com/gravityforms/addons/emma/gravityformsemma_1.2.5.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=G9MYmoiwhs9HW1Cq6t6uq6yq9qE%3D";}s:22:"gravityformsfreshbooks";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.6";s:14:"version_latest";s:3:"2.6";s:3:"url";s:184:"https://s3.amazonaws.com/gravityforms/addons/freshbooks/gravityformsfreshbooks_2.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=q8GMTmIoJolSF%2BVFx0IMOugXiEE%3D";s:10:"url_latest";s:184:"https://s3.amazonaws.com/gravityforms/addons/freshbooks/gravityformsfreshbooks_2.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=q8GMTmIoJolSF%2BVFx0IMOugXiEE%3D";}s:23:"gravityformsgetresponse";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:184:"https://s3.amazonaws.com/gravityforms/addons/getresponse/gravityformsgetresponse_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=U9PelJ9beTCzzdq36rQEys5I3rw%3D";s:10:"url_latest";s:184:"https://s3.amazonaws.com/gravityforms/addons/getresponse/gravityformsgetresponse_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=U9PelJ9beTCzzdq36rQEys5I3rw%3D";}s:21:"gravityformsgutenberg";a:5:{s:12:"is_available";b:1;s:7:"version";s:10:"1.0-rc-1.4";s:14:"version_latest";s:10:"1.0-rc-1.4";s:3:"url";s:189:"https://s3.amazonaws.com/gravityforms/addons/gutenberg/gravityformsgutenberg_1.0-rc-1.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=xkThsv0w0zAHMJymJ0J4W%2FFhd9w%3D";s:10:"url_latest";s:189:"https://s3.amazonaws.com/gravityforms/addons/gutenberg/gravityformsgutenberg_1.0-rc-1.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=xkThsv0w0zAHMJymJ0J4W%2FFhd9w%3D";}s:21:"gravityformshelpscout";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.8";s:14:"version_latest";s:5:"1.9.1";s:3:"url";s:182:"https://s3.amazonaws.com/gravityforms/addons/helpscout/gravityformshelpscout_1.8.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=JMv5w0r%2BtSKjRpDbGQggrlkeJL0%3D";s:10:"url_latest";s:188:"https://s3.amazonaws.com/gravityforms/addons/helpscout/gravityformshelpscout_1.9.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=UOECLs%2FDxIWDXxCQe%2Byj%2FA8zZeI%3D";}s:20:"gravityformshighrise";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:180:"https://s3.amazonaws.com/gravityforms/addons/highrise/gravityformshighrise_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=RoDHEak%2FrF79YHXrqHrFWFmvvko%3D";s:10:"url_latest";s:180:"https://s3.amazonaws.com/gravityforms/addons/highrise/gravityformshighrise_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=RoDHEak%2FrF79YHXrqHrFWFmvvko%3D";}s:19:"gravityformshipchat";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/hipchat/gravityformshipchat_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=bCnq3lI8rgge6JSjeIXXcmLLgQ8%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/hipchat/gravityformshipchat_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=bCnq3lI8rgge6JSjeIXXcmLLgQ8%3D";}s:19:"gravityformshubspot";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.1";s:14:"version_latest";s:3:"1.1";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/hubspot/gravityformshubspot_1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=rPNyu7qDss68glVjlYjVbdwhVLA%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/hubspot/gravityformshubspot_1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=rPNyu7qDss68glVjlYjVbdwhVLA%3D";}s:20:"gravityformsicontact";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:5:"1.3.1";s:3:"url";s:178:"https://s3.amazonaws.com/gravityforms/addons/icontact/gravityformsicontact_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=dWsGM9OgzIK7NyxvnsOB2cfkCoU%3D";s:10:"url_latest";s:180:"https://s3.amazonaws.com/gravityforms/addons/icontact/gravityformsicontact_1.3.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=nsHxAw8BORkKfNKEZuV5IwYkJn4%3D";}s:19:"gravityformslogging";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:5:"1.3.1";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/logging/gravityformslogging_1.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=BbpBhSnk1MBSy77OmMXGx3YqesA%3D";s:10:"url_latest";s:178:"https://s3.amazonaws.com/gravityforms/addons/logging/gravityformslogging_1.3.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=oCcSsrNZZvasjJcCAsvlBwAYgy8%3D";}s:19:"gravityformsmadmimi";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/madmimi/gravityformsmadmimi_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=NlAW6hpSPJhO3APg2UElKB90z4E%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/madmimi/gravityformsmadmimi_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=NlAW6hpSPJhO3APg2UElKB90z4E%3D";}s:21:"gravityformsmailchimp";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"4.6";s:14:"version_latest";s:5:"4.6.3";s:3:"url";s:182:"https://s3.amazonaws.com/gravityforms/addons/mailchimp/gravityformsmailchimp_4.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=2lBZmUfYC30yidWkVPOO%2FWSUJRQ%3D";s:10:"url_latest";s:182:"https://s3.amazonaws.com/gravityforms/addons/mailchimp/gravityformsmailchimp_4.6.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Soqv2bnmluAdMOKLOaUR63iDORE%3D";}s:19:"gravityformsmailgun";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.1";s:14:"version_latest";s:5:"1.1.2";s:3:"url";s:178:"https://s3.amazonaws.com/gravityforms/addons/mailgun/gravityformsmailgun_1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=sXkzmv3rdV5XzU2DkQV9%2Bge45eg%3D";s:10:"url_latest";s:180:"https://s3.amazonaws.com/gravityforms/addons/mailgun/gravityformsmailgun_1.1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Db8dwzR1kwmMfE0Cs%2F3fDQi7sVE%3D";}s:26:"gravityformspartialentries";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.4";s:14:"version_latest";s:3:"1.4";s:3:"url";s:194:"https://s3.amazonaws.com/gravityforms/addons/partialentries/gravityformspartialentries_1.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=iSMj4UonEwHikIfV%2F%2FYvtNPv9jc%3D";s:10:"url_latest";s:194:"https://s3.amazonaws.com/gravityforms/addons/partialentries/gravityformspartialentries_1.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=iSMj4UonEwHikIfV%2F%2FYvtNPv9jc%3D";}s:18:"gravityformspaypal";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.2";s:14:"version_latest";s:3:"3.2";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/paypal/gravityformspaypal_3.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=CLRmI3%2FsGCt3uiYNavg0zKnWkiE%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/paypal/gravityformspaypal_3.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=CLRmI3%2FsGCt3uiYNavg0zKnWkiE%3D";}s:33:"gravityformspaypalexpresscheckout";a:3:{s:12:"is_available";b:0;s:7:"version";s:0:"";s:14:"version_latest";N;}s:29:"gravityformspaypalpaymentspro";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.4";s:14:"version_latest";s:3:"2.4";s:3:"url";s:200:"https://s3.amazonaws.com/gravityforms/addons/paypalpaymentspro/gravityformspaypalpaymentspro_2.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=iUc2gsiUltCBZ%2FBU%2FAsp9XQB7cU%3D";s:10:"url_latest";s:200:"https://s3.amazonaws.com/gravityforms/addons/paypalpaymentspro/gravityformspaypalpaymentspro_2.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=iUc2gsiUltCBZ%2FBU%2FAsp9XQB7cU%3D";}s:21:"gravityformspaypalpro";a:5:{s:12:"is_available";b:1;s:7:"version";s:5:"1.8.1";s:14:"version_latest";s:5:"1.8.2";s:3:"url";s:186:"https://s3.amazonaws.com/gravityforms/addons/paypalpro/gravityformspaypalpro_1.8.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=Bo4UKWx6rM36Fh%2BCp6C%2Bi8iTWjk%3D";s:10:"url_latest";s:184:"https://s3.amazonaws.com/gravityforms/addons/paypalpro/gravityformspaypalpro_1.8.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=ngZf84mDx2D3DX%2FaxZbl12BiGH0%3D";}s:20:"gravityformspicatcha";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"2.0";s:14:"version_latest";s:3:"2.0";}s:16:"gravityformspipe";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.1";s:14:"version_latest";s:5:"1.1.1";s:3:"url";s:170:"https://s3.amazonaws.com/gravityforms/addons/pipe/gravityformspipe_1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=oB9mFTV4zwaN11YQUSRbjMP8DPE%3D";s:10:"url_latest";s:172:"https://s3.amazonaws.com/gravityforms/addons/pipe/gravityformspipe_1.1.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=E2ybEgOo4LghXrbVXti00s2nfzo%3D";}s:17:"gravityformspolls";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.4";s:14:"version_latest";s:3:"3.4";s:3:"url";s:172:"https://s3.amazonaws.com/gravityforms/addons/polls/gravityformspolls_3.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=m0cBdWZpWrg2bXXBJTR5Ksf7MBY%3D";s:10:"url_latest";s:172:"https://s3.amazonaws.com/gravityforms/addons/polls/gravityformspolls_3.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=m0cBdWZpWrg2bXXBJTR5Ksf7MBY%3D";}s:20:"gravityformspostmark";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.0";s:14:"version_latest";s:5:"1.0.1";s:3:"url";s:182:"https://s3.amazonaws.com/gravityforms/addons/postmark/gravityformspostmark_1.0.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=8AnQ%2BC5CJXwWGUCR0JTVD%2FnME3k%3D";s:10:"url_latest";s:184:"https://s3.amazonaws.com/gravityforms/addons/postmark/gravityformspostmark_1.0.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=%2FBShjXcBOM5ekBJItEHUAf%2FFKDU%3D";}s:16:"gravityformsquiz";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.2";s:14:"version_latest";s:3:"3.2";s:3:"url";s:174:"https://s3.amazonaws.com/gravityforms/addons/quiz/gravityformsquiz_3.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=LvplkuoECofa%2BLuqeE%2BW2I5xfd4%3D";s:10:"url_latest";s:174:"https://s3.amazonaws.com/gravityforms/addons/quiz/gravityformsquiz_3.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=LvplkuoECofa%2BLuqeE%2BW2I5xfd4%3D";}s:19:"gravityformsrestapi";a:5:{s:12:"is_available";b:1;s:7:"version";s:10:"2.0-beta-2";s:14:"version_latest";s:10:"2.0-beta-2";s:3:"url";s:185:"https://s3.amazonaws.com/gravityforms/addons/restapi/gravityformsrestapi_2.0-beta-2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=%2FndtUdXicUTQdrf0W7E7XJtqNT4%3D";s:10:"url_latest";s:185:"https://s3.amazonaws.com/gravityforms/addons/restapi/gravityformsrestapi_2.0-beta-2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=%2FndtUdXicUTQdrf0W7E7XJtqNT4%3D";}s:20:"gravityformssendgrid";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.1";s:3:"url";s:180:"https://s3.amazonaws.com/gravityforms/addons/sendgrid/gravityformssendgrid_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=x5xe2Nbq%2Br6usM8GT17B8AjFoHw%3D";s:10:"url_latest";s:182:"https://s3.amazonaws.com/gravityforms/addons/sendgrid/gravityformssendgrid_1.2.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=2yhdb502AZKbPZaESuSpCh%2B200E%3D";}s:21:"gravityformssignature";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.8";s:14:"version_latest";s:3:"3.8";s:3:"url";s:180:"https://s3.amazonaws.com/gravityforms/addons/signature/gravityformssignature_3.8.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=3Q05jk9TuaERpfZkfJauzvTAXh8%3D";s:10:"url_latest";s:180:"https://s3.amazonaws.com/gravityforms/addons/signature/gravityformssignature_3.8.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=3Q05jk9TuaERpfZkfJauzvTAXh8%3D";}s:17:"gravityformsslack";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.9";s:14:"version_latest";s:3:"1.9";s:3:"url";s:174:"https://s3.amazonaws.com/gravityforms/addons/slack/gravityformsslack_1.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=BZRyX0JPDgM6CQcu7XFxQKtW%2BN8%3D";s:10:"url_latest";s:174:"https://s3.amazonaws.com/gravityforms/addons/slack/gravityformsslack_1.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=BZRyX0JPDgM6CQcu7XFxQKtW%2BN8%3D";}s:18:"gravityformsstripe";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.9";s:14:"version_latest";s:3:"2.9";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/stripe/gravityformsstripe_2.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=UIEX0a9MpgVxiCKJ%2FCXDS4v7700%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/stripe/gravityformsstripe_2.9.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=UIEX0a9MpgVxiCKJ%2FCXDS4v7700%3D";}s:18:"gravityformssurvey";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.4";s:14:"version_latest";s:3:"3.4";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/survey/gravityformssurvey_3.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=djjmG2lbqe8u%2B843js4ouhwvB30%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/survey/gravityformssurvey_3.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=djjmG2lbqe8u%2B843js4ouhwvB30%3D";}s:18:"gravityformstrello";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.3";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/trello/gravityformstrello_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=OPeOM1cO7h%2FLzTBi5Pwbwa3ZyhI%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/trello/gravityformstrello_1.2.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=pvkEBZ7utWrCCGl5m1D35dxq1FY%3D";}s:18:"gravityformstwilio";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.6";s:14:"version_latest";s:3:"2.6";s:3:"url";s:174:"https://s3.amazonaws.com/gravityforms/addons/twilio/gravityformstwilio_2.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=qrSCgIrZSkxaY73gdyhoLXa8zYU%3D";s:10:"url_latest";s:174:"https://s3.amazonaws.com/gravityforms/addons/twilio/gravityformstwilio_2.6.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=qrSCgIrZSkxaY73gdyhoLXa8zYU%3D";}s:28:"gravityformsuserregistration";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"4.3";s:14:"version_latest";s:3:"4.3";s:3:"url";s:196:"https://s3.amazonaws.com/gravityforms/addons/userregistration/gravityformsuserregistration_4.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=l%2F3Px1Owg0mZ4S9F99wsrZWE96c%3D";s:10:"url_latest";s:196:"https://s3.amazonaws.com/gravityforms/addons/userregistration/gravityformsuserregistration_4.3.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=l%2F3Px1Owg0mZ4S9F99wsrZWE96c%3D";}s:20:"gravityformswebhooks";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:178:"https://s3.amazonaws.com/gravityforms/addons/webhooks/gravityformswebhooks_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=YSPCrzsnkGCsdCwcUwSZbrNdJbk%3D";s:10:"url_latest";s:178:"https://s3.amazonaws.com/gravityforms/addons/webhooks/gravityformswebhooks_1.2.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=YSPCrzsnkGCsdCwcUwSZbrNdJbk%3D";}s:18:"gravityformszapier";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.1";s:14:"version_latest";s:5:"3.1.4";s:3:"url";s:176:"https://s3.amazonaws.com/gravityforms/addons/zapier/gravityformszapier_3.1.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=pXSR6ANLSjEa%2FPdsaxurbBc3gyU%3D";s:10:"url_latest";s:176:"https://s3.amazonaws.com/gravityforms/addons/zapier/gravityformszapier_3.1.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=WQueE907VxdDAj9qHm4AGU28pVg%3D";}s:19:"gravityformszohocrm";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.8";s:14:"version_latest";s:3:"1.8";s:3:"url";s:178:"https://s3.amazonaws.com/gravityforms/addons/zohocrm/gravityformszohocrm_1.8.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=cjgHTnjrKxgl3yoYkWBtkIh%2Fu4Y%3D";s:10:"url_latest";s:178:"https://s3.amazonaws.com/gravityforms/addons/zohocrm/gravityformszohocrm_1.8.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=cjgHTnjrKxgl3yoYkWBtkIh%2Fu4Y%3D";}}s:9:"is_active";s:1:"1";s:14:"version_latest";s:8:"2.4.11.4";s:10:"url_latest";s:168:"https://s3.amazonaws.com/gravityforms/releases/gravityforms_2.4.11.4.zip?AWSAccessKeyId=AKIAJC3LQNDWHBOFBQIA&Expires=1566130528&Signature=G9PTGqx8j04KOFGiioBKhfutC4U%3D";s:9:"timestamp";i:1565957729;}', 'yes'),
	(183, 'acf_version', '5.8.3', 'yes'),
	(185, 'autoptimize_imgopt_launched', 'on', 'yes'),
	(192, 'rg_gforms_key', '252967647e791a17308c0d4191d056ea', 'yes'),
	(193, 'gf_site_key', 'eaa05778-1056-4b62-8042-e3d789b1a54d', 'yes'),
	(194, 'gf_site_secret', '6692a086-4898-4233-853b-64a507a1b360', 'yes'),
	(195, 'gform_enable_noconflict', '1', 'yes'),
	(196, 'rg_gforms_enable_akismet', '1', 'yes'),
	(197, 'rg_gforms_currency', 'SEK', 'yes'),
	(201, 'gf_previous_db_version', '2.4.9', 'yes'),
	(202, 'gf_upgrade_lock', '', 'yes'),
	(203, 'gform_sticky_admin_messages', 'a:0:{}', 'yes'),
	(207, 'acf_pro_license', 'YToyOntzOjM6ImtleSI7czo3MjoiYjNKa1pYSmZhV1E5TmpRMU1qVjhkSGx3WlQxa1pYWmxiRzl3WlhKOFpHRjBaVDB5TURFMUxUQTVMVEU0SURFME9qRTFPakkxIjtzOjM6InVybCI7czozNToiaHR0cDovL2Jhc2UtaW5zdGFsbGF0aW9uLmF3YXZlLnNpdGUiO30=', 'yes'),
	(212, 'pand-d83e5fe4823f8f867dc30d3bb0b6c7de', '1568530875', 'no'),
	(226, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1565960802;}', 'no'),
	(373, 'WPLANG', '', 'yes'),
	(424, 'category_children', 'a:0:{}', 'yes'),
	(433, 'wpmdb_settings', 'a:12:{s:3:"key";s:40:"jJnemt3EzqLNXXXtp8BXkHk4NSuYV7MEmu8W2MAT";s:10:"allow_pull";b:0;s:10:"allow_push";b:0;s:8:"profiles";a:0:{}s:7:"licence";s:0:"";s:10:"verify_ssl";b:0;s:17:"whitelist_plugins";a:0:{}s:11:"max_request";i:1048576;s:22:"delay_between_requests";i:0;s:18:"prog_tables_hidden";b:1;s:21:"pause_before_finalize";b:0;s:14:"allow_tracking";N;}', 'no'),
	(434, '_transient_timeout_wpseo_link_table_inaccessible', '1597496843', 'no'),
	(435, '_transient_wpseo_link_table_inaccessible', '0', 'no'),
	(436, '_transient_timeout_wpseo_meta_table_inaccessible', '1597496843', 'no'),
	(437, '_transient_wpseo_meta_table_inaccessible', '0', 'no'),
	(443, '_site_transient_timeout_theme_roots', '1565962649', 'no'),
	(444, '_site_transient_theme_roots', 'a:1:{s:15:"awave-gutenberg";s:7:"/themes";}', 'no'),
	(445, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1565961074;s:7:"checked";a:1:{s:15:"awave-gutenberg";s:5:"1.0.0";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
	(446, 'wpmdb_schema_version', '2', 'no'),
	(447, '_site_transient_timeout_browser_01b80466de9751fc3c1cfc72f0950804', '1566565650', 'no'),
	(448, '_site_transient_browser_01b80466de9751fc3c1cfc72f0950804', 'a:10:{s:4:"name";s:7:"Firefox";s:7:"version";s:4:"68.0";s:8:"platform";s:7:"Windows";s:10:"update_url";s:24:"https://www.firefox.com/";s:7:"img_src";s:44:"http://s.w.org/images/browsers/firefox.png?1";s:11:"img_src_ssl";s:45:"https://s.w.org/images/browsers/firefox.png?1";s:15:"current_version";s:2:"56";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
	(449, '_site_transient_timeout_php_check_c6e81a88aa62f0eea87d84f96662ea28', '1566565651', 'no'),
	(450, '_site_transient_php_check_c6e81a88aa62f0eea87d84f96662ea28', 'a:5:{s:19:"recommended_version";s:3:"7.3";s:15:"minimum_version";s:6:"5.6.20";s:12:"is_supported";b:1;s:9:"is_secure";b:1;s:13:"is_acceptable";b:1;}', 'no'),
	(454, '_transient_timeout_plugin_slugs', '1566047818', 'no'),
	(455, '_transient_plugin_slugs', 'a:13:{i:0;s:37:"acf-header-field/acf-header-field.php";i:1;s:34:"advanced-custom-fields-pro/acf.php";i:2;s:27:"autoptimize/autoptimize.php";i:3;s:41:"awave-color-scheme/awave-color-scheme.php";i:4;s:29:"awavemonitor/awavemonitor.php";i:5;s:31:"cookie-notice/cookie-notice.php";i:6;s:29:"gravityforms/gravityforms.php";i:7;s:41:"better-wp-security/better-wp-security.php";i:8;s:27:"redirection/redirection.php";i:9;s:29:"wp-mail-smtp/wp_mail_smtp.php";i:10;s:31:"wp-migrate-db/wp-migrate-db.php";i:11;s:27:"wp-super-cache/wp-cache.php";i:12;s:24:"wordpress-seo/wp-seo.php";}', 'no'),
	(456, 'rewrite_rules', 'a:91:{s:19:"sitemap_index\\.xml$";s:19:"index.php?sitemap=1";s:31:"([^/]+?)-sitemap([0-9]+)?\\.xml$";s:51:"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]";s:24:"([a-z]+)?-?sitemap\\.xsl$";s:39:"index.php?yoast-sitemap-xsl=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=2&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
	(457, '_transient_timeout_acf_plugin_info_pro', '1566047358', 'no'),
	(458, '_transient_acf_plugin_info_pro', 'a:17:{s:4:"name";s:26:"Advanced Custom Fields PRO";s:4:"slug";s:26:"advanced-custom-fields-pro";s:8:"homepage";s:36:"https://www.advancedcustomfields.com";s:7:"version";s:5:"5.8.3";s:6:"author";s:13:"Elliot Condon";s:10:"author_url";s:36:"https://www.advancedcustomfields.com";s:12:"contributors";s:12:"elliotcondon";s:8:"requires";s:5:"4.7.0";s:6:"tested";s:3:"5.2";s:4:"tags";a:100:{i:0;s:5:"5.8.2";i:1;s:5:"5.8.1";i:2;s:13:"5.8.0-beta4.1";i:3;s:11:"5.8.0-beta4";i:4;s:11:"5.8.0-beta3";i:5;s:11:"5.8.0-beta2";i:6;s:11:"5.8.0-beta1";i:7;s:9:"5.8.0-RC2";i:8;s:9:"5.8.0-RC1";i:9;s:5:"5.8.0";i:10;s:5:"5.7.9";i:11;s:5:"5.7.8";i:12;s:5:"5.7.7";i:13;s:5:"5.7.6";i:14;s:5:"5.7.5";i:15;s:5:"5.7.4";i:16;s:5:"5.7.3";i:17;s:5:"5.7.2";i:18;s:6:"5.7.13";i:19;s:6:"5.7.12";i:20;s:6:"5.7.10";i:21;s:5:"5.7.1";i:22;s:5:"5.7.0";i:23;s:5:"5.6.9";i:24;s:5:"5.6.8";i:25;s:5:"5.6.7";i:26;s:5:"5.6.6";i:27;s:5:"5.6.5";i:28;s:5:"5.6.4";i:29;s:5:"5.6.3";i:30;s:5:"5.6.2";i:31;s:6:"5.6.10";i:32;s:5:"5.6.1";i:33;s:11:"5.6.0-beta2";i:34;s:11:"5.6.0-beta1";i:35;s:9:"5.6.0-RC2";i:36;s:9:"5.6.0-RC1";i:37;s:5:"5.6.0";i:38;s:5:"5.5.9";i:39;s:5:"5.5.7";i:40;s:5:"5.5.5";i:41;s:5:"5.5.3";i:42;s:5:"5.5.2";i:43;s:6:"5.5.14";i:44;s:6:"5.5.13";i:45;s:6:"5.5.12";i:46;s:6:"5.5.11";i:47;s:6:"5.5.10";i:48;s:5:"5.5.1";i:49;s:5:"5.5.0";i:50;s:5:"5.4.8";i:51;s:5:"5.4.7";i:52;s:5:"5.4.6";i:53;s:5:"5.4.5";i:54;s:5:"5.4.4";i:55;s:5:"5.4.3";i:56;s:5:"5.4.2";i:57;s:5:"5.4.1";i:58;s:5:"5.4.0";i:59;s:5:"5.3.9";i:60;s:5:"5.3.8";i:61;s:5:"5.3.7";i:62;s:5:"5.3.6";i:63;s:5:"5.3.5";i:64;s:5:"5.3.4";i:65;s:5:"5.3.3";i:66;s:5:"5.3.2";i:67;s:6:"5.3.10";i:68;s:5:"5.3.1";i:69;s:5:"5.3.0";i:70;s:5:"5.2.9";i:71;s:5:"5.2.8";i:72;s:5:"5.2.7";i:73;s:5:"5.2.6";i:74;s:5:"5.2.5";i:75;s:5:"5.2.4";i:76;s:5:"5.2.3";i:77;s:5:"5.2.2";i:78;s:5:"5.2.1";i:79;s:5:"5.2.0";i:80;s:5:"5.1.9";i:81;s:5:"5.1.8";i:82;s:5:"5.1.7";i:83;s:5:"5.1.6";i:84;s:5:"5.1.5";i:85;s:5:"5.1.4";i:86;s:5:"5.1.3";i:87;s:5:"5.1.2";i:88;s:5:"5.1.1";i:89;s:5:"5.1.0";i:90;s:5:"5.0.9";i:91;s:5:"5.0.8";i:92;s:5:"5.0.7";i:93;s:5:"5.0.6";i:94;s:5:"5.0.5";i:95;s:5:"5.0.4";i:96;s:5:"5.0.3";i:97;s:5:"5.0.2";i:98;s:5:"5.0.1";i:99;s:5:"5.0.0";}s:6:"tagged";s:61:"acf, advanced, custom, field, fields, form, repeater, content";s:11:"description";s:1353:"<p>Use the Advanced Custom Fields plugin to take full control of your WordPress edit screens & custom field data.</p>\n<p><strong>Add fields on demand.</strong> Our field builder allows you to quickly and easily add fields to WP edit screens with only the click of a few buttons!</p>\n<p><strong>Add them anywhere.</strong> Fields can be added all over WP including posts, users, taxonomy terms, media, comments and even custom options pages!</p>\n<p><strong>Show them everywhere.</strong> Load and display your custom field values in any theme template file with our hassle free developer friendly functions!</p>\n<h4>Features</h4>\n<ul>\n<li> Simple & Intuitive</li>\n<li> Powerful Functions</li>\n<li> Over 30 Field Types</li>\n<li> Extensive Documentation</li>\n<li> Millions of Users</li>\n</ul>\n<h4>Links</h4>\n<ul>\n<li> <a href="https://www.advancedcustomfields.com">Website</a></li>\n<li> <a href="https://www.advancedcustomfields.com/resources/">Documentation</a></li>\n<li> <a href="https://support.advancedcustomfields.com">Support</a></li>\n<li> <a href="https://www.advancedcustomfields.com/pro/">ACF PRO</a></li>\n</ul>\n<h4>PRO</h4>\n<p>The Advanced Custom Fields plugin is also available in a professional version which includes more fields, more functionality, and more flexibility! <a href="https://www.advancedcustomfields.com/pro/">Learn more</a></p>\n";s:12:"installation";s:508:"<p>From your WordPress dashboard</p>\n<ol>\n<li> <strong>Visit</strong> Plugins > Add New</li>\n<li> <strong>Search</strong> for "Advanced Custom Fields"</li>\n<li> <strong>Activate</strong> Advanced Custom Fields from your Plugins page</li>\n<li> <strong>Click</strong> on the new menu item "Custom Fields" and create your first Custom Field Group!</li>\n<li> <strong>Read</strong> the documentation to <a href="https://www.advancedcustomfields.com/resources/getting-started-with-acf/">get started</a></li>\n</ol>\n";s:9:"changelog";s:8401:"<h4>5.8.3</h4>\n<p><em>Release Date - 7 August 2019</em></p>\n<ul>\n<li> Tweak - Changed Options Page location rules to show "page_title" instead of "menu_title".</li>\n<li> Fix - Fixed bug causing Textarea field to incorrectly validate maxlength.</li>\n<li> Fix - Fixed bug allowing Range field values outside of the min and max settings.</li>\n<li> Fix - Fixed bug in block RegExp causing some blocks to miss the "acf/pre_save_block" filter.</li>\n<li> Dev - Added <code>$block_type</code> parameter to block settings "enqueue_assets" callback.</li>\n<li> i18n - Added French Canadian language thanks to Bérenger Zyla.</li>\n<li> i18n - Updated French language thanks to Bérenger Zyla.</li>\n</ul>\n<h4>5.8.2</h4>\n<p><em>Release Date - 15 July 2019</em></p>\n<ul>\n<li> Fix - Fixed bug where validation did not prevent new user registration.</li>\n<li> Fix - Fixed bug causing some "reordered" metaboxes to not appear in the Gutenberg editor.</li>\n<li> Fix - Fixed bug causing WYSIWYG field with delayed initialization to appear blank.</li>\n<li> Fix - Fixed bug when editing a post and adding a new tag did not refresh metaboxes.</li>\n<li> Dev - Added missing <code>$value</code> parameter in "acf/pre_format_value" filter.</li>\n</ul>\n<h4>5.8.1</h4>\n<p><em>Release Date - 3 June 2019</em></p>\n<ul>\n<li> New - Added "Preview Size" and "Return Format" settings to the Gallery field.</li>\n<li> Tweak - Improved metabox styling for Gutenberg.</li>\n<li> Tweak - Changed default "Preview Size" to medium for the Image field.</li>\n<li> Fix - Fixed bug in media modal causing the primary button text to disappear after editing an image.</li>\n<li> Fix - Fixed bug preventing the TinyMCE Advanced plugin from adding <code>< p ></code> tags.</li>\n<li> Fix - Fixed bug where HTML choices were not visible in conditional logic dropdown.</li>\n<li> Fix - Fixed bug causing incorrect order of imported/synced flexible content sub fields.</li>\n<li> i18n - Updated German translation thanks to Ralf Koller.</li>\n<li> i18n - Updated Persian translation thanks to Majix.</li>\n</ul>\n<h4>5.8.0</h4>\n<p><em>Release Date - 8 May 2019</em></p>\n<ul>\n<li> New - Added ACF Blocks feature for ACF PRO.</li>\n<li> Fix - Fixed bug causing duplicate "save metabox" AJAX requests in the Gutenberg editor.</li>\n<li> Fix - Fixed bug causing incorrect Repeater field value order in AJAX requests.</li>\n<li> Dev - Added JS filter <code>\'relationship_ajax_data\'</code> to customize Relationship field AJAX data.</li>\n<li> Dev - Added <code>$field_group</code> parameter to <code>\'acf/location/match_rule\'</code> filter.</li>\n<li> Dev - Bumped minimum supported PHP version to 5.4.0.</li>\n<li> Dev - Bumped minimum supported WP version to 4.7.0.</li>\n<li> i18n - Updated German translation thanks to Ralf Koller.</li>\n<li> i18n - Updated Portuguese language thanks to Pedro Mendonça.</li>\n</ul>\n<h4>5.7.13</h4>\n<p><em>Release Date - 6 March 2019</em></p>\n<ul>\n<li> Fix - Fixed bug causing issues with registered fields during <code>switch_to_blog()</code>.</li>\n<li> Fix - Fixed bug preventing sub fields from being reused across multiple parents.</li>\n<li> Fix - Fixed bug causing the <code>get_sub_field()</code> function to fail if a tab field exists with the same name as the selected field.</li>\n<li> Fix - Fixed bug corrupting field settings since WP 5.1 when instructions contain <code>< a target="" ></code>.</li>\n<li> Fix - Fixed bug in Gutenberg where custom metabox location (acf_after_title) did not show on initial page load.</li>\n<li> Fix - Fixed bug causing issues when importing/syncing multiple field groups which contain a clone field.</li>\n<li> Fix - Fixed bug preventing the AMP plugin preview from working.</li>\n<li> Dev - Added new \'pre\' filters to get, update and delete meta functions.</li>\n<li> i18n - Update Turkish translation thanks to Emre Erkan.</li>\n</ul>\n<h4>5.7.12</h4>\n<p><em>Release Date - 15 February 2019</em></p>\n<ul>\n<li> Fix - Added missing function <code>register_field_group()</code>.</li>\n<li> Fix - Fixed PHP 5.4 error "Can\'t use function return value in write context".</li>\n<li> Fix - Fixed bug causing wp_options values to be slashed incorrectly.</li>\n<li> Fix - Fixed bug where "sync" feature imported field groups without fields.</li>\n<li> Fix - Fixed bug preventing <code>get_field_object()</code> working with a field key.</li>\n<li> Fix - Fixed bug causing incorrect results in <code>get_sub_field()</code>.</li>\n<li> Fix - Fixed bug causing draft and preview issues with serialized values.</li>\n<li> Fix - Fixed bug causing reversed field group metabox order.</li>\n<li> Fix - Fixed bug causing incorrect character count when validating values.</li>\n<li> Fix - Fixed bug showing incorrect choices for post_template location rule.</li>\n<li> Fix - Fixed bug causing incorrect value retrieval after <code>switch_to_blog()</code>.</li>\n<li> i18n - Updated Persian translation thanks to Majix.</li>\n</ul>\n<h4>5.7.11</h4>\n<p><em>Release Date - 11 February 2019</em></p>\n<ul>\n<li> New - Added support for persistent object caching.</li>\n<li> Fix - Fixed PHP error in <code>determine_locale()</code> affecting AJAX requests.</li>\n<li> Fix - Fixed bug affecting dynamic metabox check when selecting "default" page template.</li>\n<li> Fix - Fixed bug where tab fields did not render correctly within a dynamic metabox.</li>\n<li> Tweak - Removed language fallback from "zh_TW" to "zh_CN".</li>\n<li> Dev - Refactored various core functions.</li>\n<li> Dev - Added new hook variation functions <code>acf_add_filter_variations()</code> and <code>acf_add_action_variations()</code>.</li>\n<li> i18n - Updated Portuguese language thanks to Pedro Mendonça.</li>\n<li> i18n - Updated German translation thanks to Ralf Koller.</li>\n<li> i18n - Updated Swiss German translation thanks to Raphael Hüni.</li>\n</ul>\n<h4>5.7.10</h4>\n<p><em>Release Date - 16 January 2019</em></p>\n<ul>\n<li> Fix - Fixed bug preventing metaboxes from saving if validation fails within Gutenberg.</li>\n<li> Fix - Fixed bug causing unload prompt to show incorrectly within Gutenberg.</li>\n<li> Fix - Fixed JS error when selecting taxonomy terms within Gutenberg.</li>\n<li> Fix - Fixed bug causing jQuery sortable issues within other plugins.</li>\n<li> Tweak - Improved loading translations by adding fallback from region to country when .mo file does not exit.</li>\n<li> Tweak - Improved punctuation throughout admin notices.</li>\n<li> Tweak - Improved performance and accuracy when loading a user field value.</li>\n<li> Dev - Added filter \'acf/get_locale\' to customize the locale used to load translations.</li>\n<li> Dev - Added filter \'acf/allow_unfiltered_html\' to customize if current user can save unfiltered HTML.</li>\n<li> Dev - Added new data storage functions <code>acf_register_store()</code> and <code>acf_get_store()</code>.</li>\n<li> Dev - Moved from .less to .scss and minified all css.</li>\n<li> i18n - Updated French translation thanks to Maxime Bernard-Jacquet.</li>\n<li> i18n - Updated Czech translation thanks to David Rychly.</li>\n</ul>\n<h4>5.7.9</h4>\n<p><em>Release Date - 17 December 2018</em></p>\n<ul>\n<li> Fix - Added custom metabox location (acf_after_title) compatibility with Gutenberg.</li>\n<li> Fix - Added dynamic metabox check compatibility with Gutenberg.</li>\n<li> Fix - Fixed bug causing required date picker fields to prevent form submit.</li>\n<li> Fix - Fixed bug preventing multi-input values from saving correctly within media modals.</li>\n<li> Fix - Fixed bug where <code>acf_form()</code> redirects to an incorrect URL for sub-sites.</li>\n<li> Fix - Fixed bug where breaking out of a sub <code>have_rows()</code> loop could produce undesired results.</li>\n<li> Dev - Added filter \'acf/connect_attachment_to_post\' to prevent connecting attachments to posts.</li>\n<li> Dev - Added JS filter \'google_map_autocomplete_args\' to customize Google Maps autocomplete settings.</li>\n</ul>\n<h4>5.7.8</h4>\n<p><em>Release Date - 7 December 2018</em></p>\n<ul>\n<li> Fix - Fixed vulnerability allowing author role to save unfiltered HTML values.</li>\n<li> Fix - Fixed all metaboxes appearing when editing a post in WP 5.0.</li>\n<li> i18n - Updated Polish translation thanks to Dariusz Zielonka.</li>\n<li> i18n - Updated Czech translation thanks to Veronika Hanzlíková.</li>\n<li> i18n - Update Turkish translation thanks to Emre Erkan.</li>\n<li> i18n - Updated Portuguese language thanks to Pedro Mendonça.</li>\n</ul>\n";s:14:"upgrade_notice";s:0:"";s:5:"icons";a:1:{s:7:"default";s:63:"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png";}s:7:"banners";a:1:{s:7:"default";s:66:"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg";}}', 'no'),
	(459, '_transient_timeout_acf_plugin_updates', '1566047406', 'no'),
	(460, '_transient_acf_plugin_updates', 'a:4:{s:7:"plugins";a:0:{}s:10:"expiration";i:86400;s:6:"status";i:1;s:7:"checked";a:1:{s:34:"advanced-custom-fields-pro/acf.php";s:5:"5.8.3";}}', 'no'),
	(462, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1565961096;s:7:"checked";a:13:{s:37:"acf-header-field/acf-header-field.php";s:5:"1.0.0";s:34:"advanced-custom-fields-pro/acf.php";s:5:"5.8.3";s:27:"autoptimize/autoptimize.php";s:5:"2.5.1";s:41:"awave-color-scheme/awave-color-scheme.php";s:0:"";s:29:"awavemonitor/awavemonitor.php";s:3:"1.0";s:31:"cookie-notice/cookie-notice.php";s:6:"1.2.46";s:29:"gravityforms/gravityforms.php";s:6:"2.4.11";s:41:"better-wp-security/better-wp-security.php";s:5:"7.4.1";s:27:"redirection/redirection.php";s:5:"4.3.3";s:29:"wp-mail-smtp/wp_mail_smtp.php";s:5:"1.5.2";s:31:"wp-migrate-db/wp-migrate-db.php";s:6:"1.0.11";s:27:"wp-super-cache/wp-cache.php";s:5:"1.7.0";s:24:"wordpress-seo/wp-seo.php";s:4:"11.8";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:8:{s:27:"autoptimize/autoptimize.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/autoptimize";s:4:"slug";s:11:"autoptimize";s:6:"plugin";s:27:"autoptimize/autoptimize.php";s:11:"new_version";s:5:"2.5.1";s:3:"url";s:42:"https://wordpress.org/plugins/autoptimize/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/autoptimize.2.5.1.zip";s:5:"icons";a:1:{s:2:"1x";s:64:"https://ps.w.org/autoptimize/assets/icon-128x128.png?rev=1864142";}s:7:"banners";a:1:{s:2:"1x";s:66:"https://ps.w.org/autoptimize/assets/banner-772x250.jpg?rev=1315920";}s:11:"banners_rtl";a:0:{}}s:31:"cookie-notice/cookie-notice.php";O:8:"stdClass":9:{s:2:"id";s:27:"w.org/plugins/cookie-notice";s:4:"slug";s:13:"cookie-notice";s:6:"plugin";s:31:"cookie-notice/cookie-notice.php";s:11:"new_version";s:6:"1.2.46";s:3:"url";s:44:"https://wordpress.org/plugins/cookie-notice/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/cookie-notice.1.2.46.zip";s:5:"icons";a:2:{s:2:"2x";s:66:"https://ps.w.org/cookie-notice/assets/icon-256x256.png?rev=1805756";s:2:"1x";s:66:"https://ps.w.org/cookie-notice/assets/icon-128x128.png?rev=1805756";}s:7:"banners";a:1:{s:2:"1x";s:68:"https://ps.w.org/cookie-notice/assets/banner-772x250.png?rev=1805749";}s:11:"banners_rtl";a:0:{}}s:41:"better-wp-security/better-wp-security.php";O:8:"stdClass":9:{s:2:"id";s:32:"w.org/plugins/better-wp-security";s:4:"slug";s:18:"better-wp-security";s:6:"plugin";s:41:"better-wp-security/better-wp-security.php";s:11:"new_version";s:5:"7.4.1";s:3:"url";s:49:"https://wordpress.org/plugins/better-wp-security/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/better-wp-security.7.4.1.zip";s:5:"icons";a:3:{s:2:"2x";s:70:"https://ps.w.org/better-wp-security/assets/icon-256x256.jpg?rev=969999";s:2:"1x";s:62:"https://ps.w.org/better-wp-security/assets/icon.svg?rev=970042";s:3:"svg";s:62:"https://ps.w.org/better-wp-security/assets/icon.svg?rev=970042";}s:7:"banners";a:1:{s:2:"1x";s:72:"https://ps.w.org/better-wp-security/assets/banner-772x250.png?rev=881897";}s:11:"banners_rtl";a:0:{}}s:27:"redirection/redirection.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/redirection";s:4:"slug";s:11:"redirection";s:6:"plugin";s:27:"redirection/redirection.php";s:11:"new_version";s:5:"4.3.3";s:3:"url";s:42:"https://wordpress.org/plugins/redirection/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/redirection.4.3.3.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/redirection/assets/icon-256x256.jpg?rev=983639";s:2:"1x";s:63:"https://ps.w.org/redirection/assets/icon-128x128.jpg?rev=983640";}s:7:"banners";a:2:{s:2:"2x";s:66:"https://ps.w.org/redirection/assets/banner-1544x500.jpg?rev=983641";s:2:"1x";s:65:"https://ps.w.org/redirection/assets/banner-772x250.jpg?rev=983642";}s:11:"banners_rtl";a:0:{}}s:29:"wp-mail-smtp/wp_mail_smtp.php";O:8:"stdClass":9:{s:2:"id";s:26:"w.org/plugins/wp-mail-smtp";s:4:"slug";s:12:"wp-mail-smtp";s:6:"plugin";s:29:"wp-mail-smtp/wp_mail_smtp.php";s:11:"new_version";s:5:"1.5.2";s:3:"url";s:43:"https://wordpress.org/plugins/wp-mail-smtp/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/wp-mail-smtp.1.5.2.zip";s:5:"icons";a:2:{s:2:"2x";s:65:"https://ps.w.org/wp-mail-smtp/assets/icon-256x256.png?rev=1755440";s:2:"1x";s:65:"https://ps.w.org/wp-mail-smtp/assets/icon-128x128.png?rev=1755440";}s:7:"banners";a:2:{s:2:"2x";s:68:"https://ps.w.org/wp-mail-smtp/assets/banner-1544x500.png?rev=2120094";s:2:"1x";s:67:"https://ps.w.org/wp-mail-smtp/assets/banner-772x250.png?rev=2120094";}s:11:"banners_rtl";a:0:{}}s:31:"wp-migrate-db/wp-migrate-db.php";O:8:"stdClass":9:{s:2:"id";s:27:"w.org/plugins/wp-migrate-db";s:4:"slug";s:13:"wp-migrate-db";s:6:"plugin";s:31:"wp-migrate-db/wp-migrate-db.php";s:11:"new_version";s:6:"1.0.11";s:3:"url";s:44:"https://wordpress.org/plugins/wp-migrate-db/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/wp-migrate-db.1.0.11.zip";s:5:"icons";a:2:{s:2:"2x";s:66:"https://ps.w.org/wp-migrate-db/assets/icon-256x256.jpg?rev=1809889";s:2:"1x";s:66:"https://ps.w.org/wp-migrate-db/assets/icon-128x128.jpg?rev=1809889";}s:7:"banners";a:2:{s:2:"2x";s:69:"https://ps.w.org/wp-migrate-db/assets/banner-1544x500.jpg?rev=1809889";s:2:"1x";s:68:"https://ps.w.org/wp-migrate-db/assets/banner-772x250.jpg?rev=1809889";}s:11:"banners_rtl";a:0:{}}s:27:"wp-super-cache/wp-cache.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/wp-super-cache";s:4:"slug";s:14:"wp-super-cache";s:6:"plugin";s:27:"wp-super-cache/wp-cache.php";s:11:"new_version";s:5:"1.7.0";s:3:"url";s:45:"https://wordpress.org/plugins/wp-super-cache/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/wp-super-cache.1.7.0.zip";s:5:"icons";a:2:{s:2:"2x";s:67:"https://ps.w.org/wp-super-cache/assets/icon-256x256.png?rev=1095422";s:2:"1x";s:67:"https://ps.w.org/wp-super-cache/assets/icon-128x128.png?rev=1095422";}s:7:"banners";a:2:{s:2:"2x";s:70:"https://ps.w.org/wp-super-cache/assets/banner-1544x500.png?rev=1082414";s:2:"1x";s:69:"https://ps.w.org/wp-super-cache/assets/banner-772x250.png?rev=1082414";}s:11:"banners_rtl";a:0:{}}s:24:"wordpress-seo/wp-seo.php";O:8:"stdClass":9:{s:2:"id";s:27:"w.org/plugins/wordpress-seo";s:4:"slug";s:13:"wordpress-seo";s:6:"plugin";s:24:"wordpress-seo/wp-seo.php";s:11:"new_version";s:4:"11.8";s:3:"url";s:44:"https://wordpress.org/plugins/wordpress-seo/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/wordpress-seo.11.8.zip";s:5:"icons";a:3:{s:2:"2x";s:66:"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=1834347";s:2:"1x";s:58:"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641";s:3:"svg";s:58:"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641";}s:7:"banners";a:2:{s:2:"2x";s:69:"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435";s:2:"1x";s:68:"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435";}s:11:"banners_rtl";a:2:{s:2:"2x";s:73:"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435";s:2:"1x";s:72:"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435";}}}}', 'no'),
	(465, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"5.2.2";s:7:"version";s:5:"5.2.2";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.0";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1565961074;s:15:"version_checked";s:5:"5.2.2";s:12:"translations";a:0:{}}', 'no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_postmeta
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_postmeta: ~33 rows (ungefär)
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
	(1, 2, '_wp_page_template', 'default'),
	(2, 3, '_wp_page_template', 'default'),
	(3, 2, '_edit_lock', '1565960388:1'),
	(4, 6, '_edit_last', '1'),
	(5, 6, '_edit_lock', '1557903651:1'),
	(6, 10, '_edit_last', '1'),
	(7, 10, '_edit_lock', '1565959127:1'),
	(8, 2, '_edit_last', '1'),
	(9, 2, '_yoast_wpseo_content_score', '30'),
	(10, 16, '_edit_last', '1'),
	(11, 16, '_edit_lock', '1557907595:1'),
	(12, 17, '_edit_last', '1'),
	(13, 17, '_edit_lock', '1565957856:1'),
	(14, 21, '_edit_lock', '1565959031:1'),
	(15, 21, '_edit_last', '1'),
	(23, 45, '_menu_item_type', 'post_type'),
	(24, 45, '_menu_item_menu_item_parent', '0'),
	(25, 45, '_menu_item_object_id', '2'),
	(26, 45, '_menu_item_object', 'page'),
	(27, 45, '_menu_item_target', ''),
	(28, 45, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
	(29, 45, '_menu_item_xfn', ''),
	(30, 45, '_menu_item_url', ''),
	(31, 45, '_menu_item_orphaned', '1565960729'),
	(32, 46, '_menu_item_type', 'post_type'),
	(33, 46, '_menu_item_menu_item_parent', '0'),
	(34, 46, '_menu_item_object_id', '2'),
	(35, 46, '_menu_item_object', 'page'),
	(36, 46, '_menu_item_target', ''),
	(37, 46, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
	(38, 46, '_menu_item_xfn', ''),
	(39, 46, '_menu_item_url', ''),
	(40, 46, '_menu_item_orphaned', '1565960729');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_posts
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_posts: ~21 rows (ungefär)
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
	(2, 1, '2019-05-15 06:53:12', '2019-05-15 06:53:12', '', 'Hem', '', 'publish', 'closed', 'open', '', 'hem', '', '', '2019-08-16 13:02:01', '2019-08-16 13:02:01', '', 0, 'http://sandbox.awave.site/?page_id=2', 0, 'page', '', 0),
	(3, 1, '2019-05-15 06:53:12', '2019-05-15 06:53:12', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://sandbox.awave.site.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2019-05-15 06:53:12', '2019-05-15 06:53:12', '', 0, 'http://sandbox.awave.site/?page_id=3', 0, 'page', '', 0),
	(6, 1, '2019-05-15 07:02:34', '2019-05-15 07:02:34', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:12:"options_page";s:8:"operator";s:2:"==";s:5:"value";s:26:"acf-options-tracking-codes";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Tracking codes', 'tracking-codes', 'publish', 'closed', 'closed', '', 'group_5cdbb956bf17f', '', '', '2019-05-15 07:02:44', '2019-05-15 07:02:44', '', 0, 'http://sandbox.awave.site/?post_type=acf-field-group&#038;p=6', 0, 'acf-field-group', '', 0),
	(7, 1, '2019-05-15 07:02:34', '2019-05-15 07:02:34', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:0:"";}', 'Tracking codes header', 'tracking_codes_header', 'publish', 'closed', 'closed', '', 'field_5cdbb9688e714', '', '', '2019-05-15 07:02:34', '2019-05-15 07:02:34', '', 6, 'http://sandbox.awave.site/?post_type=acf-field&p=7', 0, 'acf-field', '', 0),
	(8, 1, '2019-05-15 07:02:34', '2019-05-15 07:02:34', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:0:"";}', 'Tracking codes body', 'tracking_codes_body', 'publish', 'closed', 'closed', '', 'field_5cdbb9768e715', '', '', '2019-05-15 07:02:34', '2019-05-15 07:02:34', '', 6, 'http://sandbox.awave.site/?post_type=acf-field&p=8', 1, 'acf-field', '', 0),
	(9, 1, '2019-05-15 07:02:34', '2019-05-15 07:02:34', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:0:"";}', 'Tracking codes footer', 'tracking_codes_footer', 'publish', 'closed', 'closed', '', 'field_5cdbb97f8e716', '', '', '2019-05-15 07:02:34', '2019-05-15 07:02:34', '', 6, 'http://sandbox.awave.site/?post_type=acf-field&p=9', 2, 'acf-field', '', 0),
	(10, 1, '2019-05-15 07:18:20', '2019-05-15 07:18:20', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:5:"block";s:8:"operator";s:2:"==";s:5:"value";s:8:"acf/hero";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Hero', 'hero', 'publish', 'closed', 'closed', '', 'group_5cdbbd3216caf', '', '', '2019-08-16 12:41:10', '2019-08-16 12:41:10', '', 0, 'http://sandbox.awave.site/?post_type=acf-field-group&#038;p=10', 0, 'acf-field-group', '', 0),
	(11, 1, '2019-05-15 07:22:21', '2019-05-15 07:22:21', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Image', 'image', 'publish', 'closed', 'closed', '', 'field_5cdbbe156d03b', '', '', '2019-08-16 12:40:24', '2019-08-16 12:40:24', '', 10, 'http://sandbox.awave.site/?post_type=acf-field&#038;p=11', 0, 'acf-field', '', 0),
	(16, 1, '2019-05-15 08:08:58', '2019-05-15 08:08:58', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:12:"options_page";s:8:"operator";s:2:"==";s:5:"value";s:14:"theme-settings";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Theme settings', 'theme-settings', 'publish', 'closed', 'closed', '', 'group_5cdbc90ed123e', '', '', '2019-05-15 08:08:58', '2019-05-15 08:08:58', '', 0, 'http://sandbox.awave.site/?post_type=acf-field-group&#038;p=16', 0, 'acf-field-group', '', 0),
	(17, 1, '2019-08-16 12:18:12', '2019-08-16 12:18:12', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:5:"block";s:8:"operator";s:2:"==";s:5:"value";s:8:"acf/test";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Test', 'test', 'publish', 'closed', 'closed', '', 'group_5d569eebc3ddd', '', '', '2019-08-16 12:19:59', '2019-08-16 12:19:59', '', 0, 'http://base-installation.awave.site/?post_type=acf-field-group&#038;p=17', 0, 'acf-field-group', '', 0),
	(18, 1, '2019-08-16 12:18:12', '2019-08-16 12:18:12', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test1', 'test1', 'publish', 'closed', 'closed', '', 'field_5d569ef211996', '', '', '2019-08-16 12:18:12', '2019-08-16 12:18:12', '', 17, 'http://base-installation.awave.site/?post_type=acf-field&p=18', 0, 'acf-field', '', 0),
	(19, 1, '2019-08-16 12:18:12', '2019-08-16 12:18:12', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test2', 'test2', 'publish', 'closed', 'closed', '', 'field_5d569ef611997', '', '', '2019-08-16 12:18:12', '2019-08-16 12:18:12', '', 17, 'http://base-installation.awave.site/?post_type=acf-field&p=19', 1, 'acf-field', '', 0),
	(20, 1, '2019-08-16 12:18:12', '2019-08-16 12:18:12', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test3', 'test3', 'publish', 'closed', 'closed', '', 'field_5d569efb11998', '', '', '2019-08-16 12:18:12', '2019-08-16 12:18:12', '', 17, 'http://base-installation.awave.site/?post_type=acf-field&p=20', 2, 'acf-field', '', 0),
	(21, 1, '2019-08-16 12:18:23', '2019-08-16 12:18:23', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:5:"block";s:8:"operator";s:2:"==";s:5:"value";s:9:"acf/test2";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Test 2', 'test-2', 'publish', 'open', 'open', '', 'group_5d569f0fba01b', '', '', '2019-08-16 12:20:06', '2019-08-16 12:20:06', '', 0, 'http://base-installation.awave.site/?p=21', 0, 'acf-field-group', '', 0),
	(22, 1, '2019-08-16 12:18:23', '2019-08-16 12:18:23', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test1', 'test1', 'publish', 'closed', 'closed', '', 'field_5d569f0fcb2c1', '', '', '2019-08-16 12:18:23', '2019-08-16 12:18:23', '', 21, 'http://base-installation.awave.site/?post_type=acf-field&p=22', 0, 'acf-field', '', 0),
	(23, 1, '2019-08-16 12:18:23', '2019-08-16 12:18:23', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test2', 'test2', 'publish', 'closed', 'closed', '', 'field_5d569f0fcb5e8', '', '', '2019-08-16 12:18:23', '2019-08-16 12:18:23', '', 21, 'http://base-installation.awave.site/?post_type=acf-field&p=23', 1, 'acf-field', '', 0),
	(24, 1, '2019-08-16 12:18:23', '2019-08-16 12:18:23', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test3', 'test3', 'publish', 'closed', 'closed', '', 'field_5d569f0fcb9ce', '', '', '2019-08-16 12:18:23', '2019-08-16 12:18:23', '', 21, 'http://base-installation.awave.site/?post_type=acf-field&p=24', 2, 'acf-field', '', 0),
	(34, 1, '2019-08-16 12:22:26', '2019-08-16 12:22:26', '<!-- wp:acf/test {\n    "id": "block_5d569fc502056",\n    "name": "acf\\/test",\n    "data": {\n        "test1": "Testing 1",\n        "_test1": "field_5d569ef211996",\n        "test2": "Testing 2",\n        "_test2": "field_5d569ef611997",\n        "test3": "Testing 3",\n        "_test3": "field_5d569efb11998"\n    },\n    "align": "",\n    "mode": "preview"\n} /-->', 'Untitled Reusable Block 1', '', 'publish', 'closed', 'closed', '', 'untitled-reusable-block', '', '', '2019-08-16 12:27:25', '2019-08-16 12:27:25', '', 0, 'http://base-installation.awave.site/untitled-reusable-block/', 0, 'wp_block', '', 0),
	(35, 1, '2019-08-16 12:23:33', '2019-08-16 12:23:33', '<!-- wp:acf/test {\n    "id": "block_5d56a0368ea52",\n    "name": "acf\\/test",\n    "data": {\n        "test1": "New testing 1",\n        "_test1": "field_5d569ef211996",\n        "test2": "New testing 2",\n        "_test2": "field_5d569ef611997",\n        "test3": "New testing 3",\n        "_test3": "field_5d569efb11998"\n    },\n    "align": "",\n    "mode": "preview"\n} /-->', 'Untitled Reusable Block 2', '', 'publish', 'closed', 'closed', '', 'untitled-reusable-block-2', '', '', '2019-08-16 12:27:04', '2019-08-16 12:27:04', '', 0, 'http://base-installation.awave.site/untitled-reusable-block-2/', 0, 'wp_block', '', 0),
	(45, 1, '2019-08-16 13:05:29', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-08-16 13:05:29', '0000-00-00 00:00:00', '', 0, 'http://base-installation.awave.site/?p=45', 1, 'nav_menu_item', '', 0),
	(46, 1, '2019-08-16 13:05:29', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-08-16 13:05:29', '0000-00-00 00:00:00', '', 0, 'http://base-installation.awave.site/?p=46', 1, 'nav_menu_item', '', 0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_termmeta
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_termmeta: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_terms
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_terms: ~1 rows (ungefär)
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
	(1, 'Uncategorized', 'uncategorized', 0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_term_relationships
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_term_relationships: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
	(21, 1, 0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_term_taxonomy
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_term_taxonomy: ~1 rows (ungefär)
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
	(1, 1, 'category', '', 0, 0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_usermeta
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_usermeta: ~39 rows (ungefär)
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
	(1, 1, 'nickname', 'awave_admin'),
	(2, 1, 'first_name', ''),
	(3, 1, 'last_name', ''),
	(4, 1, 'description', ''),
	(5, 1, 'rich_editing', 'true'),
	(6, 1, 'syntax_highlighting', 'true'),
	(7, 1, 'comment_shortcuts', 'false'),
	(8, 1, 'admin_color', 'fresh'),
	(9, 1, 'use_ssl', '0'),
	(10, 1, 'show_admin_bar_front', 'false'),
	(11, 1, 'locale', ''),
	(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
	(13, 1, 'wp_user_level', '10'),
	(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
	(15, 1, 'show_welcome_panel', '1'),
	(16, 1, 'session_tokens', 'a:3:{s:64:"ff93c9b3b49fcc9e4a19c6655393b00897a853d3f2b209d84a6be9fc2834abf4";a:4:{s:10:"expiration";i:1566130528;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:78:"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0";s:5:"login";i:1565957728;}s:64:"68aa5cb3e442c6ae96d577492fcef5cb0ec3d10a57322509656d8d17470e558b";a:4:{s:10:"expiration";i:1566132569;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:78:"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0";s:5:"login";i:1565959769;}s:64:"66343a8685f865063fc6fdd46600aa665c24a85d742e753b91091c0ff89ecb34";a:4:{s:10:"expiration";i:1566133647;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:78:"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0";s:5:"login";i:1565960847;}}'),
	(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
	(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:9:"127.0.0.0";}'),
	(20, 1, 'wp_yoast_notifications', 'a:1:{i:0;a:2:{s:7:"message";s:232:"<strong>Huge SEO Issue: You\'re blocking access to robots.</strong> You must <a href="http://base-installation.awave.site/wp-admin/options-reading.php">go to your Reading Settings</a> and uncheck the box for Search Engine Visibility.";s:7:"options";a:9:{s:4:"type";s:5:"error";s:2:"id";s:32:"wpseo-dismiss-blog-public-notice";s:5:"nonce";N;s:8:"priority";i:1;s:9:"data_json";a:0:{}s:13:"dismissal_key";N;s:12:"capabilities";s:20:"wpseo_manage_options";s:16:"capability_check";s:3:"all";s:14:"yoast_branding";b:0;}}}'),
	(21, 1, '_yoast_wpseo_profile_updated', '1565959768'),
	(22, 1, 'wpseo_title', ''),
	(23, 1, 'wpseo_metadesc', ''),
	(24, 1, 'wpseo_noindex_author', ''),
	(25, 1, 'wpseo_content_analysis_disable', ''),
	(26, 1, 'wpseo_keyword_analysis_disable', ''),
	(28, 1, 'facebook', ''),
	(29, 1, 'instagram', ''),
	(30, 1, 'linkedin', ''),
	(31, 1, 'myspace', ''),
	(32, 1, 'pinterest', ''),
	(33, 1, 'soundcloud', ''),
	(34, 1, 'tumblr', ''),
	(35, 1, 'twitter', ''),
	(36, 1, 'youtube', ''),
	(37, 1, 'wikipedia', ''),
	(38, 1, 'wp_user-settings', 'libraryContent=browse'),
	(39, 1, 'wp_user-settings-time', '1565960516'),
	(40, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
	(41, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:"add-post_tag";}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_users
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_users: ~1 rows (ungefär)
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
	(1, 'awave_admin', '$P$BLVmrvTFaoPv3A71HCTOVvsDuEqAF10', 'awave_admin', 'wpsupport@awave.com', '', '2019-05-15 06:53:12', '', 0, 'awave_admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_yoast_seo_links
CREATE TABLE IF NOT EXISTS `wp_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `target_post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_yoast_seo_links: ~0 rows (ungefär)
/*!40000 ALTER TABLE `wp_yoast_seo_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_yoast_seo_links` ENABLE KEYS */;

-- Dumpar struktur för tabell base-installation.wp_yoast_seo_meta
CREATE TABLE IF NOT EXISTS `wp_yoast_seo_meta` (
  `object_id` bigint(20) unsigned NOT NULL,
  `internal_link_count` int(10) unsigned DEFAULT NULL,
  `incoming_link_count` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumpar data för tabell base-installation.wp_yoast_seo_meta: ~27 rows (ungefär)
/*!40000 ALTER TABLE `wp_yoast_seo_meta` DISABLE KEYS */;
INSERT INTO `wp_yoast_seo_meta` (`object_id`, `internal_link_count`, `incoming_link_count`) VALUES
	(1, 0, 0),
	(2, 0, 0),
	(4, 0, 0),
	(5, 0, 0),
	(12, 0, 0),
	(13, 0, 0),
	(14, 0, 0),
	(15, 0, 0),
	(21, 0, 0),
	(25, 0, 0),
	(26, 0, 0),
	(27, 0, 0),
	(28, 0, 0),
	(29, 0, 0),
	(30, 0, 0),
	(31, 0, 0),
	(32, 0, 0),
	(33, 0, 0),
	(36, 0, 0),
	(37, 0, 0),
	(38, 0, 0),
	(39, 0, 0),
	(40, 0, 0),
	(41, 0, 0),
	(42, 0, 0),
	(43, 0, 0),
	(44, 0, 0);
/*!40000 ALTER TABLE `wp_yoast_seo_meta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

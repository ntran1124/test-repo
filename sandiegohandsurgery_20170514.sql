-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2017 at 05:13 AM
-- Server version: 5.7.17
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sandiegohandsurgery`
--

-- --------------------------------------------------------

--
-- Table structure for table `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '192.168.177.4', '2017-04-10 08:56:02', '2017-04-10 08:56:02'),
(2, 1, '192.168.58.1', '2017-05-01 07:47:11', '2017-05-01 07:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`) VALUES
(1, 'Nguyen', 'Tran', 'nguyen', 'ntran1124@gmail.com', '$2y$10$738RlBAIM1lLGnuNiPgZ3uZvLcGZpUF//1OI38./2f.P5KhCerowa', NULL, '$2y$10$bg3bkulRlOCAKFGQdkOwGeNhN4hVTBzlntVGnNHa6Kz6H5zPNJZ5a', NULL, '', 1, NULL, '2017-05-01 07:47:11', '2017-04-10 08:55:19', '2017-05-01 07:47:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `permissions`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', NULL, '2017-04-10 08:55:19', '2017-04-10 08:55:19', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '192.168.177.4', 0, NULL, 0, NULL, 0, NULL),
(2, 1, '192.168.58.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `old_content` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2013_10_01_000001_Db_Deferred_Bindings', 1),
('2013_10_01_000002_Db_System_Files', 1),
('2013_10_01_000003_Db_System_Plugin_Versions', 1),
('2013_10_01_000004_Db_System_Plugin_History', 1),
('2013_10_01_000005_Db_System_Settings', 1),
('2013_10_01_000006_Db_System_Parameters', 1),
('2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
('2013_10_01_000008_Db_System_Mail_Templates', 1),
('2013_10_01_000009_Db_System_Mail_Layouts', 1),
('2014_10_01_000010_Db_Jobs', 1),
('2014_10_01_000011_Db_System_Event_Logs', 1),
('2014_10_01_000012_Db_System_Request_Logs', 1),
('2014_10_01_000013_Db_System_Sessions', 1),
('2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
('2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
('2015_10_01_000016_Db_Cache', 1),
('2015_10_01_000017_Db_System_Revisions', 1),
('2015_10_01_000018_Db_FailedJobs', 1),
('2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
('2016_10_01_000020_Db_System_Timestamp_Fix', 1),
('2013_10_01_000001_Db_Backend_Users', 2),
('2013_10_01_000002_Db_Backend_User_Groups', 2),
('2013_10_01_000003_Db_Backend_Users_Groups', 2),
('2013_10_01_000004_Db_Backend_User_Throttle', 2),
('2014_01_04_000005_Db_Backend_User_Preferences', 2),
('2014_10_01_000006_Db_Backend_Access_Log', 2),
('2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
('2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
('2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
('2014_10_01_000001_Db_Cms_Theme_Data', 3),
('2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
('2017_10_01_000003_Db_Cms_Theme_Logs', 3);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2017-04-10 09:37:03', '2017-04-10 09:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_html` longtext COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_posts`
--

INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2017-04-10 09:37:03', 1, '2017-04-10 09:37:03', '2017-04-10 09:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_user_mail_blockers`
--

CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Parse error: syntax error, unexpected \'description\' (T_STRING), expecting function (T_FUNCTION) or const (T_CONST) in D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(290) : eval()\'d code:4\nStack trace:\n#0 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(151): Cms\\Classes\\CodeParser->validate(\'<?php \\r\\nclass C...\')\n#1 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(111): Cms\\Classes\\CodeParser->rebuild(\'D:\\\\Users\\\\Admin\\\\...\')\n#2 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(169): Cms\\Classes\\CodeParser->parse()\n#3 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(524): Cms\\Classes\\CodeParser->source(Object(Cms\\Classes\\Page), Object(Cms\\Classes\\Layout), Object(Cms\\Classes\\Controller))\n#4 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(302): Cms\\Classes\\Controller->initCustomObjects()\n#5 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#8 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#9 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#11 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#17 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#18 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#19 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#26 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#27 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#29 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#33 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#36 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#45 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#47 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#49 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#50 {main}', NULL, '2017-04-10 09:32:42', '2017-04-10 09:32:42'),
(2, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Parse error: syntax error, unexpected \'description\' (T_STRING), expecting function (T_FUNCTION) or const (T_CONST) in D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(290) : eval()\'d code:4\nStack trace:\n#0 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(151): Cms\\Classes\\CodeParser->validate(\'<?php \\r\\nclass C...\')\n#1 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(111): Cms\\Classes\\CodeParser->rebuild(\'D:\\\\Users\\\\Admin\\\\...\')\n#2 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CodeParser.php(169): Cms\\Classes\\CodeParser->parse()\n#3 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(524): Cms\\Classes\\CodeParser->source(Object(Cms\\Classes\\Page), Object(Cms\\Classes\\Layout), Object(Cms\\Classes\\Controller))\n#4 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(302): Cms\\Classes\\Controller->initCustomObjects()\n#5 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#8 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#9 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#11 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#17 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#18 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#19 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#26 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#27 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#29 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#33 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#36 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#45 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#47 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#49 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#50 {main}', NULL, '2017-04-10 09:43:35', '2017-04-10 09:43:35'),
(3, 'error', 'Cms\\Classes\\CmsException: The partial \'site/header\' is not found. in D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php:852\nStack trace:\n#0 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\twig\\Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'site/header\', Array)\n#1 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\storage\\cms\\twig\\c0\\c077c7ac6a3910703d25775f6101b97a5ae870cacbb015e124af6230b9a21c6c.php(84): Cms\\Twig\\Extension->partialFunction(\'site/header\', Array)\n#2 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Template.php(432): __TwigTemplate_5a631e186f9f869851721392a16a1aa900d1f2a04682a2d295522d5751cbe24d->doDisplay(Array, Array)\n#3 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#5 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#6 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#9 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#10 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"The partial \'site/header\' is not found.\") in \"D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery/themes/sdhs/layouts/default_homepage.htm\" at line 29. in D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Template.php:447\nStack trace:\n#0 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#2 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#3 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2017-04-10 09:44:26', '2017-04-10 09:44:26'),
(4, 'error', 'Twig_Error_Syntax: Unknown \"them\" filter. Did you mean \"theme\" in \"D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery/themes/sdhs/pages/common-conditions.htm\" at line 12? in D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php:695\nStack trace:\n#0 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(481): Twig_ExpressionParser->getFilterNodeClass(\'them\', 12)\n#1 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(466): Twig_ExpressionParser->parseFilterExpressionRaw(Object(Twig_Node_Expression_Constant))\n#2 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(320): Twig_ExpressionParser->parseFilterExpression(Object(Twig_Node_Expression_Constant))\n#3 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(212): Twig_ExpressionParser->parsePostfixExpression(Object(Twig_Node_Expression_Constant))\n#4 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(102): Twig_ExpressionParser->parsePrimaryExpression()\n#5 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(55): Twig_ExpressionParser->getPrimary()\n#6 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(147): Twig_ExpressionParser->parseExpression()\n#7 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(103): Twig_Parser->subparse(NULL, false)\n#8 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(692): Twig_Parser->parse(Object(Twig_TokenStream))\n#9 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(750): Twig_Environment->parse(Object(Twig_TokenStream))\n#10 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#11 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(365): Twig_Environment->loadTemplate(\'D:\\\\Users\\\\Admin\\\\...\')\n#12 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#13 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'common-conditio...\')\n#14 [internal function]: Cms\\Classes\\CmsController->run(\'common-conditio...\')\n#15 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#16 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#17 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#18 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#24 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#25 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#26 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#34 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#36 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#37 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#49 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#52 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#54 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#55 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#56 D:\\Users\\Admin\\Documents\\dev\\sandiegohandsurgery\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#57 {main}', NULL, '2017-04-12 10:39:30', '2017-04-12 10:39:30');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(5, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Ntran1124\\Contact\\Components\\Mail\' not found in /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php:24\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#6 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#10 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#17 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#26 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#32 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#49 {main}', NULL, '2017-05-15 08:01:49', '2017-05-15 08:01:49'),
(6, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Parse error: syntax error, unexpected \'\'pretend\'\' (T_CONSTANT_ENCAPSED_STRING), expecting \']\' in /Users/nguyen/Documents/dev/sandiegohandsurgery/config/mail.php:126\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/FileLoader.php(242): Illuminate\\Filesystem\\Filesystem->getRequire(\'/Users/nguyen/D...\')\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/FileLoader.php(76): October\\Rain\\Config\\FileLoader->getRequire(\'/Users/nguyen/D...\')\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/Repository.php(206): October\\Rain\\Config\\FileLoader->load(\'production\', \'mail\', NULL)\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/Repository.php(107): October\\Rain\\Config\\Repository->load(\'mail\', NULL, \'*::mail\')\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/Repository.php(441): October\\Rain\\Config\\Repository->get(\'mail.driver\')\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/TransportManager.php(142): October\\Rain\\Config\\Repository->offsetGet(\'mail.driver\')\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Manager.php(57): Illuminate\\Mail\\TransportManager->getDefaultDriver()\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/MailServiceProvider.php(95): Illuminate\\Support\\Manager->driver()\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(279): Illuminate\\Mail\\MailServiceProvider->Illuminate\\Mail\\{closure}(Object(October\\Rain\\Foundation\\Application))\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(738): Illuminate\\Container\\Container->Illuminate\\Container\\{closure}(Object(October\\Rain\\Foundation\\Application), Array)\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(Object(Closure), Array)\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(674): Illuminate\\Container\\Container->make(\'swift.mailer\', Array)\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(1167): Illuminate\\Foundation\\Application->make(\'swift.mailer\')\n#13 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/MailServiceProvider.php(31): Illuminate\\Container\\Container->offsetGet(\'swift.mailer\')\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(738): October\\Rain\\Mail\\MailServiceProvider->October\\Rain\\Mail\\{closure}(Object(October\\Rain\\Foundation\\Application), Array)\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(Object(Closure), Array)\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(674): Illuminate\\Container\\Container->make(\'mailer\', Array)\n#17 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(1167): Illuminate\\Foundation\\Application->make(\'mailer\')\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(151): Illuminate\\Container\\Container->offsetGet(\'mailer\')\n#19 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(120): Illuminate\\Support\\Facades\\Facade::resolveFacadeInstance(\'mailer\')\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(205): Illuminate\\Support\\Facades\\Facade::getFacadeRoot()\n#21 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#26 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#28 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#30 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#32 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#47 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#57 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#60 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#63 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#65 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#66 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#68 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#69 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#70 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#71 {main}', NULL, '2017-05-15 08:03:06', '2017-05-15 08:03:06'),
(7, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Parse error: syntax error, unexpected \'\'pretend\'\' (T_CONSTANT_ENCAPSED_STRING), expecting \']\' in /Users/nguyen/Documents/dev/sandiegohandsurgery/config/mail.php:126\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/FileLoader.php(242): Illuminate\\Filesystem\\Filesystem->getRequire(\'/Users/nguyen/D...\')\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/FileLoader.php(76): October\\Rain\\Config\\FileLoader->getRequire(\'/Users/nguyen/D...\')\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/Repository.php(206): October\\Rain\\Config\\FileLoader->load(\'production\', \'mail\', NULL)\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/Repository.php(107): October\\Rain\\Config\\Repository->load(\'mail\', NULL, \'*::mail\')\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Config/Repository.php(441): October\\Rain\\Config\\Repository->get(\'mail.driver\')\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/TransportManager.php(142): October\\Rain\\Config\\Repository->offsetGet(\'mail.driver\')\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Manager.php(57): Illuminate\\Mail\\TransportManager->getDefaultDriver()\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/MailServiceProvider.php(95): Illuminate\\Support\\Manager->driver()\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(279): Illuminate\\Mail\\MailServiceProvider->Illuminate\\Mail\\{closure}(Object(October\\Rain\\Foundation\\Application))\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(738): Illuminate\\Container\\Container->Illuminate\\Container\\{closure}(Object(October\\Rain\\Foundation\\Application), Array)\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(Object(Closure), Array)\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(674): Illuminate\\Container\\Container->make(\'swift.mailer\', Array)\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(1167): Illuminate\\Foundation\\Application->make(\'swift.mailer\')\n#13 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/MailServiceProvider.php(31): Illuminate\\Container\\Container->offsetGet(\'swift.mailer\')\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(738): October\\Rain\\Mail\\MailServiceProvider->October\\Rain\\Mail\\{closure}(Object(October\\Rain\\Foundation\\Application), Array)\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(Object(Closure), Array)\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(674): Illuminate\\Container\\Container->make(\'mailer\', Array)\n#17 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Container/Container.php(1167): Illuminate\\Foundation\\Application->make(\'mailer\')\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(151): Illuminate\\Container\\Container->offsetGet(\'mailer\')\n#19 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(120): Illuminate\\Support\\Facades\\Facade::resolveFacadeInstance(\'mailer\')\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(205): Illuminate\\Support\\Facades\\Facade::getFacadeRoot()\n#21 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#26 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#28 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#30 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#32 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#47 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#57 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#60 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#63 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#65 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#66 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#68 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#69 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#70 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#71 {main}', NULL, '2017-05-15 08:03:21', '2017-05-15 08:03:21'),
(8, 'error', 'InvalidArgumentException: View [mail.message] not found. in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/FileViewFinder.php:137\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/FileViewFinder.php(92): Illuminate\\View\\FileViewFinder->findInPaths(\'mail.message\', Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/FileViewFinder.php(76): Illuminate\\View\\FileViewFinder->findNamedPathView(\'ntran1124.conta...\')\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Factory.php(151): Illuminate\\View\\FileViewFinder->find(\'ntran1124.conta...\')\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(215): Illuminate\\View\\Factory->make(\'ntran1124.conta...\')\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/system/Models/MailTemplate.php(122): Illuminate\\Support\\Facades\\Facade::__callStatic(\'make\', Array)\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/system/Models/MailTemplate.php(111): System\\Models\\MailTemplate::getTemplateSections(\'ntran1124.conta...\')\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/system/Models/MailTemplate.php(130): System\\Models\\MailTemplate->fillFromView()\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/system/Models/MailTemplate.php(142): System\\Models\\MailTemplate::findOrMakeTemplate(\'ntran1124.conta...\')\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/system/ServiceProvider.php(302): System\\Models\\MailTemplate::addContentToMailer(Object(Illuminate\\Mail\\Message), \'ntran1124.conta...\', Array)\n#9 [internal function]: System\\ServiceProvider->System\\{closure}(Object(October\\Rain\\Mail\\Mailer), Object(Illuminate\\Mail\\Message), \'ntran1124.conta...\', Array)\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(219): Illuminate\\Events\\Dispatcher->fire(\'mailer.beforeAd...\', Array, true)\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/Mailer.php(203): Illuminate\\Support\\Facades\\Facade::__callStatic(\'fire\', Array)\n#13 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/Mailer.php(49): October\\Rain\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'ntran1124.conta...\', NULL, NULL, Array)\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(219): October\\Rain\\Mail\\Mailer->send(\'ntran1124.conta...\', Array, Object(Closure))\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#17 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#19 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#21 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#22 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#26 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#32 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#34 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#41 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#51 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#57 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#60 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#62 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#63 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#64 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#65 {main}', NULL, '2017-05-15 08:04:55', '2017-05-15 08:04:55');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(9, 'error', 'Swift_TransportException: Expected response code 250 but got code \"535\", with message \"535-5.7.8 Username and Password not accepted. Learn more at\r\n535 5.7.8  https://support.google.com/mail/?p=BadCredentials c67sm15464037pfa.8 - gsmtp\r\n\" in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:383\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(281): Swift_Transport_AbstractSmtpTransport->_assertResponseCode(\'535-5.7.8 Usern...\', Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(270): Swift_Transport_AbstractSmtpTransport->executeCommand(\'RSET\\r\\n\', Array, Array)\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/Esmtp/Auth/XOAuth2Authenticator.php(55): Swift_Transport_EsmtpTransport->executeCommand(\'RSET\\r\\n\', Array)\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/Esmtp/AuthHandler.php(176): Swift_Transport_Esmtp_Auth_XOAuth2Authenticator->authenticate(Object(Swift_SmtpTransport), \'smtpmail1124@gm...\', \'P@ssw0rd!P\')\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(332): Swift_Transport_Esmtp_AuthHandler->afterEhlo(Object(Swift_SmtpTransport))\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(118): Swift_Transport_EsmtpTransport->_doHeloCommand()\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(79): Swift_Transport_AbstractSmtpTransport->start()\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(394): Swift_Mailer->send(Object(Swift_Message), Array)\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/Mailer.php(69): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(219): October\\Rain\\Mail\\Mailer->send(\'ntran1124.conta...\', Array, Object(Closure))\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#13 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#17 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#19 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#21 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#28 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#37 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#49 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#52 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#55 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#57 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#58 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#59 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#60 {main}', NULL, '2017-05-15 08:06:08', '2017-05-15 08:06:08'),
(10, 'error', 'Swift_TransportException: Expected response code 250 but got code \"535\", with message \"535-5.7.8 Username and Password not accepted. Learn more at\r\n535 5.7.8  https://support.google.com/mail/?p=BadCredentials 3sm14401738pfp.11 - gsmtp\r\n\" in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:383\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(281): Swift_Transport_AbstractSmtpTransport->_assertResponseCode(\'535-5.7.8 Usern...\', Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(270): Swift_Transport_AbstractSmtpTransport->executeCommand(\'RSET\\r\\n\', Array, Array)\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/Esmtp/Auth/XOAuth2Authenticator.php(55): Swift_Transport_EsmtpTransport->executeCommand(\'RSET\\r\\n\', Array)\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/Esmtp/AuthHandler.php(176): Swift_Transport_Esmtp_Auth_XOAuth2Authenticator->authenticate(Object(Swift_SmtpTransport), \'smtpmail1124@gm...\', \'P@ssw0rd!P\')\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(332): Swift_Transport_Esmtp_AuthHandler->afterEhlo(Object(Swift_SmtpTransport))\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(118): Swift_Transport_EsmtpTransport->_doHeloCommand()\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(79): Swift_Transport_AbstractSmtpTransport->start()\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(394): Swift_Mailer->send(Object(Swift_Message), Array)\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/Mailer.php(69): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(219): October\\Rain\\Mail\\Mailer->send(\'ntran1124.conta...\', Array, Object(Closure))\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#13 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#17 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#19 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#21 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#28 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#37 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#49 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#52 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#55 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#57 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#58 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#59 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#60 {main}', NULL, '2017-05-15 08:10:45', '2017-05-15 08:10:45'),
(11, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:383\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(289): Swift_Transport_AbstractSmtpTransport->_assertResponseCode(\'\', Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(117): Swift_Transport_AbstractSmtpTransport->_readGreeting()\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(79): Swift_Transport_AbstractSmtpTransport->start()\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(394): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/Mailer.php(69): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(219): October\\Rain\\Mail\\Mailer->send(\'ntran1124.conta...\', Array, Object(Closure))\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#17 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#51 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#53 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#55 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#56 {main}', NULL, '2017-05-15 08:17:26', '2017-05-15 08:17:26'),
(12, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:383\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(289): Swift_Transport_AbstractSmtpTransport->_assertResponseCode(\'\', Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(117): Swift_Transport_AbstractSmtpTransport->_readGreeting()\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(79): Swift_Transport_AbstractSmtpTransport->start()\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(394): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/october/rain/src/Mail/Mailer.php(69): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(219): October\\Rain\\Mail\\Mailer->send(\'ntran1124.conta...\', Array, Object(Closure))\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/plugins/ntran1124/contact/components/ContactForm.php(28): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/ComponentBase.php(163): Ntran1124\\Contact\\Components\\ContactForm->onSend()\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onSend\')\n#9 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onSend\')\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#15 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#17 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#24 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#33 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#39 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#42 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#45 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#51 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#53 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#55 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#56 {main}', NULL, '2017-05-15 08:20:22', '2017-05-15 08:20:22');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(13, 'error', 'Twig_Error_Syntax: Unexpected end of template in \"/Users/nguyen/Documents/dev/sandiegohandsurgery/themes/sdhs/pages/contact-us.htm\" at line 8. in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/TokenStream.php:68\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/TokenParser/For.php(43): Twig_TokenStream->next()\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/Parser.php(190): Twig_TokenParser_For->parse(Object(Twig_Token))\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/Parser.php(103): Twig_Parser->subparse(NULL, false)\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/Environment.php(692): Twig_Parser->parse(Object(Twig_TokenStream))\n#4 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/Environment.php(750): Twig_Environment->parse(Object(Twig_TokenStream))\n#5 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/twig/twig/lib/Twig/Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#6 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(365): Twig_Environment->loadTemplate(\'/Users/nguyen/D...\')\n#7 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#8 /Users/nguyen/Documents/dev/sandiegohandsurgery/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact-us\')\n#9 [internal function]: Cms\\Classes\\CmsController->run(\'contact-us\')\n#10 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#11 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#13 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(67): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#19 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#20 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#21 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(673): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#28 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#47 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#49 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#51 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#52 {main}', NULL, '2017-05-15 09:02:33', '2017-05-15 09:02:33'),
(14, 'error', 'Exception: Serialization of \'Closure\' is not allowed in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Store.php:262\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Store.php(262): serialize(Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(88): Illuminate\\Session\\Store->save()\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Session\\Middleware\\StartSession->terminate(Object(Illuminate\\Http\\Request), Object(Illuminate\\Http\\Response))\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(48): Illuminate\\Foundation\\Http\\Kernel->terminate(Object(Illuminate\\Http\\Request), Object(Illuminate\\Http\\Response))\n#4 {main}', NULL, '2017-05-15 09:03:27', '2017-05-15 09:03:27'),
(15, 'error', 'Exception: Serialization of \'Closure\' is not allowed in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Store.php:262\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Store.php(262): serialize(Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(88): Illuminate\\Session\\Store->save()\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Session\\Middleware\\StartSession->terminate(Object(Illuminate\\Http\\Request), Object(Illuminate\\Http\\Response))\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(48): Illuminate\\Foundation\\Http\\Kernel->terminate(Object(Illuminate\\Http\\Request), Object(Illuminate\\Http\\Response))\n#4 {main}', NULL, '2017-05-15 09:03:45', '2017-05-15 09:03:45'),
(16, 'error', 'Exception: Serialization of \'Closure\' is not allowed in /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Store.php:262\nStack trace:\n#0 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Store.php(262): serialize(Array)\n#1 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(88): Illuminate\\Session\\Store->save()\n#2 /Users/nguyen/Documents/dev/sandiegohandsurgery/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Session\\Middleware\\StartSession->terminate(Object(Illuminate\\Http\\Request), Object(Illuminate\\Http\\Response))\n#3 /Users/nguyen/Documents/dev/sandiegohandsurgery/index.php(48): Illuminate\\Foundation\\Http\\Kernel->terminate(Object(Illuminate\\Http\\Request), Object(Illuminate\\Http\\Response))\n#4 {main}', NULL, '2017-05-15 09:53:47', '2017-05-15 09:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>', '{{ content|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-04-10 08:55:19', '2017-04-10 08:55:19'),
(2, 'System', 'system', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-04-10 08:55:19', '2017-04-10 08:55:19');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1494857807'),
(3, 'cms', 'theme', 'active', '\"sdhs\"'),
(4, 'system', 'theme', 'history', '{\"RainLab.Relax\":\"rainlab-relax\"}');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2017-04-10 08:55:18'),
(2, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2017-04-10 09:37:02'),
(3, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2017-04-10 09:37:03'),
(4, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2017-04-10 09:37:03'),
(5, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2017-04-10 09:37:03'),
(6, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2017-04-10 09:37:03'),
(7, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2017-04-10 09:37:03'),
(8, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2017-04-10 09:37:03'),
(9, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2017-04-10 09:37:03'),
(10, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2017-04-10 09:37:03'),
(11, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2017-04-10 09:37:03'),
(12, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2017-04-10 09:37:03'),
(13, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2017-04-10 09:37:03'),
(14, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2017-04-10 09:37:03'),
(15, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2017-04-10 09:37:03'),
(16, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2017-04-10 09:37:03'),
(17, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2017-04-10 09:37:03'),
(18, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2017-04-10 09:37:03'),
(19, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2017-04-10 09:37:03'),
(20, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2017-04-10 09:37:03'),
(21, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2017-04-10 09:37:03'),
(22, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2017-04-10 09:37:03'),
(23, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2017-04-10 09:37:03'),
(24, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2017-04-10 09:37:03'),
(25, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2017-04-10 09:37:03'),
(26, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2017-04-10 09:37:03'),
(27, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2017-04-10 09:37:03'),
(28, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2017-04-10 09:37:03'),
(29, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2017-04-10 09:37:03'),
(30, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2017-04-10 09:37:03'),
(31, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2017-04-10 09:37:03'),
(32, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2017-04-10 09:37:03'),
(33, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2017-04-10 09:37:03'),
(34, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2017-04-10 09:37:03'),
(35, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2017-04-10 09:37:03'),
(36, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2017-04-10 09:37:03'),
(37, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2017-04-10 09:37:03'),
(38, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2017-04-10 09:37:03'),
(39, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2017-04-10 09:37:03'),
(40, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2017-04-10 09:37:03'),
(41, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2017-04-10 09:37:03'),
(42, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2017-04-10 09:37:03'),
(43, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2017-04-10 09:37:03'),
(44, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2017-04-10 09:37:03'),
(45, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2017-04-10 09:37:03'),
(46, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2017-04-10 09:37:03'),
(47, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2017-04-10 09:37:03'),
(48, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2017-04-10 09:37:03'),
(49, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2017-04-10 09:37:03'),
(50, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2017-04-10 09:37:03'),
(51, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2017-04-10 09:37:03'),
(52, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2017-04-10 09:37:03'),
(53, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2017-04-10 09:37:03'),
(54, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2017-04-10 09:37:03'),
(55, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2017-04-10 09:37:03'),
(56, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2017-04-10 09:37:03'),
(57, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2017-04-10 09:37:03'),
(58, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2017-04-10 09:37:03'),
(59, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2017-04-10 09:37:03'),
(60, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2017-04-10 09:37:03'),
(61, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2017-04-10 09:37:03'),
(62, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2017-04-10 09:37:03'),
(63, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2017-04-10 09:37:03'),
(64, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2017-04-10 09:37:03'),
(65, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2017-04-10 09:37:03'),
(66, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2017-04-10 09:37:03'),
(67, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2017-04-10 09:37:03'),
(68, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2017-04-10 09:37:03'),
(69, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2017-04-10 09:37:03'),
(70, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2017-04-10 09:37:03'),
(71, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2017-04-10 09:37:03'),
(72, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2017-04-10 09:37:03'),
(73, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2017-04-10 09:37:03'),
(74, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2017-04-10 09:37:03'),
(75, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2017-04-10 09:37:03'),
(76, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2017-04-10 09:37:03'),
(77, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2017-04-10 09:37:03'),
(78, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2017-04-10 09:37:03'),
(79, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2017-04-10 09:37:03'),
(80, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2017-04-10 09:37:03'),
(81, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2017-04-10 09:37:03'),
(82, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2017-04-10 09:37:03'),
(83, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2017-04-10 09:37:03'),
(84, 'RainLab.User', 'script', '1.0.1', 'create_users_table.php', '2017-04-10 09:37:03'),
(85, 'RainLab.User', 'script', '1.0.1', 'create_throttle_table.php', '2017-04-10 09:37:04'),
(86, 'RainLab.User', 'comment', '1.0.1', 'Initialize plugin.', '2017-04-10 09:37:04'),
(87, 'RainLab.User', 'comment', '1.0.2', 'Seed tables.', '2017-04-10 09:37:04'),
(88, 'RainLab.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings.', '2017-04-10 09:37:04'),
(89, 'RainLab.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager.', '2017-04-10 09:37:04'),
(90, 'RainLab.User', 'comment', '1.0.5', 'Added contact details for users.', '2017-04-10 09:37:04'),
(91, 'RainLab.User', 'script', '1.0.6', 'create_mail_blockers_table.php', '2017-04-10 09:37:04'),
(92, 'RainLab.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates.', '2017-04-10 09:37:04'),
(93, 'RainLab.User', 'comment', '1.0.7', 'Add back-end Settings page.', '2017-04-10 09:37:04'),
(94, 'RainLab.User', 'comment', '1.0.8', 'Updated the Settings page.', '2017-04-10 09:37:04'),
(95, 'RainLab.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2017-04-10 09:37:04'),
(96, 'RainLab.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2017-04-10 09:37:04'),
(97, 'RainLab.User', 'script', '1.0.11', 'users_add_login_column.php', '2017-04-10 09:37:04'),
(98, 'RainLab.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2017-04-10 09:37:04'),
(99, 'RainLab.User', 'script', '1.0.12', 'users_rename_login_to_username.php', '2017-04-10 09:37:04'),
(100, 'RainLab.User', 'comment', '1.0.12', 'Create a dedicated setting for choosing the login mode.', '2017-04-10 09:37:04'),
(101, 'RainLab.User', 'comment', '1.0.13', 'Minor fix to the Account sign in logic.', '2017-04-10 09:37:04'),
(102, 'RainLab.User', 'comment', '1.0.14', 'Minor improvements to the code.', '2017-04-10 09:37:04'),
(103, 'RainLab.User', 'script', '1.0.15', 'users_add_surname.php', '2017-04-10 09:37:04'),
(104, 'RainLab.User', 'comment', '1.0.15', 'Adds last name column to users table (surname).', '2017-04-10 09:37:04'),
(105, 'RainLab.User', 'comment', '1.0.16', 'Require permissions for settings page too.', '2017-04-10 09:37:04'),
(106, 'RainLab.User', 'comment', '1.1.0', '!!! Profile fields and Locations have been removed.', '2017-04-10 09:37:04'),
(107, 'RainLab.User', 'script', '1.1.1', 'create_user_groups_table.php', '2017-04-10 09:37:05'),
(108, 'RainLab.User', 'script', '1.1.1', 'seed_user_groups_table.php', '2017-04-10 09:37:05'),
(109, 'RainLab.User', 'comment', '1.1.1', 'Users can now be added to groups.', '2017-04-10 09:37:05'),
(110, 'RainLab.User', 'comment', '1.1.2', 'A raw URL can now be passed as the redirect property in the Account component.', '2017-04-10 09:37:05'),
(111, 'RainLab.User', 'comment', '1.1.3', 'Adds a super user flag to the users table, reserved for future use.', '2017-04-10 09:37:05'),
(112, 'RainLab.User', 'comment', '1.1.4', 'User list can be filtered by the group they belong to.', '2017-04-10 09:37:05'),
(113, 'RainLab.User', 'comment', '1.1.5', 'Adds a new permission to hide the User settings menu item.', '2017-04-10 09:37:05'),
(114, 'RainLab.User', 'script', '1.2.0', 'users_add_deleted_at.php', '2017-04-10 09:37:05'),
(115, 'RainLab.User', 'comment', '1.2.0', 'Users can now deactivate their own accounts.', '2017-04-10 09:37:05'),
(116, 'RainLab.User', 'comment', '1.2.1', 'New feature for checking if a user is recently active/online.', '2017-04-10 09:37:05'),
(117, 'RainLab.User', 'comment', '1.2.2', 'Add bulk action button to user list.', '2017-04-10 09:37:05'),
(118, 'RainLab.User', 'comment', '1.2.3', 'Included some descriptive paragraphs in the Reset Password component markup.', '2017-04-10 09:37:05'),
(119, 'RainLab.User', 'comment', '1.2.4', 'Added a checkbox for blocking all mail sent to the user.', '2017-04-10 09:37:05'),
(120, 'RainLab.User', 'script', '1.2.5', 'update_timestamp_nullable.php', '2017-04-10 09:37:05'),
(121, 'RainLab.User', 'comment', '1.2.5', 'Database maintenance. Updated all timestamp columns to be nullable.', '2017-04-10 09:37:05'),
(122, 'RainLab.User', 'script', '1.2.6', 'users_add_last_seen.php', '2017-04-10 09:37:05'),
(123, 'RainLab.User', 'comment', '1.2.6', 'Add a dedicated last seen column for users.', '2017-04-10 09:37:05'),
(124, 'RainLab.User', 'comment', '1.2.7', 'Minor fix to user timestamp attributes.', '2017-04-10 09:37:05'),
(125, 'RainLab.User', 'comment', '1.2.8', 'Add date range filter to users list. Introduced a logout event.', '2017-04-10 09:37:05'),
(126, 'RainLab.User', 'comment', '1.2.9', 'Add invitation mail for new accounts created in the back-end.', '2017-04-10 09:37:05'),
(127, 'RainLab.User', 'script', '1.3.0', 'users_add_guest_flag.php', '2017-04-10 09:37:05'),
(128, 'RainLab.User', 'script', '1.3.0', 'users_add_superuser_flag.php', '2017-04-10 09:37:05'),
(129, 'RainLab.User', 'comment', '1.3.0', 'Introduced guest user accounts.', '2017-04-10 09:37:05'),
(130, 'RainLab.User', 'comment', '1.3.1', 'User notification variables can now be extended.', '2017-04-10 09:37:05'),
(131, 'RainLab.User', 'comment', '1.3.2', 'Minor fix to the Auth::register method.', '2017-04-10 09:37:05'),
(132, 'RainLab.User', 'comment', '1.3.3', 'Allow prevention of concurrent user sessions via the user settings.', '2017-04-10 09:37:05'),
(133, 'RainLab.User', 'comment', '1.3.4', 'Added force secure protocol property to the account component.', '2017-04-10 09:37:05'),
(134, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2017-05-15 06:17:03'),
(135, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2017-05-15 06:17:03'),
(136, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2017-05-15 06:17:03'),
(137, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2017-05-15 06:17:03'),
(138, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2017-05-15 06:17:03'),
(139, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2017-05-15 06:17:03'),
(140, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2017-05-15 06:17:03'),
(141, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2017-05-15 06:17:03'),
(142, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2017-05-15 06:17:03'),
(143, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2017-05-15 06:17:03'),
(144, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2017-05-15 06:17:03'),
(145, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2017-05-15 06:17:03'),
(146, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2017-05-15 06:17:03'),
(147, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2017-05-15 06:17:03'),
(148, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2017-05-15 06:17:03'),
(149, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2017-05-15 06:17:03'),
(150, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2017-05-15 06:17:03'),
(151, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2017-05-15 06:17:03'),
(152, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2017-05-15 06:17:03'),
(153, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.', '2017-05-15 06:17:03'),
(154, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2017-05-15 06:17:03'),
(155, 'Ntran1124.Contact', 'comment', '1.0.1', 'Initialize plugin.', '2017-05-15 06:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2017-04-10 08:55:18', 0, 0),
(2, 'RainLab.Blog', '1.2.16', '2017-04-10 09:37:03', 0, 0),
(3, 'RainLab.Pages', '1.2.16', '2017-04-10 09:37:03', 0, 0),
(4, 'RainLab.User', '1.3.4', '2017-04-10 09:37:05', 0, 0),
(5, 'RainLab.Builder', '1.0.21', '2017-05-15 06:17:03', 0, 0),
(6, 'Ntran1124.Contact', '1.0.1', '2017-05-15 06:24:55', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'rainlab_builder_settings', '{\"author_name\":\"ntran1124\",\"author_namespace\":\"Ntran1124\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Guest', 'guest', 'Default group for guest users.', '2017-04-10 09:37:05', '2017-04-10 09:37:05'),
(2, 'Registered', 'registered', 'Default group for registered users.', '2017-04-10 09:37:05', '2017-04-10 09:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_throttle`
--

CREATE TABLE `user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`);

--
-- Indexes for table `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Indexes for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Indexes for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Indexes for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Indexes for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Indexes for table `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Indexes for table `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_user_mail_blockers_email_index` (`email`),
  ADD KEY `rainlab_user_mail_blockers_template_index` (`template`),
  ADD KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Indexes for table `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Indexes for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Indexes for table `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Indexes for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Indexes for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Indexes for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_login_unique` (`username`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`),
  ADD KEY `users_login_index` (`username`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_groups_code_index` (`code`);

--
-- Indexes for table `user_throttle`
--
ALTER TABLE `user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_throttle_user_id_index` (`user_id`),
  ADD KEY `user_throttle_ip_address_index` (`ip_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
--
-- AUTO_INCREMENT for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_throttle`
--
ALTER TABLE `user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

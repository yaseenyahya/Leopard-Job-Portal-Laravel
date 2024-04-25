# ************************************************************
# Sequel Ace SQL dump
# Version 3038
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.23)
# Database: test2
# Generation Time: 2022-09-01 06:45:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table abouts
# ------------------------------------------------------------

create Database jobportal;

use jobportal;

DROP TABLE IF EXISTS `abouts`;

CREATE TABLE `abouts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `about_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `about_sub_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `about_description` text COLLATE utf8_unicode_ci NOT NULL,
  `about_brand_logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-1.png',
  `about_brand_logo1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-2.png',
  `about_brand_logo2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-3.png',
  `about_brand_logo3` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-1.png',
  `about_brand_logo4` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-2.png',
  `about_brand_logo5` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-3.png',
  `about_banner_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img3` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table admin_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_searches`;

CREATE TABLE `admin_searches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin@mail.com','2022-09-01 06:40:11','$2y$10$pZRo3EUTt/gZ3ELy8VXU6.d3vRpqRUQu.fWvEP8/wlL6.r2s9902y','backend/image/default.png','BROwUOnbwz','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table application_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `application_groups`;

CREATE TABLE `application_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint NOT NULL DEFAULT '0',
  `is_deleteable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_groups_company_id_foreign` (`company_id`),
  CONSTRAINT `application_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table applied_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `applied_jobs`;

CREATE TABLE `applied_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_resume_id` bigint unsigned NOT NULL,
  `cover_letter` longtext COLLATE utf8_unicode_ci,
  `application_group_id` bigint unsigned NOT NULL,
  `order` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `applied_jobs_candidate_id_foreign` (`candidate_id`),
  KEY `applied_jobs_job_id_foreign` (`job_id`),
  KEY `applied_jobs_candidate_resume_id_foreign` (`candidate_resume_id`),
  KEY `applied_jobs_application_group_id_foreign` (`application_group_id`),
  CONSTRAINT `applied_jobs_application_group_id_foreign` FOREIGN KEY (`application_group_id`) REFERENCES `application_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `applied_jobs_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `applied_jobs_candidate_resume_id_foreign` FOREIGN KEY (`candidate_resume_id`) REFERENCES `candidate_resumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `applied_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table auth_candidates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_candidates`;

CREATE TABLE `auth_candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_candidates_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table auth_companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_companies`;

CREATE TABLE `auth_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_companies_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table bookmark_candidate_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookmark_candidate_company`;

CREATE TABLE `bookmark_candidate_company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmark_candidate_company_candidate_id_foreign` (`candidate_id`),
  KEY `bookmark_candidate_company_company_id_foreign` (`company_id`),
  CONSTRAINT `bookmark_candidate_company_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmark_candidate_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table bookmark_candidate_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookmark_candidate_job`;

CREATE TABLE `bookmark_candidate_job` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmark_candidate_job_candidate_id_foreign` (`candidate_id`),
  KEY `bookmark_candidate_job_job_id_foreign` (`job_id`),
  CONSTRAINT `bookmark_candidate_job_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmark_candidate_job_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table bookmark_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookmark_company`;

CREATE TABLE `bookmark_company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `candidate_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmark_company_company_id_foreign` (`company_id`),
  KEY `bookmark_company_candidate_id_foreign` (`candidate_id`),
  KEY `bookmark_company_category_id_foreign` (`category_id`),
  CONSTRAINT `bookmark_company_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmark_company_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `company_bookmark_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmark_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table bookmark_company_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookmark_company_category`;

CREATE TABLE `bookmark_company_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bookmark_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmark_company_category_bookmark_id_foreign` (`bookmark_id`),
  KEY `bookmark_company_category_category_id_foreign` (`category_id`),
  CONSTRAINT `bookmark_company_category_bookmark_id_foreign` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmark_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmark_company_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `company_bookmark_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table candidate_resumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `candidate_resumes`;

CREATE TABLE `candidate_resumes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_resumes_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_resumes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table candidates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `profession_id` bigint unsigned DEFAULT NULL,
  `experience_id` bigint unsigned DEFAULT NULL,
  `education_id` bigint unsigned DEFAULT NULL,
  `nationality_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `marital_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `cv_visibility` tinyint(1) NOT NULL DEFAULT '1',
  `received_job_alert` tinyint(1) NOT NULL DEFAULT '1',
  `profile_complete` int NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidates_user_id_foreign` (`user_id`),
  KEY `candidates_role_id_foreign` (`role_id`),
  KEY `candidates_profession_id_foreign` (`profession_id`),
  KEY `candidates_experience_id_foreign` (`experience_id`),
  KEY `candidates_education_id_foreign` (`education_id`),
  KEY `candidates_nationality_id_foreign` (`nationality_id`),
  CONSTRAINT `candidates_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidates_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidates_nationality_id_foreign` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidates_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidates_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` bigint unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_state_id_foreign` (`state_id`),
  CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms`;

CREATE TABLE `cms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `about_brand_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_brand_logo1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_brand_logo2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_brand_logo3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_brand_logo4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_brand_logo5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_banner_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_banner_img1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_banner_img2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_banner_img3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mission_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employers_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_map` text COLLATE utf8_unicode_ci NOT NULL,
  `register_page_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_page_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_page_banner_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page403_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page404_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page500_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page503_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comingsoon_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_phone_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_address` text COLLATE utf8_unicode_ci,
  `footer_facebook_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_instagram_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_twitter_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_youtube_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `privary_page` longtext COLLATE utf8_unicode_ci,
  `terms_page` longtext COLLATE utf8_unicode_ci,
  `maintenance_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cms` WRITE;
/*!40000 ALTER TABLE `cms` DISABLE KEYS */;

INSERT INTO `cms` (`id`, `about_brand_logo`, `about_brand_logo1`, `about_brand_logo2`, `about_brand_logo3`, `about_brand_logo4`, `about_brand_logo5`, `about_banner_img`, `about_banner_img1`, `about_banner_img2`, `about_banner_img3`, `mission_image`, `candidate_image`, `employers_image`, `contact_map`, `register_page_image`, `login_page_image`, `home_page_banner_image`, `page403_image`, `page404_image`, `page500_image`, `page503_image`, `comingsoon_image`, `footer_phone_no`, `footer_address`, `footer_facebook_link`, `footer_instagram_link`, `footer_twitter_link`, `footer_youtube_link`, `privary_page`, `terms_page`, `maintenance_image`, `created_at`, `updated_at`)
VALUES
	(1,'frontend/assets/images/all-img/brand-1.png','frontend/assets/images/all-img/brand-2.png','frontend/assets/images/all-img/brand-1.png','frontend/assets/images/all-img/brand-2.png','frontend/assets/images/all-img/brand-1.png','frontend/assets/images/all-img/brand-2.png','frontend/assets/images/banner/about-banner-1.jpg','frontend/assets/images/banner/about-banner-2.jpg','frontend/assets/images/banner/about-banner-3.jpg','frontend/assets/images/banner/about-banner-4.jpg','frontend/assets/images/banner/about-banner-5.png','frontend/assets/images/all-img/cta-1.png','frontend/assets/images/all-img/cta-2.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.2278794778554!2d90.34898411536302!3d23.77489829375602!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c1e1938cc90b%3A0xbcfacb6b89117685!2sZakir%20Soft%20-%20Innovative%20Software%20%26%20Web%20Development%20Solutions!5e0!3m2!1sen!2sbd!4v1629355846404!5m2!1sen!2sbd\" width=\"100%\" height=\"536\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>','frontend/assets/images/all-img/auth-img.png','frontend/assets/images/all-img/auth-img.png',NULL,'frontend/assets/images/banner/error-banner.png','frontend/assets/images/banner/error-banner.png','frontend/assets/images/banner/error-banner.png','frontend/assets/images/banner/error-banner.png','frontend/assets/images/all-img/coming-banner.png','319-555-0115','6391 Elgin St. Celina, Delaware 10299, New York, United States of America','https://www.facebook.com/zakirsoft','https://www.instagram.com/zakirsoft','https://www.twitter.com/zakirsoft','https://www.youtube.com/zakirsoft','<h2>01. Privacy Policy</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>','<h2>01. Terms &amp; Condition</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>','frontend/assets/images/all-img/coming-banner.png','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `cms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_contents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_contents`;

CREATE TABLE `cms_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cms_contents` WRITE;
/*!40000 ALTER TABLE `cms_contents` DISABLE KEYS */;

INSERT INTO `cms_contents` (`id`, `page_slug`, `translation_code`, `text`, `created_at`, `updated_at`)
VALUES
	(1,'terms_condition_page','en','<h2>01. Terms &amp; Condition</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'privacy_page','en','<h2>01. Privacy Policy</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `cms_contents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `industry_type_id` bigint unsigned NOT NULL,
  `organization_type_id` bigint unsigned NOT NULL,
  `team_size_id` bigint unsigned DEFAULT NULL,
  `nationality_id` bigint unsigned NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `profile_completion` tinyint(1) NOT NULL DEFAULT '0',
  `bio` text COLLATE utf8_unicode_ci,
  `vision` text COLLATE utf8_unicode_ci,
  `total_views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_user_id_foreign` (`user_id`),
  KEY `companies_industry_type_id_foreign` (`industry_type_id`),
  KEY `companies_organization_type_id_foreign` (`organization_type_id`),
  KEY `companies_team_size_id_foreign` (`team_size_id`),
  KEY `companies_nationality_id_foreign` (`nationality_id`),
  CONSTRAINT `companies_industry_type_id_foreign` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `companies_nationality_id_foreign` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `companies_organization_type_id_foreign` FOREIGN KEY (`organization_type_id`) REFERENCES `organization_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `companies_team_size_id_foreign` FOREIGN KEY (`team_size_id`) REFERENCES `team_sizes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table company_applied_job_rejected
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company_applied_job_rejected`;

CREATE TABLE `company_applied_job_rejected` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `applied_job_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_applied_job_rejected_company_id_foreign` (`company_id`),
  KEY `company_applied_job_rejected_applied_job_id_foreign` (`applied_job_id`),
  CONSTRAINT `company_applied_job_rejected_applied_job_id_foreign` FOREIGN KEY (`applied_job_id`) REFERENCES `applied_jobs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_applied_job_rejected_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table company_applied_job_shortlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company_applied_job_shortlist`;

CREATE TABLE `company_applied_job_shortlist` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `applied_job_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_applied_job_shortlist_company_id_foreign` (`company_id`),
  KEY `company_applied_job_shortlist_applied_job_id_foreign` (`applied_job_id`),
  CONSTRAINT `company_applied_job_shortlist_applied_job_id_foreign` FOREIGN KEY (`applied_job_id`) REFERENCES `applied_jobs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_applied_job_shortlist_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table company_bookmark_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company_bookmark_categories`;

CREATE TABLE `company_bookmark_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_bookmark_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `company_bookmark_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_infos`;

CREATE TABLE `contact_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_infos_user_id_foreign` (`user_id`),
  CONSTRAINT `contact_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cookies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookies`;

CREATE TABLE `cookies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `allow_cookies` tinyint(1) NOT NULL DEFAULT '1',
  `cookie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gdpr_cookie',
  `cookie_expiration` tinyint NOT NULL DEFAULT '30',
  `force_consent` tinyint(1) NOT NULL DEFAULT '0',
  `darkmode` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `approve_button_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `decline_button_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cookies` WRITE;
/*!40000 ALTER TABLE `cookies` DISABLE KEYS */;

INSERT INTO `cookies` (`id`, `allow_cookies`, `cookie_name`, `cookie_expiration`, `force_consent`, `darkmode`, `language`, `title`, `description`, `approve_button_text`, `decline_button_text`, `created_at`, `updated_at`)
VALUES
	(1,1,'gdpr_cookie',30,0,0,'en','We use cookies!','Hi, this website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. The latter will be set only after consent. <button type=\"button\" data-cc=\"c-settings\" class=\"cc-link\">Let me choose</button>','Allow all Cookies','Reject all Cookies','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `cookies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `name`, `image`, `slug`, `icon`, `sortname`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Aruba','backend/image/flags/flag-of-Aruba.jpg','aruba','flag-icon-aw','AW',12.5,-69.96666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(2,'Afghanistan','backend/image/flags/flag-of-Afghanistan.jpg','afghanistan','flag-icon-af','AF',33,65,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(3,'Angola','backend/image/flags/flag-of-Angola.jpg','angola','flag-icon-ao','AO',-12.5,18.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(4,'Anguilla','backend/image/flags/flag-of-Anguilla.jpg','anguilla','flag-icon-ai','AI',18.25,-63.16666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(5,'Åland Islands','backend/image/flags/flag-of-Åland-Islands.jpg','aland-islands','flag-icon-ax','AX',60.116667,19.9,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(6,'Albania','backend/image/flags/flag-of-Albania.jpg','albania','flag-icon-al','AL',41,20,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(7,'Andorra','backend/image/flags/flag-of-Andorra.jpg','andorra','flag-icon-ad','AD',42.5,1.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(8,'United Arab Emirates','backend/image/flags/flag-of-United-Arab-Emirates.jpg','united-arab-emirates','flag-icon-ae','AE',24,54,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(9,'Argentina','backend/image/flags/flag-of-Argentina.jpg','argentina','flag-icon-ar','AR',-34,-64,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(10,'Armenia','backend/image/flags/flag-of-Armenia.jpg','armenia','flag-icon-am','AM',40,45,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(11,'American Samoa','backend/image/flags/flag-of-American-Samoa.jpg','american-samoa','flag-icon-as','AS',-14.33333333,-170,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(12,'Antarctica','backend/image/flags/flag-of-Antarctica.jpg','antarctica','flag-icon-aq','AQ',-90,0,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(13,'French Southern and Antarctic Lands','backend/image/flags/flag-of-French-Southern-and-Antarctic-Lands.jpg','french-southern-and-antarctic-lands','flag-icon-tf','TF',-49.25,69.167,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(14,'Antigua and Barbuda','backend/image/flags/flag-of-Antigua-and-Barbuda.jpg','antigua-and-barbuda','flag-icon-ag','AG',17.05,-61.8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(15,'Australia','backend/image/flags/flag-of-Australia.jpg','australia','flag-icon-au','AU',-27,133,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(16,'Austria','backend/image/flags/flag-of-Austria.jpg','austria','flag-icon-at','AT',47.33333333,13.33333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(17,'Azerbaijan','backend/image/flags/flag-of-Azerbaijan.jpg','azerbaijan','flag-icon-az','AZ',40.5,47.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(18,'Burundi','backend/image/flags/flag-of-Burundi.jpg','burundi','flag-icon-bi','BI',-3.5,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(19,'Belgium','backend/image/flags/flag-of-Belgium.jpg','belgium','flag-icon-be','BE',50.83333333,4,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(20,'Benin','backend/image/flags/flag-of-Benin.jpg','benin','flag-icon-bj','BJ',9.5,2.25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(21,'Burkina Faso','backend/image/flags/flag-of-Burkina-Faso.jpg','burkina-faso','flag-icon-bf','BF',13,-2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(22,'Bangladesh','backend/image/flags/flag-of-Bangladesh.jpg','bangladesh','flag-icon-bd','BD',24,90,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(23,'Bulgaria','backend/image/flags/flag-of-Bulgaria.jpg','bulgaria','flag-icon-bg','BG',43,25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(24,'Bahrain','backend/image/flags/flag-of-Bahrain.jpg','bahrain','flag-icon-bh','BH',26,50.55,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(25,'Bahamas','backend/image/flags/flag-of-Bahamas.jpg','bahamas','flag-icon-bs','BS',24.25,-76,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(26,'Bosnia and Herzegovina','backend/image/flags/flag-of-Bosnia-and-Herzegovina.jpg','bosnia-and-herzegovina','flag-icon-ba','BA',44,18,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(27,'Saint Barthélemy','backend/image/flags/flag-of-Saint-Barthélemy.jpg','saint-barthelemy','flag-icon-bl','BL',18.5,-63.41666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(28,'Belarus','backend/image/flags/flag-of-Belarus.jpg','belarus','flag-icon-by','BY',53,28,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(29,'Belize','backend/image/flags/flag-of-Belize.jpg','belize','flag-icon-bz','BZ',17.25,-88.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(30,'Bermuda','backend/image/flags/flag-of-Bermuda.jpg','bermuda','flag-icon-bm','BM',32.33333333,-64.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(31,'Bolivia','backend/image/flags/flag-of-Bolivia.jpg','bolivia','flag-icon-bo','BO',-17,-65,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(32,'Brazil','backend/image/flags/flag-of-Brazil.jpg','brazil','flag-icon-br','BR',-10,-55,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(33,'Barbados','backend/image/flags/flag-of-Barbados.jpg','barbados','flag-icon-bb','BB',13.16666666,-59.53333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(34,'Brunei','backend/image/flags/flag-of-Brunei.jpg','brunei','flag-icon-bn','BN',4.5,114.66666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(35,'Bhutan','backend/image/flags/flag-of-Bhutan.jpg','bhutan','flag-icon-bt','BT',27.5,90.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(36,'Bouvet Island','backend/image/flags/flag-of-Bouvet-Island.jpg','bouvet-island','flag-icon-bv','BV',-54.43333333,3.4,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(37,'Botswana','backend/image/flags/flag-of-Botswana.jpg','botswana','flag-icon-bw','BW',-22,24,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(38,'Central African Republic','backend/image/flags/flag-of-Central-African-Republic.jpg','central-african-republic','flag-icon-cf','CF',7,21,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(39,'Canada','backend/image/flags/flag-of-Canada.jpg','canada','flag-icon-ca','CA',60,-95,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(40,'Cocos (Keeling) Islands','backend/image/flags/flag-of-Cocos-(Keeling)-Islands.jpg','cocos-keeling-islands','flag-icon-cc','CC',-12.5,96.83333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(41,'Switzerland','backend/image/flags/flag-of-Switzerland.jpg','switzerland','flag-icon-ch','CH',47,8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(42,'Chile','backend/image/flags/flag-of-Chile.jpg','chile','flag-icon-cl','CL',-30,-71,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(43,'China','backend/image/flags/flag-of-China.jpg','china','flag-icon-cn','CN',35,105,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(44,'Ivory Coast','backend/image/flags/flag-of-Ivory-Coast.jpg','ivory-coast','flag-icon-ci','CI',8,-5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(45,'Cameroon','backend/image/flags/flag-of-Cameroon.jpg','cameroon','flag-icon-cm','CM',6,12,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(46,'DR Congo','backend/image/flags/flag-of-DR-Congo.jpg','dr-congo','flag-icon-cd','CD',0,25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(47,'Republic of the Congo','backend/image/flags/flag-of-Republic-of-the-Congo.jpg','republic-of-the-congo','flag-icon-cg','CG',-1,15,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(48,'Cook Islands','backend/image/flags/flag-of-Cook-Islands.jpg','cook-islands','flag-icon-ck','CK',-21.23333333,-159.76666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(49,'Colombia','backend/image/flags/flag-of-Colombia.jpg','colombia','flag-icon-co','CO',4,-72,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(50,'Comoros','backend/image/flags/flag-of-Comoros.jpg','comoros','flag-icon-km','KM',-12.16666666,44.25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(51,'Cape Verde','backend/image/flags/flag-of-Cape-Verde.jpg','cape-verde','flag-icon-cv','CV',16,-24,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(52,'Costa Rica','backend/image/flags/flag-of-Costa-Rica.jpg','costa-rica','flag-icon-cr','CR',10,-84,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(53,'Cuba','backend/image/flags/flag-of-Cuba.jpg','cuba','flag-icon-cu','CU',21.5,-80,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(54,'Curaçao','backend/image/flags/flag-of-Curaçao.jpg','curacao','flag-icon-cw','CW',12.116667,-68.933333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(55,'Christmas Island','backend/image/flags/flag-of-Christmas-Island.jpg','christmas-island','flag-icon-cx','CX',-10.5,105.66666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(56,'Cayman Islands','backend/image/flags/flag-of-Cayman-Islands.jpg','cayman-islands','flag-icon-ky','KY',19.5,-80.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(57,'Cyprus','backend/image/flags/flag-of-Cyprus.jpg','cyprus','flag-icon-cy','CY',35,33,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(58,'Czech Republic','backend/image/flags/flag-of-Czech-Republic.jpg','czech-republic','flag-icon-cz','CZ',49.75,15.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(59,'Germany','backend/image/flags/flag-of-Germany.jpg','germany','flag-icon-de','DE',51,9,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(60,'Djibouti','backend/image/flags/flag-of-Djibouti.jpg','djibouti','flag-icon-dj','DJ',11.5,43,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(61,'Dominica','backend/image/flags/flag-of-Dominica.jpg','dominica','flag-icon-dm','DM',15.41666666,-61.33333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(62,'Denmark','backend/image/flags/flag-of-Denmark.jpg','denmark','flag-icon-dk','DK',56,10,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(63,'Dominican Republic','backend/image/flags/flag-of-Dominican-Republic.jpg','dominican-republic','flag-icon-do','DO',19,-70.66666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(64,'Algeria','backend/image/flags/flag-of-Algeria.jpg','algeria','flag-icon-dz','DZ',28,3,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(65,'Ecuador','backend/image/flags/flag-of-Ecuador.jpg','ecuador','flag-icon-ec','EC',-2,-77.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(66,'Egypt','backend/image/flags/flag-of-Egypt.jpg','egypt','flag-icon-eg','EG',27,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(67,'Eritrea','backend/image/flags/flag-of-Eritrea.jpg','eritrea','flag-icon-er','ER',15,39,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(68,'Western Sahara','backend/image/flags/flag-of-Western-Sahara.jpg','western-sahara','flag-icon-eh','EH',24.5,-13,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(69,'Spain','backend/image/flags/flag-of-Spain.jpg','spain','flag-icon-es','ES',40,-4,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(70,'Estonia','backend/image/flags/flag-of-Estonia.jpg','estonia','flag-icon-ee','EE',59,26,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(71,'Ethiopia','backend/image/flags/flag-of-Ethiopia.jpg','ethiopia','flag-icon-et','ET',8,38,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(72,'Finland','backend/image/flags/flag-of-Finland.jpg','finland','flag-icon-fi','FI',64,26,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(73,'Fiji','backend/image/flags/flag-of-Fiji.jpg','fiji','flag-icon-fj','FJ',-18,175,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(74,'Falkland Islands','backend/image/flags/flag-of-Falkland-Islands.jpg','falkland-islands','flag-icon-fk','FK',-51.75,-59,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(75,'France','backend/image/flags/flag-of-France.jpg','france','flag-icon-fr','FR',46,2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(76,'Faroe Islands','backend/image/flags/flag-of-Faroe-Islands.jpg','faroe-islands','flag-icon-fo','FO',62,-7,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(77,'Micronesia','backend/image/flags/flag-of-Micronesia.jpg','micronesia','flag-icon-fm','FM',6.91666666,158.25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(78,'Gabon','backend/image/flags/flag-of-Gabon.jpg','gabon','flag-icon-ga','GA',-1,11.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(79,'United Kingdom','backend/image/flags/flag-of-United-Kingdom.jpg','united-kingdom','flag-icon-gb','GB',54,-2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(80,'Georgia','backend/image/flags/flag-of-Georgia.jpg','georgia','flag-icon-ge','GE',42,43.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(81,'Guernsey','backend/image/flags/flag-of-Guernsey.jpg','guernsey','flag-icon-gg','GG',49.46666666,-2.58333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(82,'Ghana','backend/image/flags/flag-of-Ghana.jpg','ghana','flag-icon-gh','GH',8,-2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(83,'Gibraltar','backend/image/flags/flag-of-Gibraltar.jpg','gibraltar','flag-icon-gi','GI',36.13333333,-5.35,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(84,'Guinea','backend/image/flags/flag-of-Guinea.jpg','guinea','flag-icon-gn','GN',11,-10,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(85,'Guadeloupe','backend/image/flags/flag-of-Guadeloupe.jpg','guadeloupe','flag-icon-gp','GP',16.25,-61.583333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(86,'Gambia','backend/image/flags/flag-of-Gambia.jpg','gambia','flag-icon-gm','GM',13.46666666,-16.56666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(87,'Guinea-Bissau','backend/image/flags/flag-of-Guinea-Bissau.jpg','guinea-bissau','flag-icon-gw','GW',12,-15,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(88,'Equatorial Guinea','backend/image/flags/flag-of-Equatorial-Guinea.jpg','equatorial-guinea','flag-icon-gq','GQ',2,10,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(89,'Greece','backend/image/flags/flag-of-Greece.jpg','greece','flag-icon-gr','GR',39,22,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(90,'Grenada','backend/image/flags/flag-of-Grenada.jpg','grenada','flag-icon-gd','GD',12.11666666,-61.66666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(91,'Greenland','backend/image/flags/flag-of-Greenland.jpg','greenland','flag-icon-gl','GL',72,-40,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(92,'Guatemala','backend/image/flags/flag-of-Guatemala.jpg','guatemala','flag-icon-gt','GT',15.5,-90.25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(93,'French Guiana','backend/image/flags/flag-of-French-Guiana.jpg','french-guiana','flag-icon-gf','GF',4,-53,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(94,'Guam','backend/image/flags/flag-of-Guam.jpg','guam','flag-icon-gu','GU',13.46666666,144.78333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(95,'Guyana','backend/image/flags/flag-of-Guyana.jpg','guyana','flag-icon-gy','GY',5,-59,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(96,'Hong Kong','backend/image/flags/flag-of-Hong-Kong.jpg','hong-kong','flag-icon-hk','HK',22.267,114.188,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(97,'Honduras','backend/image/flags/flag-of-Honduras.jpg','honduras','flag-icon-hn','HN',15,-86.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(98,'Croatia','backend/image/flags/flag-of-Croatia.jpg','croatia','flag-icon-hr','HR',45.16666666,15.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(99,'Haiti','backend/image/flags/flag-of-Haiti.jpg','haiti','flag-icon-ht','HT',19,-72.41666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(100,'Hungary','backend/image/flags/flag-of-Hungary.jpg','hungary','flag-icon-hu','HU',47,20,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(101,'Indonesia','backend/image/flags/flag-of-Indonesia.jpg','indonesia','flag-icon-id','ID',-5,120,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(102,'Isle of Man','backend/image/flags/flag-of-Isle-of-Man.jpg','isle-of-man','flag-icon-im','IM',54.25,-4.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(103,'India','backend/image/flags/flag-of-India.jpg','india','flag-icon-in','IN',20,77,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(104,'British Indian Ocean Territory','backend/image/flags/flag-of-British-Indian-Ocean-Territory.jpg','british-indian-ocean-territory','flag-icon-io','IO',-6,71.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(105,'Ireland','backend/image/flags/flag-of-Ireland.jpg','ireland','flag-icon-ie','IE',53,-8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(106,'Iran','backend/image/flags/flag-of-Iran.jpg','iran','flag-icon-ir','IR',32,53,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(107,'Iraq','backend/image/flags/flag-of-Iraq.jpg','iraq','flag-icon-iq','IQ',33,44,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(108,'Iceland','backend/image/flags/flag-of-Iceland.jpg','iceland','flag-icon-is','IS',65,-18,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(109,'Israel','backend/image/flags/flag-of-Israel.jpg','israel','flag-icon-il','IL',31.47,35.13,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(110,'Italy','backend/image/flags/flag-of-Italy.jpg','italy','flag-icon-it','IT',42.83333333,12.83333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(111,'Jamaica','backend/image/flags/flag-of-Jamaica.jpg','jamaica','flag-icon-jm','JM',18.25,-77.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(112,'Jersey','backend/image/flags/flag-of-Jersey.jpg','jersey','flag-icon-je','JE',49.25,-2.16666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(113,'Jordan','backend/image/flags/flag-of-Jordan.jpg','jordan','flag-icon-jo','JO',31,36,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(114,'Japan','backend/image/flags/flag-of-Japan.jpg','japan','flag-icon-jp','JP',36,138,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(115,'Kazakhstan','backend/image/flags/flag-of-Kazakhstan.jpg','kazakhstan','flag-icon-kz','KZ',48,68,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(116,'Kenya','backend/image/flags/flag-of-Kenya.jpg','kenya','flag-icon-ke','KE',1,38,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(117,'Kyrgyzstan','backend/image/flags/flag-of-Kyrgyzstan.jpg','kyrgyzstan','flag-icon-kg','KG',41,75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(118,'Cambodia','backend/image/flags/flag-of-Cambodia.jpg','cambodia','flag-icon-kh','KH',13,105,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(119,'Kiribati','backend/image/flags/flag-of-Kiribati.jpg','kiribati','flag-icon-ki','KI',1.41666666,173,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(120,'Saint Kitts and Nevis','backend/image/flags/flag-of-Saint-Kitts-and-Nevis.jpg','saint-kitts-and-nevis','flag-icon-kn','KN',17.33333333,-62.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(121,'South Korea','backend/image/flags/flag-of-South-Korea.jpg','south-korea','flag-icon-kr','KR',37,127.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(122,'Kosovo','backend/image/flags/flag-of-Kosovo.jpg','kosovo','flag-icon-xk','XK',42.666667,21.166667,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(123,'Kuwait','backend/image/flags/flag-of-Kuwait.jpg','kuwait','flag-icon-kw','KW',29.5,45.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(124,'Laos','backend/image/flags/flag-of-Laos.jpg','laos','flag-icon-la','LA',18,105,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(125,'Lebanon','backend/image/flags/flag-of-Lebanon.jpg','lebanon','flag-icon-lb','LB',33.83333333,35.83333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(126,'Liberia','backend/image/flags/flag-of-Liberia.jpg','liberia','flag-icon-lr','LR',6.5,-9.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(127,'Libya','backend/image/flags/flag-of-Libya.jpg','libya','flag-icon-ly','LY',25,17,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(128,'Saint Lucia','backend/image/flags/flag-of-Saint-Lucia.jpg','saint-lucia','flag-icon-lc','LC',13.88333333,-60.96666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(129,'Liechtenstein','backend/image/flags/flag-of-Liechtenstein.jpg','liechtenstein','flag-icon-li','LI',47.26666666,9.53333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(130,'Sri Lanka','backend/image/flags/flag-of-Sri-Lanka.jpg','sri-lanka','flag-icon-lk','LK',7,81,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(131,'Lesotho','backend/image/flags/flag-of-Lesotho.jpg','lesotho','flag-icon-ls','LS',-29.5,28.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(132,'Lithuania','backend/image/flags/flag-of-Lithuania.jpg','lithuania','flag-icon-lt','LT',56,24,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(133,'Luxembourg','backend/image/flags/flag-of-Luxembourg.jpg','luxembourg','flag-icon-lu','LU',49.75,6.16666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(134,'Latvia','backend/image/flags/flag-of-Latvia.jpg','latvia','flag-icon-lv','LV',57,25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(135,'Macau','backend/image/flags/flag-of-Macau.jpg','macau','flag-icon-mo','MO',22.16666666,113.55,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(136,'Saint Martin','backend/image/flags/flag-of-Saint-Martin.jpg','saint-martin','flag-icon-mf','MF',18.08333333,-63.95,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(137,'Morocco','backend/image/flags/flag-of-Morocco.jpg','morocco','flag-icon-ma','MA',32,-5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(138,'Monaco','backend/image/flags/flag-of-Monaco.jpg','monaco','flag-icon-mc','MC',43.73333333,7.4,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(139,'Moldova','backend/image/flags/flag-of-Moldova.jpg','moldova','flag-icon-md','MD',47,29,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(140,'Madagascar','backend/image/flags/flag-of-Madagascar.jpg','madagascar','flag-icon-mg','MG',-20,47,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(141,'Maldives','backend/image/flags/flag-of-Maldives.jpg','maldives','flag-icon-mv','MV',3.25,73,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(142,'Mexico','backend/image/flags/flag-of-Mexico.jpg','mexico','flag-icon-mx','MX',23,-102,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(143,'Marshall Islands','backend/image/flags/flag-of-Marshall-Islands.jpg','marshall-islands','flag-icon-mh','MH',9,168,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(144,'Macedonia','backend/image/flags/flag-of-Macedonia.jpg','macedonia','flag-icon-mk','MK',41.83333333,22,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(145,'Mali','backend/image/flags/flag-of-Mali.jpg','mali','flag-icon-ml','ML',17,-4,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(146,'Malta','backend/image/flags/flag-of-Malta.jpg','malta','flag-icon-mt','MT',35.83333333,14.58333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(147,'Myanmar','backend/image/flags/flag-of-Myanmar.jpg','myanmar','flag-icon-mm','MM',22,98,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(148,'Montenegro','backend/image/flags/flag-of-Montenegro.jpg','montenegro','flag-icon-me','ME',42.5,19.3,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(149,'Mongolia','backend/image/flags/flag-of-Mongolia.jpg','mongolia','flag-icon-mn','MN',46,105,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(150,'Northern Mariana Islands','backend/image/flags/flag-of-Northern-Mariana-Islands.jpg','northern-mariana-islands','flag-icon-mp','MP',15.2,145.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(151,'Mozambique','backend/image/flags/flag-of-Mozambique.jpg','mozambique','flag-icon-mz','MZ',-18.25,35,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(152,'Mauritania','backend/image/flags/flag-of-Mauritania.jpg','mauritania','flag-icon-mr','MR',20,-12,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(153,'Montserrat','backend/image/flags/flag-of-Montserrat.jpg','montserrat','flag-icon-ms','MS',16.75,-62.2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(154,'Martinique','backend/image/flags/flag-of-Martinique.jpg','martinique','flag-icon-mq','MQ',14.666667,-61,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(155,'Mauritius','backend/image/flags/flag-of-Mauritius.jpg','mauritius','flag-icon-mu','MU',-20.28333333,57.55,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(156,'Malawi','backend/image/flags/flag-of-Malawi.jpg','malawi','flag-icon-mw','MW',-13.5,34,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(157,'Malaysia','backend/image/flags/flag-of-Malaysia.jpg','malaysia','flag-icon-my','MY',2.5,112.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(158,'Mayotte','backend/image/flags/flag-of-Mayotte.jpg','mayotte','flag-icon-yt','YT',-12.83333333,45.16666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(159,'Namibia','backend/image/flags/flag-of-Namibia.jpg','namibia','flag-icon-na','NA',-22,17,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(160,'New Caledonia','backend/image/flags/flag-of-New-Caledonia.jpg','new-caledonia','flag-icon-nc','NC',-21.5,165.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(161,'Niger','backend/image/flags/flag-of-Niger.jpg','niger','flag-icon-ne','NE',16,8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(162,'Norfolk Island','backend/image/flags/flag-of-Norfolk-Island.jpg','norfolk-island','flag-icon-nf','NF',-29.03333333,167.95,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(163,'Nigeria','backend/image/flags/flag-of-Nigeria.jpg','nigeria','flag-icon-ng','NG',10,8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(164,'Nicaragua','backend/image/flags/flag-of-Nicaragua.jpg','nicaragua','flag-icon-ni','NI',13,-85,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(165,'Niue','backend/image/flags/flag-of-Niue.jpg','niue','flag-icon-nu','NU',-19.03333333,-169.86666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(166,'Netherlands','backend/image/flags/flag-of-Netherlands.jpg','netherlands','flag-icon-nl','NL',52.5,5.75,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(167,'Norway','backend/image/flags/flag-of-Norway.jpg','norway','flag-icon-no','NO',62,10,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(168,'Nepal','backend/image/flags/flag-of-Nepal.jpg','nepal','flag-icon-np','NP',28,84,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(169,'Nauru','backend/image/flags/flag-of-Nauru.jpg','nauru','flag-icon-nr','NR',-0.53333333,166.91666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(170,'New Zealand','backend/image/flags/flag-of-New-Zealand.jpg','new-zealand','flag-icon-nz','NZ',-41,174,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(171,'Oman','backend/image/flags/flag-of-Oman.jpg','oman','flag-icon-om','OM',21,57,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(172,'Pakistan','backend/image/flags/flag-of-Pakistan.jpg','pakistan','flag-icon-pk','PK',30,70,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(173,'Panama','backend/image/flags/flag-of-Panama.jpg','panama','flag-icon-pa','PA',9,-80,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(174,'Pitcairn Islands','backend/image/flags/flag-of-Pitcairn-Islands.jpg','pitcairn-islands','flag-icon-pn','PN',-25.06666666,-130.1,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(175,'Peru','backend/image/flags/flag-of-Peru.jpg','peru','flag-icon-pe','PE',-10,-76,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(176,'Philippines','backend/image/flags/flag-of-Philippines.jpg','philippines','flag-icon-ph','PH',13,122,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(177,'Palau','backend/image/flags/flag-of-Palau.jpg','palau','flag-icon-pw','PW',7.5,134.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(178,'Papua New Guinea','backend/image/flags/flag-of-Papua-New-Guinea.jpg','papua-new-guinea','flag-icon-pg','PG',-6,147,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(179,'Poland','backend/image/flags/flag-of-Poland.jpg','poland','flag-icon-pl','PL',52,20,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(180,'Puerto Rico','backend/image/flags/flag-of-Puerto-Rico.jpg','puerto-rico','flag-icon-pr','PR',18.25,-66.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(181,'North Korea','backend/image/flags/flag-of-North-Korea.jpg','north-korea','flag-icon-kp','KP',40,127,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(182,'Portugal','backend/image/flags/flag-of-Portugal.jpg','portugal','flag-icon-pt','PT',39.5,-8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(183,'Paraguay','backend/image/flags/flag-of-Paraguay.jpg','paraguay','flag-icon-py','PY',-23,-58,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(184,'Palestine','backend/image/flags/flag-of-Palestine.jpg','palestine','flag-icon-ps','PS',31.9,35.2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(185,'French Polynesia','backend/image/flags/flag-of-French-Polynesia.jpg','french-polynesia','flag-icon-pf','PF',-15,-140,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(186,'Qatar','backend/image/flags/flag-of-Qatar.jpg','qatar','flag-icon-qa','QA',25.5,51.25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(187,'Réunion','backend/image/flags/flag-of-Réunion.jpg','reunion','flag-icon-re','RE',-21.15,55.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(188,'Romania','backend/image/flags/flag-of-Romania.jpg','romania','flag-icon-ro','RO',46,25,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(189,'Russia','backend/image/flags/flag-of-Russia.jpg','russia','flag-icon-ru','RU',60,100,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(190,'Rwanda','backend/image/flags/flag-of-Rwanda.jpg','rwanda','flag-icon-rw','RW',-2,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(191,'Saudi Arabia','backend/image/flags/flag-of-Saudi-Arabia.jpg','saudi-arabia','flag-icon-sa','SA',25,45,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(192,'Sudan','backend/image/flags/flag-of-Sudan.jpg','sudan','flag-icon-sd','SD',15,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(193,'Senegal','backend/image/flags/flag-of-Senegal.jpg','senegal','flag-icon-sn','SN',14,-14,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(194,'Singapore','backend/image/flags/flag-of-Singapore.jpg','singapore','flag-icon-sg','SG',1.36666666,103.8,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(195,'South Georgia','backend/image/flags/flag-of-South-Georgia.jpg','south-georgia','flag-icon-gs','GS',-54.5,-37,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(196,'Svalbard and Jan Mayen','backend/image/flags/flag-of-Svalbard-and-Jan-Mayen.jpg','svalbard-and-jan-mayen','flag-icon-sj','SJ',78,20,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(197,'Solomon Islands','backend/image/flags/flag-of-Solomon-Islands.jpg','solomon-islands','flag-icon-sb','SB',-8,159,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(198,'Sierra Leone','backend/image/flags/flag-of-Sierra-Leone.jpg','sierra-leone','flag-icon-sl','SL',8.5,-11.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(199,'El Salvador','backend/image/flags/flag-of-El-Salvador.jpg','el-salvador','flag-icon-sv','SV',13.83333333,-88.91666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(200,'San Marino','backend/image/flags/flag-of-San-Marino.jpg','san-marino','flag-icon-sm','SM',43.76666666,12.41666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(201,'Somalia','backend/image/flags/flag-of-Somalia.jpg','somalia','flag-icon-so','SO',10,49,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(202,'Saint Pierre and Miquelon','backend/image/flags/flag-of-Saint-Pierre-and-Miquelon.jpg','saint-pierre-and-miquelon','flag-icon-pm','PM',46.83333333,-56.33333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(203,'Serbia','backend/image/flags/flag-of-Serbia.jpg','serbia','flag-icon-rs','RS',44,21,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(204,'South Sudan','backend/image/flags/flag-of-South-Sudan.jpg','south-sudan','flag-icon-ss','SS',7,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(205,'São Tomé and Príncipe','backend/image/flags/flag-of-São-Tomé-and-Príncipe.jpg','sao-tome-and-principe','flag-icon-st','ST',1,7,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(206,'Suriname','backend/image/flags/flag-of-Suriname.jpg','suriname','flag-icon-sr','SR',4,-56,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(207,'Slovakia','backend/image/flags/flag-of-Slovakia.jpg','slovakia','flag-icon-sk','SK',48.66666666,19.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(208,'Slovenia','backend/image/flags/flag-of-Slovenia.jpg','slovenia','flag-icon-si','SI',46.11666666,14.81666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(209,'Sweden','backend/image/flags/flag-of-Sweden.jpg','sweden','flag-icon-se','SE',62,15,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(210,'Swaziland','backend/image/flags/flag-of-Swaziland.jpg','swaziland','flag-icon-sz','SZ',-26.5,31.5,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(211,'Sint Maarten','backend/image/flags/flag-of-Sint-Maarten.jpg','sint-maarten','flag-icon-sx','SX',18.033333,-63.05,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(212,'Seychelles','backend/image/flags/flag-of-Seychelles.jpg','seychelles','flag-icon-sc','SC',-4.58333333,55.66666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(213,'Syria','backend/image/flags/flag-of-Syria.jpg','syria','flag-icon-sy','SY',35,38,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(214,'Turks and Caicos Islands','backend/image/flags/flag-of-Turks-and-Caicos-Islands.jpg','turks-and-caicos-islands','flag-icon-tc','TC',21.75,-71.58333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(215,'Chad','backend/image/flags/flag-of-Chad.jpg','chad','flag-icon-td','TD',15,19,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(216,'Togo','backend/image/flags/flag-of-Togo.jpg','togo','flag-icon-tg','TG',8,1.16666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(217,'Thailand','backend/image/flags/flag-of-Thailand.jpg','thailand','flag-icon-th','TH',15,100,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(218,'Tajikistan','backend/image/flags/flag-of-Tajikistan.jpg','tajikistan','flag-icon-tj','TJ',39,71,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(219,'Tokelau','backend/image/flags/flag-of-Tokelau.jpg','tokelau','flag-icon-tk','TK',-9,-172,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(220,'Turkmenistan','backend/image/flags/flag-of-Turkmenistan.jpg','turkmenistan','flag-icon-tm','TM',40,60,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(221,'Timor-Leste','backend/image/flags/flag-of-Timor-Leste.jpg','timor-leste','flag-icon-tl','TL',-8.83333333,125.91666666,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(222,'Tonga','backend/image/flags/flag-of-Tonga.jpg','tonga','flag-icon-to','TO',-20,-175,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(223,'Trinidad and Tobago','backend/image/flags/flag-of-Trinidad-and-Tobago.jpg','trinidad-and-tobago','flag-icon-tt','TT',11,-61,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(224,'Tunisia','backend/image/flags/flag-of-Tunisia.jpg','tunisia','flag-icon-tn','TN',34,9,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(225,'Turkey','backend/image/flags/flag-of-Turkey.jpg','turkey','flag-icon-tr','TR',39,35,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(226,'Tuvalu','backend/image/flags/flag-of-Tuvalu.jpg','tuvalu','flag-icon-tv','TV',-8,178,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(227,'Taiwan','backend/image/flags/flag-of-Taiwan.jpg','taiwan','flag-icon-tw','TW',23.5,121,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(228,'Tanzania','backend/image/flags/flag-of-Tanzania.jpg','tanzania','flag-icon-tz','TZ',-6,35,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(229,'Uganda','backend/image/flags/flag-of-Uganda.jpg','uganda','flag-icon-ug','UG',1,32,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(230,'Ukraine','backend/image/flags/flag-of-Ukraine.jpg','ukraine','flag-icon-ua','UA',49,32,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(231,'United States Minor Outlying Islands','backend/image/flags/flag-of-United-States-Minor-Outlying-Islands.jpg','united-states-minor-outlying-islands','flag-icon-um','UM',19.2911437,166.618332,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(232,'Uruguay','backend/image/flags/flag-of-Uruguay.jpg','uruguay','flag-icon-uy','UY',-33,-56,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(233,'United States','backend/image/flags/flag-of-United-States.jpg','united-states','flag-icon-us','US',38,-97,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(234,'Uzbekistan','backend/image/flags/flag-of-Uzbekistan.jpg','uzbekistan','flag-icon-uz','UZ',41,64,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(235,'Vatican City','backend/image/flags/flag-of-Vatican-City.jpg','vatican-city','flag-icon-va','VA',41.9,12.45,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(236,'Saint Vincent and the Grenadines','backend/image/flags/flag-of-Saint-Vincent-and-the-Grenadines.jpg','saint-vincent-and-the-grenadines','flag-icon-vc','VC',13.25,-61.2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(237,'Venezuela','backend/image/flags/flag-of-Venezuela.jpg','venezuela','flag-icon-ve','VE',8,-66,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(238,'British Virgin Islands','backend/image/flags/flag-of-British-Virgin-Islands.jpg','british-virgin-islands','flag-icon-vg','VG',18.431383,-64.62305,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(239,'United States Virgin Islands','backend/image/flags/flag-of-United-States-Virgin-Islands.jpg','united-states-virgin-islands','flag-icon-vi','VI',18.35,-64.933333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(240,'Vietnam','backend/image/flags/flag-of-Vietnam.jpg','vietnam','flag-icon-vn','VN',16.16666666,107.83333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(241,'Vanuatu','backend/image/flags/flag-of-Vanuatu.jpg','vanuatu','flag-icon-vu','VU',-16,167,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(242,'Wallis and Futuna','backend/image/flags/flag-of-Wallis-and-Futuna.jpg','wallis-and-futuna','flag-icon-wf','WF',-13.3,-176.2,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(243,'Samoa','backend/image/flags/flag-of-Samoa.jpg','samoa','flag-icon-ws','WS',-13.58333333,-172.33333333,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(244,'Yemen','backend/image/flags/flag-of-Yemen.jpg','yemen','flag-icon-ye','YE',15,48,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(245,'South Africa','backend/image/flags/flag-of-South-Africa.jpg','south-africa','flag-icon-za','ZA',-29,24,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(246,'Zambia','backend/image/flags/flag-of-Zambia.jpg','zambia','flag-icon-zm','ZM',-15,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(247,'Zimbabwe','backend/image/flags/flag-of-Zimbabwe.jpg','zimbabwe','flag-icon-zw','ZW',-20,30,0,'2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `created_at`, `updated_at`)
VALUES
	(1,'United State Dollar','USD','$','left','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table earnings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `earnings`;

CREATE TABLE `earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline') COLLATE utf8_unicode_ci NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usd_amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manual_payment_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `earnings_plan_id_foreign` (`plan_id`),
  KEY `earnings_company_id_foreign` (`company_id`),
  KEY `earnings_manual_payment_id_foreign` (`manual_payment_id`),
  CONSTRAINT `earnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `earnings_manual_payment_id_foreign` FOREIGN KEY (`manual_payment_id`) REFERENCES `manual_payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `earnings_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table education
# ------------------------------------------------------------

DROP TABLE IF EXISTS `education`;

CREATE TABLE `education` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;

INSERT INTO `education` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'High School','high-school','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Intermediate','intermediate','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Bachelor Degree','bachelor-degree','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Master Degree','master-degree','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'Graduated','graduated','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'PhD','phd','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(7,'Any','any','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emails_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table experiences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experiences`;

CREATE TABLE `experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;

INSERT INTO `experiences` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Fresher','fresher','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'1 Year','1-year','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'2 Years','2-years','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'3+ Years','3-years','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'5+ Years','5-years','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'8+ Years','8-years','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(7,'10+ Years','10-years','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(8,'15+ Years','15-years','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table faq_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faq_categories`;

CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faq_categories_name_unique` (`name`),
  UNIQUE KEY `faq_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;

INSERT INTO `faq_categories` (`id`, `name`, `slug`, `icon`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'Job','job','fas fa-briefcase',0,'2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table faqs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faqs`;

CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `faq_category_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_faq_category_id_foreign` (`faq_category_id`),
  CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table industry_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `industry_types`;

CREATE TABLE `industry_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `industry_types` WRITE;
/*!40000 ALTER TABLE `industry_types` DISABLE KEYS */;

INSERT INTO `industry_types` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Agro Based Industry','agro-based-industry','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Archi/Enggr/Construction','archienggrconstruction','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Automobile/Industrial Machine','automobileindustrial-machine','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Bank/Mon-Bank Fin. Institute','bankmon-bank-fin-institute','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'Electronics/Consumer Durables','electronicsconsumer-durables','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'Energy/Power/Fuel','energypowerfuel','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(7,'Garments/Textile','garmentstextile','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(8,'Govt./Semi-Govt./Autonomous','govtsemi-govtautonomous','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(9,'Pharmaceuticals','pharmaceuticals','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(10,'Hospital/Diagnostic Center','hospitaldiagnostic-center','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(11,'Airline/Travel/Tourism','airlinetraveltourism','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(12,'Manufacturing (Light Industry)','manufacturing-light-industry','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(13,'Manufacturing (Heavy Industry)','manufacturing-heavy-industry','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(14,'Hotel/Restaurant','hotelrestaurant','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(15,'Information Technology','information-technology','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(16,'Logistics/Transportation','logisticstransportation','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(17,'Entertainment/Recreation','entertainmentrecreation','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(18,'Media/Advertising/Event Mgt.','mediaadvertisingevent-mgt','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(19,'NGO/Development','ngodevelopment','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(20,'Real Estate/Development','real-estatedevelopment','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(21,'Wholesale/Retail/Export-Import','wholesaleretailexport-import','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(22,'Telecommunication','telecommunication','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(23,'Food & Beverage Industry','food-beverage-industry','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(24,'Security Service','security-service','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(25,'Fire, Safety & Protection','fire-safety-protection','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `industry_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_categories`;

CREATE TABLE `job_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci,
  `icon` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_categories_name_unique` (`name`),
  UNIQUE KEY `job_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `job_categories` WRITE;
/*!40000 ALTER TABLE `job_categories` DISABLE KEYS */;

INSERT INTO `job_categories` (`id`, `name`, `slug`, `image`, `icon`, `created_at`, `updated_at`)
VALUES
	(1,'Engineer/Architects','engineerarchitects','backend/image/default.png','fas fa-hammer','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Garments/Textile','garmentstextile','backend/image/default.png','fas fa-tshirt','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Design/Creative','designcreative','backend/image/default.png','fas fa-pen','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Hospitality/ Travel/ Tourism','hospitality-travel-tourism','backend/image/default.png','fas fa-hospital','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'IT & Telecommunication','it-telecommunication','backend/image/default.png','fas fa-desktop','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'Medical/Pharma','medicalpharma','backend/image/default.png','fas fa-user-md','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(7,'Driving/Motor Technician','drivingmotor-technician','backend/image/default.png','fas fa-car','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(8,'Law/Legal','lawlegal','backend/image/default.png','fas fa-gavel','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(9,'Others','others','backend/image/default.png','fas fa-ellipsis-v','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `job_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_roles`;

CREATE TABLE `job_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `job_roles` WRITE;
/*!40000 ALTER TABLE `job_roles` DISABLE KEYS */;

INSERT INTO `job_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Team Leader','team-leader','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Manager','manager','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Assistant Manager','assistant-manager','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Executive','executive','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'Director','director','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'Administrator','administrator','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `job_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_types`;

CREATE TABLE `job_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `job_types` WRITE;
/*!40000 ALTER TABLE `job_types` DISABLE KEYS */;

INSERT INTO `job_types` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Full Time','full-time','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Part Time','part-time','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Contractual','contractual','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Intern','intern','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'Freelance','freelance','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `job_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `experience_id` bigint unsigned NOT NULL,
  `education_id` bigint unsigned NOT NULL,
  `job_type_id` bigint unsigned NOT NULL,
  `salary_type_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancies` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_salary` int NOT NULL,
  `max_salary` int NOT NULL,
  `deadline` date DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','active','expired') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `apply_on` enum('app','email','custom_url') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'app',
  `apply_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `is_remote` tinyint(1) NOT NULL DEFAULT '0',
  `total_views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_company_id_foreign` (`company_id`),
  KEY `jobs_category_id_foreign` (`category_id`),
  KEY `jobs_role_id_foreign` (`role_id`),
  KEY `jobs_experience_id_foreign` (`experience_id`),
  KEY `jobs_education_id_foreign` (`education_id`),
  KEY `jobs_job_type_id_foreign` (`job_type_id`),
  KEY `jobs_salary_type_id_foreign` (`salary_type_id`),
  CONSTRAINT `jobs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jobs_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jobs_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jobs_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jobs_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jobs_salary_type_id_foreign` FOREIGN KEY (`salary_type_id`) REFERENCES `salary_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direction` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_name_unique` (`name`),
  UNIQUE KEY `languages_code_unique` (`code`),
  UNIQUE KEY `languages_icon_unique` (`icon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `direction`, `created_at`, `updated_at`)
VALUES
	(1,'English','en','flag-icon-gb','ltr','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table manual_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manual_payments`;

CREATE TABLE `manual_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('bank_payment','cash_payment','check_payment','custom_payment') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_super_admins_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2020_11_12_184107_create_permission_tables',1),
	(5,'2020_12_23_122556_create_contacts_table',1),
	(6,'2021_02_18_112239_create_admins_table',1),
	(7,'2021_07_14_104813_create_themes_table',1),
	(8,'2021_07_14_154223_create_users_table',1),
	(9,'2021_07_14_154742_create_auth_candidates_table',1),
	(10,'2021_07_14_155037_create_teachers_table',1),
	(11,'2021_07_14_155517_create_students_table',1),
	(12,'2021_07_14_155900_create_auth_companies_table',1),
	(13,'2021_08_21_174451_create_customers_table',1),
	(14,'2021_08_23_115402_create_settings_table',1),
	(15,'2021_08_25_061331_create_languages_table',1),
	(16,'2021_12_14_142236_create_emails_table',1),
	(17,'2021_12_17_110211_create_testimonials_table',1),
	(18,'2021_12_19_152529_create_faq_categories_table',1),
	(19,'2021_12_21_105713_create_faqs_table',1),
	(20,'2022_01_25_131111_add_fields_to_settings_table',1),
	(21,'2022_01_26_091457_add_social_login_fields_to_users_table',1),
	(22,'2022_01_27_044638_create_experiences_table',1),
	(23,'2022_01_27_044649_create_education_table',1),
	(24,'2022_01_27_055733_create_job_types_table',1),
	(25,'2022_01_27_060057_create_salary_types_table',1),
	(26,'2022_01_27_081546_create_organization_types_table',1),
	(27,'2022_01_27_095019_create_team_sizes_table',1),
	(28,'2022_01_27_101204_create_nationalities_table',1),
	(29,'2022_01_27_121442_create_countries_table',1),
	(30,'2022_01_27_121452_create_states_table',1),
	(31,'2022_01_27_121453_create_cities_table',1),
	(32,'2022_01_28_030131_create_industry_types_table',1),
	(33,'2022_01_28_030802_create_professions_table',1),
	(34,'2022_01_28_033627_create_job_roles_table',1),
	(35,'2022_01_29_110746_create_companies_table',1),
	(36,'2022_01_29_120010_create_job_categories_table',1),
	(37,'2022_01_29_120020_create_candidates_table',1),
	(38,'2022_01_29_133751_create_jobs_table',1),
	(39,'2022_01_29_140931_create_socials_table',1),
	(40,'2022_01_30_051177_create_post_categories_table',1),
	(41,'2022_01_30_051199_create_posts_table',1),
	(42,'2022_02_09_154506_create_company_bookmark_categories_table',1),
	(43,'2022_02_10_154506_create_bookmark_company_table',1),
	(44,'2022_02_10_160813_create_bookmark_candidate_job_table',1),
	(45,'2022_02_10_160821_create_bookmark_candidate_company_table',1),
	(46,'2022_02_10_161917_create_social_links_table',1),
	(47,'2022_02_10_162218_create_contact_infos_table',1),
	(48,'2022_02_19_141812_create_plans_table',1),
	(49,'2022_02_22_114329_create_post_comments_table',1),
	(50,'2022_02_22_183128_create_application_groups_table',1),
	(51,'2022_02_22_183129_create_applied_jobs_table',1),
	(52,'2022_03_01_213343_create_website_settings_table',1),
	(53,'2022_03_05_125615_create_currencies_table',1),
	(54,'2022_03_05_145248_create_abouts_table',1),
	(55,'2022_03_05_181737_create_our_missions_table',1),
	(56,'2022_03_08_110106_create_notifications_table',1),
	(57,'2022_03_10_110704_create_cms_table',1),
	(58,'2022_03_13_143318_create_payment_settings_table',1),
	(59,'2022_03_13_162626_create_user_plans_table',1),
	(60,'2022_03_13_193937_create_orders_table',1),
	(61,'2022_03_13_204812_create_earnings_table',1),
	(62,'2022_03_15_100012_create_terms_categories_table',1),
	(63,'2022_03_24_045305_create_seos_table',1),
	(64,'2022_03_26_130136_create_queue_jobs_table',1),
	(65,'2022_03_28_093629_add_socialite_column_to_users_table',1),
	(66,'2022_03_28_123603_create_theme_settings_table',1),
	(67,'2022_03_29_100616_create_timezones_table',1),
	(68,'2022_03_29_121851_create_admin_searches_table',1),
	(69,'2022_03_30_082959_create_cookies_table',1),
	(70,'2022_04_25_132657_create_setup_guides_table',1),
	(71,'2022_04_27_090501_create_bookmark_company_category_table',1),
	(72,'2022_04_30_041155_create_company_applied_job_rejected_table',1),
	(73,'2022_04_30_043011_create_company_applied_job_shortlist_table',1),
	(74,'2022_06_18_031525_add_full_address_to_candidates_table',1),
	(75,'2022_06_18_031525_add_full_address_to_companies_table',1),
	(76,'2022_06_18_031525_add_full_address_to_jobs_table',1),
	(77,'2022_06_27_050337_add_map_to_settings_table',1),
	(78,'2022_07_19_062856_create_manual_payments_table',1),
	(79,'2022_07_20_033046_add_manual_payment_id_to_earnings_table',1),
	(80,'2022_07_23_044852_add_transaction_id_to_earnings_table',1),
	(81,'2022_08_02_103529_create_candidate_resumes_table',1),
	(82,'2022_08_03_061932_add_fields_to_applied_jobs_table',1),
	(83,'2022_08_29_035902_add_employer_activation_field_to_settings_table',1),
	(84,'2022_08_29_063449_remove_some_columns_from_cms_table',1),
	(85,'2022_08_29_090125_create_cms_contents_table',1),
	(86,'2022_08_30_115827_remove_add_settings_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\Admin',1);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nationalities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;

INSERT INTO `nationalities` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Afghan','afghan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Albanian','albanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Algerian','algerian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'American','american','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'Andorran','andorran','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'Angolan','angolan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(7,'Antiguans','antiguans','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(8,'Argentinean','argentinean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(9,'Armenian','armenian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(10,'Australian','australian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(11,'Austrian','austrian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(12,'Azerbaijani','azerbaijani','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(13,'Bahamian','bahamian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(14,'Bahraini','bahraini','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(15,'Bangladeshi','bangladeshi','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(16,'Barbadian','barbadian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(17,'Barbudans','barbudans','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(18,'Batswana','batswana','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(19,'Belarusian','belarusian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(20,'Belgian','belgian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(21,'Belizean','belizean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(22,'Beninese','beninese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(23,'Bhutanese','bhutanese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(24,'Bolivian','bolivian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(25,'Bosnian','bosnian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(26,'Brazilian','brazilian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(27,'British','british','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(28,'Bruneian','bruneian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(29,'Bulgarian','bulgarian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(30,'Burkinabe','burkinabe','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(31,'Burmese','burmese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(32,'Burundian','burundian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(33,'Cambodian','cambodian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(34,'Cameroonian','cameroonian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(35,'Canadian','canadian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(36,'Cape Verdean','cape-verdean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(37,'Central African','central-african','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(38,'Chadian','chadian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(39,'Chilean','chilean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(40,'Chinese','chinese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(41,'Colombian','colombian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(42,'Comoran','comoran','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(43,'Congolese','congolese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(44,'Costa Rican','costa-rican','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(45,'Croatian','croatian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(46,'Cuban','cuban','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(47,'Cypriot','cypriot','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(48,'Czech','czech','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(49,'Danish','danish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(50,'Djibouti','djibouti','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(51,'Dominican','dominican','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(52,'Dutch','dutch','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(53,'East Timorese','east-timorese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(54,'Ecuadorean','ecuadorean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(55,'Egyptian','egyptian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(56,'Emirian','emirian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(57,'Equatorial Guinean','equatorial-guinean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(58,'Eritrean','eritrean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(59,'Estonian','estonian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(60,'Ethiopian','ethiopian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(61,'Fijian','fijian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(62,'Filipino','filipino','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(63,'Finnish','finnish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(64,'French','french','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(65,'Gabonese','gabonese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(66,'Gambian','gambian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(67,'Georgian','georgian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(68,'German','german','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(69,'Ghanaian','ghanaian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(70,'Greek','greek','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(71,'Grenadian','grenadian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(72,'Guatemalan','guatemalan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(73,'Guinea-Bissauan','guinea-bissauan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(74,'Guinean','guinean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(75,'Guyanese','guyanese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(76,'Haitian','haitian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(77,'Herzegovinian','herzegovinian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(78,'Honduran','honduran','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(79,'Hungarian','hungarian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(80,'I-Kiribati','i-kiribati','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(81,'Icelander','icelander','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(82,'Indian','indian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(83,'Indonesian','indonesian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(84,'Iranian','iranian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(85,'Iraqi','iraqi','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(86,'Irish','irish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(87,'Israeli','israeli','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(88,'Italian','italian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(89,'Ivorian','ivorian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(90,'Jamaican','jamaican','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(91,'Japanese','japanese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(92,'Jordanian','jordanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(93,'Kazakhstani','kazakhstani','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(94,'Kenyan','kenyan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(95,'Kittian and Nevisian','kittian-and-nevisian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(96,'Kuwaiti','kuwaiti','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(97,'Kyrgyz','kyrgyz','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(98,'Laotian','laotian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(99,'Latvian','latvian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(100,'Lebanese','lebanese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(101,'Liberian','liberian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(102,'Libyan','libyan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(103,'Liechtensteiner','liechtensteiner','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(104,'Lithuanian','lithuanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(105,'Luxembourger','luxembourger','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(106,'Macedonian','macedonian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(107,'Malagasy','malagasy','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(108,'Malawian','malawian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(109,'Malaysian','malaysian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(110,'Maldivan','maldivan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(111,'Malian','malian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(112,'Maltese','maltese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(113,'Marshallese','marshallese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(114,'Mauritanian','mauritanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(115,'Mauritian','mauritian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(116,'Mexican','mexican','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(117,'Micronesian','micronesian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(118,'Moldovan','moldovan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(119,'Monacan','monacan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(120,'Mongolian','mongolian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(121,'Moroccan','moroccan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(122,'Mosotho','mosotho','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(123,'Motswana','motswana','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(124,'Mozambican','mozambican','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(125,'Namibian','namibian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(126,'Nauruan','nauruan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(127,'Nepalese','nepalese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(128,'New Zealander','new-zealander','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(129,'Nicaraguan','nicaraguan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(130,'Nigerian','nigerian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(131,'Nigerien','nigerien','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(132,'North Korean','north-korean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(133,'Northern Irish','northern-irish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(134,'Norwegian','norwegian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(135,'Omani','omani','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(136,'Pakistani','pakistani','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(137,'Palauan','palauan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(138,'Panamanian','panamanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(139,'Papua New Guinean','papua-new-guinean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(140,'Paraguayan','paraguayan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(141,'Peruvian','peruvian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(142,'Polish','polish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(143,'Portuguese','portuguese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(144,'Qatari','qatari','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(145,'Romanian','romanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(146,'Russian','russian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(147,'Rwandan','rwandan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(148,'Saint Lucian','saint-lucian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(149,'Salvadoran','salvadoran','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(150,'Samoan','samoan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(151,'San Marinese','san-marinese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(152,'Sao Tomean','sao-tomean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(153,'Saudi','saudi','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(154,'Scottish','scottish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(155,'Senegalese','senegalese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(156,'Serbian','serbian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(157,'Seychellois','seychellois','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(158,'Sierra Leonean','sierra-leonean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(159,'Singaporean','singaporean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(160,'Slovakian','slovakian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(161,'Slovenian','slovenian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(162,'Solomon Islander','solomon-islander','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(163,'Somali','somali','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(164,'South African','south-african','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(165,'South Korean','south-korean','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(166,'Spanish','spanish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(167,'Sri Lankan','sri-lankan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(168,'Sudanese','sudanese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(169,'Surinamer','surinamer','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(170,'Swazi','swazi','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(171,'Swedish','swedish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(172,'Swiss','swiss','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(173,'Syrian','syrian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(174,'Taiwanese','taiwanese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(175,'Tajik','tajik','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(176,'Tanzanian','tanzanian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(177,'Thai','thai','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(178,'Togolese','togolese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(179,'Tongan','tongan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(180,'Trinidadian or Tobagonian','trinidadian-or-tobagonian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(181,'Tunisian','tunisian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(182,'Turkish','turkish','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(183,'Tuvaluan','tuvaluan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(184,'Ugandan','ugandan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(185,'Ukrainian','ukrainian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(186,'Uruguayan','uruguayan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(187,'Uzbekistani','uzbekistani','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(188,'Venezuelan','venezuelan','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(189,'Vietnamese','vietnamese','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(190,'Welsh','welsh','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(191,'Yemenite','yemenite','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(192,'Zambian','zambian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(193,'Zimbabwean','zimbabwean','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `nationalities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plan_id` int NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table organization_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organization_types`;

CREATE TABLE `organization_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `organization_types` WRITE;
/*!40000 ALTER TABLE `organization_types` DISABLE KEYS */;

INSERT INTO `organization_types` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Government','government','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Semi Government','semi-government','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Public','public','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Private','private','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'NGO','ngo','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'International Agencies','international-agencies','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `organization_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table our_missions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `our_missions`;

CREATE TABLE `our_missions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mission_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-5.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table payment_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `paypal` tinyint(1) NOT NULL DEFAULT '1',
  `paypal_live_mode` tinyint(1) NOT NULL DEFAULT '0',
  `stripe` tinyint(1) NOT NULL DEFAULT '1',
  `razorpay` tinyint(1) NOT NULL DEFAULT '1',
  `paystack` tinyint(1) NOT NULL DEFAULT '1',
  `ssl_commerz` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `payment_settings` WRITE;
/*!40000 ALTER TABLE `payment_settings` DISABLE KEYS */;

INSERT INTO `payment_settings` (`id`, `paypal`, `paypal_live_mode`, `stripe`, `razorpay`, `paystack`, `ssl_commerz`, `created_at`, `updated_at`)
VALUES
	(1,1,0,1,1,1,1,'2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `payment_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin.create','admin','admin','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(2,'admin.view','admin','admin','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(3,'admin.edit','admin','admin','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(4,'admin.delete','admin','admin','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(5,'order.view','admin','order','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(6,'order.download','admin','order','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(7,'company.create','admin','company','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(8,'company.view','admin','company','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(9,'company.update','admin','company','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(10,'company.delete','admin','company','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(11,'map.create','admin','map','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(12,'map.view','admin','map','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(13,'map.update','admin','map','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(14,'map.delete','admin','map','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(15,'candidate.create','admin','candidate','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(16,'candidate.view','admin','candidate','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(17,'candidate.update','admin','candidate','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(18,'candidate.delete','admin','candidate','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(19,'job.create','admin','job','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(20,'job.view','admin','job','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(21,'job.update','admin','job','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(22,'job.delete','admin','job','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(23,'job_category.create','admin','job_category','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(24,'job_category.view','admin','job_category','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(25,'job_category.update','admin','job_category','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(26,'job_category.delete','admin','job_category','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(27,'job_role.view','admin','job_role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(28,'job_role.create','admin','job_role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(29,'job_role.update','admin','job_role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(30,'job_role.delete','admin','job_role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(31,'plan.create','admin','price_plan','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(32,'plan.view','admin','price_plan','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(33,'plan.update','admin','price_plan','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(34,'plan.delete','admin','price_plan','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(35,'industry_types.create','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(36,'industry_types.view','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(37,'industry_types.update','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(38,'industry_types.delete','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(39,'professions.create','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(40,'professions.view','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(41,'professions.update','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(42,'professions.delete','admin','attributes','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(43,'post.create','admin','blog','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(44,'post.view','admin','blog','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(45,'post.update','admin','blog','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(46,'post.delete','admin','blog','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(47,'country.create','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(48,'country.view','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(49,'country.update','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(50,'country.delete','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(51,'state.create','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(52,'state.view','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(53,'state.update','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(54,'state.delete','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(55,'city.create','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(56,'city.view','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(57,'city.update','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(58,'city.delete','admin','location','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(59,'newsletter.view','admin','newsletter','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(60,'newsletter.sendmail','admin','newsletter','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(61,'newsletter.delete','admin','newsletter','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(62,'contact.view','admin','contact','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(63,'contact.delete','admin','contact','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(64,'testimonial.create','admin','testimonial','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(65,'testimonial.view','admin','testimonial','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(66,'testimonial.update','admin','testimonial','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(67,'testimonial.delete','admin','testimonial','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(68,'faq.create','admin','faq','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(69,'faq.view','admin','faq','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(70,'faq.update','admin','faq','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(71,'faq.delete','admin','faq','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(72,'role.create','admin','role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(73,'role.view','admin','role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(74,'role.edit','admin','role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(75,'role.delete','admin','role','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(76,'setting.view','admin','settings','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(77,'setting.update','admin','settings','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plans`;

CREATE TABLE `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `job_limit` int NOT NULL,
  `featured_job_limit` int NOT NULL,
  `highlight_job_limit` int NOT NULL,
  `candidate_cv_view_limit` int NOT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `frontend_show` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_label_unique` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;

INSERT INTO `plans` (`id`, `label`, `description`, `price`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `candidate_cv_view_limit`, `recommended`, `frontend_show`, `created_at`, `updated_at`)
VALUES
	(1,'Trial','This is the trial plan',0.00,1,1,1,5,0,0,'2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table post_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_author_id_foreign` (`author_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('draft','published') COLLATE utf8_unicode_ci DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_author_id_foreign` (`author_id`),
  CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table professions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `professions`;

CREATE TABLE `professions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;

INSERT INTO `professions` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Physician','physician','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(2,'Engineer','engineer','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(3,'Chef','chef','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(4,'Lawyer','lawyer','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(5,'Designer','designer','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(6,'Labourer','labourer','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(7,'Dentist','dentist','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(8,'Accountant','accountant','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(9,'Dental Hygienist','dental-hygienist','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(10,'Actor','actor','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(11,'Electrician','electrician','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(12,'Software Developer','software-developer','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(13,'Pharmacist','pharmacist','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(14,'Technician','technician','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(15,'Artist','artist','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(16,'Teacher','teacher','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(17,'Journalist','journalist','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(18,'Cashier','cashier','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(19,'Secretary','secretary','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(20,'Scientist','scientist','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(21,'Soldier','soldier','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(22,'Gardener','gardener','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(23,'Farmer','farmer','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(24,'Librarian','librarian','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(25,'Driver','driver','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(26,'Fishermen','fishermen','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(27,'Police Officer ','police-officer','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(28,'Tailor','tailor','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue_jobs`;

CREATE TABLE `queue_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1),
	(52,1),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(67,1),
	(68,1),
	(69,1),
	(70,1),
	(71,1),
	(72,1),
	(73,1),
	(74,1),
	(75,1),
	(76,1),
	(77,1);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'superadmin','admin','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table salary_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salary_types`;

CREATE TABLE `salary_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `salary_types` WRITE;
/*!40000 ALTER TABLE `salary_types` DISABLE KEYS */;

INSERT INTO `salary_types` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Monthly','monthly','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'Project Basis','project-basis','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'Hourly','hourly','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'Yearly','yearly','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `salary_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seos`;

CREATE TABLE `seos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `seos` WRITE;
/*!40000 ALTER TABLE `seos` DISABLE KEYS */;

INSERT INTO `seos` (`id`, `page_slug`, `title`, `description`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'home','Welcome To Jobpilot','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(2,'jobs','Jobs','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(3,'job-details','Job Details','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(4,'candidates','Candidates','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(5,'candidate-details','Candidate Details','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(6,'company','Company','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(7,'company-details','Company Details','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(8,'blog','Blog','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(9,'post-details','Post Details','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(10,'pricing','Pricing','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(11,'login','Login','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(12,'register','Register','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(13,'about','About','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(14,'contact','Contact','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(15,'faq','FAQ','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(16,'terms-condition','Terms Condition','Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.','frontend/assets/images/jobpilot.png','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `seos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dark_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `light_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_css` text COLLATE utf8_unicode_ci,
  `header_script` text COLLATE utf8_unicode_ci,
  `body_script` text COLLATE utf8_unicode_ci,
  `sidebar_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nav_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sidebar_txt_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nav_txt_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accent_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frontend_primary_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frontend_secondary_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_process_step1_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_process_step1_description` text COLLATE utf8_unicode_ci,
  `working_process_step2_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_process_step2_description` text COLLATE utf8_unicode_ci,
  `working_process_step3_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_process_step3_description` text COLLATE utf8_unicode_ci,
  `working_process_step4_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_process_step4_description` text COLLATE utf8_unicode_ci,
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `google_analytics` tinyint(1) NOT NULL DEFAULT '0',
  `search_engine_indexing` tinyint(1) NOT NULL DEFAULT '1',
  `default_layout` tinyint(1) NOT NULL DEFAULT '1',
  `default_plan` int unsigned NOT NULL DEFAULT '1',
  `job_limit` int unsigned NOT NULL DEFAULT '1',
  `featured_job_limit` int unsigned NOT NULL DEFAULT '1',
  `highlight_job_limit` int unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC',
  `language_changing` tinyint(1) NOT NULL DEFAULT '1',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_map` enum('google-map','map-box') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'map-box',
  `google_map_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map_box_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_long` double DEFAULT NULL,
  `default_lat` double DEFAULT NULL,
  `app_country_type` enum('single_base','multiple_base') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'multiple_base',
  `app_country` bigint unsigned DEFAULT NULL,
  `employer_auto_activation` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `settings_app_country_foreign` (`app_country`),
  CONSTRAINT `settings_app_country_foreign` FOREIGN KEY (`app_country`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `email`, `dark_logo`, `light_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `working_process_step1_title`, `working_process_step1_description`, `working_process_step2_title`, `working_process_step2_description`, `working_process_step3_title`, `working_process_step3_description`, `working_process_step4_title`, `working_process_step4_description`, `dark_mode`, `google_analytics`, `search_engine_indexing`, `default_layout`, `default_plan`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `timezone`, `language_changing`, `email_verification`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `map_box_key`, `default_long`, `default_lat`, `app_country_type`, `app_country`, `employer_auto_activation`)
VALUES
	(1,'jobpilot@zakirsoft.com','frontend/assets/images/logo/logo.png','frontend/assets/images/logo/logowhite.png','frontend/assets/images/logo/fav.png',NULL,NULL,NULL,'#092433','#0A243E','#C1D6F0','#C1D6F0','#0A65CC','#487CB8','#0A65CC','#487CB8','Create Account','Aliquam facilisis egestas sapien, nec tempor leo tristique at.','Upload Cv Resume','Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales','Find Suitable Job','Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales','Apply Job','Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales',0,0,1,1,1,1,1,1,'UTC',1,0,'2022-09-01 06:40:11','2022-09-01 06:40:11','google-map','','',90.411270491741,23.757853442383,'multiple_base',NULL,1);

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setup_guides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setup_guides`;

CREATE TABLE `setup_guides` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `setup_guides` WRITE;
/*!40000 ALTER TABLE `setup_guides` DISABLE KEYS */;

INSERT INTO `setup_guides` (`id`, `task_name`, `title`, `description`, `action_route`, `action_label`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'app_setting','App Information ','Add your app logo, name, description, owner and other information.','settings.general','Add App Information',0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(2,'smtp_setting','SMTP Configuration','Add your app logo, name, description, owner and other information.','settings.email','Add Mail Configuration',0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(3,'payment_setting','Enable Payment Method','Enable to payment methods to receive payments from your customer.','settings.payment','Add Payment',0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(4,'theme_setting','Customize Theme','Customize your theme to make your app look more attractive.','settings.theme','Customize Your App Now',0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(5,'map_configuration','Map configuration','Configure your map setting to set location','settings.general','Configure Now',0,'2022-09-01 06:40:11','2022-09-01 06:40:11'),
	(6,'set_location','Application Countries','Set application countries to get country based jobs','settings.general','Set Now',0,'2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `setup_guides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table social_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_links`;

CREATE TABLE `social_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `social_media` enum('facebook','twitter','instagram','youtube','linkedin','pinterest','reddit','github','other') COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_links_user_id_foreign` (`user_id`),
  CONSTRAINT `social_links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table socials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `socials`;

CREATE TABLE `socials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `socialable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `socialable_id` bigint unsigned NOT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `socials_socialable_type_socialable_id_index` (`socialable_type`,`socialable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table super_admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `super_admins`;

CREATE TABLE `super_admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table teachers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table team_sizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_sizes`;

CREATE TABLE `team_sizes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `team_sizes` WRITE;
/*!40000 ALTER TABLE `team_sizes` DISABLE KEYS */;

INSERT INTO `team_sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Only Me','only-me','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(2,'10 Members','10-members','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(3,'10-20 Members','10-20-members','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(4,'20-50 Members','20-50-members','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(5,'50-100 Members','50-100-members','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(6,'100-200 Members','100-200-members','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(7,'200-500 Members','200-500-members','2022-09-01 06:40:12','2022-09-01 06:40:12'),
	(8,'500+ Members','500-members','2022-09-01 06:40:12','2022-09-01 06:40:12');

/*!40000 ALTER TABLE `team_sizes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table terms_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `terms_categories`;

CREATE TABLE `terms_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table testimonials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testimonials`;

CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stars` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table theme_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_settings`;

CREATE TABLE `theme_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `themes`;

CREATE TABLE `themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table timezones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timezones`;

CREATE TABLE `timezones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;

INSERT INTO `timezones` (`id`, `value`)
VALUES
	(1,'Africa/Abidjan'),
	(2,'Africa/Accra'),
	(3,'Africa/Addis_Ababa'),
	(4,'Africa/Algiers'),
	(5,'Africa/Asmara'),
	(6,'Africa/Bamako'),
	(7,'Africa/Bangui'),
	(8,'Africa/Banjul'),
	(9,'Africa/Bissau'),
	(10,'Africa/Blantyre'),
	(11,'Africa/Brazzaville'),
	(12,'Africa/Bujumbura'),
	(13,'Africa/Cairo'),
	(14,'Africa/Casablanca'),
	(15,'Africa/Ceuta'),
	(16,'Africa/Conakry'),
	(17,'Africa/Dakar'),
	(18,'Africa/Dar_es_Salaam'),
	(19,'Africa/Djibouti'),
	(20,'Africa/Douala'),
	(21,'Africa/El_Aaiun'),
	(22,'Africa/Freetown'),
	(23,'Africa/Gaborone'),
	(24,'Africa/Harare'),
	(25,'Africa/Johannesburg'),
	(26,'Africa/Juba'),
	(27,'Africa/Kampala'),
	(28,'Africa/Khartoum'),
	(29,'Africa/Kigali'),
	(30,'Africa/Kinshasa'),
	(31,'Africa/Lagos'),
	(32,'Africa/Libreville'),
	(33,'Africa/Lome'),
	(34,'Africa/Luanda'),
	(35,'Africa/Lubumbashi'),
	(36,'Africa/Lusaka'),
	(37,'Africa/Malabo'),
	(38,'Africa/Maputo'),
	(39,'Africa/Maseru'),
	(40,'Africa/Mbabane'),
	(41,'Africa/Mogadishu'),
	(42,'Africa/Monrovia'),
	(43,'Africa/Nairobi'),
	(44,'Africa/Ndjamena'),
	(45,'Africa/Niamey'),
	(46,'Africa/Nouakchott'),
	(47,'Africa/Ouagadougou'),
	(48,'Africa/Porto-Novo'),
	(49,'Africa/Sao_Tome'),
	(50,'Africa/Tripoli'),
	(51,'Africa/Tunis'),
	(52,'Africa/Windhoek'),
	(53,'America/Adak'),
	(54,'America/Anchorage'),
	(55,'America/Anguilla'),
	(56,'America/Antigua'),
	(57,'America/Araguaina'),
	(58,'America/Argentina/Buenos_Aires'),
	(59,'America/Argentina/Catamarca'),
	(60,'America/Argentina/Cordoba'),
	(61,'America/Argentina/Jujuy'),
	(62,'America/Argentina/La_Rioja'),
	(63,'America/Argentina/Mendoza'),
	(64,'America/Argentina/Rio_Gallegos'),
	(65,'America/Argentina/Salta'),
	(66,'America/Argentina/San_Juan'),
	(67,'America/Argentina/San_Luis'),
	(68,'America/Argentina/Tucuman'),
	(69,'America/Argentina/Ushuaia'),
	(70,'America/Aruba'),
	(71,'America/Asuncion'),
	(72,'America/Atikokan'),
	(73,'America/Bahia'),
	(74,'America/Bahia_Banderas'),
	(75,'America/Barbados'),
	(76,'America/Belem'),
	(77,'America/Belize'),
	(78,'America/Blanc-Sablon'),
	(79,'America/Boa_Vista'),
	(80,'America/Bogota'),
	(81,'America/Boise'),
	(82,'America/Cambridge_Bay'),
	(83,'America/Campo_Grande'),
	(84,'America/Cancun'),
	(85,'America/Caracas'),
	(86,'America/Cayenne'),
	(87,'America/Cayman'),
	(88,'America/Chicago'),
	(89,'America/Chihuahua'),
	(90,'America/Costa_Rica'),
	(91,'America/Creston'),
	(92,'America/Cuiaba'),
	(93,'America/Curacao'),
	(94,'America/Danmarkshavn'),
	(95,'America/Dawson'),
	(96,'America/Dawson_Creek'),
	(97,'America/Denver'),
	(98,'America/Detroit'),
	(99,'America/Dominica'),
	(100,'America/Edmonton'),
	(101,'America/Eirunepe'),
	(102,'America/El_Salvador'),
	(103,'America/Fort_Nelson'),
	(104,'America/Fortaleza'),
	(105,'America/Glace_Bay'),
	(106,'America/Goose_Bay'),
	(107,'America/Grand_Turk'),
	(108,'America/Grenada'),
	(109,'America/Guadeloupe'),
	(110,'America/Guatemala'),
	(111,'America/Guayaquil'),
	(112,'America/Guyana'),
	(113,'America/Halifax'),
	(114,'America/Havana'),
	(115,'America/Hermosillo'),
	(116,'America/Indiana/Indianapolis'),
	(117,'America/Indiana/Knox'),
	(118,'America/Indiana/Marengo'),
	(119,'America/Indiana/Petersburg'),
	(120,'America/Indiana/Tell_City'),
	(121,'America/Indiana/Vevay'),
	(122,'America/Indiana/Vincennes'),
	(123,'America/Indiana/Winamac'),
	(124,'America/Inuvik'),
	(125,'America/Iqaluit'),
	(126,'America/Jamaica'),
	(127,'America/Juneau'),
	(128,'America/Kentucky/Louisville'),
	(129,'America/Kentucky/Monticello'),
	(130,'America/Kralendijk'),
	(131,'America/La_Paz'),
	(132,'America/Lima'),
	(133,'America/Los_Angeles'),
	(134,'America/Lower_Princes'),
	(135,'America/Maceio'),
	(136,'America/Managua'),
	(137,'America/Manaus'),
	(138,'America/Marigot'),
	(139,'America/Martinique'),
	(140,'America/Matamoros'),
	(141,'America/Mazatlan'),
	(142,'America/Menominee'),
	(143,'America/Merida'),
	(144,'America/Metlakatla'),
	(145,'America/Mexico_City'),
	(146,'America/Miquelon'),
	(147,'America/Moncton'),
	(148,'America/Monterrey'),
	(149,'America/Montevideo'),
	(150,'America/Montserrat'),
	(151,'America/Nassau'),
	(152,'America/New_York'),
	(153,'America/Nipigon'),
	(154,'America/Nome'),
	(155,'America/Noronha'),
	(156,'America/North_Dakota/Beulah'),
	(157,'America/North_Dakota/Center'),
	(158,'America/North_Dakota/New_Salem'),
	(159,'America/Nuuk'),
	(160,'America/Ojinaga'),
	(161,'America/Panama'),
	(162,'America/Pangnirtung'),
	(163,'America/Paramaribo'),
	(164,'America/Phoenix'),
	(165,'America/Port-au-Prince'),
	(166,'America/Port_of_Spain'),
	(167,'America/Porto_Velho'),
	(168,'America/Puerto_Rico'),
	(169,'America/Punta_Arenas'),
	(170,'America/Rainy_River'),
	(171,'America/Rankin_Inlet'),
	(172,'America/Recife'),
	(173,'America/Regina'),
	(174,'America/Resolute'),
	(175,'America/Rio_Branco'),
	(176,'America/Santarem'),
	(177,'America/Santiago'),
	(178,'America/Santo_Domingo'),
	(179,'America/Sao_Paulo'),
	(180,'America/Scoresbysund'),
	(181,'America/Sitka'),
	(182,'America/St_Barthelemy'),
	(183,'America/St_Johns'),
	(184,'America/St_Kitts'),
	(185,'America/St_Lucia'),
	(186,'America/St_Thomas'),
	(187,'America/St_Vincent'),
	(188,'America/Swift_Current'),
	(189,'America/Tegucigalpa'),
	(190,'America/Thule'),
	(191,'America/Thunder_Bay'),
	(192,'America/Tijuana'),
	(193,'America/Toronto'),
	(194,'America/Tortola'),
	(195,'America/Vancouver'),
	(196,'America/Whitehorse'),
	(197,'America/Winnipeg'),
	(198,'America/Yakutat'),
	(199,'America/Yellowknife'),
	(200,'Antarctica/Casey'),
	(201,'Antarctica/Davis'),
	(202,'Antarctica/DumontDUrville'),
	(203,'Antarctica/Macquarie'),
	(204,'Antarctica/Mawson'),
	(205,'Antarctica/McMurdo'),
	(206,'Antarctica/Palmer'),
	(207,'Antarctica/Rothera'),
	(208,'Antarctica/Syowa'),
	(209,'Antarctica/Troll'),
	(210,'Antarctica/Vostok'),
	(211,'Arctic/Longyearbyen'),
	(212,'Asia/Aden'),
	(213,'Asia/Almaty'),
	(214,'Asia/Amman'),
	(215,'Asia/Anadyr'),
	(216,'Asia/Aqtau'),
	(217,'Asia/Aqtobe'),
	(218,'Asia/Ashgabat'),
	(219,'Asia/Atyrau'),
	(220,'Asia/Baghdad'),
	(221,'Asia/Bahrain'),
	(222,'Asia/Baku'),
	(223,'Asia/Bangkok'),
	(224,'Asia/Barnaul'),
	(225,'Asia/Beirut'),
	(226,'Asia/Bishkek'),
	(227,'Asia/Brunei'),
	(228,'Asia/Chita'),
	(229,'Asia/Choibalsan'),
	(230,'Asia/Colombo'),
	(231,'Asia/Damascus'),
	(232,'Asia/Dhaka'),
	(233,'Asia/Dili'),
	(234,'Asia/Dubai'),
	(235,'Asia/Dushanbe'),
	(236,'Asia/Famagusta'),
	(237,'Asia/Gaza'),
	(238,'Asia/Hebron'),
	(239,'Asia/Ho_Chi_Minh'),
	(240,'Asia/Hong_Kong'),
	(241,'Asia/Hovd'),
	(242,'Asia/Irkutsk'),
	(243,'Asia/Jakarta'),
	(244,'Asia/Jayapura'),
	(245,'Asia/Jerusalem'),
	(246,'Asia/Kabul'),
	(247,'Asia/Kamchatka'),
	(248,'Asia/Karachi'),
	(249,'Asia/Kathmandu'),
	(250,'Asia/Khandyga'),
	(251,'Asia/Kolkata'),
	(252,'Asia/Krasnoyarsk'),
	(253,'Asia/Kuala_Lumpur'),
	(254,'Asia/Kuching'),
	(255,'Asia/Kuwait'),
	(256,'Asia/Macau'),
	(257,'Asia/Magadan'),
	(258,'Asia/Makassar'),
	(259,'Asia/Manila'),
	(260,'Asia/Muscat'),
	(261,'Asia/Nicosia'),
	(262,'Asia/Novokuznetsk'),
	(263,'Asia/Novosibirsk'),
	(264,'Asia/Omsk'),
	(265,'Asia/Oral'),
	(266,'Asia/Phnom_Penh'),
	(267,'Asia/Pontianak'),
	(268,'Asia/Pyongyang'),
	(269,'Asia/Qatar'),
	(270,'Asia/Qostanay'),
	(271,'Asia/Qyzylorda'),
	(272,'Asia/Riyadh'),
	(273,'Asia/Sakhalin'),
	(274,'Asia/Samarkand'),
	(275,'Asia/Seoul'),
	(276,'Asia/Shanghai'),
	(277,'Asia/Singapore'),
	(278,'Asia/Srednekolymsk'),
	(279,'Asia/Taipei'),
	(280,'Asia/Tashkent'),
	(281,'Asia/Tbilisi'),
	(282,'Asia/Tehran'),
	(283,'Asia/Thimphu'),
	(284,'Asia/Tokyo'),
	(285,'Asia/Tomsk'),
	(286,'Asia/Ulaanbaatar'),
	(287,'Asia/Urumqi'),
	(288,'Asia/Ust-Nera'),
	(289,'Asia/Vientiane'),
	(290,'Asia/Vladivostok'),
	(291,'Asia/Yakutsk'),
	(292,'Asia/Yangon'),
	(293,'Asia/Yekaterinburg'),
	(294,'Asia/Yerevan'),
	(295,'Atlantic/Azores'),
	(296,'Atlantic/Bermuda'),
	(297,'Atlantic/Canary'),
	(298,'Atlantic/Cape_Verde'),
	(299,'Atlantic/Faroe'),
	(300,'Atlantic/Madeira'),
	(301,'Atlantic/Reykjavik'),
	(302,'Atlantic/South_Georgia'),
	(303,'Atlantic/St_Helena'),
	(304,'Atlantic/Stanley'),
	(305,'Australia/Adelaide'),
	(306,'Australia/Brisbane'),
	(307,'Australia/Broken_Hill'),
	(308,'Australia/Darwin'),
	(309,'Australia/Eucla'),
	(310,'Australia/Hobart'),
	(311,'Australia/Lindeman'),
	(312,'Australia/Lord_Howe'),
	(313,'Australia/Melbourne'),
	(314,'Australia/Perth'),
	(315,'Australia/Sydney'),
	(316,'Europe/Amsterdam'),
	(317,'Europe/Andorra'),
	(318,'Europe/Astrakhan'),
	(319,'Europe/Athens'),
	(320,'Europe/Belgrade'),
	(321,'Europe/Berlin'),
	(322,'Europe/Bratislava'),
	(323,'Europe/Brussels'),
	(324,'Europe/Bucharest'),
	(325,'Europe/Budapest'),
	(326,'Europe/Busingen'),
	(327,'Europe/Chisinau'),
	(328,'Europe/Copenhagen'),
	(329,'Europe/Dublin'),
	(330,'Europe/Gibraltar'),
	(331,'Europe/Guernsey'),
	(332,'Europe/Helsinki'),
	(333,'Europe/Isle_of_Man'),
	(334,'Europe/Istanbul'),
	(335,'Europe/Jersey'),
	(336,'Europe/Kaliningrad'),
	(337,'Europe/Kiev'),
	(338,'Europe/Kirov'),
	(339,'Europe/Lisbon'),
	(340,'Europe/Ljubljana'),
	(341,'Europe/London'),
	(342,'Europe/Luxembourg'),
	(343,'Europe/Madrid'),
	(344,'Europe/Malta'),
	(345,'Europe/Mariehamn'),
	(346,'Europe/Minsk'),
	(347,'Europe/Monaco'),
	(348,'Europe/Moscow'),
	(349,'Europe/Oslo'),
	(350,'Europe/Paris'),
	(351,'Europe/Podgorica'),
	(352,'Europe/Prague'),
	(353,'Europe/Riga'),
	(354,'Europe/Rome'),
	(355,'Europe/Samara'),
	(356,'Europe/San_Marino'),
	(357,'Europe/Sarajevo'),
	(358,'Europe/Saratov'),
	(359,'Europe/Simferopol'),
	(360,'Europe/Skopje'),
	(361,'Europe/Sofia'),
	(362,'Europe/Stockholm'),
	(363,'Europe/Tallinn'),
	(364,'Europe/Tirane'),
	(365,'Europe/Ulyanovsk'),
	(366,'Europe/Uzhgorod'),
	(367,'Europe/Vaduz'),
	(368,'Europe/Vatican'),
	(369,'Europe/Vienna'),
	(370,'Europe/Vilnius'),
	(371,'Europe/Volgograd'),
	(372,'Europe/Warsaw'),
	(373,'Europe/Zagreb'),
	(374,'Europe/Zaporozhye'),
	(375,'Europe/Zurich'),
	(376,'Indian/Antananarivo'),
	(377,'Indian/Chagos'),
	(378,'Indian/Christmas'),
	(379,'Indian/Cocos'),
	(380,'Indian/Comoro'),
	(381,'Indian/Kerguelen'),
	(382,'Indian/Mahe'),
	(383,'Indian/Maldives'),
	(384,'Indian/Mauritius'),
	(385,'Indian/Mayotte'),
	(386,'Indian/Reunion'),
	(387,'Pacific/Apia'),
	(388,'Pacific/Auckland'),
	(389,'Pacific/Bougainville'),
	(390,'Pacific/Chatham'),
	(391,'Pacific/Chuuk'),
	(392,'Pacific/Easter'),
	(393,'Pacific/Efate'),
	(394,'Pacific/Fakaofo'),
	(395,'Pacific/Fiji'),
	(396,'Pacific/Funafuti'),
	(397,'Pacific/Galapagos'),
	(398,'Pacific/Gambier'),
	(399,'Pacific/Guadalcanal'),
	(400,'Pacific/Guam'),
	(401,'Pacific/Honolulu'),
	(402,'Pacific/Kanton'),
	(403,'Pacific/Kiritimati'),
	(404,'Pacific/Kosrae'),
	(405,'Pacific/Kwajalein'),
	(406,'Pacific/Majuro'),
	(407,'Pacific/Marquesas'),
	(408,'Pacific/Midway'),
	(409,'Pacific/Nauru'),
	(410,'Pacific/Niue'),
	(411,'Pacific/Norfolk'),
	(412,'Pacific/Noumea'),
	(413,'Pacific/Pago_Pago'),
	(414,'Pacific/Palau'),
	(415,'Pacific/Pitcairn'),
	(416,'Pacific/Pohnpei'),
	(417,'Pacific/Port_Moresby'),
	(418,'Pacific/Rarotonga'),
	(419,'Pacific/Saipan'),
	(420,'Pacific/Tahiti'),
	(421,'Pacific/Tarawa'),
	(422,'Pacific/Tongatapu'),
	(423,'Pacific/Wake'),
	(424,'Pacific/Wallis'),
	(425,'UTC');

/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_plans`;

CREATE TABLE `user_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `job_limit` bigint unsigned NOT NULL DEFAULT '1',
  `featured_job_limit` bigint unsigned NOT NULL DEFAULT '0',
  `highlight_job_limit` bigint unsigned NOT NULL DEFAULT '0',
  `candidate_cv_view_limit` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_plans_company_id_foreign` (`company_id`),
  KEY `user_plans_plan_id_foreign` (`plan_id`),
  CONSTRAINT `user_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_plans_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `role` enum('company','candidate') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'candidate',
  `recent_activities_alert` tinyint(1) NOT NULL DEFAULT '1',
  `job_expired_alert` tinyint(1) NOT NULL DEFAULT '1',
  `new_job_alert` tinyint(1) NOT NULL DEFAULT '1',
  `shortlisted_alert` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_demo_field` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `google_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table website_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `website_settings`;

CREATE TABLE `website_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `map_address` text COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `live_job` text COLLATE utf8_unicode_ci NOT NULL,
  `companies` text COLLATE utf8_unicode_ci NOT NULL,
  `candidates` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `website_settings` WRITE;
/*!40000 ALTER TABLE `website_settings` DISABLE KEYS */;

INSERT INTO `website_settings` (`id`, `phone`, `address`, `map_address`, `facebook`, `instagram`, `twitter`, `youtube`, `title`, `sub_title`, `description`, `live_job`, `companies`, `candidates`, `created_at`, `updated_at`)
VALUES
	(1,'(319) 555-0115','6391 Elgin St. Celina, Delaware 10299, New York, United States of America','Your Map','https://www.facebook.com','https://www.instagram.com','https://www.twitter.com','https://www.youtube.com','Who we are','We’re highly skilled and professionals team.','Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus.','175,324','97,354','3,847,154','2022-09-01 06:40:11','2022-09-01 06:40:11');

/*!40000 ALTER TABLE `website_settings` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

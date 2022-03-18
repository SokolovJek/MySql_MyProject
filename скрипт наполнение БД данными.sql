USE my_shop;

-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название разделов интернет магазина',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'quidem'),(2,'voluptatibus'),(3,'consequatur'),(4,'eius'),(5,'voluptatem');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `discounts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,0.6,'1995-08-15 01:45:41','1996-08-01 19:47:31','2001-07-26 06:43:43','2007-05-23 09:22:47'),(2,2,2,0.6,'2015-01-30 02:09:24','2020-01-02 12:03:24','2020-02-18 08:25:19','2005-04-03 11:39:18'),(3,3,3,0.1,'1992-08-15 00:20:19','2012-03-20 21:50:05','1991-11-27 13:35:33','2016-05-17 07:23:18'),(4,4,4,0.3,'2012-06-01 15:43:38','1978-10-11 21:23:04','2001-08-19 03:01:43','2007-04-01 06:51:55'),(5,5,5,0.4,'2007-01-02 23:01:36','1981-09-23 19:13:54','2000-05-04 03:19:31','1975-07-25 00:48:05');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,7,'1992-04-09 23:43:14','1972-09-17 14:09:23'),(2,2,1,'1974-02-27 00:52:15','2013-05-08 08:41:05'),(3,3,9,'2014-04-13 04:24:39','1979-05-28 15:33:44'),(4,4,9,'1978-07-12 12:05:16','2016-10-19 16:17:09'),(5,5,5,'1977-03-21 16:07:02','1994-10-08 03:20:03'),(6,6,9,'1996-12-15 20:49:54','2015-12-20 05:32:06'),(7,7,9,'1984-11-25 02:29:04','2020-04-02 21:04:53'),(8,8,5,'1971-03-22 05:48:40','1998-06-13 22:12:57'),(9,9,4,'1998-07-21 04:53:59','1997-12-05 02:34:48'),(10,10,3,'2013-10-14 04:54:15','1982-01-25 11:07:25'),(11,1,1,'2014-06-12 08:50:12','1970-12-29 01:16:17'),(12,2,9,'2020-10-04 01:07:45','1987-05-21 12:49:20'),(13,3,9,'2002-12-20 11:52:41','1999-10-11 01:36:06'),(14,4,3,'1988-12-15 04:43:25','1991-07-06 21:23:49'),(15,5,9,'1977-01-22 23:21:10','1992-11-16 07:50:57');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `desription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'consequatur','Quos sit ut aut corrupti explicabo inventore veritatis.',110754.26,1,'1994-03-20 13:21:33','1995-07-29 23:34:30'),(2,'excepturi','Ab architecto tenetur incidunt voluptatibus consequatur ut unde enim.',155744.44,2,'1973-10-23 07:35:34','1972-08-20 02:13:16'),(3,'aut','Magnam enim et cupiditate aliquam consequatur iste.',27316435.64,3,'1976-07-15 06:47:23','2004-06-15 11:29:06'),(4,'non','Laboriosam ex mollitia nam quidem quia voluptate officiis omnis.',0.00,4,'2007-04-07 02:34:48','2011-12-29 15:58:48'),(5,'eos','In placeat rem dolorem illum nihil qui et asperiores iure consequatur molestiae et inventore.',8.81,5,'2004-05-14 09:05:21','1996-05-10 21:00:20'),(6,'fuga','Qui repudiandae vero dolor similique doloremque nostrum.',0.00,1,'1972-02-15 18:27:35','2019-01-29 02:52:27'),(7,'est','Quis expedita aut voluptatem repudiandae magni ut.',35.72,2,'1970-11-23 06:22:05','1972-03-07 03:31:03'),(8,'quo','Quis mollitia nihil maiores sed deleniti et laudantium aliquam possimus voluptatem.',337.34,3,'2009-09-18 03:41:09','2012-04-20 09:38:31'),(9,'et','Deleniti voluptatem iure qui exercitationem dolores atque voluptatum nobis tempore saepe.',0.00,4,'1972-10-16 09:51:09','2008-10-03 18:42:47'),(10,'eius','Est qui repellat ullam possimus ut qui in numquam corrupti.',1391247.58,5,'1981-05-05 02:18:00','1978-11-03 16:13:08'),(11,'et','Nemo recusandae facilis ut fuga praesentium ea nostrum et.',0.00,1,'1976-12-23 11:37:39','1997-11-12 08:54:50'),(12,'sit','Eius esse voluptatum sapiente consectetur mollitia modi possimus animi molestiae dolor eius molestias quasi.',56571.01,2,'1981-07-25 01:57:57','1994-07-14 03:36:53'),(13,'qui','In aut aliquid et ab accusamus itaque et facilis.',6386.75,3,'2004-09-02 09:55:13','1983-10-28 16:13:46'),(14,'itaque','Repellendus est dolore voluptatem distinctio sit dolores explicabo omnis.',462061.74,4,'2002-08-20 22:58:30','1994-01-04 20:20:46'),(15,'occaecati','Ipsa iste id temporibus dolor consequatur beatae quia.',186609640.99,5,'2020-10-02 12:29:18','1995-02-27 05:04:39'),(16,'fugiat','Pariatur nemo deserunt deserunt sapiente et est.',585625172.60,1,'1972-01-18 07:27:16','1977-01-19 02:17:07'),(17,'nemo','Omnis ipsa quo fugiat et doloribus occaecati numquam ipsa non cum dolores.',15221.50,2,'1992-06-18 19:59:33','1971-10-13 22:28:12'),(18,'inventore','Eos reiciendis provident et ut voluptatem impedit.',369466.40,3,'2003-06-06 09:48:20','1998-01-04 06:21:21'),(19,'sequi','Rerum sapiente molestiae ad voluptatem ut voluptates et et reprehenderit tenetur modi dignissimos reprehenderit.',3.92,4,'1992-06-27 13:06:12','2017-05-18 12:18:27'),(20,'earum','Adipisci asperiores et rerum velit eveniet non similique est assumenda doloremque sed.',5.94,5,'1989-05-19 12:55:03','1983-08-28 05:55:12');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` enum('M','W') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'M','1995-03-10','2007-04-04 16:31:04','Robelfort'),(2,'W','1972-03-14','2017-10-05 08:12:41','West Normashire'),(3,'W','2002-06-17','1982-08-06 17:00:31','Port Rosalind'),(4,'W','1976-08-20','2017-10-25 12:23:28','Port Furman'),(5,'M','1977-07-14','1984-12-29 01:17:26','Welchton'),(6,'W','1992-06-19','1982-04-08 19:55:44','Juleschester'),(7,'M','1980-12-27','2004-04-28 13:20:51','New Samanthaburgh'),(8,'M','1977-11-03','2013-09-13 08:08:33','New Creolaville'),(9,'M','2017-03-17','1997-04-19 05:35:22','East Mabel'),(10,'M','1992-01-21','1996-12-01 17:27:04','South Cristobalmouth');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'2777 Loyal Extensions Suite 827\nPort Zitafort, VA 14216','2005-04-30 00:03:58','2014-10-29 17:28:59'),(2,'377 Buster Orchard Suite 638\nEast Chester, SC 65653','1977-06-24 09:58:41','2009-09-10 18:51:40'),(3,'4865 Natalia Corner\nVolkmanstad, NV 12633','1997-07-24 22:20:53','2009-01-23 03:56:13');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `storehouse_id` (`storehouse_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `storehouses_products_ibfk_1` FOREIGN KEY (`storehouse_id`) REFERENCES `storehouses` (`id`),
  CONSTRAINT `storehouses_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,2,'2003-09-01 15:26:55','2014-10-21 06:49:19'),(2,2,2,10,'2013-08-30 02:06:27','1972-09-05 18:19:28'),(3,3,3,4,'2019-05-31 21:25:47','1994-05-02 07:44:23'),(4,1,4,2,'1983-06-24 02:15:07','1975-05-02 13:04:02'),(5,2,5,3,'2007-11-06 19:03:59','1995-01-09 00:51:02'),(6,3,6,7,'1985-10-19 20:34:03','2004-03-15 09:24:50'),(7,1,7,2,'2004-05-03 23:46:01','1983-07-03 01:47:46'),(8,2,8,7,'1991-08-31 07:58:21','2000-10-24 18:05:11'),(9,3,9,1,'1991-09-05 13:21:56','1971-11-27 07:47:34'),(10,1,10,3,'1992-06-22 02:43:32','1992-07-01 22:09:44'),(11,2,11,0,'2021-03-22 15:37:39','1971-03-25 00:16:10'),(12,3,12,8,'1993-02-25 14:23:21','2016-01-21 10:10:46'),(13,1,13,1,'1977-12-21 11:19:10','1993-10-15 23:58:16'),(14,2,14,4,'1975-03-13 13:55:52','1997-05-12 06:52:31'),(15,3,15,6,'2004-06-07 22:35:00','1982-02-05 03:06:29'),(16,1,16,2,'1991-04-21 13:25:03','1977-01-18 21:38:59'),(17,2,17,0,'2019-08-22 02:32:07','1991-04-02 19:44:15'),(18,3,18,4,'1995-05-05 09:27:20','1987-03-17 03:35:16'),(19,1,19,1,'1972-07-01 18:10:18','2012-07-24 14:03:57'),(20,2,20,8,'2006-04-19 00:41:40','1996-02-12 12:51:51');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tressie','Turcotte','alexane.pfeffer@example.org','d380d04bf02336d61faba878da68b57012a00f06',89317909507),(2,'Layne','Hyatt','mafalda17@example.org','c539122cc1d4daa210068a9ad85887e8e88c76f5',89675059325),(3,'Reina','Upton','newell.hodkiewicz@example.net','6baec8a6a9c85f9ac8ede6a3f0f240dd2ca8cb31',89179286267),(4,'Candace','Stehr','nikolas.nicolas@example.net','712ca160cd3640f81631cb98a5b9461501b04daf',89210399899),(5,'Retha','Quitzon','zlind@example.org','19853bd4a4bb05793991a6da08e72c8918432fe8',89159647820),(6,'Laurie','Jacobson','orodriguez@example.com','73e8b66e0d17a859d7fbf39ed6b14ab6cafea6ff',89866111529),(7,'Maeve','Smitham','chase92@example.org','23a0bb8f11d3309f84bfb2fbfc312ff4db5a5e71',89225538805),(8,'Fay','Lehner','dave.kunze@example.com','fccc6829ba05409fa7768fe486d6ecfadb4a5aad',89136138521),(9,'Adam','Littel','thelma.stokes@example.com','465a236ec61950b5dcfa10f928fe4bdff48063dc',89041129250),(10,'Krista','Kreiger','shea.wolff@example.net','f35c8145282db18fa1aec8fc6a91a9f3cb5e4e9d',89837307966);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-01 18:50:58

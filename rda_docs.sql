# SQL Manager 2007 for MySQL 4.5.0.4
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : rda_docs


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `rda_docs`;

CREATE DATABASE `rda_docs`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `rda_docs`;

SET sql_mode = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

#
# Structure for the `content_types` table : 
#

CREATE TABLE `content_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subcode` int(11) unsigned DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Structure for the `document` table : 
#

CREATE TABLE `document` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `num_prefix_0` varchar(5) DEFAULT '0',
  `num_prefix_1` varchar(5) DEFAULT NULL,
  `num_prefix_2` varchar(5) DEFAULT NULL,
  `internal_number` int(11) DEFAULT NULL,
  `external_number` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `isreapeted` varchar(10) DEFAULT 'no',
  `datestamp` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `date_create` date DEFAULT NULL,
  `date_control` date DEFAULT NULL,
  `date_in` date DEFAULT NULL,
  `topicstarter` bigint(20) unsigned DEFAULT '0',
  `topicstarter_org` int(11) unsigned DEFAULT '0',
  `summary` text,
  `comment` text,
  `topicstarter_text` text,
  `created_by` int(11) unsigned DEFAULT NULL,
  `curr_user` text,
  `type` varchar(20) DEFAULT 'none',
  `status` varchar(20) DEFAULT 'created',
  `impstatus` varchar(20) DEFAULT NULL,
  `donestatus` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

#
# Structure for the `document_donestr` table : 
#

CREATE TABLE `document_donestr` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `ts` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `keystr` varchar(20) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

#
# Structure for the `document_extnum` table : 
#

CREATE TABLE `document_extnum` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `ts` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `keystr` varchar(20) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

#
# Structure for the `document_movings` table : 
#

CREATE TABLE `document_movings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `ts` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `keystr` varchar(20) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `document_id` (`document_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

#
# Structure for the `document_notes` table : 
#

CREATE TABLE `document_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `ts` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `keystr` varchar(20) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

#
# Structure for the `document_org` table : 
#

CREATE TABLE `document_org` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT '0',
  `organization_id` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `document_people` table : 
#

CREATE TABLE `document_people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT '0',
  `people_id` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

#
# Structure for the `movings` table : 
#

CREATE TABLE `movings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document` bigint(20) unsigned DEFAULT '0',
  `tmstamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `prevuser` bigint(20) unsigned DEFAULT '0',
  `nextuser` bigint(20) unsigned DEFAULT '0',
  `movtext` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for the `org_types` table : 
#

CREATE TABLE `org_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subcode` int(11) unsigned DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Structure for the `organizations` table : 
#

CREATE TABLE `organizations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `city` varchar(250) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `street` varchar(250) DEFAULT NULL,
  `building` varchar(10) DEFAULT NULL,
  `housing` varchar(10) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Structure for the `people` table : 
#

CREATE TABLE `people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `secondname` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `passport` varchar(30) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT '73000',
  `city` varchar(20) DEFAULT 'Херсон',
  `street` varchar(250) DEFAULT NULL,
  `building` varchar(10) DEFAULT NULL,
  `housing` varchar(10) DEFAULT '-',
  `room` varchar(10) DEFAULT NULL,
  `phones` varchar(250) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Structure for the `people_meta` table : 
#

CREATE TABLE `people_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `people_id` bigint(20) unsigned DEFAULT NULL,
  `keystr` varchar(20) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Structure for the `resolution` table : 
#

CREATE TABLE `resolution` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document` bigint(20) unsigned DEFAULT '0',
  `rtext` text,
  `creator` int(11) DEFAULT '0',
  `nextuser` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for the `social_status` table : 
#

CREATE TABLE `social_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keystr` varchar(20) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Structure for the `state_types` table : 
#

CREATE TABLE `state_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL DEFAULT '2',
  `subcode` int(11) NOT NULL DEFAULT '0',
  `text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for the `user_custom_fields` table : 
#

CREATE TABLE `user_custom_fields` (
  `user_id` int(11) unsigned NOT NULL,
  `attribute` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `users` table : 
#

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `time_created` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) DEFAULT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `confirmationToken` varchar(100) DEFAULT NULL,
  `timePasswordResetRequested` int(11) unsigned DEFAULT NULL,
  `status` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

#
# Definition for the `date_interval` procedure : 
#

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `date_interval`(
        IN startDate DATE,
        IN endDate DATE
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare iterDate date;
   set iterDate = startDate;

   DROP TABLE IF EXISTS dateIntervals;
   create temporary table dateIntervals (
      theDate date
   );

   label1: LOOP
     insert into dateIntervals(theDate) values (iterDate); 
     SET iterDate = DATE_ADD(iterDate, INTERVAL 1 DAY);
     IF iterDate <= endDate THEN
        ITERATE label1;
     END IF;
     LEAVE label1;
   END LOOP label1;

   select * from dateIntervals;
END$$

#
# Definition for the `date_interval_month` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `date_interval_month`(
        IN startDate DATE,
        IN endDate DATE
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare iterDate date;
   set iterDate = startDate;
   
   DROP TABLE IF EXISTS dateIntervals;
   create temporary table dateIntervals (
      theDate date
   );

   label1: LOOP
     insert into dateIntervals(theDate) values (iterDate); 
     SET iterDate = DATE_ADD(iterDate, INTERVAL 1 MONTH);
     IF iterDate <= endDate THEN
        ITERATE label1;
     END IF;
     LEAVE label1;
   END LOOP label1;

   select * from dateIntervals;
END$$

DELIMITER ;

#
# Definition for the `document_archive` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_archive AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_0` AS `num_prefix_0`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `users`.`name` AS `name`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    (`document`.`status` = 'archived');

#
# Definition for the `document_archive_org` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_archive_org AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_0` AS `num_prefix_0`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_0`,'-',`document`.`internal_number`,'-',`document`.`num_prefix_2`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `users`.`name` AS `name`,
    `organizations`.`name` AS `orgname`,
    `organizations`.`city` AS `city`,
    `organizations`.`street` AS `street`,
    `organizations`.`building` AS `building`,
    `organizations`.`housing` AS `housing`,
    `organizations`.`room` AS `room`,
    concat(`organizations`.`name`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `organizations` on((`organizations`.`id` = `document`.`topicstarter_org`))) 
  where 
    (`document`.`status` = 'archived');

#
# Definition for the `document_archive_people` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_archive_people AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    if((`document`.`isreapeted` > 0),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`,'/',`document`.`isreapeted`),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`)) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`impstatus` AS `impstatus`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`status` AS `status`,
    `users`.`name` AS `name`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    `people`.`city` AS `city`,
    `people`.`sex` AS `sex`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    ((`document`.`status` = 'archived') and (`document`.`num_prefix_1` <> 2)) 
  order by 
    `document`.`id` desc;

#
# Definition for the `document_archive_state` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_archive_state AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`num_prefix_2`,'-',`document`.`internal_number`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `users`.`name` AS `name`,
    `state_types`.`text` AS `stateorgname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `state_types` on((`state_types`.`id` = `document`.`num_prefix_2`))) 
  where 
    ((`document`.`status` = 'archived') and (`document`.`num_prefix_1` = 2));

#
# Definition for the `document_archive_visitors` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_archive_visitors AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`impstatus` AS `impstatus`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`status` AS `status`,
    `users`.`name` AS `name`,
    `people`.`id` AS `pid`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    `people`.`city` AS `city`,
    `people`.`sex` AS `sex`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    ((`document`.`status` = 'archived') and (`document`.`type` = 'visitors')) 
  order by 
    `document`.`id` desc;

#
# Definition for the `document_view` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_view AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    if((`document`.`type` = 'people'),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`),if((`document`.`type` = 'visitors'),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`,'/',`document`.`num_prefix_2`),'')) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `users`.`name` AS `name`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    ((`document`.`status` <> 'archived') and ((`document`.`type` = 'people') or (`document`.`type` = 'visitors')));

#
# Definition for the `document_view_org` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_view_org AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_0` AS `num_prefix_0`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_0`,'-',`document`.`internal_number`,'-',`document`.`num_prefix_2`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    `document`.`date_in` AS `date_in`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`impstatus` AS `impstatus`,
    `users`.`name` AS `name`,
    `organizations`.`name` AS `orgname`,
    `organizations`.`city` AS `city`,
    `organizations`.`street` AS `street`,
    `organizations`.`building` AS `building`,
    `organizations`.`housing` AS `housing`,
    `organizations`.`room` AS `room`,
    concat(`organizations`.`name`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `organizations` on((`organizations`.`id` = `document`.`topicstarter_org`))) 
  where 
    (`document`.`status` <> 'archived');

#
# Definition for the `document_view_people` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_view_people AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    if((`document`.`isreapeted` > 0),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`,'/',`document`.`isreapeted`),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`)) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`impstatus` AS `impstatus`,
    `users`.`name` AS `name`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    `people`.`city` AS `city`,
    `people`.`sex` AS `sex`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    (`document`.`num_prefix_1` <> 2) 
  order by 
    `document`.`id` desc;

#
# Definition for the `document_view_state` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_view_state AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`num_prefix_2`,'-',`document`.`internal_number`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    `document`.`date_in` AS `date_in`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`impstatus` AS `impstatus`,
    `users`.`name` AS `name`,
    `state_types`.`text` AS `stateorgname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `state_types` on((`state_types`.`id` = `document`.`num_prefix_2`))) 
  where 
    ((`document`.`status` <> 'archived') and (`document`.`num_prefix_1` = 2));

#
# Definition for the `document_view_visitors` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_view_visitors AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`,'/',`document`.`num_prefix_2`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`status` AS `status`,
    `document`.`impstatus` AS `impstatus`,
    `document`.`donestatus` AS `donestatus`,
    `users`.`name` AS `name`,
    `people`.`id` AS `pid`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    `people`.`city` AS `city`,
    `people`.`sex` AS `sex`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    (`document`.`type` = 'visitors') 
  order by 
    `document`.`id` desc;

#
# Definition for the `document_work_org` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_work_org AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_0` AS `num_prefix_0`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_0`,'-',`document`.`internal_number`,'-',`document`.`num_prefix_2`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    `document`.`date_in` AS `date_in`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`impstatus` AS `impstatus`,
    `users`.`name` AS `name`,
    `organizations`.`name` AS `orgname`,
    `organizations`.`city` AS `city`,
    `organizations`.`street` AS `street`,
    `organizations`.`building` AS `building`,
    `organizations`.`housing` AS `housing`,
    `organizations`.`room` AS `room`,
    concat(`organizations`.`name`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `organizations` on((`organizations`.`id` = `document`.`topicstarter_org`))) 
  where 
    (`document`.`status` <> 'archived');

#
# Definition for the `document_work_people` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_work_people AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    if((`document`.`isreapeted` > 0),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`,'/',`document`.`isreapeted`),concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`)) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`impstatus` AS `impstatus`,
    `users`.`name` AS `name`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    `people`.`city` AS `city`,
    `people`.`sex` AS `sex`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    ((`document`.`num_prefix_1` <> 2) and (`document`.`status` <> 'archived')) 
  order by 
    `document`.`id` desc;

#
# Definition for the `document_work_state` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_work_state AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`num_prefix_2`,'-',`document`.`internal_number`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    `document`.`date_in` AS `date_in`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`status` AS `status`,
    `document`.`donestatus` AS `donestatus`,
    `document`.`impstatus` AS `impstatus`,
    `users`.`name` AS `name`,
    `state_types`.`text` AS `stateorgname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `state_types` on((`state_types`.`id` = `document`.`num_prefix_2`))) 
  where 
    ((`document`.`status` <> 'archived') and (`document`.`type` = 'state'));

#
# Definition for the `document_work_visitors` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW document_work_visitors AS 
  select 
    `document`.`id` AS `id`,
    `document`.`num_prefix_1` AS `num_prefix_1`,
    `document`.`num_prefix_2` AS `num_prefix_2`,
    `document`.`internal_number` AS `internal_number`,
    concat(`document`.`num_prefix_1`,'-',`document`.`internal_number`,'/',`document`.`num_prefix_2`) AS `fullnum`,
    `document`.`external_number` AS `external_number`,
    `document`.`year` AS `year`,
    `document`.`datestamp` AS `datestamp`,
    `document`.`date_create` AS `date_create`,
    `document`.`date_control` AS `date_control`,
    date_format(`document`.`date_control`,'%d.%m.%Y') AS `date_control_text`,
    date_format(`document`.`date_in`,'%d.%m.%Y') AS `date_in_text`,
    `document`.`date_in` AS `date_in`,
    `document`.`topicstarter` AS `topicstarter`,
    `document`.`comment` AS `comment`,
    `document`.`summary` AS `summary`,
    `document`.`created_by` AS `created_by`,
    `document`.`type` AS `type`,
    `document`.`isreapeted` AS `isreapeted`,
    `document`.`status` AS `status`,
    `document`.`impstatus` AS `impstatus`,
    `document`.`donestatus` AS `donestatus`,
    `users`.`name` AS `name`,
    `people`.`id` AS `pid`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    `people`.`city` AS `city`,
    `people`.`sex` AS `sex`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname` 
  from 
    ((`document` join `users` on((`users`.`id` = `document`.`created_by`))) join `people` on((`people`.`id` = `document`.`topicstarter`))) 
  where 
    ((`document`.`type` = 'visitors') and (`document`.`status` <> 'archived')) 
  order by 
    `document`.`id` desc;

#
# Definition for the `movings_view` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW movings_view AS 
  select 
    `movings`.`id` AS `id`,
    `movings`.`document` AS `document`,
    `movings`.`tmstamp` AS `tmstamp`,
    date_format(`movings`.`tmstamp`,'%d.%m.%Y') AS `dateformated`,
    `movings`.`prevuser` AS `prevuser`,
    `movings`.`nextuser` AS `nextuser`,
    `movings`.`movtext` AS `movtext`,
    (
  select 
    `users`.`name` 
  from 
    `users` 
  where 
    (`users`.`id` = `movings`.`prevuser`)) AS `prevusername`,(
  select 
    `users`.`name` 
  from 
    `users` 
  where 
    (`users`.`id` = `movings`.`nextuser`)) AS `nextusername` 
  from 
    `movings` 
  order by 
    `movings`.`tmstamp`;

#
# Definition for the `people_view` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW people_view AS 
  select 
    `people`.`id` AS `id`,
    `people`.`lastname` AS `lastname`,
    `people`.`firstname` AS `firstname`,
    `people`.`secondname` AS `secondname`,
    concat(`people`.`lastname`,' ',`people`.`firstname`,' ',`people`.`secondname`) AS `fullname`,
    `people`.`passport` AS `passport`,
    `people`.`zipcode` AS `zipcode`,
    `people`.`city` AS `city`,
    `people`.`street` AS `street`,
    `people`.`building` AS `building`,
    `people`.`housing` AS `housing`,
    `people`.`room` AS `room`,
    `people`.`phones` AS `phones`,
    `people`.`comment` AS `comment` 
  from 
    `people`;

#
# Data for the `content_types` table  (LIMIT 0,500)
#

INSERT INTO `content_types` (`id`, `subcode`, `text`) VALUES 
  (19,17,'Листування з центральними та місцевими органами державної влади, органами місцевого самоврядування з основних питань діяльності'),
  (20,0,NULL),
  (21,18,'Листування з підприємствами з питань роботи промислового комплексу'),
  (22,19,'Листування з підприємствами з питань роботи будівельних організацій, ремонтних робіт, реконструкції'),
  (23,20,'Листування з підприємствами з питань торгівлі, харчування та побутового обслуговування'),
  (24,21,'Листування з організаціями з питань благоустрою та роботи комунальних служб'),
  (25,22,'Листування з організаціями з питань роботи транспорту та зв''язку'),
  (26,23,'Листування з установами науки, освіти, культури з питань цих галузей'),
  (27,24,'Листування з організаціями з питань охорони здоров''я, соціального захисту населення, субсидій, пенсії та пенсії за особливі заслуги'),
  (28,25,'Листування з організаціями з питань землекористування, індивідуального будівництва, підтоплення, роботи аграрного сектору'),
  (29,26,'Листування з правоохоронними органами з питань роботи правових комісій, місцевого суду, прокуратури, органів внутрішніх справ, пожежної охорони, надзвичайних ситуацій'),
  (30,27,'Листування з організаціями та громадянами з питань видачі довідок, опіки та піклування і надання матеріальної допомоги');
COMMIT;

#
# Data for the `document` table  (LIMIT 0,500)
#

INSERT INTO `document` (`id`, `num_prefix_0`, `num_prefix_1`, `num_prefix_2`, `internal_number`, `external_number`, `year`, `isreapeted`, `datestamp`, `date_create`, `date_control`, `date_in`, `topicstarter`, `topicstarter_org`, `summary`, `comment`, `topicstarter_text`, `created_by`, `curr_user`, `type`, `status`, `impstatus`, `donestatus`) VALUES 
  (1,'','ПР/І','З',1,NULL,2017,'no','2017-12-10 20:29:36.872209','2017-12-10','2017-12-10','2017-12-10',NULL,0,'Спортивное программирование. Достаточно часто студенческие олимпиады состоят не только из соревнования в формате ACM ICPC, но и сопровождаются другими соревнованиями, которые ни как не влияют на общий результат, и служат для повышения интереса ...','ортапртап апртоап',NULL,1,'7','visitors','archived',NULL,''),
  (2,'','ПР/С','З',2,NULL,2017,'no','2017-12-12 19:47:48.125361','2017-12-12','2017-12-28','2017-12-12',NULL,0,'апфк цукпке ыупкепу епыупеык еырпкепрыу','Відвідвувач петро прийнятий Заступник голови 1 12.12.2017, дата контролю 28.12.2017',NULL,1,'4','visitors','archived',NULL,''),
  (3,'','ПР/П','З',3,NULL,2017,'no','2017-12-27 00:10:21.105504','2017-12-27','2017-12-27','2017-12-27',NULL,0,'ва фак фуаму фкафук','Відвідвувач Петров Петро Петрович | Карбишева, буд.12, кв.32 прийнятий ЗАДНІПРЯНИЙ Андрій Вікторович 27.12.2017, дата контролю 27.12.2017',NULL,1,'25','visitors','archived',NULL,''),
  (4,'','ПР/П','З',4,NULL,2017,'no','2017-12-27 01:08:02.987512','2017-12-27','2017-12-28','2017-12-27',NULL,0,'Відвідвувач Петров Петро Петрович | Карбишева, буд.12, кв.32 прийнятий ЗАДНІПРЯНИЙ Андрій Вікторович 27.12.2017, дата контролю 28.12.2017','Відвідвувач Петров Петро Петрович | Карбишева, буд.12, кв.32 прийнятий ЗАДНІПРЯНИЙ Андрій Вікторович 27.12.2017, дата контролю 28.12.2017',NULL,1,'a:1:{i:0;s:2:\"13\";}','visitors','hasresolution',NULL,'m'),
  (5,'','І','',1,NULL,2018,'no','2018-01-15 20:00:26.953815','2018-01-15','2018-01-16','2018-01-15',2,0,'а  онпглн шдгрол','Відвідвувач undefined прийнятий  15.01.2018, дата контролю 16.01.2018',NULL,1,'30','people','archived',NULL,''),
  (6,'','П','',2,NULL,2018,'no','2018-01-15 20:09:01.499245','2018-01-15','2018-01-16','2018-01-15',1,0,'вап куапу кпк маук','Відвідвувач undefined прийнятий  15.01.2018, дата контролю 16.01.2018',NULL,1,'30','people','archived','ugl','p'),
  (7,'','П','',2,NULL,2018,'no','2018-01-15 20:28:17.827383','2018-01-15','2018-01-17','2018-01-15',1,0,'авпиыв','Відвідвувач undefined прийнятий  15.01.2018, дата контролю 17.01.2018',NULL,1,'30','people','archived','ugl','m'),
  (8,'','ПР/С','З',1,NULL,2018,'no','2018-01-16 00:17:57.549530','2018-01-16','2018-01-17','2018-01-16',NULL,0,'','Відвідвувач Сіліщенко Оксана Петрівна | Петренко, буд.12, кв.1 прийнятий ЗАДНІПРЯНИЙ Андрій Вікторович 16.01.2018, дата контролю 17.01.2018',NULL,1,'a:2:{i:0;s:2:\"16\";i:1;s:2:\"20\";}','visitors','hasresolution',NULL,'m'),
  (9,'','Ф','',3,NULL,2018,'no','2018-01-16 00:46:36.006820','2018-01-16','2018-01-18','2018-01-16',3,0,'','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 18.01.2018',NULL,1,'a:7:{i:0;s:2:\"15\";i:1;s:1:\"9\";i:2;s:2:\"14\";i:3;s:2:\"21\";i:4;s:2:\"27\";i:5;s:2:\"13\";i:6;s:2:\"19\";}','people','archived',NULL,'p'),
  (10,'','Ф','',3,NULL,2018,'no','2018-01-16 01:06:37.144521','2018-01-16','2018-01-17','2018-01-16',3,0,'','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 17.01.2018',NULL,1,'a:2:{i:0;s:2:\"12\";i:1;s:2:\"20\";}','people','archived',NULL,'r'),
  (11,'','Ф','',4,NULL,2018,'no','2018-01-16 01:12:41.079337','2018-01-16','2018-01-30','2018-01-16',3,0,'вапм іваіуа','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 30.01.2018',NULL,1,'30','people','archived',NULL,'r'),
  (12,'','Ф','',4,NULL,2018,'no','2018-01-16 01:13:44.461962','2018-01-16','2018-01-30','2018-01-16',3,0,'вапм іваіуа','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 30.01.2018',NULL,1,'30','people','archived',NULL,'m'),
  (13,'','Ф','',4,NULL,2018,'no','2018-01-16 01:14:59.278241','2018-01-16','2018-01-30','2018-01-16',3,0,'вапм іваіуа','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 30.01.2018',NULL,1,'30','people','archived',NULL,'p'),
  (14,'','Ф','',4,NULL,2018,'no','2018-01-16 01:17:50.083011','2018-01-16','2018-01-30','2018-01-16',3,0,'11111111 0 3 333','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 30.01.2018',NULL,1,'a:2:{i:0;s:2:\"11\";i:1;s:2:\"16\";}','people','hasresolution',NULL,''),
  (15,'','Ф','',4,NULL,2018,'3','2018-01-16 01:33:22.067317','2018-01-16','2018-01-30','2018-01-16',3,0,'вапм іваіуа','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  16.01.2018, дата контролю 30.01.2018',NULL,1,'30','people','created',NULL,''),
  (16,'','ПР/І','З',2,NULL,2018,'no','2018-01-27 22:34:16.137737','2018-01-27','2018-01-31','2018-01-27',NULL,0,'айцукайцукайцу','Відвідвувач Іванова Ганна Миколаївна | 19 Східна, буд.15 прийнятий ЗАДНІПРЯНИЙ Андрій Вікторович 27.01.2018, дата контролю 31.01.2018',NULL,1,'a:1:{i:0;s:2:\"16\";}','visitors','hasresolution','ugl','m'),
  (17,'','І','',5,NULL,2018,'no','2018-01-27 22:50:38.204908','2018-01-27','2018-01-31','2018-01-27',2,0,'іваіу цукас цу','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  27.01.2018, дата контролю 31.01.2018',NULL,1,'30','people','archived','ugl','r'),
  (18,'','І','',5,NULL,2018,'2','2018-01-27 23:06:40.612955','2018-01-27','2018-01-31','2018-01-27',2,0,'ау','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  27.01.2018, дата контролю 31.01.2018',NULL,1,'30','people','archived',NULL,'r'),
  (19,'','Ф','',6,NULL,2018,'no','2018-01-27 23:08:26.307000','2018-01-27','2018-01-31','2018-01-26',3,0,'','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  26.01.2018, дата контролю 31.01.2018',NULL,1,'30','people','archived',NULL,'m'),
  (20,'','Ф','',6,NULL,2018,'no','2018-01-27 23:09:22.125193','2018-01-27','2018-01-31','2018-01-26',3,0,'','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  26.01.2018, дата контролю 31.01.2018',NULL,1,'30','people','archived',NULL,'p'),
  (21,'','Ф','',6,NULL,2018,'2','2018-01-27 23:09:53.097964','2018-01-27','2018-01-31','2018-01-26',3,0,'','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  26.01.2018, дата контролю 31.01.2018',NULL,1,'30','people','archived','ugl','m'),
  (22,'','ПР/Ф','Р',3,NULL,2018,'no','2018-01-27 23:25:09.686390','2018-01-27','2018-01-31','2018-01-27',NULL,0,'м    ммсмс','Відвідвувач Філатов Ігор Іванович | Сенявіна, буд.2, кв.34 прийнятий РУБАНЕЦЬ Віталій Васильович  27.01.2018, дата контролю 31.01.2018',NULL,1,'23','visitors','hasresolution','','m'),
  (23,'','П','',7,NULL,2018,'no','2018-01-28 21:59:08.174036','2018-01-28','2018-01-31','2018-01-28',1,0,'ав е ек ка аепу 5 56','Листа надіслав Петров Петро Петрович | Карбишева, буд.12, кв.32  28.01.2018, дата контролю 31.01.2018',NULL,1,'9','people','archived','','m'),
  (24,'','І','',7,NULL,2018,'2','2018-01-31 21:11:50.073465','2018-01-31','2018-01-31','2018-01-24',2,0,'','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  24.01.2018, дата контролю 31.01.2018',NULL,1,'31','people','archived','','r'),
  (25,'','І','',8,NULL,2018,'no','2018-01-31 21:48:53.505638','2018-01-31','2018-02-10','2018-01-31',2,0,'пппввпвп  авв','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  31.01.2018, дата контролю 10.02.2018',NULL,1,'20','people','archived','ugl','r'),
  (26,'','ПР/З','Р',4,NULL,2018,'no','2018-01-31 23:10:16.782946','2018-01-31','2018-02-01','2018-01-31',NULL,0,'','Відвідвувач Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1 прийнятий РУБАНЕЦЬ Віталій Васильович  31.01.2018, дата контролю 01.02.2018',NULL,1,'18','visitors','hasresolution','','m'),
  (27,'','З','',9,NULL,2018,'no','2018-01-31 23:11:12.186115','2018-01-31','2018-02-02','2018-01-31',19,0,'','Листа надіслав Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1  31.01.2018, дата контролю 02.02.2018',NULL,1,'13','people','archived','ugl','p'),
  (28,'','І','',10,NULL,2018,'no','2018-02-05 18:22:24.609401','2018-02-05','2018-02-28','2018-02-06',2,0,'енн е рвенре','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  06.02.2018, дата контролю 28.02.2018',NULL,1,'30','people','hasresolution','',''),
  (29,'','Ф','',11,NULL,2018,'no','2018-02-05 20:07:00.259561','2018-02-05','2018-02-27','2018-02-05',3,0,'fre rfgtvewr gwrfvgewr','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  05.02.2018, дата контролю 27.02.2018',NULL,1,'a:5:{i:0;s:2:\"31\";i:1;s:2:\"13\";i:2;s:2:\"20\";i:3;s:2:\"14\";i:4;s:2:\"28\";}','people','archived','','m'),
  (30,'','Ф','',12,NULL,2018,'no','2018-02-05 21:16:23.404679','2018-02-05','2018-02-13','2018-02-05',3,0,'вапукап','Листа надіслав Філатов Ігор Іванович | Сенявіна, буд.2, кв.34  05.02.2018, дата контролю 13.02.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','archived','','p'),
  (31,'','С','',13,NULL,2018,'no','2018-02-05 21:19:00.770680','2018-02-05','2018-02-06','2018-02-05',6,0,'ааа','Листа надіслав Сіліщенко Оксана Петрівна | Петренко, буд.12, кв.1  05.02.2018, дата контролю 06.02.2018',NULL,1,'a:3:{i:0;s:2:\"30\";i:1;s:2:\"15\";i:2;s:2:\"18\";}','people','archived','','m'),
  (32,'','С','',14,NULL,2018,'no','2018-02-07 19:47:47.645467','2018-02-07','2018-02-07','2018-02-07',16,0,'','Листа надіслав Свириденко Олександр Петрович | Квіткова, буд.2  07.02.2018, дата контролю 07.02.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','',''),
  (33,'','З','',15,NULL,2018,'2','2018-02-19 20:55:01.915652','2018-02-19','2018-02-22','2018-02-19',19,0,'авцук','Листа надіслав Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1  19.02.2018, дата контролю 22.02.2018',NULL,1,'a:2:{i:0;s:2:\"30\";i:1;s:2:\"12\";}','people','archived','','m'),
  (34,'','І','',16,NULL,2018,'no','2018-02-19 21:10:33.513936','2018-02-19','2018-02-22','2018-02-19',15,0,'апуапук','Листа надіслав Іванов Петро Вікторович | Перекопська, буд.193 корп.2, кв.2  19.02.2018, дата контролю 22.02.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (35,'','І','',16,NULL,2018,'no','2018-02-19 21:11:41.805842','2018-02-19','2018-02-22','2018-02-19',15,0,'апуапук','Листа надіслав Іванов Петро Вікторович | Перекопська, буд.193 корп.2, кв.2  19.02.2018, дата контролю 22.02.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (36,'','І','',16,NULL,2018,'no','2018-02-19 21:12:42.823332','2018-02-19','2018-02-22','2018-02-19',15,0,'апуапук','Листа надіслав Іванов Петро Вікторович | Перекопська, буд.193 корп.2, кв.2  19.02.2018, дата контролю 22.02.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (37,'','І','',17,NULL,2018,'1','2018-02-19 21:29:03.678434','2018-02-19','2018-02-28','2018-02-19',2,0,'ваів','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  19.02.2018, дата контролю 28.02.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','ugl',''),
  (38,'','А','',18,NULL,2018,'no','2018-03-03 14:32:04.528341','2018-03-03','2018-03-24','2018-03-03',23,0,'ыва ывваыв','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  03.03.2018, дата контролю 24.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','ugl',''),
  (39,'','С','',19,NULL,2018,'no','2018-03-03 14:34:24.142327','2018-03-03','2018-03-31','2018-03-03',16,0,'ауп ыкупыук ','Листа надіслав Свириденко Олександр Петрович | Квіткова, буд.2  03.03.2018, дата контролю 31.03.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','ugl',''),
  (40,'','С','',20,NULL,2018,'no','2018-03-03 14:50:04.940137','2018-03-03','2018-03-24','2018-03-03',6,0,'ва ывапм авы','Листа надіслав Сіліщенко Оксана Петрівна | Петренко, буд.12, кв.1  03.03.2018, дата контролю 24.03.2018',NULL,1,'a:1:{i:0;s:2:\"10\";}','people','created','ugl',''),
  (41,'','З','',21,NULL,2018,'1','2018-03-03 15:17:47.592235','2018-03-03','2018-03-24','2018-03-02',19,0,'ываыв','Листа надіслав Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1  02.03.2018, дата контролю 24.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (42,'','І','',22,NULL,2018,'no','2018-03-03 15:36:47.331425','2018-03-03','2018-03-31','2018-03-03',2,0,'ваывк','Листа надіслав Іванова Ганна Миколаївна | 19 Східна, буд.15  03.03.2018, дата контролю 31.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (43,'','А','',23,NULL,2018,'no','2018-03-03 15:44:01.512259','2018-03-03','2018-03-10','2018-03-03',23,0,'вамыв','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  03.03.2018, дата контролю 10.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (44,'','А','',23,NULL,2018,'no','2018-03-03 15:47:29.197137','2018-03-03','2018-03-10','2018-03-03',23,0,'вамыв','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  03.03.2018, дата контролю 10.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (45,'','З','',23,NULL,2018,'no','2018-03-03 15:49:31.604139','2018-03-03','2018-03-10','2018-03-03',19,0,'вамыв','Листа надіслав Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1  03.03.2018, дата контролю 10.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','',''),
  (46,'','З','',24,NULL,2018,'no','2018-03-04 19:34:16.922098','2018-03-04','2018-03-24','2018-03-04',19,0,'каки  в','Листа надіслав Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1  04.03.2018, дата контролю 24.03.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','',''),
  (47,'','Г','',25,NULL,2018,'no','2018-03-04 19:42:51.649539','2018-03-04','2018-03-17','2018-03-04',22,0,'огр тпр','Листа надіслав Галишев Микита Петрович | площа Свободи, буд.1, кв.23  04.03.2018, дата контролю 17.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','people','created','ugl',''),
  (48,'','А','',26,NULL,2018,'no','2018-03-04 19:46:07.270728','2018-03-04','2018-03-07','2018-03-05',23,0,'апрапи ап','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  05.03.2018, дата контролю 07.03.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','',''),
  (49,'','А','',26,NULL,2018,'no','2018-03-04 19:48:24.425573','2018-03-04','2018-03-07','2018-03-05',23,0,'апрапи ап','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  05.03.2018, дата контролю 07.03.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','',''),
  (50,'','А','',26,NULL,2018,'no','2018-03-04 19:48:41.758564','2018-03-04','2018-03-07','2018-03-05',23,0,'апрапи ап','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  05.03.2018, дата контролю 07.03.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','',''),
  (51,'','А','',27,NULL,2018,'no','2018-03-04 19:51:04.252715','2018-03-04','2018-03-13','2018-03-06',23,0,'ншоагн роаген','Листа надіслав Ачелдиэв Микола Петрович | пров. Петренка, буд.22  06.03.2018, дата контролю 13.03.2018',NULL,1,'a:2:{i:0;s:1:\"9\";i:1;s:2:\"12\";}','people','hasresolution','','p'),
  (52,'','С','',28,NULL,2018,'no','2018-03-04 19:54:01.257839','2018-03-04','2018-03-15','2018-03-06',6,0,'пр векрикна','Листа надіслав Сіліщенко Оксана Петрівна | Петренко, буд.12, кв.1  06.03.2018, дата контролю 15.03.2018',NULL,1,'a:1:{i:0;s:2:\"31\";}','people','created','',''),
  (53,'1','','21',0,'133',2018,'no','2018-03-08 20:29:44.015776','2018-03-08','2018-03-29','2018-03-01',0,0,'','',NULL,1,'1','org','created','',''),
  (54,'','ПР/З','З',5,NULL,2018,'no','2018-03-10 09:50:19.792833','2018-03-10','2018-03-24','2018-03-10',19,0,'ап6еапнв ','Відвідвувач Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1 прийнятий ЗАДНІПРЯНИЙ Андрій Вікторович 10.03.2018, дата контролю 24.03.2018',NULL,1,'a:1:{i:0;s:2:\"30\";}','visitors','created','',''),
  (55,'','ПР/Ф','Р',29,NULL,2018,'no','2018-03-10 10:02:50.812920','2018-03-10','2018-03-24','2018-03-09',3,0,'укапму','Відвідвувач Філатов Ігор Іванович | Сенявіна, буд.2, кв.34 прийнятий РУБАНЕЦЬ Віталій Васильович  09.03.2018, дата контролю 24.03.2018',NULL,1,'a:4:{i:0;s:2:\"31\";i:1;s:2:\"12\";i:2;s:2:\"12\";i:3;s:2:\"20\";}','visitors','hasresolution','','m'),
  (56,'','З','',30,NULL,2018,'no','2018-03-12 22:13:47.707953','2018-03-12','2018-03-27','2018-03-12',19,0,'аукаук','Листа надіслав Зелінський Іван Костянтинович | Фурманова, буд.2, кв.1  12.03.2018, дата контролю 27.03.2018',NULL,1,'a:2:{i:0;s:2:\"10\";i:1;s:2:\"10\";}','people','hasresolution','ugl','p'),
  (57,'','2','1',1,NULL,2018,'no','2018-03-26 20:04:45.575431','2018-03-26','2018-03-29','2018-03-01',0,0,'ut6ukygbhj dfds f','',NULL,1,'a:1:{i:0;s:2:\"18\";}','state','hasresolution','',''),
  (58,'','2','1',2,NULL,2018,'no','2018-03-26 20:07:59.119501','2018-03-26','2018-03-29','2018-03-01',0,0,'ewfwfrw','wefwe',NULL,1,'a:1:{i:0;s:2:\"30\";}','state','created','',''),
  (59,'','2','1',3,NULL,2018,'no','2018-03-26 21:16:36.374995','2018-03-26','2018-03-22','2018-03-01',0,0,'ролвкнкн','',NULL,1,'a:1:{i:0;s:2:\"31\";}','state','created','',''),
  (60,'','2','1',4,NULL,2018,'no','2018-03-26 21:24:21.676609','2018-03-26','2018-03-31','2018-03-14',0,0,'кпукпукмпу','',NULL,1,'a:1:{i:0;s:2:\"31\";}','state','created','',''),
  (61,'','2','2',5,NULL,2018,'no','2018-03-27 19:55:38.524386','2018-03-27','0000-00-00','2018-03-27',0,0,'ацвацуа','',NULL,1,'a:3:{i:0;s:2:\"31\";i:1;s:2:\"18\";i:2;s:2:\"23\";}','state','hasresolution','','');
COMMIT;

#
# Data for the `document_donestr` table  (LIMIT 0,500)
#

INSERT INTO `document_donestr` (`id`, `document_id`, `ts`, `keystr`, `value`) VALUES 
  (62,10,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:19:\"rgfrwe fgverwfvervg\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:76:\"05.02.2018 - Відмітка про виконання: rgfrwe fgverwfvervg\";}'),
  (63,30,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";a:1:{i:0;s:13:\"05.02.2018 - \";}s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:62:\"05.02.2018 - Відмітка про виконання: Array\";}'),
  (64,31,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:34:\"кеп укпукепаук ыеа\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:91:\"05.02.2018 - Відмітка про виконання: кеп укпукепаук ыеа\";}'),
  (65,31,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";a:2:{i:0;s:245:\"a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:34:\"кеп укпукепаук ыеа\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:91:\"05.02.2018 - Відмітка про виконання: кеп укпукепаук ыеа\";}\";i:1;s:28:\"05.02.2018 - укаыу ау\";}s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:62:\"05.02.2018 - Відмітка про виконання: Array\";}'),
  (66,12,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";a:1:{i:0;s:19:\"05.02.2018 - вва\";}s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:62:\"05.02.2018 - Відмітка про виконання: Array\";}'),
  (67,13,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:21:\"ывамвыа ваы\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:94:\"05.02.2018 - Відмітка про виконання: ывамвыа 22 33 4 dfdsf sdваы\";}'),
  (68,4,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:22:\"вывваамвмив\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:79:\"05.02.2018 - Відмітка про виконання: вывваамвмив\";}'),
  (69,16,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:33:\"акау првтр впрт еп\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:90:\"05.02.2018 - Відмітка про виконання: акау првтр впрт еп\";}'),
  (70,16,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:10:\"ваыыв\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:67:\"05.02.2018 - Відмітка про виконання: ваыыв\";}'),
  (71,8,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:18:\"fgsd dfagad gsfgad\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:75:\"07.02.2018 - Відмітка про виконання: fgsd dfagad gsfgad\";}'),
  (72,8,'2018-02-19 20:38:13.683984','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:16:\"ref rfga faerfga\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:73:\"07.02.2018 - Відмітка про виконання: ref rfga faerfga\";}'),
  (73,33,'2018-02-19 21:00:45.889326','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:21:\"кр вап а аів\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:34:\"19.02.2018 - кр вап а аів\";}'),
  (74,33,'2018-02-19 21:01:39.516393','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:14:\"ке ік ва\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:27:\"19.02.2018 - ке ік ва\";}'),
  (75,51,'2018-03-04 19:51:30.767231','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:17:\"р веривкы\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:30:\"04.03.2018 - р веривкы\";}'),
  (76,55,'2018-03-10 10:09:18.742114','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:0:\"\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:20:\"10.03.2018 -а е  \";}'),
  (77,56,'2018-03-12 22:14:24.598063','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:18:\"мипыкепыу\";s:4:\"date\";s:10:\"12.03.2018\";s:7:\"fullstr\";s:18:\"мипыкепыу\";}'),
  (78,56,'2018-03-12 22:14:34.214613','donestr','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:24:\"цукнцеп45ецун\";s:4:\"date\";s:10:\"12.03.2018\";s:7:\"fullstr\";s:24:\"цукнцеп45ецун\";}');
COMMIT;

#
# Data for the `document_extnum` table  (LIMIT 0,500)
#

INSERT INTO `document_extnum` (`id`, `document_id`, `ts`, `keystr`, `value`) VALUES 
  (62,30,'2018-02-19 20:39:31.420431','ОДА','a:4:{s:6:\"number\";s:4:\"1212\";s:3:\"org\";s:6:\"ода\";s:4:\"date\";s:10:\"01.02.2018\";s:7:\"fullstr\";s:60:\"01.02.2018 надійшов з ода під номером \";}'),
  (63,30,'2018-02-19 20:39:31.420431','МВК','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:6:\"мвк\";s:4:\"date\";s:10:\"01.02.2018\";s:7:\"fullstr\";s:60:\"01.02.2018 надійшов з мвк під номером \";}'),
  (64,31,'2018-02-19 20:39:31.420431','ОДА','a:4:{s:6:\"number\";s:4:\"1212\";s:3:\"org\";s:6:\"ода\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:64:\"05.02.2018 надійшов з ода під номером 1212\";}'),
  (67,34,'2018-02-19 21:10:33.529937','ОДА','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:6:\"ода\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:63:\"19.02.2018 надійшов з ода під номером 123\";}'),
  (68,35,'2018-02-19 21:11:41.809842','ОДА','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:6:\"ода\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:63:\"19.02.2018 надійшов з ода під номером 123\";}'),
  (69,36,'2018-02-19 21:12:42.828333','ОДА','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:6:\"ода\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:63:\"19.02.2018 надійшов з ода під номером 123\";}'),
  (70,37,'2018-02-19 21:29:03.682434','МВК','a:4:{s:6:\"number\";s:4:\"1234\";s:3:\"org\";s:6:\"мвк\";s:4:\"date\";s:10:\"17.02.2018\";s:7:\"fullstr\";s:64:\"17.02.2018 надійшов з мвк під номером 1234\";}'),
  (71,38,'2018-03-03 14:32:04.552343','МВК','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:6:\"МВК\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:63:\"03.03.2018 надійшов з МВК під номером 123\";}'),
  (72,39,'2018-03-03 14:34:24.151327','МВК','a:4:{s:6:\"number\";s:3:\"345\";s:3:\"org\";s:6:\"МВК\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:63:\"03.03.2018 надійшов з МВК під номером 345\";}'),
  (73,40,'2018-03-03 14:50:04.954138','ОДА','a:4:{s:6:\"number\";s:3:\"111\";s:3:\"org\";s:6:\"ОДА\";s:4:\"date\";s:10:\"02.03.2018\";s:7:\"fullstr\";s:63:\"02.03.2018 надійшов з ОДА під номером 111\";}'),
  (77,46,'2018-03-04 19:34:16.950100','Облрада','a:4:{s:6:\"number\";s:3:\"333\";s:3:\"org\";s:23:\"Обласна рада\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:80:\"03.03.2018 надійшов з Обласна рада під номером 333\";}'),
  (78,47,'2018-03-04 19:42:51.674541','Облрада','a:4:{s:6:\"number\";s:4:\"1212\";s:3:\"org\";s:23:\"Обласна рада\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:81:\"03.03.2018 надійшов з Обласна рада під номером 1212\";}'),
  (79,50,'2018-03-04 19:48:41.763565','Облрада','a:4:{s:6:\"number\";s:5:\"65756\";s:3:\"org\";s:14:\"Облрада\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:82:\"04.03.2018 надійшов з Обласна рада під номером 65756\";}'),
  (80,51,'2018-03-04 19:51:04.259715','МВК','a:4:{s:6:\"number\";s:5:\"65756\";s:3:\"org\";s:6:\"МВК\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:65:\"04.03.2018 надійшов з МВК під номером 65756\";}'),
  (81,52,'2018-03-04 19:54:01.261839','Облрада','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:14:\"Облрада\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:80:\"04.03.2018 надійшов з Обласна рада під номером 123\";}'),
  (82,56,'2018-03-12 22:13:47.753955','МВК','a:4:{s:6:\"number\";s:3:\"222\";s:3:\"org\";s:6:\"МВК\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:63:\"10.03.2018 надійшов з МВК під номером 222\";}'),
  (83,57,'2018-03-26 20:07:59.164504','externals','a:4:{s:6:\"number\";s:3:\"111\";s:3:\"org\";s:3:\"333\";s:4:\"date\";s:10:\"26.03.2018\";s:7:\"fullstr\";s:60:\"26.03.2018 надійшов з 333 під номером 111\";}'),
  (84,59,'2018-03-26 21:16:36.386996','externals','a:4:{s:6:\"number\";s:4:\"5444\";s:3:\"org\";s:8:\"апра\";s:4:\"date\";s:10:\"01.03.2018\";s:7:\"fullstr\";s:66:\"01.03.2018 надійшов з апра під номером 5444\";}'),
  (85,60,'2018-03-26 21:24:21.681609','externals','a:4:{s:6:\"number\";s:3:\"123\";s:3:\"org\";s:6:\"ода\";s:4:\"date\";s:10:\"14.03.2018\";s:7:\"fullstr\";s:63:\"14.03.2018 надійшов з ода під номером 123\";}'),
  (86,61,'2018-03-27 19:55:38.545387','МВК','a:4:{s:6:\"number\";s:5:\"65756\";s:3:\"org\";s:6:\"МВК\";s:4:\"date\";s:10:\"27.03.2018\";s:7:\"fullstr\";s:65:\"27.03.2018 надійшов з МВК під номером 65756\";}');
COMMIT;

#
# Data for the `document_movings` table  (LIMIT 0,500)
#

INSERT INTO `document_movings` (`id`, `document_id`, `ts`, `keystr`, `value`) VALUES 
  (69,9,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:1:\"9\";s:4:\"text\";s:52:\"Передача документу. dsbvsb sfv sdcs\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:165:\"05.02.2018 - Передача документу. dsbvsb sfv sdcs Передано з Секретар 1 на КАЛЮЖНИЙ Дмитро Анатолійович \";}'),
  (70,9,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"11\";s:6:\"userto\";s:2:\"14\";s:4:\"text\";s:70:\"Передача документу. yjtyujheyrh rtyhertberty hsdrtyhr\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:198:\"05.02.2018 - Передача документу. yjtyujheyrh rtyhertberty hsdrtyhr Передано з СІРОШТАН Нонна Вікторівна на Ситнік Юлія Євгенівна\";}'),
  (71,9,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"18\";s:6:\"userto\";s:2:\"21\";s:4:\"text\";s:3:\"ddd\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:219:\"05.02.2018 - Передача документу з КОБИЛЯНСЬКА Світлана Григорівна  на КОНОВЕНКО Марія Олександрівна Передано з примыткою: ddd\";}'),
  (72,9,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"21\";s:6:\"userto\";s:2:\"27\";s:4:\"text\";s:15:\"ddd ujryjyy fyi\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:210:\"05.02.2018 - Передача документу з КОНОВЕНКО Марія Олександрівна на Дюкар Любов Федорівна Передано з приміткою: ddd ujryjyy fyi\";}'),
  (73,9,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"13\";s:4:\"text\";s:12:\"fgjhdy jdytj\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:162:\"05.02.2018 - Резолюція до виконання на БУРДІНа Галина Вікторівна Передано з приміткою: fgjhdy jdytj\";}'),
  (74,9,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"19\";s:4:\"text\";s:8:\"333 5555\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:160:\"05.02.2018 - Резолюція до виконання на ГОЛЕНКО Олександр Юрійович Передано з приміткою: 333 5555\";}'),
  (75,29,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:241:\"05.02.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (76,29,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"13\";s:4:\"text\";s:17:\"dfsrdf sfgrrwefwe\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:167:\"05.02.2018 - Резолюція до виконання на БУРДІНа Галина Вікторівна Передано з приміткою: dfsrdf sfgrrwefwe\";}'),
  (77,29,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"20\";s:4:\"text\";s:28:\"dfsrdf sfgrrwefwe ergfergver\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:187:\"05.02.2018 - Резолюція до виконання на МАЙДАНЮК  Вячеслав Олексійович Передано з приміткою: dfsrdf sfgrrwefwe ergfergver\";}'),
  (78,29,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"14\";s:4:\"text\";s:13:\"dfsrdf s dsf \";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:155:\"05.02.2018 - Резолюція до виконання на Ситнік Юлія Євгенівна Передано з приміткою: dfsrdf s dsf \";}'),
  (79,29,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"13\";s:6:\"userto\";s:2:\"28\";s:4:\"text\";s:19:\"fwe fwerfwe fwefwdf\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:220:\"05.02.2018 - Передача документу з БУРДІНа Галина Вікторівна на УСТИНЕНКО Олег Володимирович Передано з приміткою: fwe fwerfwe fwefwdf\";}'),
  (80,10,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"12\";s:4:\"text\";s:10:\"rfw fwefwe\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:163:\"05.02.2018 - Резолюція до виконання на НЕДІЛЬКО Наталя Вікторівна  Передано з приміткою: rfw fwefwe\";}'),
  (81,10,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"12\";s:6:\"userto\";s:2:\"20\";s:4:\"text\";s:9:\"efdwe fwe\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:216:\"05.02.2018 - Передача документу з НЕДІЛЬКО Наталя Вікторівна  на МАЙДАНЮК  Вячеслав Олексійович Передано з приміткою: efdwe fwe\";}'),
  (82,30,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:244:\"05.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (83,31,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:244:\"05.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (84,31,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"15\";s:4:\"text\";s:6:\"кпы\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:153:\"05.02.2018 - Резолюція до виконання на ЗУБ Ірина Володимирівна  Передано з приміткою: кпы\";}'),
  (85,31,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"15\";s:6:\"userto\";s:2:\"18\";s:4:\"text\";s:14:\"ваыавыв\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:219:\"05.02.2018 - Передача документу з ЗУБ Ірина Володимирівна  на КОБИЛЯНСЬКА Світлана Григорівна  Передано з приміткою: ваыавыв\";}'),
  (86,4,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"9\";s:6:\"userto\";s:2:\"13\";s:4:\"text\";s:12:\"фыввфы\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:214:\"05.02.2018 - Передача документу з КАЛЮЖНИЙ Дмитро Анатолійович  на БУРДІНа Галина Вікторівна Передано з приміткою: фыввфы\";}'),
  (87,16,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"16\";s:4:\"text\";s:14:\"выапмцк\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:170:\"05.02.2018 - Резолюція до виконання на НІКОЛАЄНКО Лариса Вікторівна Передано з приміткою: выапмцк\";}'),
  (88,32,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:241:\"07.02.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (89,14,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"16\";s:4:\"text\";s:31:\"gnjh jkg,h liut65e4w ersge4fers\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:175:\"07.02.2018 - Резолюція до виконання на НІКОЛАЄНКО Лариса В ікторівна Передано з примі 444 444 444 44444444 e4fers\";}'),
  (90,14,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"16\";s:4:\"text\";s:31:\"gnjh jkg,h liut65e4w ersge4fers\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:187:\"07.02.2018 - Резолюція до виконання на НІКОЛАЄНКО Лариса Вікторівна Передано з приміткою: gnjh jkg,h liut65e4w ersge4fers\";}'),
  (91,8,'2018-02-19 20:40:23.762424','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"16\";s:4:\"text\";s:27:\"fgstr ysrthbsrgh srhbsrgbsd\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:183:\"07.02.2018 - Резолюція до виконання на НІКОЛАЄНКО Лариса Вікторівна Передано з приміткою: fgstr ysrthbsrgh srhbsrgbsd\";}'),
  (92,8,'2018-02-19 20:40:23.762424','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:2:\"16\";s:6:\"userto\";s:2:\"20\";s:4:\"text\";s:12:\"fdg sfgsfdgb\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:222:\"07.02.2018 - Передача документу з НІКОЛАЄНКО Лариса Вікторівна на МАЙДАНЮК  Вячеслав Олексійович Передано з приміткою: fdg sfgsfdgb\";}'),
  (93,33,'2018-02-19 20:55:01.925652','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:244:\"19.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (94,33,'2018-02-19 21:00:38.166884','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"12\";s:4:\"text\";s:26:\"рвеун кнкп кпі\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:179:\"19.02.2018 - Резолюція до виконання на НЕДІЛЬКО Наталя Вікторівна  Передано з приміткою: рвеун кнкп кпі\";}'),
  (95,34,'2018-02-19 21:10:33.525937','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:244:\"19.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (96,35,'2018-02-19 21:11:41.808842','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:244:\"19.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (97,36,'2018-02-19 21:12:42.826332','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:244:\"19.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (98,37,'2018-02-19 21:29:03.681434','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:244:\"19.02.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (99,38,'2018-03-03 14:32:04.543342','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:244:\"03.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (100,39,'2018-03-03 14:34:24.150327','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:241:\"03.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (101,40,'2018-03-03 14:50:04.953138','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"10\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:235:\"03.03.2018 - Передача документу з Секретар 1 на ДОБУШ Ярослав Тарасович    Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (102,41,'2018-03-03 15:17:47.608236','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:244:\"03.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (103,42,'2018-03-03 15:36:47.339425','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:244:\"03.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (104,43,'2018-03-03 15:44:01.517259','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:244:\"03.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (105,44,'2018-03-03 15:47:29.200138','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:244:\"03.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (106,45,'2018-03-03 15:49:31.608139','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"03.03.2018\";s:7:\"fullstr\";s:244:\"03.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (107,46,'2018-03-04 19:34:16.937099','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:241:\"04.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (108,47,'2018-03-04 19:42:51.668540','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:244:\"04.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (109,48,'2018-03-04 19:46:07.290729','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:241:\"04.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (110,49,'2018-03-04 19:48:24.430573','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:241:\"04.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (111,50,'2018-03-04 19:48:41.762565','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:241:\"04.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (112,51,'2018-03-04 19:51:04.259715','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:1:\"9\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:243:\"04.03.2018 - Передача документу з Секретар 1 на КАЛЮЖНИЙ Дмитро Анатолійович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (113,51,'2018-03-04 19:51:17.904495','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"12\";s:4:\"text\";s:41:\"итсопр оренвортенторе\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:194:\"04.03.2018 - Резолюція до виконання на НЕДІЛЬКО Наталя Вікторівна  Передано з приміткою: итсопр оренвортенторе\";}'),
  (114,52,'2018-03-04 19:54:01.260839','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"04.03.2018\";s:7:\"fullstr\";s:241:\"04.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (115,54,'2018-03-10 09:50:19.801834','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:244:\"10.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (116,55,'2018-03-10 10:02:50.822920','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:241:\"10.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (117,55,'2018-03-10 10:03:34.123273','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"12\";s:4:\"text\";s:0:\"\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:153:\"10.03.2018 - Резолюція до виконання на НЕДІЛЬКО Наталя Вікторівна  Передано з приміткою: \";}'),
  (118,55,'2018-03-10 10:03:34.340285','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"12\";s:4:\"text\";s:0:\"\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:153:\"10.03.2018 - Резолюція до виконання на НЕДІЛЬКО Наталя Вікторівна  Передано з приміткою: \";}'),
  (119,55,'2018-03-10 10:03:58.554173','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"20\";s:4:\"text\";s:0:\"\";s:4:\"date\";s:10:\"10.03.2018\";s:7:\"fullstr\";s:159:\"10.03.2018 - Резолюція до виконання на МАЙДАНЮК  Вячеслав Олексійович Передано з приміткою: \";}'),
  (120,56,'2018-03-12 22:13:47.720954','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"10\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"12.03.2018\";s:7:\"fullstr\";s:235:\"12.03.2018 - Передача документу з Секретар 1 на ДОБУШ Ярослав Тарасович    Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (121,56,'2018-03-12 22:13:57.851533','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"10\";s:4:\"text\";s:12:\"уцацуа\";s:4:\"date\";s:10:\"12.03.2018\";s:7:\"fullstr\";s:148:\"Резолюція до виконання на ДОБУШ Ярослав Тарасович    Передано з приміткою: уцацуа\";}'),
  (122,58,'2018-03-26 20:07:59.122501','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"30\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"26.03.2018\";s:7:\"fullstr\";s:244:\"26.03.2018 - Передача документу з Секретар 1 на ЗАДНІПРЯНИЙ Андрій Вікторович Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (123,57,'2018-03-26 20:21:34.393132','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"18\";s:4:\"text\";s:7:\"ghkcgjg\";s:4:\"date\";s:10:\"26.03.2018\";s:7:\"fullstr\";s:158:\"Резолюція до виконання на К ОБИЛЯНСЬКА Світлана Григорівна  Передано з приміткою: ghkcgjg\";}'),
  (124,59,'2018-03-26 21:16:36.382995','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"26.03.2018\";s:7:\"fullstr\";s:241:\"26.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (125,60,'2018-03-26 21:24:21.680609','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"26.03.2018\";s:7:\"fullstr\";s:241:\"26.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (126,61,'2018-03-27 19:55:38.537387','moving','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:6:\"userto\";s:2:\"31\";s:4:\"text\";s:71:\"Створено картку, передано на резолюцію\";s:4:\"date\";s:10:\"27.03.2018\";s:7:\"fullstr\";s:241:\"27.03.2018 - Передача документу з Секретар 1 на РУБАНЕЦЬ Віталій Васильович  Передано з приміткою: Створено картку, передано на резолюцію\";}'),
  (127,61,'2018-03-27 19:56:07.102021','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"18\";s:4:\"text\";s:18:\"орортмтмм\";s:4:\"date\";s:10:\"27.03.2018\";s:7:\"fullstr\";s:168:\"Резолюція до виконання на КОБИЛЯНСЬКА Світлана Григорівна  Передано з приміткою: орортмтмм\";}'),
  (128,61,'2018-03-27 19:56:23.517960','resolution','a:6:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";N;s:6:\"userto\";s:2:\"23\";s:4:\"text\";s:27:\"ттщ нщшж н8щшбг\";s:4:\"date\";s:10:\"27.03.2018\";s:7:\"fullstr\";s:174:\"Резолюція до виконання на Ткаченко Людмила  В''ячеславівна Передано з приміткою: ттщ нщшж н8щшбг\";}');
COMMIT;

#
# Data for the `document_notes` table  (LIMIT 0,500)
#

INSERT INTO `document_notes` (`id`, `document_id`, `ts`, `keystr`, `value`) VALUES 
  (62,10,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";a:1:{i:0;s:16:\"05.02.2018 - qqq\";}s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:96:\"05.02.2018 - Внутрішня відмітка:  Передано з приміткою: Array\";}'),
  (63,10,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";a:1:{i:0;s:16:\"05.02.2018 - qqq\";}s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:55:\"05.02.2018 - Внутрішня відмітка: Array\";}'),
  (64,10,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:14:\"fbgf dhg rthyh\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:64:\"05.02.2018 - Внутрішня відмітка: fbgf dhg rthyh\";}'),
  (65,10,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:19:\"rgfrwe fgverwfvervg\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:49:\"05.02.2018 - Відмітка rgfrwe fgverwfvervg\";}'),
  (66,31,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:25:\"амачп аывпвыа\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:75:\"05.02.2018 - Внутрішня відмітка: амачп аывпвыа\";}'),
  (67,4,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:2:\"44\";s:4:\"date\";s:10:\"05.02.2018\";s:7:\"fullstr\";s:52:\"05.02.2018 - Внутрішня відмітка: 44\";}'),
  (68,13,'2018-02-19 20:40:41.601445','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:12:\"ff f g hgjgg\";s:4:\"date\";s:10:\"07.02.2018\";s:7:\"fullstr\";s:102:\"07.02.2018 - Внутрішня відмітка: ff f g hgjg&nbsp; df dfds&nbsp;&nbsp;&nbsp; ddd dd g\";}'),
  (69,32,'2018-02-19 20:44:09.127314','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:10:\"re vgwrt g\";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:23:\"19.02.2018 - re vgwrt g\";}'),
  (70,33,'2018-02-19 21:00:52.918728','notes','a:5:{s:6:\"userid\";s:1:\"1\";s:8:\"userfrom\";s:1:\"1\";s:4:\"text\";s:17:\"ап в ваів \";s:4:\"date\";s:10:\"19.02.2018\";s:7:\"fullstr\";s:30:\"19.02.2018 - ап в ваів \";}');
COMMIT;

#
# Data for the `document_people` table  (LIMIT 0,500)
#

INSERT INTO `document_people` (`id`, `document_id`, `people_id`) VALUES 
  (24,5,2),
  (25,6,1),
  (26,7,1),
  (27,9,3),
  (28,10,3),
  (29,11,3),
  (30,12,3),
  (31,13,3),
  (32,14,3),
  (33,15,3),
  (34,17,2),
  (35,18,2),
  (36,19,3),
  (37,20,3),
  (38,21,3),
  (39,23,1),
  (40,24,2),
  (41,25,2),
  (42,27,19),
  (43,28,2),
  (44,29,3),
  (45,30,3),
  (46,31,6),
  (47,32,16),
  (48,33,19),
  (49,34,15),
  (50,35,15),
  (51,36,15),
  (52,37,2),
  (53,38,23),
  (54,39,16),
  (55,40,6),
  (56,41,19),
  (57,42,2),
  (58,43,23),
  (59,44,23),
  (60,45,19),
  (61,46,19),
  (62,47,22),
  (63,48,23),
  (64,49,23),
  (65,50,23),
  (66,51,23),
  (67,52,6),
  (68,56,19);
COMMIT;

#
# Data for the `movings` table  (LIMIT 0,500)
#

INSERT INTO `movings` (`id`, `document`, `tmstamp`, `prevuser`, `nextuser`, `movtext`) VALUES 
  (1,31,'2017-07-30 16:19:02.369980',1,6,'Створено картку'),
  (3,31,'2017-07-30 20:38:50.603576',5,5,'Резолюцыя голови'),
  (4,32,'2017-07-31 12:25:46.160036',1,6,'Створено картку'),
  (5,33,'2017-07-31 12:27:57.925573',1,6,'Створено картку'),
  (6,33,'2017-07-31 12:28:33.491607',6,4,'Резолюція голови'),
  (7,34,'2017-07-31 12:29:26.615645',1,6,'Створено картку'),
  (8,35,'2017-07-31 12:32:57.387701',1,6,'Створено картку'),
  (9,35,'2017-07-31 12:33:13.919646',6,4,'Резолюція голови'),
  (10,36,'2017-07-31 12:41:46.500964',1,6,'Створено картку'),
  (11,37,'2017-07-31 12:42:16.377673',1,6,'Створено картку'),
  (12,37,'2017-07-31 12:43:10.943794',6,4,'Резолюція голови'),
  (13,38,'2017-08-01 21:07:34.572073',1,6,'Створено картку'),
  (14,38,'2017-08-01 21:07:50.950010',6,4,'Резолюція голови'),
  (15,39,'2017-08-06 11:59:39.694650',1,4,'Створено картку'),
  (16,40,'2017-08-06 12:06:08.836908',1,3,'Створено картку'),
  (17,41,'2017-08-06 12:06:54.515521',1,3,'Створено картку'),
  (18,42,'2017-08-06 12:09:17.754713',1,3,'Створено картку'),
  (19,43,'2017-08-06 12:13:24.017799',1,3,'Створено картку'),
  (20,44,'2017-08-06 12:15:21.411513',1,4,'Створено картку'),
  (21,45,'2017-08-21 14:06:28.451951',1,4,'Створено картку'),
  (22,45,'2017-08-21 14:15:22.376489',4,4,'Резолюція голови'),
  (23,46,'2017-08-21 21:20:49.919924',1,6,'Створено картку'),
  (24,47,'2017-08-21 21:28:19.158619',1,6,'Створено картку'),
  (25,48,'2017-08-21 22:06:02.635082',1,6,'Створено картку'),
  (26,49,'2017-08-21 22:14:42.985844',1,6,'Створено картку'),
  (27,50,'2017-08-21 22:25:12.431847',1,6,'Створено картку'),
  (28,51,'2017-08-21 22:28:15.618324',1,4,'Створено картку'),
  (29,52,'2017-08-31 01:21:48.864034',1,6,'Створено картку'),
  (30,53,'2017-08-31 01:51:24.721607',1,4,'Створено картку'),
  (31,54,'2017-09-04 23:44:13.376145',1,6,'Створено картку'),
  (32,55,'2017-09-05 00:00:45.713903',1,6,'Створено картку'),
  (33,56,'2017-09-16 14:36:56.894542',1,6,'Створено картку'),
  (34,57,'2017-09-16 14:39:09.589132',1,6,'Створено картку'),
  (35,58,'2017-09-16 14:40:31.827836',1,6,'Створено картку'),
  (36,59,'2017-09-16 14:41:25.898929',1,6,'Створено картку'),
  (37,60,'2017-09-16 14:42:38.458079',1,6,'Створено картку'),
  (38,61,'2017-09-16 14:44:47.571464',1,6,'Створено картку'),
  (39,62,'2017-09-16 14:45:39.344425',1,6,'Створено картку'),
  (40,63,'2017-09-16 14:48:11.334118',1,6,'Створено картку'),
  (41,64,'2017-09-16 14:48:53.826549',1,6,'Створено картку'),
  (42,65,'2017-09-16 14:49:20.125053',1,6,'Створено картку'),
  (43,66,'2017-09-16 14:53:13.421397',1,6,'Створено картку'),
  (44,67,'2017-09-16 14:53:58.148955',1,6,'Створено картку'),
  (45,68,'2017-09-16 14:55:14.642330',1,6,'Створено картку'),
  (46,69,'2017-09-16 14:56:20.205080',1,6,'Створено картку'),
  (47,70,'2017-09-16 15:03:26.625470',1,6,'Створено картку'),
  (48,71,'2017-09-16 15:04:44.645932',1,6,'Створено картку'),
  (49,72,'2017-10-30 19:55:13.559375',1,4,'Створено картку'),
  (50,73,'2017-10-30 20:16:59.858091',1,6,'Створено картку'),
  (51,1,'2017-12-10 20:29:36.877209',1,4,'Створено картку'),
  (52,1,'2017-12-12 18:55:49.415981',4,7,'Резолюція голови'),
  (53,1,'2017-12-12 19:22:44.013331',7,7,'Резолюція до виконання'),
  (54,2,'2017-12-12 19:47:48.128361',1,4,'Створено картку'),
  (55,2,'2017-12-12 19:48:55.115192',4,7,'Резолюція до виконання'),
  (56,2,'2017-12-12 20:47:47.451230',7,8,'Передача документу. глнпбглоб 4444444'),
  (57,2,'2017-12-12 20:49:02.391517',8,4,'Передача документу. арп орлор л дрд лрол111111\r\nплол'),
  (58,3,'2017-12-27 00:10:21.114504',1,30,'Створено картку'),
  (59,3,'2017-12-27 00:20:59.593023',30,11,'Резолюція до виконання'),
  (60,3,'2017-12-27 00:21:25.479504',11,25,'Передача документу. апіау аіп иімпмва ікпмкепмиік'),
  (61,4,'2017-12-27 01:08:02.999513',1,30,'Створено картку'),
  (62,4,'2017-12-27 01:09:32.430628',30,14,'Резолюція до виконання'),
  (63,5,'2018-01-15 20:00:26.968816',1,30,'Створено картку'),
  (64,6,'2018-01-15 20:09:01.506246',1,30,'Створено картку'),
  (65,7,'2018-01-15 20:28:17.842384',1,30,'Створено картку'),
  (66,8,'2018-01-16 00:17:57.556530',1,30,'Створено картку'),
  (67,9,'2018-01-16 00:46:36.030821',1,30,'Створено картку'),
  (68,10,'2018-01-16 01:06:37.160522',1,30,'Створено картку'),
  (69,11,'2018-01-16 01:12:41.088337',1,30,'Створено картку'),
  (70,12,'2018-01-16 01:13:44.462962',1,30,'Створено картку'),
  (71,13,'2018-01-16 01:14:59.284242',1,30,'Створено картку'),
  (72,14,'2018-01-16 01:17:50.094012',1,30,'Створено картку'),
  (73,15,'2018-01-16 01:33:22.096319',1,30,'Створено картку'),
  (74,16,'2018-01-27 22:34:16.146738',1,30,'Створено картку'),
  (75,17,'2018-01-27 22:50:38.240910',1,30,'Створено картку'),
  (76,18,'2018-01-27 23:06:40.622955',1,30,'Створено картку'),
  (77,19,'2018-01-27 23:08:26.308000',1,30,'Створено картку'),
  (78,20,'2018-01-27 23:09:22.127193',1,30,'Створено картку'),
  (79,21,'2018-01-27 23:09:53.098964',1,30,'Створено картку'),
  (80,22,'2018-01-27 23:25:09.698391',1,31,'Створено картку'),
  (81,22,'2018-01-27 23:25:37.833000',31,12,'Резолюція до виконання'),
  (82,22,'2018-01-28 21:57:35.158715',12,19,'Передача документу. '),
  (83,22,'2018-01-28 21:57:59.688118',19,23,'Передача документу. вруе уриу нериун'),
  (84,23,'2018-01-28 21:59:08.180036',1,30,'Створено картку'),
  (85,23,'2018-01-28 23:14:38.728168',30,9,'Резолюція до виконання'),
  (86,24,'2018-01-31 21:11:50.089466',1,31,'Створено картку'),
  (87,25,'2018-01-31 21:48:53.518639',1,9,'Створено картку, передано на резолюцію'),
  (88,25,'2018-01-31 22:01:03.017364',9,19,'Резолюція до виконання'),
  (89,25,'2018-01-31 22:07:15.780685',19,20,'Передача документу. dvvcvc'),
  (90,26,'2018-01-31 23:10:16.786946',1,31,'Створено картку, передано на резолюцію'),
  (91,27,'2018-01-31 23:11:12.187115',1,31,'Створено картку, передано на резолюцію'),
  (92,27,'2018-01-31 23:12:44.177376',31,13,'Резолюція до виконання'),
  (93,26,'2018-01-31 23:28:47.583480',31,15,'Резолюція до виконання'),
  (94,26,'2018-02-04 21:24:08.544036',15,16,'Резолюція до виконання'),
  (95,26,'2018-02-04 21:24:42.575983',16,18,'Передача документу. ghfgjrfjhrfg'),
  (96,28,'2018-02-05 18:22:24.617401',1,30,'Створено картку, передано на резолюцію');
COMMIT;

#
# Data for the `org_types` table  (LIMIT 0,500)
#

INSERT INTO `org_types` (`id`, `subcode`, `text`) VALUES 
  (1,1,'Верховна Рада України, Кабінет Міністрів України, депутати Верховної Ради України'),
  (2,2,'Обласна рада'),
  (3,3,'Обласна державна адміністрація'),
  (4,4,'Міськвиконком та його відділи'),
  (5,5,'Відділ райвиконкому, депутати райвиконкому'),
  (6,7,'Заводи, фабрики, комбінати'),
  (7,8,'Будівельні, проектні організації'),
  (8,9,'Транспортні організації, зв''язок'),
  (9,10,'Організації торгівлі та громадського харчування'),
  (10,11,'Комунальні та побутові підприємства'),
  (11,12,'Органи суда, прокуратури, поліції, військкомати, пожежники, юрконсультації, військові частини'),
  (12,13,'Вищі та середні навчальні заклади, школи, дитячі садки, дитячі установи'),
  (13,14,'Медичні заклади'),
  (14,15,'Профспілкові організації, спортоб''єднання, Червоний Хрест, військові частини'),
  (15,16,'Редакції, типографії, бібліотеки'),
  (16,17,'Кооперативи, малі, приватні та інші комерційні підприємнитства'),
  (17,18,'Різні міські та обласні організації'),
  (18,19,'Переписка з іншими областями'),
  (19,0,NULL);
COMMIT;

#
# Data for the `organizations` table  (LIMIT 0,500)
#

INSERT INTO `organizations` (`id`, `name`, `city`, `zipcode`, `street`, `building`, `housing`, `room`, `comment`) VALUES 
  (1,'ЗОШ 36','Херсон','73000','Перекопська','171',NULL,'',''),
  (2,'Херсонський політехнічний коледж','Херсон','73000','Небесної Сотні','23','-','','Политех'),
  (6,'зош36','','','','',NULL,'','');
COMMIT;

#
# Data for the `people` table  (LIMIT 0,500)
#

INSERT INTO `people` (`id`, `lastname`, `firstname`, `secondname`, `sex`, `passport`, `zipcode`, `city`, `street`, `building`, `housing`, `room`, `phones`, `comment`) VALUES 
  (0,'-','-','-',NULL,NULL,'73000','Херсон',NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE `people` SET `id`=0 WHERE `id`=LAST_INSERT_ID();
INSERT INTO `people` (`id`, `lastname`, `firstname`, `secondname`, `sex`, `passport`, `zipcode`, `city`, `street`, `building`, `housing`, `room`, `phones`, `comment`) VALUES 
  (1,'Петров','Петро','Петрович','f','МР123456','73000','Херсон','Карбишева','12',NULL,'32',NULL,NULL),
  (2,'Іванова','Ганна','Миколаївна','f','МР234567','73000','Херсон','19 Східна','15',NULL,NULL,NULL,NULL),
  (3,'Філатов','Ігор','Іванович','m','МР345678','73000','Херсон','Сенявіна','2',NULL,'34',NULL,NULL),
  (4,'Костенко','Вячеслав','Олегович','m','МР456789','73000','Херсон','Перекопська','187б',NULL,'12',NULL,NULL),
  (5,'Семенюк','Владислав','Михайлович','m','МР567890','73000','Херсон','200 років Херсона','45',NULL,'17',NULL,NULL),
  (6,'Сіліщенко','Оксана','Петрівна','f','МР098765','73000','Херсон','Петренко','12',NULL,'1',NULL,'іваіваів'),
  (8,'Сердюк','Віра','Дмитрівна','f','АС234567','','','17 Східна','12',NULL,'',NULL,''),
  (15,'Іванов','Петро','Вікторович','m',NULL,'73000','Херсон','Перекопська','193','2','2','519372,0996784546',NULL),
  (16,'Свириденко','Олександр','Петрович','m',NULL,'73000','Херсон','Квіткова','2','-','','1233434,0998877444',NULL),
  (17,'Степаненко','Алла','Вікторівна','f',NULL,'73000','Херсон','Перекопська','193','-','10','12234232,12121234121',NULL),
  (18,'Сидоренко','Вячеслав','Миколайович','m',NULL,'73000','Херсон','Сенявіна','45','2','3','223344,',NULL),
  (19,'Зелінський','Іван','Костянтинович','m',NULL,'73000','Херсон','Фурманова','2','-','1','113355,',NULL),
  (20,'Рабіновіч','Марк','Костянтинович','m',NULL,'73000','Херсон','Фурманова','2','1','4','113366,',NULL),
  (21,'Смирнов','Віктор','Вікторович','m',NULL,'73000','Херсон','Квітковий','12','-','','12346789,-',NULL),
  (22,'Галишев','Микита','Петрович','m',NULL,'73000','Херсон','площа Свободи','1','-','23','1234560,-',NULL),
  (23,'Ачелдиэв','Микола','Петрович','m',NULL,'73000','Херсон','пров. Петренка','22','-','','123455,2342342',NULL);
COMMIT;

#
# Data for the `people_meta` table  (LIMIT 0,500)
#

INSERT INTO `people_meta` (`id`, `people_id`, `keystr`, `value`) VALUES 
  (2,16,'social','a:3:{i:0;s:12:\"geroyukrainy\";i:1;s:13:\"geroysocpraci\";i:2;s:9:\"pensioner\";}'),
  (3,3,'social','a:3:{i:0;s:12:\"geroyukrainy\";i:1;s:13:\"geroysocpraci\";i:2;s:9:\"pensioner\";}'),
  (4,17,'social','a:3:{i:0;s:8:\"dityvijn\";i:1;s:9:\"invalidii\";i:2;s:13:\"materigeroini\";}'),
  (5,18,'social','a:0:{}'),
  (6,19,'social','a:1:{i:0;s:11:\"invalidvijn\";}'),
  (7,20,'social','a:1:{i:0;s:11:\"invalidvijn\";}'),
  (8,21,'social','a:1:{i:0;s:11:\"invalidvijn\";}'),
  (9,22,'social','a:1:{i:0;s:12:\"geroyukrainy\";}'),
  (10,23,'social','a:0:{}');
COMMIT;

#
# Data for the `social_status` table  (LIMIT 0,500)
#

INSERT INTO `social_status` (`id`, `keystr`, `value`) VALUES 
  (1,'uchvijn','учасники війни'),
  (2,'dityvijn','діти війни'),
  (3,'invalidvijn','інваліди війни'),
  (4,'uchbojovyh','учасники бойових дій'),
  (5,'veteranypraci','ветерани праці'),
  (6,'invalidi','інваліди І групи'),
  (7,'invalidii','інваліди ІІ групи'),
  (8,'invalidiii','інваліди ІІІ групи'),
  (9,'dityinvalidy','діти-інвалиди'),
  (10,'odynokimateri','одинокі матері'),
  (11,'materigeroini','матері-героїні'),
  (12,'bagatoditni','багатодітні см''ї'),
  (13,'poterpilividchaes','особи, що потерпіли від ЧАЕС'),
  (14,'likvidatorychaes','учасники ліквідації наслідків ЧАЕС'),
  (15,'geroyukrainy','Герої України'),
  (16,'geroysssr','Герої Раданського Союзу'),
  (17,'geroysocpraci','Герої Соціалістичної Праці'),
  (18,'dity','Діти'),
  (19,'inshi','інші категорії'),
  (20,'pensioner','пенсіонери'),
  (21,'derzhsluzhb','держслужбовці'),
  (22,'voensluzh','військовослужбовці'),
  (23,'pidpryemets','підприємці'),
  (24,'bezrobitni','безробітні'),
  (25,'uchni','учні та студенти'),
  (26,'religijni','служителі релігійних організацій');
COMMIT;

#
# Data for the `state_types` table  (LIMIT 0,500)
#

INSERT INTO `state_types` (`id`, `code`, `subcode`, `text`) VALUES 
  (1,2,1,'Закони України, постанови КМУ, постанови Верховної Ради та розпорядження Президента України'),
  (2,2,2,'Рішення обласної ради'),
  (3,2,3,'Розпорядження голови обласної ради'),
  (4,2,4,'Розпорядження голови обласної державної адміністрації'),
  (5,2,5,'Рішення міської ради'),
  (6,2,6,'Розпорядження міського голови'),
  (7,2,7,'Рішення виконкому міської ради');
COMMIT;

#
# Data for the `users` table  (LIMIT 0,500)
#

INSERT INTO `users` (`id`, `email`, `password`, `salt`, `roles`, `name`, `time_created`, `username`, `isEnabled`, `confirmationToken`, `timePasswordResetRequested`, `status`) VALUES 
  (1,'sec@srda.ks.ua','sVgLnfr2F9L9/5E0m7VbKBdRjeur7PUNK2kkfmHKqwc3YykoSn9qTBcDCQd+ckdCfwQdDwXyyUEnrc7pymNsLA==','qwv7hh67ihww8cwg4k0sk80o0o008kg','ROLE_CLERK,ROLE_USER','Секретар 1',1495133984,NULL,1,NULL,NULL,''),
  (2,'admin@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_CLERK,ROLE_USER,ROLE_ADMIN','Admin 1',1495134016,NULL,1,NULL,NULL,''),
  (9,'zastvykon@srda.ks.ua','TYkMvDEPZq8UVUthxFfmdPVzLyEeQ3lCV1qapQeyWbYCM/gnYdtANulJRQE59cjtvThciutW8R+v1Li/Kt6saA==','hlaboq6us3wo8g84ws4swwkk804s00k','ROLE_USER,ROLE_MANAGER','КАЛЮЖНИЙ Дмитро Анатолійович ',1495134047,NULL,1,NULL,NULL,'Заступник голови ради з питань діяльності виконавчих органів ради '),
  (10,'spravy@srda.ks.ua','A7CUVJ7cKhvBLt/7oPw4q7DJZmdb43I0ExmrhLHaZFhw1tXOuDQuEHHfK18bQlOvQepqXZk7kfVzU6wf4LGMqQ==','olvhhcxox9wcg44sowkc0ck4gk4kswg','ROLE_USER,ROLE_MANAGER','ДОБУШ Ярослав Тарасович   ',1501401972,NULL,1,NULL,NULL,'Керуючий справами виконкому'),
  (11,'zavokr@srda.ks.ua','6dU19F5fxUkHEMrhcZ084KcrRls5DdElSjEgl3Kits20tTFLZOCQtgsnP1krI80yyShdZKbekjZtRi2X55Y+Tw==','9psd0n66p7wo4k8088ssc8c0o8c0g0s','ROLE_USER,ROLE_DEPT','СІРОШТАН Нонна Вікторівна',1501402006,NULL,1,NULL,NULL,'Відділ організаційно-кадрової роботи Завідувач  '),
  (12,'specokr@srda.ks.ua','VYU/rZ9+std9xBmZSeUgxUbRbRXcoO8LQn7z34p3jIb1zmceVpR2FVGJUeg0XUGysxSdDJTJ5pGkh6fNUMFDwg==','f0do5pm34vks8w88k4c408oso0co880','ROLE_USER,ROLE_DEPT','НЕДІЛЬКО Наталя Вікторівна ',1501402035,NULL,1,NULL,NULL,'Відділ організаційно-кадрової роботи Головний спеціаліст'),
  (13,'zavzagal@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_USER,ROLE_DEPT','БУРДІНа Галина Вікторівна',1495134017,NULL,1,NULL,NULL,'Загальний відділ Завідувач  '),
  (14,'speczagal@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_USER,ROLE_DEPT','СИТНІК Юлія Євгенівна',1495134018,NULL,1,NULL,NULL,'Загальний відділ Головний спеціаліст'),
  (15,'zavbuh@srda.ks.ua','sVgLnfr2F9L9/5E0m7VbKBdRjeur7PUNK2kkfmHKqwc3YykoSn9qTBcDCQd+ckdCfwQdDwXyyUEnrc7pymNsLA==','qwv7hh67ihww8cwg4k0sk80o0o008kg','ROLE_USER,ROLE_DEPT','ЗУБ Ірина Володимирівна ',1498491882,NULL,1,NULL,NULL,'Відділ бухгалтерського обліку та звітності Завідувач'),
  (16,'zastbuh@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww5','ROLE_USER,ROLE_DEPT','НІКОЛАЄНКО Лариса Вікторівна',1498715742,NULL,1,NULL,NULL,'Відділ бухгалтерського обліку та звітності Заступник  завідувача відділу'),
  (17,'zavvybor@srda.ks.ua','TYkMvDEPZq8UVUthxFfmdPVzLyEeQ3lCV1qapQeyWbYCM/gnYdtANulJRQE59cjtvThciutW8R+v1Li/Kt6saA==','hlaboq6us3wo8g84ws4swwkk804s00k','ROLE_USER,ROLE_DEPT','Міусова Катерина Анатолівна',1498939602,NULL,1,NULL,NULL,'Відділ ведення Державного реєстру виборців Завідувач  '),
  (18,'zastvybor@srda.ks.ua','A7CUVJ7cKhvBLt/7oPw4q7DJZmdb43I0ExmrhLHaZFhw1tXOuDQuEHHfK18bQlOvQepqXZk7kfVzU6wf4LGMqQ==','olvhhcxox9wcg44sowkc0ck4gk4kswg','ROLE_USER,ROLE_DEPT','КОБИЛЯНСЬКА Світлана Григорівна ',1499163462,NULL,1,NULL,NULL,'Відділ ведення Державного реєстру виборців Головний спеціаліст'),
  (19,'zavcyv@srda.ks.ua','6dU19F5fxUkHEMrhcZ084KcrRls5DdElSjEgl3Kits20tTFLZOCQtgsnP1krI80yyShdZKbekjZtRi2X55Y+Tw==','9psd0n66p7wo4k8088ssc8c0o8c0g0s','ROLE_USER,ROLE_DEPT','ГОЛЕНКО Олександр Юрійович',1499387322,NULL,1,NULL,NULL,'Сектор з питань цивільного захисту Завідувач  '),
  (20,'speccyv@srda.ks.ua','VYU/rZ9+std9xBmZSeUgxUbRbRXcoO8LQn7z34p3jIb1zmceVpR2FVGJUeg0XUGysxSdDJTJ5pGkh6fNUMFDwg==','f0do5pm34vks8w88k4c408oso0co881','ROLE_USER,ROLE_DEPT','МАЙДАНЮК  Вячеслав Олексійович',1499611182,NULL,1,NULL,NULL,'Сектор з питань цивільного захисту Головний спеціаліст'),
  (21,'zavzhit@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_USER,ROLE_DEPT','КОНОВЕНКО Марія Олександрівна',1499835042,NULL,1,NULL,NULL,'Відділ з питань життєдіяльності  району Завідувач відділу'),
  (22,'zavinf@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_USER,ROLE_DEPT','Калган Людмила Олександрівна',1500058902,NULL,1,NULL,NULL,'Сектор з питань розвитку інфраструктури Завідувач відділу'),
  (23,'zastinf@srda.ks.ua','sVgLnfr2F9L9/5E0m7VbKBdRjeur7PUNK2kkfmHKqwc3YykoSn9qTBcDCQd+ckdCfwQdDwXyyUEnrc7pymNsLA==','qwv7hh67ihww8cwg4k0sk80o0o008kg','ROLE_USER,ROLE_DEPT','Ткаченко Людмила  В''ячеславівна',1500282762,NULL,1,NULL,NULL,'Сектор з питань житлового господарства Заступник завідувача відділу, завідувач сектора'),
  (24,'nachsoc@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww6','ROLE_USER,ROLE_DEPT','Безкоровайна Алла Петрівна',1500506622,NULL,1,NULL,NULL,'Управління праці та соціального захисту населення Начальник '),
  (25,'zastsoc@srda.ks.ua','TYkMvDEPZq8UVUthxFfmdPVzLyEeQ3lCV1qapQeyWbYCM/gnYdtANulJRQE59cjtvThciutW8R+v1Li/Kt6saA==','hlaboq6us3wo8g84ws4swwkk804s00k','ROLE_USER,ROLE_DEPT','РУДНИЦЬКА Галина Павлівна',1500730482,NULL,1,NULL,NULL,'Заступник начальника управління, начальник відділу з питань призначення державної допомоги'),
  (26,'nachchern@srda.ks.ua','A7CUVJ7cKhvBLt/7oPw4q7DJZmdb43I0ExmrhLHaZFhw1tXOuDQuEHHfK18bQlOvQepqXZk7kfVzU6wf4LGMqQ==','olvhhcxox9wcg44sowkc0ck4gk4kswg','ROLE_USER,ROLE_DEPT','Скороход Ольга Олександрівна',1500954342,NULL,1,NULL,NULL,'Відділ з питань праці та соціального захисту громадян, які постраждали внаслідок  Чорнобильської катастрофи Начальник '),
  (27,'nachdity@srda.ks.ua','6dU19F5fxUkHEMrhcZ084KcrRls5DdElSjEgl3Kits20tTFLZOCQtgsnP1krI80yyShdZKbekjZtRi2X55Y+Tw==','9psd0n66p7wo4k8088ssc8c0o8c0g0s','ROLE_USER,ROLE_DEPT','Дюкар Любов Федорівна',1501178202,NULL,1,NULL,NULL,'Служба у справах дітей Начальник служби '),
  (28,'zastdity@srda.ks.ua','VYU/rZ9+std9xBmZSeUgxUbRbRXcoO8LQn7z34p3jIb1zmceVpR2FVGJUeg0XUGysxSdDJTJ5pGkh6fNUMFDwg==','f0do5pm34vks8w88k4c408oso0co882','ROLE_USER,ROLE_DEPT','УСТИНЕНКО Олег Володимирович',1501402062,NULL,1,NULL,NULL,'Служба у справах дітей Заступник начальника служби'),
  (29,'dirteritor@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_USER,ROLE_DEPT','СЛАСТЄНІНА Тетяна Михайлівна                                        ',1501625922,NULL,1,NULL,NULL,'Територіальний центр соціального обслуговування Директор'),
  (30,'golova@srda.ks.ua','sVgLnfr2F9L9/5E0m7VbKBdRjeur7PUNK2kkfmHKqwc3YykoSn9qTBcDCQd+ckdCfwQdDwXyyUEnrc7pymNsLA==','qwv7hh67ihww8cwg4k0sk80o0o008kg','ROLE_USER,ROLE_BOSS','ЗАДНІПРЯНИЙ Андрій Вікторович',1495133984,NULL,1,NULL,NULL,'Голова районної у  місті  ради'),
  (31,'zast1@srda.ks.ua','1XoqvWFwuSrhuJ7A7aGzVqdj96YCkBWJlCEDkeDD5zFHgiZZtIaoQtYbObucHIvfSNMlK360O3Dw3XV3yFm5rg==','ir9qolvia1skccoss08wscg8k0ocww4','ROLE_USER,ROLE_MANAGER','РУБАНЕЦЬ Віталій Васильович ',1495134016,NULL,1,NULL,NULL,'Заступник голови районної у  місті  ради');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- mixmaster.character_type
CREATE TABLE IF NOT EXISTS `character_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.guild
CREATE TABLE IF NOT EXISTS `guild` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.guild_user
CREATE TABLE IF NOT EXISTS `guild_user` (
  `guild_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`guild_id`),
  KEY `guild_user_user_id_foreign` (`user_id`),
  CONSTRAINT `guild_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench
CREATE TABLE IF NOT EXISTS `hench` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type_id` int(11) NOT NULL,
  `minimum_level` int(11) NOT NULL,
  `maximum_level` int(11) NOT NULL,
  `atk_type` tinyint(4) NOT NULL DEFAULT '0',
  `is_dropable` bit(1) NOT NULL DEFAULT b'0',
  `is_mixable` bit(1) NOT NULL DEFAULT b'0',
  `is_questable` bit(1) NOT NULL DEFAULT b'0',
  `hp` int(11) DEFAULT NULL,
  `mp` int(11) DEFAULT NULL,
  `attack` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `accuracy` int(11) DEFAULT NULL,
  `chance` int(11) DEFAULT NULL,
  KEY `hench_type_id_foreign` (`type_id`),
  KEY `id` (`id`),
  CONSTRAINT `hench_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `hench_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench_gender
CREATE TABLE IF NOT EXISTS `hench_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench_loots
CREATE TABLE IF NOT EXISTS `hench_loots` (
  `hench_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  KEY `hench_loots_item_id_foreign` (`item_id`),
  KEY `hench_loots_zone_id_foreign` (`zone_id`),
  CONSTRAINT `hench_loots_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `hench_loots_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench_mix
CREATE TABLE IF NOT EXISTS `hench_mix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hench_result_id` int(11) NOT NULL,
  `hench_left_id` int(11) NOT NULL,
  `item_left_id` int(11) DEFAULT NULL,
  `hench_right_id` int(11) NOT NULL,
  `item_right_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hench_mix_item_right_id_foreign` (`item_right_id`),
  KEY `hench_mix_item_left_id_foreign` (`item_left_id`),
  KEY `hench_mix_hench_result_id_foreign` (`hench_result_id`),
  KEY `hench_mix_hench_left_id_foreign` (`hench_left_id`),
  KEY `hench_mix_hench_right_id_foreign` (`hench_right_id`),
  CONSTRAINT `hench_mix_hench_left_id_foreign` FOREIGN KEY (`hench_left_id`) REFERENCES `hench` (`id`),
  CONSTRAINT `hench_mix_hench_result_id_foreign` FOREIGN KEY (`hench_result_id`) REFERENCES `hench` (`id`),
  CONSTRAINT `hench_mix_hench_right_id_foreign` FOREIGN KEY (`hench_right_id`) REFERENCES `hench` (`id`),
  CONSTRAINT `hench_mix_item_left_id_foreign` FOREIGN KEY (`item_left_id`) REFERENCES `item` (`id`),
  CONSTRAINT `hench_mix_item_right_id_foreign` FOREIGN KEY (`item_right_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench_nature
CREATE TABLE IF NOT EXISTS `hench_nature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench_type
CREATE TABLE IF NOT EXISTS `hench_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `weakness_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hench_type_weakness_type_id_foreign` (`weakness_type_id`),
  CONSTRAINT `hench_type_weakness_type_id_foreign` FOREIGN KEY (`weakness_type_id`) REFERENCES `hench_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.hench_zone
CREATE TABLE IF NOT EXISTS `hench_zone` (
  `zone_id` int(11) NOT NULL,
  `hench_id` int(11) NOT NULL,
  KEY `hench_zone_zone_id_foreign` (`zone_id`),
  KEY `hench_zone_hench_id_foreign` (`hench_id`),
  CONSTRAINT `hench_zone_hench_id_foreign` FOREIGN KEY (`hench_id`) REFERENCES `hench` (`id`),
  CONSTRAINT `hench_zone_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.item
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin,
  `item_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_item_item_category` (`item_category_id`),
  CONSTRAINT `FK_item_item_category` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.item_category
CREATE TABLE IF NOT EXISTS `item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.user_item
CREATE TABLE IF NOT EXISTS `user_item` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_item_item_id_foreign` (`item_id`),
  CONSTRAINT `user_item_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `level` int(11) NOT NULL,
  `percent` double(8,2) NOT NULL,
  `character_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_character_type_id_foreign` (`character_type_id`),
  CONSTRAINT `user_character_type_id_foreign` FOREIGN KEY (`character_type_id`) REFERENCES `character_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.user_hench
CREATE TABLE IF NOT EXISTS `user_hench` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `hench_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `hench_nature_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_hench_hench_nature_id_foreign` (`hench_nature_id`),
  KEY `user_hench_gender_id_foreign` (`gender_id`),
  KEY `user_hench_hench_id_foreign` (`hench_id`),
  CONSTRAINT `user_hench_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `hench_gender` (`id`),
  CONSTRAINT `user_hench_hench_id_foreign` FOREIGN KEY (`hench_id`) REFERENCES `hench` (`id`),
  CONSTRAINT `user_hench_hench_nature_id_foreign` FOREIGN KEY (`hench_nature_id`) REFERENCES `hench_nature` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- mixmaster.zone
CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
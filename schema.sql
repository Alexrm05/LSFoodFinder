SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Recipes` (
    `recipe_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `image` VARCHAR(500) NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `UserFavorites` (
    `user_id` INT NOT NULL,
    `recipe_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`user_id`, `recipe_id`),
    FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`recipe_id`) REFERENCES `Recipes`(`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
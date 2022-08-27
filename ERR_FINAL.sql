-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`actors` (
  `actor_id` BIGINT NOT NULL,
  `Full Name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Full Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`categories` (
  `category_id` BIGINT NOT NULL,
  `genre` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`languages` (
  `language_id` BIGINT NOT NULL,
  `language` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`films` (
  `film_id` BIGINT NULL DEFAULT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `language_id` BIGINT NULL DEFAULT NULL,
  `rental_duration` BIGINT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` BIGINT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`title`),
  INDEX `language_id` (`language_id` ASC) VISIBLE,
  CONSTRAINT `films_ibfk_1`
    FOREIGN KEY (`language_id`)
    REFERENCES `videoclub`.`languages` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` BIGINT NULL DEFAULT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  `store_id` BIGINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`old_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`old_data` (
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `category_id` BIGINT NULL DEFAULT NULL,
  `Full Name` VARCHAR(100) NULL DEFAULT NULL,
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  INDEX `Full Name` (`Full Name` ASC) VISIBLE,
  INDEX `title` (`title` ASC) VISIBLE,
  CONSTRAINT `old_data_ibfk_2`
    FOREIGN KEY (`category_id`)
    REFERENCES `videoclub`.`categories` (`category_id`),
  CONSTRAINT `old_data_ibfk_3`
    FOREIGN KEY (`Full Name`)
    REFERENCES `videoclub`.`actors` (`Full Name`),
  CONSTRAINT `old_data_ibfk_4`
    FOREIGN KEY (`title`)
    REFERENCES `videoclub`.`films` (`title`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`rentals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rentals` (
  `rental_id` BIGINT NULL DEFAULT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `inventory_id` BIGINT NULL DEFAULT NULL,
  `customer_id` BIGINT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `staff_id` BIGINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

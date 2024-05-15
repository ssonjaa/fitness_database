-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ipdb_v2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ipdb_v2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ipdb_v2` DEFAULT CHARACTER SET utf8 ;
USE `ipdb_v2` ;

-- -----------------------------------------------------
-- Table `ipdb_v2`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`user` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(260) NOT NULL,
  `type` CHAR NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(45) NOT NULL,
  `activated` TINYINT NOT NULL,
  `archived` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`category` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`program` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`program` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `level` INT NOT NULL,
  `duration_in_days` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `gallery_directory` VARCHAR(45) NULL,
  `created_by_id` INT NULL,
  `instructor_id` INT NULL,
  `category_id` INT NOT NULL,
  `archived` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_creator_idx` (`created_by_id` ASC) VISIBLE,
  INDEX `fk_instructor_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_created_by`
    FOREIGN KEY (`created_by_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_instructor`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `ipdb_v2`.`category` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`participation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`participation` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`participation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `payment_type` VARCHAR(45) NOT NULL,
  `card_number` VARCHAR(45) NULL,
  `program_id` INT NULL,
  `user_id` INT NULL,
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_program1_idx` (`program_id` ASC) VISIBLE,
  INDEX `fk_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_program1`
    FOREIGN KEY (`program_id`)
    REFERENCES `ipdb_v2`.`program` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`attribute` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`attribute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category2_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_category2`
    FOREIGN KEY (`category_id`)
    REFERENCES `ipdb_v2`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`tag` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `unit` VARCHAR(45) NULL,
  `value` VARCHAR(45) NOT NULL,
  `attribute_id` INT NOT NULL,
  `program_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_program2_idx` (`program_id` ASC) VISIBLE,
  INDEX `fk_attribute_idx` (`attribute_id` ASC) VISIBLE,
  CONSTRAINT `fk_program2`
    FOREIGN KEY (`program_id`)
    REFERENCES `ipdb_v2`.`program` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute`
    FOREIGN KEY (`attribute_id`)
    REFERENCES `ipdb_v2`.`attribute` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`activation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`activation` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`activation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `activation_sequence` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user3_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`comment` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `text` VARCHAR(200) NOT NULL,
  `program_id` INT NOT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_program3_idx` (`program_id` ASC) VISIBLE,
  INDEX `fk_user3_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_program3`
    FOREIGN KEY (`program_id`)
    REFERENCES `ipdb_v2`.`program` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user3`
    FOREIGN KEY (`user_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`message` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `text` VARCHAR(500) NOT NULL,
  `from_id` INT NULL,
  `to_id` INT NULL,
  `seen` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_from_idx` (`from_id` ASC) VISIBLE,
  INDEX `fk_to_idx` (`to_id` ASC) VISIBLE,
  CONSTRAINT `fk_from`
    FOREIGN KEY (`from_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_to`
    FOREIGN KEY (`to_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`question` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `title` VARCHAR(100) NULL,
  `text` VARCHAR(500) NOT NULL,
  `from_id` INT NOT NULL,
  `seen` TINYINT NOT NULL DEFAULT 0,
  `answered` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fw_from2_idx` (`from_id` ASC) VISIBLE,
  CONSTRAINT `fw_from2`
    FOREIGN KEY (`from_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`admin` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(260) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`adviser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`adviser` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`adviser` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(260) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`fitness_backend_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`fitness_backend_log` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`fitness_backend_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `user_id` INT NULL,
  `controller` VARCHAR(45) NOT NULL,
  `log` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`progress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`progress` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`progress` (
  `user_id` INT NOT NULL,
  INDEX `fk_user4_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user4`
    FOREIGN KEY (`user_id`)
    REFERENCES `ipdb_v2`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`entry` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`entry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `title` VARCHAR(100) NULL,
  `text` VARCHAR(500) NOT NULL,
  `progress_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_progress1_idx` (`progress_id` ASC) VISIBLE,
  CONSTRAINT `fk_progress1`
    FOREIGN KEY (`progress_id`)
    REFERENCES `ipdb_v2`.`progress` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ipdb_v2`.`weight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ipdb_v2`.`weight` ;

CREATE TABLE IF NOT EXISTS `ipdb_v2`.`weight` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL,
  `weight_in_kg` DECIMAL(6,3) NOT NULL,
  `progress_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_progress2_idx` (`progress_id` ASC) VISIBLE,
  CONSTRAINT `fk_progress2`
    FOREIGN KEY (`progress_id`)
    REFERENCES `ipdb_v2`.`progress` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

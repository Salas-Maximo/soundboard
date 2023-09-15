-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema soundboard
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `soundboard` ;

-- -----------------------------------------------------
-- Schema soundboard
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soundboard` DEFAULT CHARACTER SET utf8 ;
USE `soundboard` ;

-- -----------------------------------------------------
-- Table `soundboard`.`sound`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `soundboard`.`sound` ;

CREATE TABLE IF NOT EXISTS `soundboard`.`sound` (
  `idsound` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `times_played` INT UNSIGNED NOT NULL DEFAULT 0,
  `length` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idsound`),
  UNIQUE INDEX `path_UNIQUE` (`path` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

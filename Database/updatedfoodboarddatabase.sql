-- MySQL Script generated by MySQL Workbench
-- Tue May 15 08:34:47 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema foodboard
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema foodboard
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `foodboard` DEFAULT CHARACTER SET utf8 ;
USE `foodboard` ;

-- -----------------------------------------------------
-- Table `foodboard`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foodboard`.`users` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL COMMENT 'Holds contact first name',
  `lastName` VARCHAR(45) NOT NULL COMMENT 'Holds user last name',
  `email` VARCHAR(45) NOT NULL COMMENT 'Holds user email\n',
  `suiteNumber` INT(10) NOT NULL COMMENT 'Holds user\'s apartment suite number\n',
  `password` VARCHAR(61) NOT NULL COMMENT 'Holds user\'s password\n',
  `createdAt` DATETIME NOT NULL COMMENT 'Holds creation time of the user',
  `updatedAt` DATETIME NOT NULL COMMENT 'Holds the time the user last updated',
  `role` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Stores the role of the user\nAdmin = 0, User = 1\n',
  PRIMARY KEY (`userID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `foodboard`.`fooditem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foodboard`.`fooditem` (
  `itemID` INT(11) NOT NULL AUTO_INCREMENT,
  `foodName` VARCHAR(45) NOT NULL COMMENT 'Holds the name of the food item\n',
  `foodDescription` VARCHAR(255) NOT NULL COMMENT 'Holds the description of the item (time of pickup, description)',
  `foodGroup` VARCHAR(45) NOT NULL COMMENT 'Holds the food group of the item',
  `foodExpiryTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Holds the expiry date of the food item\n',
  `foodImage` VARCHAR(255) NOT NULL COMMENT 'Holds the image of the food item\n',
  `claimStatus` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Holds the \'claimed\' status of the food item\n\n0 = unclaimed\n1 = claimed',
  `Users_userID` INT(11) NOT NULL,
  PRIMARY KEY (`itemID`, `Users_userID`),
  INDEX `fk_FoodItem_Users1_idx` (`Users_userID` ASC),
  CONSTRAINT `fk_FoodItem_Users1`
    FOREIGN KEY (`Users_userID`)
    REFERENCES `foodboard`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `foodboard`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foodboard`.`sessions` (
  `sessionID` VARCHAR(255) NOT NULL,
  `Users_userID` INT(11) NOT NULL,
  PRIMARY KEY (`sessionID`, `Users_userID`),
  INDEX `fk_Sessions_Users1_idx` (`Users_userID` ASC),
  CONSTRAINT `fk_Sessions_Users1`
    FOREIGN KEY (`Users_userID`)
    REFERENCES `foodboard`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `foodboard`.`userlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foodboard`.`userlist` (
  `listingID` INT(11) NOT NULL AUTO_INCREMENT,
  `Users_UserID` INT(11) NOT NULL,
  PRIMARY KEY (`listingID`, `Users_UserID`),
  INDEX `fk_UserList_Users1_idx` (`Users_UserID` ASC),
  CONSTRAINT `fk_UserList_Users1`
    FOREIGN KEY (`Users_UserID`)
    REFERENCES `foodboard`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

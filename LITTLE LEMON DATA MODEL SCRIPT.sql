-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb3 ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `CustomerID` INT NOT NULL,
  `CustFirstName` VARCHAR(255) NULL DEFAULT NULL,
  `CustLastName` VARCHAR(255) NULL DEFAULT NULL,
  `CustEmail` VARCHAR(255) NULL DEFAULT NULL,
  `CustContactNum` VARCHAR(50) NULL DEFAULT NULL,
  `CustAddress` VARCHAR(255) NULL DEFAULT NULL,
  `City` VARCHAR(100) NULL DEFAULT NULL,
  `State` VARCHAR(100) NULL DEFAULT NULL,
  `PostalCode` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staffinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staffinfo` (
  `StaffID` INT NOT NULL DEFAULT '1',
  `StaffName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(50) NULL DEFAULT NULL,
  `StaffAddress` VARCHAR(255) NOT NULL,
  `StaffContactNum` INT NOT NULL,
  `StaffEmail` VARCHAR(255) NULL DEFAULT NULL,
  `AnnualSalary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NULL DEFAULT NULL,
  `BookingSlot` TIME NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `StaffID` INT NULL DEFAULT NULL,
  `BookingDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `littlelemondb`.`staffinfo` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 456
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitem` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Starters` VARCHAR(150) NULL DEFAULT NULL,
  `Courses` VARCHAR(150) NULL DEFAULT NULL,
  `Drinks` VARCHAR(150) NULL DEFAULT NULL,
  `Desserts` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(100) NULL DEFAULT NULL,
  `Cuisine` VARCHAR(255) NULL DEFAULT NULL,
  `ItemID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `ItemID_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `ItemID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `littlelemondb`.`menuitem` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `OrderID` INT NOT NULL,
  `MenuID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `BillAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderdeliverystatus` (
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondb`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

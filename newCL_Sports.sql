-- MySQL Script generated by MySQL Workbench
-- Mon Mar 29 21:20:37 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cl_sports
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cl_sports
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cl_sports` DEFAULT CHARACTER SET utf8 ;
USE `cl_sports` ;

-- -----------------------------------------------------
-- Table `cl_sports`.`Timeline Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Timeline Dimension` (
  `TimeID` INT NOT NULL,
  `Date_o` DATE NOT NULL,
  `MonthID` INT NOT NULL,
  `MonthText` VARCHAR(3) NOT NULL,
  `Year_o` INT NOT NULL,
  PRIMARY KEY (`TimeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cl_sports`.`Adress Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Adress Dimension` (
  `AddressID` INT NOT NULL,
  `County` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Eircode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cl_sports`.`Customers Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Customers Dimension` (
  `CustomerID` INT NOT NULL,
  `Fname` VARCHAR(45) NOT NULL,
  `Lname` VARCHAR(45) NOT NULL,
  `Phone_Number` INT NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `fk_Customers Dimension_Adress Dimension_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `fk_Customers Dimension_Adress Dimension`
    FOREIGN KEY (`AddressID`)
    REFERENCES `cl_sports`.`Adress Dimension` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cl_sports`.`Branch Dimensional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Branch Dimensional` (
  `BranchID` INT NOT NULL,
  `City/Town` VARCHAR(45) NOT NULL,
  `County` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BranchID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cl_sports`.`Item Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Item Dimension` (
  `ItemID` INT NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `SportsCategory` VARCHAR(45) NOT NULL,
  `Item_Type` VARCHAR(45) NOT NULL,
  `Model_Name` VARCHAR(45) NOT NULL,
  `Quantity` INT NOT NULL,
  `Price` DECIMAL(5,2) NOT NULL,
  `BranchID` INT NOT NULL,
  PRIMARY KEY (`ItemID`),
  INDEX `fk_Item Dimension_Branch Dimensional1_idx` (`BranchID` ASC) VISIBLE,
  CONSTRAINT `fk_Item Dimension_Branch Dimensional1`
    FOREIGN KEY (`BranchID`)
    REFERENCES `cl_sports`.`Branch Dimensional` (`BranchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cl_sports`.`Purchase Orders Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Purchase Orders Dimension` (
  `OrderID` INT NOT NULL,
  `ScheduledShippingDate` DATE NOT NULL,
  `ActualShippingDate` DATE NOT NULL,
  PRIMARY KEY (`OrderID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cl_sports`.`Online Orders Fact Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cl_sports`.`Online Orders Fact Table` (
  `CustomerID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `TimeID` INT NOT NULL,
  `ShippingDelay` INT NOT NULL,
  `OrdersByBranch` INT NOT NULL,
  `AverageChristmasSales` DECIMAL(6,2) NOT NULL,
  `MostPopularSportCategoryOver` VARCHAR(45) NOT NULL,
  INDEX `fk_Orders Fact Table_Customers Dimension1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders Fact Table_Purchase Orders Dimension1_idx` (`OrderID` ASC) VISIBLE,
  INDEX `fk_Orders Fact Table_Item Dimension1_idx` (`ItemID` ASC) VISIBLE,
  INDEX `fk_Orders Fact Table_Timeline Dimension1_idx` (`TimeID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders Fact Table_Customers Dimension1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `cl_sports`.`Customers Dimension` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders Fact Table_Purchase Orders Dimension1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `cl_sports`.`Purchase Orders Dimension` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders Fact Table_Item Dimension1`
    FOREIGN KEY (`ItemID`)
    REFERENCES `cl_sports`.`Item Dimension` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders Fact Table_Timeline Dimension1`
    FOREIGN KEY (`TimeID`)
    REFERENCES `cl_sports`.`Timeline Dimension` (`TimeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



/*----------------------------------------------------------------------------
Insert data into `cl_sports`.`Timeline Dimension` Table
------------------------------------------------------------------------------*/
INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777701", "2019-01-15", 01, "JAN" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777702", "2019-03-09", 03, "MAR" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777703", "2019-05-29", 05, "MAY" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777704", "2019-08-02", 08, "AUG" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777705", "2019-11-11", 11, "NOV" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777706", "2019-11-20", 11, "NOV" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777707", "2019-11-27", 11, "NOV" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777708", "2019-11-30", 11, "NOV" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777709", "2019-01-10", 12, "DEC" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777710", "2019-01-16", 12, "DEC" , 2019
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777711", "2020-02-27", 02, "FEB" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777712", "2020-06-13", 06, "JUN" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777713", "2020-09-04", 09, "SEP" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777714", "2020-10-12", 10, "OCT" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777715", "2020-11-20", 11, "NOV" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777716", "2020-11-29", 11, "NOV" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777717", "2020-12-08", 12, "DEC" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777718", "2020-12-18", 12, "DEC" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777719", "2020-12-20", 12, "DEC" , 2020
);

INSERT INTO  `cl_sports`.`Timeline Dimension` VALUES (
"777720", "2020-12-23", 12, "DEC" , 2020
);

/*----------------------------------------------------------------------------
Insert data into `cl_sports`.`Adress Dimension` Table
------------------------------------------------------------------------------*/
INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111111", "Dublin", "76 Hill Drive, Artane", "D07-0001"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111112", "Dublin", "92 Rune Drive, Coolock", "D07-0002"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111113", "Dublin", "14 Willow Drive, Santry", "D07-0003"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111114", "Dublin", "12 Eastview Drive, Kilbarack", "D07-0004"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111115", "Dublin", "90 Sparrow Street, Tallaght", "D07-0005"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111116", "Dublin", "10 Harris Street, Ringsend", "D07-0006"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111117", "Dublin", "42 Harris Street, Ringsend", "D07-0007"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111118", "Dublin", "61 Greenwood Avenue, Balbriggan", "D07-0008"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111119", "Dublin", "72 Jenson Lane, Blanchardstown", "D07-0009"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111120", "Dublin", "68 Jenson Lane, Blanchardstown", "D07-0010"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111121", "Dublin", "6 Clay Street, Raheny", "D07-0011"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111122", "Dublin", "41 Link Road, Rush", "D07-0012"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111123", "Dublin", "7 Gill Drive, Finglas", "D07-0013"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111124", "Dublin", "78 Sparrow Street, Tallaght", "D07-0014"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111125", "Dublin", "45 Fork Lane, Artane", "D07-0015"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111126", "Dublin", "38 Harp Street, Raheny", "D07-0016"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111127", "Dublin", "81 Gardener Street, Blanchardstown", "D07-0017"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111128", "Dublin", "7 Curb Drive, Coolock", "D07-0018"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111129", "Dublin", "19 Fern Avenue, Raheny", "D07-0019"
);

INSERT INTO `cl_sports`.`Adress Dimension`VALUES (
"111130", "Dublin", "65 Huntsman Road, Ballymun", "D07-0020"
);


/*----------------------------------------------------------------------------
Insert data into  `cl_sports`.`Customers Dimension` Table
------------------------------------------------------------------------------*/
INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000001", "Jessica", "McGeady", "0835551321" , 111111
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000002", "Kim", "McGowan","0835340321" , 111112
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000003", "Wilfred", "Keely", "0893372102" , 111113
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000004", "Brian", "Moon",  "0831300432" , 111114
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000005", "Jim", "Gunn",  "0856626300" ,111115
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000006", "Aidan", "Barlow", "0854671324", 111116
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000007", "Lily", "Price","0872990325" , 111117
);

INSERT INTO`cl_sports`.`Customers Dimension` VALUES (
"000008", "Zach", "Lynch","0890084358" , 111118
);

INSERT INTO`cl_sports`.`Customers Dimension` VALUES (
"000009", "Mary", "Long",  "086666310", 111119
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000010", "Quincy", "Quinn",  "0876444302",111120
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000011", "Sean", "O'Driscoll","0836547331" , 111121
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000012", "Billy", "Harold","0858822194" , 111122
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000013", "Chris", "Reed", "0894355321", 111123
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000014", "James", "Sloan",  "0867543026",111124
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000015", "Greta", "Woods",  "0876333520", 111125
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000016", "Conor", "Leads", "0856251053", 111126
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000017", "Sarah", "Grant",  "0836544439", 111127
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000018", "Joseph", "Hunt",  "0898366420", 111128
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000019", "Lee", "Harford","0862833099", 111129
);

INSERT INTO `cl_sports`.`Customers Dimension` VALUES (
"000020", "Linda", "Medley","0878854603" , 111130 
);

/*----------------------------------------------------------------------------
Insert data into  `cl_sports`.`Customers Dimension` Table
------------------------------------------------------------------------------*/

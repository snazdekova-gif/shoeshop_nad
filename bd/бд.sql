-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shoehop_idk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shoehop_idk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shoehop_idk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `shoehop_idk` ;

-- -----------------------------------------------------
-- Table `shoehop_idk`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`manufacturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`manufacturers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`pvz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`pvz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postcode` INT NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `house` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`status_name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`status_name` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_role` INT NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `middle_name` VARCHAR(255) NOT NULL,
  `Логин` VARCHAR(255) NOT NULL,
  `Пароль` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `roles_idx` (`id_role` ASC) VISIBLE,
  CONSTRAINT `roles`
    FOREIGN KEY (`id_role`)
    REFERENCES `shoehop_idk`.`role` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `delivery_date` DATE NOT NULL,
  `delivery_post_id` INT NOT NULL,
  `user` INT NOT NULL,
  `code` INT NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ouser_idx` (`user` ASC) VISIBLE,
  INDEX `ostatus_idx` (`status` ASC) VISIBLE,
  INDEX `opvz_idx` (`delivery_post_id` ASC) VISIBLE,
  CONSTRAINT `opvz`
    FOREIGN KEY (`delivery_post_id`)
    REFERENCES `shoehop_idk`.`pvz` (`id`),
  CONSTRAINT `ostatus`
    FOREIGN KEY (`status`)
    REFERENCES `shoehop_idk`.`status_name` (`id`),
  CONSTRAINT `ouser`
    FOREIGN KEY (`user`)
    REFERENCES `shoehop_idk`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`prodname`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`prodname` (
  `IdName` INT NOT NULL AUTO_INCREMENT,
  `ProdName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`IdName`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`suppliers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`prouducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`prouducts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `aticul` VARCHAR(255) NOT NULL,
  `Product_name` INT NOT NULL,
  `Unit_measurement` VARCHAR(255) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  `Supplier` INT NOT NULL,
  `Manufacturer` INT NOT NULL,
  `Product_category` INT NOT NULL,
  `Current_discount` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Product_description` TEXT NULL DEFAULT NULL,
  `Photo` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `pname_idx` (`Product_name` ASC) VISIBLE,
  INDEX `psupp_idx` (`Supplier` ASC) VISIBLE,
  INDEX `pman_idx` (`Manufacturer` ASC) VISIBLE,
  INDEX `pcat_idx` (`Product_category` ASC) VISIBLE,
  CONSTRAINT `pcat`
    FOREIGN KEY (`Product_category`)
    REFERENCES `shoehop_idk`.`categories` (`id`),
  CONSTRAINT `pman`
    FOREIGN KEY (`Manufacturer`)
    REFERENCES `shoehop_idk`.`manufacturers` (`id`),
  CONSTRAINT `pname`
    FOREIGN KEY (`Product_name`)
    REFERENCES `shoehop_idk`.`prodname` (`IdName`),
  CONSTRAINT `psupp`
    FOREIGN KEY (`Supplier`)
    REFERENCES `shoehop_idk`.`suppliers` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shoehop_idk`.`order_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoehop_idk`.`order_products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `product_count` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ffff_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_order_products_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `ffff`
    FOREIGN KEY (`product_id`)
    REFERENCES `shoehop_idk`.`prouducts` (`id`),
  CONSTRAINT `fk_order_products_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `shoehop_idk`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

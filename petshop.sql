-- MySQL Script generated by MySQL Workbench
-- Fri May  5 14:32:22 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema petnanet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema petnanet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petnanet` DEFAULT CHARACTER SET utf8 ;
USE `petnanet` ;

-- -----------------------------------------------------
-- Table `petnanet`.`nomeDono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`nomeDono` (
  `idnomeDono` INT NOT NULL,
  PRIMARY KEY (`idnomeDono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petnanet`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NOT NULL,
  `emailCliente` VARCHAR(240) NOT NULL,
  `telCliente` INT NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `petnanet`.`tipoServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`tipoServico` (
  `idtable1` INT NOT NULL AUTO_INCREMENT,
  `veterinario` VARCHAR(45) NULL,
  `tosa` VARCHAR(45) NULL,
  `banho` VARCHAR(45) NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petnanet`.`pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`pet` (
  `idpet` INT NOT NULL AUTO_INCREMENT,
  `tipoPet` VARCHAR(45) NOT NULL,
  `nomePet` VARCHAR(45) NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idpet`),
  INDEX `fk_pet_cliente1_idx` (`cliente_idcliente` ASC),
  CONSTRAINT `fk_pet_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `petnanet`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petnanet`.`ordemServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`ordemServico` (
  `idordemServico` INT NOT NULL AUTO_INCREMENT,
  `dataServ` VARCHAR(45) NOT NULL,
  `ordemServicocol` VARCHAR(45) NOT NULL,
  `tipoServico` VARCHAR(45) NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idordemServico`),
  INDEX `fk_ordemServico_cliente1_idx` (`cliente_idcliente` ASC),
  CONSTRAINT `fk_ordemServico_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `petnanet`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petnanet`.`ordemServico_has_tipoServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`ordemServico_has_tipoServico` (
  `ordemServico_idordemServico` INT NOT NULL,
  `tipoServico_idtable1` INT NOT NULL,
  PRIMARY KEY (`ordemServico_idordemServico`, `tipoServico_idtable1`),
  INDEX `fk_ordemServico_has_tipoServico_tipoServico1_idx` (`tipoServico_idtable1` ASC),
  INDEX `fk_ordemServico_has_tipoServico_ordemServico1_idx` (`ordemServico_idordemServico` ASC),
  CONSTRAINT `fk_ordemServico_has_tipoServico_ordemServico1`
    FOREIGN KEY (`ordemServico_idordemServico`)
    REFERENCES `petnanet`.`ordemServico` (`idordemServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemServico_has_tipoServico_tipoServico1`
    FOREIGN KEY (`tipoServico_idtable1`)
    REFERENCES `petnanet`.`tipoServico` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petnanet`.`ordemServico_has_pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petnanet`.`ordemServico_has_pet` (
  `ordemServico_idordemServico` INT NOT NULL,
  `pet_idpet` INT NOT NULL,
  PRIMARY KEY (`ordemServico_idordemServico`, `pet_idpet`),
  INDEX `fk_ordemServico_has_pet_pet1_idx` (`pet_idpet` ASC),
  INDEX `fk_ordemServico_has_pet_ordemServico1_idx` (`ordemServico_idordemServico` ASC),
  CONSTRAINT `fk_ordemServico_has_pet_ordemServico1`
    FOREIGN KEY (`ordemServico_idordemServico`)
    REFERENCES `petnanet`.`ordemServico` (`idordemServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemServico_has_pet_pet1`
    FOREIGN KEY (`pet_idpet`)
    REFERENCES `petnanet`.`pet` (`idpet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

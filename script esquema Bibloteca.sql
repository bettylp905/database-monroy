-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema 1prueba
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `1prueba` ;

-- -----------------------------------------------------
-- Schema 1prueba
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `1prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Usuariocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamo` (
  `id` INT NOT NULL,
  `usuario_id` INT NULL,
  `multa_id` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Prestamo_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Multa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Multa` (
  `id` INT NOT NULL,
  `monto DECIMAL(10.2)` VARCHAR(45) NULL,
  `pagado TINY` INT NULL,
  `Prestamo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Prestamo_id`),
  INDEX `fk_Multa_Prestamo2_idx` (`Prestamo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Multa_Prestamo2`
    FOREIGN KEY (`Prestamo_id`)
    REFERENCES `mydb`.`Prestamo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `prestamo_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Libro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Categoria_Libro2_idx` (`Libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Libro2`
    FOREIGN KEY (`Libro_id`)
    REFERENCES `mydb`.`Libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ejemplar` (
  `id` INT NOT NULL,
  `codigo` VARCHAR(45) NULL,
  `Libro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ejemplar_Libro2_idx` (`Libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ejemplar_Libro2`
    FOREIGN KEY (`Libro_id`)
    REFERENCES `mydb`.`Libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  ` id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `ap_paterno` VARCHAR(45) NULL,
  `ap_materno` VARCHAR(45) NULL,
  `Libro_id` INT NOT NULL,
  PRIMARY KEY (` id`),
  INDEX `fk_Autor_Libro2_idx` (`Libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_Libro2`
    FOREIGN KEY (`Libro_id`)
    REFERENCES `mydb`.`Libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Usuariocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamo` (
  `id` INT NOT NULL,
  `usuario_id` INT NULL,
  `multa_id` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Prestamo_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Multa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Multa` (
  `id` INT NOT NULL,
  `monto DECIMAL(10.2)` VARCHAR(45) NULL,
  `pagado TINY` INT NULL,
  `Prestamo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Prestamo_id`),
  INDEX `fk_Multa_Prestamo2_idx` (`Prestamo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Multa_Prestamo2`
    FOREIGN KEY (`Prestamo_id`)
    REFERENCES `mydb`.`Prestamo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `prestamo_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  ` id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `ap_paterno` VARCHAR(45) NULL,
  `ap_materno` VARCHAR(45) NULL,
  `Libro_id` INT NOT NULL,
  PRIMARY KEY (` id`),
  INDEX `fk_Autor_Libro2_idx` (`Libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_Libro2`
    FOREIGN KEY (`Libro_id`)
    REFERENCES `mydb`.`Libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ejemplar` (
  `id` INT NOT NULL,
  `codigo` VARCHAR(45) NULL,
  `Libro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ejemplar_Libro2_idx` (`Libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ejemplar_Libro2`
    FOREIGN KEY (`Libro_id`)
    REFERENCES `mydb`.`Libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Libro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Categoria_Libro2_idx` (`Libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Libro2`
    FOREIGN KEY (`Libro_id`)
    REFERENCES `mydb`.`Libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `1prueba` ;

-- -----------------------------------------------------
-- Table `1prueba`.`tabla prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `1prueba`.`tabla prueba` (
  `idtabla prueba` INT NOT NULL,
  `tabla pruebacol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtabla prueba`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

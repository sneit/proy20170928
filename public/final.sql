SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `fulbito` ;
CREATE SCHEMA IF NOT EXISTS `fulbito` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `fulbito` ;

-- -----------------------------------------------------
-- Table `fulbito`.`tipo_documento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`tipo_documento` (
  `id_tipo_doc` INT NOT NULL AUTO_INCREMENT ,
  `nombre_doc` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_tipo_doc`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`distrito`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`distrito` (
  `id_distrito` INT NOT NULL AUTO_INCREMENT ,
  `nombre_dist` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`id_distrito`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`rol`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`rol` (
  `id_rol` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_rol`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT ,
  `nro_documento` VARCHAR(20) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `ape_paterno` VARCHAR(45) NOT NULL ,
  `ape_materno` VARCHAR(45) NOT NULL ,
  `fec_nacimiento` DATE NOT NULL ,
  `sexo` CHAR NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(16) NOT NULL ,
  `celular` INT(9) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `id_tipo_doc` INT NOT NULL ,
  `id_rol` INT NOT NULL ,
  `id_distrito` INT NOT NULL ,
  PRIMARY KEY (`id_persona`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `tipo_documento_id_idx` (`id_tipo_doc` ASC) ,
  INDEX `fk_arrendador_distrito1_idx` (`id_distrito` ASC) ,
  INDEX `fk_persona_rol1_idx` (`id_rol` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`google_maps`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`google_maps` (
  `id_google_maps` INT NOT NULL AUTO_INCREMENT ,
  `nom_google_maps` VARCHAR(80) NULL ,
  `dir_google_maps` VARCHAR(45) NULL ,
  `latitud` FLOAT(10,6) NULL ,
  `longitud` FLOAT(10,6) NULL ,
  `tipo_local` VARCHAR(60) NULL ,
  PRIMARY KEY (`id_google_maps`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`local_canchita`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`local_canchita` (
  `id_locales` INT NOT NULL ,
  `nombre_local` VARCHAR(45) NOT NULL ,
  `direccion_local` VARCHAR(45) NOT NULL ,
  `mapa_local` VARCHAR(45) NOT NULL ,
  `teléfono` VARCHAR(45) NULL ,
  `id_distrito` INT NOT NULL ,
  `id_arrendador` INT NOT NULL ,
  `id_google_maps` INT NOT NULL ,
  PRIMARY KEY (`id_locales`) ,
  INDEX `arrendador_id_idx` (`id_arrendador` ASC) ,
  INDEX `distrito_id_idx` (`id_distrito` ASC) ,
  INDEX `fk_locales_canchitas_google_maps1_idx` (`id_google_maps` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`cancha_fulbito`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`cancha_fulbito` (
  `id_canchita` INT NOT NULL ,
  `nombre_canchita` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `tipo_gras` VARCHAR(45) NOT NULL ,
  `ancho_m` DECIMAL(10,2) NOT NULL ,
  `largo_m` DECIMAL(10,2) NOT NULL ,
  `imagen` BLOB NULL ,
  `id_local` INT NOT NULL ,
  PRIMARY KEY (`id_canchita`) ,
  INDEX `local_id_idx` (`id_local` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`servicio_adicional`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`servicio_adicional` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  `precio` DECIMAL(10,2) NULL ,
  PRIMARY KEY (`id_servicio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`promocion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`promocion` (
  `id_promocion` INT NOT NULL AUTO_INCREMENT ,
  `nombre` DOUBLE NOT NULL ,
  `descripción` VARCHAR(45) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`id_promocion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`horarios_canchita`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`horarios_canchita` (
  `id_horario_canchita` INT NOT NULL AUTO_INCREMENT ,
  `status` TINYINT(1) NOT NULL ,
  `precio_base` DECIMAL(10,2) NOT NULL ,
  `id_canchita` INT NOT NULL ,
  `id_promocion` INT NULL ,
  `hora_inicio` TIME NOT NULL ,
  `hora_fin` TIME NOT NULL ,
  `dia_fecha` VARCHAR(45) NOT NULL ,
  INDEX `cancha_fulbito_id_idx` (`id_canchita` ASC) ,
  PRIMARY KEY (`id_horario_canchita`) ,
  INDEX `fk_horarios_canchita_promociones1_idx` (`id_promocion` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`alquilar_canchita`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`alquilar_canchita` (
  `id_alquiler` VARCHAR(45) NOT NULL ,
  `id_persona` INT NOT NULL ,
  `id_horario_canchita` INT NOT NULL ,
  `fecha_alquiler` DATE NOT NULL ,
  `hora_inicio` TIME NOT NULL ,
  `hora_fin` TIME NOT NULL ,
  `costo_por_hora` DECIMAL NULL ,
  INDEX `fk_alquilar_canchita_persona1_idx` (`id_persona` ASC) ,
  PRIMARY KEY (`id_alquiler`) ,
  INDEX `fk_alquilar_canchita_horarios_canchita1_idx` (`id_horario_canchita` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`boleta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`boleta` (
  `nro_boleta` VARCHAR(45) NOT NULL ,
  `monto_total` DECIMAL(10,2) NULL ,
  `fecha_boleta` DATETIME NULL ,
  `id_cliente` INT NOT NULL ,
  `id_arrendador` INT NOT NULL ,
  PRIMARY KEY (`nro_boleta`, `id_cliente`, `id_arrendador`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`detalle_servicio_boleta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`detalle_servicio_boleta` (
  `Item` INT NOT NULL AUTO_INCREMENT ,
  `nro_boleta` VARCHAR(45) NOT NULL ,
  `id_servicio` INT NOT NULL ,
  `cant` INT NULL ,
  `sub_total` DECIMAL(8,2) NULL ,
  INDEX `fk_servicios_x_boletas_boletas1_idx` (`nro_boleta` ASC) ,
  INDEX `fk_servicios_x_boletas_servicio_adicional1_idx` (`id_servicio` ASC) ,
  PRIMARY KEY (`Item`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`detalle_alquiler_boleta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`detalle_alquiler_boleta` (
  `item` INT NOT NULL AUTO_INCREMENT ,
  `nro_boleta` VARCHAR(45) NOT NULL ,
  `id_alquiler` VARCHAR(45) NOT NULL ,
  `cantidad` INT NULL ,
  `sub_total` DECIMAL(8,2) NULL ,
  INDEX `fk_canchitas_x_boleta_boletas1_idx` (`nro_boleta` ASC) ,
  INDEX `fk_canchitas_x_boleta_alquilar_canchita1_idx` (`id_alquiler` ASC) ,
  PRIMARY KEY (`item`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT ,
  `comentario` VARCHAR(200) NULL ,
  `calificar` INT NULL ,
  `id_canchita` INT NOT NULL ,
  PRIMARY KEY (`id_comentario`) ,
  INDEX `fk_comentario_cancha_fulbito1_idx` (`id_canchita` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`publicidad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`publicidad` (
  `id_publicidad` INT NOT NULL ,
  `titulo` VARCHAR(200) NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `num_clicks` INT NULL ,
  `ubi_pagi` INT NULL ,
  `id_canchita` INT NOT NULL ,
  PRIMARY KEY (`id_publicidad`) ,
  INDEX `fk_publicidad_cancha_fulbito1_idx` (`id_canchita` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`stock_servicios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`stock_servicios` (
  `id_sevicio` INT NOT NULL ,
  `id_cancha` INT NOT NULL ,
  `cantidad` INT NULL ,
  PRIMARY KEY (`id_sevicio`, `id_cancha`) ,
  INDEX `id_canchita_idx` (`id_cancha` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fulbito`.`sub_comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fulbito`.`sub_comentario` (
  `id_sub_comentario` INT NOT NULL AUTO_INCREMENT ,
  `sub_comentario` VARCHAR(200) NULL ,
  `id_comentario` INT NOT NULL ,
  PRIMARY KEY (`id_sub_comentario`) ,
  INDEX `fk_sub_comentario_comentario1_idx` (`id_comentario` ASC) )
ENGINE = InnoDB;

USE `fulbito` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

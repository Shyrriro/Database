SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_supermercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_supermercado` DEFAULT CHARACTER SET utf8 ;
USE `db_supermercado` ;

-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `nome_departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_produto` (
  `id_produtos` INT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(45) NOT NULL,
  `valor_produto` DECIMAL NOT NULL,
  `codigo_ean` VARCHAR(45) NOT NULL,
  `data_fabricacao` DATE NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `lote` VARCHAR(45) NOT NULL,
  `unidade_medida` VARCHAR(45) NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `quantidade_minima` INT NOT NULL,
  `descricao` VARCHAR(245) NULL,
  `id_fornecedor` INT NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_produtos`),
  INDEX `fk_tbl_produto_tbl_fornecedor_idx` (`id_fornecedor` ASC),
  INDEX `fk_tbl_produto_tbl_departamento1_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_tbl_produto_tbl_fornecedor`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `db_supermercado`.`tbl_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_produto_tbl_departamento1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `db_supermercado`.`tbl_departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_colaborador` (
  `id_colaborador` INT NOT NULL AUTO_INCREMENT,
  `nome_colaborador` VARCHAR(45) NOT NULL,
  `rg` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `data_admissao` DATE NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `estado_civil` VARCHAR(45) NOT NULL,
  `data_de_nascimento` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `reservista` VARCHAR(45) NOT NULL,
  `matricula` VARCHAR(45) NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  INDEX `fk_tbl_colaborador_tbl_departamento1_idx` (`id_departamento` ASC),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC),
  CONSTRAINT `fk_tbl_colaborador_tbl_departamento1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `db_supermercado`.`tbl_departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_email` (
  `id_email` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id_email`),
  INDEX `fk_tbl_email_tbl_fornecedor1_idx` (`id_fornecedor` ASC),
  INDEX `fk_tbl_email_tbl_cliente1_idx` (`id_cliente` ASC),
  INDEX `fk_tbl_email_tbl_colaborador1_idx` (`id_colaborador` ASC),
  CONSTRAINT `fk_tbl_email_tbl_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `db_supermercado`.`tbl_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_email_tbl_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_supermercado`.`tbl_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_email_tbl_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `db_supermercado`.`tbl_colaborador` (`id_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_promotor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_promotor` (
  `id_promotor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_promotor`),
  INDEX `fk_tbl_promotor_tbl_fornecedor1_idx` (`id_fornecedor` ASC),
  CONSTRAINT `fk_tbl_promotor_tbl_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `db_supermercado`.`tbl_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_telefone` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(45) NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_promotor` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_tbl_telefone_tbl_fornecedor1_idx` (`id_fornecedor` ASC),
  INDEX `fk_tbl_telefone_tbl_cliente1_idx` (`id_cliente` ASC),
  INDEX `fk_tbl_telefone_tbl_promotor1_idx` (`id_promotor` ASC),
  INDEX `fk_tbl_telefone_tbl_colaborador1_idx` (`id_colaborador` ASC),
  CONSTRAINT `fk_tbl_telefone_tbl_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `db_supermercado`.`tbl_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_telefone_tbl_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_supermercado`.`tbl_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_telefone_tbl_promotor1`
    FOREIGN KEY (`id_promotor`)
    REFERENCES `db_supermercado`.`tbl_promotor` (`id_promotor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_telefone_tbl_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `db_supermercado`.`tbl_colaborador` (`id_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_tbl_endereco_tbl_fornecedor1_idx` (`id_fornecedor` ASC),
  INDEX `fk_tbl_endereco_tbl_cliente1_idx` (`id_cliente` ASC),
  INDEX `fk_tbl_endereco_tbl_colaborador1_idx` (`id_colaborador` ASC),
  CONSTRAINT `fk_tbl_endereco_tbl_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `db_supermercado`.`tbl_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_endereco_tbl_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_supermercado`.`tbl_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_endereco_tbl_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `db_supermercado`.`tbl_colaborador` (`id_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_cartao_fidelidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_cartao_fidelidade` (
  `id_cartao_fidelidade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `codigo_seguranca` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_cartao_fidelidade`),
  INDEX `fk_tbl_cartao_fidelidade_tbl_cliente1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_tbl_cartao_fidelidade_tbl_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_supermercado`.`tbl_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `pedido` VARCHAR(45) NOT NULL,
  `codigo_pedido` VARCHAR(45) NOT NULL,
  `data_pedido` DATE NOT NULL,
  `data_entrega` DATE NULL,
  `valor` DECIMAL NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_tbl_pedido_tbl_cliente1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_tbl_pedido_tbl_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_supermercado`.`tbl_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_cartao_ponto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_cartao_ponto` (
  `id_cartao_ponto` INT NOT NULL AUTO_INCREMENT,
  `registro_data_entrada` DATE NOT NULL,
  `registro_data_saida` DATE NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id_cartao_ponto`),
  INDEX `fk_tbl_cartao_ponto_tbl_colaborador1_idx` (`id_colaborador` ASC),
  CONSTRAINT `fk_tbl_cartao_ponto_tbl_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `db_supermercado`.`tbl_colaborador` (`id_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_produtos_quebra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_produtos_quebra` (
  `id_produtos_quebra` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `ean` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `valor` DECIMAL NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_produtos_quebra`),
  INDEX `fk_tbl_produtos_quebra_tbl_departamento1_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_tbl_produtos_quebra_tbl_departamento1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `db_supermercado`.`tbl_departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_material_interno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_material_interno` (
  `id_material` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `quantidade_min` VARCHAR(45) NOT NULL,
  `valor` DECIMAL NOT NULL,
  `tbl_material_internocol` VARCHAR(45) NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_material`),
  INDEX `fk_tbl_material_interno_tbl_departamento1_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_tbl_material_interno_tbl_departamento1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `db_supermercado`.`tbl_departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_supermercado`.`tbl_pedido_has_tbl_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_supermercado`.`tbl_pedido_has_tbl_produto` (
  `id_pedido` INT NOT NULL,
  `id_produtos` INT NOT NULL,
  `quantidade_comprada` INT NOT NULL,
  INDEX `fk_tbl_pedido_has_tbl_produto_tbl_pedido1_idx` (`id_pedido` ASC),
  INDEX `fk_tbl_pedido_has_tbl_produto_tbl_produto1_idx` (`id_produtos` ASC),
  CONSTRAINT `fk_tbl_pedido_has_tbl_produto_tbl_pedido1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `db_supermercado`.`tbl_pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_pedido_has_tbl_produto_tbl_produto1`
    FOREIGN KEY (`id_produtos`)
    REFERENCES `db_supermercado`.`tbl_produto` (`id_produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

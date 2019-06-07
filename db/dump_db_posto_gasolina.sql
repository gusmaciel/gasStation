CREATE DATABASE  IF NOT EXISTS `db_posto_gasolina` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_posto_gasolina`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: db_posto_gasolina
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_bico`
--

DROP TABLE IF EXISTS `tb_bico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_bico` (
  `id_bico` int(11) NOT NULL AUTO_INCREMENT,
  `id_bomba_fk` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_bico`),
  KEY `fk_tb_bico_tb_bomba1_idx` (`id_bomba_fk`),
  CONSTRAINT `fk_tb_bico_tb_bomba1` FOREIGN KEY (`id_bomba_fk`) REFERENCES `tb_bomba` (`id_bomba`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bico`
--

LOCK TABLES `tb_bico` WRITE;
/*!40000 ALTER TABLE `tb_bico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bomba`
--

DROP TABLE IF EXISTS `tb_bomba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_bomba` (
  `id_bomba` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_bomba`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bomba`
--

LOCK TABLES `tb_bomba` WRITE;
/*!40000 ALTER TABLE `tb_bomba` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bomba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cargo`
--

DROP TABLE IF EXISTS `tb_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cargo`
--

LOCK TABLES `tb_cargo` WRITE;
/*!40000 ALTER TABLE `tb_cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_fisica`
--

DROP TABLE IF EXISTS `tb_cliente_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_cliente_fisica` (
  `id_cliente_fisica` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa_fk` int(11) DEFAULT NULL,
  `id_endereco_fk` int(11) DEFAULT NULL,
  `pai` varchar(50) DEFAULT NULL,
  `mae` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `informacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente_fisica`),
  KEY `fk_tb_cliente_fisica_tb_pessoa1_idx` (`id_pessoa_fk`),
  KEY `fk_tb_cliente_fisica_tb_endereco1_idx` (`id_endereco_fk`),
  CONSTRAINT `fk_tb_cliente_fisica_tb_endereco1` FOREIGN KEY (`id_endereco_fk`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_cliente_fisica_tb_pessoa1` FOREIGN KEY (`id_pessoa_fk`) REFERENCES `tb_pessoa` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_fisica`
--

LOCK TABLES `tb_cliente_fisica` WRITE;
/*!40000 ALTER TABLE `tb_cliente_fisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_juridica`
--

DROP TABLE IF EXISTS `tb_cliente_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_cliente_juridica` (
  `id_cliente_juridica` int(11) NOT NULL AUTO_INCREMENT,
  `id_endereco_fk` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `ie` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `situacao` varchar(45) DEFAULT NULL,
  `data_situacao` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente_juridica`),
  KEY `fk_tb_cliente_juridica_tb_endereco1_idx` (`id_endereco_fk`),
  CONSTRAINT `fk_tb_cliente_juridica_tb_endereco1` FOREIGN KEY (`id_endereco_fk`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_juridica`
--

LOCK TABLES `tb_cliente_juridica` WRITE;
/*!40000 ALTER TABLE `tb_cliente_juridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_combustivel`
--

DROP TABLE IF EXISTS `tb_combustivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_combustivel` (
  `id_combustivel` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_combustivel_fk` int(11) NOT NULL,
  `id_bomba_fk` int(11) NOT NULL,
  `id_bico_fk` int(11) NOT NULL,
  `descricao` varchar(155) DEFAULT NULL,
  `preco_venda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_combustivel`),
  KEY `fk_tb_combustivel_tb_tipo_combustivel1_idx` (`id_tipo_combustivel_fk`),
  KEY `fk_tb_combustivel_tb_bomba1_idx` (`id_bomba_fk`),
  KEY `fk_tb_combustivel_tb_bico1_idx` (`id_bico_fk`),
  CONSTRAINT `fk_tb_combustivel_tb_bico1` FOREIGN KEY (`id_bico_fk`) REFERENCES `tb_bico` (`id_bico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_combustivel_tb_bomba1` FOREIGN KEY (`id_bomba_fk`) REFERENCES `tb_bomba` (`id_bomba`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_combustivel_tb_tipo_combustivel1` FOREIGN KEY (`id_tipo_combustivel_fk`) REFERENCES `tb_tipo_combustivel` (`id_tipo_combustivel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_combustivel`
--

LOCK TABLES `tb_combustivel` WRITE;
/*!40000 ALTER TABLE `tb_combustivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_combustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(150) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fluxo_caixa`
--

DROP TABLE IF EXISTS `tb_fluxo_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_fluxo_caixa` (
  `id_fluxo_caixa` int(11) NOT NULL AUTO_INCREMENT,
  `saldo_atual` decimal(10,2) DEFAULT NULL,
  `data_hora_inicial` datetime DEFAULT NULL,
  `saldo_final` decimal(10,2) DEFAULT NULL,
  `data_hora_final` datetime DEFAULT NULL,
  PRIMARY KEY (`id_fluxo_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fluxo_caixa`
--

LOCK TABLES `tb_fluxo_caixa` WRITE;
/*!40000 ALTER TABLE `tb_fluxo_caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fluxo_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fornecedor`
--

DROP TABLE IF EXISTS `tb_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_endereco_fk` int(11) NOT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `ie` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  `data_situacao` date DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  KEY `fk_tb_fornecedor_tb_endereco1_idx` (`id_endereco_fk`),
  CONSTRAINT `fk_tb_fornecedor_tb_endereco1` FOREIGN KEY (`id_endereco_fk`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fornecedor`
--

LOCK TABLES `tb_fornecedor` WRITE;
/*!40000 ALTER TABLE `tb_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa_fk` int(11) DEFAULT NULL,
  `id_endereco_fk` int(11) DEFAULT NULL,
  `id_cargo_fk` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `data_demissao` date DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `fk_tb_funcionario_tb_cargo1_idx` (`id_cargo_fk`),
  KEY `fk_tb_funcionario_tb_pessoa1_idx` (`id_pessoa_fk`),
  KEY `fk_tb_funcionario_tb_endereco1_idx` (`id_endereco_fk`),
  CONSTRAINT `fk_tb_funcionario_tb_cargo1` FOREIGN KEY (`id_cargo_fk`) REFERENCES `tb_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_funcionario_tb_endereco1` FOREIGN KEY (`id_endereco_fk`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_funcionario_tb_pessoa1` FOREIGN KEY (`id_pessoa_fk`) REFERENCES `tb_pessoa` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_pedido_compra`
--

DROP TABLE IF EXISTS `tb_item_pedido_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_item_pedido_compra` (
  `id_pedido_compra_fk` int(11) NOT NULL,
  `id_produto_fk` int(11) DEFAULT NULL,
  `id_combustivel_fk` int(11) DEFAULT NULL,
  `tipo_produto` varchar(20) NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `quantidade` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  KEY `fk_tb_item_pedido_compra_tb_pedido_compra1_idx` (`id_pedido_compra_fk`),
  KEY `fk_tb_item_pedido_compra_tb_produto1_idx` (`id_produto_fk`),
  KEY `fk_combustivel` (`id_combustivel_fk`),
  CONSTRAINT `fk_combustivel` FOREIGN KEY (`id_combustivel_fk`) REFERENCES `tb_combustivel` (`id_combustivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_item_pedido_compra_tb_pedido_compra1` FOREIGN KEY (`id_pedido_compra_fk`) REFERENCES `tb_pedido_compra` (`id_pedido_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_item_pedido_compra_tb_produto1` FOREIGN KEY (`id_produto_fk`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_pedido_compra`
--

LOCK TABLES `tb_item_pedido_compra` WRITE;
/*!40000 ALTER TABLE `tb_item_pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_item_pedido_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_pedido_venda`
--

DROP TABLE IF EXISTS `tb_item_pedido_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_item_pedido_venda` (
  `id_pedido_venda_fk` int(11) NOT NULL,
  `id_produto_fk` int(11) DEFAULT NULL,
  `id_combustivel_fk` int(11) DEFAULT NULL,
  `tipo_produto` varchar(20) NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `quantidade` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  KEY `fk_tb_item_pedido_venda_tb_pedido_venda1_idx` (`id_pedido_venda_fk`),
  KEY `fk_tb_item_pedido_venda_tb_produto1_idx` (`id_combustivel_fk`),
  KEY `fk_tb_item_pedido_venda_tb_produto1` (`id_produto_fk`),
  CONSTRAINT `fk_tb_item_pedido_venda_tb_combustivel1` FOREIGN KEY (`id_combustivel_fk`) REFERENCES `tb_combustivel` (`id_combustivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_item_pedido_venda_tb_pedido_venda1` FOREIGN KEY (`id_pedido_venda_fk`) REFERENCES `tb_pedido_venda` (`id_pedido_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_item_pedido_venda_tb_produto1` FOREIGN KEY (`id_produto_fk`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=dec8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_pedido_venda`
--

LOCK TABLES `tb_item_pedido_venda` WRITE;
/*!40000 ALTER TABLE `tb_item_pedido_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_item_pedido_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_licenca_autorizacao`
--

DROP TABLE IF EXISTS `tb_licenca_autorizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_licenca_autorizacao` (
  `id_licenca_autorizacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_orgao_fk` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `descricao` varchar(155) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_expiracao` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `descricao_responsavel_renovacao` varchar(155) DEFAULT NULL,
  `informacao_adicional` varchar(155) DEFAULT NULL,
  `arquivo_pdf` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`id_licenca_autorizacao`),
  KEY `fk_tb_licenca_autorizacao_tb_funcionario1_idx` (`id_funcionario`),
  KEY `fk_tb_licenca_autorizacao_tb_orgao1_idx` (`id_orgao_fk`),
  CONSTRAINT `fk_tb_licenca_autorizacao_tb_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenca_autorizacao_tb_orgao1` FOREIGN KEY (`id_orgao_fk`) REFERENCES `tb_orgao` (`id_orgao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_licenca_autorizacao`
--

LOCK TABLES `tb_licenca_autorizacao` WRITE;
/*!40000 ALTER TABLE `tb_licenca_autorizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_licenca_autorizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario_fk` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `g_autorizacao_licenca` bit(1) DEFAULT NULL,
  `g_orgao` bit(1) DEFAULT NULL,
  `g_fornecedores` bit(1) DEFAULT NULL,
  `g_clientes` bit(1) DEFAULT NULL,
  `g_funcionarios` bit(1) DEFAULT NULL,
  `g_fidelizacao` bit(1) DEFAULT NULL,
  `g_compra_produtos` bit(1) DEFAULT NULL,
  `g_venda_produtos` bit(1) DEFAULT NULL,
  `g_combustivel` bit(1) DEFAULT NULL,
  `g_produtos` bit(1) DEFAULT NULL,
  `g_caixa` bit(1) DEFAULT NULL,
  `g_permissoes` bit(1) DEFAULT NULL,
  `informacao_adicional` varchar(200) DEFAULT NULL,
  `nivel_acesso` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_tb_login_tb_funcionario_idx` (`id_funcionario_fk`),
  CONSTRAINT `fk_tb_login_tb_funcionario` FOREIGN KEY (`id_funcionario_fk`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login`
--

LOCK TABLES `tb_login` WRITE;
/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_orgao`
--

DROP TABLE IF EXISTS `tb_orgao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_orgao` (
  `id_orgao` int(11) NOT NULL AUTO_INCREMENT,
  `id_endereco_fk` int(11) NOT NULL,
  `nome` varchar(155) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_orgao`),
  KEY `fk_tb_orgao_tb_endereco1_idx` (`id_endereco_fk`),
  CONSTRAINT `fk_tb_orgao_tb_endereco1` FOREIGN KEY (`id_endereco_fk`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orgao`
--

LOCK TABLES `tb_orgao` WRITE;
/*!40000 ALTER TABLE `tb_orgao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_orgao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido_compra`
--

DROP TABLE IF EXISTS `tb_pedido_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_pedido_compra` (
  `id_pedido_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor_fk` int(11) NOT NULL,
  `id_fluxo_caixa_fk` int(11) DEFAULT NULL,
  `nome_responsavel` varchar(155) DEFAULT NULL,
  `total_pagar` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_compra`),
  KEY `fk_tb_pedido_compra_tb_fluxo_caixa1_idx` (`id_fluxo_caixa_fk`),
  KEY `fk_tb_pedido_compra_tb_fornecedor1_idx` (`id_fornecedor_fk`),
  CONSTRAINT `fk_tb_pedido_compra_tb_fluxo_caixa1` FOREIGN KEY (`id_fluxo_caixa_fk`) REFERENCES `tb_fluxo_caixa` (`id_fluxo_caixa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pedido_compra_tb_fornecedor1` FOREIGN KEY (`id_fornecedor_fk`) REFERENCES `tb_fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido_compra`
--

LOCK TABLES `tb_pedido_compra` WRITE;
/*!40000 ALTER TABLE `tb_pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedido_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido_venda`
--

DROP TABLE IF EXISTS `tb_pedido_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_pedido_venda` (
  `id_pedido_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente_fisica_fk` int(11) DEFAULT NULL,
  `id_cliente_juridica_fk` int(11) DEFAULT NULL,
  `id_funcionario_fk` int(11) DEFAULT NULL,
  `id_fluxo_caixa_fk` int(11) DEFAULT NULL,
  `total_pagar` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `tipo_cliente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_venda`),
  KEY `fk_tb_pedido_venda_tb_funcionario1_idx` (`id_funcionario_fk`),
  KEY `fk_tb_pedido_venda_tb_fluxo_caixa1_idx` (`id_fluxo_caixa_fk`),
  KEY `fk_tb_pedido_venda_tb_cliente_fisica1` (`id_cliente_fisica_fk`),
  KEY `fk_tb_pedido_venda_tb_cliente_juridica1` (`id_cliente_juridica_fk`),
  CONSTRAINT `fk_tb_pedido_venda_tb_cliente_fisica1` FOREIGN KEY (`id_cliente_fisica_fk`) REFERENCES `tb_cliente_fisica` (`id_cliente_fisica`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_pedido_venda_tb_cliente_juridica1` FOREIGN KEY (`id_cliente_juridica_fk`) REFERENCES `tb_cliente_juridica` (`id_cliente_juridica`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_pedido_venda_tb_fluxo_caixa1` FOREIGN KEY (`id_fluxo_caixa_fk`) REFERENCES `tb_fluxo_caixa` (`id_fluxo_caixa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_pedido_venda_tb_funcionario1` FOREIGN KEY (`id_funcionario_fk`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido_venda`
--

LOCK TABLES `tb_pedido_venda` WRITE;
/*!40000 ALTER TABLE `tb_pedido_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedido_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_pessoa` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `estado_civil` varchar(15) DEFAULT NULL,
  `rg` varchar(14) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria_fk` int(11) NOT NULL,
  `id_unidade_medida_fk` int(11) NOT NULL,
  `descricao` varchar(155) DEFAULT NULL,
  `estoque_disponivel` decimal(10,0) DEFAULT NULL,
  `preco_venda` decimal(10,2) DEFAULT NULL,
  `estoque_max` decimal(10,0) DEFAULT NULL,
  `estoque_min` decimal(10,0) DEFAULT NULL,
  `nao_controlar_estoque` tinyint(4) DEFAULT NULL,
  `codigo_produto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tb_produto_tb_categoria1_idx` (`id_categoria_fk`),
  KEY `fk_tb_produto_tb_unidade_medida1_idx` (`id_unidade_medida_fk`),
  CONSTRAINT `fk_tb_produto_tb_categoria1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produto_tb_unidade_medida1` FOREIGN KEY (`id_unidade_medida_fk`) REFERENCES `tb_unidade_medida` (`id_unidade_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_cliente_fisica`
--

DROP TABLE IF EXISTS `tb_telefone_cliente_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_telefone_cliente_fisica` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente_fisica_fk` int(11) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  PRIMARY KEY (`id_telefone`,`id_cliente_fisica_fk`,`telefone`),
  KEY `fk_tb_telefone_copy1_tb_cliente_fisica1_idx` (`id_cliente_fisica_fk`),
  CONSTRAINT `fk_tb_telefone_copy1_tb_cliente_fisica1` FOREIGN KEY (`id_cliente_fisica_fk`) REFERENCES `tb_cliente_fisica` (`id_cliente_fisica`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_cliente_fisica`
--

LOCK TABLES `tb_telefone_cliente_fisica` WRITE;
/*!40000 ALTER TABLE `tb_telefone_cliente_fisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_cliente_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_cliente_juridica`
--

DROP TABLE IF EXISTS `tb_telefone_cliente_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_telefone_cliente_juridica` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente_juridica_fk` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_telefone`,`id_cliente_juridica_fk`,`telefone`),
  KEY `fk_tb_telefone_copy1_tb_cliente_juridica1_idx` (`id_cliente_juridica_fk`),
  CONSTRAINT `fk_tb_telefone_copy1_tb_cliente_juridica1` FOREIGN KEY (`id_cliente_juridica_fk`) REFERENCES `tb_cliente_juridica` (`id_cliente_juridica`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_cliente_juridica`
--

LOCK TABLES `tb_telefone_cliente_juridica` WRITE;
/*!40000 ALTER TABLE `tb_telefone_cliente_juridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_cliente_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_fornecedor`
--

DROP TABLE IF EXISTS `tb_telefone_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_telefone_fornecedor` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor_fk` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_telefone`,`id_fornecedor_fk`,`telefone`),
  KEY `fk_tb_telefone_copy1_tb_fornecedor1_idx` (`id_fornecedor_fk`),
  CONSTRAINT `fk_tb_telefone_copy1_tb_fornecedor1` FOREIGN KEY (`id_fornecedor_fk`) REFERENCES `tb_fornecedor` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_fornecedor`
--

LOCK TABLES `tb_telefone_fornecedor` WRITE;
/*!40000 ALTER TABLE `tb_telefone_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_funcionario`
--

DROP TABLE IF EXISTS `tb_telefone_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_telefone_funcionario` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario_fk` int(11) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  PRIMARY KEY (`id_telefone`,`telefone`,`id_funcionario_fk`),
  KEY `fk_tb_telefone_copy1_tb_funcionario1_idx` (`id_funcionario_fk`),
  CONSTRAINT `fk_tb_telefone_copy1_tb_funcionario1` FOREIGN KEY (`id_funcionario_fk`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_funcionario`
--

LOCK TABLES `tb_telefone_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_telefone_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_orgao`
--

DROP TABLE IF EXISTS `tb_telefone_orgao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_telefone_orgao` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_orgao_fk` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_telefone`,`id_orgao_fk`,`telefone`),
  KEY `fk_tb_telefone_orgao_tb_orgao1_idx` (`id_orgao_fk`),
  CONSTRAINT `fk_tb_telefone_orgao_tb_orgao1` FOREIGN KEY (`id_orgao_fk`) REFERENCES `tb_orgao` (`id_orgao`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_orgao`
--

LOCK TABLES `tb_telefone_orgao` WRITE;
/*!40000 ALTER TABLE `tb_telefone_orgao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_orgao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_combustivel`
--

DROP TABLE IF EXISTS `tb_tipo_combustivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_tipo_combustivel` (
  `id_tipo_combustivel` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidade_medida_fk` int(11) NOT NULL,
  `nome` varchar(155) DEFAULT NULL,
  `quantidade` decimal(10,0) DEFAULT NULL,
  `estoque_maximo` decimal(10,0) DEFAULT NULL,
  `estoque_minimo` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_combustivel`),
  KEY `fk_tb_tipo_combustivel_tb_unidade_medida1_idx` (`id_unidade_medida_fk`),
  CONSTRAINT `fk_tb_tipo_combustivel_tb_unidade_medida1` FOREIGN KEY (`id_unidade_medida_fk`) REFERENCES `tb_unidade_medida` (`id_unidade_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_combustivel`
--

LOCK TABLES `tb_tipo_combustivel` WRITE;
/*!40000 ALTER TABLE `tb_tipo_combustivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_combustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unidade_medida`
--

DROP TABLE IF EXISTS `tb_unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_unidade_medida` (
  `id_unidade_medida` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_unidade_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unidade_medida`
--

LOCK TABLES `tb_unidade_medida` WRITE;
/*!40000 ALTER TABLE `tb_unidade_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_unidade_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_posto_gasolina'
--

--
-- Dumping routines for database 'db_posto_gasolina'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-07 15:33:40

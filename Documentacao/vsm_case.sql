-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.9-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para vsm_case
DROP DATABASE IF EXISTS `vsm_case`;
CREATE DATABASE IF NOT EXISTS `vsm_case` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vsm_case`;

-- Copiando estrutura para tabela vsm_case.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `CODIGO` int(10) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vsm_case.categoria: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`CODIGO`, `DESCRICAO`) VALUES
	(1, 'CATEGORIA 01'),
	(2, 'CATEGORIA 02'),
	(3, 'CATEGORIA 03'),
	(4, 'CATEGORIA 04');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela vsm_case.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `CODIGO` int(10) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(100) NOT NULL DEFAULT '',
  `CODIGO_CATEGORIA` int(10) DEFAULT '0',
  `PRECO` float DEFAULT '0',
  `ULTIMO_PRECO` float DEFAULT NULL,
  `DATA_CADASTRO` date NOT NULL DEFAULT '0000-00-00',
  `DATA_ATUALIZACAO` date NOT NULL DEFAULT '0000-00-00',
  `SITUACAO` varchar(10) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vsm_case.produto: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`CODIGO`, `DESCRICAO`, `CODIGO_CATEGORIA`, `PRECO`, `ULTIMO_PRECO`, `DATA_CADASTRO`, `DATA_ATUALIZACAO`, `SITUACAO`) VALUES
	(2, 'ANADOR', 4, 133.65, 148.5, '2019-05-18', '2019-06-21', 'A'),
	(3, 'DORFLEX', 1, 133.65, 148.5, '2019-05-18', '2019-06-21', 'A'),
	(6, 'SEMP TOSHIBA MONITOR PP', 2, 100.24, 111.38, '2019-05-18', '2019-06-21', 'I'),
	(7, 'LENOVO NOTEBOOK', 3, 133.65, 148.5, '2019-05-18', '2019-06-21', 'I'),
	(8, 'MOUSE ERGONOMICO', 3, 133.65, 148.5, '2019-05-18', '2019-06-21', 'I');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela vsm_case.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `CODIGO` int(10) NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(100) NOT NULL DEFAULT '0',
  `SENHA` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vsm_case.usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`CODIGO`, `USUARIO`, `SENHA`) VALUES
	(1, 'VSM', 'DEMO'),
	(2, 'JOANA DULCE', '123'),
	(3, 'MARIA JOAO', '0'),
	(4, 'MARCOS', '0');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

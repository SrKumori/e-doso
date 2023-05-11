-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12-Maio-2023 às 00:38
-- Versão do servidor: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edoso_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `id` int(11) NOT NULL,
  `cpf_idoso` varchar(14) NOT NULL,
  `cpf_cuidador` varchar(14) DEFAULT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `obs` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agendamento`
--

INSERT INTO `agendamento` (`id`, `cpf_idoso`, `cpf_cuidador`, `data_inicio`, `data_fim`, `hora_inicio`, `hora_fim`, `obs`) VALUES
(17, '12345678944', '12345678910', '2023-05-04', '2023-05-16', '17:12:00', '17:21:00', 'Tenho asma'),
(15, '12345678944', '', '2023-04-22', '2023-04-27', '06:30:00', '16:30:00', 'Sou cadeirante.'),
(13, '12345678944', '12345678910', '2023-04-22', '2023-04-25', '07:30:00', '16:30:00', 'Ele tem alergia a dipirona.'),
(27, '15485774691', NULL, '2023-05-06', '2023-05-10', '06:00:00', '17:00:00', 'Possuo alergia a amendoim.'),
(24, '15485774691', '12345678910', '2023-05-11', '2023-05-25', '06:00:00', '15:00:00', 'Possuo alergia a adipirona.'),
(23, '12345678944', NULL, '2023-05-03', '2023-05-23', '18:00:00', '23:00:00', 'Possuo asma.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf32_unicode_ci NOT NULL,
  `sexo` varchar(10) COLLATE utf32_unicode_ci NOT NULL,
  `endereco` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `responsavel_nome` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `responsavel_endereco` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `responsavel_telefone` varchar(20) COLLATE utf32_unicode_ci NOT NULL,
  `responsavel_email` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `senha` varchar(12) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `nome`, `cpf`, `sexo`, `endereco`, `email`, `data_nascimento`, `responsavel_nome`, `responsavel_endereco`, `responsavel_telefone`, `responsavel_email`, `senha`) VALUES
(1, 'Fábio', '08319159601', 'Masculino', 'Rua Joaquim Claudio 222', 'fabiobaroni.fbb@gmail.com', '1997-09-14', 'Stella Oliveira', 'Rua Joaquim Claudio 222', '(31) 11234-5679', 'stella@stella.com', '123456'),
(10, 'Stella Oliveira e Silva', '13070366600', 'Feminino', 'Rua Demeter 60', 'stella.1609@hotmail.com', '1996-09-16', 'Regina Oliveira', 'Rua Demeter 60', '(31) 99480-4107', 'regina@gmail.com', '123579ab'),
(12, 'Gustavo', '12345678944', 'Masculino', 'Rua JosÃ© Alfredo Pinto, 29', 'vgustavosanttosv13@gmail.com', '2023-04-04', 'after obs', 'eeeee', '(66) 94561-1234', 'eeee@gmail.com', '123456'),
(19, 'Jose Augusto', '15485774691', 'Masculino', 'Horto, Santo Agostinho, 199', 'jose@gmail.com', '1962-02-19', 'Anfisa Augusta', 'Horto, Santo Agostinho, 199', '(31) 93657-8547', 'anfisa@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cuidados`
--

CREATE TABLE `cuidados` (
  `id_cuidado` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `data_hora_inicio` datetime NOT NULL,
  `data_hora_fim` datetime NOT NULL,
  `tipo_cuidado` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `observacoes` text COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Extraindo dados da tabela `cuidados`
--

INSERT INTO `cuidados` (`id_cuidado`, `id_cliente`, `id_funcionario`, `data_hora_inicio`, `data_hora_fim`, `tipo_cuidado`, `observacoes`) VALUES
(1, 1, 1, '2023-04-22 06:00:00', '2023-04-26 00:00:00', 'eeeee', 'eeeeeeeeeeeeeeeeeeeee'),
(2, 1, 1, '2023-04-22 06:00:00', '2023-04-26 00:00:00', 'eeeee', 'eeeeeeeeeeeeeeeeeeeee');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `cpf` varchar(12) COLLATE utf32_unicode_ci NOT NULL,
  `endereco` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf32_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `senha` varchar(12) COLLATE utf32_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_contratacao` date NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `funcao` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `experiencia` varchar(50) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nome`, `cpf`, `endereco`, `telefone`, `email`, `senha`, `data_nascimento`, `data_contratacao`, `salario`, `funcao`, `experiencia`) VALUES
(1, 'Rogerio Machado', '12345678910', 'Rua dos Amendoins', '(31)9 2345-6789', 'rogeriomachado@edoso.com.br', '123456', '1983-02-17', '2023-04-10', '1400.00', 'Cuidador de Idosos', 'Experiente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`),
  ADD UNIQUE KEY `id_clientes` (`id_clientes`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Indexes for table `cuidados`
--
ALTER TABLE `cuidados`
  ADD PRIMARY KEY (`id_cuidado`),
  ADD KEY `Cuidados_fk0` (`id_cliente`),
  ADD KEY `Cuidados_fk1` (`id_funcionario`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `cuidados`
--
ALTER TABLE `cuidados`
  MODIFY `id_cuidado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cuidados`
--
ALTER TABLE `cuidados`
  ADD CONSTRAINT `Cuidados_fk0` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_clientes`),
  ADD CONSTRAINT `Cuidados_fk1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

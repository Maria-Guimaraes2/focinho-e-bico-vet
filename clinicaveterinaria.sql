-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260810.843def3cd8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2026 at 02:24 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinicaveterinaria`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id_agendamento` int NOT NULL,
  `dia_do_agendamento` datetime NOT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `id_animal` int NOT NULL,
  `id_tutor` int NOT NULL,
  `nome_animal` varchar(255) NOT NULL,
  `especie` varchar(100) NOT NULL,
  `raca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aplicacoes_vacina`
--

CREATE TABLE `aplicacoes_vacina` (
  `id_aplicacao` int NOT NULL,
  `dia_da_aplicacao` datetime NOT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `id_vacina` int NOT NULL,
  `dose` varchar(50) NOT NULL,
  `proxima_dose` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int NOT NULL,
  `dia_da_consulta` datetime NOT NULL,
  `id_animal` int NOT NULL,
  `id_agendamento` int DEFAULT NULL,
  `id_veterinario` int NOT NULL,
  `custo_da_consulta` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidade` int NOT NULL,
  `especialidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exames`
--

CREATE TABLE `exames` (
  `id_exame` int NOT NULL,
  `nome_exame` varchar(50) NOT NULL,
  `custo_exame` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faturamentos`
--

CREATE TABLE `faturamentos` (
  `id_faturamento` int NOT NULL,
  `id_tutor` int NOT NULL,
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itens_faturamento`
--

CREATE TABLE `itens_faturamento` (
  `id_item` int NOT NULL,
  `id_faturamento` int NOT NULL,
  `id_consulta` int DEFAULT NULL,
  `id_aplicacao` int DEFAULT NULL,
  `id_realizacao` int DEFAULT NULL,
  `id_realizacao_exame` int DEFAULT NULL,
  `valor_item` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_pagamento` int NOT NULL,
  `id_faturamento` int NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `data_pagamento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procedimentos`
--

CREATE TABLE `procedimentos` (
  `id_procedimento` int NOT NULL,
  `custo_procedimento` decimal(10,2) NOT NULL,
  `nome_procedimento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realizacao_exame`
--

CREATE TABLE `realizacao_exame` (
  `id_realizacao_exame` int NOT NULL,
  `id_exame` int NOT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `data_exame` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realizacao_procedimento`
--

CREATE TABLE `realizacao_procedimento` (
  `id_realizacao` int NOT NULL,
  `id_procedimento` int NOT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `data_procedimento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id_tutor` int NOT NULL,
  `nome_tutor` varchar(255) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacinas`
--

CREATE TABLE `vacinas` (
  `id_vacina` int NOT NULL,
  `nome_vacina` varchar(50) NOT NULL,
  `custo_da_vacina` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario`
--

CREATE TABLE `veterinario` (
  `id_veterinario` int NOT NULL,
  `nome_veterinario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario_especialidade`
--

CREATE TABLE `veterinario_especialidade` (
  `id_vet_especialidade` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `id_especialidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD UNIQUE KEY `id_veterinario` (`id_veterinario`,`dia_do_agendamento`),
  ADD KEY `id_animal` (`id_animal`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indexes for table `aplicacoes_vacina`
--
ALTER TABLE `aplicacoes_vacina`
  ADD PRIMARY KEY (`id_aplicacao`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_vacina` (`id_vacina`);

--
-- Indexes for table `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_agendamento` (`id_agendamento`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Indexes for table `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`id_exame`);

--
-- Indexes for table `faturamentos`
--
ALTER TABLE `faturamentos`
  ADD PRIMARY KEY (`id_faturamento`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indexes for table `itens_faturamento`
--
ALTER TABLE `itens_faturamento`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_faturamento` (`id_faturamento`),
  ADD KEY `id_consulta` (`id_consulta`),
  ADD KEY `id_aplicacao` (`id_aplicacao`),
  ADD KEY `id_realizacao` (`id_realizacao`),
  ADD KEY `id_realizacao_exame` (`id_realizacao_exame`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_faturamento` (`id_faturamento`);

--
-- Indexes for table `procedimentos`
--
ALTER TABLE `procedimentos`
  ADD PRIMARY KEY (`id_procedimento`);

--
-- Indexes for table `realizacao_exame`
--
ALTER TABLE `realizacao_exame`
  ADD PRIMARY KEY (`id_realizacao_exame`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_exame` (`id_exame`);

--
-- Indexes for table `realizacao_procedimento`
--
ALTER TABLE `realizacao_procedimento`
  ADD PRIMARY KEY (`id_realizacao`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_procedimento` (`id_procedimento`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`);

--
-- Indexes for table `vacinas`
--
ALTER TABLE `vacinas`
  ADD PRIMARY KEY (`id_vacina`);

--
-- Indexes for table `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id_veterinario`);

--
-- Indexes for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD PRIMARY KEY (`id_vet_especialidade`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id_agendamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `id_animal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aplicacoes_vacina`
--
ALTER TABLE `aplicacoes_vacina`
  MODIFY `id_aplicacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidade` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exames`
--
ALTER TABLE `exames`
  MODIFY `id_exame` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faturamentos`
--
ALTER TABLE `faturamentos`
  MODIFY `id_faturamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itens_faturamento`
--
ALTER TABLE `itens_faturamento`
  MODIFY `id_item` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedimentos`
--
ALTER TABLE `procedimentos`
  MODIFY `id_procedimento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `realizacao_exame`
--
ALTER TABLE `realizacao_exame`
  MODIFY `id_realizacao_exame` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `realizacao_procedimento`
--
ALTER TABLE `realizacao_procedimento`
  MODIFY `id_realizacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_tutor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacinas`
--
ALTER TABLE `vacinas`
  MODIFY `id_vacina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id_veterinario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  MODIFY `id_vet_especialidade` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`);

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`);

--
-- Constraints for table `aplicacoes_vacina`
--
ALTER TABLE `aplicacoes_vacina`
  ADD CONSTRAINT `aplicacoes_vacina_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `aplicacoes_vacina_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `aplicacoes_vacina_ibfk_3` FOREIGN KEY (`id_vacina`) REFERENCES `vacinas` (`id_vacina`);

--
-- Constraints for table `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamentos` (`id_agendamento`);

--
-- Constraints for table `faturamentos`
--
ALTER TABLE `faturamentos`
  ADD CONSTRAINT `faturamentos_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`);

--
-- Constraints for table `itens_faturamento`
--
ALTER TABLE `itens_faturamento`
  ADD CONSTRAINT `itens_faturamento_ibfk_1` FOREIGN KEY (`id_faturamento`) REFERENCES `faturamentos` (`id_faturamento`),
  ADD CONSTRAINT `itens_faturamento_ibfk_2` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`),
  ADD CONSTRAINT `itens_faturamento_ibfk_3` FOREIGN KEY (`id_aplicacao`) REFERENCES `aplicacoes_vacina` (`id_aplicacao`),
  ADD CONSTRAINT `itens_faturamento_ibfk_4` FOREIGN KEY (`id_realizacao`) REFERENCES `realizacao_procedimento` (`id_realizacao`),
  ADD CONSTRAINT `itens_faturamento_ibfk_5` FOREIGN KEY (`id_realizacao_exame`) REFERENCES `realizacao_exame` (`id_realizacao_exame`);

--
-- Constraints for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_faturamento`) REFERENCES `faturamentos` (`id_faturamento`);

--
-- Constraints for table `realizacao_exame`
--
ALTER TABLE `realizacao_exame`
  ADD CONSTRAINT `realizacao_exame_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `realizacao_exame_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `realizacao_exame_ibfk_3` FOREIGN KEY (`id_exame`) REFERENCES `exames` (`id_exame`);

--
-- Constraints for table `realizacao_procedimento`
--
ALTER TABLE `realizacao_procedimento`
  ADD CONSTRAINT `realizacao_procedimento_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `realizacao_procedimento_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `realizacao_procedimento_ibfk_3` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimentos` (`id_procedimento`);

--
-- Constraints for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD CONSTRAINT `veterinario_especialidade_ibfk_1` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `veterinario_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidades` (`id_especialidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

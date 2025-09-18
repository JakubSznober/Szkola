-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2025 at 01:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `polska`
--

-- --------------------------------------------------------

--
-- Table structure for table `miasto`
--

CREATE TABLE `miasto` (
  `id_miasto` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `wojewodztwo_id` int(11) NOT NULL,
  `powiat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `miasto`
--

INSERT INTO `miasto` (`id_miasto`, `name`, `wojewodztwo_id`, `powiat_id`) VALUES
(1, 'Czestochowa', 12, 1),
(2, 'Warszawa', 7, 2),
(3, 'Krakow', 6, 3),
(4, 'Gdansk', 11, 4),
(5, 'Wroclaw', 1, 5),
(6, 'Bydgoszcz', 2, 6),
(7, 'Lublin', 3, 7),
(8, 'Gorzow Wielkopolski', 4, 8),
(9, 'Lodz', 5, 9),
(10, 'Tarnow', 6, 10),
(11, 'Radom', 7, 11),
(12, 'Opole', 8, 12),
(13, 'Rzeszow', 9, 13),
(14, 'Bialystok', 10, 14),
(15, 'Slupsk', 11, 15),
(16, 'Kielce', 13, 16);

-- --------------------------------------------------------

--
-- Table structure for table `osoby`
--

CREATE TABLE `osoby` (
  `id_osoba` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `miasto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `osoby`
--

INSERT INTO `osoby` (`id_osoba`, `name`, `miasto_id`) VALUES
(1, 'Jan Kowalski', 1),
(2, 'Anna Nowak', 2),
(3, 'Piotr Wisniewski', 3),
(4, 'Katarzyna Zielinska', 4),
(5, 'Marek Lewandowski', 5),
(6, 'Ewa Kaczmarek', 6),
(7, 'Tomasz Jankowski', 7),
(8, 'Agnieszka Walczak', 8),
(9, 'Pawel Zielinski', 9),
(10, 'Magdalena Szymczak', 10),
(11, 'Rafal Kwiatkowski', 11),
(12, 'Joanna Maj', 12),
(13, 'Grzegorz Nowicki', 13),
(14, 'Natalia Król', 14),
(15, 'Jakub Wrobel', 15),
(16, 'Zuzanna Lis', 16);

-- --------------------------------------------------------

--
-- Table structure for table `powiat`
--

CREATE TABLE `powiat` (
  `id_powiat` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `wojewodztwo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `powiat`
--

INSERT INTO `powiat` (`id_powiat`, `name`, `wojewodztwo_id`) VALUES
(1, 'Czestochowski', 12),
(2, 'Warszawski', 7),
(3, 'Krakowski', 6),
(4, 'Gdanski', 11),
(5, 'Wroclawski', 1),
(6, 'Bydgoski', 2),
(7, 'Lublin', 3),
(8, 'Gorzowski', 4),
(9, 'Lodzki Wschodni', 5),
(10, 'Tarnowski', 6),
(11, 'Radomski', 7),
(12, 'Opolski', 8),
(13, 'Rzeszowski', 9),
(14, 'Bialostocki', 10),
(15, 'Slupski', 11),
(16, 'Kielecki', 13);

-- --------------------------------------------------------

--
-- Table structure for table `wojewodztwo`
--

CREATE TABLE `wojewodztwo` (
  `id_wojewodztwo` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wojewodztwo`
--

INSERT INTO `wojewodztwo` (`id_wojewodztwo`, `name`) VALUES
(1, 'Dolnoslaskie'),
(2, 'Kujawsko-Pomorskie'),
(3, 'Lubelskie'),
(4, 'Lubuskie'),
(5, 'Lodzkie'),
(6, 'Malopolskie'),
(7, 'Mazowieckie'),
(8, 'Opolskie'),
(9, 'Podkarpackie'),
(10, 'Podlaskie'),
(11, 'Pomorskie'),
(12, 'Slaskie'),
(13, 'Swietokrzyskie'),
(14, 'Warminsko-Mazurskie'),
(15, 'Wielkopolskie'),
(16, 'Zachodniopomorskie');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `miasto`
--
ALTER TABLE `miasto`
  ADD PRIMARY KEY (`id_miasto`),
  ADD KEY `fk_miasto_wojewodztwo` (`wojewodztwo_id`),
  ADD KEY `fk_miasto_powiat` (`powiat_id`);

--
-- Indexes for table `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id_osoba`),
  ADD KEY `fk_osoby_miasto` (`miasto_id`);

--
-- Indexes for table `powiat`
--
ALTER TABLE `powiat`
  ADD PRIMARY KEY (`id_powiat`),
  ADD KEY `fk_powiat_wojewodztwo` (`wojewodztwo_id`);

--
-- Indexes for table `wojewodztwo`
--
ALTER TABLE `wojewodztwo`
  ADD PRIMARY KEY (`id_wojewodztwo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `miasto`
--
ALTER TABLE `miasto`
  MODIFY `id_miasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id_osoba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `powiat`
--
ALTER TABLE `powiat`
  MODIFY `id_powiat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wojewodztwo`
--
ALTER TABLE `wojewodztwo`
  MODIFY `id_wojewodztwo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `miasto`
--
ALTER TABLE `miasto`
  ADD CONSTRAINT `fk_miasto_powiat` FOREIGN KEY (`powiat_id`) REFERENCES `powiat` (`id_powiat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_miasto_wojewodztwo` FOREIGN KEY (`wojewodztwo_id`) REFERENCES `wojewodztwo` (`id_wojewodztwo`) ON UPDATE CASCADE;

--
-- Constraints for table `osoby`
--
ALTER TABLE `osoby`
  ADD CONSTRAINT `fk_osoby_miasto` FOREIGN KEY (`miasto_id`) REFERENCES `miasto` (`id_miasto`) ON UPDATE CASCADE;

--
-- Constraints for table `powiat`
--
ALTER TABLE `powiat`
  ADD CONSTRAINT `fk_powiat_wojewodztwo` FOREIGN KEY (`wojewodztwo_id`) REFERENCES `wojewodztwo` (`id_wojewodztwo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2023 at 08:53 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion médiathèque`
--

-- --------------------------------------------------------

--
-- Table structure for table `adherant`
--

CREATE TABLE `adherant` (
  `id_client` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `prenom_client` text NOT NULL,
  `nom_client` text NOT NULL,
  `adresse_client` varchar(40) NOT NULL,
  `email_client` varchar(50) NOT NULL,
  `tele_client` varchar(10) NOT NULL,
  `cin_client` varchar(20) NOT NULL,
  `naissance_client` date NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_client` text NOT NULL,
  `penalties` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gerant`
--

CREATE TABLE `gerant` (
  `id_gerant` int(11) NOT NULL,
  `nom_gerant` text NOT NULL,
  `prenom_gerant` text NOT NULL,
  `email_gerant` varchar(50) NOT NULL,
  `password_gerant` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ouvrage`
--

CREATE TABLE `ouvrage` (
  `id_ouvrage` int(11) NOT NULL,
  `titre_ouvrage` text NOT NULL,
  `auteur_ouvrage` text NOT NULL,
  `image_ouvrage` varchar(50) NOT NULL,
  `etat_ouvrage` text NOT NULL,
  `type_ouvrage` text NOT NULL,
  `date_achat` date NOT NULL,
  `date_edition` date NOT NULL,
  `nombre_pages` int(50) NOT NULL,
  `situation` text NOT NULL,
  `id_gerant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `id_reserve` int(11) NOT NULL,
  `date_reserv` datetime NOT NULL,
  `date_validation` datetime NOT NULL,
  `date_retour` datetime NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_ouvrage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adherant`
--
ALTER TABLE `adherant`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`id_gerant`);

--
-- Indexes for table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD PRIMARY KEY (`id_ouvrage`),
  ADD KEY `id_gerant` (`id_gerant`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`id_reserve`),
  ADD KEY `reserve_ibfk_1` (`id_ouvrage`),
  ADD KEY `id_client` (`id_client`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adherant`
--
ALTER TABLE `adherant`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gerant`
--
ALTER TABLE `gerant`
  MODIFY `id_gerant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ouvrage`
--
ALTER TABLE `ouvrage`
  MODIFY `id_ouvrage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `id_reserve` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD CONSTRAINT `ouvrage_ibfk_1` FOREIGN KEY (`id_gerant`) REFERENCES `gerant` (`id_gerant`);

--
-- Constraints for table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`id_ouvrage`) REFERENCES `ouvrage` (`id_ouvrage`),
  ADD CONSTRAINT `reserve_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `adherant` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

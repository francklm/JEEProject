-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 13 Juin 2013 à 14:09
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ID` int(11) NOT NULL,
  `ADRESS` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `SESSION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLIENT_SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID`, `ADRESS`, `EMAIL`, `FIRSTNAME`, `LASTNAME`, `PHONE`, `SESSION_ID`) VALUES
(1402, '06 boulevard anatole france 90000 belfort', 'lodjeu@gmail.com', 'Christian', 'Lodjeu', '0458760598', 21),
(1403, '06 boulevard anatole france 90000 belfort', 'libam@gmail.com', 'Franck', 'Libam', '0458760598', 11),
(1404, '11 Rue Madrid 90000 Belfort', 'ntieche@gmail.com', 'Madjer', 'Ntieche', '0458760587', 23),
(1405, '14 Rue Madrid 90000 Belfort', 'hugo@gmail.com', 'Hugo', 'Duffor', '0458760587', 23),
(1406, '15 Rue Madrid 75000 Paris', 'albert@gmail.com', 'Christophe', 'Albert', '0678760587', 28),
(1407, '25 Avenue Des Îles 69007 Lyon', 'hamid@gmail.com', 'Hamid', 'Abdel', '0785463208', 25);

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `CODE` varchar(255) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `course`
--

INSERT INTO `course` (`CODE`, `TITLE`) VALUES
('ALGO', 'Algorithmique'),
('BD', 'Base de données'),
('CLCOMP', 'Cloud Computing'),
('INTPR', 'Introduction à la programmation'),
('JEE', 'Java Entreprise Edition'),
('JV', 'Jeux vidéos'),
('MAO', 'Maintenance assistée par ordinateur'),
('PS', 'Photoshop'),
('SEUBU', 'Système d''exploiration Ubuntu'),
('WIN8', 'Windows 8');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `ID` int(11) NOT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`ID`, `CITY`) VALUES
(1, 'Belfort'),
(2, 'Rennes'),
(3, 'Paris'),
(4, 'Lyon'),
(5, 'Marseille'),
(6, 'Toulouse'),
(7, 'Bordeaux'),
(8, 'Nice'),
(9, 'Nantes'),
(10, 'Montpellier');

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '1450');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `ID` int(11) NOT NULL,
  `END` datetime DEFAULT NULL,
  `START` datetime DEFAULT NULL,
  `COURSE_CODE` varchar(255) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SESSION_LOCATION_ID` (`LOCATION_ID`),
  KEY `FK_SESSION_COURSE_CODE` (`COURSE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `session`
--

INSERT INTO `session` (`ID`, `END`, `START`, `COURSE_CODE`, `LOCATION_ID`) VALUES
(11, '2013-02-27 22:15:00', '2013-02-26 20:15:00', 'ALGO', 1),
(12, '2013-05-12 18:00:00', '2013-05-11 10:00:00', 'BD', 2),
(13, '2013-05-15 18:00:00', '2013-05-09 10:00:00', 'CLCOMP', 3),
(14, '2013-05-12 18:00:00', '2013-05-10 10:00:00', 'INTPR', 4),
(15, '2013-06-18 16:00:00', '2013-06-17 09:00:00', 'JEE', 5),
(16, '2013-07-17 18:00:00', '2013-07-14 08:00:00', 'JV', 6),
(17, '2013-05-12 18:00:00', '2013-05-10 10:00:00', 'MAO', 7),
(18, '2013-09-24 14:00:00', '2013-09-19 11:00:00', 'PS', 8),
(19, '2013-10-16 18:00:00', '2013-10-11 11:00:00', 'SEUBU', 9),
(20, '2013-11-28 15:00:00', '2013-11-22 14:00:00', 'WIN8', 10),
(21, '2013-05-31 14:30:00', '2013-05-25 08:00:00', 'ALGO', 10),
(22, '2014-01-15 15:00:00', '2014-01-08 13:00:00', 'BD', 9),
(23, '2014-01-19 16:20:00', '2014-01-14 10:00:00', 'CLCOMP', 8),
(24, '2014-01-25 15:15:00', '2014-01-12 09:30:00', 'INTPR', 7),
(25, '2014-02-09 10:10:00', '2014-02-02 14:14:00', 'JEE', 6),
(26, '2014-05-18 12:00:00', '2014-05-14 15:00:00', 'JV', 5),
(27, '2014-06-30 11:45:00', '2014-06-23 10:30:00', 'MAO', 4),
(28, '2014-09-02 18:00:00', '2014-08-17 07:30:00', 'PS', 3),
(29, '2015-01-31 18:00:00', '2014-12-01 15:00:00', 'SEUBU', 2),
(30, '2015-02-28 12:50:00', '2015-02-26 20:15:00', 'WIN8', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_CLIENT_SESSION_ID` FOREIGN KEY (`SESSION_ID`) REFERENCES `session` (`ID`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `FK_SESSION_COURSE_CODE` FOREIGN KEY (`COURSE_CODE`) REFERENCES `course` (`CODE`),
  ADD CONSTRAINT `FK_SESSION_LOCATION_ID` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

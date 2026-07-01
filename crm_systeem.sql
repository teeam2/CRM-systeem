-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 01 jul 2026 om 08:10
-- Serverversie: 8.4.7
-- PHP-versie: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm_systeem`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `facturen`
--

DROP TABLE IF EXISTS `facturen`;
CREATE TABLE IF NOT EXISTS `facturen` (
  `factuur_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `klant_id` int UNSIGNED NOT NULL,
  `opdracht_id` int UNSIGNED NOT NULL,
  `factuurdatum` date NOT NULL,
  `totaalbedrag` decimal(10,2) NOT NULL,
  `status` enum('open','verzonden','betaald','te_laat') COLLATE utf8mb4_general_ci DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`factuur_id`),
  KEY `klant_id` (`klant_id`),
  KEY `opdracht_id` (`opdracht_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `facturen`
--

INSERT INTO `facturen` (`factuur_id`, `klant_id`, `opdracht_id`, `factuurdatum`, `totaalbedrag`, `status`, `created_at`) VALUES
(1, 1, 1, '2026-06-05', 1250.00, 'betaald', '2026-06-09 08:19:05'),
(2, 2, 2, '2026-06-06', 3420.50, 'verzonden', '2026-06-09 08:19:05'),
(3, 3, 3, '2026-06-07', 2890.00, 'open', '2026-06-09 08:19:05'),
(4, 4, 4, '2026-06-08', 4100.75, 'betaald', '2026-06-09 08:19:05'),
(5, 5, 5, '2026-06-09', 1750.00, 'te_laat', '2026-06-09 08:19:05'),
(6, 6, 6, '2026-06-10', 2200.00, 'verzonden', '2026-06-09 08:19:05'),
(7, 7, 7, '2026-06-11', 3675.25, 'betaald', '2026-06-09 08:19:05'),
(8, 8, 8, '2026-06-12', 1925.00, 'open', '2026-06-09 08:19:05'),
(9, 9, 9, '2026-06-13', 1400.00, 'betaald', '2026-06-09 08:19:05'),
(10, 10, 10, '2026-06-14', 3100.50, 'verzonden', '2026-06-09 08:19:05'),
(11, 11, 11, '2026-06-15', 4800.00, 'betaald', '2026-06-09 08:19:05'),
(12, 12, 12, '2026-06-16', 2050.25, 'open', '2026-06-09 08:19:05'),
(13, 13, 13, '2026-06-17', 1675.00, 'betaald', '2026-06-09 08:19:05'),
(14, 14, 14, '2026-06-18', 5500.00, 'verzonden', '2026-06-09 08:19:05'),
(15, 15, 15, '2026-06-19', 1320.00, 'betaald', '2026-06-09 08:19:05'),
(16, 16, 16, '2026-06-20', 2895.50, 'open', '2026-06-09 08:19:05'),
(17, 17, 17, '2026-06-21', 1980.00, 'betaald', '2026-06-09 08:19:05'),
(18, 18, 18, '2026-06-22', 2560.00, 'verzonden', '2026-06-09 08:19:05'),
(19, 19, 19, '2026-06-23', 4450.75, 'open', '2026-06-09 08:19:05'),
(20, 20, 20, '2026-06-24', 2390.00, 'betaald', '2026-06-09 08:19:05'),
(21, 21, 21, '2026-06-25', 5125.00, 'verzonden', '2026-06-09 08:19:05'),
(22, 22, 22, '2026-06-26', 1490.00, 'betaald', '2026-06-09 08:19:05'),
(23, 23, 23, '2026-06-27', 2675.00, 'open', '2026-06-09 08:19:05'),
(24, 24, 24, '2026-06-28', 6200.50, 'verzonden', '2026-06-09 08:19:05'),
(25, 25, 25, '2026-06-29', 3550.00, 'betaald', '2026-06-09 08:19:05'),
(26, 26, 26, '2026-06-30', 1780.25, 'betaald', '2026-06-09 08:19:05'),
(27, 27, 27, '2026-07-01', 4325.00, 'open', '2026-06-09 08:19:05'),
(28, 28, 28, '2026-07-02', 2150.00, 'verzonden', '2026-06-09 08:19:05'),
(29, 29, 29, '2026-07-03', 980.00, 'betaald', '2026-06-09 08:19:05'),
(30, 30, 30, '2026-07-04', 3010.00, 'open', '2026-06-09 08:19:05'),
(31, 31, 31, '2026-07-05', 1860.00, 'betaald', '2026-06-09 08:19:05'),
(32, 32, 32, '2026-07-06', 2495.00, 'verzonden', '2026-06-09 08:19:05'),
(33, 33, 33, '2026-07-07', 5900.00, 'open', '2026-06-09 08:19:05'),
(34, 34, 34, '2026-07-08', 3200.50, 'betaald', '2026-06-09 08:19:05'),
(35, 35, 35, '2026-07-09', 2785.00, 'verzonden', '2026-06-09 08:19:05'),
(36, 36, 36, '2026-07-10', 4700.00, 'open', '2026-06-09 08:19:05'),
(37, 37, 37, '2026-07-11', 7350.00, 'betaald', '2026-06-09 08:19:05'),
(38, 38, 38, '2026-07-12', 1580.00, 'verzonden', '2026-06-09 08:19:05'),
(39, 39, 39, '2026-07-13', 860.00, 'betaald', '2026-06-09 08:19:05'),
(40, 40, 40, '2026-07-14', 2940.75, 'open', '2026-06-09 08:19:05'),
(41, 41, 41, '2026-07-15', 5120.00, 'verzonden', '2026-06-09 08:19:05'),
(42, 42, 42, '2026-07-16', 1755.00, 'betaald', '2026-06-09 08:19:05'),
(43, 43, 43, '2026-07-17', 4880.00, 'open', '2026-06-09 08:19:05'),
(44, 44, 44, '2026-07-18', 2265.00, 'betaald', '2026-06-09 08:19:05'),
(45, 45, 45, '2026-07-19', 1940.00, 'verzonden', '2026-06-09 08:19:05'),
(46, 46, 46, '2026-07-20', 6400.00, 'open', '2026-06-09 08:19:05'),
(47, 47, 47, '2026-07-21', 7850.50, 'betaald', '2026-06-09 08:19:05'),
(48, 48, 48, '2026-07-22', 2430.00, 'verzonden', '2026-06-09 08:19:05'),
(49, 49, 49, '2026-07-23', 3375.00, 'betaald', '2026-06-09 08:19:05'),
(50, 50, 50, '2026-07-24', 4180.00, 'open', '2026-06-09 08:19:05'),
(54, 54, 52, '2026-06-23', 6000.00, '', '2026-06-23 11:11:23');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

DROP TABLE IF EXISTS `klanten`;
CREATE TABLE IF NOT EXISTS `klanten` (
  `klanten_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tussenvoegsel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Achternaam` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bedrijfsnaam` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `functie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`klanten_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `klanten`
--

INSERT INTO `klanten` (`klanten_ID`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `bedrijfsnaam`, `functie`, `email`, `PhoneNumber`) VALUES
(1, 'Jan', 'de', 'Vries', 'bedrijf1', 'Project Manager', 'jan.devries@email.com', '0612345678'),
(2, 'Piet', '', 'Jansen', 'SuperCoolBedrijf', 'Developer', 'piet.jansen@email.com', '0612345679'),
(3, 'Klaas', '', 'Bakker', 'TechnoLogica BV', 'Designer', 'klaas.bakker@email.com', '0612345680'),
(4, 'Lisa', '', 'Smit', 'InnovatieCorp', 'Consultant', 'lisa.smit@email.com', '0612345681'),
(5, 'Emma', '', 'Visser', 'DesignHub', 'Accountmanager', 'emma.visser@email.com', '0612345682'),
(6, 'Noah', '', 'Meijer', 'CodeMasters', 'CEO', 'noah.meijer@email.com', '0612345683'),
(7, 'Daan', '', 'Mulder', 'WebWizards', 'CFO', 'daan.mulder@email.com', '0612345684'),
(8, 'Sophie', '', 'Bos', 'DataDynamics', 'Marketing Manager', 'sophie.bos@email.com', '0612345685'),
(9, 'Lucas', '', 'Vos', 'CloudCompany', 'HR Manager', 'lucas.vos@email.com', '0612345686'),
(10, 'Mila', '', 'Peters', 'SmartSolutions', 'Sales Representative', 'mila.peters@email.com', '0612345687'),
(11, 'Finn', '', 'Hendriks', 'bedrijf1', 'Project Manager', 'finn.hendriks@email.com', '0612345688'),
(12, 'Sara', '', 'Dekker', 'SuperCoolBedrijf', 'Developer', 'sara.dekker@email.com', '0612345689'),
(13, 'Levi', '', 'Brouwer', 'TechnoLogica BV', 'Designer', 'levi.brouwer@email.com', '0612345690'),
(14, 'Julia', '', 'Kuiper', 'InnovatieCorp', 'Consultant', 'julia.kuiper@email.com', '0612345691'),
(15, 'Sem', 'van', 'Dijk', 'DesignHub', 'Accountmanager', 'sem.vandijk@email.com', '0612345692'),
(16, 'Nina', '', 'Timmer', 'CodeMasters', 'CEO', 'nina.timmer@email.com', '0612345693'),
(17, 'Lars', '', 'Vermeer', 'WebWizards', 'CFO', 'lars.vermeer@email.com', '0612345694'),
(18, 'Eva', 'van', 'Leeuwen', 'DataDynamics', 'Marketing Manager', 'eva.vanleeuwen@email.com', '0612345695'),
(19, 'Mats', '', 'Prins', 'CloudCompany', 'HR Manager', 'mats.prins@email.com', '0612345696'),
(20, 'Tess', '', 'Blom', 'SmartSolutions', 'Sales Representative', 'tess.blom@email.com', '0612345697'),
(21, 'Bram', 'van der', 'Meer', 'bedrijf1', 'Project Manager', 'bram.meer@email.com', '0612345698'),
(22, 'Zoe', '', 'Sanders', 'SuperCoolBedrijf', 'Developer', 'zoe.sanders@email.com', '0612345699'),
(23, 'Tim', '', 'Koster', 'TechnoLogica BV', 'Designer', 'tim.koster@email.com', '0612345700'),
(24, 'Amber', '', 'Hoekstra', 'InnovatieCorp', 'Consultant', 'amber.hoekstra@email.com', '0612345701'),
(25, 'Nick', 'van', 'Rijn', 'DesignHub', 'Accountmanager', 'nick.vanrijn@email.com', '0612345702'),
(26, 'Iris', '', 'Post', 'CodeMasters', 'CEO', 'iris.post@email.com', '0612345703'),
(27, 'Ruben', '', 'Willems', 'WebWizards', 'CFO', 'ruben.willems@email.com', '0612345704'),
(28, 'Sanne', '', 'Kok', 'DataDynamics', 'Marketing Manager', 'sanne.kok@email.com', '0612345705'),
(29, 'Thomas', '', 'Vink', 'CloudCompany', 'HR Manager', 'thomas.vink@email.com', '0612345706'),
(30, 'Fleur', 'van', 'Dam', 'SmartSolutions', 'Sales Representative', 'fleur.vandam@email.com', '0612345707'),
(31, 'Gijs', '', 'Scholten', 'bedrijf1', 'Project Manager', 'gijs.scholten@email.com', '0612345708'),
(32, 'Lotte', 'van den', 'Berg', 'SuperCoolBedrijf', 'Developer', 'lotte.vandenberg@email.com', '0612345709'),
(33, 'Koen', '', 'Dijkstra', 'TechnoLogica BV', 'Designer', 'koen.dijkstra@email.com', '0612345710'),
(34, 'Anouk', '', 'Smits', 'InnovatieCorp', 'Consultant', 'anouk.smits@email.com', '0612345711'),
(35, 'Rick', '', 'Evers', 'DesignHub', 'Accountmanager', 'rick.evers@email.com', '0612345712'),
(36, 'Femke', 'van', 'Loon', 'CodeMasters', 'CEO', 'femke.vanloon@email.com', '0612345713'),
(37, 'Wouter', '', 'Martens', 'WebWizards', 'CFO', 'wouter.martens@email.com', '0612345714'),
(38, 'Ilse', '', 'Gerrits', 'DataDynamics', 'Marketing Manager', 'ilse.gerrits@email.com', '0612345715'),
(39, 'Jelle', '', 'Verhoeven', 'CloudCompany', 'HR Manager', 'jelle.verhoeven@email.com', '0612345716'),
(40, 'Maud', 'van', 'Beek', 'SmartSolutions', 'Sales Representative', 'maud.vanbeek@email.com', '0612345717'),
(41, 'Bas', 'van', 'Kessel', 'bedrijf1', 'Project Manager', 'bas.vankessel@email.com', '0612345718'),
(42, 'Naomi', '', 'Rutgers', 'SuperCoolBedrijf', 'Developer', 'naomi.rutgers@email.com', '0612345719'),
(43, 'Roy', '', 'Schouten', 'TechnoLogica BV', 'Designer', 'roy.schouten@email.com', '0612345720'),
(44, 'Elin', 'van', 'Doorn', 'InnovatieCorp', 'Consultant', 'elin.vandoorn@email.com', '0612345721'),
(45, 'Stefan', '', 'Mol', 'DesignHub', 'Accountmanager', 'stefan.mol@email.com', '0612345722'),
(46, 'Mirthe', 'van', 'Ginkel', 'CodeMasters', 'CEO', 'mirthe.vanginkel@email.com', '0612345723'),
(47, 'Kevin', '', 'Jacobs', 'WebWizards', 'CFO', 'kevin.jacobs@email.com', '0612345724'),
(48, 'Danique', '', 'Wolters', 'DataDynamics', 'Marketing Manager', 'danique.wolters@email.com', '0612345725'),
(49, 'Patrick', 'de', 'Boer', 'CloudCompany', 'HR Manager', 'patrick.deboer@email.com', '0612345726'),
(50, 'Laura', 'van', 'Dalen', 'SmartSolutions', 'Sales Representative', 'laura.vandalen@email.com', '0612345727'),
(54, 'niet', 'undercover ', 'finn', 'CodeMasters', 'Developer', 'niet.undercover.finn@fanciemail.com', '06 87654321');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerkers`
--

DROP TABLE IF EXISTS `medewerkers`;
CREATE TABLE IF NOT EXISTS `medewerkers` (
  `medewerker_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tussenvoegsel` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `achternaam` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `functie` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `wachtwoord` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telefoonnummer` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rol` enum('medewerker','admin') COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medewerker_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `medewerkers`
--

INSERT INTO `medewerkers` (`medewerker_id`, `voornaam`, `tussenvoegsel`, `achternaam`, `functie`, `email`, `wachtwoord`, `telefoonnummer`, `rol`, `created_at`) VALUES
(1, 'Olaf', '', 'Kuijpers', 'Medewerker', 'olaf.kuijpers@gildedevops.nl', 'DevOlaf#21', '0621000001', 'medewerker', '2026-06-08 09:46:56'),
(2, 'Yvonne', NULL, 'Bastiaans', 'Verkoopmedewerker', 'yvonne.bastiaans@gildedevops.nl', 'SalesYv#44', '0621000002', 'admin', '2026-06-08 09:46:56'),
(3, 'Gerard', 'van', 'Heumen', 'Afdelingshoofd', 'gerard.vanheumen@gildedevops.nl', 'AdminGer#88', '0621000003', 'admin', '2026-06-08 09:46:56'),
(4, 'Kim', NULL, 'Otten', 'Medewerker', 'kim.otten@gildedevops.nl', 'KimDev#17', '0621000004', 'medewerker', '2026-06-08 09:46:56'),
(5, 'Dennis', NULL, 'Rademaker', 'Medewerker', 'dennis.rademaker@gildedevops.nl', 'DenWork#32', '0621000005', 'medewerker', '2026-06-08 09:46:56'),
(6, 'Melanie', NULL, 'Schreurs', 'Verkoopmedewerker', 'melanie.schreurs@gildedevops.nl', 'MelSales#54', '0621000006', 'admin', '2026-06-08 09:46:56'),
(7, 'Arjen', NULL, 'Koopman', 'Medewerker', 'arjen.koopman@gildedevops.nl', 'ArjenDev#11', '0621000007', 'medewerker', '2026-06-08 09:46:56'),
(8, 'Bianca', NULL, 'Aalbers', 'Medewerker', 'bianca.aalbers@gildedevops.nl', 'Bianca#27', '0621000008', 'medewerker', '2026-06-08 09:46:56'),
(9, 'Rik', 'de', 'Graaf', 'Afdelingshoofd', 'rik.degraaf@gildedevops.nl', 'RikAdmin#90', '0621000009', 'admin', '2026-06-08 09:46:56'),
(10, 'Celeste', NULL, 'Verbeek', 'Medewerker', 'celeste.verbeek@gildedevops.nl', 'Celeste#63', '0621000010', 'medewerker', '2026-06-08 09:46:56'),
(11, 'Joey', NULL, 'Berkers', 'Medewerker', 'joey.berkers@gildedevops.nl', 'JoeyDev#77', '0621000011', 'medewerker', '2026-06-08 09:46:56'),
(12, 'Priscilla', NULL, 'Lemmens', 'Verkoopmedewerker', 'priscilla.lemmens@gildedevops.nl', 'PrisSales#14', '0621000012', 'admin', '2026-06-08 09:46:56'),
(13, 'Mitchell', NULL, 'van Breda', 'Medewerker', 'mitchell.vanbreda@gildedevops.nl', 'Mitch#28', '0621000013', 'medewerker', '2026-06-08 09:46:56'),
(14, 'Sharon', NULL, 'Kuijten', 'Medewerker', 'sharon.kuijten@gildedevops.nl', 'SharDev#36', '0621000014', 'medewerker', '2026-06-08 09:46:56'),
(15, 'Erik', NULL, 'Westenberg', 'Afdelingshoofd', 'erik.westenberg@gildedevops.nl', 'ErikBoss#72', '0621000015', 'admin', '2026-06-08 09:46:56'),
(16, 'Danielle', NULL, 'Broekman', 'Medewerker', 'danielle.broekman@gildedevops.nl', 'Danielle#19', '0621000016', 'medewerker', '2026-06-08 09:46:56'),
(17, 'Tobias', NULL, 'Verhagen', 'Medewerker', 'tobias.verhagen@gildedevops.nl', 'Tobias#57', '0621000017', 'medewerker', '2026-06-08 09:46:56'),
(18, 'Michelle', NULL, 'Stevens', 'Verkoopmedewerker', 'michelle.stevens@gildedevops.nl', 'MichSales#93', '0621000018', 'admin', '2026-06-08 09:46:56'),
(19, 'Wesley', NULL, 'Akkermans', 'Medewerker', 'wesley.akkermans@gildedevops.nl', 'Wesley#81', '0621000019', 'medewerker', '2026-06-08 09:46:56'),
(20, 'Danique', NULL, 'Claessen', 'Medewerker', 'danique.claessen@gildedevops.nl', 'Danique#45', '0621000020', 'medewerker', '2026-06-08 09:46:56'),
(21, 'Maurice', 'van', 'Haren', 'Afdelingshoofd', 'maurice.vanharen@gildedevops.nl', 'Maurice#67', '0621000021', 'admin', '2026-06-08 09:46:56'),
(22, 'Esmée', NULL, 'Rongen', 'Medewerker', 'esmee.rongen@gildedevops.nl', 'EsmeeDev#52', '0621000022', 'medewerker', '2026-06-08 09:46:56'),
(23, 'Jordy', NULL, 'Teeuwen', 'Medewerker', 'jordy.teeuwen@gildedevops.nl', 'Jordy#38', '0621000023', 'medewerker', '2026-06-08 09:46:56'),
(24, 'Valerie', NULL, 'Meurs', 'Verkoopmedewerker', 'valerie.meurs@gildedevops.nl', 'ValSales#26', '0621000024', 'admin', '2026-06-08 09:46:56'),
(25, 'Ramon', NULL, 'Wagemans', 'Medewerker', 'ramon.wagemans@gildedevops.nl', 'Ramon#74', '0621000025', 'medewerker', '2026-06-08 09:46:56'),
(26, 'Nicolle', NULL, 'Geelen', 'Medewerker', 'nicolle.geelen@gildedevops.nl', 'Nicolle#22', '0621000026', 'medewerker', '2026-06-08 09:46:56'),
(27, 'Stefan', NULL, 'Kusters', 'Afdelingshoofd', 'stefan.kusters@gildedevops.nl', 'StefanAdm#91', '0621000027', 'admin', '2026-06-08 09:46:56'),
(28, 'Monique', NULL, 'Bollen', 'Medewerker', 'monique.bollen@gildedevops.nl', 'Monique#34', '0621000028', 'medewerker', '2026-06-08 09:46:56'),
(29, 'Jasper', NULL, 'Raaijmakers', 'Medewerker', 'jasper.raaijmakers@gildedevops.nl', 'Jasper#49', '0621000029', 'medewerker', '2026-06-08 09:46:56'),
(30, 'Linda', 'de', 'Koning', 'Verkoopmedewerker', 'linda.dekoning@gildedevops.nl', 'LindaSales#84', '0621000030', 'admin', '2026-06-08 09:46:56'),
(31, 'Robin', NULL, 'Arts', 'Medewerker', 'robin.arts@gildedevops.nl', 'RobinDev#13', '0621000031', 'medewerker', '2026-06-08 09:46:56'),
(32, 'Petra', NULL, 'Smeets', 'Medewerker', 'petra.smeets@gildedevops.nl', 'Petra#68', '0621000032', 'medewerker', '2026-06-08 09:46:56'),
(33, 'Karel', NULL, 'Nijssen', 'Afdelingshoofd', 'karel.nijssen@gildedevops.nl', 'KarelBoss#47', '0621000033', 'admin', '2026-06-08 09:46:56'),
(34, 'Sylvia', NULL, 'Roelofs', 'Medewerker', 'sylvia.roelofs@gildedevops.nl', 'Sylvia#58', '0621000034', 'medewerker', '2026-06-08 09:46:56'),
(35, 'Bjorn', NULL, 'Verschuren', 'Medewerker', 'bjorn.verschuren@gildedevops.nl', 'Bjorn#39', '0621000035', 'medewerker', '2026-06-08 09:46:56'),
(36, 'Nathalie', NULL, 'Kamps', 'Verkoopmedewerker', 'nathalie.kamps@gildedevops.nl', 'NatSales#71', '0621000036', 'admin', '2026-06-08 09:46:56'),
(37, 'Dylan', NULL, 'Pijpers', 'Medewerker', 'dylan.pijpers@gildedevops.nl', 'Dylan#24', '0621000037', 'medewerker', '2026-06-08 09:46:56'),
(38, 'Marieke', NULL, 'Houben', 'Medewerker', 'marieke.houben@gildedevops.nl', 'Marieke#82', '0621000038', 'medewerker', '2026-06-08 09:46:56'),
(39, 'Gerrit', 'van', 'Asten', 'Afdelingshoofd', 'gerrit.vanasten@gildedevops.nl', 'Gerrit#65', '0621000039', 'admin', '2026-06-08 09:46:56'),
(40, 'Anita', NULL, 'Coolen', 'Medewerker', 'anita.coolen@gildedevops.nl', 'Anita#53', '0621000040', 'medewerker', '2026-06-08 09:46:56'),
(41, 'Frank', NULL, 'Vullings', 'Medewerker', 'frank.vullings@gildedevops.nl', 'FrankDev#33', '0621000041', 'medewerker', '2026-06-08 09:46:56'),
(42, 'Sabrina', NULL, 'Linders', 'Verkoopmedewerker', 'sabrina.linders@gildedevops.nl', 'SabSales#76', '0621000042', 'admin', '2026-06-08 09:46:56'),
(43, 'Kevin', NULL, 'Rutten', 'Medewerker', 'kevin.rutten@gildedevops.nl', 'Kevin#29', '0621000043', 'medewerker', '2026-06-08 09:46:56'),
(44, 'Rosalie', NULL, 'Mertens', 'Medewerker', 'rosalie.mertens@gildedevops.nl', 'Rosalie#42', '0621000044', 'medewerker', '2026-06-08 09:46:56'),
(45, 'Patrick', NULL, 'Engels', 'Afdelingshoofd', 'patrick.engels@gildedevops.nl', 'Patrick#87', '0621000045', 'admin', '2026-06-08 09:46:56'),
(46, 'Carla', NULL, 'Slangen', 'Medewerker', 'carla.slangen@gildedevops.nl', 'Carla#16', '0621000046', 'medewerker', '2026-06-08 09:46:56'),
(47, 'Jeroen', NULL, 'Bisschops', 'Medewerker', 'jeroen.bisschops@gildedevops.nl', 'Jeroen#95', '0621000047', 'medewerker', '2026-06-08 09:46:56'),
(48, 'Vivian', NULL, 'Mols', 'Verkoopmedewerker', 'vivian.mols@gildedevops.nl', 'VivSales#31', '0621000048', 'admin', '2026-06-08 09:46:56'),
(49, 'Mark', NULL, 'Thijssen', 'Medewerker', 'mark.thijssen@gildedevops.nl', 'MarkDev#61', '0621000049', 'medewerker', '2026-06-08 09:46:56'),
(50, 'Ilona', NULL, 'Hermsen', 'Medewerker', 'ilona.hermsen@gildedevops.nl', 'Ilona#73', '0621000050', 'medewerker', '2026-06-08 09:46:56'),
(53, 'finn', '', 'bloemers', 'baas', 'Finn.Bloemers@student.gildeopleidingen.nl', 'mooi wachtwoord', '0612345678', 'admin', '2026-06-11 12:09:27');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `opdrachten`
--

DROP TABLE IF EXISTS `opdrachten`;
CREATE TABLE IF NOT EXISTS `opdrachten` (
  `opdracht_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `klant_id` int UNSIGNED NOT NULL,
  `titel` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `beschrijving` text COLLATE utf8mb4_general_ci,
  `status` enum('actief','afgerond','gefactureerd','betaald') COLLATE utf8mb4_general_ci DEFAULT 'actief',
  `uurprijs` decimal(10,2) NOT NULL,
  `startdatum` date DEFAULT NULL,
  `einddatum` date DEFAULT NULL,
  PRIMARY KEY (`opdracht_id`),
  KEY `klant_id` (`klant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `opdrachten`
--

INSERT INTO `opdrachten` (`opdracht_id`, `klant_id`, `titel`, `beschrijving`, `status`, `uurprijs`, `startdatum`, `einddatum`) VALUES
(1, 1, 'Website Redesign', 'Complete vernieuwing van bedrijfswebsite', 'actief', 85.00, '2023-01-11', '2023-03-12'),
(2, 2, 'CRM Implementatie', 'Nieuw CRM systeem implementeren', 'afgerond', 95.00, '2023-01-21', '2023-03-22'),
(3, 3, 'Mobile App Ontwikkeling', 'Bouwen van mobiele applicatie', 'actief', 105.00, '2023-01-31', '2023-04-01'),
(4, 4, 'Cloud Migratie', 'Migratie naar cloud omgeving', 'betaald', 120.00, '2023-02-10', '2023-04-11'),
(5, 5, 'Security Audit', 'Controle van beveiligingsmaatregelen', 'gefactureerd', 130.00, '2023-02-20', '2023-04-21'),
(6, 6, 'API Koppeling', 'Externe API integratie realiseren', 'actief', 92.50, '2023-03-02', '2023-05-01'),
(7, 7, 'Dashboard Ontwikkeling', 'Management dashboard bouwen', 'actief', 98.00, '2023-03-12', '2023-05-11'),
(8, 8, 'Database Optimalisatie', 'Performance verbeteren database', 'afgerond', 110.00, '2023-03-22', '2023-05-21'),
(9, 9, 'Server Onderhoud', 'Onderhoud productieservers', 'betaald', 88.00, '2023-04-01', '2023-05-31'),
(10, 10, 'Netwerk Upgrade', 'Moderniseren bedrijfsnetwerk', 'actief', 102.00, '2023-04-11', '2023-06-10'),
(11, 11, 'Webshop Ontwikkeling', 'Nieuwe webshop realiseren', 'actief', 115.00, '2023-04-21', '2023-06-20'),
(12, 12, 'Data Analyse', 'Analyse klantdata en rapportage', 'afgerond', 97.50, '2023-05-01', '2023-06-30'),
(13, 13, 'SEO Optimalisatie', 'Verbeteren zoekmachine resultaten', 'gefactureerd', 80.00, '2024-01-16', '2024-03-31'),
(14, 14, 'AI Chatbot Integratie', 'Slimme chatbot implementeren', 'actief', 125.00, '2024-01-31', '2024-04-15'),
(15, 15, 'VPN Configuratie', 'Veilige VPN toegang instellen', 'betaald', 89.00, '2024-02-15', '2024-04-30'),
(16, 16, 'Facturatie Systeem', 'Automatische facturatie bouwen', 'actief', 108.00, '2024-03-01', '2024-05-15'),
(17, 17, 'Backup Oplossing', 'Nieuwe backup infrastructuur', 'afgerond', 93.00, '2024-03-16', '2024-05-30'),
(18, 18, 'Microsoft 365 Migratie', 'Migratie naar Microsoft 365', 'betaald', 99.00, '2024-03-31', '2024-06-14'),
(19, 19, 'HR Portaal', 'Interne HR applicatie ontwikkelen', 'actief', 112.00, '2024-04-15', '2024-06-29'),
(20, 20, 'Performance Testing', 'Load testing uitvoeren', 'gefactureerd', 91.00, '2024-04-30', '2024-07-14'),
(21, 21, 'Klantportaal', 'Online klantomgeving ontwikkelen', 'actief', 118.00, '2024-05-15', '2024-07-29'),
(22, 22, 'Wifi Vernieuwing', 'Nieuwe zakelijke wifi omgeving', 'betaald', 86.00, '2024-05-30', '2024-08-13'),
(23, 23, 'Ticket Systeem', 'Helpdesk ticketsysteem bouwen', 'actief', 94.00, '2024-06-14', '2024-08-28'),
(24, 24, 'DevOps Automatisering', 'CI/CD pipelines implementeren', 'actief', 135.00, '2024-06-29', '2024-09-12'),
(25, 25, 'Pentest Uitvoering', 'Penetratietest uitvoeren', 'afgerond', 140.00, '2024-07-14', '2024-09-27'),
(26, 26, 'Hosting Migratie', 'Migratie webhosting omgeving', 'betaald', 84.00, '2025-01-16', '2025-04-06'),
(27, 27, 'BI Rapportages', 'Business intelligence dashboards', 'actief', 119.00, '2025-01-31', '2025-04-21'),
(28, 28, 'App Onderhoud', 'Onderhoud bestaande mobiele app', 'gefactureerd', 90.00, '2025-02-15', '2025-05-06'),
(29, 29, 'SSL Implementatie', 'SSL certificaten configureren', 'afgerond', 79.00, '2025-03-02', '2025-05-21'),
(30, 30, 'Frontend Redesign', 'Nieuwe frontend interface bouwen', 'actief', 101.00, '2025-03-17', '2025-06-05'),
(31, 31, 'E-mail Migratie', 'Zakelijke e-mail migreren', 'betaald', 87.00, '2025-04-01', '2025-06-20'),
(32, 32, 'Monitoring Systeem', 'Server monitoring implementeren', 'actief', 96.00, '2025-04-16', '2025-07-05'),
(33, 33, 'Container Platform', 'Docker omgeving bouwen', 'actief', 128.00, '2025-05-01', '2025-07-20'),
(34, 34, 'Identity Management', 'Gebruikersbeheer verbeteren', 'afgerond', 109.00, '2025-05-16', '2025-08-04'),
(35, 35, 'Systeem Integratie', 'Integratie bestaande systemen', 'gefactureerd', 117.00, '2025-05-31', '2025-08-19'),
(36, 36, 'Cloud Beveiliging', 'Cloud security verbeteren', 'actief', 132.00, '2025-06-15', '2025-09-03'),
(37, 37, 'Data Warehouse', 'Datawarehouse opzetten', 'actief', 145.00, '2025-06-30', '2025-09-18'),
(38, 38, 'Kassa Systeem', 'Digitaal kassasysteem ontwikkelen', 'betaald', 89.50, '2025-07-15', '2025-10-03'),
(39, 39, 'Printer Netwerk', 'Zakelijk printnetwerk configureren', 'afgerond', 76.00, '2026-01-16', '2026-03-17'),
(40, 40, 'Remote Werkplek', 'Thuiswerk infrastructuur', 'gefactureerd', 104.00, '2026-01-31', '2026-04-01'),
(41, 41, 'E-learning Platform', 'Online leeromgeving ontwikkelen', 'actief', 122.00, '2026-02-15', '2026-04-16'),
(42, 42, 'Firewall Configuratie', 'Netwerk firewall instellen', 'betaald', 95.50, '2026-03-02', '2026-05-01'),
(43, 43, 'ERP Koppeling', 'ERP software integratie', 'actief', 126.00, '2026-03-17', '2026-05-16'),
(44, 44, 'Chat Applicatie', 'Interne chatapplicatie bouwen', 'afgerond', 93.50, '2026-04-01', '2026-05-31'),
(45, 45, 'Digitale Handtekening', 'Ondertekening systeem bouwen', 'gefactureerd', 88.50, '2026-04-16', '2026-06-15'),
(46, 46, 'Linux Migratie', 'Migratie naar Linux servers', 'actief', 138.00, '2026-05-01', '2026-06-30'),
(47, 47, 'Machine Learning Analyse', 'ML modellen ontwikkelen', 'actief', 150.00, '2026-05-16', '2026-07-15'),
(48, 48, 'Servicedesk Tool', 'Nieuwe servicedesk software', 'betaald', 92.00, '2026-05-31', '2026-07-30'),
(49, 49, 'Document Management', 'Documentbeheer systeem bouwen', 'afgerond', 111.00, '2026-06-15', '2026-08-14'),
(50, 50, 'Compliance Controle', 'AVG compliance controle uitvoeren', 'gefactureerd', 124.00, '2026-06-30', '2026-08-29'),
(52, 54, 'coole opdracht', 'iets super cool', 'actief', 2000.00, '2026-06-23', '0000-00-00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `werkzaamheden`
--

DROP TABLE IF EXISTS `werkzaamheden`;
CREATE TABLE IF NOT EXISTS `werkzaamheden` (
  `werkzaamheid_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `medewerker_id` int UNSIGNED NOT NULL,
  `opdracht_id` int UNSIGNED NOT NULL,
  `datum` date NOT NULL,
  `aantal_uren` decimal(5,2) NOT NULL,
  `omschrijving` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`werkzaamheid_id`),
  KEY `medewerker_id` (`medewerker_id`),
  KEY `opdracht_id` (`opdracht_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `werkzaamheden`
--

INSERT INTO `werkzaamheden` (`werkzaamheid_id`, `medewerker_id`, `opdracht_id`, `datum`, `aantal_uren`, `omschrijving`, `created_at`) VALUES
(1, 1, 2, '2026-01-12', 6.50, 'Backend functionaliteiten ontwikkeld', '2026-01-12 17:00:00'),
(2, 2, 1, '2026-01-25', 4.00, 'Klantoverleg gevoerd over requirements', '2026-01-25 16:30:00'),
(3, 3, 4, '2026-02-05', 7.50, 'Projectplanning gecontroleerd', '2026-02-05 17:15:00'),
(4, 4, 3, '2026-02-18', 5.00, 'Frontend componenten gebouwd', '2026-02-18 16:00:00'),
(5, 5, 6, '2026-03-02', 8.00, 'API koppeling gerealiseerd', '2026-03-02 17:30:00'),
(6, 6, 7, '2026-03-14', 3.50, 'Sales presentatie voorbereid', '2026-03-14 14:00:00'),
(7, 7, 8, '2026-03-29', 6.00, 'Database queries geoptimaliseerd', '2026-03-29 16:45:00'),
(8, 8, 9, '2026-04-03', 4.50, 'Bugfixes uitgevoerd', '2026-04-03 15:20:00'),
(9, 9, 10, '2026-04-15', 7.00, 'Teammeeting geleid', '2026-04-15 17:00:00'),
(10, 10, 11, '2026-04-28', 5.50, 'Webshop functionaliteit toegevoegd', '2026-04-28 16:10:00'),
(11, 11, 12, '2026-05-10', 6.50, 'Rapportage systeem ontwikkeld', '2026-05-10 17:00:00'),
(12, 12, 13, '2026-05-22', 4.00, 'SEO instellingen aangepast', '2026-05-22 15:00:00'),
(13, 13, 14, '2026-06-02', 7.50, 'Nieuwe AI features getest', '2026-06-02 17:30:00'),
(14, 14, 15, '2026-06-15', 5.00, 'VPN configuratie uitgevoerd', '2026-06-15 16:00:00'),
(15, 15, 16, '2026-06-25', 8.00, 'Facturatieproces gecontroleerd', '2026-06-25 17:45:00'),
(16, 16, 17, '2026-07-04', 3.50, 'Backup systeem bijgewerkt', '2026-07-04 13:30:00'),
(17, 17, 18, '2026-07-16', 6.00, 'Microsoft accounts gemigreerd', '2026-07-16 16:15:00'),
(18, 18, 19, '2026-07-28', 4.50, 'Klantcontact onderhouden', '2026-07-28 15:00:00'),
(19, 19, 20, '2026-08-05', 7.00, 'Load testing uitgevoerd', '2026-08-05 17:00:00'),
(20, 20, 21, '2026-08-17', 5.50, 'Klantportaal verbeterd', '2026-08-17 16:20:00'),
(21, 21, 22, '2026-08-30', 6.50, 'Wifi netwerk ingesteld', '2026-08-30 16:50:00'),
(22, 22, 23, '2026-09-08', 4.00, 'Ticket systeem uitgebreid', '2026-09-08 14:40:00'),
(23, 23, 24, '2026-09-20', 7.50, 'CI/CD pipeline gebouwd', '2026-09-20 17:10:00'),
(24, 24, 25, '2026-10-02', 5.00, 'Security kwetsbaarheden onderzocht', '2026-10-02 16:00:00'),
(25, 25, 26, '2026-10-14', 8.00, 'Hosting omgeving verhuisd', '2026-10-14 17:35:00'),
(26, 26, 27, '2026-10-26', 3.50, 'BI dashboards ontworpen', '2026-10-26 13:15:00'),
(27, 27, 28, '2026-11-04', 6.00, 'Mobiele app onderhouden', '2026-11-04 16:00:00'),
(28, 28, 29, '2026-11-15', 4.50, 'SSL certificaten vernieuwd', '2026-11-15 15:10:00'),
(29, 29, 30, '2026-11-27', 7.00, 'Frontend redesign besproken', '2026-11-27 16:45:00'),
(30, 30, 31, '2026-12-05', 5.50, 'E-mail migratie getest', '2026-12-05 15:50:00'),
(31, 31, 32, '2026-12-16', 6.50, 'Monitoring alerts ingesteld', '2026-12-16 17:00:00'),
(32, 32, 33, '2026-12-28', 4.00, 'Docker containers ingericht', '2026-12-28 14:30:00'),
(33, 33, 34, '2026-01-15', 7.50, 'Identity management verbeterd', '2026-01-15 17:15:00'),
(34, 34, 35, '2026-02-10', 5.00, 'Systeemintegraties getest', '2026-02-10 16:00:00'),
(35, 35, 36, '2026-03-05', 8.00, 'Cloud beveiliging gecontroleerd', '2026-03-05 17:45:00'),
(36, 36, 37, '2026-03-22', 3.50, 'Datawarehouse tabellen ingericht', '2026-03-22 13:00:00'),
(37, 37, 38, '2026-04-10', 6.00, 'Kassasysteem geconfigureerd', '2026-04-10 16:30:00'),
(38, 38, 39, '2026-04-25', 4.50, 'Printers gekoppeld aan netwerk', '2026-04-25 15:15:00'),
(39, 39, 40, '2026-05-15', 7.00, 'Remote werkplekken getest', '2026-05-15 17:00:00'),
(40, 40, 41, '2026-06-01', 5.50, 'E-learning modules toegevoegd', '2026-06-01 16:10:00'),
(41, 41, 42, '2026-07-10', 6.50, 'Firewall regels aangepast', '2026-07-10 16:50:00'),
(42, 42, 43, '2026-08-20', 4.00, 'ERP koppelingen gebouwd', '2026-08-20 14:20:00'),
(43, 43, 44, '2026-09-12', 7.50, 'Chat applicatie getest', '2026-09-12 17:15:00'),
(44, 44, 45, '2026-10-05', 5.00, 'Digitale handtekening geïntegreerd', '2026-10-05 16:00:00'),
(45, 45, 46, '2026-11-10', 8.00, 'Linux servers gemigreerd', '2026-11-10 17:30:00'),
(46, 46, 47, '2026-12-01', 3.50, 'Machine learning model getraind', '2026-12-01 14:00:00'),
(47, 47, 48, '2026-05-18', 6.00, 'Servicedesk software ingericht', '2026-05-18 16:05:00'),
(48, 48, 49, '2026-07-22', 4.50, 'Documentbeheer getest', '2026-07-22 15:00:00'),
(49, 49, 50, '2026-09-15', 7.00, 'AVG compliance controle uitgevoerd', '2026-09-15 17:00:00'),
(50, 50, 1, '2026-11-20', 5.50, 'Design verbeteringen doorgevoerd', '2026-11-20 16:30:00');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `facturen`
--
ALTER TABLE `facturen`
  ADD CONSTRAINT `facturen_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `klanten` (`klanten_ID`),
  ADD CONSTRAINT `facturen_ibfk_2` FOREIGN KEY (`opdracht_id`) REFERENCES `opdrachten` (`opdracht_id`);

--
-- Beperkingen voor tabel `opdrachten`
--
ALTER TABLE `opdrachten`
  ADD CONSTRAINT `opdrachten_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `klanten` (`klanten_ID`);

--
-- Beperkingen voor tabel `werkzaamheden`
--
ALTER TABLE `werkzaamheden`
  ADD CONSTRAINT `werkzaamheden_ibfk_1` FOREIGN KEY (`medewerker_id`) REFERENCES `medewerkers` (`medewerker_id`),
  ADD CONSTRAINT `werkzaamheden_ibfk_2` FOREIGN KEY (`opdracht_id`) REFERENCES `opdrachten` (`opdracht_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

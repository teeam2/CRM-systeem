-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2026 at 10:22 AM
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
-- Database: `crm_systeem`
--

-- --------------------------------------------------------

--
-- Table structure for table `facturen`
--

CREATE TABLE `facturen` (
  `factuur_id` int(10) UNSIGNED NOT NULL,
  `klant_id` int(10) UNSIGNED NOT NULL,
  `opdracht_id` int(10) UNSIGNED NOT NULL,
  `factuurdatum` date NOT NULL,
  `totaalbedrag` decimal(10,2) NOT NULL,
  `status` enum('open','verzonden','betaald','te_laat') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facturen`
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
(50, 50, 50, '2026-07-24', 4180.00, 'open', '2026-06-09 08:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `klanten`
--

CREATE TABLE `klanten` (
  `klanten_ID` int(10) UNSIGNED NOT NULL,
  `Voornaam` varchar(100) DEFAULT NULL,
  `Tussenvoegsel` varchar(50) DEFAULT NULL,
  `Achternaam` varchar(100) DEFAULT NULL,
  `bedrijfsnaam` varchar(200) DEFAULT NULL,
  `functie` varchar(100) DEFAULT NULL,
  `email` text NOT NULL,
  `PhoneNumber` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `klanten`
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
(50, 'Laura', 'van', 'Dalen', 'SmartSolutions', 'Sales Representative', 'laura.vandalen@email.com', '0612345727');

-- --------------------------------------------------------

--
-- Table structure for table `medewerkers`
--

CREATE TABLE `medewerkers` (
  `medewerker_id` int(10) UNSIGNED NOT NULL,
  `voornaam` varchar(50) NOT NULL,
  `tussenvoegsel` varchar(20) DEFAULT NULL,
  `achternaam` varchar(50) NOT NULL,
  `functie` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `wachtwoord` varchar(255) NOT NULL,
  `telefoonnummer` varchar(20) DEFAULT NULL,
  `rol` enum('medewerker','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medewerkers`
--

INSERT INTO `medewerkers` (`medewerker_id`, `voornaam`, `tussenvoegsel`, `achternaam`, `functie`, `email`, `wachtwoord`, `telefoonnummer`, `rol`, `created_at`) VALUES
(1, 'Olaf', NULL, 'Kuijpers', 'Medewerker', 'olaf.kuijpers@gildedevops.nl', 'DevOlaf#21', '0621000001', 'medewerker', '2026-06-08 09:46:56'),
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
(50, 'Ilona', NULL, 'Hermsen', 'Medewerker', 'ilona.hermsen@gildedevops.nl', 'Ilona#73', '0621000050', 'medewerker', '2026-06-08 09:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `opdrachten`
--

CREATE TABLE `opdrachten` (
  `opdracht_id` int(10) UNSIGNED NOT NULL,
  `klant_id` int(10) UNSIGNED NOT NULL,
  `titel` varchar(100) NOT NULL,
  `beschrijving` text DEFAULT NULL,
  `status` enum('actief','afgerond','gefactureerd','betaald') DEFAULT 'actief',
  `uurprijs` decimal(10,2) NOT NULL,
  `startdatum` date DEFAULT NULL,
  `einddatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opdrachten`
--

INSERT INTO `opdrachten` (`opdracht_id`, `klant_id`, `titel`, `beschrijving`, `status`, `uurprijs`, `startdatum`, `einddatum`) VALUES
(1, 1, 'Website Redesign', 'Complete vernieuwing van bedrijfswebsite', 'actief', 85.00, '2026-01-10', '2026-04-15'),
(2, 2, 'CRM Implementatie', 'Nieuw CRM systeem implementeren', 'afgerond', 95.00, '2026-02-01', '2026-05-20'),
(3, 3, 'Mobile App Ontwikkeling', 'Bouwen van mobiele applicatie', 'actief', 105.00, '2026-03-12', '2026-08-01'),
(4, 4, 'Cloud Migratie', 'Migratie naar cloud omgeving', 'betaald', 120.00, '2025-11-01', '2026-02-01'),
(5, 5, 'Security Audit', 'Controle van beveiligingsmaatregelen', 'gefactureerd', 130.00, '2026-01-05', '2026-03-10'),
(6, 6, 'API Koppeling', 'Externe API integratie realiseren', 'actief', 92.50, '2026-04-01', '2026-06-15'),
(7, 7, 'Dashboard Ontwikkeling', 'Management dashboard bouwen', 'actief', 98.00, '2026-02-14', '2026-05-30'),
(8, 8, 'Database Optimalisatie', 'Performance verbeteren database', 'afgerond', 110.00, '2025-10-10', '2025-12-20'),
(9, 9, 'Server Onderhoud', 'Onderhoud productieservers', 'betaald', 88.00, '2026-01-01', '2026-01-31'),
(10, 10, 'Netwerk Upgrade', 'Moderniseren bedrijfsnetwerk', 'actief', 102.00, '2026-03-01', '2026-06-01'),
(11, 11, 'Webshop Ontwikkeling', 'Nieuwe webshop realiseren', 'actief', 115.00, '2026-01-20', '2026-07-01'),
(12, 12, 'Data Analyse', 'Analyse klantdata en rapportage', 'afgerond', 97.50, '2025-12-01', '2026-02-28'),
(13, 13, 'SEO Optimalisatie', 'Verbeteren zoekmachine resultaten', 'gefactureerd', 80.00, '2026-02-10', '2026-04-01'),
(14, 14, 'AI Chatbot Integratie', 'Slimme chatbot implementeren', 'actief', 125.00, '2026-03-15', '2026-07-15'),
(15, 15, 'VPN Configuratie', 'Veilige VPN toegang instellen', 'betaald', 89.00, '2025-09-01', '2025-10-01'),
(16, 16, 'Facturatie Systeem', 'Automatische facturatie bouwen', 'actief', 108.00, '2026-02-01', '2026-05-15'),
(17, 17, 'Backup Oplossing', 'Nieuwe backup infrastructuur', 'afgerond', 93.00, '2025-08-01', '2025-11-01'),
(18, 18, 'Microsoft 365 Migratie', 'Migratie naar Microsoft 365', 'betaald', 99.00, '2025-07-15', '2025-10-15'),
(19, 19, 'HR Portaal', 'Interne HR applicatie ontwikkelen', 'actief', 112.00, '2026-01-11', '2026-06-11'),
(20, 20, 'Performance Testing', 'Load testing uitvoeren', 'gefactureerd', 91.00, '2026-03-05', '2026-04-20'),
(21, 21, 'Klantportaal', 'Online klantomgeving ontwikkelen', 'actief', 118.00, '2026-02-18', '2026-08-01'),
(22, 22, 'Wifi Vernieuwing', 'Nieuwe zakelijke wifi omgeving', 'betaald', 86.00, '2025-10-01', '2025-11-20'),
(23, 23, 'Ticket Systeem', 'Helpdesk ticketsysteem bouwen', 'actief', 94.00, '2026-01-22', '2026-04-22'),
(24, 24, 'DevOps Automatisering', 'CI/CD pipelines implementeren', 'actief', 135.00, '2026-03-01', '2026-09-01'),
(25, 25, 'Pentest Uitvoering', 'Penetratietest uitvoeren', 'afgerond', 140.00, '2025-12-01', '2026-01-15'),
(26, 26, 'Hosting Migratie', 'Migratie webhosting omgeving', 'betaald', 84.00, '2025-06-01', '2025-08-01'),
(27, 27, 'BI Rapportages', 'Business intelligence dashboards', 'actief', 119.00, '2026-02-01', '2026-06-30'),
(28, 28, 'App Onderhoud', 'Onderhoud bestaande mobiele app', 'gefactureerd', 90.00, '2026-01-01', '2026-03-31'),
(29, 29, 'SSL Implementatie', 'SSL certificaten configureren', 'afgerond', 79.00, '2025-09-10', '2025-09-25'),
(30, 30, 'Frontend Redesign', 'Nieuwe frontend interface bouwen', 'actief', 101.00, '2026-04-01', '2026-08-15'),
(31, 31, 'E-mail Migratie', 'Zakelijke e-mail migreren', 'betaald', 87.00, '2025-05-01', '2025-06-15'),
(32, 32, 'Monitoring Systeem', 'Server monitoring implementeren', 'actief', 96.00, '2026-01-15', '2026-05-01'),
(33, 33, 'Container Platform', 'Docker omgeving bouwen', 'actief', 128.00, '2026-03-20', '2026-09-20'),
(34, 34, 'Identity Management', 'Gebruikersbeheer verbeteren', 'afgerond', 109.00, '2025-10-05', '2025-12-30'),
(35, 35, 'Systeem Integratie', 'Integratie bestaande systemen', 'gefactureerd', 117.00, '2026-02-10', '2026-05-25'),
(36, 36, 'Cloud Beveiliging', 'Cloud security verbeteren', 'actief', 132.00, '2026-01-12', '2026-07-12'),
(37, 37, 'Data Warehouse', 'Datawarehouse opzetten', 'actief', 145.00, '2026-03-01', '2026-10-01'),
(38, 38, 'Kassa Systeem', 'Digitaal kassasysteem ontwikkelen', 'betaald', 89.50, '2025-08-15', '2025-11-15'),
(39, 39, 'Printer Netwerk', 'Zakelijk printnetwerk configureren', 'afgerond', 76.00, '2025-07-01', '2025-07-20'),
(40, 40, 'Remote Werkplek', 'Thuiswerk infrastructuur', 'gefactureerd', 104.00, '2026-01-05', '2026-04-10'),
(41, 41, 'E-learning Platform', 'Online leeromgeving ontwikkelen', 'actief', 122.00, '2026-02-01', '2026-08-20'),
(42, 42, 'Firewall Configuratie', 'Netwerk firewall instellen', 'betaald', 95.50, '2025-09-01', '2025-10-10'),
(43, 43, 'ERP Koppeling', 'ERP software integratie', 'actief', 126.00, '2026-03-15', '2026-09-15'),
(44, 44, 'Chat Applicatie', 'Interne chatapplicatie bouwen', 'afgerond', 93.50, '2025-11-01', '2026-01-20'),
(45, 45, 'Digitale Handtekening', 'Ondertekening systeem bouwen', 'gefactureerd', 88.50, '2026-02-01', '2026-04-30'),
(46, 46, 'Linux Migratie', 'Migratie naar Linux servers', 'actief', 138.00, '2026-04-01', '2026-10-01'),
(47, 47, 'Machine Learning Analyse', 'ML modellen ontwikkelen', 'actief', 150.00, '2026-03-10', '2026-11-01'),
(48, 48, 'Servicedesk Tool', 'Nieuwe servicedesk software', 'betaald', 92.00, '2025-10-10', '2025-12-15'),
(49, 49, 'Document Management', 'Documentbeheer systeem bouwen', 'afgerond', 111.00, '2025-12-01', '2026-03-01'),
(50, 50, 'Compliance Controle', 'AVG compliance controle uitvoeren', 'gefactureerd', 124.00, '2026-01-25', '2026-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `werkzaamheden`
--

CREATE TABLE `werkzaamheden` (
  `werkzaamheid_id` int(10) UNSIGNED NOT NULL,
  `medewerker_id` int(10) UNSIGNED NOT NULL,
  `opdracht_id` int(10) UNSIGNED NOT NULL,
  `datum` date NOT NULL,
  `aantal_uren` decimal(5,2) NOT NULL,
  `omschrijving` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `werkzaamheden`
--

INSERT INTO `werkzaamheden` (`werkzaamheid_id`, `medewerker_id`, `opdracht_id`, `datum`, `aantal_uren`, `omschrijving`, `created_at`) VALUES
(1, 1, 2, '2026-06-01', 6.50, 'Backend functionaliteiten ontwikkeld', '2026-06-09 07:46:22'),
(2, 2, 1, '2026-06-01', 4.00, 'Klantoverleg gevoerd over requirements', '2026-06-09 07:46:22'),
(3, 3, 4, '2026-06-02', 7.50, 'Projectplanning gecontroleerd', '2026-06-09 07:46:22'),
(4, 4, 3, '2026-06-02', 5.00, 'Frontend componenten gebouwd', '2026-06-09 07:46:22'),
(5, 5, 6, '2026-06-03', 8.00, 'API koppeling gerealiseerd', '2026-06-09 07:46:22'),
(6, 6, 7, '2026-06-03', 3.50, 'Sales presentatie voorbereid', '2026-06-09 07:46:22'),
(7, 7, 8, '2026-06-04', 6.00, 'Database queries geoptimaliseerd', '2026-06-09 07:46:22'),
(8, 8, 9, '2026-06-04', 4.50, 'Bugfixes uitgevoerd', '2026-06-09 07:46:22'),
(9, 9, 10, '2026-06-05', 7.00, 'Teammeeting geleid', '2026-06-09 07:46:22'),
(10, 10, 11, '2026-06-05', 5.50, 'Webshop functionaliteit toegevoegd', '2026-06-09 07:46:22'),
(11, 11, 12, '2026-06-06', 6.50, 'Rapportage systeem ontwikkeld', '2026-06-09 07:46:22'),
(12, 12, 13, '2026-06-06', 4.00, 'SEO instellingen aangepast', '2026-06-09 07:46:22'),
(13, 13, 14, '2026-06-07', 7.50, 'Nieuwe AI features getest', '2026-06-09 07:46:22'),
(14, 14, 15, '2026-06-07', 5.00, 'VPN configuratie uitgevoerd', '2026-06-09 07:46:22'),
(15, 15, 16, '2026-06-08', 8.00, 'Facturatieproces gecontroleerd', '2026-06-09 07:46:22'),
(16, 16, 17, '2026-06-08', 3.50, 'Backup systeem bijgewerkt', '2026-06-09 07:46:22'),
(17, 17, 18, '2026-06-09', 6.00, 'Microsoft accounts gemigreerd', '2026-06-09 07:46:22'),
(18, 18, 19, '2026-06-09', 4.50, 'Klantcontact onderhouden', '2026-06-09 07:46:22'),
(19, 19, 20, '2026-06-10', 7.00, 'Load testing uitgevoerd', '2026-06-09 07:46:22'),
(20, 20, 21, '2026-06-10', 5.50, 'Klantportaal verbeterd', '2026-06-09 07:46:22'),
(21, 21, 22, '2026-06-11', 6.50, 'Wifi netwerk ingesteld', '2026-06-09 07:46:22'),
(22, 22, 23, '2026-06-11', 4.00, 'Ticket systeem uitgebreid', '2026-06-09 07:46:22'),
(23, 23, 24, '2026-06-12', 7.50, 'CI/CD pipeline gebouwd', '2026-06-09 07:46:22'),
(24, 24, 25, '2026-06-12', 5.00, 'Security kwetsbaarheden onderzocht', '2026-06-09 07:46:22'),
(25, 25, 26, '2026-06-13', 8.00, 'Hosting omgeving verhuisd', '2026-06-09 07:46:22'),
(26, 26, 27, '2026-06-13', 3.50, 'BI dashboards ontworpen', '2026-06-09 07:46:22'),
(27, 27, 28, '2026-06-14', 6.00, 'Mobiele app onderhouden', '2026-06-09 07:46:22'),
(28, 28, 29, '2026-06-14', 4.50, 'SSL certificaten vernieuwd', '2026-06-09 07:46:22'),
(29, 29, 30, '2026-06-15', 7.00, 'Frontend redesign besproken', '2026-06-09 07:46:22'),
(30, 30, 31, '2026-06-15', 5.50, 'E-mail migratie getest', '2026-06-09 07:46:22'),
(31, 31, 32, '2026-06-16', 6.50, 'Monitoring alerts ingesteld', '2026-06-09 07:46:22'),
(32, 32, 33, '2026-06-16', 4.00, 'Docker containers ingericht', '2026-06-09 07:46:22'),
(33, 33, 34, '2026-06-17', 7.50, 'Identity management verbeterd', '2026-06-09 07:46:22'),
(34, 34, 35, '2026-06-17', 5.00, 'Systeemintegraties getest', '2026-06-09 07:46:22'),
(35, 35, 36, '2026-06-18', 8.00, 'Cloud beveiliging gecontroleerd', '2026-06-09 07:46:22'),
(36, 36, 37, '2026-06-18', 3.50, 'Datawarehouse tabellen ingericht', '2026-06-09 07:46:22'),
(37, 37, 38, '2026-06-19', 6.00, 'Kassasysteem geconfigureerd', '2026-06-09 07:46:22'),
(38, 38, 39, '2026-06-19', 4.50, 'Printers gekoppeld aan netwerk', '2026-06-09 07:46:22'),
(39, 39, 40, '2026-06-20', 7.00, 'Remote werkplekken getest', '2026-06-09 07:46:22'),
(40, 40, 41, '2026-06-20', 5.50, 'E-learning modules toegevoegd', '2026-06-09 07:46:22'),
(41, 41, 42, '2026-06-21', 6.50, 'Firewall regels aangepast', '2026-06-09 07:46:22'),
(42, 42, 43, '2026-06-21', 4.00, 'ERP koppelingen gebouwd', '2026-06-09 07:46:22'),
(43, 43, 44, '2026-06-22', 7.50, 'Chat applicatie getest', '2026-06-09 07:46:22'),
(44, 44, 45, '2026-06-22', 5.00, 'Digitale handtekening geïntegreerd', '2026-06-09 07:46:22'),
(45, 45, 46, '2026-06-23', 8.00, 'Linux servers gemigreerd', '2026-06-09 07:46:22'),
(46, 46, 47, '2026-06-23', 3.50, 'Machine learning model getraind', '2026-06-09 07:46:22'),
(47, 47, 48, '2026-06-24', 6.00, 'Servicedesk software ingericht', '2026-06-09 07:46:22'),
(48, 48, 49, '2026-06-24', 4.50, 'Documentbeheer getest', '2026-06-09 07:46:22'),
(49, 49, 50, '2026-06-25', 7.00, 'AVG compliance controle uitgevoerd', '2026-06-09 07:46:22'),
(50, 50, 1, '2026-06-25', 5.50, 'Design verbeteringen doorgevoerd', '2026-06-09 07:46:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facturen`
--
ALTER TABLE `facturen`
  ADD PRIMARY KEY (`factuur_id`),
  ADD KEY `klant_id` (`klant_id`),
  ADD KEY `opdracht_id` (`opdracht_id`);

--
-- Indexes for table `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`klanten_ID`);

--
-- Indexes for table `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`medewerker_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `opdrachten`
--
ALTER TABLE `opdrachten`
  ADD PRIMARY KEY (`opdracht_id`),
  ADD KEY `klant_id` (`klant_id`);

--
-- Indexes for table `werkzaamheden`
--
ALTER TABLE `werkzaamheden`
  ADD PRIMARY KEY (`werkzaamheid_id`),
  ADD KEY `medewerker_id` (`medewerker_id`),
  ADD KEY `opdracht_id` (`opdracht_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `facturen`
--
ALTER TABLE `facturen`
  MODIFY `factuur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `klanten`
--
ALTER TABLE `klanten`
  MODIFY `klanten_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `medewerker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `opdrachten`
--
ALTER TABLE `opdrachten`
  MODIFY `opdracht_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `werkzaamheden`
--
ALTER TABLE `werkzaamheden`
  MODIFY `werkzaamheid_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facturen`
--
ALTER TABLE `facturen`
  ADD CONSTRAINT `facturen_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `klanten` (`klanten_ID`),
  ADD CONSTRAINT `facturen_ibfk_2` FOREIGN KEY (`opdracht_id`) REFERENCES `opdrachten` (`opdracht_id`);

--
-- Constraints for table `opdrachten`
--
ALTER TABLE `opdrachten`
  ADD CONSTRAINT `opdrachten_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `klanten` (`klanten_ID`);

--
-- Constraints for table `werkzaamheden`
--
ALTER TABLE `werkzaamheden`
  ADD CONSTRAINT `werkzaamheden_ibfk_1` FOREIGN KEY (`medewerker_id`) REFERENCES `medewerkers` (`medewerker_id`),
  ADD CONSTRAINT `werkzaamheden_ibfk_2` FOREIGN KEY (`opdracht_id`) REFERENCES `opdrachten` (`opdracht_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Nov 2018 um 22:38
-- Server-Version: 10.1.21-MariaDB
-- PHP-Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `newfiary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

CREATE TABLE `benutzer` (
  `idbenutzer` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `benutzer`
--

INSERT INTO `benutzer` (`idbenutzer`, `username`, `email`, `password`, `roles`) VALUES
(5, 'admin', 'admin@fiary.com', '$2y$13$sxfUU5OZC/au2UKo/HdUD.o1HwILrjbQFW9lHQ6lBqyASx9p8H30G', 'a:0:{}'),
(6, 'user', 'user@fiary.com', '$2y$13$XKqYloH3PT6Mi5r0OgiAh.HMmNBeN7QS0L710cGdqWMTWNJBxm7yq', 'a:0:{}'),
(7, 'registered', 'registered@fiary.com', '$2y$13$j4DPHgNJ6Yj45jCY4sWeIe8F67WgHCedVainWY04GmN0MnsJ0Fo5a', 'a:0:{}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzart`
--

CREATE TABLE `einsatzart` (
  `ideinsatzart` int(10) UNSIGNED NOT NULL,
  `einsatzart_name` varchar(255) NOT NULL COMMENT 'lookup für logbuch.unterkategorie abhängig von logbuch.kategorie=einsatz'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `einsatzart`
--

INSERT INTO `einsatzart` (`ideinsatzart`, `einsatzart_name`) VALUES
(1, 'Brandeinsatz'),
(2, 'Technischer Einsatz'),
(3, 'Schadstoffeinsatz');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fahrzeug`
--

CREATE TABLE `fahrzeug` (
  `idfahrzeug` int(10) UNSIGNED NOT NULL,
  `fahrzeugart` varchar(255) NOT NULL,
  `fahrzeugbezeichnung` varchar(255) NOT NULL,
  `gesamtkilometer` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fahrzeug`
--

INSERT INTO `fahrzeug` (`idfahrzeug`, `fahrzeugart`, `fahrzeugbezeichnung`, `gesamtkilometer`) VALUES
(1, 'KDO', 'Kommandofahrzeug', NULL),
(2, 'HLF', '', NULL),
(3, 'VF', '', NULL),
(4, 'LFAB', '', NULL),
(5, 'privat', '', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fahrzeugbesatzung`
--

CREATE TABLE `fahrzeugbesatzung` (
  `idlogbuch_logbuch` int(10) UNSIGNED NOT NULL,
  `idfahrzeug_fahrzeug` int(10) UNSIGNED NOT NULL,
  `idmitglieder_mitglieder` int(10) UNSIGNED NOT NULL,
  `rolle` varchar(255) NOT NULL,
  `atemschutz` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feed`
--

CREATE TABLE `feed` (
  `idfeed` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `feed` longtext NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `feed`
--

INSERT INTO `feed` (`idfeed`, `title`, `feed`, `date`) VALUES
(1, 'Neues Feuerwehrauto!', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '2018-11-20'),
(3, 'Neuigkeit im FF HAUS', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam', '2018-11-20'),
(4, 'Problem', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam', '2018-11-20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `idcategory` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL COMMENT 'lookup für logbuch.kategorie'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`idcategory`, `category_name`) VALUES
(1, 'Einsatz'),
(2, 'Übung'),
(3, 'Tätigkeit');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logbuch`
--

CREATE TABLE `logbuch` (
  `idlogbuch` int(11) UNSIGNED NOT NULL,
  `kategorie` varchar(255) NOT NULL,
  `unterkategorie` varchar(255) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `alarmzeit` datetime NOT NULL,
  `anforderer_name` varchar(255) NOT NULL,
  `anforderer_telefon_nr` varchar(255) NOT NULL,
  `beginn_datum` date NOT NULL,
  `beginn_zeit` time NOT NULL,
  `ende_datum` date NOT NULL,
  `ende_zeit` time NOT NULL,
  `plz` int(11) NOT NULL,
  `ort` varchar(255) NOT NULL,
  `straße` varchar(255) NOT NULL,
  `hausnummer` varchar(255) NOT NULL,
  `betriebsmittel` varchar(255) NOT NULL,
  `bericht` longtext NOT NULL,
  `wetter` varchar(255) DEFAULT NULL,
  `bodenbeschaffenheit` varchar(255) DEFAULT NULL,
  `notizen` longtext NOT NULL,
  `idbenutzer_benutzer` int(10) UNSIGNED NOT NULL,
  `metadata` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logbuch`
--

INSERT INTO `logbuch` (`idlogbuch`, `kategorie`, `unterkategorie`, `beschreibung`, `alarmzeit`, `anforderer_name`, `anforderer_telefon_nr`, `beginn_datum`, `beginn_zeit`, `ende_datum`, `ende_zeit`, `plz`, `ort`, `straße`, `hausnummer`, `betriebsmittel`, `bericht`, `wetter`, `bodenbeschaffenheit`, `notizen`, `idbenutzer_benutzer`, `metadata`) VALUES
(1, 'einsatz', 'brandeinsatz', 'es hat gebrannt', '2018-10-10 08:08:39', 'unbekannt', 'unterdrückt', '2018-10-11', '00:00:00', '2018-10-09', '00:00:00', 4232, 'Hagenberg', 'Softwarepark', '11', 'viele', 'nix passirt', '{\"Sonne\":\"1\", \"Nebel\":0} für alle Wetterbedingungen mit 0 bzw 1 abspeicher und das heißt hakerl gesetzt oder nicht', 'siehe wetter', 'irgendwas', 1, '2018-11-16 22:01:18');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitglieder`
--

CREATE TABLE `mitglieder` (
  `idmitglieder` int(10) UNSIGNED NOT NULL,
  `standesbuchnummer` int(11) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `dienstgrad` varchar(255) NOT NULL,
  `mobil` varchar(255) DEFAULT NULL,
  `telefon_nr` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `atemschutztauglich` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mitglieder`
--

INSERT INTO `mitglieder` (`idmitglieder`, `standesbuchnummer`, `nachname`, `vorname`, `dienstgrad`, `mobil`, `telefon_nr`, `email`, `atemschutztauglich`) VALUES
(0, 43, 'Aigner', 'Arnold', 'BM', '0650 7201249', '', 'a.aigner@kreativmoebel.com', 1),
(2, 15, 'Aigner', 'Lukas', 'LM', '0650 4062067', '', 'lukas-aigner@hotmail.com', 1),
(3, 2, 'Bachner', 'Otto', 'EOBI', '0699 10206635', '', 'otto.bachner@aon.at', 0),
(4, 47, 'Bichler', 'Wolfgang', 'LM', '0650 9326842', '', '', 1),
(5, 118, 'Böhm', 'Paul', 'FARZT', '', '07476 8200', '', 0),
(6, 89, 'Büringer', 'Josef jun.', 'OV', '0681 10789924', '07472 6054187', '', 0),
(7, 30, 'Daissl', 'Benjamin', 'OFM', '0664 2100477', '', '', 1),
(8, 12, 'Daissl', 'Hermann', 'ASB', '0664 2656488', '07476 8341', 'hermann.daissl@gmx.at', 1),
(9, 124, 'Ebner', 'Martin', 'LM', '0664 73488440', '07476 8463', '', 0),
(10, 39, 'Edermayer', 'Daniel', 'SB', '0650 3544556', '07476 8114', 'danieledermayer@yahoo.de', 1),
(11, 65, 'Edermayer', 'Gerald', 'VM', '0650 3707751', '07476 8114', '', 1),
(12, 95, 'Edermayer', 'Leopold', 'EHLM', '0664 73616432', '07476 8114', '', 0),
(13, 28, 'Edermayr', 'Karl', 'LM', '0664 9221000', '07476 8225', '', 0),
(14, 46, 'Fischer', 'Peter', 'LM', '0664 1624741', '', '', 0),
(15, 10, 'Fischer', 'Peter jun.', 'FM', '0660 1496266', '', '', 1),
(16, 20, 'Gruber', 'Alois jun.', 'ASB', '0676 3042086', '', 'gruber_alois@aon.at', 1),
(17, 61, 'Gruber', 'Alois sen.', 'HFM', '', '07476 8246', '', 0),
(18, 31, 'Gruber', 'Harald', 'LM', '0676 7062340', '', '', 0),
(19, 27, 'Gruber', 'Markus', 'LM', '0664 5446911', '', 'markusgruber2@gmx.at', 1),
(20, 6, 'Grubhofer', 'Johannes', 'FM', '0660 4154142', '', '', 0),
(21, 119, 'Gugler-Stöger', 'Franz', 'HLM', '0650 5757445', '07476 76226', '', 0),
(22, 77, 'Günther', 'Andreas', 'LM', '0676 3220065', '', '', 1),
(23, 23, 'Günther', 'Bernhard', 'PFM', '0650 4464099', '', '', 0),
(24, 32, 'Günther', 'Christian', 'FM', '0664 9178746', '', '', 0),
(25, 87, 'Günther', 'Josef', 'EBM', '0664 4875886', '07448 2922', '', 0),
(26, 24, 'Günther', 'Martin', 'FM', '0676 6905121', '', '', 0),
(27, 8, 'Heiden', 'Sebastian', 'FM', '0664 73645897', '', '', 0),
(28, 19, 'Hochbichler', 'Karl', 'EHLM', '', '07476 8468 ', '', 0),
(29, 44, 'Hochbichler', 'Johannes', 'FM', '0664 1248086', '', '', 1),
(30, 35, 'Hochstöger', 'Manuel', 'HFM', '0676 5703522', '', '', 0),
(31, 62, 'Hochstöger', 'Rupert', 'EHBI', '0650 2671948', '', '', 0),
(32, 68, 'Hofschwaiger', 'Christian', 'OFM', '0676 9312008', '', '', 1),
(33, 22, 'Hofschwaiger', 'Jakob', 'SB', '0650 9979409', '', 'jakobhofschwaiger@gmx.net', 1),
(34, 104, 'Hofschwaiger', 'Josef', 'HLM', '0676 9044113', '07476 8127', '', 0),
(35, 38, 'Hofschwaiger', 'Philip', 'SB', '0650 9979426', '', '', 1),
(36, 45, 'Hofschwaiger', 'Michael', 'SB', '0676 83683557', '', 'hofi4@gmx.at', 1),
(37, 78, 'Hölzl', 'Johann', 'LM', '0681 20130472', '', '', 0),
(38, 14, 'Kaltenböck', 'Bernhard', 'SB', '0676 6255022', '07476 8461', '', 1),
(39, 16, 'Kaltenböck', 'Ulrich', 'FM', '0664 73676517', '', '', 1),
(40, 52, 'Kammerhofer', 'Anton', 'EOBI', '0676 7927894', '07476 8364', '', 0),
(41, 5, 'Kammerhofer', 'Christian', 'OLM', '0650 6265168', '', '', 1),
(42, 34, 'Kammerhofer', 'Friedrich', 'HLM', '0676 3398420', '07476 8485', '', 1),
(43, 41, 'Kapeller', 'Bettina', 'SB', '0676 3739420', '', '', 1),
(44, 25, 'Kirchweger', 'Helmut', 'OFM', '0676 3852977', '', '', 1),
(45, 123, 'Kirchweger', 'Johann', 'LM', '0676 7061551', '', '', 0),
(46, 17, 'Kirchweger', 'Josef', 'HFM', ' ', '', '', 0),
(47, 83, 'Korizek', 'Wolfgang', 'HFM', '0664 9786149', '', '', 0),
(48, 72, 'Kranl', 'Leopold', 'LM', '0660 4720709', '', '', 0),
(49, 75, 'Leitner', 'Bernhard', 'BM', '0650 4343353', '', 'leitner.berni@gmail.com', 1),
(50, 49, 'Leitner', 'Gregor', 'LM', '0650 7526088', '', 'leitnergregor@gmail.com', 1),
(51, 74, 'Leitner', 'Stefan', 'SB', '0680 2478075', '', 'stefan.leitner5@gmx.at', 1),
(52, 120, 'Maderthaner', 'Leopold', 'EV', '0681 10441592', '07476 8154', 'ff.biberbach@aon.at', 0),
(53, 106, 'Maurerlehner', 'Hermann', 'HFM', '0664 73569420', '', '', 0),
(54, 99, 'Maurerlehner', 'Johannes', 'EHLM', '0699 13289711', '', 'johannes.maurerlehner@rk-amstetten.at', 0),
(55, 98, 'Neudorfer', 'Alois', 'HFM', '0676 5418026', '', '', 0),
(56, 37, 'Neudorfer', 'Christian', 'SB', '0664 5169484', '', '', 1),
(57, 1, 'Neudorfer', 'Ernst', 'EHBI', '0676 9065669', '', '', 0),
(58, 63, 'Neudorfer', 'Franz', 'EOV', '0664 5988881', '07476 8352', '', 0),
(59, 40, 'Poxhofer', 'Thomas', 'LM', '0676 9005548', '', '', 0),
(60, 4, 'Radl', 'Martin', 'SB', '0664 8446936', '', 'martinradl@gmx.at', 1),
(61, 67, 'Ramsauer', 'Gerald', 'OFM', '0676 5301988', '', '', 1),
(62, 42, 'Ramsauer', 'Franz', 'EHLM', '', '07476 8334 ', '', 0),
(63, 11, 'Ramsauer', 'Nikolaus', 'FM', '0650 9902642', '', '', 1),
(64, 54, 'Rittmannsberger', 'Michael', 'HFM', '0650 5566444', '', '', 0),
(65, 9, 'Russmayr', 'Stefan', 'EBI', '', '07476 8372 ', '', 0),
(66, 33, 'Russmayr', 'Stefan', 'HFM', '0676 6226233', '', '', 0),
(67, 117, 'Schäffer', 'Franz', 'BM', '0676 6201707', '', '', 0),
(68, 55, 'Schlögelhofer', 'Gottfried', 'LM', '0676 9347380', '', '', 0),
(69, 36, 'Schlöglhofer', 'Gerhard', 'EOLM', '0676 5446003', '07476 8428', '', 0),
(70, 125, 'Schmidt', 'Anton', 'HFM', '0664 73151402', '', '', 0),
(71, 96, 'Schmidt', 'Josef', 'EOLMV', '0664 73453202', '', '', 0),
(72, 48, 'Schmidt', 'Georg', 'FM', '0650 7475446', '', '', 1),
(73, 85, 'Simmer', 'Johann', 'EHBI', '0664 3445522', '', 'j.simmer@gmx.at', 0),
(74, 3, 'Simmer', 'Johannes', 'V', '0681 10286937', '', '', 1),
(75, 18, 'Simmer', 'Martin', 'OBI', '0664 88227020', '', 'martin.simmer@feuerwehr.gv.at', 1),
(76, 58, 'Simmer', 'Michael', 'BM', '0664 88744243', '', '', 1),
(77, 103, 'Strohmayr', 'Werner', 'LM', '0664 6179463', '', '', 0),
(78, 29, 'Theuerkauf', 'Erich', 'HBI', '0676 86156565', '', 'erich.theuerkauf@feuerwehr.gv.at', 1),
(79, 53, 'Wagner', 'Johann', 'EHBM', '0676 6858864', '07476 8270', '', 0),
(80, 26, 'Wasserthal', 'Simon', 'FM', '0680 2138412', '', '', 1),
(81, 21, 'Wieser', 'Franz', 'HFM', '0650 4359652', '', '', 0),
(82, 7, 'Zeitlhofer', 'Thomas', 'LM', '0680 1217021', '', 'thomas.zeitlhofer@gmx.at', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rolle`
--

CREATE TABLE `rolle` (
  `idrolle` int(11) NOT NULL,
  `rollenname` varchar(255) NOT NULL COMMENT 'lookup für fahrzeugbesatzung.rolle'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `rolle`
--

INSERT INTO `rolle` (`idrolle`, `rollenname`) VALUES
(1, 'Einsatzleiter'),
(2, 'Lenker'),
(3, 'Gruppenkommandant'),
(4, 'Maschinist');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungsart`
--

CREATE TABLE `uebungsart` (
  `iduebungsart` int(10) UNSIGNED NOT NULL,
  `uebungsname` varchar(255) NOT NULL COMMENT 'lookup für logbuch.unterkategorie abhängig von logbuch.kategorie=übung',
  `gesamtzeit` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `uebungsart`
--

INSERT INTO `uebungsart` (`iduebungsart`, `uebungsname`, `gesamtzeit`) VALUES
(1, 'Atemschutzübung', '0.00'),
(2, 'Gesamtübung', '0.00'),
(3, 'Bewerbsübung', '0.00'),
(4, 'Übungsfahrt', '0.00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `benutzer`
--
ALTER TABLE `benutzer`
  ADD PRIMARY KEY (`idbenutzer`),
  ADD UNIQUE KEY `UNIQ_36144FC7E7927C74` (`email`);

--
-- Indizes für die Tabelle `einsatzart`
--
ALTER TABLE `einsatzart`
  ADD PRIMARY KEY (`ideinsatzart`);

--
-- Indizes für die Tabelle `fahrzeug`
--
ALTER TABLE `fahrzeug`
  ADD PRIMARY KEY (`idfahrzeug`);

--
-- Indizes für die Tabelle `fahrzeugbesatzung`
--
ALTER TABLE `fahrzeugbesatzung`
  ADD PRIMARY KEY (`idlogbuch_logbuch`,`idfahrzeug_fahrzeug`,`idmitglieder_mitglieder`),
  ADD KEY `idlogbuch_logbuch` (`idlogbuch_logbuch`),
  ADD KEY `idfahrzeug_fahrzeug` (`idfahrzeug_fahrzeug`),
  ADD KEY `idmitglieder_mitglieder` (`idmitglieder_mitglieder`);

--
-- Indizes für die Tabelle `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`idfeed`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`idcategory`);

--
-- Indizes für die Tabelle `logbuch`
--
ALTER TABLE `logbuch`
  ADD PRIMARY KEY (`idlogbuch`),
  ADD KEY `idbenutzer_benutzer` (`idbenutzer_benutzer`);

--
-- Indizes für die Tabelle `mitglieder`
--
ALTER TABLE `mitglieder`
  ADD PRIMARY KEY (`idmitglieder`);

--
-- Indizes für die Tabelle `rolle`
--
ALTER TABLE `rolle`
  ADD PRIMARY KEY (`idrolle`);

--
-- Indizes für die Tabelle `uebungsart`
--
ALTER TABLE `uebungsart`
  ADD PRIMARY KEY (`iduebungsart`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `benutzer`
--
ALTER TABLE `benutzer`
  MODIFY `idbenutzer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `einsatzart`
--
ALTER TABLE `einsatzart`
  MODIFY `ideinsatzart` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `fahrzeug`
--
ALTER TABLE `fahrzeug`
  MODIFY `idfahrzeug` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `feed`
--
ALTER TABLE `feed`
  MODIFY `idfeed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `idcategory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `logbuch`
--
ALTER TABLE `logbuch`
  MODIFY `idlogbuch` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `rolle`
--
ALTER TABLE `rolle`
  MODIFY `idrolle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `uebungsart`
--
ALTER TABLE `uebungsart`
  MODIFY `iduebungsart` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

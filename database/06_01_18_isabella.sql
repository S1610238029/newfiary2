-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Jan 2019 um 22:50
-- Server-Version: 10.1.35-MariaDB
-- PHP-Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `fiary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

CREATE TABLE `benutzer` (
  `idbenutzer` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `benutzer`
--

INSERT INTO `benutzer` (`idbenutzer`, `username`, `firstname`, `lastname`, `email`, `password`, `roles`) VALUES
(5, 'admin', 'Birgit', 'Haselmayr', 'admin@fiary.com', '$2y$13$sxfUU5OZC/au2UKo/HdUD.o1HwILrjbQFW9lHQ6lBqyASx9p8H30G', 'a:0:{}'),
(6, 'user', '', '', 'user@fiary.com', '$2y$13$XKqYloH3PT6Mi5r0OgiAh.HMmNBeN7QS0L710cGdqWMTWNJBxm7yq', 'a:0:{}'),
(7, 'registered', '', '', 'registered@fiary.com', '$2y$13$j4DPHgNJ6Yj45jCY4sWeIe8F67WgHCedVainWY04GmN0MnsJ0Fo5a', 'a:0:{}'),
(8, 'hansi', 'Hans', 'Pe', 'ha@pe.com', '$2y$13$G1o.LJRcIKi2Gt0dmQfO5ufaMMxaW2dMGmjDmeitLVLOpFFO680FG', 'a:0:{}'),
(16, 'test', 'Hallo', 'Du', 'test@me.com', '$2y$13$t6Wm/EjycKP0eUwBoQgk7.ocG1cqIGdQHylU4NQvfu9Hx/NzziJ9m', 'a:0:{}'),
(17, 'isabella', 'Isabella', 'Molterer', 'isabella.molterer@gmail.com', '$2y$13$sixkwqBhUIBpx/CM.SxwduDQVnVGe.HXYJAySLC1I/vsnFcnIJz8.', 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');

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
  `idfahrzeugbesatzung` int(11) UNSIGNED NOT NULL,
  `idlogbuch_logbuch` int(10) UNSIGNED NOT NULL,
  `idfahrzeug_fahrzeug` int(10) UNSIGNED NOT NULL,
  `idmitglieder_mitglieder` int(10) UNSIGNED NOT NULL,
  `rolle` varchar(255) NOT NULL,
  `atemschutz` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fahrzeugbesatzung`
--

INSERT INTO `fahrzeugbesatzung` (`idfahrzeugbesatzung`, `idlogbuch_logbuch`, `idfahrzeug_fahrzeug`, `idmitglieder_mitglieder`, `rolle`, `atemschutz`) VALUES
(7, 30, 5, 6, '4', 1),
(8, 31, 5, 6, '4', 1),
(9, 32, 5, 6, '4', 1),
(10, 38, 5, 6, '4', 1),
(11, 42, 5, 6, '4', 1),
(12, 43, 5, 6, '4', 1);

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
(4, 'Problem', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam', '2018-11-20'),
(5, 'Test für Homepage', 'Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that\'s what you see at a toy store. And you must think you\'re in a toy store, because you\'re here shopping for an infant named Jeb.', '2018-11-28');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `haeuserliste`
--

CREATE TABLE `haeuserliste` (
  `idhaus` int(11) NOT NULL,
  `strasse` varchar(255) DEFAULT NULL,
  `hausNr` varchar(255) DEFAULT NULL,
  `bewohner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `haeuserliste`
--

INSERT INTO `haeuserliste` (`idhaus`, `strasse`, `hausNr`, `bewohner`) VALUES
(1, 'Adersdorf', '115', 'R8O8bnRoZXIgRnJhbno='),
(2, 'Adersdorf', '116', 'ZHp0LiB1bmJld29obnQsIFBmYWZmZW5iaWNobGVyIEFsZnJlZA=='),
(3, 'Adersdorf', '117', 'WmVoZXRuZXIgQWRhbGJlcnQgdS4gUm9zYSAvIFplaGV0bmVyIEhhcmFsZCB1LiBTdGFuZ2wgU2lsdmlh'),
(4, 'Adersdorf', '118/1', 'WmVoZXRuZXIgRnJhbno='),
(5, 'Adersdorf', '118/2', 'V2FnbmVyIENocmlzdGlhbiB1LiBFdmE='),
(6, 'Adersdorf', '119', 'S3JvbmJlcmdlciBNYXJ0aW4gdS4gQmFyYmFyYQ=='),
(7, 'Adersdorf', '120', 'RnVydGxlaG5lciBDaHJpc3RhIChOV1Mp'),
(8, 'Adersdorf', '121/1', 'U3RvY2tpbmdlciBLb25yYWQ='),
(9, 'Adersdorf', '121/2', 'UGZlaWZmZXIgTWFydGluIHUuIEJlcm5hZGV0dGU='),
(10, 'Adersdorf', '122/2', 'U8O8bmRob2ZlciBIZXJiZXJ0IHUuIE1hcmlh'),
(11, 'Adersdorf', '123', 'U2NoZWl0ZXIgUnVkb2xmIHUuIEFubmVtYXJpYSAvIFNjaGVpdGVyLVdhZ25lciBNYXRoaWFzIHUuIFN0ZXBoYW5pZQ=='),
(12, 'Adersdorf', '124/1', 'RWNrZXIgUm9tYW5h'),
(13, 'Adersdorf', '124/2', 'VGF0enJlaXRlciBDaHJpc3RpYW4gdS4gR3VkcnVu'),
(14, 'Adersdorf', '233', 'QWx0ZW5lZGVyIFJ1ZG9sZiB1LiBIYW5uZWxvcmU='),
(15, 'Adersdorf', '234', 'U3Ryw6R1w59sLVN0csOkdXNzbCBHZW9yZyB1LiBFbGlzYWJldGg='),
(16, 'Adersdorf', '267', 'UG96c2dhaSBMZW9wb2xkaW5l'),
(17, 'Adersdorf', '278', 'U2Nob3BmaGF1c2VyIFdlcm5lciB1LiBIZXJ0YQ=='),
(18, 'Adersdorf', '282', 'SGFzZWxzdGVpbmVyIEh1YmVydCwgSW5nLiB1LiBTdXNhbm5l'),
(19, 'Adersdorf', '339/1', 'TG9jaHRlIFVscmlrZSAoTldTKQ=='),
(20, 'Adersdorf', '339/2', 'R2FydGxlaG5lciBKb2hhbm4gdS4gRWRpdGg='),
(21, 'Adersdorf', '359', 'TGFtcGUgSW5ncmlkIC8gTMO8Y2sgQmlyZ2l0'),
(22, 'Adersdorf', '366/1', 'U2Nod2VpZ2h1YmVyIEpvaGFubiB1LiBNYXJpYQ=='),
(23, 'Adersdorf', '366/2', 'U3Blcm5lZGVyIFRob21hcyB1LiBJc2FiZWxsYQ=='),
(24, 'Adersdorf', '367/1', 'SMO2cmxlc2JlcmdlciBUaGVyZXNpYQ=='),
(25, 'Adersdorf', '367/2', 'SMO2cmxlc2JlcmdlciBGcmFueiAoTldTKQ=='),
(26, 'Adersdorf', '368', 'S3JvbmJlcmdlciBBbGZyZWQgdS4gTWFyZ2FyZXRl'),
(27, 'Adersdorf', '399/1', 'U8O8bmRob2ZlciBKb2hhbm4gdS4gQW5uYQ=='),
(28, 'Adersdorf', '399/2', 'U8O8bmRob2ZlciBNYXR0aGlhcw=='),
(29, 'Adersdorf', '404', 'R3J1YmVyIEJpcmdpdCB1LiBUaWthbCBQZXRlcg=='),
(30, 'Adersdorf', '421', 'S3JvcGYgSm9zZWYgdS4gQW5uYSAvIEJlcm5oYXJkIHUuIENvcm5lbGlh'),
(31, 'Adersdorf', '424', 'QnJlaXRlbmVkZXIgSGVsbXV0IHUuIENocmlzdGE='),
(32, 'Adersdorf', '432', 'SGlkYXNpIFBldGVyLCBERHIuIHUuIEthdGhlcmluYSwgRERyLg=='),
(33, 'Adersdorf', '448/1', 'RnVjaHMgS2FybCB1LiBDaHJpc3RpbmU='),
(34, 'Adersdorf', '448/2', 'S2FtbWVyaG9mZXIgRnJhbnogdS4gSWxvbmE='),
(35, 'Adersdorf', '554', 'WmVoZXRuZXIgQWRhbGJlcnQgdS4gUmVuYXRl'),
(36, 'Adersdorf', '575', 'QWlnbmVyIEFuZHJlYXMgdS4gQW5uZW1hcmlh'),
(37, 'Adersdorf', '584', 'R2FydGxlaG5lciBKw7xyZ2VuLCBESSAoRkgpIHUuIFNhbmRyYQ=='),
(38, 'Adersdorf', '600', 'SG9semVyIEFuZHJlYXMgdS4gQnJpZ2l0dGU='),
(39, 'Adersdorf', '601', 'QmF5ZXIgTWFydGluIHUuIEthdGhyaW4='),
(40, 'Adersdorf', '602', 'TWFnLiBNb3N0YsO2Y2sgVGFuamE='),
(41, 'Adersdorf', '603', 'U3Ryw6R1w59sLVN0csOkdXNzbCBNaWNoYWVsIHUuIE5pbmEgLSBpbiBCYXU='),
(42, 'Adersdorf', '606', 'TGVpdG5lciBGcmllZHJpY2g='),
(43, 'Adersdorf', '607', 'SnVuZ3dpcnRoIEJldHRpbmE='),
(44, 'Adersdorf', '608', 'SGlydGwgR2VyaGFyZCAtIGluIEJhdQ=='),
(45, 'Adersdorf', '609', 'QmF1ZXIgUmVpbmhhcmQsIE1hZy4gdS4gU3RhbmlzaSBEYW5pZWxhLCBNYWcu'),
(46, 'Am Bach', '460', 'RGllbWluZ2VyIExlb3BvbGQgdS4gQW5kcmVh'),
(47, 'Am Bach', '462', 'U2NoYWNobmVyIFJ1ZG9sZiwgSW5zcC4gdS4gTWFudWVsYQ=='),
(48, 'Am Bach', '463', 'TWFkZXJ0aGFuZXIgR2Vybm90IHUuIFJvc2VtYXJpZQ=='),
(49, 'Am Bach', '464', 'Uml0dG1hbm5zYmVyZ2VyIEthcmwsIEluZy4gdS4gTWFyaWE='),
(50, 'Am Bach', '465', 'R3Jvw59hbGJlci1MaWNodGVuYmVyZ2VyIEhlaWRlIE1hcmlhIHUuIEdyb8OfYWxiZXIgTGVvcG9sZA=='),
(51, 'Am Bach', '466', 'w5ZyZMO2ZyBBbnRvbiB1LiBIaWxkZWdhcmQ='),
(52, 'Am Bach', '467', 'R8O8bnRoZXIgTW9uaWthIHUuIFN0ZWluYsO2Y2sgR2VyaGFyZA=='),
(53, 'Am Bach', '468', 'VGhldWVya2F1ZiBDaHJpc3RpYW4gdS4gTWFyaWE='),
(54, 'Am Bach', '469', 'QmFjaG5lciBSb2JpbiB1LiBBbm5pa2E='),
(55, 'Am Bach', '470', 'SGFsbWljaCBNYXR0aGlhcyB1LiBIZWlnbCBNYXJpbmE='),
(56, 'Am Bach', '471', 'S2FwZWxsZXIgS3VuaWd1bmRl'),
(57, 'Am Bach', '472', 'UGVoYW0gR2VyaGFyZCB1LiBNYXJpb24='),
(58, 'Am Bach', '473', 'U2NobmVsbGVyIEFuZHJlYXMgLyBTY2huZWxsZXIgUGhpbGlwcCB1LiBUZXVmZWwgTWljaGFlbGE='),
(59, 'Am Bach', '555', 'S2llc2xpbmcgVWxyaWNo'),
(60, 'Am Bach', '556', 'QWxiYWkgUGV0cnUgdS4gQ2FtZWxpYQ=='),
(61, 'Am Bach', '557', 'Uml0dCBIdWJlcnQgdS4gQWxleGFuZHJh'),
(62, 'Am Bach', '558', 'QmF1ZXIgUmVpbmhhcmQsIERyLiB1LiBTaWxrZQ=='),
(63, 'Am Bach', '559', 'U2Now7ZyZ2h1YmVyIFdhbHRlciB1LiBBbmdlbGE='),
(64, 'Am Bach', '560', 'U2NobWlkdCBKb2hhbm5lcw=='),
(65, 'Am Bach', '597', 'R3J1YmJhdWVyIEpvaGFubiB1LiBCZXJnZXIgQWduZXM='),
(66, 'Am Bach', '598', 'V2l0emVsbmlnIFRob21hcywgREkgdS4gQmljaGxlciBBbmdlbGE='),
(67, 'Am Friesenberg', '308/1', 'U2Now7ZyZ2h1YmVyIFRoZXJlc2lh'),
(68, 'Am Friesenberg', '308/2', 'U2Now7ZyZ2h1YmVyIExlb3BvbGQgdS4gTWFyaWE='),
(69, 'Am Friesenberg', '336', 'UGZhZmZlbmVkZXIgTWFyZ2FyZXRh'),
(70, 'Am Friesenberg', '340/1', 'T3J0bmVyIFZlcm9uaWthIC8gRGFuaWVsYQ=='),
(71, 'Am Friesenberg', '346/1', 'T3J0bmVyIEVybmVzdGluZQ=='),
(72, 'Am Friesenberg', '346/2', 'ZHp0LiB1bmJld29obnQg'),
(73, 'Am Friesenberg', '356/1', 'U2NobmFibGVyIEFubmE='),
(74, 'Am Friesenberg', '356/2', 'U2NobmFibGVyIEV3YWxkIHUuIFdlaW5nYXJ0bmVyIE1vbmlrYQ=='),
(75, 'Am Friesenberg', '361', 'THVmdGVuc3RlaW5lciBBbm5lbWFyaWU='),
(76, 'Am Friesenberg', '363/1', 'QmxlaW5lciBNaWNoYWVsIHUuIFBlaWxzdGVpbmVyIFNpbGtl'),
(77, 'Am Friesenberg', '363/2', 'QmxlaW5lciBKb3NlZiB1LiBSZWdpbmE='),
(78, 'Am Friesenberg', '474', 'U2NobmVja2VubGVpdG5lciBGcmFueiB1LiBFdmE='),
(79, 'Am Hang', '275', 'Uml0dG1hbm5zYmVyZ2VyIE1pY2hhZWwgdS4gU2lncmlk'),
(80, 'Am Hang', '330/1', 'VGFuemVyIEhlcmJlcnQgdS4gSm9oYW5uYQ=='),
(81, 'Am Hang', '344/2', 'U3RyZWnDn2wgRnJhbnogdS4gTWFyaWE='),
(82, 'Am Hang', '344/3', 'U3RyZWnDn2wgTWFydGluIHUuIEFuZHJlYQ=='),
(83, 'Am Hang', '371', 'TWFkZXJ0aGFuZXIgTGVvcG9sZCB1LiBHZXJsaW5kZQ=='),
(84, 'Am Hang', '372', 'VmFyZ2EgRWRlbHRyYXV0'),
(85, 'Am Hang', '373', 'U3RhZGxlciBCcnVubw=='),
(86, 'Am Hang', '374', 'Uml0dG1hbm5zYmVyZ2VyIEPDpGNpbGlh'),
(87, 'Am Hang', '375', 'ZHp0LiB1bmJld29obnQg'),
(88, 'Am Hang', '376', 'WmVpbGluZ2VyIEfDvG50aGVyIHUuIELDvGhyaW5nZXIgSXJlbmU='),
(89, 'Am Hang', '377', 'S2FtbWVyaG9mZXIgS2FybCB1LiBDw6RjaWxpYQ=='),
(90, 'Am Hang', '378', 'QsO8cmluZ2VyIEZyYW56IHUuIEFudG9uaWEgLyBKb2hhbm5lcw=='),
(91, 'Am Hang', '379', 'VGxhY2JhYmEgTWFuZnJlZCB1LiBNYXJpYW5uZQ=='),
(92, 'Am Hang', '380', 'U2luZGh1YmVyIEZyYW56IHUuIE1hcmlh'),
(93, 'Am Hang', '381', 'U3RlaW5iaWNobGVyIEpvc2VmIC8gQ2hyaXN0aWFuIHUuIE1hcnRpbmE='),
(94, 'Am Hang', '382/1', 'SGFpZGVyIEhhbnMtRGlldGVyLyBXaWxoZWxtIHUuIEVsZnJpZWRl'),
(95, 'Am Hang', '382/2', 'UMO2bHpsIEVsZnJpZWRhICAgICAgICAg'),
(96, 'Am Hang', '383', 'SG9jaHN0w7ZnZXIgSm9oYW5uIHUuIENocmlzdGluZQ=='),
(97, 'Am Hang', '384', 'V8OkaGxhbXQ='),
(98, 'Am Hang', '385', 'TWlzdGxiYWNoZXIgTWFydGluIHUuIENocmlzdGE='),
(99, 'Am Hang', '386', 'TmllZGVyaGFtbWVyIEdlcmhhcmQgdS4gTGVvcG9sZGluZQ=='),
(100, 'Am Hang', '387', 'RG9yZmVyIEpvaGFubg=='),
(101, 'Am Hang', '388/1', 'TWFkZXJ0aGFuZXIgSm9oYW5uZXMgLyBKb2hhbm4gdS4gUm9zd2l0aGE='),
(102, 'Am Hang', '389', 'SmFnZXJzYmVyZ2VyIEtsYXVzIC8gS2Vyc3RpbiAvIEtsYXVkaWE='),
(103, 'Am Hang', '423', 'SGVpbGlnZW5icnVubmVyIEdlcmxpbmRl'),
(104, 'Am Hang', '434', 'U2llbWV0emJlcmdlciBNYXJpYQ=='),
(105, 'Am Hang', '439', 'QWlnbmVyIExlb3BvbGQgdS4gQW5pdGE='),
(106, 'Am Hang', '441', 'SG9mc2Nod2FpZ2VyIEpvc2VmIHUuIE1hcmdpdA=='),
(107, 'Am Hang', '442', 'UmllZGwgRnJhbnogdS4gQnJpZ2l0dGU='),
(108, 'Am Hang', '443', 'VGV1ZmwgSHViZXJ0IHUuIEJlcnRh'),
(109, 'Am Hang', '445', 'S25laWZlbCBIZWlkZS1NYXJpZQ=='),
(110, 'Am Hang', '446', 'UsO2c2VsIExlb3BvbGQgdS4gQW5nZWxh'),
(111, 'Am Hang', '447', 'RXRsaW5nZXIgRnJhbnosIFByb2YuIE1NYWcuSW5nLiB1LlN5bHZpYQ=='),
(112, 'Am Hang', '449', 'V2VpcyBLbGF1cyB1LiBSZW5hdGU='),
(113, 'Am Hang', '488', 'U2Now7ZyZ2h1YmVyIEpvc2VmIHUuIEJhcmJhcmE='),
(114, 'Am Hang', '498', 'SmVsZW56IEhlcmliZXJ0IHUuIFN1c2FubmU='),
(115, 'Am Hang', '500/1', 'ZHp0LiB1bmJld29obnQ='),
(116, 'Am Hang', '500/2', 'ZHp0LiB1bmJld29obnQ='),
(117, 'Am Hang', '500/3', 'RmVocmluZ2VyIEFubmEgdS4gT2Jlcm3DvGxsZXIgRGFuaWVs'),
(118, 'Am Hang', '500/4', 'U2Nod2VpZ2h1YmVyIENocmlzdGluZQ=='),
(119, 'Am Hang', '500/5', 'U2Nod2FuZGwgQ2hyaXN0aW5lIHUuIEdyw7xibGVyIEdlb3Jn'),
(120, 'Am Hang', '500/6', 'U2NoYWNoZXJtYXlyIE1hcmdpdA=='),
(121, 'Am Hang', '500/7', 'V2FnbmVyIE5pY29sZQ=='),
(122, 'Am Hang', '500/8', 'ZHp0LiB1bmJld29obnQ='),
(123, 'Am Hang', '500/9', 'R2Vyc3RtYXlyIEdlcmhhcmQ='),
(124, 'Am Hang', '500/10', 'V2FzaW5nZXIgSWxzZQ=='),
(125, 'Am Hang', '500/11', 'ZHp0LiB1bmJld29obnQ='),
(126, 'Am Hang', '500/12', 'SMO2bHpsIEVkZWx0cmF1ZA=='),
(127, 'Am Hang', '500/13', 'ZHp0LiB1bmJld29obnQ='),
(128, 'Am Hang', '500/14', 'VGh1cm5ob2ZlciBIZWlkZWxpbmRl'),
(129, 'Am Hang', '500/15', 'ZHp0LiB1bmJld29obnQ='),
(130, 'Am Hang', '500/16', 'ZHp0LiB1bmJld29obnQ='),
(131, 'Am Hang', '501', 'SG9sZGVyYmF1bSBEb21pbmlrIHUuIEjDvHJuZXIgTmljb2xl'),
(132, 'Am Hang', '503', 'S2Fsa2hvZmVyIFNpbHZpYQ=='),
(133, 'Am Hang', '506', 'UmF0emVzYmVyZ2VyLVNlaXRsaW5nZXIgTWFya3VzIHUuIEVsaXNhYmV0aA=='),
(134, 'Am Hang', '507', 'R8O8bnRoZXIgTWFydGluIHVuZCBCYXJiYXJh'),
(135, 'Am Kogl', '295/1', 'ZHp0LiB1bmJld29obnQsIFJpdHRtYW5uc2JlcmdlciBNYW5mcmVkIHUuIEVsaXNhYmV0aA=='),
(136, 'Am Kogl', '295/2', 'Uml0dG1hbm5zYmVyZ2VyIE1hcmN1cyB1LiBTcHJlaXR6ZXIgU2ltb25l'),
(137, 'Am Kogl', '451', 'R2FsYmF2eSBBcnRodXIgdS4gQ2hyaXN0aW5lIA=='),
(138, 'Am Kogl', '452', 'SG9mc2Nod2FpZ2VyIEJyaWdpdHRlIHUuIFNpbW1lciBKb2hhbm4='),
(139, 'Am Kogl', '453', 'R3Jvc3NlciBSZWluaGFyZCB1LiBQZXRyYQ=='),
(140, 'Am Kogl', '456', 'RnJldW5kbCBGcmllZHJpY2ggdS4gRWxmcmllZGUgLyBXYXNzZXJ0aGFsIFNpbW9uIHUuIFRoZXJlc2E='),
(141, 'Am Kogl', '457', 'UsO2Y2tsaW5nZXIgQWxvaXMgdS4gQW5kcmVh'),
(142, 'Am Kogl', '458', 'QWlnbmVyIEZyYW56'),
(143, 'Am Kogl', '459', 'U2NobWlkdCBNaWtlIHUuIENvbnN0YW56ZQ=='),
(144, 'Angerbauer', '68/1', 'RGllbWluZ2VyIEZyYW56IHUuIFBhdWxh'),
(145, 'Angerbauer', '68/2', 'RGllbWluZ2VyIEZyYW56IHUuIEJpYW5jYQ=='),
(146, 'Angerhof', '201/1', 'U2NobMO2Z2xob2ZlciBKb2hhbm4gdS4gRnJpZWRvbGluYQ=='),
(147, 'Angerhof', '201/2', 'U2NobMO2Z2xob2ZlciBBZGVsaGVpZCAvIEFuZHJlYSB1LiBFYm5lci1CcnVubmVyIE1hbnVlbA=='),
(148, 'Angerhof', '202', 'U2Now7ZyZ2h1YmVyIFBpdXMgdS4gRWxmcmllZGU='),
(149, 'Angerl', '46', 'ZHp0LiB1bmJld29obnQsIE1hdXJlcmxlaG5lciBIZXJtYW5u'),
(150, 'Angerl', '47/1', 'QXVlciBDaHJpc3RhIHUuIEpvc2Vm'),
(151, 'Angerl', '47/2', 'QXVlciBKb3NlZiAoTldTKQ=='),
(152, 'Angerl', '47/3', 'T2JlcmZvcnN0ZXIgRWxpc2FiZXRo'),
(153, 'Angerl', '47/4', 'QmllYmwgTWFydGlu'),
(154, 'Angerl', '47/5', 'U2NoaXJnaHViZXIgSHViZXJ0IHUuIFRoZXJlc2lh'),
(155, 'Angerl', '47/6', 'V3VyeiBTYWJpbmU='),
(156, 'Angerl', '47/7', 'R3J1YmVyIE1hcmt1cw=='),
(157, 'Angerl', '47/8', 'R2lsbGVyIExlb3BvbGQ='),
(158, 'Angerl', '47/9', 'UHVjaGJlcmdlciBMaXNh'),
(159, 'Angerl', '47/10', 'V2llc2VyIE1hcmt1cw=='),
(160, 'Angerl', '47/11', 'U3RlaW5kbCBNYW51ZWxh'),
(161, 'Angerl', '47/12', 'U2Now7ZyZ2h1YmVyIEFudG9u'),
(162, 'Angerl', '47/13', 'R3VyayBNYW5mcmVk'),
(163, 'Angerl', '48/1', 'Umllc2VuYmVyZ2VyIFN0ZWZhbiB1LiBFY2F0ZXJpbmE='),
(164, 'Au', '177', 'U2Vpc2VuYmFjaGVyIEZyYW56IHUuIEd1bnRoaWxkZSAvIEhlaWRlbiBIZWxtdXQgdS4gSGVydGE='),
(165, 'Au', '178', 'SMO2bHpsIEpvaGFubiB1LiBSZW5hdGUgLyBHZXJhbGQgdS4gU2FiaW5l'),
(166, 'Au', '179/1', 'ZHp0LiB1bmJld29obnQg'),
(167, 'Au', '179/2', 'T2Jlcm3DvGxsZXIgR2VyaGFyZCB1bmQgV2FsdHJhdWQ='),
(168, 'Au', '180/1', 'VG9tc2NoaSBTdGVmYW5pZQ=='),
(169, 'Au', '180/2', 'VG9tc2NoaSBIZXJiZXJ0IHUuIEF0emVuaG9mZXIgRGFnbWFy'),
(170, 'Au', '249', 'RGFsbG5lciBHw7xudGhlciB1LiBMZW9wb2xkaW5l'),
(171, 'Au', '254', 'UHV0dGVyZXIgSm9zZWYgdS4gSGVsZ2E='),
(172, 'Au', '260/1', 'SG9mbWFyY2hlciBBbG9pc2lh'),
(173, 'Au', '260/2', 'SG9mbWFyY2hlciBGcmFueg=='),
(174, 'Au', '261', 'U3RlaW5tYcOfbCBKb2hhbm4='),
(175, 'Au', '263', 'ZHp0LiB1bmJld29obnQsIFdlaXNzZW5zdGVpbmVy'),
(176, 'Au', '268/1', 'Tnlrb2RlbSBGcmFueiB1LiBFbGlzYWJldGg='),
(177, 'Au', '268/2', 'S8O2w59sIFJvYmVydCB1LiBUYW5qYQ=='),
(178, 'Au', '299/1', 'ZHp0LiB1bmJld29obnQg'),
(179, 'Au', '299/2', 'T2Jlcm1heXIgUmVpbmhhcmQ='),
(180, 'Au', '301', 'RnVydG5lciBKb3NlZg=='),
(181, 'Au', '302', 'RnJpdHogTGVvcG9sZGluZSAvIFN0ZWluZWRlciBNYXJpbyB1LiBNYXJpYQ=='),
(182, 'Au', '303', 'UGxhbmtlbmJpY2hsZXIgTGVvcG9sZCB1LiBKb3NlZmE='),
(183, 'Au', '305', 'U3RvY2tpbmdlciBKb3NlZiA='),
(184, 'Au', '306/1', 'QWhyZXIgV2FsdGVy'),
(185, 'Au', '306/2', 'UmVzaW5nZXIgU2FiaW5l'),
(186, 'Au', '307', 'SGludGVybGVpdG5lciBBbG9pcyB1LiBFbWlsaWU='),
(187, 'Au', '311/1', 'QnVjaG1heXIgTGVvcG9sZCB1LiBXYWxwdXJnYQ=='),
(188, 'Au', '311/2', 'QnVjaG1heXIgQnJpZ2l0dGU='),
(189, 'Au', '317/2', 'U2Vpc2VuYmFjaGVyIEtvbnJhZCB1LiBFbGVvbm9yZQ=='),
(190, 'Au', '317/3', 'U2Now7ZuZWdnZXIgSGFyYWxkIHUuIE5hZGph'),
(191, 'Au', '318', 'SG9jaHdpbW1lciBSZW5hdGUgdW5kIEZyYW56'),
(192, 'Au', '319', 'SmFnZXJzYmVyZ2VyIEZyYW56IC8gQ2hyaXN0aWFu'),
(193, 'Au', '324/1', 'S8O2c3RsZXIgTGVvcG9sZA=='),
(194, 'Au', '326/1', 'ZHp0LiB1bmJld29obnQg'),
(195, 'Au', '326/2', 'TWFydHNjaGluIEhlbG11dCB1LiBXYWx0cmF1ZA=='),
(196, 'Au', '327', 'RmVpZ2wgS2FybCB1LiBBbnRvbmlh'),
(197, 'Au', '332', 'QWlnbmVyIErDvHJnZW4gdS4gTWVsYW5pZQ=='),
(198, 'Au', '335/1', 'RmluayBNYXJpYSAgICAgICAgICAg'),
(199, 'Au', '335/2', 'RmluayBNYW5mcmVkIHUuIFJvc2EtTWFyaWE='),
(200, 'Au', '349/1', 'U2Now7Zya2h1YmVyIExlb3BvbGQgdS4gRXJuYQ=='),
(201, 'Au', '349/2', 'QnJ1bm5lciBHYWJyaWVsZQ=='),
(202, 'Au', '352', 'QmxhbWF1ZXIgUmFsZi1EaWV0ZXIgLyBQdWNocnVja2VyIEhlbG11dA=='),
(203, 'Au', '357', 'TG9pYmwgSGVsbXV0IC8gTWF5ZXIgSXNhYmVsbGE='),
(204, 'Au', '365/1', 'TmlldHNjaCBUaG9tYXMgdS4gUmVuYXRlIC8gU2hhYmFuaSBNaWNoYWVsYSB1LiBMYWJpbm90'),
(205, 'Au', '365/2', 'TmlldHNjaCBUaG9tYXMgdS4gTWFyaWFubmU='),
(206, 'Au', '429/1', 'V2FnbmVyIE1hbmZyZWQgdS4gUm9zd2l0aGE='),
(207, 'Au', '429/2', 'V2FnbmVyIE1hcmlvLCBNYWcuIHUuIEtlcnN0aW4='),
(208, 'Au', '476', 'SMO2cmhhZ2VyIEdlcmhhcmQgdS4gR2FicmllbGU='),
(209, 'Au', '478', 'TMO2c2NobCBSdWRvbGYgdS4gTWFudWVsYQ=='),
(210, 'Au', '479', 'R3JhdHplciBIZWxtdXQgdS4gTWFyZ2FyZXRl'),
(211, 'Au', '480', 'U2Nob2RlciBSb2xhbmQgdS4gR2VydHJhdWQ='),
(212, 'Au', '481', 'ZHp0LiB1bmJld29obnQsIE5vdmFrL1dhbGxlbnN0b3JmZXI='),
(213, 'Au', '482', 'ZHp0LiB1bmJld29obnQgLSBuaWNodCBiZXdvaG5iYXIsIEJlc2VuZG9yZmVyLVJpdHQ='),
(214, 'Au', '483', 'UHJlbm4gV29sZmdhbmcgdS4gVGFtYXJh'),
(215, 'Au', '485', 'VG9tc2NoaSBSb2xhbmQgdS4gTWFyZ2FyZXRl'),
(216, 'Au', '486', 'TWFqZXIgUmVpbmhvbGQgLyBTY2hvcm5zdGVpbmVyIEhlbGdh'),
(217, 'Au', '487', 'RWlzZW5iYXVlciBNYXJ0aW4gdS4gSGVpZGVtYXJpZQ=='),
(218, 'Au', '496', 'Wml0emVuYmFjaGVyIFJlaW5oYXJkIHUuIEhlaWRlIE1hcmlh'),
(219, 'Au', '497', 'SG9sem5lciBBbmRyZWFzIHUuIE1hbnVlbGE='),
(220, 'Au', '533', 'U2Vpc2VuYmFjaGVyIENocmlzdGluZSAvIFNjaGF1bWJlcmdlciBNYW5mcmVk'),
(221, 'Au', '536', 'Wmluw7ZkZXIgRWxpc2FiZXRoIHUuIEJyYWNodm9nZWwgR2VyaGFyZCBBbmRyZWFz'),
(222, 'Au', '538', 'S290dCBQaW90ciB1LiBNYXJpYQ=='),
(223, 'Au', '539', 'QmVuYXR6a3kgSGVyYmVydCB1LiBHYWJyaWVsZQ=='),
(224, 'Au', '604', 'SGFzZWxzdGVpbmVyIE1hcmlvIHUuIFNvbmph'),
(225, 'Au', '610', 'U3BhbnJpbmcgUm9uYWxkIHUuIENocmlzdGluZQ=='),
(226, 'Au', '611', 'RmlnZXJsIEthcmwgdS4gTW9uaWth'),
(227, 'Au', '628', 'SMO2bHpsIENocmlzdGlhbiB1LiBQaXR6bCBTYWJpbmU='),
(228, 'Außergrub', '102/2', 'SG9mc2Nod2FpZ2VyIEFsZnJlZCB1LiBFcmlrYSAvIEhvZnNjaHdhaWdlciBQZXRyYSB1LiBTY2hhZGVuaG9mZXIgTHVrYXM='),
(229, 'Außergrub', '103/1', 'SGVoZXIgRnJhbnogdS4gSGVsZW5l'),
(230, 'Außergrub', '103/2', 'U2V5ZXIgQ2hyaXN0aWFuIHUuIEdhYnJpZWxl'),
(231, 'Außergrub', '243/1', 'U3R1cm0gTWFyaW8='),
(232, 'Außergrub', '243/2', 'RHVyaWNrb3ZhIERhbmllbGEgdS4gUGlzYXIgTWFyZWs='),
(233, 'Außergrub', '243/3', 'S2FsdGVuYsO2Y2sgQ2hyaXN0aWFuZQ=='),
(234, 'Außergrub', '243/4', 'Vm9sa2UgTWFydGluIHUuIEVja2hhcnQgTWVsYW5pZQ=='),
(235, 'Außergrub', '243/5', 'R3J1YmhvZmVyIFdvbGZnYW5nIHUuIFBlc2NvbGxkZXJ1bmdnIERhbmllbGE='),
(236, 'Außergrub', '392', 'SGludGVybGVpdG5lciBMZW9wb2xkaW5lIHUuIFplbWxhIEFydGh1ciAvIEhpbnRlcmxlaXRuZXIgQmVybmhhcmQ='),
(237, 'Bach', '190/1', 'ZHp0LiB1bmJld29obnQg'),
(238, 'Bach', '190/2', 'UsO2Y2tsaW5nZXIgR2VyaGFyZCB1LiBCaXJnaXQ='),
(239, 'Bach', '191/1', 'U2Now7Zya2h1YmVyIFJvbWFuIHUuIExlb3BvbGRpbmU='),
(240, 'Bach', '191/3', 'U2Now7Zya2h1YmVyIE1lbGFuaWUgdS4gU2Now6RmZmVyIE1hbnVlbA=='),
(241, 'Barthof', '30/1', 'TGV1dGdlYiBIZWxnYQ=='),
(242, 'Barthof', '229', 'U2VpZGVsIEpvaGFubmVzIHUuIEVsZnJpZWRl'),
(243, 'Barthof', '347/1', 'TGV1dGdlYiBTdGVmYW5pZQ=='),
(244, 'Barthof', '347/2', 'TGV1dGdlYiBBZG9sZiB1LiBNYXJpYQ=='),
(245, 'Bartl', '198/1', 'V2FnbmVyIEZyYW56IHUuIExlb3BvbGRpbmU='),
(246, 'Bartl', '198/3', 'V2FnbmVyIFRob21hcw=='),
(247, 'Bartl', '199', 'U294YmVyZ2VyIExlb3BvbGQgdS4gR2VybGluZGUgLyBKdWxpYQ=='),
(248, 'Bartleiten', '206', 'R3J1YmVyIEFsb2lzIHUuIFJvc2VtYXJpZSAvIEFsb2lz'),
(249, 'Baumgarten', '196', 'RmVocmluZ2VyIExlb3BvbGQgdS4gTWFyaWE='),
(250, 'Bichl', '113/1', 'RnJldW5kbCBNb25pa2E='),
(251, 'Bichl', '113/2', 'RnJldW5kbCBKb3NlZiB1LiBDaHJpc3RpYW5h'),
(252, 'Bimsbauer', '32', 'S2FtbWVyaG9mZXIgTGVvcG9sZCB1LiBTdGVmYW5pZSAvIEhlcmJlcnQ='),
(253, 'Brandhof', '153', 'S3JvcGYgSm9zZWYgdS4gSm9zZWZhIC8gR2VvcmcgdS4gS2F0cmlu'),
(254, 'Brandhoflehen', '152/1', 'R8O8bnRoZXIgRXJuc3QgdS4gUm9zd2l0aGE='),
(255, 'Brandhoflehen', '152/2', 'R8O8bnRoZXIgVGhlcmVzaWEgLyBHw7xudGhlciBGcmllZHJpY2g='),
(256, 'Brandstetten', '136', 'R2Fzc25lciBNYXhpbWlsaWFuIHUuIExlb3BvbGRpbmUgLyBNYXJrdXM='),
(257, 'Brandstetten', '137/1', 'U2NobXV0emVyIEFsb2lz'),
(258, 'Brandstetten', '137/2', 'U2NobXV0emVyIEhpbGRlZ2FyZA=='),
(259, 'Brandstetten', '395/1', 'WmVpbmluZ2VyIEhlbG11dGggdS4gTWFyaWEgLyBTY2hyYWxsIEthdGhhcmluYQ=='),
(260, 'Brandstetten', '395/2', 'WmVpbmluZ2VyIEhlbG11dA=='),
(261, 'Brückl', '61/1', 'QmljaGxlciBXb2xmZ2FuZyB1LiBEYW5pZWxh'),
(262, 'Brückl', '62/1', ''),
(263, 'Brückl', '62/2', 'U2Nob2RlciBHZW9yZyB1LiBFdmE='),
(264, 'Brückl', '69/2', 'SGFzbGluZ2VyIFJ1cGVydCB1LiBUaGVyZXNpYQ=='),
(265, 'Brückl', '454', 'UHJvLU92byBHZXNtYkg='),
(266, 'Brückl', '523', 'RmlybWEgU2NoZWl0ZXIgVGlzY2hsZXJlaSAtIEdyb8OfYWxiZXIgQ2hyaXN0b3BoIHUuIEFsZXhhbmRyYQ=='),
(267, 'Dachmeister', '200', 'S2FtbWVyaG9mZXIgSm9oYW5uIHUuIEhpbGRhIC8gRnJpZWRyaWNoIHUuIE1hcmlh'),
(268, 'Dieming', '82', 'SGFsYm1heXIgQW5uYSAvIEFsZnJlZA=='),
(269, 'Dieming', '83', 'S2FtbWVyaG9mZXIgR2VyaGFyZCB1LiBHZXJ0cnVkZQ=='),
(270, 'Distlhof', '161', 'TGF0emVsc2JlcmdlciBKdWxpYW5l'),
(271, 'Distlhof', '162/1', 'RmVocmluZ2VyIFN0ZWZhbiB1LiBKb3NlZmE='),
(272, 'Distlhof', '162/2', 'RmVocmluZ2VyIFN0ZWZhbiB1LiBHcmF0emVyIEJpcmdpdA=='),
(273, 'Distlhof', '450', 'ZHp0LiB1bmJld29obnQsIEJveGhvZmVyIEhlcmJlcnQ='),
(274, 'Dörfl-Mayer', '75', 'UmllZGxlciBKb3NlZiB1LiBSb3NlbWFyaWU='),
(275, 'Dörfl-Mayer', '76/1', 'V2FnbmVyIEhlbG11dCB1LiBJbmdyaWQ='),
(276, 'Dörfl-Mayer', '76/2', 'V2FnbmVyIEJldHRpbmEgdS4gS2FyYXNlayBHZXJhbGQ='),
(277, 'Dumdachting', '139/1', 'QWlnbmVyIEpvc2Vm'),
(278, 'Dumdachting', '139/2', 'QWlnbmVyIEFuZHJlYXMgLyBTY2hyYW1lbCBMZW8='),
(279, 'Dumdachting', '139/3', 'U2NocmFtZWwgRnJpZWRlcmlrZQ=='),
(280, 'Dumdachting', '139/4', 'UmF1Y2hiZXJnZXIgTWFydGluYQ=='),
(281, 'Dumdachting', '139/5', 'TWVya2luZ2VyIE1hcnRpbg=='),
(282, 'Dumdachting', '140', 'QmVyZ2VyIFJvc2EgLyBLbGF1cw=='),
(283, 'Dumdachting', '141', 'SG9mc2Nod2FpZ2VyIEZyYW56IHUuIE1hcmlhLyBGcmFueiB1LiBTY2hsw7ZnbGhvZmVyIE1hcnRpbmE='),
(284, 'Dumdachting', '316/1', 'QmVyZ2VyIEhlcm1hIC8gU2FiaW5l'),
(285, 'Dumdachting', '316/2', 'QmVyZ2VyIFJ1ZG9sZiB1LiBNb25pa2E='),
(286, 'Dumdachting', '345/1', 'RXR0bGluZ2VyIEpvaGFubiB1LiBTdGVmYW5pZQ=='),
(287, 'Dumdachting', '345/2', 'S3JpZW5lciBHZXJoYXJkLCBEci4gdS4gU3RlZmFuaWU='),
(288, 'Dumdachting', '427/1', 'UGF5ZXIgS29ucmFkIHUuIEFubmVtYXJpZQ=='),
(289, 'Dumdachting', '427/2', 'UGF5ZXIgS29ucmFkIGp1bi4='),
(290, 'Edlach', '154', 'U2NoaWxsZXIgSGFyYWxkIHUuIEVyaWthLCBIZWJlc2JlcmdlciBNYW5mcmVkIChQZWNoaGFja2VyIE1hcmlhKQ=='),
(291, 'Edlach', '155/2', 'U2ltbWVyIEpvc2VmIHUuIFJvc2luYQ=='),
(292, 'Edlach', '156/1', 'SGVpbGlnZW5icnVubmVyIEZyYW56IHUuIEhpbGRlZ2FyZCAvIEtyYWluIHUuIExlaXRobmVyIEFudG9u'),
(293, 'Edlach', '157/1', 'SMO2bGxlc2JlcmdlciBNYW5mcmVkIC8gVGhlcmVzaWE='),
(294, 'Edlach', '238/1', 'S2lyY2h3ZWdlciBGcmFueiB1LiBDaHJpc3RpbmU='),
(295, 'Edlach', '238/2', 'S2lyY2h3ZWdlciBSb2xhbmQgdS4gVmlrdG9yaWE='),
(296, 'Edlach', '342/1', 'R3J1YmhvZmVyIEpvaGFubiB1LiBNYXJpYW5uZQ=='),
(297, 'Edlach', '342/2', 'U3BlcmwgTWljaGFlbCB1LiBNYW51ZWxh'),
(298, 'Edlach', '393/1', 'R3J1YmhvZmVyIEpvc2VmIHUuIEVtbWE='),
(299, 'Edlach', '393/2', 'UGVzY2hlayBTaW1vbiB1LiBIZWxnYQ=='),
(300, 'Einfaltsberg', '150', 'RWNrZXIgRnJhbnogdS4gR2FicmllbGU='),
(301, 'Einfaltsberg', '151', 'U2NobGF0dGVyIFJlbmF0ZQ=='),
(302, 'Einfaltsberg', '246', 'SG9mbWFyY2hlciBNYXJpYSAvIFNjaMO2cmdodWJlciBGZXJkaW5hbmQgdS4gQ2xhdWRpYQ=='),
(303, 'Einfaltsberg', '422/1', 'SG9mbWFyY2hlciBMZW9wb2xkaW5l'),
(304, 'Einfaltsberg', '422/2', 'U294YmVyZ2VyIE1heGltaWxpYW4gdS4gU29uamE='),
(305, 'Engelsberg', '182', 'SGFuZHN0ZWluZXIgTGVvcG9sZCB1LiBHZXJ0cnVkIC8gT2Jlcm1heXIgUmljaGFyZCB1LiBNaWNoZWxiYXVlciBBbmRyZWE='),
(306, 'Engelsberg', '183/1', 'U2NoYWRlbmhvZmVyIEhlcm1pbmUvIEthbHRlbmLDtmNrIEpvaGFubiB1LiBFdmE='),
(307, 'Engelsberg', '183/2', 'S3JlbmRsIERvcmlzIHUuIEdydWJlciBKb2NoZW4='),
(308, 'Engelsberg', '184/1', 'U2Now7ZyZ2h1YmVyIFBpdXMgdS4gTWFyaWE='),
(309, 'Engelsberg', '184/2', 'U2Now7ZyZ2h1YmVyIEpvc2VmIHUuIFBldHJh'),
(310, 'Engelsberg', '185', 'S2FsdGVuYsO2Y2sgSGFubmVzIHUuIFNpbGtl'),
(311, 'Erla', '214/1', 'S2FtbWVyaG9mZXIgTWFyaWEgLyBBbnRvbiB1LiBNYXJnYXJldGU='),
(312, 'Erla', '214/2', 'TWF5cmhvZmVyIEdhYnJpZWxl'),
(313, 'Felbing', '42/1', 'SHVtcGVsIEpvaGFubg=='),
(314, 'Felbing', '42/2', 'QnJhbWF1ZXIgTGVvcG9sZCB1LiBIb2ZlciBMYXJpc3Nh'),
(315, 'Felbing', '43/1', 'TmV1ZG9yZmVyIEZyYW56IC8gU3RlZmFuaWUsIEJB'),
(316, 'Felbing', '43/2', 'TmV1ZG9yZmVyIENocmlzdGlhbiwgREkgKEZIKSB1LiBLYXRyaW4='),
(317, 'Felbing', '370/1', 'TmV1ZG9yZmVyIEpvc2VmIHUuIEVkZWx0cmF1ZGU='),
(318, 'Felbing', '370/2', 'TmV1ZG9yZmVyIEdlb3JnIHUuIEdhcnRsZWhuZXIgU2FyYWg='),
(319, 'Freiaigen', '44/1', 'U2ltbWVyIEpvaGFubmVzIHUuIFBldHJh'),
(320, 'Freiaigen', '45/1', 'SGlydGwgR290dGZyaWVkIHUuIEhhbm5lbG9yZQ=='),
(321, 'Freiaigen', '45/2', 'SGlydGwgQW5kcmVhcyB1LiBTdGVpbmtlbGxuZXIgQmlhbmNh'),
(322, 'Freiaigen', '436', 'U2ltbWVyIEZyYW56aXNrYSAvIFNpbW1lciBNYXJ0aW4='),
(323, 'Friesenberg', '173', 'U3RlaW5kbCBBZ25lcyAvIEpvc2VmIC8gQWxvaXMgLyBTeWx2aWE='),
(324, 'Fröschütz', '25', 'S2lyY2hzdGV0dGVyIEpvc2VmIC8gSm9zZWYgdS4gQ2hyaXN0YQ=='),
(325, 'Gansberg', '216', 'SWRpbmdlciBFcmljaCB1LiBFbGtl'),
(326, 'Gansberg', '217/1', 'R2VsYmVuZWdnZXIgQWxvaXMgdS4gQ2hyaXN0aW5l'),
(327, 'Gansberg', '217/3', 'U3RpeGVuYmVyZ2VyIFNpZWdmcmllZCB1LiBNaWNoYWVsYQ=='),
(328, 'Gehartsberg', '215', 'RmVocmluZ2VyIEpvc2Vm'),
(329, 'Graben', '203', 'ZHp0LiB1bmJld29obnQsIE1heXJob2Zlcg=='),
(330, 'Graben', '204/2', 'Uml0dCBIZXJiZXJ0LCBJbmcudS4gR2VydHJ1ZGU='),
(331, 'Graben', '205/1', 'UnXDn21heXIgU3RlZmFuIHUuIFJvc2E='),
(332, 'Graben', '205/2', 'UnXDn21heXIgU3RlZmFuIHUuIFNvbmph'),
(333, 'Graben', '271', 'ZHp0LiB1bmJld29obnQgLSBuaWNodCBiZXdvaG5iYXIsIFN0b2NraW5nZXI='),
(334, 'Graben', '277/1', 'SGFuZWRlciBMZW9wb2xkIHUuIEFubmE='),
(335, 'Graben', '277/2', 'SGFuZWRlciBMZW9wb2xkIHUuIEFubmEtRWxpc2FiZXRo'),
(336, 'Großgassen', '186', 'U2llZ2wgQ2Fyb2xhIHUuIERpZXRtYXI='),
(337, 'Großmayr', '220/1', 'Uml0dCBIZWxlbmU='),
(338, 'Großmayr', '220/2', 'Uml0dCBMZW9wb2xkIHUuIEdydWJlciBBbmRyZWE='),
(339, 'Großnagl', '160/1', 'Uml0dG1hbm5zYmVyZ2VyIE1hcmlh'),
(340, 'Großnagl', '160/2', 'Uml0dG1hbm5zYmVyZ2VyIEhlcmJlcnQgdS4gTWFyaWEsIE1hZy4='),
(341, 'Grübl', '212', 'RWRlcm1heXIgTGVvcG9sZCAvIEVkZXJtYXlyIEpvaGFubmVzIHUuIEJpYW5jYQ=='),
(342, 'Grübl', '213', 'TGVpdG5lciBIZXJpYmVydCB1LiBFcm5lc3RpbmUgLyBTdGVmYW4='),
(343, 'Gstadthof', '145/1', 'U2NobmFibCBBbmRyZWFzIHUuIFJvc2E='),
(344, 'Gstadthof', '145/2', 'U2NobmFibCBBbmRyZWFzLCBESShGSCkgdS4gUm9zZW1hcmll'),
(345, 'Gstadthof', '289/1', 'U3TDtmNrbCBBbm5h'),
(346, 'Gstadthof', '289/2', 'U3TDtmNrbCBXZXJuZXIgdS4gTWFyaWE='),
(347, 'Gstadthof', '292', 'TGFnbGVyIEVuZ2VsYmVydCB1LiBNYXJnYXJldGE='),
(348, 'Gstadthof', '294', 'TGFuZ2VkZXIgS2FybCB1LiBNYXJ0aW5h'),
(349, 'Gstadthof', '297/1', 'T3J0bmVyIFNlYmFzdGlhbg=='),
(350, 'Gstadthof', '297/2', 'T3J0bmVyIEpvaGFubiB1LiBQZXRyYQ=='),
(351, 'Gstadthof', '298', 'SMO2bGxtw7xsbGVyIEZyYW56IA=='),
(352, 'Gstadthof', '312/1', 'TW90eWNrYSBIZXJtaW5l'),
(353, 'Gstadthof', '312/2', 'TW90eWNrYSBNYW5mcmVkIHUuIEFubmE='),
(354, 'Gstadthof', '315/1', 'U2Nob2RlciBDw6RjaWxpYQ=='),
(355, 'Gstadthof', '315/2', 'V2FnbmVyIENocmlzdGlhbiB1LiBHYWJyaWVsYQ=='),
(356, 'Gstadthof', '321/1', 'S2xldGVja2EgSGVybWFubiB1LiBNb25pa2E='),
(357, 'Gstadthof', '321/2', 'V2FnbmVyIE1vbmlrYQ=='),
(358, 'Gstadthof', '323', 'SGVpZ2wgRW5nZWxiZXJ0IHUuIFRoZXJlc2lh'),
(359, 'Gstadthof', '325/1', 'SG9mbWFjaGVyIEZyYW56IHUuIE1hZ2RhbGVuYQ=='),
(360, 'Gstadthof', '325/2', 'SG9mbWFjaGVyIEZyYW56IGp1bi4='),
(361, 'Gstadthof', '331/1', 'RnJldWRlbnNjaHXDnyBNYXJpYQ=='),
(362, 'Gstadthof', '331/3', 'RnJldWRlbnNjaHXDnyBNYXJ0aW4='),
(363, 'Gstadthof', '334', 'WmVoZXRuZXIgSm9zZWYgdS4gTGVvcG9sZGluZSAvIENocmlzdGlhbg=='),
(364, 'Gstadthof', '338', 'TcO8aGx3YW5nZXIgTHVkd2lnIHUuIEhlcm1pbmU='),
(365, 'Gstadthof', '348', 'UGFsbWV0emhvZmVyIEpvc2Vm'),
(366, 'Gstadthof', '354', 'T2Jlcm3DvGxsZXIgSm9zZWYgdS4gQ2hyaXN0aWFuYQ=='),
(367, 'Gstadthof', '358', 'SMO2bmlnbCBMZW9wb2xkIHUuIEFubmE='),
(368, 'Gstadthof', '391', 'TGVibGh1YmVyIEdlcmhhcmQgdS4gVWxyaWtl'),
(369, 'Gstadthof', '396', 'SGFpcCBMZW9wb2xkaW5l'),
(370, 'Gstadthof', '484', 'U2NobmFibCBNYXJrdXMgdS4gQXN0cmlk'),
(371, 'Gstadthof', '570', 'RmFuZ21leWVyIE1hcmt1cyB1LiBNYXJ0aW5h'),
(372, 'Hagbauer', '63', 'V2llc2VyIENocmlzdGluZSAvIEZyYW56IHUuIFNpbmljayBBbml0YQ=='),
(373, 'Haidschachen', '33/1', 'RGFpw59sLVNjaGF0emVkZXIgU3RlZmFuIHUuIENocmlzdGluZQ=='),
(374, 'Haidschachen', '33/2', 'RGFpw59sLVNjaGF0emVkZXIgSGVybWFubiB1LiBNYXJnaXQ='),
(375, 'Haindl', '149/1', 'V2FjaCBBbGZyZWQsIE9TUiBJbmcuIHUuIENocmlzdGluZQ=='),
(376, 'Haindl', '149/3', 'V2FnbmVyIEJlcm5kIHUuIFVscmlrZQ=='),
(377, 'Haindl', '222/1', 'RG9yZmVyIEFsb2lzIHUuIEVybmE='),
(378, 'Haindl', '222/3', 'RG9yZmVyIFRob21hcyB1LiBDaHJpc3RpYW5l'),
(379, 'Haindl', '288/1', 'RmVocmluZ2VyIENocmlzdGlhbmE='),
(380, 'Haindl', '288/2', 'VGhldWVya2F1ZiBSZWluaGFyZCB1LiBCcmlnaXR0ZQ=='),
(381, 'Haindl', '290/1', 'WmVoZXRuZXIgQ2hyaXN0aWFu'),
(382, 'Haindl', '290/2', 'WmVoZXRuZXIgTGVvcG9sZA=='),
(383, 'Haindl', '403', 'SGFsbGVyIEpvaGFubiB1LiBNYXJpYW5uZQ=='),
(384, 'Helpersdorf', '109', 'U29tbWVyIFJ1cGVydCB1LiBIZWxnYSAvIFNpbW9uZSB1LiBQZmFmZmVuYmljaGxlciBGbG9yaWFu'),
(385, 'Helpersdorf', '110', 'QWlnbmVyIEhlcm1pbmUgLyBKb3NlZiB1LiBHZXJsaW5kZSAvIFJlbsOpIHUuIEp1bGlhbmUsIEJTYw=='),
(386, 'Helpersdorf', '276/1', 'SGludGVycGxhdHRuZXIgVmVyZW5hLCBCRWQgdS4gSMO2bHpsIENocmlzdGlhbg=='),
(387, 'Helpersdorf', '276/2', 'SGludGVycGxhdHRuZXIgSm9oYW5uIHUuIEluZ3JpZA=='),
(388, 'Helpersdorf', '437', 'U29tbWVyIFN0ZWZhbmllIHUuIEdydWJob2ZlciBLYXJs'),
(389, 'Hinterberg', '170', 'U2NocmV5IEhlbG11dCB1LiBIZWlkcnVuLCBOV1M='),
(390, 'Hochaigen', '218', 'TGVpdGhuZXIgTGVvcG9sZCAvIEhpcnRlbmxlaG5lciBKb3NlZiB1LiBCcmlnaXR0ZQ=='),
(391, 'Holzbauer', '65', 'S2FtbWVyaG9mZXIgTGVvcG9sZCB1LiBMZW9wb2xkaW5l'),
(392, 'Holzbauer', '66', 'RG9ubmVyIEdlcmhhcmQgdS4gU2FuamE='),
(393, 'Holzbauer', '67', 'U2NobMO2Z2VsaG9mZXIgR290dGZyaWVkIHUuIFJvc2luYSAvIEdlcmhhcmQgdS4gQW5pdGE='),
(394, 'Holzbauer', '438', 'RG9ubmVyIElnbmF6IHUuIFN0ZWZhbmllIC8gSXNhYmVsbGE='),
(395, 'Hub', '51', 'TGVpdG5lciBMZW9wb2xkIHUuIE1hcmlhIC8gTWFuZnJlZCB1LiBEb3Jpcw=='),
(396, 'Hub', '52/1', 'S2lyY2h3ZWdlciBKb2hhbm4gdS4gSW5ncmlk'),
(397, 'Hub', '52/2', 'S2lyY2h3ZWdlciBKb3NlZiB1LiBFZGVsdHJhdWQ='),
(398, 'Hub', '53/1', 'QmFjaG5lciBMZW9wb2xkaW5l'),
(399, 'Hub', '53/2', 'QmFjaG5lciBPdHRvIHUuIFBldHJh'),
(400, 'Hub', '353', 'U2Now6RmZmVyIEFuZHJlYXMgdS4gS2F0aGFyaW5h'),
(401, 'Illmersbach', '85', 'U2NobMO2Z2xob2ZlciBMZW9wb2xkIHUuIFJvc2EgLyBNaWNoYWVsIHUuIFNjaG1pZHQgQ29ybmVsaWE='),
(402, 'Illmersbach', '86', 'ZHp0LiB1bmJld29obnQsIEthbW1lcmhvZmVyIEhlcmJlcnQgLSBIYWFnIA=='),
(403, 'Im Ort', '1', 'TWFnLiBGcmFueiBHcnViZXIgKFBhdGVyIFN0ZWZhbiBHcnViZXIp'),
(404, 'Im Ort', '2/1', 'QWlnbmVyIElybWdhcmQ='),
(405, 'Im Ort', '2/2', 'QWlnbmVyIEdlcm5vdCBEci4g'),
(406, 'Im Ort', '3', 'U2Nob2RlciBGcmllZHJpY2ggdS4gRXJpa2E='),
(407, 'Im Ort', '4', 'QnJ1bm5lciBKb2hhbm4='),
(408, 'Im Ort', '5', 'QWlnbmVyIEtvbnJhZCAvIEFybm9sZA=='),
(409, 'Im Ort', '6', 'Uml0dG1hbm5zYmVyZ2VyIE1hbmZyZWQgdW5kIEVsaXNhYmV0aCAvIEZyYW56'),
(410, 'Im Ort', '7/1', 'SGFzZWxzdGVpbmVyIFdlcm5lciAoTldTKQ=='),
(411, 'Im Ort', '7/2', 'SGFzZWxzdGVpbmVyIE1hcnRpbiB1LiBTaWx2aWE='),
(412, 'Im Ort', '8', 'Vm9sa3NzY2h1bGUgICAgICAgICAgICAgICAgICA='),
(413, 'Im Ort', '8', 'RnJlaXdpbGxpZ2UgRmV1ZXJ3ZWhyIEJpYmVyYmFjaA=='),
(414, 'Im Ort', '9/1', 'RmlzY2hlciBMZW9wb2xk'),
(415, 'Im Ort', '9/2', 'RmlzY2hlciBQZXRlciB1LiBHYWJyaWVsZQ=='),
(416, 'Im Ort', '9', 'R2FzdGhhdXMgRmlzY2hlcg=='),
(417, 'Im Ort', '10', 'V2FnbmVyIEpvaGFubiB1LiBUaGVyZXNpYSAvIEpvaGFubiA='),
(418, 'Im Ort', '11', 'R2FzdGhhdXMgS2FwcGw='),
(419, 'Im Ort', '13/1', 'TGFtbWVyaHViZXIgS2FybCBPU1IgRGlyLg=='),
(420, 'Im Ort', '13/2', 'QnJhbmRzdGV0dGVyIFJvc2E='),
(421, 'Im Ort', '13/3', 'TcO8bGxlciBLbGF1cyB1LiBHZXJ0cnVkZQ=='),
(422, 'Im Ort', '14/1', 'Uml0dG1hbm5zYmVyZ2VyIEhlcm1pbmU='),
(423, 'Im Ort', '14/2', 'U3RlaWRsIEluZ3JpZCB1LiBLYXJs'),
(424, 'Im Ort', '14/3', 'Uml0dG1hbm5zYmVyZ2VyIE5pY29sZQ=='),
(425, 'Im Ort', '15', 'QsO8cmluZ2VyIEp1bGlhLCBNYWcuKEZIKSB1LiBHZXJoYXJk'),
(426, 'Im Ort', '16', 'R2VpYmxpbmdlciBSb3NhIC8gSW5nLiBHZWlibGluZ2VyIENocmlzdGhvcGggTVNj'),
(427, 'Im Ort', '17', 'TWFya3RsIFdlcm5lciBEci4gdmV0LiB1LiBFbGxlbiBEci4gdmV0Lg=='),
(428, 'Im Ort', '227/1', 'SGVsbWVsIEVybnN0'),
(429, 'Im Ort', '227/2', 'SGVsbWVsIEVsZnJpZWRl'),
(430, 'Im Ort', '227', 'RG9yZmNhZmUgQmliZXJiYWNo'),
(431, 'Im Ort', '228/2', 'U2NodWxsZXIgTWFuZnJlZCB1LiBNaWNoYWVsYQ=='),
(432, 'Im Ort', '231/1', 'SMO2bGxlc2JlcmdlciBCZXJ0YQ=='),
(433, 'Im Ort', '231/2', 'SGF1bWVyIEhlcmJlcnQgdS4gS2FyaW4='),
(434, 'Im Ort', '253/1', 'UGFzY2FsIFBoaWxpcHBhcnQ='),
(435, 'Im Ort', '253/2', 'R3J1YmJhdWVyIEFuZ2VsaWth'),
(436, 'Im Ort', '253/3', 'TWFydHp5IFNhbmRyYQ=='),
(437, 'Im Ort', '253/4', 'R8Ohc3DDoXIgUGV0ZXIgdS4gQmFkaW5rb3bDoSBGcmVkZXJpa2E='),
(438, 'Im Ort', '253/2a', 'U2Nod2FpZ2VyIENocmlzdGlhbg=='),
(439, 'Im Ort', '266', 'ZHp0LiB1bmJld29obnQg'),
(440, 'Im Ort', '269', 'THVtZXRzYmVyZ2VyIEpvc2VmIHUuIExlb3BvbGRpbmU='),
(441, 'Im Ort', '273', 'SmFudHNjaGVyIFJhaW11bmQgdS4gU29tbWVyIEJhcmJhcmE='),
(442, 'Im Ort', '274', 'VmFyZ2EgQW5uZWxpZXNlIHUuIFNoYW50YW51IFN1Ymlk'),
(443, 'Im Ort', '279', 'R2VtZWluZGVhbXQgQmliZXJiYWNo'),
(444, 'Im Ort', '280', 'UmFpZmZlaXNlbi1MYWdlcmhhdXM='),
(445, 'Im Ort', '304', 'UmFpZmZlaXNlbmJhbmsgaW0gTW9zdHZpZXJ0ZWw='),
(446, 'Im Ort', '304/1', 'UmVpY2tlcnNkb3JmZXIgTGVvcG9sZGluZQ=='),
(447, 'Im Ort', '304/2', 'U2Now7ZyZ2h1YmVyIExlb3BvbGQ='),
(448, 'Im Ort', '304/3', 'TWF5cmhvZmVyIE1pY2hhZWxh'),
(449, 'Im Ort', '304/4', 'ZHp0LiB1bmJld29obnQg'),
(450, 'Im Ort', '304/5', 'RmFyYSBSZWdpbmE='),
(451, 'Im Ort', '304/6', 'ZHp0LiB1bmJld29obnQg'),
(452, 'Im Ort', '304/7', 'TMOkbmdhdWVyIEphcXVlbGluZQ=='),
(453, 'Im Ort', '309', 'SG9jaHN0w7ZnZXIgUnVwZXJ0'),
(454, 'Im Ort', '310', 'UHJ1Y2tuZXIgVGhlcmVzaWEgLSBaTUsgTWV0YWxsYmF1L1N0YWhsYmF1IFBydWNrbmVyL0NNIE1ldGFsbGJhdQ=='),
(455, 'Im Ort', '322/1', 'U3Ryb2htYXlyIEZyYW56aXNrYQ=='),
(456, 'Im Ort', '322/2', 'U3Ryb2htYXlyIFdlcm5lciB1LiBNYXJpYQ=='),
(457, 'Im Ort', '355', 'TGFuZGVza2luZGVyZ2FydGVuIEJpYmVyYmFjaA=='),
(458, 'Im Ort', '390', 'V2ViZXIgRXJuYQ=='),
(459, 'Im Ort', '400', 'VGhldWVya2F1ZiBSdXBlcnQgdS4gT1NSIERpci4gTWFyZ2FyZXRl'),
(460, 'Im Ort', '405', 'QmljaGxlciBDaHJpc3RpbmE='),
(461, 'Im Ort', '406', 'V2FnbmVyIEVyaWNoIHUuIEluZ3JpZC8gS3JvcGYgTWFuZnJlZCB1LiBBbmRyZWE='),
(462, 'Im Ort', '407', 'S2FtbWVyaG9mZXIgU3RlZmFuIHUuIFdhbHRyYXVkIC8gU3RlZmFuIHUuIEdlcmxpbmRl'),
(463, 'Im Ort', '411', 'S2FwcGwgQW5nZWxpa2EgLyBCYXllciBNb25pa2EgKE5XUy4p'),
(464, 'Im Ort', '414', 'VHLDtnNjaGVyIEZyYW56IHUuIFdhbHRyYXVk'),
(465, 'Im Ort', '426', 'VGlzY2hsZXJlaSBBaWduZXI='),
(466, 'Im Ort', '426b', 'QWlnbmVyIElybWdhcmQgKE5XUyk='),
(467, 'Im Ort', '435', 'TXVzaWtoZWltIHUuIEJhdWhvZg=='),
(468, 'Im Ort', '444', 'QsO2aG0gUGF1bCwgRHIuIG1lZC4gLyBPcmRpbmF0aW9uIERyLiBGw7xyc3Q='),
(469, 'Im Ort', '499', 'R2VpYmxpbmdlciBBdWd1c3RpbiB1LiBBbmRyZWE='),
(470, 'Im Ort', '591', 'UHJlaW5mYWxrIFBldHJhIChLYVcp'),
(471, 'Im Ort', '592', 'S2lyY2h3ZWdlciBKb3NlZiAoS2FXKQ=='),
(472, 'Im Ort', '593', 'SG9mc2Nod2FpZ2VyIEdlcmhhcmQgdS4gRGFuaWVsYSAoS2FXKQ=='),
(473, 'Im Ort', '594', 'V2ltbWVyLVNjaGFydG3DvGxsZXIgR2FicmllbGUgdS4gU2NoYXJ0bcO8bGxlciBBbmRyZWFzIChLYVcp'),
(474, 'Im Ort', '595', 'Uml0dCBBbmRyZWFzIHUuIEplbm5pZmVyIChLYVcp'),
(475, 'Im Ort', '596', 'SG9yYWsgVGhvbWFzIHUuIEJpYW5jYSAoS2FXKQ=='),
(476, 'Im Ort', '636', 'U3BlbmRvw7ogVGhvbWFzIChLYVcp'),
(477, 'Im Ort', '637', 'RXR0bGluZ2VyIEhhbm5lcyB1LiBNYW51ZWxhIChLYVcp'),
(478, 'Im Ort', '638', 'SG9jaHN0w7ZnZXIgVGhvbWFzIHUuIFLDtmNrbGluZ2VyIENocmlzdGlhbmEgKEthVyk='),
(479, 'Im Ort', '639', 'U3Ryb2htYXlyIFdlcm5lciB1LiBMZWlkZW5mcm9zdCBOaWNvbGUgKEthVyk='),
(480, 'Im Ort', '640/1', 'U2NobmVsbGVyIFNhcmFoIChLYVcp'),
(481, 'Im Ort', '640/2', 'SG9mc2Nod2FpZ2VyIEJyaWdpdHRlL01pY2hhZWwgKEthVyk='),
(482, 'Im Ort', '640/3', 'SGVpbGlnZW5icnVubmVyIFJvYmVydCB1LiBMaXNhIChLYVcp'),
(483, 'Im Ort', '640/4', 'V2FnbmVyIE1hbmZyZWQgdS4gR3J1YmVyIERhbmllbGEgKEthVyk='),
(484, 'Im Ort', '641/1', 'U2Nob2RlciBNYXJrdXMgKEthVyk='),
(485, 'Im Ort', '641/2', 'U3Ryb2htYXlyIE1hcmlvIHUuIEluZ3JpZCAoS2FXKQ=='),
(486, 'Im Ort', '641/3', 'TmV1ZG9yZmVyIEhlbG11dCB1LiBIdWJlciBLZXJzdGluIChLYVcp'),
(487, 'Im Ort', '641/4', 'QWlnbmVyIEdlcnRydWRlIChLYVcp'),
(488, 'Im Ort', '642', 'SmV0emluZ2VyIFBhdHJpY2sgdS4gTmljb2xlIChLYVcp'),
(489, 'Im Ort', '643', 'U3BpbmRlbGJlcmdlciBBbmRyZWFzIHUuIENsYXVkaWEgKEthVyk='),
(490, 'Im Ort', '644', 'Um90aGVuc2NobGFnZXIgV2VybmVyIHUuIEp1bGlhIChLYVcp'),
(491, 'Im Ort', '645', 'S3JpZnRlciBMYXJzIHUuIEJhY2huZXIgSnVsaWEgKEthVyk='),
(492, 'Im Ort', '646', 'R2FsZGJlcmdlciBNYXR0aGlhcyB1LiBTYWJpbmUgKEthVyk='),
(493, 'Im Ort', '647', 'VGV1ZmwgQmVydGhvbGQgdS4gQWZmZW5ncnViZXIgSW5lcyAoS2FXKQ=='),
(494, 'Im Ort', '650/1', 'S2FtbWVyaG9mZXIgV2FsdHJhdXQgKEthVyk='),
(495, 'Im Ort', '650/2', 'U2Now7ZuZWdnZXIgUmVnaW5hIHUuIEZhcmZlbGVkZXIgSGVyYmVydCAoS2FXKQ=='),
(496, 'Im Ort', '650/3', 'V2FnbmVyIEFuaXRhIChLYVcp'),
(497, 'Im Ort', '650/4', 'U2ltbWVyIENocmlzdGlhbiAoS2FXKQ=='),
(498, 'Im Ort', '651/1', 'QnJ1Y2tuZXIgR2FicmllbGUgKEthVyk='),
(499, 'Im Ort', '651/2', 'U3RlaW5iYWNoZXIgS2xhdXMgdS4gSGFtZXRuZXIgTWFydGluYSAoS2FXKQ=='),
(500, 'Im Ort', '651/3', 'UmVucyBNYXJjZWwgKEthVyk='),
(501, 'Im Ort', '651/4', 'U2Now7ZuYXVlciBBbml0YSAoS2FXKQ=='),
(502, 'Im Ort', '652', 'UmFkbHNww7ZjayBXb2xmZ2FuZyB1LiBNYXJpYSAoS2FXKQ=='),
(503, 'Im Ort', '653', 'U2NoYXR6IERhbmllbCB1LiBTYXJhIChLYVcp'),
(504, 'Im Ort', '663/1', 'UGZlaWZmZXIgSnVsaWEgKEthVyk='),
(505, 'Im Ort', '663/2', 'U2ltbWVyIEFuZHJlYXMgKEthVyk='),
(506, 'Im Ort', '663/3', 'TGl0emVsbGFjaG5lciBQZXRlciwgQlNjIHUuIE1heWVyIEV2YSwgQlNjIChLYVcp'),
(507, 'Im Ort', '663/4', 'SG9sZGVyYmF1bSBTYWJpbmUgKEthVyk='),
(508, 'Im Ort', '663/5', 'UmFiZW5oYXVwdCBIZWxnYSAoS2FXKQ=='),
(509, 'Im Ort', '663/6', 'VMO8Y2hsZXIgTmljb2xlIChLYVcp'),
(510, 'Im Ort', '663/7', 'S3JpZnRlciBSb2xhbmQgKEthVyk='),
(511, 'Im Ort', '663/8', 'R8O8bnRoZXIgSXNhYmVsbGEgKEthVyk='),
(512, 'Im Ort', '663/9', 'R8O8bnRoZXIgTHVrYXMgKEthVyk='),
(513, 'Im Ort', '664/1', 'UGVoYW0gRmxvcmlhbiAoS2FXKQ=='),
(514, 'Im Ort', '664/2', 'R3JpbXBzIFRob21hcyAoS2FXKQ=='),
(515, 'Im Ort', '664/3', 'SG9mc2Nod2FpZ2VyIENocmlzdGlhbiAoS2FXKQ=='),
(516, 'Im Ort', '664/4', 'SGludGVybGVpdG5lciBKw7xyZ2VuIHUuIEdydWJlciBJbmdyaWQgKEthVyk='),
(517, 'Im Ort', '664/5', 'QWZmZW5ncnViZXIgSmVzc2ljYSAoS2FXKQ=='),
(518, 'Im Ort', '664/6', 'U2Now7ZuYXVlciBLZXJzdGluIChLYVcp'),
(519, 'Im Ort', '664/7', 'RnJldW5kbCBDaHJpc3RpYW4gKEthVyk='),
(520, 'Im Ort', '664/8', 'RGVpbmhvZmVyIFZhbGVudGluYSAoS2FXKQ=='),
(521, 'Im Ort', '664/9', 'Uml0dCBSZWluaGlsZGUgdS4gSm9zZWYgKEthVyk='),
(522, 'Im Ort', '666', 'SGFzZWxzdGVpbmVyIFNhYmluZSB1LiBWYXZyaW5hIFJvYmVydA=='),
(523, 'Innergrub', '38', 'UmFkbCBGcmllZHJpY2ggdS4gTWFyaWE='),
(524, 'Innergrub', '39', 'S2Fpc2VybGVobmVyIE1hcmlhIC8gSm9oYW5u'),
(525, 'Innergrub', '40', 'UmVzY2ggRnJhbnogdS4gTWFyaWE='),
(526, 'Innergrub', '41/2', 'RWRlcm1heWVyIExlb3BvbGQgdS4gSW5ncmlk'),
(527, 'Jedersdorf', '21', 'U2NoYWNobmVyIE1hbnVlbCB1LiBCaWNobGVyIEJyaWdpdHRl'),
(528, 'Jedersdorf', '22', 'RWRlcm1heXIgRmVyZGluYW5kIHUuIENocmlzdGEgLyBLYXJsIHUuIEluZ3JpZA=='),
(529, 'Jedersdorf', '23', 'V2llc2VyIEVkaXRoIC8gSGVpw58gTWFnYXJldGU='),
(530, 'Kalchgraben', '176/1', 'RsO8Z2VybCBaaXRh'),
(531, 'Kalchgraben', '176/2', 'RsO8Z2VybCBSb2JlcnQgdS4gR2VybGluZGU='),
(532, 'Kalchgraben', '313/2', 'S2Fsa2hvZmVyIEhlcm1hbm4gdS4gUmVuYXRl'),
(533, 'Kalchgraben', '343/1', 'U2Now7ZyZ2h1YmVyIEZyYW56IHUuIFRoZXJlc2lh'),
(534, 'Kalchgraben', '343/2', 'U3RvY2tpbmdlciBXZXJuZXIgdS4gTWFyZ2l0'),
(535, 'Kaltaigen', '26', 'S2FsdGVuYsO2Y2sgSm9zZWYgdS4gQ2hyaXN0aW5lIC8gQmVybmhhcmQgdS4gTWVsYW5pZSBLYW1tZXJob2Zlcg=='),
(536, 'Kaltaigen', '27', 'S2FsdGVuYsO2Y2sgTGVvcG9sZCB1LiBSZWdpbmE='),
(537, 'Kaltaigen', '28', 'U2VpcmxlaG5lciBGcmFueiB1LiBFcmlrYQ=='),
(538, 'Kaltaigen', '29', 'UGZlaWZmZXIgRmVyZGluYW5kIHUuIENocmlzdGlhbmE='),
(539, 'Kansering', '34', 'U2luZGh1YmVyIE1hcmlh'),
(540, 'Kansering', '35/1', 'SGlydGwgTGVvcG9sZGluZS8gV2FnbmVyIEFudG9uIHUuIEFubmVtYXJpZQ=='),
(541, 'Kansering', '35/2', 'UmVpa2Vyc2RvcmZlciBTaWx2aWEgdS4gTWFya3Vz'),
(542, 'Kansering', '36', 'UGZhZmZlbmVkZXIgS2FybCB1LiBBbm5lbWFyaWUvIE1hcnRpbiB1LiBBbmdlbGlrYQ=='),
(543, 'Kansering', '420', 'U2luZGh1YmVyIEVsaXNhYmV0aA=='),
(544, 'Kautzhof', '24', 'RWJuZXIgSm9oYW5uIHUuIE1hcmlhLyBFYm5lciBNYXJ0aW4gdS4gQmVyZ2VyIERhbmllbGE='),
(545, 'Kettel', '64/1', 'U2Nod2FuZGwgUm9zYQ=='),
(546, 'Kettel', '64/2', 'U2Nod2FuZGwgR2VyaGFyZCB1LiBFZGVsdHJhdWQgLyBQb3VzdGthIEFuZHJlYXMgdS4gTWVsYW5pZQ=='),
(547, 'Kettel', '240/1', 'U2Nod2FuZGwgSGVyYmVydCB1LiBSb3NhIE1hcmlh'),
(548, 'Kettel', '240/2', 'U2Nod2FuZGwgS2FybA=='),
(549, 'Kettel', '287/1', 'TWF1ZXJsZWNobmVyIEpvc2VmIHUuIEJhcmJhcmE='),
(550, 'Kettel', '287/2', 'U2NoYWNoYWZlbGxuZXIgRnJhbno='),
(551, 'Kicking', '104', 'RmFydGhvZmVyIEpvc2VmIHUuIE1hcmlh'),
(552, 'Kicking', '105', 'SHVtcGVsIEpvc2VmYSAvIFN0b2NraW5nZXIgT3R0byB1LiBCcmlnaXR0ZQ=='),
(553, 'Kicking', '333', 'U3RpZWZlbGJhdWVyIEp1bGlhbmUvIERvcmZlciBIZXJtaW5l'),
(554, 'Kleeberg', '208/2', 'QnJhbmRzdMO2dHRlciBIZWxtdXQgdS4gSGVsZ2E='),
(555, 'Kleeberg', '209', 'S3JlbnNsZWhuZXIgRnJhbnogdS4gTGVvcG9sZGluZSAvIE1hcnRpbiB1LiBXZWhuZXIgQXN0cmlk'),
(556, 'Kleeberg', '210', 'SGllc3MgSGVsZ2EgLyBCZXJuaGFyZCAoTldTKQ=='),
(557, 'Kleingassen', '171/1', 'U2Now6RmZmVyIEZyYW56IHUuIEVybmE='),
(558, 'Kleingassen', '172', 'S2FtcG5lciBKb2hhbm5lcw=='),
(559, 'Kleingassen', '244/1', 'UmFkbCBNYXJ0aW4gdS4gRXZlbHluZQ=='),
(560, 'Kleingassen', '244/2', 'SHViZXIgSm9zZWY='),
(561, 'Kleingassen', '296', 'U2NocmVpZXIgR2VybGluZGU='),
(562, 'Kleingassen', '362/1', 'RXR0bGluZ2VyIEthcmwgdS4gTGVvcG9sZGluZQ=='),
(563, 'Kleingassen', '362/2', 'S2lyY2hzdGV0dGVyIE1hcnRpbiB1LiBTYWJpbmU='),
(564, 'Kleingassen', '402', 'UmFkbCBKb3NlZiB1LiBXaW5rbGVyIFNpbHZpYQ=='),
(565, 'Kleingassen', '419', 'U2ltbWVyIEFudG9uIA=='),
(566, 'Kleingassen', '430', 'UmFtc2tvZ2xlciBGcmFueiB1LiBIZWlkZSBNYXJpYQ=='),
(567, 'Kleingassen', '576', 'U2Nob2lzc3dvaGwgSGVyYmVydCB1bmQgTWljaGFlbGEg'),
(568, 'Kleingassen', '577', 'R3NjaG5haWR0bmVyIEFuZHJlYXMgdS4gVmVyb25pa2E='),
(569, 'Kleingassen', '579', 'S2ltbWVzd2VuZ2VyIEV3YWxkIHUuIEx5ZGlh'),
(570, 'Kleingassen', '582', 'U2Nod2FyZW50aG9yZXIgRmxvcmlhbiB1LiBMaXNh'),
(571, 'Kleinnagl', '163', 'R8O8bnRoZXIgSm9zZWYgdS4gTWFyaWE='),
(572, 'Krauenöd', '125', 'QWlnbmVyIE1hbmZyZWQgdS4gVmVyb25pa2EgLyBTb3hiZXJnZXIgQWxvaXMgdS4gVmVyb25pa2E='),
(573, 'Krauenöd', '264', 'U3TDtmNrbGVyIEpvaGFubmVzIHUuIFNhYmluZQ=='),
(574, 'Kromos', '90/1', 'UnVja2Vuc3RlaW5lci1Iw7ZybmRsaHViZXIgU3RlZmFuIHUuIE1vbmlrYQ=='),
(575, 'Kromos', '90/2', 'UnVja2Vuc3RlaW5lciBTdGVmYW4gdS4gS2F0aGFyaW5h'),
(576, 'Kuglau', '91', 'S29ybm3DvGxsZXIgTGVvcG9sZGluZSAvIEdhYnJpZWxlIHUuIEZlaHJpbmdlciBDaHJpc3RpYW4='),
(577, 'Kuglau', '92', 'TGl0emVsbGFjaG5lciBGYW56IHUuIE1hcmlhIC8gRnJhbnogdS4gSGVsZW5l'),
(578, 'Kuglau', '93/1', 'R2Fzc25lciBDaHJpc3RpbmE='),
(579, 'Kuglau', '93/2', 'U3RlaW5iaWNobGVyIEdlcmhhcmQgdS4gR2FicmllbGU='),
(580, 'Kuglau', '237', 'WmF1bmVyIEZyYW56IHVuZCBOeW5qYQ=='),
(581, 'Kumerlehen', '197/1', 'QnJhbmRzdGV0dGVyIExlb3BvbGRpbmU='),
(582, 'Kumerlehen', '197/2', 'QnJhbmRzdGV0dGVyIE1hbmZyZWQg'),
(583, 'Kumpfmühle', '50/1', 'VGhldWVya2F1ZiBIb3JzdCB1LiBSb3Nh'),
(584, 'Kumpfmühle', '50/2', 'VGhldWVya2F1ZiBFcmljaCB1LiBLZXJzdGlu'),
(585, 'Langenöd', '135/1', 'QmFjaGxlciBIaWxkZWdhcmQ='),
(586, 'Langenöd', '135/2', 'TG9sZWEgTWloYWVsYS8gVHLDtnNjaGVyIFZhbmVzc2EgdS4gV2FsdGVy'),
(587, 'Langenöd', '329/1', 'QmFjaGxlciBKb3NlZiB1LiBDaHJpc3RpYW5l'),
(588, 'Langenöd', '329/2', 'QmFjaGxlciBUaGVyZXNpYQ=='),
(589, 'Langenöd', '341/2', 'QsO8aHJpbmdlciBKb2hhbm4='),
(590, 'Lehen', '188/1', 'TWF5cmhvZmVyIEpvaGFubiB1LiBNYXRoaWxkZQ=='),
(591, 'Lehen', '188/2', 'TWF5cmhvZmVyIE1hcmlh'),
(592, 'Lehen', '188/3', 'TWF5cmhvZmVyIENocmlzdG9waCB1LiBSZW5hdGU='),
(593, 'Lehen', '189/1', 'U3RvY2tpbmdlciBPdHRvIHUuIFJvc2E='),
(594, 'Lehen', '189/2', 'Sm9ib2x0bmVyIEZlcmRpbmFuZCB1LiBDaHJpc3Rh'),
(595, 'Leiten', '54/1', 'TGF0c2NoZW5iZXJnZXIgS2FybCwgRGlwbC4tSW5nLg=='),
(596, 'Leiten', '54', 'R2VmbMO8Z2VsaG9mIExhdHNjaGVuYmVyZ2Vy'),
(597, 'Leiten', '54/2', 'UG9wIEdoZW9yZ2UgdS4gTHVtaW5pdGEgTWlvcml0YQ=='),
(598, 'Leiten', '54/3', 'QnV0aCBNYXJpYW4sIFZhc2lsZSBDb25zdGFudGlu'),
(599, 'Leiten', '54/4', 'TXVzcyBIZWxnYQ=='),
(600, 'Leiten', '55', 'U2Nob2RlciBNYXJpYQ=='),
(601, 'Liegl', '211', 'S29nbGVyIEVsaXNhYmV0aA=='),
(602, 'Linsberg', '169', 'RGllbWluZ2VyIFJvc2luYSAvIEhlcm1hbm4='),
(603, 'Maaberg', '126/1', 'QsO8cmluZ2VyIEpvc2VmIC8gSm9zZWYgdS4gTGVvcG9sZGluZQ=='),
(604, 'Maaberg', '413', 'VGF0enJlaXRlciBHb3R0ZnJpZWQgdS4gSGVybWluZSAvIEhhcmFsZCB1LiBFcmljaA=='),
(605, 'Marienthal', '12/1', 'RnJldWRlbnNjaHVzcyBQZXRlci8gR2VybGluZGU='),
(606, 'Marienthal', '12/2', 'RnJldWRlbnNjaHVzcyBFbmdlbGJlcnQ='),
(607, 'Marienthal', '143/1', 'UGVjaGhhY2tlciBKb2hhbm4='),
(608, 'Marienthal', '143/2', 'SGludGVybWF5ciBKb2hhbm4gdS4gSGVsZ2E='),
(609, 'Marienthal', '144', 'U3RlaW5iYXVlciBKb3NlZiB1LiBFdmEtTWFyaWE='),
(610, 'Marienthal', '236', 'QWlnbmVyIENsYXVkaWEgdS4gTGVjaG5lciBNYXJrdXM='),
(611, 'Mayrhäusl', '221/1', 'RmFyZmVsZWRlciBHb3R0ZnJpZWQgdS4gUm9zYQ=='),
(612, 'Mayrhäusl', '221/2', 'S2FtbWVyaG9mZXIgQ2hyaXN0aWFu'),
(613, 'Mayrhäusl', '221/3', 'RmFyZmVsZWRlciBFcm5zdCB1LiBCZXR0aW5h'),
(614, 'Metzenöd', '31', 'Uml0dCBIZXJtYW5u'),
(615, 'Metzenöd', '242', 'S29ybm3DvGxsZXIgRXJuYQ=='),
(616, 'Metzenöd', '248', 'ZHp0LiB1bmJld29obnQg'),
(617, 'Mitterfeld', '111/1', 'UmVpc2luZ2VyIEx1ZHdpZyB1LiBIZXJtaW5lL0x1ZHdpZyB1LiBLYXJpbg=='),
(618, 'Mitterfeld', '111/2', 'UmVpc2luZ2VyIEfDvG50aGVyIHUuIEhvZm1hcmNoZXIgUGV0cmE='),
(619, 'Mitterfeld', '239', 'UmVpc2luZ2VyIEtsYXVzIHUuIExlaWRlbmZyb3N0IEV2YQ=='),
(620, 'Mitterfeld', '517/1', 'UmllZ2xlciBMZW9wb2xkaW5l'),
(621, 'Mitterfeld', '517/2', 'UGlscyBTYWJyaW5h'),
(622, 'Mitterfeld', '518', 'S2FtbWVyaG9mZXIgSGVyYmVydCB1LiBSb3N3aXRh'),
(623, 'Mitterfeld', '519', 'R3J1YmJhdWVyIFdpbGxpYmFsZCB1LiBBbm5h'),
(624, 'Mitterfeld', '520', 'UGZhZmZlbmVkZXIgS2FybCB1LiBJbmdldHJhdWQ='),
(625, 'Mitterfeld', '521', 'R3JhZiBQaXVzIHUuIEdhYnJpZWxl'),
(626, 'Mitterfeld', '526', 'SG9jaHJpZXNlciBMZW9wb2xkIHUuIFNvbmph'),
(627, 'Mitterfeld', '528', 'V2FnbmVyIFdlcm5lciB1LiBNYXJnaXQ='),
(628, 'Mitterfeld', '529', 'R2Fzc25lciBBbnRvbiB1LiBBbm5lbWFyaWU='),
(629, 'Mitterfeld', '530', 'V2lzY2hlbmJhcnQgSm9zZWYsIERpcGwuLUluZy4gdS4gQ2xhdWRpYQ=='),
(630, 'Mitterfeld', '531/1', 'UHJhc3NlciBCZXJ0YQ=='),
(631, 'Mitterfeld', '531/2', 'S3JpZnRlciBTYWJpbmU='),
(632, 'Mitterfeld', '532', 'SMO8cm5lciBXYWx0ZXIgdS4gUGV0cmEgLyBSaWNjYXJkbyB1LiBWYW5lc3Nh'),
(633, 'Mitterfeld', '541/1', 'QsO8aHJpbmdlciBKb2hhbm4gdS4gTWFyaWE='),
(634, 'Mitterfeld', '541/2', 'QsO8aHJpbmdlciBTYXJhaA=='),
(635, 'Mitterfeld', '542', 'S2FtbWVyaG9mZXIgQW50b24gdS4gTWljaGFlbGE='),
(636, 'Mitterfeld', '546', 'QWZmZW5ncnViZXIgR2VyaGFyZCB1LiBQZXRyYQ=='),
(637, 'Mitterfeld', '547', 'UmFiZW5oYXVwdCBKw7xyZ2VuIHUuIExpY2h0ZW5iZXJnZXIgQ2hyaXN0aW5h'),
(638, 'Mitterfeld', '548', 'SGVuw7ZrbCBIZXJ3aWcgdS4gTWFyaW9u'),
(639, 'Mitterfeld', '549', 'QmxhbWF1ZXIgRXJpY2ggdS4gRGFuaWVsYQ=='),
(640, 'Mitterfeld', '550', 'VGF0enJlaXRlciBBbmRyZWFzIHUuIE1lbGFuaWU='),
(641, 'Mitterfeld', '551', 'U2NoaWVmZXIgRnJhbnogdS4gU2FiaW5l'),
(642, 'Mitterfeld', '552', 'S2FwZWxsZXIgR2Vyb2xkIHUuIFBldHJh'),
(643, 'Mitterfeld', '553', 'VGV1ZmwgU2FiaW5l'),
(644, 'Mitterfeld', '564', 'S2lyY2h3ZWdlciBDaHJpc3RpYW4gdS4gRWxmcmllZGU='),
(645, 'Mitterfeld', '565', 'UmFhYmVyIE1hbnVlbGE='),
(646, 'Mitterfeld', '566', 'R2Fzc2Vsc2RvcmZlciBKw7xyZ2VuIHUuIE5hZGph'),
(647, 'Mitterfeld', '567', 'WsO2Y2hiYXVlciBNYXJ0aW5hIHUuIFJhYmVuaGF1cHQgUm9sYW5kLCBESShGSCk='),
(648, 'Mitterfeld', '568', 'RGF1dGluZ2VyIFN0ZXBoYW4gdS4gRG9yaXM='),
(649, 'Mitterfeld', '569', 'UHJlaW5mYWxrIE1hcmlh'),
(650, 'Mitterfeld', '619', 'QsO8aHJpbmdlciBNYW5mcmVkIHUuIFJlZ2luYQ=='),
(651, 'Mitterfeld', '620', 'VWxicmljaCBSdWRvbGYgdS4gSGVpZGVtYXJpZSAoS2FXKQ=='),
(652, 'Mitterfeld', '621', 'Qm9zendhbGQgUm9sYW5kIHUuIFNjaGF0eiBNb25pa2EgKEthVyk='),
(653, 'Mitterfeld', '622', 'UsO2c2VsIE1pY2hhZWwgdS4gQmVybmFkZXR0ZSAoS2FXKQ=='),
(654, 'Mitterfeld', '623', 'U3RhdWZlciBSb2xhbmQgdS4gS2FyaW4gKEthVyk='),
(655, 'Mitterfeld', '624', 'U2Now7ZyZ2h1YmVyIFJvbWFuIHUuIE1heXJob2ZlciBTeWx2aWEgKEthVyk='),
(656, 'Mitterfeld', '625', 'V2llc2VyIEpvaGFubiB1LiBNYXRoaWxkZSAoS2FXKQ=='),
(657, 'Moos', '194/1', 'U294YmVyZ2VyIExlb3BvbGRpbmU='),
(658, 'Moos', '194/2', 'U294YmVyZ2VyIFJlaW5ob2xkIHUuIEFzdHJpZA=='),
(659, 'Moos', '195', 'SMO2cmxlbmRzYmVyZ2VyIE1hbmZyZWQgdS4gQW5uZW1hcmll'),
(660, 'Moselberg', '168', 'V2FnbmVyIEVsZnJpZWRlIC8gSsO8cmdlbiB1LiBTYW5kcmE='),
(661, 'Moselberg', '314', 'WmVoZXRuZXIgSm9zZWYgdS4gTWFyaWFubmUgLyBKb3NlZg=='),
(662, 'Nagelhub', '223', 'SGlrbCBNb25pa2E='),
(663, 'Neubauer', '252/1', 'U2Now7Zya2h1YmVyIEVyaWNoIHUuIE1hcmlh'),
(664, 'Neubauer', '252/2', 'R8O8bnRoZXIgS2FybCB1LiBSZWdpbmE='),
(665, 'Niederegg', '174/1', 'QnVyZ2hhcnQgQ2hyaXN0b3BoIHUuIEJhcmJhcmEsIE1B'),
(666, 'Niederegg', '174/2', 'QnVyZ2hhcnQgRWxmcmllZGU='),
(667, 'Niederegg', '175', 'U3RlaW5kbCBLYXJs'),
(668, 'Niederegg', '251', 'SGludGVybGVpdG5lciBDaHJpc3RpYW4gdS4gRG9yaXM='),
(669, 'Niederegg', '475/1', 'SGludGVybGVpdG5lciBPdHRvLCBJbmcuIHUuIEFuaXRh'),
(670, 'Niederegg', '475/2', 'SGludGVybGVpdG5lciBNYXJrdXMgdS4gUmljYXJkYQ=='),
(671, 'Oismühle', '146/1', 'QsO8cmJhdW1lciBLZXJzdGluIC8gU2Nod2FyeiBNYXJnaXQ='),
(672, 'Oismühle', '146/2', 'ZHp0LiB1bmJld29obnQg'),
(673, 'Oismühle', '146/3', 'UHJpZ2wgTGVvcG9sZA=='),
(674, 'Oismühle', '146/4', 'SGlsbGluZ2VyIFJhcGhhZWwgdS4gTW9zZXIgTmlrb2xh'),
(675, 'Oismühle', '146/5', 'ZHp0LiB1bmJld29obnQg'),
(676, 'Oismühle', '147', 'TWFpZXIgSW5nZXRyYXV0LCBNYWcuIHUuIEJ1cmhhcmQsIERyLg=='),
(677, 'Oismühle', '148', 'S3JhZnR3ZXJrIE9pc23DvGhsZQ=='),
(678, 'Oismühle', '245/1', 'S2VybiBSZWluaG9sZCB1LiBLZXJuLUhvY2hzdHJhc3NlciBSb3NhIE1hcmlh'),
(679, 'Oismühle', '256/1', 'S25vbGwgSGVybWFubg=='),
(680, 'Oismühle', '256/2', 'S25vbGwgSGVyaWJlcnQgdS4gTWFyaWE='),
(681, 'Oismühle', '257/1', 'U2l4IFJvbWFuIHUuIEZyYW56aXNrYQ=='),
(682, 'Oismühle', '259/1', 'SGludGVybGVpdG5lciBGcmllZHJpY2gsIE9TdFIgREkgdS4gTGVvcG9sZGluZQ=='),
(683, 'Oismühle', '259/2', 'SGludGVybGVpdG5lciBGcmllZHJpY2gsIEhSIERJIHUuIFJlbmF0ZQ=='),
(684, 'Oismühle', '286/1', 'VGVtcGwgUm9tYW4gdS4gUmVuYXRl'),
(685, 'Oismühle', '286/2', 'S29nbGVyIFBldGVyIHUuIE1hbnVlbGE='),
(686, 'Oismühle', '293/1', 'V2FsbGVuc3RvcmZlciBNYXJpYQ=='),
(687, 'Oismühle', '337', 'QmFjaGxlciBSb2JlcnQsIEluZy4gdS4gUmllZGxlciBIZWlkcnVu'),
(688, 'Oismühle', '350', 'U2l4IEZyYW56IHUuIENocmlzdGluZQ=='),
(689, 'Oismühle', '351', 'U2l4IE1vbmlrYSB1LiBKb3NlZiAvIEtyaXN0aW5hIA=='),
(690, 'Oismühle', '425', 'S8O8aGhhcyBKb3NlZiB1LiBJbmdyaWQ='),
(691, 'Oismühle', '477', 'QmF1bWdhcnRuZXIgSGVsbXV0IHUuIE1hcmlhIC8gS2FsdGVuYsO2Y2sgQW5kcmVhcyB1LiBNZWxhbmll'),
(692, 'Oismühle', '571', 'S8O8aGhhcyBKb2hhbm5lcywgRHIu'),
(693, 'Oismühle', '572/1', 'TWFpcmhvZmVyIE1hdHRoaWFzIHUuIFN0ZWluZXIgU2lsdmlh'),
(694, 'Oismühle', '572/2', 'SG9jaHN0cmFzc2VyIEJlbmVkaWt0'),
(695, 'Oismühle', '572/3', 'S2lyY2h3ZWdlciBSZWdpbmE='),
(696, 'Oismühle', '572/4', 'ZHp0LiB1bmJld29obnQg'),
(697, 'Oismühle', '572/5', 'ZHp0LiB1bmJld29obnQg'),
(698, 'Oismühle', '572/6', 'ZHp0LiB1bmJld29obnQg'),
(699, 'Oismühle', '572/7', 'U2Now7ZyZ2h1YmVyIERhZ21hcg=='),
(700, 'Oismühle', '572/8', 'R3Jvw59iZXJnZXIgSm9oYW5uZXMgdS4gRW5nZWxicmVjaHRzbcO8bGxlciBKdWxpYSwgTWFnLiAoRkgp'),
(701, 'Oismühle', '573/1', 'U3RlaW5iaWNobGVyIFN0ZWZhbg=='),
(702, 'Oismühle', '573/2', 'R3nDtnLDtmsgSGVpZGVtYXJpZQ=='),
(703, 'Oismühle', '573/3', 'UmVpY2hlbnZhdGVyIEJlcm5oYXJkIHUuIFNhbmRyYQ=='),
(704, 'Oismühle', '573/4', 'V2llc2VyIFBhdHJpY2sgdS4gTWFydGluYSBSZWl0ZXI='),
(705, 'Oismühle', '573/5', 'QnJlaXRsZXIgTWFyaWE='),
(706, 'Oismühle', '573/6', 'ZHp0LiB1bmJld29obnQg'),
(707, 'Oismühle', '573/7', 'R3LDtmJsaW5nZXIgQ2hyaXN0b3Bo'),
(708, 'Oismühle', '573/8', 'UmFmZXplZGVyIENocmlzdG9waCB1LiBBbGV4YW5kcmE='),
(709, 'Oismühle', '574/1', 'V2VuZ2VyIEpvc2VmIHUuIEhhaWRlbiBNYXJ0aW5h'),
(710, 'Oismühle', '574/2', 'TWljYSBFcm5zdA=='),
(711, 'Oismühle', '574/3', 'RmluayBSZW5hdGU='),
(712, 'Oismühle', '574/4', 'QmljZWsgU3RlZmFuIHUuIFRhbWFyYQ=='),
(713, 'Oismühle', '574/5', 'QWhyZXIgQ2hyaXN0YQ=='),
(714, 'Oismühle', '574/6', 'ZHp0LiB1bmJld29obnQ='),
(715, 'Oismühle', '574/7', 'SGludGVybGVpdG5lciBNYXR0aGlhcyB1LiBCaW5kZXIgS2Fyb2xpbmU='),
(716, 'Oismühle', '574/8', 'TGVpY2h0ZnJpZWQgSm9zZWY='),
(717, 'Oismühle', '632', 'U2l4IExlb3BvbGQgdS4gSGVsZ2E='),
(718, 'Parkfried', '70', 'UHJhbmRuZXIgS2FybCB1LiBSZWdpbmEgLyBUaG9tYXM='),
(719, 'Parkfried', '71/1', 'R2VpcmhvZmVyIEZyYW56IHUuIEluZ3JpZA=='),
(720, 'Parkfried', '71/2', 'ZHp0LiB1bmJld29obnQg'),
(721, 'Parkfried', '71/3', 'VGFuemVyIFNpbW9uIHUuIFBhdHJpY2s='),
(722, 'Parkfried', '72', 'UmFkbCBKdWxpYW5hIC8gSGVybWFubiB1LiBHZXJ0cmF1ZA=='),
(723, 'Parkfried', '73/1', 'S29ybm3DvGxsZXIgRnJhbnogdS4gRWxmcmllZGU='),
(724, 'Parkfried', '73/2', 'S29ybm3DvGxsZXIgRXJ3aW4gdS4gQ29yaW5uYQ=='),
(725, 'Parkfried', '74/1', 'U2Nob2RlciBBbG9pc2lh'),
(726, 'Parkfried', '74/2', 'U3RlaW5iYXVlciBNYW51ZWxhIHUuIFJvc2VuYXVlciBNYXJrdXM='),
(727, 'Parkfried', '74/3', 'U2Nod2FuZGwtWmVmaSBHZXJ0cmF1ZA=='),
(728, 'Parkfried', '247/1', 'SGFzbGluZ2VyIEpvaGFubiB1LiBFcmlrYSBNYXJpYQ=='),
(729, 'Parkfried', '262', 'TcO8bGxlciBGcmFueiB1LiBDaHJpc3RpbmU='),
(730, 'Parkfried', '364/1', 'RmVsbG5lciBIZWxsbXV0IHUuIEVyaWth'),
(731, 'Parkfried', '364/2', 'RmVsbG5lciBIZWxtdXQgdS4gTW9uaWth'),
(732, 'Parkfried', '417/1', 'U3RlaW5iaWNobGVyIFN0ZWZhbiB1LiBIZWlkZW1hcmll'),
(733, 'Parkfried', '417/2', 'Vm9yd2FnbmVyIE1hcmt1cyB1LiBTdGVpbmJpY2hsZXIgQ2xhdWRpYQ=='),
(734, 'Parkfried', '418', 'TGVpdG5lciBKb2hhbm4gdS4gSXJtZ2FyZA=='),
(735, 'Penk', '129/1', 'V2ViZXIgV2FsdGVyIHUuIExpZXNlbG90dGU='),
(736, 'Penk', '129/2', 'R2Fzc25lciBMZW9wb2xkIHUuIEJhcmJhcmE='),
(737, 'Penk', '130', 'R3J1YmVyIEFsb2lzaWEgLyBMYW5nIEtsYXVkaWEgdS4gQW5kcmVhcw=='),
(738, 'Penk', '281/1', 'U2NobWlkdCBKb2hhbm4gdS4gSGlsZGVnYXJk'),
(739, 'Penk', '281/2', 'U2NobWlkdCBHZXJhbGQgdS4gR2VydHJhdWQ='),
(740, 'Pimshof', '158/1', 'R3J1YmVyIFN0ZWZhbiB1LiBGcmllZGVyaWtl'),
(741, 'Pimshof', '158/2', 'R3J1YmVyIEhhcmFsZCAgdS4gTmluYQ=='),
(742, 'Pötzlöd', '84', 'RWRsaW5nZXIgTWFuZnJlZCwgTWFnLiB1LiBFbGlzYWJldGg='),
(743, 'Pratstrum', '56', 'RmVocmluZ2VyIFN0ZWZhbiwgTWFnLiB1bmQgRWxmcmllZGUgIE5XUw=='),
(744, 'Pratstrum', '57', 'R3J1YmJhdWVyIEZyYW56'),
(745, 'Pratstrum', '58/1', 'ZHp0LiB1bmJld29obnQ='),
(746, 'Pratstrum', '58/2', 'TmV1ZG9yZmVyIEVybnN0IHUuIEFsZXhhbmRyYQ=='),
(747, 'Pratstrum', '59', 'R3V0bWFuZGVsYmVyZ2VyIFN0ZWZhbiB1LiBFcmlrYQ=='),
(748, 'Pratstrum', '60/1', 'U3RlaW5wYXJ6ZXIgRW1pbGlh'),
(749, 'Pratstrum', '60/2', 'ZHp0LiB1bmJld29obnQg'),
(750, 'Pyhra', '79', 'UmFtc2F1ZXIgRnJhbnogLyBLYXJsIHUuIEhlbGdh'),
(751, 'Pyhra', '412', 'UmFtc2F1ZXIgRnJhbnogdS4gRWxpc2FiZXRo'),
(752, 'Rechtlehen', '134', 'QnJhbmRzdGV0dGVyIFdhbHB1cmdhLCBNYWcu'),
(753, 'Reiser', '128/1', 'U2NobWlkdCBHZW9yZyB1LiBXYWlsemVyIFNpbW9uZQ=='),
(754, 'Reiser', '128/2', 'U2NobWlkdCBBbnRvbiB1LiBIZXJ0YQ==');
INSERT INTO `haeuserliste` (`idhaus`, `strasse`, `hausNr`, `bewohner`) VALUES
(755, 'Reith', '131/1', 'S2FsdGVuYsO2Y2sgQmFyYmFyYQ=='),
(756, 'Reith', '131/2', 'S2FsdGVuYsO2Y2sgRnJhbnogdS4gR2VydHJ1ZGU='),
(757, 'Riedl', '165', 'QWlnbmVyIFJvc2EgLyBNYXJnaXQgLyBNYXJ0aW4gdS4gQ2hyaXN0YQ=='),
(758, 'Riedl', '166/1', 'QsO8aHJpbmdlciBLYXRoYXJpbmE='),
(759, 'Riedl', '166/2', 'QsO8aHJpbmdlciBKb3NlZiB1LiBCYXJiYXJh'),
(760, 'Riedl', '167', 'ZHp0LiBuaWNodCBiZXdvaG50IChTdG9ja2luZ2VyIE1pY2hhZWxhKQ=='),
(761, 'Röckling', '219', 'UGF5cmxlaXRuZXIgRnJhbnogdS4gRWxmcmllZGU='),
(762, 'Sand', '132', 'R8O8bnRoZXIgU2VyYXBoaW5lIC8gSm9zZWYgdS4gR2VydHJhdWQgLyBCZXJuaGFyZA=='),
(763, 'Sand', '133/1', 'QmVyZ2VyIEVybmVzdGluZQ=='),
(764, 'Sand', '133/2', 'R3J1YmJhdWVyIEVybmVzdGluZQ=='),
(765, 'Sand', '133/3', 'S2lyY2hkb3JmZXIgVWxyaWNoIHUuIFVscmlrZQ=='),
(766, 'Sand', '369', 'R8O8bnRoZXIgRnJhbnogdS4gRWRlbHRyYXVk'),
(767, 'Sand', '431', 'SGF5ZG4gTWFuZnJlZCB1LiBHZXJsaW5kZQ=='),
(768, 'Satzing', '164', 'TWF5cmhvZmVyIEpvaGFubiB1LiBDaHJpc3RpbmU='),
(769, 'Satzing', '224', 'ZHp0LiB1bmJld29obnQgLSBuaWNodCBiZXdvaG5iYXI='),
(770, 'Schacher', '114/1', 'UmVpdG5lciBKdWxpYQ=='),
(771, 'Schacher', '114/2', 'UmVpdG5lciBTdGVmYW4gdS4gV2FsdHJhdWQ='),
(772, 'Schacher', '241', 'QmF1ZXJuZmVpbmQgR290dGZyaWVkIHUuIE1hcmdpdA=='),
(773, 'Scherhub', '112', 'R3J1YmhvZmVyIEpvaGFubiB1LiBNYXJpYQ=='),
(774, 'Schoderhof', '100/1', 'R3J1YmVyIEVybmE='),
(775, 'Schoderhof', '100/2', 'R3J1YmVyIEpvaGFubmVzIHUuIFNhbmRyYQ=='),
(776, 'Schoderhof', '101/1', 'R3J1YmVyIE9zd2FsZCB1LiBXYWx0cmF1ZA=='),
(777, 'Schoderhof', '101/2', 'R3J1YmVyIEhlbG11dCwgRHIuICB1LiBFdmEgLSBOV1M='),
(778, 'Schöndorf', '77', 'UmllZ2xlciBGcmFueiB1LiBNYXJpYQ=='),
(779, 'Schöndorf', '78', 'S2FtbWVyaG9mZXIgSHVnby8gSHVnbyB1LiBFdmEtTWFyaWE='),
(780, 'Schörghub', '187', 'WmVoZXRuZXIgVGhvbWFzIHUuIEluZ3JpZA=='),
(781, 'Schörghub', '230', 'S2FsdGVuYsO2Y2sgUm9zZW1hcmll'),
(782, 'Schörghub', '235', 'U2Now7ZyZ2h1YmVyIEZyYW56IHUuIE1hcmlh'),
(783, 'Schützenegg', '37', 'TGVobmVyIEFubmE='),
(784, 'Spachl', '127/1', 'V2FnbmVyIExlb3BvbGQgdS4gRG9yZm1heWVyIE5vdGJ1cmdh'),
(785, 'Spachl', '127/2', 'V2FnbmVyIEJlcm5oYXJkIHUuIE1hcmlh'),
(786, 'Stelzenberg', '265/1', 'UGFsbXN0ZWluZXIgTWFyaW8gdS4gTWF5cmhvZmVyIEp1bGlh'),
(787, 'Stelzenberg', '265/2', 'UGxhdHplciBFcmljaCB1LiBMZWl0aG5lciBNaWNoYWVsYQ=='),
(788, 'Stelzenberg', '285/1', 'ZHp0LiB1bmJld29obnQg'),
(789, 'Stelzenberg', '285/2', 'U2Now7x0dCBKb3NlZiAgICAgICAgICAg'),
(790, 'Stelzenberg', '291', 'R3J1YmhvZmVyIEhlbG11dA=='),
(791, 'Stelzenberg', '320/1', 'RmVsYmVyIEVsZW9ub3JlIHUuIEJlc2VuYsO2Y2sgSm9oYW5u'),
(792, 'Stelzenberg', '320/2', 'RmVsYmVyIEFuaXRh'),
(793, 'Stelzenberg', '397', 'V2Vpc2hhciBJbmdyaWQ='),
(794, 'Stelzenberg', '415', 'U2Now7x0dCBGcmFueiB1LiBFbGZyaWVkZQ=='),
(795, 'Stelzenberg', '416', 'Uml0dG1hbm5zYmVyZ2VyIFNpZWdmcmllZCB1LiBDaHJpc3Rh'),
(796, 'Stelzenberg', '440', 'RWRlcm1heXIgQWxmcmVkIHUuIE1hcmlhbm5l'),
(797, 'Stelzenberg', '489', 'V2FnbmVyIEVkdWFyZCwgRGlwbC4gSW5nLiB1LiBFZGVsdHJhdWQ='),
(798, 'Stelzenberg', '490', 'RmVocmluZ2VyIEVybnN0IHUuIEpvaGFubmE='),
(799, 'Stelzenberg', '491', 'R2FsbGh1YmVyIEhlbG11dCB1LiBBaWduZXIgU29uamE='),
(800, 'Stelzenberg', '492', 'WmVpdGxob2ZlciBUaG9tYXMgdS4gV2llc2VyIERhbmllbGEg'),
(801, 'Stelzenberg', '493', 'SGludGVycGxhdHRuZXIgTWFuZnJlZCB1LiBGcmFueiBHZXJ0cnVkZSA='),
(802, 'Stelzenberg', '494', 'TcO8aGx3YW5nZXIgV29sZmdhbmcgdS4gRXZh'),
(803, 'Stelzenberg', '495', 'THVtZXRzYmVyZ2VyIEpvc2VmIHUuIEluZ2VyIExpc2U='),
(804, 'Stelzenberg', '585', 'U2NobmVpZGVyIFdvbGZnYW5nIHUuIE1hbnVlbGE='),
(805, 'Stelzenberg', '586', 'V2ltbWVyIEJldHRpbmEgdS4gSW5nLiBQZXRlciBTdGVpbmVy'),
(806, 'Stelzenberg', '587', 'Wml0dGVyZXIgQmlyZ2l0IHUuIEthbGtob2ZlciBNYW5mcmVk'),
(807, 'Stelzenberg', '588', 'QWRlbHNidXJnIFNhYmluZS8gTW9uaWth'),
(808, 'Stelzenberg', '589', 'VGxhY2JhYmEgUm9iZXJ0IHUuIEVoZWJydXN0ZXIgU2FicmluYQ=='),
(809, 'Stelzenberg', '590', 'RWRlcm1heXIgTWFya3VzIHUuIERvcmlz'),
(810, 'Stelzenberg', '648', 'Uml0dG1hbm5zYmVyZ2VyIFNpZWdmcmllZCB1LiBTeWx2aWEsIEJTYw=='),
(811, 'Stelzenberg', '649', 'UG94aG9mZXIgVGhvbWFzIHUuIEJ1Y2hpbmdlciBQZXRyYQ=='),
(812, 'Stelzenberg', '654', 'QnJlaXRlbmJlcmdlciBNYXJrdXMgdS4gU2FuZHJhLCBCRWQg'),
(813, 'Stelzenberg', '660', 'TmV1ZG9yZmVyIEJhcmJhcmEgdS4gU3RyZWl0bmVyIEJlcm5oYXJk'),
(814, 'Straß', '80', 'U3RvY2tpbmdlciBUaGVyZXNpYS8gTWljaGFlbGEgdS4gU2NobMO2Z2xob2ZlciBHZXJoYXJk'),
(815, 'Straß', '81', 'U3Ryb2htYXlyIE1hcmlhIC8gTWFydGluIHUuIFdpbmtsZXIgTWVsYW5pZQ=='),
(816, 'Straß', '284', 'ZHp0LiBVbmJld29obnQsIEJlcmd0aGFsZXIgTWF0aGlsZGU='),
(817, 'Stupfreit', '106', 'QnJ1bmVyIEpvc2VmYQ=='),
(818, 'Stupfreit', '107', 'QXNjaGF1ZXIgR2VyYWxkLCBJbmcuIHUuIFJvc3dpdGhh'),
(819, 'Stupfreit', '108/1', 'R3VnbGVyIE1hcmlhbm5l'),
(820, 'Stupfreit', '108/2', 'R3VnbGVyIFRob21hcywgSW5nLiB1LiBUaGVyZXNpYSwgQkVkIA=='),
(821, 'Stupfreit', '300', 'VGhleWVyIEdlcmhhcmQ='),
(822, 'Stupfreit', '433', 'R3J1YmJhdWVyIExlb3BvbGQgdS4gR2VydHJ1ZA=='),
(823, 'Thalbauer', '49', 'TWF1cmVybGVobmVyIEhlcm1pbmUvIEhlcm1hbm4gdS4gS2Fyb2xpbmU='),
(824, 'Tiefenweg', '18/1', 'SMO2bmlnbCBGcmFueiB1LiBCZXJ0YQ=='),
(825, 'Tiefenweg', '18/2', 'SMO2bmlnbCBGcmFueiB1LiBGZWhyaW5nZXIgRWxmcmllZGU='),
(826, 'Tiefenweg', '19', 'U2NobWlkdCAgR2VydHJ1ZA=='),
(827, 'Tiefenweg', '20', 'TGVpdG5lciBGcmFueiB1LiBHZXJ0cmF1ZA=='),
(828, 'Trauner', '98', 'R8O2bHpuZXIgQWxvaXNpYSAvIEpvc2VmIA=='),
(829, 'Trauner', '99', 'ZHp0LiB1bmJld29obnQsIEdydWJlciBPc3dhbGQ='),
(830, 'Vielmetzen', '87/1', 'UnVzc21heXIgU3RlZmFuIC8gS2FwcGwgRXZlbHluIHUuIFLDvGNrbGluZ2VyIE1hcmlv'),
(831, 'Vielmetzen', '87/3', 'V29obmdydXBwZSBIZWlkbG1haXIgR21iSA=='),
(832, 'Vielmetzen', '88/1', 'UG94aG9mZXIgSGVpbnJpY2ggdS4gTWFyaWE='),
(833, 'Vielmetzen', '88/2', 'S3JlbnNsZWhuZXIgQ2hyaXN0b3BoIHUuIEFuZHJlYQ=='),
(834, 'Vielmetzen', '89', 'SGFiZXJmZWxsbmVyIE1hcmlhIC8gUm9zZW5mZWxsbmVyLUhhYmVyZmVsbG5lciBKb2hhbm4sIE1hZy4oRkgpIHUuIEFuZHJlYQ=='),
(835, 'Waldesblick', '360', 'R2FsZGJlcmdlciBGbG9yaWFuIHUuIFNhbmRyYQ=='),
(836, 'Waldesblick', '394', 'V8O2Z2luZ2VyIFJvc2E='),
(837, 'Waldesblick', '398', 'Uml0dCBNYXJ0aW4='),
(838, 'Waldesblick', '401', 'UmFtc2F1ZXIgR2VyYWxkIHUuIEh1dHRlciBSZWdpbmE='),
(839, 'Waldesblick', '408', 'TWF5cmhvZmVyIEZyYW56IHUuIE1hcmlh'),
(840, 'Waldesblick', '409', 'V2FnbmVyIExlb3BvbGQgdS4gRWxmcmllZGU='),
(841, 'Waldesblick', '410', 'UHJ1Y2tuZXIgR8O8bnRlciwgSW5nLiB1LiBNaWNoYWVsZQ=='),
(842, 'Waldesblick', '428', 'U2NobWlkdCBKb3NlZiB1LiBSb3N3aXRoYQ=='),
(843, 'Waldesblick', '508', 'RnVzc2JhbGxjbHViaGF1cw=='),
(844, 'Waldesblick', '509', 'VGVubmlzY2x1YmhhdXM='),
(845, 'Waldesblick', '510', 'QXVmYmFocnVuZ3NoYWxsZQ=='),
(846, 'Waldesblick', '513', 'TGFtcGUgU3RlZmFuaWUsIE1hZy4gdS4gS29nbGVyIEfDvG50aGVyIA=='),
(847, 'Waldesblick', '514', 'SMO2cm5kbGVyIEhlcmJlcnQgdS4gQnJpZ2l0dGU='),
(848, 'Waldesblick', '515/1', 'U3Ryb2htYXlyIEZyYW56IHUuIFVscmlrZQ=='),
(849, 'Waldesblick', '515/2', 'U3Ryb2htYXlyIFJlaW5oYXJkIHUuIExpY2h0ZW5iZXJnZXIgV2FsdHJhdWQ='),
(850, 'Waldesblick', '515', 'TWFsZXJlaSBTdHJvaG1heXI='),
(851, 'Waldesblick', '516', 'UGlseiBSb2JlcnQsIEluZy4gdS4gSW5ncmlk'),
(852, 'Waldesblick', '522', 'QmF1ZXIgS2FybA=='),
(853, 'Weingartl', '138/1', 'SGVpZGVuIEpvaGFubiB1LiBKb2hhbm5h'),
(854, 'Weingartl', '138/2', 'TWFkZXJ0aGFuZXIgSm9zZWYgdS4gR2FicmllbGE='),
(855, 'Weingartl', '250', 'RWJuZXIgUGF1bGE='),
(856, 'Weingartl', '255', 'QWRsYmVyZ2VyIExlb3BvbGRpbmU='),
(857, 'Weingartl', '258', 'R3LDvGJsZXIgRnJhbnogdS4gSGVkd2ln'),
(858, 'Weingartl', '283/1', 'Vm9nbGh1YmVyIFJvYmVydCwgTWFnLiA='),
(859, 'Weingartl', '328', 'SGVpZGVuIENocmlzdGlhbg=='),
(860, 'Weingartshof', '207', 'UGlja2wgSm9zZWZhIC8gSG9jaGJpY2hsZXIgS2FybCB1LiBFbGlzYWJldGg='),
(861, 'Weingartshof', '232', 'QmllcmJhdW1lciBUaGVyZXNpYSAvIFRlbXBlbG1heXIgSGVyYmVydCB1LiBBbmRyZWE='),
(862, 'Widschachen', '192', 'Rmxhc2NoIENocmlzdGluZSB1LiBBbGZyZWQ='),
(863, 'Widschachen', '193', 'V2llc2VyIENocmlzdGluZQ=='),
(864, 'Wiesmühl', '159/1', 'UsO2Y2tsaW5nZXIgQWxvaXMgdS4gQ2hyaXN0aW5l'),
(865, 'Wiesmühl', '159/2', 'UsO2Y2tsaW5nZXIgUmljaGFyZCB1LiBFbGlzYWJldGg='),
(866, 'Willersdorf', '94', 'R3Jvw59oYWdhdWVyIEpvc2VmIHUuIEFubmVsaWVzZQ=='),
(867, 'Willersdorf', '95/1', 'S8O2bmlnIENocmlzdGlhbiB1LiBNb25pa2E='),
(868, 'Willersdorf', '95/2', 'S3JvbmJlcmdlciBWaWt0b3IgdS4gRXZhIE1hcmlh'),
(869, 'Willersdorf', '96', 'U2NobMO2Z2xob2ZlciBKb2hhbm4gdS4gSGVsZW5lIC8gU2FuZHJhLCBNYWcuKEZIKQ=='),
(870, 'Willersdorf', '97', 'UmVpdGJhdWVyIEhlcm1pbmUgLyBIaW50c3RlaW5lciBFbmdlbGJlcnQgdS4gR2VydHJ1ZGU='),
(871, 'Willersdorf', '270/1', 'R3V0amFociBBbG9pcyAgICAgICAgICAgICAgICAg'),
(872, 'Willersdorf', '270/2', 'ZHp0LiB1bmJld29obnQg'),
(873, 'Zeilach', '181/1', 'U2NobmVja2VubGVpdG5lciBGcmFueg=='),
(874, 'Zeilach', '181/2', 'U3ByZWl0emVyIExlb3BvbGQgdS4gTWFyaWE='),
(875, 'Zeilach', '272/1', 'UGZhZmZlbmxlaG5lciBTdGVmYW5pZQ=='),
(876, 'Zeilach', '272/2', 'Vm9yd2FnbmVyIEdlcmhhcmQgdS4gRXJuZXN0aW5l'),
(877, 'Zulehen', '142/2', 'TGl0emVsbGFjaG5lciBIb3JzdCB1LiBFbGlzYWJldGg=');

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
  `unterkategorie` int(100) NOT NULL,
  `unterunterkategorie` varchar(255) DEFAULT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `lagebeimEintreffen` longtext,
  `brandobjekte` varchar(255) DEFAULT NULL COMMENT 'wenn unterkategorie==brandeinsatz',
  `brandausDate` date DEFAULT NULL COMMENT 'wenn unterkategorie==brandeinsatz',
  `brandausTime` time DEFAULT NULL,
  `brandwacheStartDate` date DEFAULT NULL COMMENT 'wenn unterkategorie==brandeinsatz',
  `brandwacheStartTime` time DEFAULT NULL COMMENT 'wenn unterkategorie==brandeinsatz',
  `brandwacheEndeDate` date DEFAULT NULL,
  `brandwacheEndeTime` time DEFAULT NULL,
  `brandausmass` int(7) DEFAULT NULL COMMENT 'wenn unterkategorie==brandeinsatz',
  `anlass` varchar(255) DEFAULT NULL COMMENT 'wenn unterkategorie==brandsicherheitswache',
  `alarmzeit` time DEFAULT NULL,
  `alarmdatum` date DEFAULT NULL,
  `geschaedigterName` varchar(255) DEFAULT NULL,
  `geschaedigterAdresse` varchar(255) DEFAULT NULL,
  `geschaedigterTel` varchar(255) DEFAULT NULL,
  `geschaedigterKennzeichen` varchar(255) DEFAULT NULL,
  `anwesend` longtext COMMENT '(DC2Type:array)',
  `betriebsmittel` varchar(255) DEFAULT NULL,
  `wetter` longtext COMMENT '(DC2Type:array)',
  `beginn_datum` date NOT NULL,
  `beginn_zeit` time NOT NULL,
  `ende_datum` date NOT NULL,
  `ende_zeit` time NOT NULL,
  `strasse` varchar(255) NOT NULL,
  `hausnummer` varchar(255) NOT NULL,
  `plz` int(11) NOT NULL,
  `ort` varchar(255) NOT NULL,
  `bericht` longtext,
  `eingesetzteGeraete` varchar(255) DEFAULT NULL,
  `notizen` longtext,
  `uebungsleiter` varchar(255) DEFAULT NULL COMMENT 'wenn übung',
  `idbenutzer_benutzer` int(10) UNSIGNED NOT NULL,
  `metadata` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logbuch`
--

INSERT INTO `logbuch` (`idlogbuch`, `kategorie`, `unterkategorie`, `unterunterkategorie`, `beschreibung`, `lagebeimEintreffen`, `brandobjekte`, `brandausDate`, `brandausTime`, `brandwacheStartDate`, `brandwacheStartTime`, `brandwacheEndeDate`, `brandwacheEndeTime`, `brandausmass`, `anlass`, `alarmzeit`, `alarmdatum`, `geschaedigterName`, `geschaedigterAdresse`, `geschaedigterTel`, `geschaedigterKennzeichen`, `anwesend`, `betriebsmittel`, `wetter`, `beginn_datum`, `beginn_zeit`, `ende_datum`, `ende_zeit`, `strasse`, `hausnummer`, `plz`, `ort`, `bericht`, `eingesetzteGeraete`, `notizen`, `uebungsleiter`, `idbenutzer_benutzer`, `metadata`) VALUES
(1, 'einsatz', 0, '0', 'es hat gebrannt', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08:08:39', NULL, '', NULL, NULL, NULL, NULL, 'viele', '', '2018-10-11', '00:00:00', '2018-10-09', '00:00:00', 'Softwarepark', '11', 4232, 'Hagenberg', 'nix passirt', NULL, 'irgendwas', NULL, 1, '2019-01-01 14:33:46'),
(2, 'einsatz', 0, '0', 'asdfasdf', 'adsfasdf', 'adsfasdf', '2018-12-01', '23:00:00', '2018-12-01', '01:59:00', '2018-12-01', '23:59:00', 0, 'bei Veranstaltung', '00:00:00', '0000-00-00', 'asdfasdf', 'ddd', '07476', '545', 'a:0:{}', 'dddf', 'a:0:{}', '2018-12-03', '20:30:00', '2018-12-01', '20:50:00', 'asdfasdf', '2', 3353, 'Aschbach', 'asdfadf', 'asdfasdfasdf', 'dfdf', 'asdfadsf', 5, '0000-00-00 00:00:00'),
(3, 'einsatz', 2, '1', 'asfasdf', 'asdfas', 'dddd', '2018-12-01', '00:59:00', '2018-12-01', '00:57:00', '2018-12-01', '01:56:00', 0, 'brandgefährliche Tätigkeit', '00:00:00', '0000-00-00', 'dddd', 'ddd', '0660/5858849', 'adf25', 'a:1:{i:0;s:8:\"Gemeinde\";}', 'asdfasdf', 'a:4:{i:0;i:0;i:1;i:4;i:2;i:8;i:3;i:9;}', '2018-12-01', '22:59:00', '2018-12-01', '00:59:00', 'asdfasdf', '2', 3353, 'Aschbach', 'fff', 'asfasdf', 'fff', 'ddd', 5, '2018-12-10 22:33:35'),
(4, 'einsatz', 1, '13', 'adfadf', 'adfadsf', 'adfadf', '2018-12-01', '00:59:00', '2018-12-01', '00:58:00', '2018-12-01', '01:57:00', 0, 'bei Veranstaltung', '00:00:00', '0000-00-00', 'ddd', 'bbb', '0660/5858849', '545', 'a:0:{}', 'adfadf', 'a:0:{}', '2018-12-01', '11:22:00', '2018-12-01', '22:33:00', 'ddd, 2', '2', 3353, 'Aschbach', 'fff', 'asfasdf', 'fff', 'bbb', 5, '2018-12-01 01:12:40'),
(5, 'einsatz', 1, '', 'asfasdf', 'afasdf', 'adfadf', '2018-12-01', '01:02:00', '2018-12-01', '03:05:00', '2018-12-01', '03:04:00', 2, 'bei Veranstaltung', '00:00:00', '0000-00-00', 'asdfasdf', 'ddd', '0660/5858849', 'adfa', 'a:0:{}', 'dfd', 'a:2:{i:0;i:0;i:1;i:4;}', '2018-12-01', '02:04:00', '2018-12-01', '04:05:00', 'ddd, 2', '2', 3353, 'Aschbach', 'sf', 'sdf', 'dfdf', 'sfs', 5, '2018-12-10 22:35:05'),
(6, 'einsatz', 2, '', 'asdfasdf', 'adfadsf', NULL, '2018-12-01', NULL, '2018-12-01', NULL, '2018-12-01', NULL, NULL, NULL, '00:59:00', '2018-12-01', 'dddd', NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-01', '01:58:00', '2018-12-01', '01:58:00', 'ddd, 2, 2', '2', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-10 22:35:37'),
(7, 'Übung', 6, '5', 'asdfasdf', 'adsfasdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12:23:00', '2018-12-01', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-01', '23:23:00', '2018-12-01', '23:56:00', 'dd', '2', 2335, 'ascbaa', NULL, NULL, NULL, NULL, 5, '2018-12-01 16:50:51'),
(8, 'Einsatz', 0, '2', 'adsfasdfa', 'asdf', NULL, '2018-12-03', NULL, '2018-12-03', NULL, '2018-12-03', NULL, NULL, NULL, NULL, '2018-12-03', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-03', '12:23:00', '2018-12-03', '12:23:00', 'adfasd', '2', 33611, 'adsfasdf', NULL, NULL, NULL, NULL, 5, '2018-12-03 17:43:11'),
(9, 'Tätigkeit', 34, NULL, 'adfasdf', NULL, NULL, '2018-12-03', NULL, '2018-12-03', NULL, '2018-12-03', NULL, NULL, NULL, NULL, '2018-12-03', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-03', '12:23:00', '2018-12-03', '23:23:00', 'ddd, 2, 2, 2', '2', 3353, 'Aschbach', NULL, 'asdfasdf', NULL, NULL, 5, '2018-12-03 18:03:55'),
(10, 'Einsatz', 2, '13', 'asfdasdf', 'adfadf', NULL, '2018-12-03', NULL, '2018-12-03', NULL, '2018-12-03', NULL, NULL, NULL, '12:23:00', '2018-12-03', 'asdfasdf', 'ddd hausen 3', '0660/5858849', NULL, 'a:3:{i:0;s:3:\"EVU\";i:1;s:7:\"Polizei\";i:2;s:18:\"Straßenverwaltung\";}', 'Schaum', 'a:2:{i:0;i:1;i:1;i:3;}', '2018-12-03', '12:23:00', '2018-12-03', '12:23:00', 'ddd', '2', 3353, 'adfadf', NULL, NULL, NULL, NULL, 5, '2018-12-03 18:05:39'),
(11, 'Übung', 10, NULL, 'sdfsdf', 'asdfasfd', NULL, '2018-12-03', NULL, '2018-12-03', NULL, '2018-12-03', NULL, NULL, NULL, NULL, '2018-12-03', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-03', '12:23:00', '2018-12-03', '12:23:00', 'ddd, 2, 2, 2', '2', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-03 18:06:40'),
(12, 'Einsatz', 0, NULL, 'asdfasdf', NULL, NULL, '2018-12-18', NULL, '2018-12-18', NULL, '2018-12-18', NULL, NULL, NULL, NULL, '2018-12-18', NULL, NULL, NULL, NULL, 'a:1:{i:0;s:7:\"Polizei\";}', NULL, 'a:1:{i:0;i:1;}', '2018-12-18', '12:03:00', '2018-12-18', '23:04:00', 'asdf', '3', 3343, 'asdcg', NULL, NULL, NULL, NULL, 5, '2018-12-18 21:23:58'),
(13, 'Einsatz', 2, NULL, 'dfdf', NULL, NULL, '2018-12-21', NULL, '2018-12-21', NULL, '2018-12-21', NULL, NULL, NULL, NULL, '2018-12-21', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-21', '12:23:00', '2018-12-21', '12:32:00', 'asdfadsf', '9', 3362, 'asdfasdf', NULL, NULL, NULL, NULL, 5, '2018-12-21 20:51:44'),
(14, 'Tätigkeit', 31, NULL, 'dfd', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'asdfasd', 'f2', 3353, 'asd', NULL, NULL, NULL, NULL, 5, '2018-12-22 13:49:00'),
(15, 'Tätigkeit', 31, NULL, 'dfd', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'asdfasd', 'f2', 3353, 'asd', NULL, NULL, NULL, NULL, 5, '2018-12-22 13:50:43'),
(16, 'Tätigkeit', 31, NULL, 'dfd', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'asdfasd', 'f2', 3353, 'asd', NULL, NULL, NULL, NULL, 5, '2018-12-22 14:42:42'),
(17, 'Tätigkeit', 31, NULL, 'dfd', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'asdfasd', 'f2', 3353, 'asd', NULL, NULL, NULL, NULL, 5, '2018-12-22 14:52:10'),
(18, 'Tätigkeit', 31, NULL, 'dfd', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'asdfasd', 'f2', 3353, 'asd', NULL, NULL, NULL, NULL, 5, '2018-12-22 14:55:27'),
(19, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 14:56:54'),
(20, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 14:59:54'),
(21, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:17:34'),
(22, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:21:55'),
(23, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:22:03'),
(24, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:24:22'),
(25, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:26:13'),
(26, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:26:40'),
(27, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:27:50'),
(28, 'Tätigkeit', 41, NULL, 'asdf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:03:00', 'adf', '3', 3353, 'Aschbach', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:28:06'),
(29, 'Tätigkeit', 35, NULL, 'asdfaf', NULL, NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-22', '12:23:00', '2018-12-22', '12:20:00', '12', '3', 334, 'adf', NULL, NULL, NULL, NULL, 5, '2018-12-22 15:40:31'),
(30, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 15:43:30'),
(31, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 15:46:29'),
(32, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 15:46:53'),
(33, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 15:54:28'),
(34, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 15:57:54'),
(35, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:02:12'),
(36, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:02:34'),
(37, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:03:02'),
(38, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:03:49'),
(39, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:04:07'),
(40, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:04:24'),
(41, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:08:55'),
(42, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:10:40'),
(43, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:12:39'),
(44, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:15:21'),
(45, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:15:40'),
(46, 'Tätigkeit', 21, NULL, 'asfdasdfadf', 'jaölsdfjkaölskdjfölaksdf', NULL, '2018-12-22', NULL, '2018-12-22', NULL, '2018-12-22', NULL, NULL, NULL, NULL, '2018-12-22', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2018-12-15', '08:08:00', '2018-12-15', '23:23:00', 'Muster', '809', 4545, 'Musterhausen', NULL, 'asdfasdf', NULL, 'asdfasdf', 5, '2018-12-22 16:16:03'),
(47, 'Tätigkeit', 30, NULL, 'asdfasdf', NULL, NULL, '2019-01-01', NULL, '2019-01-01', NULL, '2019-01-01', NULL, NULL, NULL, NULL, '2019-01-01', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2019-01-01', '12:23:00', '2019-01-01', '12:32:00', 'ASDFASDF', '1', 3353, 'adfadf', NULL, 'adsfasdfasdf', NULL, NULL, 5, '2019-01-01 11:32:47'),
(48, 'Tätigkeit', 30, NULL, 'asdfasdf', NULL, NULL, '2019-01-01', NULL, '2019-01-01', NULL, '2019-01-01', NULL, NULL, NULL, NULL, '2019-01-01', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2019-01-01', '12:23:00', '2019-01-01', '12:32:00', 'ASDFASDF', '1', 3353, 'adfadf', NULL, 'adsfasdfasdf', NULL, NULL, 5, '2019-01-01 11:33:43'),
(49, 'Tätigkeit', 33, NULL, 'asdfasdf', NULL, NULL, '2019-01-01', NULL, '2019-01-01', NULL, '2019-01-01', NULL, NULL, NULL, NULL, '2019-01-01', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2019-01-01', '12:23:00', '2019-01-01', '12:32:00', 'adfadf', '2', 3353, 'asdfasdf', NULL, 'asdfasdf', NULL, NULL, 5, '2019-01-01 11:34:50'),
(51, 'Tätigkeit', 33, NULL, 'asdfasdf', NULL, NULL, '2019-01-01', NULL, '2019-01-01', NULL, '2019-01-01', NULL, NULL, NULL, NULL, '2019-01-01', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2019-01-01', '12:23:00', '2019-01-01', '12:19:00', 'afasdf', '3', 3343, 'asdfasdf', NULL, 'asdfasdf', NULL, NULL, 5, '2019-01-01 11:43:20'),
(52, 'Tätigkeit', 34, NULL, 'adsfadsf', NULL, NULL, '2019-01-01', NULL, '2019-01-01', NULL, '2019-01-01', NULL, NULL, NULL, NULL, '2019-01-01', NULL, NULL, NULL, NULL, 'a:0:{}', NULL, 'a:0:{}', '2019-01-01', '12:23:00', '2019-01-01', '21:23:00', 'adfasdf', '3', 3343, 'adsfadf', NULL, NULL, NULL, NULL, 5, '2019-01-01 11:46:09'),
(58, 'Tätigkeit', 58, NULL, 'Straßen reinigen', 'asdfa', NULL, '2019-01-01', NULL, '2019-01-01', NULL, '2019-01-01', NULL, NULL, NULL, '23:03:00', '2019-01-01', NULL, NULL, NULL, NULL, 'a:2:{i:0;s:7:\"Polizei\";i:1;s:7:\"Rettung\";}', NULL, 'a:0:{}', '2019-01-03', '06:05:00', '2019-01-03', '05:05:00', 'Erneute Straße', '900', 2326, 'Straßenort', NULL, NULL, NULL, NULL, 5, '2019-01-03 13:38:35');

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
  ADD PRIMARY KEY (`idfahrzeugbesatzung`),
  ADD KEY `idlogbuch_logbuch` (`idlogbuch_logbuch`),
  ADD KEY `idfahrzeug_fahrzeug` (`idfahrzeug_fahrzeug`),
  ADD KEY `idmitglieder_mitglieder` (`idmitglieder_mitglieder`),
  ADD KEY `idlogbuch_logbuch_2` (`idlogbuch_logbuch`);

--
-- Indizes für die Tabelle `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`idfeed`);

--
-- Indizes für die Tabelle `haeuserliste`
--
ALTER TABLE `haeuserliste`
  ADD PRIMARY KEY (`idhaus`);

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
  MODIFY `idbenutzer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
-- AUTO_INCREMENT für Tabelle `fahrzeugbesatzung`
--
ALTER TABLE `fahrzeugbesatzung`
  MODIFY `idfahrzeugbesatzung` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `feed`
--
ALTER TABLE `feed`
  MODIFY `idfeed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `haeuserliste`
--
ALTER TABLE `haeuserliste`
  MODIFY `idhaus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=878;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `idcategory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `logbuch`
--
ALTER TABLE `logbuch`
  MODIFY `idlogbuch` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT für Tabelle `mitglieder`
--
ALTER TABLE `mitglieder`
  MODIFY `idmitglieder` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

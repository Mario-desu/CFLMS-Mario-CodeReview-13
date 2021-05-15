-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Mai 2021 um 13:41
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr13_bigevents_mario`
--
CREATE DATABASE IF NOT EXISTS `cr13_bigevents_mario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr13_bigevents_mario`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210514073824', '2021-05-14 09:39:35', 66),
('DoctrineMigrations\\Version20210514075307', '2021-05-14 09:53:42', 61),
('DoctrineMigrations\\Version20210514101204', '2021-05-14 12:12:27', 78),
('DoctrineMigrations\\Version20210514120356', '2021-05-14 14:04:11', 93);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedulded` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`id`, `name`, `schedulded`, `image`, `description`, `capacity`, `email`, `phone`, `address`, `url`, `fk_type_id`) VALUES
(1, 'Vienna 1900', '2021-05-26 10:00:00', 'klimt.jpg', 'The Leopold Museum is a unique treasury of Viennese Modernism and the Wiener Werkstätte. The new permanent exhibition “Vienna 1900. Birth of Modernism” offers insights into the enormous abundance and diversity of the artistic and intellectual achievements of this epoch. Art lovers will be enthralled by the 1,300 exhibits arranged over three floors.\r\nApart from the world’s largest and most significant Egon Schiele collection, masterpieces by Gustav Klimt, the graphics, sculptures, and photographs, there are also exhibits in glass, ceramic, metal, textiles, and leather. Jewelry and furniture are also on display, as are entire apartment furnishings. An exhibition for everyone wishing to experience Viennese Modernism in Vienna.', 200, 'office@leopoldmuseum.org', '+43 1 525 70 0', 'Leopold Museum, Museumsplatz 1, 1070 Wien', 'www.leopoldmuseum.org', 5),
(2, 'Tosca by Puccini', '2021-05-24 18:30:00', 'staatsoper.jpg', 'Rome, 1800: The city suffers from Scarpias, the Chief Constables, reign of terror. The seditious painter Cavaradossi falls into his clutches and is bound to be executed. His beloved Tosca - chased after by Scarpia - strikes a bargain: She answers his desires, and Scarpia will save Cavaradossi by a fake execution with blank cartridges in return. Scarpia agrees, approaches her - and she stabs him to death. But he, too, has not kept his word and ordered to shoot Cavaradossi with real ammunition. With a broken heart, she leaps to her death from the pinnacles of Castel Sant’Angelo.', 500, 'office@wiener-staatsoper.at', '+43 1 514 44 2250', 'Wiener Staatsoper, Opernring 2, 1010 Wien', 'www.wiener-staatsoper.at', 1),
(3, 'Sommer Rhapsodie in the Garden 2021', '2021-07-19 19:30:00', 'liechtenstein.jpg', 'Against the backdrop of the summer garden, contemporary and classical concerts, readings and cabaret evenings in July and August offer an extensive and varied program: Intense and stirring, Philipp Hochmair presents Adalbert Stifter\'s novella \"Der Hagestolz,\" to which the Austrian Salonists arrange the only possible soundtrack with music by Anton Bruckner. The internationally acclaimed jazz singer Simone Kopmajer also demonstrates her fine timbre and cool swing with the current jazz bossa nova album \"My Wonderland\". In his solo \"und...\" Alfred Dorfer reports in his usual virtuoso and sharp-tongued manner on everyday phenomena, zeitgeist phenomena and political facts. The exceptional Viennese-born pianist Stefan Vladar will perform Johann Sebastian Bach\'s \"Goldberg Variations,\" a highlight of Baroque variation art. The vocal band Hermann, probably the most passionate a cappella boy group, embarks on an adventurous journey of great emotions with \"Alles Tango\". And Count Basic, one of the most internationally respected Austrian bands, will be a guest, closing the \"Summer Rhapsody in the Garden\" with their danceable message \"Jazz in the House\".', 150, 'kontakt@sommerrhapsodie.at', '+43 664 8428250', 'Liechtenstein Garden Palace, Fürstengasse 1, 1090 Wien', 'www.sommerrhapsodie.at', 3),
(7, 'Die Ärzte - In The Ä Tonight Tour 2021', '2021-12-17 19:30:00', 'aerzte.jpg', 'Die Ärzte (German pronunciation: [diː ˈʔɛːɐ̯tstə]; lit. \'\'the physicians\'\') is a German rock band from Berlin. The band has released 13 studio albums. The group consists of guitarist Farin Urlaub, drummer Bela B and bass player Rodrigo González. All three write and perform their songs.', 2000, 'service@stadthalle.com', '+43 1 79 999 79', 'Wiener Stadthalle, Halle D, Roland-Rainer-Platz 1, 1150 Wien', 'www.stadthalle.com', 1),
(8, 'Erste Bank Open 2021', '2021-10-25 18:00:00', 'tennis.jpg', 'The Vienna Open (currently sponsored by Erste Bank and called the Erste Bank Open) is a professional tennis tournament played on indoor hard courts. Originally an event of the Grand Prix tennis circuit (1974–1989), it is currently part of the ATP World Tour 500 series of the Association of Tennis Professionals (ATP) World Tour. It is held annually at the Wiener Stadthalle, in Vienna, Austria, since 1974.', 1500, 'service@stadthalle.com', '+43 1 98100200', 'Vienna Stadthalle, Halle D, Roland-Rainer-Platz 1, 1150 Wien', 'www.stadthalle.com', 4),
(10, 'Metallica - S&M Tribute Show', '2021-11-27 19:30:00', 'metallica.jpg', 'Metallica is an American heavy metal band. The band was formed in 1981 in Los Angeles by vocalist/guitarist James Hetfield and drummer Lars Ulrich, and has been based in San Francisco for most of its career. The band\'s fast tempos, instrumentals and aggressive musicianship made them one of the founding \"big four\" bands of thrash metal, alongside Megadeth, Anthrax and Slayer. Metallica\'s current lineup comprises founding members and primary songwriters Hetfield and Ulrich, longtime lead guitarist Kirk Hammett, and bassist Robert Trujillo. Guitarist Dave Mustaine (who went on to form Megadeth after being fired from the band) and bassists Ron McGovney, Cliff Burton (who died in a bus accident in Sweden in 1986) and Jason Newsted are former members of the band.', 1000, 'service@stadthalle.com', '+43 1 79 999 79', 'Wiener Stadthalle Halle F, Roland-Rainer-Platz 1, 1150 Wien', 'www.stadthalle.com', 1),
(11, 'Monet bis Picasso - Sammlung Batliner', '2021-05-30 00:00:00', 'monet.jpg', 'The Albertina houses one of Europe’s most important compilations of Modernist art in the form of the Batliner Collection.\r\nIts permanent display starts off with such artists of Impressionism and Post-Impressionism as Degas, Cézanne, Toulouse-Lautrec, and Gauguin. Further highlights include examples of German Expressionism, with the groups of Brücke and Der Blaue Reiter, and the art of New Objectivity, with works by Wacker, Sedlacek, and Hofer. An in-depth focus on Austrian art comprises works by Kokoschka and paintings by Egger-Lienz. The great diversity of the Russian avant-garde is represented by paintings by Goncharova, Malevich, and Chagall.', 200, 'info@albertina.at', '+43 1 58483', 'Albertina, Albertinaplatz 1, 1010 Wien', 'www.albertina.at', 5),
(12, 'Eine Frau mit berauschenden Talenten', '2021-05-20 16:45:00', 'cinema.jpg', 'Patience Portefeux lebt in ständigen Geldsorgen: Ihre demente Mutter wohnt in einem teuren Pflegeheim, ihr vor 20 Jahren plötzlich im Oman verstorbener Mann hat ihr einen Berg Schulden hinterlassen, den sie nun endlich abbezahlt hat, und sie ist mit der Miete im Rückstand. Sie kommt nur über die Runden, weil ihr Geliebter Philippe bei der Polizei arbeitet und ihr immer wieder Übersetzungsaufträge gibt: Patience spricht fließend Arabisch und arbeitet als Übersetzerin für das Pariser Drogendezernat. Neben einem großen Drogendeal der Brüder Cherkaoui, bei dem Gespräche durch die Polizei mitgeschnitten und durch Patience übersetzt werden, hat sie von Philippe den Dauerauftrag erhalten, die unfähigen kleinen Dealer Scotch und Chocapic abzuhören und deren Gespräch zu übersetzen.', 100, 'office@votivkino.at', '+43 1 3173571', 'Votivkino, Währinger Str. 12, 1090 Wien', 'www.votivkino.at', 2),
(13, 'Der Bockerer', '2021-06-14 19:00:00', 'josefstadt.jpg', 'Mit dem Anschluss Österreichs an das Deutsche Reich beginnt sich auch das Leben des Fleischhauers Karl Bockerer markant zu verändern. Während seine Familie sich vom Nationalsozialismus begeistern lässt, beschließt Bockerers jüdischer Freund und Tarockpartner Rosenblatt zu emigrieren. Ein anderer Tarockpartner, der pensionierte Postoffizial Hatzinger, hegt zwar keinerlei Sympathien für die Nazis, passt sich aber doch lieber den neuen politischen Gegebenheiten an. Ganz anders fällt Bockerers Reaktion aus. Er trotzt den Nationalsozialisten und demaskiert schlagfertig deren Ideologie. Dabei ist er alles andere als ein Widerstandskämpfer – er ist ein Mensch mit Herz, der in der Zeit der Barbarei auf Humanität pocht.', 150, 'ticket@josefstadt.org', '+43 1 42 700-300', 'Theater in Josefstadt, Josefstädter Straße 26, 1080 Wien', 'www.josefstadt.org', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Music'),
(2, 'Movie'),
(3, 'Theater'),
(4, 'Sports'),
(5, 'Museum');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3BAE0AA73563B1BF` (`fk_type_id`);

--
-- Indizes für die Tabelle `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_3BAE0AA73563B1BF` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

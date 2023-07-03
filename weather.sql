-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+jammy2
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: localhost:3306
-- Čas generovania: Út 02.Máj 2023, 20:58
-- Verzia serveru: 8.0.32-0ubuntu0.22.04.2
-- Verzia PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `weather`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `visits`
--

CREATE TABLE `visits` (
  `ID` int NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Locality` varchar(100) NOT NULL,
  `Time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Sťahujem dáta pre tabuľku `visits`
--

INSERT INTO `visits` (`ID`, `Country`, `Code`, `City`, `Locality`, `Time`) VALUES
(1, 'Spojené štáty americké', 'US', 'Asheville', '(35.5950581, -82.5514869)', '2023-04-28 12:56:01'),
(2, 'Slovensko', 'SK', 'Bratislava', '(48.1485965, 17.1077477)', '2023-05-01 13:07:53'),
(3, 'Filipíny', 'PH', 'Filipíny', '(12.879721, 121.774017)', '2023-05-01 13:08:20'),
(4, 'Spojené kráľovstvo', 'GB', 'Edinburgh', '(55.953252, -3.188267)', '2023-05-01 13:38:13'),
(5, 'Azerbajdžan', 'AZ', 'Bakuská gubernia', '(40.40926169999999, 49.8670924)', '2023-05-01 13:38:36');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `visits`
--
ALTER TABLE `visits`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

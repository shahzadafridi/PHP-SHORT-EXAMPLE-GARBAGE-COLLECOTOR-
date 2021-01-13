-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2021 at 08:01 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usama`
--

-- --------------------------------------------------------

--
-- Table structure for table `garbage`
--

CREATE TABLE `garbage` (
  `id` int(11) NOT NULL,
  `garbage_code` text COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `uc_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `garbage`
--

INSERT INTO `garbage` (`id`, `garbage_code`, `latitude`, `longitude`, `tehsil_id`, `uc_id`, `created_at`) VALUES
(2, '45645', 31.03216516, 743.546546, 1, 1, '0000-00-00 00:00:00'),
(3, 'dfs2w3r3', 31.03216516, 743.546546, 2, 1, '0000-00-00 00:00:00'),
(4, 'dfsdafdf1231', 31.03216516, 743.546546, 1, 1, '0000-00-00 00:00:00'),
(5, 'ttt', 31.03216516, 743.546546, 3, 1, '0000-00-00 00:00:00'),
(6, 'ttt', 31.03216516, 743.546546, 2, 1, '2021-01-13 18:21:28'),
(7, 'ssssssssss', 31.03216516, 743.546546, 3, 1, '2021-01-13 18:21:34'),
(8, 'sssssssssssdfa', 31.03216516, 743.546546, 1, 1, '2021-01-13 18:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `tehsil`
--

CREATE TABLE `tehsil` (
  `id` int(11) NOT NULL,
  `tehsil_name` text COLLATE utf8_unicode_ci NOT NULL,
  `tehsil_code` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tehsil`
--

INSERT INTO `tehsil` (`id`, `tehsil_name`, `tehsil_code`) VALUES
(1, 'test', 'dd'),
(2, 'test', 'faf'),
(3, 'test', 'faf'),
(4, 'ss23423', 'fafdfafdf');

-- --------------------------------------------------------

--
-- Table structure for table `uc`
--

CREATE TABLE `uc` (
  `id` int(11) NOT NULL,
  `uc_name` text COLLATE utf8_unicode_ci NOT NULL,
  `uc_code` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uc`
--

INSERT INTO `uc` (`id`, `uc_name`, `uc_code`) VALUES
(1, 'uctest', 'faf'),
(2, 'uctestfafasfasf', 'faf'),
(3, 'ss', 'fafdfafdf'),
(4, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `garbage`
--
ALTER TABLE `garbage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tehsil_fk_id` (`tehsil_id`),
  ADD KEY `uc_fk_id` (`uc_id`);

--
-- Indexes for table `tehsil`
--
ALTER TABLE `tehsil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uc`
--
ALTER TABLE `uc`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `garbage`
--
ALTER TABLE `garbage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tehsil`
--
ALTER TABLE `tehsil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uc`
--
ALTER TABLE `uc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `garbage`
--
ALTER TABLE `garbage`
  ADD CONSTRAINT `garbage_ibfk_1` FOREIGN KEY (`uc_id`) REFERENCES `uc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `garbage_ibfk_2` FOREIGN KEY (`tehsil_id`) REFERENCES `tehsil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 04:24 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `Bid` int(11) NOT NULL,
  `Heading` varchar(100) NOT NULL,
  `post_by` varchar(7) NOT NULL,
  `date_of_post` date NOT NULL DEFAULT current_timestamp(),
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`Bid`, `Heading`, `post_by`, `date_of_post`, `description`) VALUES
(1, 'Loren ipsum', 'k200397', '2022-12-01', 'Lorem ipsum dolor sit amet. Id provident consequatur et sint minus sit quam quia et dolores itaque. Vel cumque voluptas cum nisi Quis ad eius impedit. Et nobis saepe aut impedit maiores qui suscipit eligendi nam magni quam ut explicabo internos sit autem '),
(2, 'Loren ipsum', 'k200434', '2022-12-02', 'Lorem ipsum dolor sit amet. Id provident consequatur et sint minus sit quam quia et dolores itaque. Vel cumque voluptas cum nisi Quis ad eius impedit. Et nobis saepe aut impedit maiores qui suscipit eligendi nam magni quam ut explicabo internos sit autem '),
(7, 'Loren ipsum', 'k200434', '2022-12-02', 'Lorem ipsum dolor sit amet. Id provident consequatur et sint minus sit quam quia et dolores itaque. Vel cumque voluptas cum nisi Quis ad eius impedit. Et nobis saepe aut impedit maiores qui suscipit eligendi nam magni quam ut explicabo internos sit autem ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(7) NOT NULL,
  `email` varchar(17) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
('k200397', 'k200397@nu.edu.pk', 'qwerty123456'),
('k200434', 'k200434@nu.edu.pk', 'k20043491106');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`Bid`),
  ADD KEY `post_by` (`post_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `Bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`post_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

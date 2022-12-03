-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 08:33 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

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
(1, 'Bilal is an idiot', 'k200397', '2022-12-01', 'Why bilal is an idiot');

-- --------------------------------------------------------

--
-- Table structure for table `carpool`
--

CREATE TABLE `carpool` (
  `carpool_id` int(11) NOT NULL,
  `pick_up` varchar(50) NOT NULL,
  `drop_off` varchar(50) NOT NULL,
  `route` varchar(100) NOT NULL,
  `captain_id` varchar(7) NOT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `time` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool`
--

INSERT INTO `carpool` (`carpool_id`, `pick_up`, `drop_off`, `route`, `captain_id`, `phoneNo`, `time`, `day`) VALUES
(1, 'Federal B Area', 'Fast', 'F.b.Area->Fast', 'k200397', '03201348083', '8:00', 'Monday'),
(27, 'karimabad', 'fast', 'karimabad->fast', 'K200434', '1344', '2022-12-02', 'Monday'),
(28, 'karimabad', 'fast', 'karimabad->fast', 'K200434', '1344', '2022-12-02', 'Monday');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cid` varchar(10) NOT NULL,
  `cname` varchar(55) NOT NULL,
  `coordinator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cid`, `cname`, `coordinator`) VALUES
('CS2001', 'Algorithms', 1),
('CS2002', 'Database Systems', 2);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `student_id` varchar(7) NOT NULL,
  `date_of_post` date NOT NULL,
  `github_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `course_id`, `student_id`, `date_of_post`, `github_link`) VALUES
(1, '123', 'k200397', '2022-12-02', 'github.com/xyz');

-- --------------------------------------------------------

--
-- Table structure for table `society`
--

CREATE TABLE `society` (
  `society_id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` varchar(50) NOT NULL,
  `head_id` int(11) NOT NULL,
  `president_id` varchar(7) NOT NULL,
  `socialMedia_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `tname` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `tname`, `email`, `location`) VALUES
(1, 'Amin Sadiq', 'amin.sadiq@nu.edu.pk', 'CS Building, First Floor, Faculty Room'),
(2, 'Danish Khan', 'danish.khan@nu.edu.pk', 'Don\'t go. Run away while you can!');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(7) NOT NULL,
  `email` varchar(17) NOT NULL,
  `password` varchar(55) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`) VALUES
('k200397', 'k200397@nu.edu.pk', 'qwerty123456', 0),
('k200434', 'k200434@nu.edu.pk', 'k20043491106', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`Bid`);

--
-- Indexes for table `carpool`
--
ALTER TABLE `carpool`
  ADD PRIMARY KEY (`carpool_id`),
  ADD KEY `carpool_user_FK` (`captain_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `course_teacher_fk` (`coordinator`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `project_user_FK` (`student_id`);

--
-- Indexes for table `society`
--
ALTER TABLE `society`
  ADD PRIMARY KEY (`society_id`),
  ADD KEY `society_president_user_FK` (`president_id`),
  ADD KEY `project_course_FK` (`head_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`tt_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `Bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carpool`
--
ALTER TABLE `carpool`
  MODIFY `carpool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `society`
--
ALTER TABLE `society`
  MODIFY `society_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `tt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carpool`
--
ALTER TABLE `carpool`
  ADD CONSTRAINT `carpool_user_FK` FOREIGN KEY (`captain_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_teacher_fk` FOREIGN KEY (`coordinator`) REFERENCES `teacher` (`tid`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_user_FK` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `society`
--
ALTER TABLE `society`
  ADD CONSTRAINT `project_course_FK` FOREIGN KEY (`head_id`) REFERENCES `teacher` (`id`),
  ADD CONSTRAINT `society_president_user_FK` FOREIGN KEY (`president_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

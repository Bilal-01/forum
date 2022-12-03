-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 04:23 PM
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
(1, 'Lorem Ipsum', 'k200397', '2022-12-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla pretium mi a volutpat. Phasellus sed enim vitae justo feugiat venenatis at id purus. Aenean eros felis, egestas eget fringilla ac, fringilla vitae lectus. Nullam tincidunt at urna eu '),
(2, 'Lorem ipsum', 'k200434', '2022-12-03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla pretium mi a volutpat. Phasellus sed enim vitae justo feugiat venenatis at id purus. Aenean eros felis, egestas eget fringilla ac, fringilla vitae lectus. Nullam tincidunt at urna eu '),
(3, 'Lorem ipsum', 'k200434', '2022-12-03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla pretium mi a volutpat. Phasellus sed enim vitae justo feugiat venenatis at id purus. Aenean eros felis, egestas eget fringilla ac, fringilla vitae lectus. Nullam tincidunt at urna eu ');

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
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `ename`, `image_path`, `sid`) VALUES
(1, 'xyz', 'web/1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `full_name` varchar(55) NOT NULL,
  `department` varchar(20) NOT NULL,
  `domain` varchar(55) NOT NULL,
  `skill` varchar(55) NOT NULL,
  `about` varchar(500) NOT NULL,
  `uid` varchar(7) NOT NULL,
  `quote` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'CS2001', 'k200397', '2022-12-02', 'github.com/xyz');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `ID` int(11) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `student_id` varchar(7) NOT NULL,
  `Drive_Link` varchar(100) NOT NULL,
  `date_of_publish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`ID`, `course_id`, `student_id`, `Drive_Link`, `date_of_publish`) VALUES
(1, 'CS2001', 'k200397', 'https://drive.google.com/xyz', '2022-12-03'),
(2, 'CS2002', 'k200434', 'https://drive.google.com/abc', '2022-12-03');

-- --------------------------------------------------------

--
-- Table structure for table `society`
--

CREATE TABLE `society` (
  `society_id` int(11) NOT NULL,
  `sname` varchar(150) NOT NULL,
  `sdescription` varchar(500) NOT NULL,
  `head_id` int(11) NOT NULL,
  `president_id` varchar(7) NOT NULL,
  `socialMedia_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `society`
--

INSERT INTO `society` (`society_id`, `sname`, `sdescription`, `head_id`, `president_id`, `socialMedia_link`) VALUES
(1, 'Dramatic and Extra Curricular Society', 'DECS has always been on the go in planning extra-activities such as picnics for the FASTians which prove to be both exhilarating and exclusive', 1, 'k200397', 'https://www.facebook.com/decsfast/');

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
(2, 'Danish Khan', 'danish.khan@nu.edu.pk', 'Don\'t go. Run away while you can!'),
(3, 'Abdul Bari', 'abdul.bari@nu.edu.pk', 'EE First floor, Faculty Offices');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `tt_id` int(11) NOT NULL,
  `ttday` varchar(10) NOT NULL,
  `tcode` varchar(20) NOT NULL,
  `croom` varchar(10) NOT NULL,
  `timeslot` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`tt_id`, `ttday`, `tcode`, `croom`, `timeslot`) VALUES
(1, 'Monday', 'Algo BSCS-5D', 'R-12', '08:8:50'),
(2, 'Monday', 'DB BSCS-5D', 'R-109', '08:55-09:4');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(7) NOT NULL,
  `uname` varchar(55) NOT NULL,
  `email` varchar(17) NOT NULL,
  `password` varchar(55) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `uname`, `email`, `password`, `role`) VALUES
('k200397', 'Bilal Aziz', 'k200397@nu.edu.pk', 'qwerty123456', 0),
('k200434', 'Maryam Siddiqui', 'k200434@nu.edu.pk', 'k20043491106', 0);

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
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_society_FK` (`sid`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_FK` (`uid`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `project_user_FK` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `course_id` (`course_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `Bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carpool`
--
ALTER TABLE `carpool`
  MODIFY `carpool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `society`
--
ALTER TABLE `society`
  MODIFY `society_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `tt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`post_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `event_society_FK` FOREIGN KEY (`sid`) REFERENCES `society` (`society_id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `user_profile_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`cid`),
  ADD CONSTRAINT `project_user_FK` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `society`
--
ALTER TABLE `society`
  ADD CONSTRAINT `project_head_FK` FOREIGN KEY (`head_id`) REFERENCES `teacher` (`tid`),
  ADD CONSTRAINT `society_president_user_FK` FOREIGN KEY (`president_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

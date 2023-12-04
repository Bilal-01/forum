-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2023 at 11:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`Bid`, `Heading`, `post_by`, `date_of_post`, `description`) VALUES
(1, 'Lorem Ipsum', 'k200397', '2022-12-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla pretium mi a volutpat. Phasellus sed enim vitae justo feugiat venenatis at id purus. Aenean eros felis, egestas eget fringilla ac, fringilla vitae lectus. Nullam tincidunt at urna eu '),
(2, 'Lorem ipsum', 'k200434', '2022-12-03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla pretium mi a volutpat. Phasellus sed enim vitae justo feugiat venenatis at id purus. Aenean eros felis, egestas eget fringilla ac, fringilla vitae lectus. Nullam tincidunt at urna eu '),
(3, 'Lorem ipsum', 'k200434', '2022-12-03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla pretium mi a volutpat. Phasellus sed enim vitae justo feugiat venenatis at id purus. Aenean eros felis, egestas eget fringilla ac, fringilla vitae lectus. Nullam tincidunt at urna eu ');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `title` varchar(55) NOT NULL,
  `author` varchar(256) NOT NULL,
  `pages` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `isbn`, `title`, `author`, `pages`, `available`) VALUES
(11, '1234567890', 'Sample Book Title 1', 'John Doe', 200, 1),
(12, '9876543210', 'Sample Book Title 2', 'Jane Smith', 300, 0),
(13, '1112223334', 'Sample Book Title 3', 'Bob Johnson', 150, 1),
(14, '4445556667', 'Sample Book Title 4', 'Alice Brown', 250, 1),
(15, '8889990001', 'Sample Book Title 5', 'Charlie Davis', 180, 0),
(16, '2223334445', 'Sample Book Title 6', 'Eva White', 220, 1),
(17, '6667778889', 'Sample Book Title 7', 'Frank Black', 320, 0),
(18, '9990001112', 'Sample Book Title 8', 'Grace Lee', 280, 1),
(19, '5556667778', 'Sample Book Title 9', 'David Turner', 190, 0),
(20, '3334445556', 'Sample Book Title 10', 'Sophie Miller', 210, 1);

-- --------------------------------------------------------

--
-- Table structure for table `canteen`
--

CREATE TABLE `canteen` (
  `id` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `cdescription` text NOT NULL,
  `clocation` text NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `loc_img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `canteen`
--

INSERT INTO `canteen` (`id`, `cname`, `cdescription`, `clocation`, `image_path`, `loc_img_path`) VALUES
(1, 'Dhabba', 'Enjoy the desi foods, barbeques and rolls.', 'near student Facility Building', 'http://localhost/forum/php/api/assets/Canteens/dhabba.png', 'http://localhost/forum/php/api/assets/Canteens/dhabba-location.gif'),
(2, 'Shawarma-Corner', 'Enjoy different delicious flavor of shawarmas', 'near to 2nd Main gate', 'http://localhost/forum/php/api/assets/Canteens/shawarmaCorner.png', 'http://localhost/forum/php/api/assets/Canteens/shawarma-corner-location.gif'),
(3, 'Juice-Corner', 'Enjoy fresh fruits juices and shakes', 'near to 2nd Main gate', 'http://localhost/forum/php/api/assets/Canteens/juiceCorner.png', 'http://localhost/forum/php/api/assets/Canteens/juice-corner-location.gif'),
(4, 'Tasty-Foods', 'Enjoy flavorful fries and snack items.', 'near to Electrical Engineering building', 'http://localhost/forum/php/api/assets/Canteens/tastyFoods.png', 'http://localhost/forum/php/api/assets/Canteens/tasty-foods-location.gif'),
(5, 'Cafeteria', 'Enjoys bakery items such as donuts, cakes and many more', '2nd floor of student facility block', 'http://localhost/forum/php/api/assets/Canteens/cafeteria.png', 'http://localhost/forum/php/api/assets/Canteens/cafeteria-location.gif');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carpool`
--

INSERT INTO `carpool` (`carpool_id`, `pick_up`, `drop_off`, `route`, `captain_id`, `phoneNo`, `time`, `day`) VALUES
(30, 'karimabad', 'fast', 'karimabad->fast', 'k200434', '123434689', '06:38', 'Monday');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cid` varchar(10) NOT NULL,
  `cname` varchar(55) NOT NULL,
  `coordinator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cid`, `cname`, `coordinator`) VALUES
('CS2001', 'Algorithms', 1),
('CS2002', 'Database Systems', 2);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `month` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `society_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_name`, `month`, `image_path`, `society_id`) VALUES
(1, 'Sham-e-Sukoon', 'December', 'http://localhost/forum/php/api/assets/Events/shamesukhn.jpeg', 2),
(2, 'Welcome Party', 'October', 'http://localhost/forum/php/api/assets/Events/welcomeParty.png', 1),
(3, 'Alumini Dinner', 'November', 'http://localhost/forum/php/api/assets/Events/aluminiDinner.png', 1),
(4, 'Annual Tour', 'January', 'http://localhost/forum/php/api/assets/Events/annual-tour.png', 1),
(5, 'Khud Ki Talash x Raja Zia', 'December', 'http://localhost/forum/php/api/assets/Events/khud-ki-talash.png', 7),
(6, 'Session on How to safeguard the Digital Realm', 'November', 'http://localhost/forum/php/api/assets/Events/session-digital-realm.jpg', 9),
(7, 'Coders Cup', 'October', 'http://localhost/forum/php/api/assets/Events/coders-cup.png', 4),
(8, 'Hack Overflow', 'February', 'http://localhost/forum/php/api/assets/Events/hack-overflow.jpg', 6),
(9, 'Math Olympiad', 'November', 'http://localhost/forum/php/api/assets/Events/math-olympiad.jpg', 5),
(10, 'Data Quest-I', 'December', 'http://localhost/forum/php/api/assets/Events/data-quest.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `canteen_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `price`, `canteen_id`, `image_path`) VALUES
(1, 'Mayo Shawarma', 'Garlic mayo sauce with juicy chicken shawarma', 150, 2, 'http://localhost/forum/php/api/assets/Canteens/mayo_shawarma.jpg'),
(2, 'Bun Kebeb', 'A tasty delight ,seasoned kebabfilled with special chutney and topped with fresh veggies. Simple, flavorful, and perfect for a quick, satisfying bite.', 120, 1, 'http://localhost/forum/php/api/assets/Canteens/bun_kebab.jpg'),
(3, 'macaroni shawarma', 'Filled with flavorful macaroni and finger-licking sauce.', 150, 2, 'http://localhost/forum/php/api/assets/Canteens/macroni-shawarma.jpg'),
(18, 'Chicken Roll', 'Juicy tender chicken wrapped in a loaf of delish bread, filled with sauces!', 150, 1, 'http://localhost/forum/php/api/assets/Canteens/chicken-roll.jpg\n'),
(19, 'Fresh Lemonade', 'Squeezed lemons filled to the brim with chilled soda, just what you need to refresh you!', 30, 3, 'http://localhost/forum/php/api/assets/Canteens/lemonade.jpg'),
(20, 'Apple Juice', 'Freshly extracted apple juice from juicy sweet apples, chilled with ice cubes!', 120, 3, 'http://localhost/forum/php/api/assets/Canteens/apple-juice.jpg'),
(21, 'Pizza', 'Oven-baked, cheesy chicken pizza, with black olives toppings, is the meal you need!', 400, 4, 'http://localhost/forum/php/api/assets/Canteens/pizza.jpg'),
(22, 'Pizza Fries', 'Crispy, crunchy Fries, loaded with cheese, chicken and sauces. ', 250, 4, 'http://localhost/forum/php/api/assets/Canteens/pizza-fries.jpg'),
(23, 'Zinger Burger', 'A big crispy zinger piece, between two oven baked buns, juicy with all the sauces is the ultimate Burger!', 500, 5, 'http://localhost/forum/php/api/assets/Canteens/zinger-burger.jpg'),
(24, 'Biryani', 'For any Pakistani, Biryani needs no description. Come and grab a plate of hot spicy chicken biryani!', 180, 5, 'http://localhost/forum/php/api/assets/Canteens/biryani.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `full_name` varchar(55) NOT NULL,
  `department` varchar(20) DEFAULT NULL,
  `domain` varchar(55) DEFAULT NULL,
  `skill` varchar(55) DEFAULT NULL,
  `about` varchar(500) DEFAULT NULL,
  `uid` varchar(7) NOT NULL,
  `quote` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `full_name`, `department`, `domain`, `skill`, `about`, `uid`, `quote`) VALUES
(1, 'Mohammad Bilal Aziz', 'Computer Science', 'Web Development', 'Frontend Development', 'It is not despair, for despair is only for those who see the end beyond all doubt. We do not\r\nYou shall not pass\r\nGomen nasai oni chan', 'k200397', 'I was talking aloud to myself. A habit of the old: they'),
(3, 'Maryam Siddiqui', 'Computer Science', 'Web Development', 'Emotional Blackmail', 'Very good at using superpowers', 'k200434', 'I was talking aloud to myself. A habit of the old: they');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `course_id`, `student_id`, `date_of_post`, `github_link`) VALUES
(16, 'CS2002', 'k200434', '2022-12-04', 'www.github.com/453');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `socialMedia_link` varchar(100) NOT NULL,
  `logo_img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `society`
--

INSERT INTO `society` (`society_id`, `sname`, `sdescription`, `head_id`, `president_id`, `socialMedia_link`, `logo_img_path`) VALUES
(1, 'Dramatic and Extra Curricular Society', 'DECS has always been on the go in planning extra-activities such as picnics for the FASTians which prove to be both exhilarating and exclusive', 1, 'k200397', 'https://www.facebook.com/decsfast/', 'http://localhost/forum/php/api/assets/Societies/Decs_logo.jpg'),
(2, 'The Literary Club', 'TLC is the most active, the most happening and the most classy society at FAST. With events like Xpressions, Zauq, Agha Hasan Abedi Declamation Contest, Intra-MUN, Parliamentary Debates and an annual magazine called the localhost', 1, 'k200397', 'https://www.facebook.com/TLCFAST/', 'http://localhost/forum/php/api/assets/Societies/TLC_logo.jpg'),
(3, 'FAST DataScience Society', 'You don\'t know where to start from? or the platforms are too complicated?\r\nDon\'t have to be stressed out, as we are all set to provide You with the mentorship that You need. \r\nWith the vision and mission of providing a platform, and mentoring students into leading individuals of #DataIndulgingMysteries FAST Data Science Society', 1, 'k200434', 'https://www.facebook.com/profile.php?id=100086255005453', 'http://localhost/forum/php/api/assets/Societies/fdss_logo.jpg'),
(4, 'Association for Computing Machinery', 'The ACM Student Chapter at FAST-NUCES Karachi Campus is dedicated to the promotion of computing education, research and development.At ACM-NUCES KHI Chapter. You join a team that aims to change the methodology with which students approach computing and technology.', 2, 'k200434', 'https://www.facebook.com/acmnuce', 'http://localhost/forum/php/api/assets/Societies/ACM_logo.jpg'),
(5, 'Think N Create', 'The objective of the committee is to develop within students, skill sets related to the industry.\r\n          They shall be introduced to the current technical, managerial, ethical aspects of expertise in use or desired.', 3, 'k200397', 'https://www.facebook.com/tncfast', ''),
(6, 'Association for Computing Machinery - Women', 'ACM-W supports, celebrates, and advocates internationally for the full engagement of women in all aspects of the computing field, providing a wide range of programs and services to ACM members and working in the larger community to advance the contributions of technical women.', 2, 'k200397', 'https://www.facebook.com/acmw.nuceskhi', 'http://localhost/forum/php/api/assets/Societies/ACM_W_logo.png'),
(7, 'Character Building Society', 'We, at CBS, help students to improve themselves by showing better character and enable them to know & act on their responsibilities in different life roles.', 3, 'k200434', 'https://www.facebook.com/CBSfastkhi\"\r\n', 'http://localhost/forum/php/api/assets/Societies/CBS_logo.jpg'),
(8, 'FAST Management Society', 'FMS is a society founded by the BBA Department. Our main objective is to evince better management skills in the real world job environment. We solely focus on our undergrads, as our goal is for every individual.', 3, 'k200434', 'https://www.facebook.com/28606FMS/', 'http://localhost/forum/php/api/assets/Societies/FMS_logo.jpg'),
(9, 'Google Developer Students Club', 'Google Developer Student Clubs (GDSC) are community groups for college and university students interested in Google developer technologies. Students from all undergraduate or graduate programs with an interest in growing as a developer are welcome', 2, 'k200434', 'https://www.facebook.com/dscnuces/', 'http://localhost/forum/php/api/assets/Societies/GDSC_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `tname` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`tt_id`, `ttday`, `tcode`, `croom`, `timeslot`) VALUES
(1, 'Monday', 'Algo BSCS-5D', 'R-12', '08:00-08:50'),
(2, 'Monday', 'DB BSCS-5D', 'R-109', '08:55-09:40'),
(3, 'Tuesday', 'SDA BSCS-5D', 'E-3', '10:45-11:35'),
(4, 'Tuesday', 'PDC BSCS-5D', 'E-3', '12:35-01:25');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `canteen`
--
ALTER TABLE `canteen`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event-society` (`society_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canteen-menu` (`canteen_id`);

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
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `canteen`
--
ALTER TABLE `canteen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carpool`
--
ALTER TABLE `carpool`
  MODIFY `carpool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `society`
--
ALTER TABLE `society`
  MODIFY `society_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `tt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `carpool_user_FK` FOREIGN KEY (`captain_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_teacher_fk` FOREIGN KEY (`coordinator`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event-society` FOREIGN KEY (`society_id`) REFERENCES `society` (`society_id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `canteen-menu` FOREIGN KEY (`canteen_id`) REFERENCES `canteen` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `user_profile_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_user_FK` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

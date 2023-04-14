-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 05:40 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(8) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `about` varchar(500) NOT NULL,
  `rdate` datetime NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(100) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `gender`, `about`, `rdate`, `profile`) VALUES
(1, 'jk', 'jk123@gmail.com', 'jk', 'male', '                                                ', '2023-03-15 22:37:10', 'jkk.jpg'),
(2, 'jk', 'jk@gmail.com', '1', 'male', '                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                ', '2023-03-17 06:23:32', 'cloud.webp');

-- --------------------------------------------------------

--
-- Table structure for table `blocked_user`
--

CREATE TABLE `blocked_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(5, 'Database', ''),
(21, 'advance java', ''),
(22, 'machine learning', ''),
(24, 'blockchain', '');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `cmid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`cmid`, `uid`, `pid`, `content`, `date`) VALUES
(36, 51, 66, 'hello, i have doubt about block chain', '2023-04-06 05:44:00'),
(37, 48, 66, 'hello', '2023-04-06 05:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `lid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`lid`, `pid`, `uid`) VALUES
(228, 66, 48),
(225, 66, 51);

-- --------------------------------------------------------

--
-- Table structure for table `liked_cmt`
--

CREATE TABLE `liked_cmt` (
  `lid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `cmid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pid` int(11) NOT NULL,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext NOT NULL,
  `pCode` longtext NOT NULL,
  `pPic` varchar(100) NOT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `catId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT -1,
  `adminId` int(11) NOT NULL DEFAULT -1,
  `special` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pid`, `pTitle`, `pContent`, `pCode`, `pPic`, `pDate`, `catId`, `userId`, `adminId`, `special`) VALUES
(66, 'what is blockchain', 'Blockchain is one of the major tech stories of the past decade. Everyone seems to be talking about itâbut beneath the surface chatter thereâs not always a clear understanding of what blockchain is or how it works. Despite its reputation for impenetrability, the basic idea behind blockchain is pretty simple. And it has major potential to change industries from the bottom up.\r\n\r\nMOST POPULAR INSIGHTS\r\nWhat is generative AI?\r\nExperience-led growth: A new way to create value\r\nStepping up: Becoming a high-potential CEO candidate\r\nActions the best CEOs are taking in 2023\r\n', '', 'Block_chain.webp', '2023-04-06 05:36:36', 24, -1, 2, 1),
(68, 'What isMap function?', '\r\nA cloud can be private or public. A public cloud sells services to anyone on the internet. A private cloud is a proprietary network or a data center that supplies hosted services to a limited number of people, with certain access and permissions settings. Private or public, the goal of cloud computing is to provide easy, scalable access to computing resources and IT services.\r\n\r\nCloud infrastructure involves the hardware and software components required for proper implementation of a cloud computing model. Cloud computing can also be thought of as utility computing or on-demand computing.\r\n', 'import numpy\r\n\r\nspeed = [99,86,87,88,111,86,103,87,94,78,77,85,86]\r\n\r\nx = numpy.mean(speed)\r\n\r\nprint(x)', 'ml.jpg', '2023-04-06 05:42:38', 22, 48, -1, 0),
(69, 'What isMap function?', '\r\nA cloud can be private or public. A public cloud sells services to anyone on the internet. A private cloud is a proprietary network or a data center that supplies hosted services to a limited number of people, with certain access and permissions settings. Private or public, the goal of cloud computing is to provide easy, scalable access to computing resources and IT services.\r\n\r\nCloud infrastructure involves the hardware and software components required for proper implementation of a cloud computing model. Cloud computing can also be thought of as utility computing or on-demand computing.\r\n', 'import numpy\r\n\r\nspeed = [99,86,87,88,111,86,103,87,94,78,77,85,86]\r\n\r\nx = numpy.mean(speed)\r\n\r\nprint(x)', 'ml.jpg', '2023-04-06 05:42:38', 22, 48, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `premiumcode`
--

CREATE TABLE `premiumcode` (
  `srno` int(11) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `premiumcode`
--

INSERT INTO `premiumcode` (`srno`, `code`) VALUES
(1, 123),
(2, 456),
(3, 38),
(4, 39),
(5, 40),
(6, 66),
(7, 111),
(8, 112),
(9, 30),
(10, 1000),
(11, 100);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `about` varchar(200) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(100) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `about`, `rdate`, `profile`) VALUES
(46, 'Jaydev kalariya', 'jaydevkalariya27@gmail.com', 'Jay1515@', 'male', 'i am become a software engineer.\r\n                                                \r\n                                                ', '2023-03-10 06:28:37', 'photo_2022-04-03_21-37-54.jpg'),
(47, 'jk', 'jk123@gmail.com', 'jk', 'male', '', '2023-03-11 05:12:08', 'default.png'),
(48, 'jk2', 'jk@gmail.com', 'jk', 'male', '                                                \r\n                                                \r\n                                                \r\n                                                \r\n', '2023-03-11 05:17:29', 'Advancejava.jpg'),
(49, 'jatin', 'jatin@gmail.com', 'jatin', 'male', '                                                ', '2023-03-11 06:58:54', 'picc.jpeg'),
(50, 'jenishh', 'jen@gmail.com', 'jen', 'male', '                                                \r\n                                                ', '2023-03-17 00:56:45', 'default.png'),
(51, 'jainish parmar', 'jainish@gmail.com', 'jainish', 'male', 'i am a software developer', '2023-04-05 08:24:37', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocked_user`
--
ALTER TABLE `blocked_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cmid`),
  ADD KEY `c1` (`pid`),
  ADD KEY `c2` (`uid`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD PRIMARY KEY (`lid`),
  ADD UNIQUE KEY `pid` (`pid`,`uid`),
  ADD KEY `Foreignkey2` (`uid`);

--
-- Indexes for table `liked_cmt`
--
ALTER TABLE `liked_cmt`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `cc1` (`uid`),
  ADD KEY `cc2` (`cmid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `ForeignKey` (`catId`),
  ADD KEY `temp` (`userId`);

--
-- Indexes for table `premiumcode`
--
ALTER TABLE `premiumcode`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `cmid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `liked`
--
ALTER TABLE `liked`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `liked_cmt`
--
ALTER TABLE `liked_cmt`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `premiumcode`
--
ALTER TABLE `premiumcode`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `c1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `Foreignkey2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Foreignkeyy` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `liked_cmt`
--
ALTER TABLE `liked_cmt`
  ADD CONSTRAINT `cc1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cc2` FOREIGN KEY (`cmid`) REFERENCES `comments` (`cmid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `ForeignKey` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

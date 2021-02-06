-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 06, 2021 at 06:27 PM
-- Server version: 10.3.27-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itsmelel_deafZoneBook`
--

-- --------------------------------------------------------

--
-- Table structure for table `BOOK`
--

CREATE TABLE `BOOK` (
  `BOOKID` int(6) NOT NULL,
  `BOOKNAME` varchar(100) NOT NULL,
  `BOOKPRICE` varchar(10) NOT NULL,
  `QUANTITY` int(100) NOT NULL,
  `IMAGE` varchar(50) NOT NULL,
  `TYPE` varchar(40) NOT NULL,
  `STATUS` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BOOK`
--

INSERT INTO `BOOK` (`BOOKID`, `BOOKNAME`, `BOOKPRICE`, `QUANTITY`, `IMAGE`, `TYPE`, `STATUS`) VALUES
(111, 'Everything Sign Language Book', '120.90', 6, '1', 'American', 'Available'),
(222, 'American Sign Language for Dummies', '140.50', 4, '2', 'American', 'Available'),
(333, 'Learn Sign language in a Hurry', '130.90', 6, '3', 'American', 'Available'),
(444, 'Baby Sign Language Made Easy', '123.90', 3, '4', 'Kids', 'Available'),
(555, 'Baby Signs', '120.98', 4, '5', 'Kids', 'Available'),
(666, 'Complete Guide to Baby Sign Language', '129.90', 5, '6', 'Kids', 'Available'),
(777, 'Sign language Companion', '142.89', 5, '7', 'British', 'Available'),
(888, 'Bitish Sign Language for Dummies', '143.80', 3, '8', 'British', 'Available'),
(999, 'British Sign Language', '124.54', 3, '9', 'British', 'Available'),
(100, 'Sign Language for Everyone', '242.12', 7, '10', 'General', 'Available'),
(101, '1,000 Words to Sign', '234.32', 3, '11', 'General', 'Available'),
(122, 'Signing Illustarted', '254.34', 3, '12', 'General', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `CART`
--

CREATE TABLE `CART` (
  `EMAIL` varchar(100) NOT NULL,
  `BOOKID` int(6) NOT NULL,
  `CQUANTITY` varchar(10) NOT NULL,
  `DATE` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CARTHISTORY`
--

CREATE TABLE `CARTHISTORY` (
  `EMAIL` varchar(100) NOT NULL,
  `ORDERID` varchar(100) NOT NULL,
  `BILLID` varchar(20) NOT NULL,
  `BOOKID` varchar(30) NOT NULL,
  `CQUANTITY` varchar(10) NOT NULL,
  `DATE` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT`
--

CREATE TABLE `PAYMENT` (
  `ORDERID` varchar(100) NOT NULL,
  `BILLID` varchar(10) NOT NULL,
  `TOTAL` varchar(10) NOT NULL,
  `USERID` varchar(100) NOT NULL,
  `DATE` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `PASSWORD` varchar(60) NOT NULL,
  `DATEREG` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`NAME`, `EMAIL`, `PHONE`, `PASSWORD`, `DATEREG`) VALUES
('nasuha', 'nasuhashamsullnaim44@gmail.com', '0198876545', '1d2500beaea4ad798f095816d97b05b3c749d252', '2021-01-28 16:53:01.047365'),
('Cleo ', 'cleo123@gmail.com', '0198898980', '2d8918b951541754a79c616b8141a388f08be745', '2021-01-28 16:50:46.627593'),
('siti badriah', 'sitibadriah666@gmail.com', '0123323343', '8bdc25f71fd9e90de8e4704f9d625d858ccf6f64', '2021-01-31 15:42:23.828485'),
('Ahmad abu', 'ahmadabu123@gmail.com', '0198898909', '4be98248b6a6ba24306bbae19900d67844bbf63b', '2021-01-30 18:12:20.492603'),
('lee Chong wei', 'leechongwei989@gmail.com', '0187767676', '6e16777495acc106fe0caad48bdeccadcf2a6792', '2021-01-30 18:17:07.980387'),
('kassim selamat12', 'kassimselamat12@gmail.com', '0198898767', '7f0a3cf1fe4a70741522132a78fa68c7393129e0', '2021-01-31 15:44:37.086085'),
('Nur syafinas', 'nursyafinas34@yahoo.com', '0190098321', '97b30886352d2ca35f52c9f078a7d1a5a84793d7', '2021-01-31 15:46:46.154644'),
('atiqah', 'atiqah123@gmail.com', '0143354654', 'ae6eab31bc2e815f50186754dde8995d6adb94c4', '2021-02-04 18:25:22.022033');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOOK`
--
ALTER TABLE `BOOK`
  ADD PRIMARY KEY (`BOOKID`);

--
-- Indexes for table `CART`
--
ALTER TABLE `CART`
  ADD PRIMARY KEY (`BOOKID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`EMAIL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

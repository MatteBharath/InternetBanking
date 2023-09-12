-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 26, 2020 at 05:04 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `banking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `pass` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `pass`) VALUES
('1', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `amount`
--

CREATE TABLE `amount` (
  `id` varchar(35) NOT NULL,
  `accnumber` varchar(35) NOT NULL,
  `name` varchar(35) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `rpass` varchar(50) NOT NULL,
  `deposit` varchar(35) NOT NULL,
  `rdate` varchar(35) NOT NULL,
  `report` varchar(35) NOT NULL,
  `status` varchar(35) NOT NULL,
  `balance` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amount`
--

INSERT INTO `amount` (`id`, `accnumber`, `name`, `pass`, `rpass`, `deposit`, `rdate`, `report`, `status`, `balance`) VALUES
('1', '2221004', 'mm', '3e5703709259d1aad1ee12bf4de25c6e1ac48ad1cddc5e0c600ec9b764fb23a28b4745f82dbe38ad236ce2ffa51ee71f1aa007632e3c78ad928879574d534a7c', '[B@9b02c9', '0', '22-2-2020', '0', '0', '0'),
('1', '2221001', 'mm', '7ef8c64ec8a7a65ee84386b52a46765f7b0db60f52c4b4c87634abbb4da9f173aa02ea4c63d25fd1e9724fe7c33d2647141ffbadaa5ce30f200e7d62065da4b8', '[B@f97701', '0', '22-2-2020', '0', '0', '500'),
('2', '2231005', 'dhivya', '1a5dadad457fce1724759c032ef20bd07bdceff4a1326753eb8630e43df2d05e47621235c3bd6ab1e3a4fcf18ffc798bed76b0a27aa39049212264bc26d51d5e', '[B@b875d1', '0', '23-2-2020', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mini`
--

CREATE TABLE `mini` (
  `name` varchar(35) NOT NULL,
  `accnumber` varchar(35) NOT NULL,
  `evnt` varchar(35) NOT NULL,
  `amount` varchar(35) NOT NULL,
  `trans_to` varchar(35) NOT NULL,
  `rdate` date NOT NULL,
  `report` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mini`
--

INSERT INTO `mini` (`name`, `accnumber`, `evnt`, `amount`, `trans_to`, `rdate`, `report`) VALUES
('dhivya', '2231005', 'deposit', '1000', '-', '2020-02-23', '0'),
('dhivya', '2231005', 'withdraw', '500', '-', '2020-02-23', '0'),
('dhivya', '2231005', 'trans_to', '500', '2221001', '2020-02-23', '0'),
('mm', '2221001', 'trans_from', '500', '2231005', '2020-02-23', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_reg`
--

CREATE TABLE `user_reg` (
  `id` varchar(35) NOT NULL,
  `name` varchar(35) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `contact` varchar(35) NOT NULL,
  `email` varchar(35) NOT NULL,
  `address` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `rpass` varchar(50) NOT NULL,
  `report` varchar(35) NOT NULL,
  `spam` varchar(35) NOT NULL,
  `rdate` date NOT NULL,
  `accnumber` varchar(100) NOT NULL,
  `image_height` varchar(100) NOT NULL,
  `image_width` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_size` varchar(100) NOT NULL,
  `status` varchar(5) NOT NULL,
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `username_4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reg`
--

INSERT INTO `user_reg` (`id`, `name`, `fname`, `contact`, `email`, `address`, `username`, `pass`, `rpass`, `report`, `spam`, `rdate`, `accnumber`, `image_height`, `image_width`, `image_name`, `image_size`, `status`) VALUES
('2', 'dhivya', 'karuppasamy', '7397016909', 'dhivyadhivya250699@gmail.com', 'trichy', 'dhivya', '1a5dadad457fce1724759c032ef20bd07bdceff4a1326753eb8630e43df2d05e47621235c3bd6ab1e3a4fcf18ffc798bed76b0a27aa39049212264bc26d51d5e', '[B@b875d1', '0', '0', '2020-02-23', '2231005', '1200', '1920', 'bg.jpg', '0.8858747482299805', '0'),
('1', 'mm', 'sakthi', '8754228496', 'srinivasan@gmail.com', 'trichy', 'mm', '7ef8c64ec8a7a65ee84386b52a46765f7b0db60f52c4b4c87634abbb4da9f173aa02ea4c63d25fd1e9724fe7c33d2647141ffbadaa5ce30f200e7d62065da4b8', '[B@f97701', '0', '0', '0000-00-00', '2221001', '271', '600', 'image-1060858308.jpg', '0.12652206420898438', '0');

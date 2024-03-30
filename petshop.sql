-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2022 at 12:24 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(30) NOT NULL,
  `admin_username` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_username`, `admin_password`) VALUES
(1001, 'admin@gmail.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `pet_id` int NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `customer_id`, `pet_id`) VALUES
(3, 2, 2),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(30) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_email` varchar(30) NOT NULL,
  `customer_contact_no` varchar(12) NOT NULL,
  `customer_username` varchar(30) NOT NULL,
  `customer_password` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_address`, `customer_email`, `customer_contact_no`, `customer_username`, `customer_password`) VALUES
(1, 'Mokshith Gowda', 'Bangalore', 'projectmicrotech@gmail.com', '9876543210', 'AWEF', 'eargv'),
(2, 'Mokshith Gowda', 'Bangalore', 'projectmicrotech@gmail.com', '9876543210', 'admin', 'admin'),
(3, 'Mokshith Gowda', 'Bangalore', 'projectmicrotech@gmail.com', '9876543210', 'admin', 'aergv'),
(4, 'Mokshith Gowda', 'Bangalore', 'projectmicrotech@gmail.com', '9876543210', 'admin', 'aergv');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
CREATE TABLE IF NOT EXISTS `favourites` (
  `favourite_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `pet_id` int NOT NULL,
  PRIMARY KEY (`favourite_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`favourite_id`, `customer_id`, `pet_id`) VALUES
(5, 2, 3),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `notification_from` varchar(30) NOT NULL,
  `notification_to` varchar(30) NOT NULL,
  `notification_subject` varchar(30) NOT NULL,
  `notification_message` text NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_from`, `notification_to`, `notification_subject`, `notification_message`) VALUES
(1, 'admin@gmail.com', '1', 'Test', 'Sample'),
(2, 'admin@gmail.com', '1', 'Test', 'sample'),
(3, 'admin@gmail.com', '1', 'Test', 'test'),
(4, 'projectmicrotech@gmail.com', 'admin@gmail.com', 'Test', 'aer'),
(5, 'projectmicrotech@gmail.com', 'admin@gmail.com', 'saef', 'QWFCQ');

-- --------------------------------------------------------

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
CREATE TABLE IF NOT EXISTS `notify` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `notification_from` varchar(30) NOT NULL,
  `notification_to` varchar(30) NOT NULL,
  `notification_subject` varchar(30) NOT NULL,
  `notification_message` text NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `amount` int NOT NULL,
  `status` varchar(30) NOT NULL,
  `invoice_number` varchar(30) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `pet_id`, `amount`, `status`, `invoice_number`, `datetime`) VALUES
(35, 2, 3, 234, 'ORDER PLACED', 'OED4ED7SKX', '2022-07-14 03:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `amount` int NOT NULL,
  `status` varchar(30) NOT NULL,
  `invoice_number` varchar(30) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `customer_id`, `pet_id`, `amount`, `status`, `invoice_number`, `datetime`) VALUES
(27, 2, 3, 234, 'TXN_SUCCESS', 'OED4ED7SKX', '2022-07-14 03:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
CREATE TABLE IF NOT EXISTS `pets` (
  `pet_id` int NOT NULL AUTO_INCREMENT,
  `breed_name` varchar(30) NOT NULL,
  `age` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `cost` int NOT NULL,
  `image_loc` text NOT NULL,
  PRIMARY KEY (`pet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `breed_name`, `age`, `description`, `cost`, `image_loc`) VALUES
(2, 'Sample', '12 months', 'Sample', 12200, '../petimages/RvC1TEAIoAabout-1.jpg'),
(3, 'Sample', '12 months', 'saef', 234, '../petimages/zmzaOJIyiyimage_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(30) NOT NULL,
  `vendor_address` text NOT NULL,
  `vendor_email` varchar(30) NOT NULL,
  `vendor_contact_no` varchar(12) NOT NULL,
  `vendor_username` varchar(30) NOT NULL,
  `vendor_password` varchar(30) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_name`, `vendor_address`, `vendor_email`, `vendor_contact_no`, `vendor_username`, `vendor_password`) VALUES
(1, 'Mokshith Gowda', 'Bangalore', 'projectmicrotech@gmail.com', '9876543210', 'admin', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

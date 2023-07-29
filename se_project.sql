-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 06:21 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `se_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

CREATE TABLE `ad` (
  `ad_id` int(11) NOT NULL,
  `re_no` text NOT NULL,
  `model` int(11) NOT NULL,
  `make` text NOT NULL,
  `name` text NOT NULL,
  `mileage` int(11) NOT NULL,
  `engine_capacity` int(11) NOT NULL,
  `color` text NOT NULL,
  `seating_capacity` int(11) NOT NULL,
  `cost` float NOT NULL,
  `category` text NOT NULL,
  `availability` text NOT NULL,
  `transmission` text NOT NULL,
  `assembly` text NOT NULL,
  `ad_status` text NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_contact_no` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ad`
--

INSERT INTO `ad` (`ad_id`, `re_no`, `model`, `make`, `name`, `mileage`, `engine_capacity`, `color`, `seating_capacity`, `cost`, `category`, `availability`, `transmission`, `assembly`, `ad_status`, `owner_id`, `owner_contact_no`) VALUES
(1, 'FGD-453', 2015, 'Honda', 'Accord', 75000, 1300, 'Red', 4, 1400000, 'Sedan', 'Purchased', 'Automatic', 'Local', 'Active', 33, 3354584848),
(22, 'KGU-464', 2022, 'Suzuki', 'Ciaz', 40000, 1200, 'White', 4, 300000, 'Sedan', 'Purchased', 'Automatic', 'Imported', 'Active', 1, 3357557438),
(23, 'UJT-873', 2017, 'Honda', 'Accord', 56000, 1000, 'Blue', 4, 500000, 'Sedan', 'Available', 'Automatic', 'Local', 'Active', 1, 3357557438);

-- --------------------------------------------------------

--
-- Table structure for table `admin_manages_ad`
--

CREATE TABLE `admin_manages_ad` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin_t`
--

CREATE TABLE `admin_t` (
  `id` int(11) NOT NULL,
  `f_name` text NOT NULL,
  `l_name` text NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `email` text NOT NULL,
  `contact_no` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_t`
--

INSERT INTO `admin_t` (`id`, `f_name`, `l_name`, `password`, `gender`, `email`, `contact_no`) VALUES
(3, 'Hassan', 'Jamil', 'Hassan123', 'Male', 'k191292@nu.edu.pk', 3357557438),
(4, 'Hamza', 'Ayub', 'Ayub123', 'Male', 'k191261@nu.edu.pk', 3354584848),
(5, 'Mubashira', 'Khan', 'Mubs1234', 'Female', 'k190239@nu.edu.pk', 6566464448);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `f_name` text NOT NULL,
  `l_name` text NOT NULL,
  `password` text NOT NULL,
  `age` int(3) NOT NULL,
  `gender` text NOT NULL,
  `address` text NOT NULL,
  `email` text DEFAULT NULL,
  `ad_count` int(5) NOT NULL,
  `contact_no` bigint(11) NOT NULL,
  `warning` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `f_name`, `l_name`, `password`, `age`, `gender`, `address`, `email`, `ad_count`, `contact_no`, `warning`) VALUES
(1, 'Hassan', 'Jamil', 'Hassan123', 21, 'Male', 'Karachi, Pakistan', 'k191292@nu.edu.pk', 0, 3357557438, 0),
(33, 'Hamza', 'Adeel', 'Adeel123', 32, 'Male', 'Karachi', 'k190189@nu.edu.pk', 0, 3354584848, 0),
(34, 'Sarim', 'Sohail', 'Sarim1234', 34, '', 'Karachi, Pakistan', 'k190152@nu.edu.pk', 0, 3555488886, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD UNIQUE KEY `re_no` (`re_no`) USING HASH,
  ADD UNIQUE KEY `re_no_2` (`re_no`) USING HASH,
  ADD UNIQUE KEY `re_no_3` (`re_no`) USING HASH,
  ADD KEY `customer_id` (`owner_id`),
  ADD KEY `customer_contact_no` (`owner_contact_no`);

--
-- Indexes for table `admin_manages_ad`
--
ALTER TABLE `admin_manages_ad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `admin_t`
--
ALTER TABLE `admin_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_no` (`contact_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad`
--
ALTER TABLE `ad`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_manages_ad`
--
ALTER TABLE `admin_manages_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_t`
--
ALTER TABLE `admin_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ad`
--
ALTER TABLE `ad`
  ADD CONSTRAINT `customer_contact_no` FOREIGN KEY (`owner_contact_no`) REFERENCES `customer` (`contact_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`owner_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_manages_ad`
--
ALTER TABLE `admin_manages_ad`
  ADD CONSTRAINT `ad_id` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`ad_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin_t` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

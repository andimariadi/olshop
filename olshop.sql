-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2018 at 02:34 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `linkname` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` int(50) NOT NULL,
  `discont` int(11) NOT NULL,
  `first_date_discon` date NOT NULL,
  `last_date_discon` date NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(100) NOT NULL,
  `linkname` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chart_user`
--

CREATE TABLE `chart_user` (
  `id` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_user`
--

CREATE TABLE `data_user` (
  `id` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `country` varchar(100) NOT NULL,
  `zip_code` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image_barang`
--

CREATE TABLE `image_barang` (
  `id` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `link_url` varchar(100) NOT NULL,
  `name_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesan_barang`
--

CREATE TABLE `pesan_barang` (
  `id` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `id_barang` int(100) NOT NULL,
  `total_pesan` int(10) NOT NULL,
  `total_bayar` int(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(10) NOT NULL,
  `caption_title` text NOT NULL,
  `caption_subtitle` text NOT NULL,
  `url_product` text NOT NULL,
  `url_image` text NOT NULL,
  `name_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `caption_title`, `caption_subtitle`, `url_product`, `url_image`, `name_image`) VALUES
(1, 'iPhone <span class=\"primary\">6 <strong>Plus</strong></span>', 'Dual SIM', '#', 'http://127.0.0.1/olshop/___/img/h4-slide.png', 'h4-slide.png'),
(2, 'by one, get one <span class=\"primary\">50% <strong>off</strong></span>', 'school supplies & backpacks.*', '#', 'http://127.0.0.1/olshop/___/img/h4-slide2.png', 'slide2.png'),
(3, 'Apple <span class=\"primary\">Store <strong>Ipod</strong></span>', 'Select Item', '#', 'http://127.0.0.1/olshop/___/img/h4-slide3.png', 'slide 3'),
(4, 'Apple <span class=\"primary\">Store <strong>Ipod</strong></span>', '& Phone', '#', 'http://127.0.0.1/olshop/___/img/h4-slide4.png', 'slide 4');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(100) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `username`, `password`, `level`) VALUES
(1, 'andimariadi', '$2y$10$5JmyB.a/vx1JEOZDKcd4FuMeYbsbcLhzNibVreGlwws/IpEMdgggi', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `verification_pesanan`
--

CREATE TABLE `verification_pesanan` (
  `id` int(100) NOT NULL,
  `id_pesanan` int(100) NOT NULL,
  `link_url` varchar(100) NOT NULL,
  `name_image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_user`
--
ALTER TABLE `chart_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_barang`
--
ALTER TABLE `image_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan_barang`
--
ALTER TABLE `pesan_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_pesanan`
--
ALTER TABLE `verification_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chart_user`
--
ALTER TABLE `chart_user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_user`
--
ALTER TABLE `data_user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image_barang`
--
ALTER TABLE `image_barang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `verification_pesanan`
--
ALTER TABLE `verification_pesanan`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

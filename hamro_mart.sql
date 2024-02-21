-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 05:05 AM
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
-- Database: `hamro_mart`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `name`, `quantity`, `price`, `total`) VALUES
(86, 'Lal Qilla Basmati Rice', 1, 1600, 1600);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `quantity`, `image`) VALUES
(65, 3, 'Lal Qilla Basmati Rice', 1600, 1, 'basmati rice.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `total_products` varchar(100) NOT NULL,
  `total_price` int(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `address`, `total_products`, `total_price`, `method`, `order_status`, `payment_status`, `date`, `number`) VALUES
(26, 5, 'Pratik Adhikari', 'pratikadhikari977@gmail.com', 'Kathmandu, Lalitpur', 'Hills Premium Dry Cat Food (1) Purina Friskies Dry Cat Food (1) RS Aquarium Heater (1) ', 3850, 'e-sewa', 'delivered', 'paid', '0000-00-00', '9822834472'),
(27, 3, 'Pratik Adhikari', 'pratikadhikari977@gmail.com', 'Kathmandu, Lalitpur', 'Wai-Wai Noodles (1) ', 25, 'e-sewa', '', '', '0000-00-00', '9822834472'),
(28, 3, 'Pratik Adhikari', 'pratikadhikari977@gmail.com', 'Kathmandu, Lalitpur', 'Samsung S23 Ultra (1) ', 179500, 'e-sewa', '', '', '0000-00-00', '9822834472');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `type`) VALUES
(1, 'Baltra Rice Cooker', 2000, 'rice cooker.jpeg', 'Electronics'),
(2, 'Samsung S23 Ultra', 179500, 'samsung S23.jpeg', 'Mobile Phone'),
(8, 'Lal Qilla Basmati Rice', 1600, 'basmati rice.jpeg', 'Food'),
(9, 'Wai-Wai Noodles', 25, 'chauchau.jpeg', 'Food'),
(10, 'Nutrela Soybean', 650, 'nutrela soyabin.jpeg', 'Food'),
(11, 'Baltra Stand Fan', 1800, 'Stand Fan.jpeg', 'Electronics'),
(12, 'Britiania Good Day', 40, 'biscuit.jpeg', 'Food'),
(13, 'RS Aquarium Heater', 500, 'rs_heater.jpg', 'Pets'),
(14, 'SOBO Aquarium Filter', 760, 'sobo_filter.jpg', 'Pets'),
(15, 'Apache RTR 200', 400000, 'Apache_RTR.jpg', 'Motorcycle'),
(16, 'Baltra Table Fan', 2600, 'Table Fan.jpeg', 'Electronics'),
(17, 'Hills Premium Dry Cat Food', 2500, 'hills_cat_food.png', 'Pets'),
(18, 'Purina Friskies Dry Cat Food', 850, 'Purina_Friskies_Cat_Food.png', 'pets');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'Pratik Adhikari', 'pratikadhikari977@gmail.com', '123456', 'admin'),
(2, 'Kshitiz Subedi', 'kshitizsubedi@gmail.com', '123456', 'admin'),
(3, 'Amish', 'amishupreti@gmail.com', '123456', 'user'),
(4, 'Kshitiz', 'kshitizsubedi@gmail.com', '123456', 'user'),
(5, 'prashav', 'prashav@gmail.com', '123456', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

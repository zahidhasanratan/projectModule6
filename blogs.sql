-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 07:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `created_at`, `updated_at`) VALUES
(2, 'Jasim Doe', '2025-01-10 06:41:32', '2025-01-10 06:45:26'),
(3, 'Jane Smith', '2025-01-10 06:41:32', '2025-01-10 06:41:32'),
(4, 'Alice Johnson', '2025-01-10 06:41:32', '2025-01-10 06:41:32'),
(5, 'Robert Brown', '2025-01-10 06:41:32', '2025-01-10 06:41:32'),
(6, 'Emily Davis', '2025-01-10 06:41:32', '2025-01-10 06:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `body`, `category_id`, `author_id`, `created_at`, `updated_at`) VALUES
(2, 'Top 10 Healthy Habits', 'Content about staying healthy...', 2, 2, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(3, 'Minimalist Living Tips', 'Content about minimalism...', 3, 3, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(4, 'Backpacking in Europe', 'Content about budget travel...', 4, 4, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(5, 'Online Learning Platforms', 'Content about online education...', 5, 5, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(7, 'Yoga for Beginners', 'Content about starting yoga...', 2, 2, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(8, 'How to Declutter Your Home', 'Content about decluttering...', 3, 3, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(9, 'Top 5 Beaches to Visit', 'Content about travel destinations...', 4, 4, '2025-01-10 06:41:36', '2025-01-10 06:41:36'),
(10, 'Importance of Lifelong Learning', 'Content about continuous education...', 4, 2, '2025-01-10 06:41:36', '2025-01-10 06:48:49'),
(11, 'My Blog', 'My blog\'s content', 2, 2, '2025-01-10 06:47:43', '2025-01-10 06:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(2, 'Health & Wellness', '2025-01-10 06:41:34', '2025-01-10 06:41:34'),
(3, 'Lifestyle', '2025-01-10 06:41:34', '2025-01-10 06:41:34'),
(4, 'Travel', '2025-01-10 06:41:34', '2025-01-10 06:41:34'),
(5, 'Education', '2025-01-10 06:41:34', '2025-01-10 06:41:34'),
(6, 'My Category', '2025-01-10 06:46:27', '2025-01-10 06:46:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

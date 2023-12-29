-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 07:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `type19_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `year`, `cat_id`, `isDeleted`) VALUES
(1, 'Book about Crime', 'James Band', '2014', 4, 1),
(2, '1984', 'James Carr', '1984', 2, 1),
(3, 'Little Prince', 'Jane Dow', '1999', 3, 0),
(4, 'War and Peace', 'James Band', '1965', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `category`) VALUES
(1, 'Comedy'),
(2, 'Thriller '),
(3, 'Fantasy'),
(4, 'Detective'),
(5, 'Spiritual');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `author`, `date`, `body`) VALUES
(3, 'Update update', 'James Rest 3000', '2023-12-04', 'Body about post 3'),
(4, 'Pakeiciau', 'Serbentautas', '2023-12-14', 'Post about Boxing from T. '),
(5, 'Post 5', 'Mike T', '2023-12-15', 'Post about Boxing from T. '),
(6, 'Post 6', 'Jane Dow', '2023-11-05', 'Post 6 about Jane'),
(7, 'Post Rest', 'Mike Rest', '2023-12-15', 'Post about Boxing from T. '),
(8, 'Post Rest', 'Mike Rest', '2023-12-15', 'Post about Boxing from T. '),
(9, 'Post from REST REST', 'James Rest', '2000-01-02', 'This is some meanigful content'),
(22, 'Post from REST REST', 'James Rest', '2000-01-02', 'This is some meanigful content'),
(23, 'Post from Thunder bold', 'James Rest', '2020-01-02', 'This is some meanigful content'),
(24, '   s', 'James Rest', '2020-01-02', 'This is some meanigful content'),
(25, 'Jane', 'James Rest', '2020-01-02', 'This is some meanigful content'),
(26, ' ', 'dfdf', '2020-01-02', 'This is some meanigful content'),
(27, 'Naujas post title', 'Serbentautas B.', '2023-01-02', 'This is some meanigful content'),
(28, 'Naujas post title', 'Serbentautas B.', '2023-01-02', 'This is some meanigful content'),
(29, 'Naujas post title', 'Serbentautas B.', '2023-01-02', 'This is some meanigful content'),
(30, 'Naujas post title', 'Serbentautas B.', '2023-01-02', 'This is some meanigful content'),
(31, 'front end title', 'Sarah Lee', '2023-12-12', 'This is some body of post'),
(32, 'james', 'kazkas', '2023-12-04', 'asdas asd asd asd asd'),
(33, 'dsdf', 'sdfsdf', '2023-12-13', 'sdfsdfsdf'),
(34, 'asda', 'asdas', '2023-12-15', 'asdas d sdas d'),
(35, 'asda sda', 's dasd asd', '2023-12-22', 'asd as das d'),
(36, 'Christmas', 'Santa Klaus', '2023-12-25', 'this is christmas');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `timestamp`) VALUES
(1, 'james@band.com', '123456', '2023-12-22 09:25:45'),
(2, 'mike@tyson.com', 'secret123', '2023-12-22 09:26:11'),
(3, 'jane@dow.com', 'secret456', '2023-12-22 09:26:41'),
(4, 'testUsername', 'testValue', '2023-12-27 06:21:42'),
(6, 'blue@tyson.com', 'secret123', '2023-12-27 06:35:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

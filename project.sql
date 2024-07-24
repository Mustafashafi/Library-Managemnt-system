-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 06:38 AM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_books`
--

CREATE TABLE `available_books` (
  `book_id` varchar(20) NOT NULL,
  `bookname` text NOT NULL,
  `Author` text NOT NULL,
  `Quantity` int(1) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `available_books`
--

INSERT INTO `available_books` (`book_id`, `bookname`, `Author`, `Quantity`, `photo`) VALUES
('1223498', 'MOBY DICKED', 'JDSalinger', 1, 'Capture.PNG'),
('978140', 'Tyson', 'Herman Melville', 37, 'book-media-grid-10.jpg'),
('978145', 'MOBY DICK', 'Gabriel García Márquez', 18, 'category-filter-img-04.jpg'),
('978151', 'Short to the heart', 'Fyodor Dostoevsky', 26, 'book-media-grid-12.jpg'),
('978152', 'The Big Short', 'F. Scott Fitzgerald', 100, 'book-media-grid-03.jpg'),
('978154', 'The Biochar Revolution', 'Harper Lee', 15, 'book-media-grid-04.jpg'),
('978156', 'SONIC BOOM', 'Jane Austen', 60, 'book-media-grid-07.jpg'),
('978157', 'The Missing Peace', 'George Orwell', 20, 'book-media-grid-11.jpg'),
('978158', 'Annual Report', 'J.D. Salinger', 20, 'book-media-grid-05.jpg'),
('978159', 'The Great Gatsby', 'J.R.R. Tolkien', 90, 'book-media-grid-09.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `book_id` varchar(20) NOT NULL,
  `Reg_id` varchar(20) NOT NULL,
  `Issuer_Name` text NOT NULL,
  `Semester` int(1) NOT NULL,
  `Department` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`book_id`, `Reg_id`, `Issuer_Name`, `Semester`, `Department`) VALUES
('978140', '21mdbcs121', 'Muhammad Mustafa', 6, 'Cs'),
('978140', '21mdbcs126', 'Usama', 6, 'Cs'),
('978145', '21mdbcs121', 'Muhammad Mustafa', 6, 'Telecom');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
('10', 'mustafa@gmail.com', 'mustafa32'),
('11', 'usama@gmail.com', 'usama32'),
('12', 'shaheer@gmail.com', 'shaheer32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available_books`
--
ALTER TABLE `available_books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`book_id`,`Reg_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

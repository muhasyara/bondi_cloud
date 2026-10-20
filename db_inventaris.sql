-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2026 at 06:26 PM
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
-- Database: `db_inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `waktu` datetime DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL,
  `aksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `waktu`, `username`, `aksi`) VALUES
(19, '2026-06-30 22:58:43', 'admin', 'Menambahkan tas baru: Coach Tabby Shoulder Bag 26'),
(20, '2026-06-30 22:59:00', 'admin', 'Menambahkan tas baru: Coach Willow Tote Bag'),
(21, '2026-06-30 22:59:20', 'admin', 'Menambahkan tas baru: Coach Rowan Satchel'),
(22, '2026-06-30 22:59:38', 'admin', 'Menambahkan tas baru: Michael Kors Jet Set Tote'),
(23, '2026-06-30 23:00:07', 'admin', 'Menambahkan tas baru: Michael Kors Mercer Medium Messenger'),
(24, '2026-06-30 23:00:29', 'admin', 'Menambahkan tas baru: Michael Kors Cece Chain Shoulder Bag'),
(25, '2026-06-30 23:00:51', 'admin', 'Menambahkan tas baru: Kate Spade Spencer Crossbody'),
(26, '2026-06-30 23:01:12', 'admin', 'Menambahkan tas baru: Kate Spade Knott Satchel'),
(27, '2026-06-30 23:02:06', 'admin', 'Menambahkan tas baru: Kate Spade Margaux Tote'),
(28, '2026-06-30 23:21:53', 'admin', 'Menambahkan tas baru: Gucci Marmont Shoulder Bag'),
(29, '2026-06-30 23:22:04', 'admin', 'Menambahkan tas baru: Gucci Ophidia GG Tote'),
(30, '2026-06-30 23:22:15', 'admin', 'Menambahkan tas baru: Gucci Dionysus Small Bag'),
(31, '2026-06-30 23:22:39', 'admin', 'Menambahkan tas baru: Louis Vuitton Neverfull MM'),
(32, '2026-06-30 23:22:57', 'admin', 'Menambahkan tas baru: Louis Vuitton Speedy 30'),
(33, '2026-06-30 23:23:16', 'admin', 'Menambahkan tas baru: Louis Vuitton Alma BB'),
(34, '2026-06-30 23:23:32', 'admin', 'Menambahkan tas baru: Prada Re-Edition 2005 Nylon Bag'),
(35, '2026-06-30 23:23:49', 'admin', 'Menambahkan tas baru: Prada Galleria Saffiano Tote'),
(36, '2026-06-30 23:24:03', 'admin', 'Menambahkan tas baru: Prada Cahier Shoulder Bag'),
(37, '2026-06-30 23:24:24', 'admin', 'Menambahkan tas baru: Chanel Classic Flap Medium'),
(38, '2026-06-30 23:24:41', 'admin', 'Menambahkan tas baru: Chanel Boy Chanel Small');

-- --------------------------------------------------------

--
-- Table structure for table `tas`
--

CREATE TABLE `tas` (
  `id` int(11) NOT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `harga` double NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tas`
--

INSERT INTO `tas` (`id`, `merk`, `tipe`, `harga`, `stok`) VALUES
(8, 'Coach', 'Tabby Shoulder Bag 26', 4850000, 3),
(9, 'Coach', 'Willow Tote Bag', 3950000, 2),
(10, 'Coach', 'Rowan Satchel', 3250000, 4),
(11, 'Michael Kors', 'Jet Set Tote', 2950000, 3),
(12, 'Michael Kors', 'Mercer Medium Messenger', 3450000, 3),
(13, 'Michael Kors', 'Cece Chain Shoulder Bag', 4200000, 4),
(14, 'Kate Spade', 'Spencer Crossbody', 2300000, 2),
(15, 'Kate Spade', 'Knott Satchel', 2850000, 3),
(16, 'Kate Spade', 'Margaux Tote', 3150000, 2),
(17, 'Gucci', 'Marmont Shoulder Bag', 1520000, 1),
(18, 'Gucci', 'Ophidia GG Tote', 12750000, 2),
(19, 'Gucci', 'Dionysus Small Bag', 18500000, 1),
(20, 'Louis Vuitton', 'Neverfull MM', 18000000, 2),
(21, 'Louis Vuitton', 'Speedy 30', 14800000, 1),
(22, 'Louis Vuitton', 'Alma BB', 16700000, 2),
(23, 'Prada', 'Re-Edition 2005 Nylon Bag', 12750000, 1),
(24, 'Prada', 'Galleria Saffiano Tote', 18500000, 1),
(25, 'Prada', 'Cahier Shoulder Bag', 13000000, 2),
(26, 'Chanel', 'Classic Flap Medium', 40000000, 1),
(27, 'Chanel', 'Boy Chanel Small', 38000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'passadmin', 'admin'),
(2, 'karyawan', 'passkaryawan', 'karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tas`
--
ALTER TABLE `tas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tas`
--
ALTER TABLE `tas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

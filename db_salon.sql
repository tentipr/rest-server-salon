-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2020 at 06:18 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_salon`
--

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '12345', 1, 0, 0, '1', 1),
(2, 2, '1234567', 1, 0, 0, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:salon/index:get', 4, 1607877708, '12345'),
(2, 'uri:salon/index:get', 6, 1607877756, '1234567'),
(3, 'method-name:index_get', 2, 1607878746, '1234567'),
(4, 'api-key:1234567', 2, 1607878953, '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `tb_salon`
--

CREATE TABLE `tb_salon` (
  `ID_salon` int(11) NOT NULL,
  `nama_salon` varchar(40) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `telepon` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_salon`
--

INSERT INTO `tb_salon` (`ID_salon`, `nama_salon`, `kota`, `alamat`, `telepon`) VALUES
(1, 'Adea Salon', 'Kota Malang', 'Jl. Galunggung No. 94, Malang', '0341-58596'),
(2, 'Annisa Beauty Salon & Bod', 'Kota batu', 'Jl. Ridwan No.14, Ngaglik', '0341-59589'),
(3, 'E. M. R Salon & Spa', 'Kota Batu', 'Jl. Dorowati No.30, Sisir', '0858-5373-7565'),
(4, 'Omah Cukur', 'Kota Batu', 'Jl. Diponegoro No. 54, Sisir', '0812-3227-2756'),
(5, 'Evee Beauty Salon', 'Kota Malang', 'Perumahan Green View Blok D17, Turirejo', '0812-9588-9487'),
(6, 'Sogo Salon Hair Spa Body', 'Kota Malang', 'Jl. Terusan Borobudur No.16-A Mojolangu', '0341-472347'),
(7, 'V3 alon & Spa', 'Kota Malang', 'Jl. Terusan Ikan Nus I No. 6, Tunjungsar', '0813-3300-8151'),
(8, 'Gracia House of Beauty', 'Kabupaten Malang', 'Jl. Sukun No.23, Kepanjen', '0341-393550'),
(9, 'Shofi Skincare', 'Kabupaten Malang', 'Jl. Sidodadi No.34, Kromengan', '0812-3024-2018'),
(10, 'Ayu Hair & Spa', 'Kabupaten Malang', 'Jl. Trunujoyo No. 54 Krajan I, Gondangle', '0858-5989-5843'),
(11, 'Edelweis Salon & Spa', 'Kabupaten Malang', 'Jl. Panji No.36B, Kepanjen', '0812-3332-3356'),
(12, 'Favorite Salon', 'Kabupaten Malang', 'Jl. Paji No.124, Kepanjen', '0812-3398-9485'),
(13, 'Ayoung Salon', 'Kabupaten Malang', 'Jl. Ahmad Yani No.159, Kepanjen', '0821-4064-4975'),
(14, 'Rumah Cantik Dr. Lisna', 'Kabupaten Malang', 'Jl. Raya Paisaji, Jatirejo', '0812-3347-9587'),
(15, 'Hawai Barbershop Kepanjen', 'Kabupaten Malang', 'Jl. Efendi No.92, Kepanjen', '0813-2117-4654'),
(16, 'Pulman Executive Barbersh', 'Kota Malang', 'Jl. Jaksa Agung Suprapto No.1, Oro-oro D', '0341-3030555'),
(17, 'Jhon87 Barbershop', 'Kabupaten Malang', 'Jl. Pertokoan Kantor Pos, Kepanjen', '0813-5965-9885'),
(18, '18 Gentlemen Barbershop', 'Kota Malang', 'Jl. Sarangan No.1D, Lowokwaru', '0812-3365-0064'),
(19, 'Pheromone Barbershop', 'Kota Malang', 'Jl. Kerto Raharjo No. 02 Ketawanggede, L', '0812-1622-0745'),
(20, 'Sun Salon Haircut & Treatment', 'Kota Malang', 'Jl. Simpang Borobudur No.58 Mojolangu, L', '0341-417717'),
(21, 'ViAipi Haircare', 'Kota Malang', 'Jl. Mawar, Lowokwaru', '0822-2100-0482'),
(22, 'Spencer Salon', 'Kota Malang', 'Jl. Gajayana No.19 Sumbersari, Lowokwaru', '0341-4374756'),
(23, 'Be Beauty & Chic Salon', 'Kota Malang', 'Jl. Sigura - Gura Sumbersari, Lowokwaru', '0341-558477'),
(24, 'Modern 2 Mini Barbershop', 'Kota Batu', 'Jl. Dewi Sartika No.3, Temas', '0813-1946-6754'),
(25, 'The Batu Salon', 'Kota Batu', 'Jl. Kartika No.16, Ngaglik', '0341-5103146'),
(26, 'Jili Salon', 'Kota Batu', 'Jl. Kartini No.10, Ngaglik', '0812-2200-0485'),
(27, 'Salon Ivel', 'Kota Batu', 'Jl. Dewi Sartika No.9B, Temas ', '0813-3014-4273'),
(28, 'Kusuma Salon', 'Kota Batu', 'Jl. Cemara Pentris, Sidomulyo', '0813-3315-6265'),
(29, 'Viota Beauty Care', 'Kota Malang', 'Jl. Tirto Utomo NO.7 Dusun Rambaan, Land', '0341-2998531'),
(30, '[removed]alert&#40;\'Gria DW Skoncare & S', 'Kota Malang', 'Jl. Raya Candi VI No. 9 Dinoyo, Lowokwar', '0813-7910-0453');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_salon`
--
ALTER TABLE `tb_salon`
  ADD PRIMARY KEY (`ID_salon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_salon`
--
ALTER TABLE `tb_salon`
  MODIFY `ID_salon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

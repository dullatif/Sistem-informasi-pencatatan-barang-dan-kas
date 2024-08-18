-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Agu 2023 pada 09.45
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_akhir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang` varchar(20) NOT NULL,
  `jenis_barang` varchar(50) NOT NULL,
  `tglkeluar` varchar(20) NOT NULL,
  `jmlhqty` varchar(100) NOT NULL,
  `namaplngn` varchar(50) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang`, `jenis_barang`, `tglkeluar`, `jmlhqty`, `namaplngn`, `ket`) VALUES
('M01', 'Jok Mobil Avanza', '03-08-2023', '1', 'Darmawan', 'jltebet raya no10'),
('M03', 'Lampu depan Brio', '09-08-2023', '2', 'Sandi auliya', '-'),
('M02', 'Lampu depan Civic', '10-08-2023', '4', 'Akbar Kosasi', 'Langsung dipasangkan'),
('M03', 'Lampu depan Brio', '08-08-2023', '1', 'Darmawan', 'Langsung di pasangkan');

--
-- Trigger `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `transaksi` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
UPDATE barang_masuk SET jumlah=jumlah-new.jmlhqty WHERE id_barang=new.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang` varchar(50) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `nama_suplier` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tgl_masuk` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang`, `jenis_barang`, `nama_suplier`, `jumlah`, `tgl_masuk`) VALUES
('M01', 'Jok Mobil Avanza', 'Setiawan', '4', '2023-08-08'),
('M03', 'Lampu depan Brio', 'Rama', '2', '2023-08-09'),
('M02', 'Lampu depan Civic', 'Rama', '6', '2023-08-10'),
('M04', 'Jok', 'Rama', '10', '2023-08-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_pelanggan` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `hp` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_pelanggan`, `nama`, `hp`, `email`, `alamat`) VALUES
('P-02', 'Sandiauliya', '8219088790', 'sandiauliya14@gmail.com', 'Jl Tebet Timur dalam VII No 30'),
('P-03', 'Darmawan', '82188812123', 'damawandar@gmaiml.com', 'Jl Raya Kebagusan 5 No 20A'),
('P-01', 'Akbar Kosi', '82260199746', 'akbar250@gmail.com', 'Jl Asembaris Raya Rt05/10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kas_keluar`
--

CREATE TABLE `kas_keluar` (
  `id_keluar` varchar(20) NOT NULL,
  `sumber_keluar` varchar(100) NOT NULL,
  `tgl_keluar` varchar(20) NOT NULL,
  `jumlah` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kas_keluar`
--

INSERT INTO `kas_keluar` (`id_keluar`, `sumber_keluar`, `tgl_keluar`, `jumlah`) VALUES
('KK01', 'Pembelian jok mobil avanza jumlah 10', '03-08-2023', 500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kas_masuk`
--

CREATE TABLE `kas_masuk` (
  `id_masuk` varchar(20) NOT NULL,
  `sumber_masuk` varchar(100) NOT NULL,
  `tglmasuk` varchar(10) NOT NULL,
  `jumlah` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kas_masuk`
--

INSERT INTO `kas_masuk` (`id_masuk`, `sumber_masuk`, `tglmasuk`, `jumlah`) VALUES
('KM01', 'Pemasangan sepion mobil pajero 1set', '05-08-2023', 2000000),
('KM02', 'Pemasangan Lampu brio', '03-08-2023', 50000),
('KM03', 'pemasangan jok pajero', '04-08-2023', 2000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`, `level`) VALUES
('Admin', '123', 'Admin'),
('Petugas', '1234', 'Petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id_pelanggan` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `rekening` int(50) NOT NULL,
  `bank` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id_pelanggan`, `nama`, `rekening`, `bank`) VALUES
('P-03', 'Darmawan', 1212098987, 'BCA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `kode_suplier` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `hp` int(25) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`kode_suplier`, `nama`, `email`, `hp`, `alamat`) VALUES
(202302, 'Dudung Jok', 'jokmobil12@gmail.com', 857321413, 'Jl Tebet Raya No 30A'),
(202303, 'Rama ', 'mobilacc@gmail.com', 81255676, 'Jl Kebagusan Raya Blok 7A'),
(202301, 'Abdul Accs', 'abdul2020@gmail.com', 82260198, 'Jl Kebon Baru Raya No 20 RT09/11 Jakarta Selatan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kas_keluar`
--
ALTER TABLE `kas_keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indeks untuk tabel `kas_masuk`
--
ALTER TABLE `kas_masuk`
  ADD PRIMARY KEY (`id_masuk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

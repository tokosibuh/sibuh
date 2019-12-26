-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 26 Des 2019 pada 10.37
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `db_sibuh`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'saya'),
(2, 'admin', 'admin', 'saya'),
(3, 'admin', 'admin', ''),
(4, 'admin', 'admin', 'saya'),
(5, 'admin', 'admin', 'saya'),
(6, 'admin', 'admin', 'saya'),
(7, 'user', '123456', 'ani');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE IF NOT EXISTS `ongkir` (
  `id_ongkir` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  PRIMARY KEY (`id_ongkir`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'gemak', 20000),
(2, 'cirebon', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(57) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'uni@gmail.com', '123', 'uni', '08765432123', ''),
(7, 'ari@gmail.com', 'ari', 'ari', '08765432120', ''),
(8, 'fitra@gmail.com', 'karmilaa', 'fitah', '089765423', 'labessi'),
(9, 'sahruni.unhye22@gmail.com', '12345', 'sahruni', '086543212345', 'tengapadange desa timusu'),
(10, 'sahruni45@gmail.com', '123', 'uni', '23344', 'e');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 23, 'ari', 'BRI', 145000, '2019-12-16', '20191216134753beautiful-wallpaper-download-23-640x360.jpg'),
(2, 24, 'uni', '', 0, '2019-12-17', '20191217030229'),
(3, 24, 'uni', 'BRI', 80000, '2019-12-17', '20191217030302beautiful-wallpaper-download-22-640x360.jpg'),
(4, 24, 'uni', 'BRI', 80000, '2019-12-17', '201912170304167.PNG'),
(5, 26, 'karmila', 'bni', 17000, '2019-12-17', '20191217030534Capture.PNG'),
(6, 32, 'karmila', 'bni', 80000, '2019-12-17', '20191217033202beautiful-wallpaper-download-23-640x360.jpg'),
(7, 30, 'cila', 'BRI', 445000, '2019-12-17', '20191217034928beautiful-wallpaper-download-22-640x360.jpg'),
(8, 31, 'cila', 'BRI', 41000, '2019-12-17', '20191217035537beautiful-wallpaper-download-15-640x360.jpg'),
(9, 29, 'boneka', 'mandiri', 595000, '2019-12-17', '201912170706143.PNG'),
(10, 34, 'sahruni', 'BRI', 50000, '2019-12-17', '20191217082755beautiful-wallpaper-download-26-640x360.jpg'),
(11, 36, 'karmila', 'bni', 55000, '2019-12-17', '20191217084836beautiful-wallpaper-download-15-640x360.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `id_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pembelian`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(21, 2, 1, '2019-12-16', 50000, 'gemak', 20000, 'soppeng \r\n', 'pending', ''),
(22, 1, 1, '2019-12-16', 50000, 'gemak', 20000, 'soppeng', 'pending', ''),
(25, 7, 1, '2019-12-16', 50000, 'gemak', 20000, 'soppeng', 'pending', ''),
(27, 7, 1, '2019-12-16', 170000, 'gemak', 20000, 'soppeng', 'pending', ''),
(28, 7, 1, '2019-12-16', 170000, 'gemak', 20000, 'soppeng', 'pending', ''),
(29, 7, 2, '2019-12-16', 595000, 'cirebon', 25000, 'soppeng', '', 'asdf45'),
(33, 7, 1, '2019-12-17', 80000, 'gemak', 20000, 'sd', 'pending', ''),
(34, 9, 1, '2019-12-17', 50000, 'gemak', 20000, 'timusu desa timusu kec liliriaja kab soppeng', 'sudah kirim pembayaran', ''),
(35, 9, 2, '2019-12-17', 55000, 'cirebon', 25000, 'lebbae\r\n', 'pending', ''),
(36, 9, 2, '2019-12-17', 55000, 'cirebon', 25000, 'erwr', 'sudah kirim pembayaran', ''),
(37, 9, 0, '2019-12-18', 30000, '', 0, '', 'pending', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE IF NOT EXISTS `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL,
  PRIMARY KEY (`id_pembelian_produk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 1, '', 0, 0, 0, 0),
(2, 1, 2, 1, '', 0, 0, 0, 0),
(3, 9, 7, 1, '', 0, 0, 0, 0),
(4, 10, 6, 2, '', 0, 0, 0, 0),
(5, 10, 7, 1, '', 0, 0, 0, 0),
(6, 11, 6, 2, '', 0, 0, 0, 0),
(7, 11, 7, 1, '', 0, 0, 0, 0),
(8, 12, 7, 1, '', 0, 0, 0, 0),
(9, 12, 8, 1, '', 0, 0, 0, 0),
(10, 13, 7, 1, 'mouse', 30000, 0, 249, 30000),
(11, 13, 8, 1, 'kertas a4', 30000, 0, 500, 30000),
(12, 14, 6, 1, 'tinta', 30000, 0, 500, 30000),
(13, 14, 9, 1, 'pulpen', 3000, 0, 150, 3000),
(14, 15, 7, 1, 'mouse', 30000, 0, 249, 30000),
(15, 15, 6, 1, 'tinta', 30000, 0, 500, 30000),
(16, 16, 8, 1, 'kertas a4', 30000, 500, 500, 30000),
(17, 16, 7, 1, 'mouse', 30000, 249, 249, 30000),
(18, 17, 6, 1, 'tinta', 30000, 500, 500, 30000),
(19, 17, 8, 1, 'kertas a4', 30000, 500, 500, 30000),
(20, 18, 6, 1, 'tinta', 30000, 500, 500, 30000),
(21, 18, 7, 1, 'mouse', 30000, 249, 249, 30000),
(22, 19, 6, 1, 'tinta', 30000, 500, 500, 30000),
(23, 19, 9, 1, 'pulpen', 3000, 150, 150, 3000),
(24, 20, 6, 5, 'tinta', 30000, 500, 2500, 150000),
(25, 21, 6, 1, 'tinta', 30000, 500, 500, 30000),
(26, 22, 6, 1, 'tinta', 30000, 500, 500, 30000),
(27, 23, 6, 1, 'tinta', 30000, 500, 500, 30000),
(28, 23, 7, 3, 'mouse', 30000, 249, 747, 90000),
(29, 24, 6, 1, 'tinta', 30000, 500, 500, 30000),
(30, 24, 7, 1, 'mouse', 30000, 249, 249, 30000),
(31, 25, 6, 1, 'tinta', 30000, 500, 500, 30000),
(32, 26, 8, 2, 'kertas a4', 30000, 500, 1000, 60000),
(33, 27, 8, 2, 'kertas a4', 30000, 500, 1000, 60000),
(34, 28, 8, 2, 'kertas a4', 30000, 500, 1000, 60000),
(35, 28, 7, 3, 'mouse', 30000, 249, 747, 90000),
(36, 29, 6, 10, 'tinta', 30000, 500, 5000, 300000),
(37, 29, 7, 5, 'mouse', 30000, 249, 1245, 150000),
(38, 29, 8, 4, 'kertas a4', 30000, 500, 2000, 120000),
(39, 30, 6, 7, 'tinta', 30000, 500, 3500, 210000),
(40, 30, 7, 7, 'mouse', 30000, 249, 1743, 210000),
(41, 31, 9, 7, 'pulpen', 3000, 150, 1050, 21000),
(42, 32, 6, 2, 'tinta', 30000, 500, 1000, 60000),
(43, 33, 7, 2, 'mouse', 30000, 249, 498, 60000),
(44, 34, 7, 1, 'mouse', 30000, 249, 249, 30000),
(45, 35, 8, 1, 'kertas a4', 30000, 500, 500, 30000),
(46, 36, 6, 1, 'tinta', 30000, 500, 500, 30000),
(47, 37, 6, 1, 'tinta', 30000, 500, 500, 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(6, 'tinta', 30000, 500, '25.jpg', 'tinta berat 500gram ', 13),
(7, 'mouse', 30000, 249, '27.jpeg', '				dgjj				', 26),
(8, 'kertas a4', 30000, 500, '31.jpg', '		buku berat 500gram 				', 29),
(9, 'pulpen', 3000, 150, '28.jpg', 'dgjj', 50),
(10, '', 7000, 250, '40.jpg', 'kertas foto isi 100		', 0),
(12, '', 3000, 250, '26.jpg', 'buku tulis isi 50 lembar	', 20),
(13, 'catridge warna', 200, 300, '27.jpg', 'catridge canon warna', 15);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

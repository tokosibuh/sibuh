<?php
session_start();

//untuk id produk dari url
$id_produk = $_GET['id'];

//jika sudah ada produk dikeranjang maka +1
if (isset($_SESSION['keranjang'][$id_produk]))
{
	$_SESSION['keranjang'][$id_produk]+=1;
}
//yang belum ada dkeranjang di beli 1
else
{
	$_SESSION['keranjang'][$id_produk] = 1;
	
}


//echo "<pre>";
//print_r($_SESSION);
//echo "</pre>";


//halamab keranjang
echo "<script>alert('produk telah masuk ke keranjang belanja');</script>";
echo "<script>location='keranjang.php';</script>";

?>
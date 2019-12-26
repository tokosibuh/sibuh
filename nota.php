<?php 
session_start();
include 'koneksi.php';?>
	
<!DOCTYPE html>
<html>
<head>
	<title>Checkout</title>
	<link rel ="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>
<?php include 'menu.php'; ?> 
<section class="konten">
	<div class="container">
	
		<!--- nota copas di admin detai.php--->
		
		<h2>Detail Pembelian</h2>
<?php
$ambil = $koneksi->query("select *from pembelian join pelanggan on pembelian.id_pelanggan=pelanggan.id_pelanggan where pembelian.id_pembelian='$_GET[id]'");
$detail = $ambil->fetch_assoc();
?>


	<!---jika pelanggan yang beli tidak sama dengan pelanggan yang login maka dilarikan keriwayat.php  karena dia tidak berhak melihat nota orang lain --->
	<!--- pelanggan yng beli harus pelanggan yang logi --->
	<?php 
		//mendapatkan id_pelanggan yang beli 
		$idpelangganyangbeli =$detail["id_pelanggan"];
		
		//mendapatkan id_pelanggan yng login 
		$idpelangganyanglogin = $_SESSION["pelanggan"]["id_pelanggan"];
		 if ($idpelangganyangbeli!==$idpelangganyanglogin)
		 {
			 echo "<script>alert('jangan nakal');</script>";
			  echo "<script>location='riwayat.php';</script>";
			  exit();
		 }
	?>


<div class="row">
	<div class="col-md-4">
		<h3>Pembelian</h3>
		<strong>No. Pembelian: <?php echo $detail['id_pembelian'] ?> </strong><br>
		Tanggal: <?php echo $detail['tanggal_pembelian']; ?><br>
		Total: Rp. <?php echo number_format ($detail['total_pembelian']) ?>
</div>	
<div class="row">
	<div class="col-md-4">
		<h3>Pelanggan</h3>
		<strong><?php echo $detail['nama_pelanggan']; ?> </strong> <br>
		<p>
				<?php echo $detail['telepon_pelanggan']; ?> <br>
				<?php echo $detail['email_pelanggan']; ?>
		</p>
	</div>
	<div class="col-md-4">
		<h3>Pengiriman</h3>
		<strong><?php echo $detail['nama_kota'] ?></strong><br>
		Ongkos kirim: Rp. <?php echo number_format($detail['tarif']); ?> <br>
		Alamat : <?php echo$detail['alamat_pengiriman'] ?>
	</div>
</div>	

<table class="table table-bordered">
	<thead>
		<tr>
			<th>no</th>
			<th>nama produk</th>
			<th>harga</th>
			<th>berat</th>
			<th>jumlah</th>
			<th>subberat</th>
			<th>subtotal</th>		
		</tr>
	</thead>
	<tbody>
	<?php $nomor=1; ?>
		<?php $ambil=$koneksi->query("select *from pembelian_produk where id_pembelian='$_GET[id];'") ?>
		<?php while ($pecah=$ambil->fetch_assoc()){ ?>
		<tr>
		
		<td><?php echo $nomor;?></td>
		<td><?php echo $pecah['nama']; ?></td>
		<td>Rp. <?php echo number_format ($pecah['harga']); ?></td>
		<td><?php echo $pecah['berat']; ?>Gr </td>
		<td><?php echo $pecah['jumlah']; ?></td>
		<td><?php echo $pecah['subberat'];?>Gr </td>
		<td>Rp. <?php echo number_format ($pecah['subharga']);?></td>
		</tr>
		<?php $nomor++; ?>
		<?php } ?>
	</tbody>
</table>


<div class="row">
	<div class="col-md-7">
	<div class="alert alert-info">
	<p>
	Silahkan Melakukan Pembayaran Rp. <?php echo number_format( $detail['total_pembelian']); ?>  ke <br>
	<strong>BANK BRI 511-97664-879-09 AN. SAHRUNI</strong>
	</p>
	</div>
		</div>
		</div>

		
	
	
	</div>
</section>

</body>
</html>
<?php
session_start();
include 'koneksi.php';

?>
	<!DOCTYPE html>
	<html>
	<head>
		<title> Login Pelanggan </title>
		<link rel ="stylesheet" href="admin/assets/css/bootstrap.css">
	</head>
	<body>
	
		<?php include 'menu.php'; ?> 
	
		
		<div class="container">
			<div class="row">
				<div class ="col-md-4">
				<div class ="panel panel-default">
				<div class ="panel-heading">
					<h3 class ="panel-title">login pelanggan </h3>
				</div>
					<div class="panel-body">
					<form method="post">
						<div class ="form-group">
							<label>Email</label>
							<input type="email" class="form-control" name="email">
							</div>
							<div class ="form-group">
							<label>Password</label>
							<input type="password" class="form-control" name="password">
							</div>
								<button class="btn btn-primary" name="login">Login</button>
								</form>
						</div>	
					</div>
				</div>
			</div>
		</div>
		
	<?php
	//jk ada tombol login(tombol simpan ditekan )
	if(isset($_POST["login"]))
	{
		$email =$_POST["email"];
		$password=$_POST["password"];
		
		//lakukan query ngecek akun di label pelanggan db 
		$ambil = $koneksi->query("select * from pelanggan 
		where email_pelanggan='$email' and password_pelanggan='$password'");
		 // ngitung akun yg terambil
		 $akunyangcocok = $ambil->num_rows;
		 //jika 1 akun yg cocok , maka diloginkan 
		 if($akunyangcocok==1)
		 {
			 //anda sudah login 
			 //mendapatkan akun dlm bntu array
			 $akun =$ambil->fetch_assoc();
			 //simpan  di session pelanggan
			 $_SESSION["pelanggan"]= $akun;
			 echo "<script>alert('anda sukses login');</script>";
			 
			 // jk sudah belanja
				if(isset($_SESSION["keranjang"]) OR !empty($_SESSION["keranjang"]))
				{
				echo "<script>location='checkout.php';</script>";
				}
		 else
			{
				echo "<script>location='riwayat.php';</script>";
			}
		 }
		 else
		 {
			//anda gagal login 
			echo "<script>alert('anda gagal login,periksa akun anda');</script>";
			echo "<script>location='login.php';</script>";
	}	
	}
	
	?>
	
	</body>
	</html>
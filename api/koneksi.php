<?php
$host = "db"; 
$user = "root";
$pass = "password_rahasia";
$db   = "db_inventaris";

$koneksi = mysqli_connect($host, $user, $pass, $db);

if (!$koneksi) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
?>
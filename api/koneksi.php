<?php
// File: api/koneksi.php
$host = "localhost"; 
$user = "root";
$pass = ""; // Kosongkan jika pakai XAMPP bawaan
$db   = "db_inventaris";

try {
    $koneksi = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $koneksi->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Koneksi gagal: " . $e->getMessage();
    die();
}
?>
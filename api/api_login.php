<?php
// File: api/api_login.php
header("Content-Type: application/json");
require 'koneksi.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(["status" => "gagal", "pesan" => "Data tidak valid"]);
    exit;
}

$username = $data['username'] ?? '';
$password = $data['password'] ?? '';

// Cek data pengguna di tabel 'users'
$stmt = $koneksi->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
// Bind parameter terlebih dahulu secara terpisah, lalu jalankan execute tanpa argumen:
$stmt->bind_param("s", $username);
$stmt->execute(); // <-- BENAR, kosong tanpa argumen
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user) {
    echo json_encode([
        "status" => "sukses",
        "role" => $user['role'],
        "username" => $user['username']
    ]);
} else {
    echo json_encode([
        "status" => "gagal",
        "pesan" => "Username atau password salah!"
    ]);
}
?>
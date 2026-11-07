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

// Cek data pengguna di tabel 'users' menggunakan prepared statement mysqli yang benar
$stmt = $koneksi->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
$stmt->bind_param("ss", $username, $password);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

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
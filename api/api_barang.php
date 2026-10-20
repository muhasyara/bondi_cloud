<?php
// File: api/api_barang.php
header("Content-Type: application/json");
require 'koneksi.php';

$method = $_SERVER['REQUEST_METHOD'];

// 1. TAMPIL DATA (GET)
if ($method === 'GET') {
    $stmt = $koneksi->prepare("SELECT * FROM tas ORDER BY id DESC");
    $stmt->execute();
    $hasil = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($hasil);
}

// 2. TAMBAH DATA (POST)
elseif ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    
    $merk = $data['merk'];
    $tipe = $data['tipe'];
    $harga = $data['harga'];
    $stok = $data['stok'];

    $stmt = $koneksi->prepare("INSERT INTO tas (merk, tipe, harga, stok) VALUES (?, ?, ?, ?)");
    if ($stmt->execute([$merk, $tipe, $harga, $stok])) {
        echo json_encode(["status" => "sukses", "pesan" => "Data berhasil ditambahkan"]);
    } else {
        echo json_encode(["status" => "gagal", "pesan" => "Gagal menambah data"]);
    }
}

// 3. EDIT DATA (PUT)
elseif ($method === 'PUT') {
    // Menangkap ID dari URL (?id=...)
    $id = $_GET['id'] ?? null;
    $data = json_decode(file_get_contents("php://input"), true);
    
    if ($id && $data) {
        $merk = $data['merk'];
        $tipe = $data['tipe'];
        $harga = $data['harga'];
        $stok = $data['stok'];

        $stmt = $koneksi->prepare("UPDATE tas SET merk = ?, tipe = ?, harga = ?, stok = ? WHERE id = ?");
        if ($stmt->execute([$merk, $tipe, $harga, $stok, $id])) {
            echo json_encode(["status" => "sukses", "pesan" => "Data berhasil diupdate"]);
        } else {
            echo json_encode(["status" => "gagal", "pesan" => "Gagal mengupdate data"]);
        }
    }
}

// 4. HAPUS DATA (DELETE)
elseif ($method === 'DELETE') {
    // Menangkap ID dari URL (?id=...)
    $id = $_GET['id'] ?? null;
    
    if ($id) {
        $stmt = $koneksi->prepare("DELETE FROM tas WHERE id = ?");
        if ($stmt->execute([$id])) {
            echo json_encode(["status" => "sukses", "pesan" => "Data berhasil dihapus"]);
        } else {
            echo json_encode(["status" => "gagal", "pesan" => "Gagal menghapus data"]);
        }
    }
}
?>
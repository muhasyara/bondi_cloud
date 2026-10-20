// 1. PENGECEKAN LOGIN

const sessionRole = sessionStorage.getItem('role');

const sessionUsername = sessionStorage.getItem('username');



if (!sessionRole) {

    window.location.href = 'login.html'; // Usir ke halaman login jika belum masuk

}



// Tampilkan nama user di pojok kanan atas

document.getElementById('namaUser').textContent = sessionUsername;

// document.getElementById('roleUser').textContent = `(${sessionRole.toUpperCase()})`;



// Batasi akses jika yang login adalah karyawan

if (sessionRole === 'karyawan') {

    document.getElementById('panelForm').style.display = 'none'; // Sembunyikan form

    document.getElementById('btnCetak').style.display = 'none'; // Sembunyikan tombol cetak

    document.querySelector('.container').style.gridTemplateColumns = '1fr';

}



// 2. FUNGSI LOGOUT

function logout() {

    sessionStorage.clear();

    window.location.href = 'login.html';

}



// 3. LOGIKA CRUD SEPERTI BIASA

const apiUrl = 'api/api_barang.php';



async function muatData() {

    try {

        const response = await fetch(apiUrl);

        const dataTas = await response.json();

        const tbody = document.getElementById('tabelBody');

        tbody.innerHTML = '';



        dataTas.forEach(tas => {

            // Cek apakah tombol hapus boleh dirender

            const btnHapus = sessionRole === 'admin' ? `<button class="btn-delete" onclick="hapusTas(${tas.id})">Hapus</button>` : '';



            const row = `<tr>

                        <td>${tas.id}</td>

                        <td>${tas.merk}</td>

                        <td>${tas.tipe}</td>

                        <td>Rp ${tas.harga.toLocaleString('id-ID')}</td>

                        <td>${tas.stok}</td>

                        <td class="aksi-kolom">

                            <button class="btn-edit" onclick="siapkanEdit(${tas.id}, '${tas.merk}', '${tas.tipe}', ${tas.harga}, ${tas.stok})">Edit</button>

                            ${btnHapus}

                        </td>

                    </tr>`;

            tbody.innerHTML += row;

        });

    } catch (error) {

        console.error('Gagal mengambil data:', error);

    }

}



function siapkanEdit(id, merk, tipe, harga, stok) {

    // Khusus karyawan, pastikan formnya muncul sejenak saat tombol edit ditekan

    document.getElementById('panelForm').style.display = 'block';



    if (sessionRole === 'karyawan') {

        document.querySelector('.container').style.gridTemplateColumns = '340px 1fr';

    }



    document.getElementById('tasId').value = id;

    document.getElementById('merk').value = merk;

    document.getElementById('tipe').value = tipe;

    document.getElementById('harga').value = harga;

    document.getElementById('stok').value = stok;

    document.querySelector('#formTas button[type="submit"]').textContent = 'Update Data';

}



document.getElementById('formTas').addEventListener('submit', async function (e) {

    e.preventDefault();

    const id = document.getElementById('tasId').value;

    const dataTas = {

        merk: document.getElementById('merk').value,

        tipe: document.getElementById('tipe').value,

        harga: parseFloat(document.getElementById('harga').value),

        stok: parseInt(document.getElementById('stok').value)

    };



    try {

        if (id) {

            // Update data (PUT)

            await fetch(`${apiUrl}?id=${id}`, {

                method: 'PUT',

                headers: {

                    'Content-Type': 'application/json',

                    'X-Username': sessionUsername // <-- Mengirim nama staf

                },

                body: JSON.stringify(dataTas)

            });

        } else {

            // Simpan data baru (POST)

            await fetch(apiUrl, {

                method: 'POST',

                headers: {

                    'Content-Type': 'application/json',

                    'X-Username': sessionUsername // <-- Mengirim nama staf

                },

                body: JSON.stringify(dataTas)

            });

        }



        this.reset();

        document.getElementById('tasId').value = '';

        document.querySelector('#formTas button[type="submit"]').textContent = 'Simpan Data';



        // Jika role karyawan, sembunyikan form lagi setelah selesai edit

        if (sessionRole === 'karyawan') {

            document.getElementById('panelForm').style.display = 'none';



            document.querySelector('.container').style.gridTemplateColumns = '1fr';

        }



        muatData();

    } catch (error) {

        console.error('Gagal memproses data:', error);

    }

});



async function hapusTas(id) {

    if (confirm('Yakin ingin menghapus tas ini?')) {

        try {

            await fetch(`${apiUrl}?id=${id}`, {

                method: 'DELETE',

                headers: {

                    'X-Username': sessionUsername // <-- Mengirim nama staf

                }

            });

        } catch (error) {

            console.error('Gagal menghapus data:', error);

        }

    }

}

muatData();



// 4. FITUR PENCARIAN (LIVE SEARCH)

document.getElementById('inputPencarian').addEventListener('keyup', function () {

    let keyword = this.value.toLowerCase();

    let barisTabel = document.querySelectorAll('#tabelBody tr');



    barisTabel.forEach(baris => {

        let merk = baris.cells[1].textContent.toLowerCase();

        let tipe = baris.cells[2].textContent.toLowerCase();



        if (merk.includes(keyword) || tipe.includes(keyword)) {

            baris.style.display = '';

        } else {

            baris.style.display = 'none';

        }

    });

});



// 5. FUNGSI CETAK DENGAN TANGGAL OTOMATIS

function cetakLaporan() {

    // Ambil waktu saat ini

    const sekarang = new Date();



    // Format waktu (Contoh: Kamis, 18 Juni 2026, 22:58)

    const opsiWaktu = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };

    const stringWaktu = sekarang.toLocaleDateString('id-ID', opsiWaktu);



    // Masukkan ke dalam HTML lalu jalankan fitur cetak

    document.getElementById('waktuCetak').textContent = "Dicetak pada: " + stringWaktu;

    window.print();

}

// 6. FITUR RIWAYAT (LOG)

async function muatLog() {

    try {

        const response = await fetch('api/api_logs.php');

        const dataLog = await response.json();

        const tbodyLog = document.getElementById('tabelLog');

        tbodyLog.innerHTML = '';



        dataLog.forEach(log => {

            // Merapikan format waktu dari Java (YYYY-MM-DDTHH:mm:ss) menjadi format lokal

            const waktu = new Date(log.waktu).toLocaleString('id-ID');



            const row = `<tr>

                        <td>${waktu}</td>

                        <td><b>${log.username.toUpperCase()}</b></td>

                        <td style="text-align: left;">${log.aksi}</td>

                    </tr>`;

            tbodyLog.innerHTML += row;

        });

    } catch (error) {

        console.error('Gagal mengambil data log:', error);

    }

}



// Tampilkan panel log HANYA jika yang login adalah admin

if (sessionRole === 'admin') {

    document.getElementById('panelLog').style.display = 'block';

    muatLog(); // Panggil data log saat halaman dimuat

}


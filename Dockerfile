# Menggunakan cetakan server LAMP (Linux, Apache, MySQL, PHP) siap pakai
FROM mattrayner/lamp:latest-1804

# Menghapus file bawaan Apache
RUN rm -fr /app/*

# Memasukkan seluruh kodingan BONDI (HTML, CSS, JS, PHP) ke dalam folder server web di Docker
COPY . /app/

# Memberikan hak akses agar server bisa membaca file
RUN chmod -R 755 /app

# Mengekspos port 80 agar bisa diakses lewat browser (internet)
EXPOSE 80

# Menjalankan script bawaan untuk menghidupkan Apache dan MySQL secara bersamaan
CMD ["/run.sh"]
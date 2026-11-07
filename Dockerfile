FROM php:8.0-apache

# Menginstal ekstensi MySQL untuk PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Mengaktifkan mode rewrite Apache (berguna jika aplikasimu menggunakan URL bersih)
RUN a2enmod rewrite

# Menyalin file kode ke dalam folder yang dibaca oleh Apache
COPY . /var/www/html/

# Memberikan hak akses agar Apache bisa membaca file
RUN chown -R www-data:www-data /var/www/html/
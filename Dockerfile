FROM php:8.0-apache

# Menginstal ekstensi MySQLi yang dibutuhkan kodemu
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

# Mengaktifkan mode rewrite Apache
RUN a2enmod rewrite

# Menyalin file kode
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
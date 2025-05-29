# Menggunakan image resmi PHP dengan Apache
FROM php:8.2-apache

# Mengaktifkan mod_rewrite Apache
RUN a2enmod rewrite

# Menyalin file aplikasi ke direktori root Apache
COPY . /var/www/html/

# Mengatur hak akses
RUN chown -R www-data:www-data /var/www/html

# Mengekspos port 80
EXPOSE 80

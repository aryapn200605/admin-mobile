FROM php:8.1

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN composer install

EXPOSE 8000

CMD php artisan serve

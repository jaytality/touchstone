FROM php:7.4-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libyaml-dev \
        libzip-dev \
        libyaml-doc \
    && docker-php-ext-install -j$(nproc) iconv mysqli pdo_mysql \
    && docker-php-ext-configure gd  --with-freetype --with-jpeg \
    && pecl install yaml \
    && docker-php-ext-enable yaml \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) zip

RUN a2enmod rewrite headers

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini /usr/local/etc/php/conf.d/php.ini

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN touch /var/www/error.log /var/www/access.log
RUN chown www-data:www-data /var/www/error.log /var/www/access.log

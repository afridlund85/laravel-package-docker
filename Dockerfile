FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libmemcached-dev \
  zlib1g-dev \
  mysql-client \
  openssl \
  git \
  zip \
  unzip \
  --no-install-recommends \
  && pecl install memcached \
  && docker-php-ext-enable memcached \
  && docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install \
    -j$(nproc) iconv \
    gd \
    zip \
    pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./default.conf /etc/apache2/sites-available/default.conf

RUN a2enmod rewrite \
  && a2ensite default \
  && sed -ri 's/^www-data:x:33:33:/www-data:x:1000:1000:/' /etc/passwd

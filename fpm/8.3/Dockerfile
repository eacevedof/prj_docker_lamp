FROM php:8.3-fpm

# Update package list and install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libicu-dev \
       zlib1g-dev \
       libpng-dev \
       libzip-dev \
       unzip \
       git \
       curl \
    && docker-php-ext-install intl pdo pdo_mysql gd zip mysqli \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable opcache

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Set environment variables for Composer
ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer

# Install Composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm /tmp/composer-setup.php

# Verify Composer installation
RUN composer --version

# Copy Xdebug configuration
COPY ./xdebug.ini /usr/local/etc/php/conf.d

# Configure .bashrc
RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc
RUN sed -i 's/\r$//' /root/.bashrc
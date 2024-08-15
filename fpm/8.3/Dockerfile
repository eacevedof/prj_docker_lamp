FROM php:8.3-fpm

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    && apt-get install -y libicu-dev zlib1g-dev libpng-dev libzip-dev \
    && docker-php-ext-install intl pdo pdo_mysql gd zip mysqli

RUN docker-php-ext-install opcache && docker-php-ext-enable opcache

RUN pecl install xdebug \
    && docker-php-ext-enable --ini-name xdebug.ini xdebug

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl

# silent, show errors
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

# Step 3: Run the installer
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
# Step 5: Clean up
RUN rm /tmp/composer-setup.php
# Verify Composer installation
RUN composer --version

COPY ./xdebug.ini /usr/local/etc/php/conf.d

RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc
RUN sed -i 's/\r$//' /root/.bashrc



FROM php:7.4.33-fpm

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates cron procps moreutils bsdmainutils build-essential git

RUN apt-get install -y --no-install-recommends \
    libicu-dev zlib1g-dev libpng-dev libzip-dev \
    && docker-php-ext-install intl pdo pdo_mysql gd zip mysqli

RUN pecl install xdebug-2.9.8 \
    && docker-php-ext-enable xdebug

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm /tmp/composer-setup.php

COPY ./xdebug-7.4.ini /usr/local/etc/php/conf.d
COPY ./php-7.4.ini /usr/local/etc/php/conf.d

RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc

FROM php:7.4.33-fpm

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    && apt-get install -y libicu-dev zlib1g-dev libpng-dev libzip-dev \
    && docker-php-ext-install intl pdo pdo_mysql gd zip mysqli

RUN pecl install xdebug-2.9.8 \
    && docker-php-ext-enable xdebug

COPY ./xdebug-7.4.ini /usr/local/etc/php/conf.d

RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc
RUN sed -i 's/\r$//' /root/.bashrc
# https://hub.docker.com/_/php/tags?page=2&page_size=&name=apache&ordering=
FROM php:8.3.9-apache
#FROM php:7.4-apache-buster #aqui no va xdebug

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    && apt-get install -y libicu-dev zlib1g-dev libpng-dev libzip-dev \
    && docker-php-ext-install intl pdo pdo_mysql gd zip mysqli \
    && pecl install xdebug \
    && docker-php-ext-enable --ini-name opcache-xdebug.ini opcache xdebug

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

COPY ini/xdebug.ini /usr/local/etc/php/conf.d
COPY .bashrc /root/.bashrc
RUN sed -i 's/\r$//' /root/.bashrc

# Copy virtual host files
COPY vhosts/*.conf /etc/apache2/sites-available
# Enable the virtual hosts
RUN for site in /etc/apache2/sites-available/*.conf; do \
    a2ensite $(basename $site); \
done

RUN a2enmod rewrite

# Restart Apache to apply changes (Docker will do this at container start)
CMD ["apache2-foreground"]
FROM php:5-apache
RUN apt-get update && apt-get install -y \
      libcurl4-gnutls-dev \ 
      curl \
      libpng12-dev \
      php-pear \
      drush \
      mysql-client \
      php-apc && \
      rm -rf /var/lib/apt/lists/* 
RUN docker-php-ext-install pdo pdo_mysql gd curl
RUN usermod -u 1000 www-data
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

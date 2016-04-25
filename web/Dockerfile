FROM php:7-apache
RUN apt-get update && apt-get install -y \
      curl \
      php5-mysql \
      php5-sqlite \
      php5-gd \
      php5-curl \
      php5-memcached \
      php-pear \
      drush \
      mysql-client \
      php-apc && \
      rm -rf /var/lib/apt/lists/*
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

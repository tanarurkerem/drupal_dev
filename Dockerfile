FROM ubuntu:14.04
MAINTAINER Istvan Palócz <istvan@palocz.hu>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
      apt-get -yq install \
      curl \
      apache2 \
      libapache2-mod-php5 \
      php5-mysql \
      php5-sqlite \
      php5-gd \
      php5-curl \
      php-pear \
      drush \
      mysql-client \
      php-apc && \
      rm -rf /var/lib/apt/lists/*
RUN usermod -u 1000 www-data

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]

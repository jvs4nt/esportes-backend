FROM php:8.1.17-apache

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
# Tools
    apt-utils \
    wget \
    git \
    nano \
    iputils-ping \
    imagemagick \
    graphicsmagick \
    ghostscript \
# Configure PHP
    libxml2-dev libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev 
    
RUN docker-php-ext-install pdo_mysql 
    
   

USER root


# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/

RUN docker-php-ext-install pdo_mysql

COPY . /var/www/html/


#RUN cd /var/www/html/project && composer install

# Start httpd
EXPOSE 80
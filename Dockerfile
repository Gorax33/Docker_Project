FROM php:5-apache

COPY www/ /var/www/html/

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN chmod -R 777 /var/www/html/uploads
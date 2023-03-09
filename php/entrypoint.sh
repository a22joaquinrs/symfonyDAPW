#!/bin/bash

/usr/sbin/php-fpm8.2

composer install
composer update

symfony serve --dir /app/symfony
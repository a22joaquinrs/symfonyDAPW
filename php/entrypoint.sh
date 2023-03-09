#!/bin/bash

/usr/sbin/php-fpm8.2

composer update
composer install

symfony serve --dir /app/symfony
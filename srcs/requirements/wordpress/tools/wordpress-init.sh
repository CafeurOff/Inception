#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

if [ ! -f /var/www/html/wp-config.php ]; then

	echo "Starting wordpress setup"

	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	cd /var/www/html
	wp core download --allow-root
	mv /var/www/wp-config.php /var/www/html/

	sed -i "s/XXX_WORDPRESS_DB_NAME_XXX/$WORDPRESS_DB_NAME/g" /var/www/html/wp-config.php
	sed -i "s/XXX_WORDPRESS_DB_USER_XXX/$WORDPRESS_DB_USER/g" /var/www/html/wp-config.php
	sed -i "s/XXX_WORDPRESS_DB_HOST_XXX/$WORDPRESS_DB_HOST/g" /var/www/html/wp-config.php
	sed -i "s/XXX_WORDPRESS_DB_PASS_XXX/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wp-config.php

	echo "Creating wordpress users..."

	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASSWORD}

	echo "Wordpress is set up"

fi

exec "$@"
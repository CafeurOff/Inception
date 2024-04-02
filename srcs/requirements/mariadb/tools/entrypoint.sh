#!/bin/bash

service mysql start
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" && \
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_WP_DATABASE}; GRANT ALL PRIVILEGES ON ${DB_WP_DATABASE}.* TO '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PASSWORD}'; FLUSH PRIVILEGES;"

sleep 1
service mysql stop

exec "$@"
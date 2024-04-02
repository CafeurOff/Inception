FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 php-mysqli php-fpm wget sendmail

COPY tools/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/wp-config.php /var/www/
COPY tools/wordpress-init.sh /var/www/

RUN chmod +x /var/www/wordpress-init.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/wordpress-init.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
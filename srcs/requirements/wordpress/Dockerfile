FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.3 php-fpm php-mysql
RUN apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tool/script.sh ./script.sh



RUN mkdir -p /run/php
EXPOSE 9000


ENTRYPOINT [ "bash", "./script.sh" ]

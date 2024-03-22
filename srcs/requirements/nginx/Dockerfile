FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out etc/nginx/ssl/newserv.crt -keyout etc/nginx/ssl/newserv.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=kyacini.42.fr/UID=kyacini"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

FROM dockerhub.ir/wordpress:php8.1-fpm AS wordpress

COPY --chown=www-data:www-data ["./html/", "/var/www/html/"]

FROM dockerhub.ir/nginx:1.21.6 AS webserver

WORKDIR "/var/www/html/"

RUN chown -R www-data:www-data /var/www/html/

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY --chown=www-data:www-data ["./html/", "/var/www/html/"]

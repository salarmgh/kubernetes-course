FROM php:8.1-fpm as app

WORKDIR /app
COPY ["index.php", "/app"]

FROM nginx:1.21.6 as webserver

WORKDIR /app

COPY --from=app ["/app", "/app"]
COPY ["./default.conf", "/etc/nginx/conf.d/default.conf"]

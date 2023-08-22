FROM trafex/php-nginx:3.2.0
COPY src /var/www/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
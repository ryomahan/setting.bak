FROM alpine:3.9
EXPOSE 9000/tcp

RUN apk add --no-cache php7 php7-fpm \
	php7-pdo php7-gd php7-pgsql php7-pdo_pgsql php7-mbstring \
	php7-intl php7-xml php7-curl php7-session \
	php7-dom php7-fileinfo php7-json \
	php7-pcntl php7-posix php7-zip \
	git postgresql-client sudo

ADD startup.sh /
ADD updater.sh /
ADD index.php /

RUN sed -i.bak 's/^listen = 127.0.0.1:9000/listen = 9000/' /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/www

CMD /startup.sh

#!/bin/sh -ex

while ! pg_isready -h $DB_HOST -U $DB_USER; do
	echo waiting until $DB_HOST is ready...
	sleep 3
done

if ! id app; then
	addgroup -g $OWNER_GID app
	adduser -D -h /var/www/html -G app -u $OWNER_UID app
fi

DST_DIR=/var/www/html/tt-rss
SRC_REPO=https://git.tt-rss.org/fox/tt-rss.git

[ -e $DST_DIR ] && rm -f $DST_DIR/.app_is_ready

export PGPASSWORD=$DB_PASS 

[ ! -e /var/www/html/index.php ] && cp /index.php /var/www/html

PSQL="psql -q -h $DB_HOST -U $DB_USER $DB_NAME"

if [ ! -d $DST_DIR ]; then
	mkdir -p $DST_DIR
	git clone $SRC_REPO $DST_DIR
else
	cd $DST_DIR && \
		git config core.filemode false && \
		git pull origin master
fi

if [ ! -d $DST_DIR/plugins.local/nginx_xaccel ]; then
	git clone https://git.tt-rss.org/fox/ttrss-nginx-xaccel.git $DST_DIR/plugins.local/nginx_xaccel
else
	cd $DST_DIR/plugins.local/nginx_xaccel && \
		git config core.filemode false && \
	  	git pull origin master
fi

chown -R $OWNER_UID:$OWNER_GID $DST_DIR \
	/var/log/php7

for d in cache lock feed-icons; do
	chmod -R 777 $DST_DIR/$d
done

$PSQL -c "create extension if not exists pg_trgm"

RESTORE_SCHEMA=/var/www/html/tt-rss/backups/restore-schema.sql.gz

if [ -r $RESTORE_SCHEMA ]; then
	zcat $RESTORE_SCHEMA | $PSQL
elif ! $PSQL -c 'select * from ttrss_version'; then
	$PSQL < /var/www/html/tt-rss/schema/ttrss_schema_pgsql.sql
fi

SELF_URL_PATH=$(echo $SELF_URL_PATH | sed -e 's/[\/&]/\\&/g')

if [ ! -s $DST_DIR/config.php ]; then
	sed \
		-e "s/define('DB_HOST'.*/define('DB_HOST', '$DB_HOST');/" \
		-e "s/define('DB_USER'.*/define('DB_USER', '$DB_USER');/" \
		-e "s/define('DB_NAME'.*/define('DB_NAME', '$DB_NAME');/" \
		-e "s/define('DB_PASS'.*/define('DB_PASS', '$DB_PASS');/" \
		-e "s/define('PLUGINS'.*/define('PLUGINS', 'auth_internal, note, nginx_xaccel');/" \
		-e "s/define('SELF_URL_PATH'.*/define('SELF_URL_PATH','$SELF_URL_PATH');/" \
		< $DST_DIR/config.php-dist > $DST_DIR/config.php

	cat >> $DST_DIR/config.php << EOF
		define('NGINX_XACCEL_PREFIX', '/tt-rss');
EOF
else
	sed \
		-e "s/define('SELF_URL_PATH'.*/define('SELF_URL_PATH','$SELF_URL_PATH');/" \
		-i.bak $DST_DIR/config.php
fi

touch $DST_DIR/.app_is_ready

sudo -u app /usr/sbin/php-fpm7 -F


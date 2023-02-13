#!/bin/sh

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html

if [ ! -d "/var/www/html/discord" ]; then	
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	mkdir -p /var/www/html/discord
	mv /tmp/web/* /var/www/html/discord

	wp core download --allow-root --path=/var/www/html

	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

	sed -i "s/database_name_here/$DATA_NAME/g" /var/www/html/wp-config.php
	sed -i "s/username_here/$USER_NAME/g" /var/www/html/wp-config.php
	sed -i "s/password_here/$USER_PASSWORD/g" /var/www/html/wp-config.php
	sed -i "s/localhost/$DATA_HOST/g" /var/www/html/wp-config.php

	wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email  --path=/var/www/html		
	wp user create --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author  --path=/var/www/html 

	# REDIS
	wp config set WP_REDIS_HOST 'redis' --allow-root --path=/var/www/html  > /dev/null 2>&1
	wp config set WP_REDIS_PORT '6379' --allow-root --path=/var/www/html  > /dev/null 2>&1
	wp config set WP_CACHE 'true' --allow-root --path=/var/www/html  > /dev/null 2>&1

fi

# install redi-cache plugin
wp plugin install redis-cache --allow-root --path=/var/www/html 

# activate the plugin of redis-cache
wp plugin activate redis-cache --allow-root --path=/var/www/html 

# enable the plugin of redis-cache 
wp redis enable --allow-root --path=/var/www/html 

/usr/sbin/php-fpm7.3 -F -R
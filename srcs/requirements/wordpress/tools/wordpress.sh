#!/bin/sh
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/html
wp core download --allow-root --path=/var/www/html


echo "==> database_name_here/$DATA_NAME/"
echo "==> username_here/$USER_NAME/"
echo "==> password_here/$USER_PASSWORD/"
echo "==> localhost/$DATA_HOST/"
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/$DATA_NAME/g" /var/www/html/wp-config.php
sed -i "s/username_here/$USER_NAME/g" /var/www/html/wp-config.php
sed -i "s/password_here/$USER_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/localhost/$DATA_HOST/g" /var/www/html/wp-config.php

chown -R www-data:www-data /var/www/html/
# installing WordPress requires parameters : URL, Title, Admin Username, Password, and Admin Email.
# https://developer.wordpress.org/cli/commands/core/install/
wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email  --path=/var/www/html

wp user create --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author  --path=/var/www/html/

/usr/sbin/php-fpm7.3 -F -R
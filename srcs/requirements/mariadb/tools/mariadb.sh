#!/bin/sh

service mysql start

echo "CREATE USER IF NOT EXISTS $USER_NAME@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO $USER_NAME@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE $DATA_NAME;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root -p$ROOT_PASSWORD

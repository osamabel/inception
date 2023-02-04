#!/bin/sh

# if [ ! -d "/var/lib/mysql/$DATA_NAME" ]; then
service mysql start
	# mysql -e "CREATE DATABASE IF NOT EXISTS $DATA_NAME;"
	# mysql -e "CREATE USER IF NOT EXISTS $USER_NAME@'%' IDENTIFIED BY '$USER_PASSWORD';" 
	# mysql -e "GRANT ALL PRIVILEGES ON $DATA_NAME.* TO $USER_NAME@'%';" 
	# mysql -e "FLUSH PRIVILEGES;" 
	# mysql -u root -e "ALTER USER 'root'@localhost IDENTIFIED BY '$ROOT_PASSWORD';" 
# fi
# tail -f /dev/null
# mysql < /tmp/dataBase.sql

echo "CREATE USER IF NOT EXISTS $USER_NAME@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO $USER_NAME@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "-----------\033[0;32mMARIA CREATE DATABASE------------------\033[0m"

echo "CREATE DATABASE $DATA_NAME;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "-----------\033[0;32mMARIA UPDATE ROOT PASSWORD USER------------------\033[0m"

echo "ALTER USER 'root'@localhost IDENTIFIED BY '$ROOT_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
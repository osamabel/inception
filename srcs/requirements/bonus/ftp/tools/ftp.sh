#!/bin/bash

# https://web.mit.edu/rhel-doc/4/RH-DOCS/rhel-rg-en-4/s1-ftp-vsftpd-conf.html
# https://adamtheautomator.com/vsftpd/
# https://linux.die.net/man/5/vsftpd.conf
# https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04

if [ ! -f "/etc/vsftpd.conf.origine" ]; then
	cp /etc/vsftpd.conf /etc/vsftpd.conf.origine
	mv /tmp/vsftpd.conf /etc/vsftpd.conf
	mkdir -p /var/run/vsftpd/empty
	chmod 711 /var/run/vsftpd/empty
	adduser $FTP_USER_NAME --disabled-password &> /dev/null
	echo "$FTP_USER_NAME:$FTP_USER_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
	echo "$FTP_USER_NAME" | tee -a /etc/vsftpd.userlist &> /dev/null
	mkdir -p /home/$FTP_USER_NAME/ftp
	chown nobody:nogroup /home/$FTP_USER_NAME/ftp
	chmod a-w /home/$FTP_USER_NAME/ftp         			# remove write permition for every one
	mkdir -p /home/$FTP_USER_NAME/ftp/files
	chown $FTP_USER_NAME:$FTP_USER_NAME /home/$FTP_USER_NAME/ftp/files
	chmod 777 /home/$FTP_USER_NAME/ftp/files
	echo "local_root=/home/$FTP_USER_NAME/ftp" | tee -a /etc/vsftpd.conf &> /dev/null
fi

echo -e "\e[32mFTP started on :21\e[0m"
vsftpd /etc/vsftpd.conf
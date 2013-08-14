#!/usr/bin/env bash

# check if it's the authorized user; which is the local user.
if [ $(id -u) != 0 ]; then
	echo -e "Run it as root! Or you could, also, use: su -c '<command>'";
	exit 1;
fi

#Install epel
rpm -Uvh http://fedora.mirrors.pair.com/epel/6/x86_64/epel-release-6-8.noarch.rpm

#Install Mysqld
yum install mysql-devel mysql-server -y

#Install Bacula
yum install bacula-storage-mysql bacula-docs -y --enable-repo=epel-release
yum install bacula-director-mysql bacula-console -y
yum install bacula-client bacula-traymonitor -y

#Start MySQL
service mysqld start

#Auto Start MySQL
chkconfig mysqld on

#Change de password
# mysqladmin -u root password 'new-password'

#Re-Create databases (Now run the scripts)
# /usr/libexec/bacula/grant_mysql_privileges -u root -p
# /usr/libexec/bacula/create_mysql_database -u root -p
# /usr/libexec/bacula/make_mysql_tables -u root -p
# /usr/libexec/bacula/grant_bacula_privileges -u root -p


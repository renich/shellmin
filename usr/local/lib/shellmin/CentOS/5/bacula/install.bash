#!/usr/bin/env bash

# check if it's the authorized user; which is the local user.
if [ $(id -u) != 0 ]; then
	echo -e "Run it as root! Or you could, also, use: su -c '<command>'";
	exit 1;
fi

#Install Dependency
yum install -y mysql-devel mysql-server mysql ncurse* gcc gcc-c++ autoconf automake

#Download Bacula
cd /tmp/
wget http://sourceforge.net/projects/bacula/files/latest/download?source=files
tar zxvf bacula-*
cd bacula-*

#Compile Bacula
CFLAGS="-g -Wall" ./configure --enable-smartalloc --with-mysql --enable-conio
make
make install
make install-autostart

#Create databases
cd /etc/bacula
./grant_mysql_privileges -p
./create_mysql_database -p
./make_mysql_tables -p

#AutoStart Bacula
/etc/init.d/bacula-dir start
/etc/init.d/bacula-sd start
chkconfig bacula-dir on
chkconfig bacula-sd on



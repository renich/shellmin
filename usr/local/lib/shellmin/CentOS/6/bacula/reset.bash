#!/usr/bin/env bash

# check if it's the authorized user; which is the local user.
if [ $(id -u) != 0 ]; then
	echo -e "Run it as root! Or you could, also, use: su -c '<command>'";
	exit 1;
fi

# stop bacula
echo "Stopping bacula...";
echo
systemctl stop bacula-dir.service bacula-fd.service bacula-sd.service;

# reset DB
echo "Reseting DB...";
echo
/usr/libexec/bacula/drop_mysql_database;
/usr/libexec/bacula/create_mysql_database;
/usr/libexec/bacula/make_mysql_tables;

# remove state and bsr files
echo "Removing state and bsr files...";
echo
rm -f /var/spool/bacula/*.{bsr,state};

# remove backup volumes
echo "Removing volume files...";
echo
rm -f /var/backup/bacula/*;

# restart bacula
echo "Restarting bacula...";
echo
systemctl start bacula-sd.service bacula-fd.service bacula-dir.service;

exit 0

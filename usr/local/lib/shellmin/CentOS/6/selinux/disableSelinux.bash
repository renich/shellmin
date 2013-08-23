#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#Disable SELINUX
if [ ! -f "/etc/selinux/config" ]; then
       echo "Error: /etc/selinux/config No exist."
       exit 1
else
       if [ -f /bin/sed ] ; then
				salidagrep=`cat /etc/selinux/config | grep -E "^SELINUX"`
				if [ "x" != "x$salidagrep" ] ; then
					sed -i 's@SELINUX=.*@SELINUX=disabled@' /etc/selinux/config
				else
					echo "SELINUX=disabled" >> /etc/selinux/config
				fi
	   fi
       grep -E "^SELINUX" /etc/selinux/config
fi

exit 0
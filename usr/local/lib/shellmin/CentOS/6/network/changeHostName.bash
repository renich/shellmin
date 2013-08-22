#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#Change hostname
sed -i "s@HOSTNAME=.*@HOSTNAME=${@}@g" /etc/sysconfig/network

exit 0
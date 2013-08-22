#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#do
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm -O /tmp/epel-release-6-8.noarch.rpm
sudo rpm -Uvh /tmp/epel-release-6-8.noarch.rpm

exit 0
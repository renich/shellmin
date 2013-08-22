#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#do
echo -e "$(sed -e 's@^nameserver.*$@@g' /etc/resolv.conf)\nnameserver 8.8.8.8\nnameserver 4.4.4.4" > /etc/resolv.conf

exit 0
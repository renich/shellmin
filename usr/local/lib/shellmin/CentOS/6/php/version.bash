#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#do
php -v |head -1 | awk {'print $2'} | cut -d "." -f 1-2

exit 0
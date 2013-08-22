#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

# Disable Anon FTP
replace "NoAnonymous no" "NoAnonymous yes" -- /etc/pure-ftpd.conf

exit 0
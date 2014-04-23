#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

# do
augtool set /files/etc/ssh/sshd_config/PermitRootLogin without-password

exit 0

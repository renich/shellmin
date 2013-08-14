#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

# do
sed -i 's@^[#]\{0,\}PermitRootLogin yes@PermitRootLogin without-password@g' /etc/ssh/sshd_config

exit 0

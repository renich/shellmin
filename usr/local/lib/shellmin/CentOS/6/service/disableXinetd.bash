#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

# Disable xinetd
echo -n "Disabling all xinetd services except cpimap.. "
cd /etc/xinetd.d
for i in *
do
       [ "$i" != "cpimap" ] && sed -i 's/^[ \t]*disable.*/disable = yes/' /etc/xinetd.d/$i
done

exit 0
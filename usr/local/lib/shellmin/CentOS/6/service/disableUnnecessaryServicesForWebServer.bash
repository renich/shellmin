#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#Disable unnecessary services.
for SERVICE in cups cups-config-daemon xfs netfs irda isdn nfslock rhnsd anacron tux atd bluetooth rpcidmapd rpcsvcgssd rpcgssd canna iiim
do
       service "$SERVICE" stop > /dev/null 2>&1
       chkconfig "$SERVICE" off > /dev/null 2>&1
done

exit 0
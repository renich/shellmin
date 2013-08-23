#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

# do

#Check valid port
if [[ ! ${@} =~ ^-?[0-9]+$ ]] || [[ ! ${@} -le 61000 ]]
then
	echo "The port number is incorrect!"
	exit 1;
fi

#Change port
echo "Change port to ${@}"
sed -i "s@^[#]\{0,\}Port [[:digit:]]\{1,\}@Port ${@}@g" /etc/ssh/sshd_config

exit 0
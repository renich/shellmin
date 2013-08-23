#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#do
if [[ ! $(grep 'HISTTIMEFORMAT' /root/.bashrc) ]]; then
    echo 'export HISTTIMEFORMAT="[%h/%d/%Y - %H:%M:%S]"' >> /root/.bashrc
fi
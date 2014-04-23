#!/usr/bin/env bash

function check_if_ran_by_root
{
    # check if executed by root
    if [[ "$(id -u)" != "0" ]]; then
        echo "This script must be ran as root";
        exit 1;
    fi
}

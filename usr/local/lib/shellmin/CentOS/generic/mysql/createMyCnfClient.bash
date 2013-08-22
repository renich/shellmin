#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

sHelp=$(cat << NEOF 

#Example
    shellmin mysql createMyCnfClient {user} {password}
    shellmin mysql createMyCnfClient root passwordtest
NEOF
)

# check for .my.cnf
if [[ -f ~/.my.cnf ]]; then
    echo "The ~/.my.cnf file already exists.";
    exit 1;
fi

#do
cat << NEOF > ~/.my.cnf
[client]
    user=${1}
    password=${2}
NEOF

exit 0
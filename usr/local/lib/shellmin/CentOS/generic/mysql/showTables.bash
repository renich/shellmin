#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

sHelp=$(cat << NEOF 

#Example
    shellmin mysql showTables {database}
    shellmin mysql showTables information_schema
NEOF
)

# check for .my.cnf
if [[ ! -f ~/.my.cnf ]]; then
    echo "The .my.cnf file has not been set. Please, read enclosed documentation to clarify.";
    exit 1;
fi

#do
mysql --defaults-extra-file=~/.my.cnf -B -N -e "use ${1};show tables;"

exit 0
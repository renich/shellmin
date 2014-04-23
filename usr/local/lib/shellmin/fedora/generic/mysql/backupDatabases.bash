#!/usr/bin/env bash
# original src: http://wiki.bacula.org/doku.php?id=mysql

# check if executed by root
check_if_ran_by_root;

# check for .my.cnf
if [[ ! -f /root/.my.cnf ]]; then
    echo "The .my.cnf file has not been set. Please, read enclosed documentation to clarify.";
    exit 1;
fi

# check script dependencies
if $( which mysqldump &> /dev/null ); then
    echo "Missing dependency: mysqldump";
    exit 1;
elif $( which xz &> /dev/null ); then
    echo "Missing dependency: xz";
fi

# define location
BACKUPLOCATION='/var/backup/mysql';
DATE=$( date +%Y%m%d )

# create dir
if [[ ! -d "${BACKUPLOCATION}" ]]; then
    # create
    mkdir -p -m 1700 "${BACKUPLOCATION}";
fi

# Process all DBs
mysql --defaults-extra-file=/root/.my.cnf -B -N -e "show databases" | while read db; do
    BACKUPFILE="${BACKUPLOCATION}/${DATE}-${db}.mysql.xz";
    
    echo "Backing up $db into $BACKUPFILE; compressed by xz"
    mysqldump $db | xz -zec > $BACKUPFILE;
done

exit 0;

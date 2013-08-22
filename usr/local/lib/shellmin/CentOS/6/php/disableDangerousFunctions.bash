#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#Detect php.ini
if [ -f "/usr/local/lib/php.ini" ]; then
	filePhpConf="/usr/local/lib/php.ini"
fi
if [ -f "/usr/local/php4/lib/php.ini" ]; then
	filePhpConf="/usr/local/php4/lib/php.ini"
fi
if [ -f "/etc/php.ini" ]; then
	filePhpConf="/etc/php.ini"
fi

#do
if [ -f "${filePhpConf}" ]; then
    sed -i 's@^disable_functions =.*$@disable_functions = dl, exec, shell_exec, system, passthru, popen, pclose, proc_open, proc_nice, proc_terminate, proc_get_status, proc_close, pfsockopen, leak, apache_child_terminate, posix_kill, posix_mkfifo, posix_setpgid, posix_setsid, posix_setuid@' ${filePhpConf}
else
	echo "php.ini file not found"
	exit 1
fi

exit 0
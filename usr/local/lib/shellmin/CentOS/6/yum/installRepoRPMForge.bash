#!/usr/bin/env bash

# check if executed by root
if [[ "$(id -u)" != "0" ]]; then
    echo "This script must be run as root";
    exit 1;
fi

#Detect 64bits or 32bits
if [ $(uname -m) == "x86_64" ]
then
    ## RHEL/CentOS 6 64 Bit OS ##
    wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm -O /tmp/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
    rpm -Uvh /tmp/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
else
    ## RHEL/CentOS 6 32 Bit OS ##
    wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm -O /tmp/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
    rpm -Uvh /tmp/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
fi

wget http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt -O /tmp/RPMFORGE-GPG-KEY.dag.txt
rpm --import /tmp/RPMFORGE-GPG-KEY.dag.txt

exit 0
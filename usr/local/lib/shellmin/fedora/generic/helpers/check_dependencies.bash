#!/usr/bin/env bash

function check_dependencies
{
	if ( rpm --quiet -q "${@}" ); then
		echo 'You have some dependencies missing';
		return 1;
	fi
}

function install_dependencies
{
	yum -y install $@;
	return
}

#!/usr/bin/env bash

export SHELLMIN_ROOTDIR=$( readlink -m "$( dirname "${BASH_SOURCE}" )/../../../.." );
export SHELLMIN_CONFDIR="${SHELLMIN_ROOTDIR}/usr/local/etc/shellmin";
export SHELLMIN_LIBDIR="${SHELLMIN_ROOTDIR}/usr/local/lib/shellmin";
export SHELLMIN_DOCDIR="${SHELLMIN_ROOTDIR}/usr/local/share/doc/shellmin";


# get OS and releave version
if [[ -f /etc/fedora-release ]]; then
    export SHELLMIN_OS='fedora';
    export SHELLMIN_OS_VERSION=$( rpm -q fedora-release --qf "%{version}" );
elif [[ -f /etc/centos-release ]]; then
    export SHELLMIN_OS='CentOS';
    export SHELLMIN_OS_VERSION=$( rpm -q centos-release --qf "%{version}" );
else
    echo 'This OS is not supported by shellmin. Feel free to extend it! ;)';
    exit 1;
fi

SHELLMIN_CONTROLLERSDIR+=(
    "${SHELLMIN_LIBDIR}/core"
    "${SHELLMIN_LIBDIR}/${SHELLMIN_OS}/${SHELLMIN_OS_VERSION}"
    "${SHELLMIN_LIBDIR}/${SHELLMIN_OS}/generic"
);

SHELLMIN_HELPERSDIR=(
	"${SHELLMIN_LIBDIR}/helpers"
	"${SHELLMIN_LIBDIR}/${SHELLMIN_OS}/generic/helpers"
	"${SHELLMIN_LIBDIR}/${SHELLMIN_OS}/${SHELLMIN_OS_VERSION}/helpers"
)

export SHELLMIN_CONTROLLERSDIR;
export SHELLMIN_HELPERSDIR;

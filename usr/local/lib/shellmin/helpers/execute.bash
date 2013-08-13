#!/usr/bin/env bash

function help
{
    cat << EOF

NAME
    shellmin: A bash shell-based server administrator.

SYNOPSIS
    "${0}" <controller> <action> [param1 param2...]

DESCRIPTION
    This program helps you administer a server; providing scripts for almost any task.

AUTHOR
    Renich Bon Ciric <renich@woralelandia.com>
EOF
}

function execute
{
    if (( $# < 2 )); then
        echo 'You need to provide, at least, a controller and an action.';
        help;
        exit 1;
    fi
    
    # parse
    for c in ${SHELLMIN_CONTROLLERS}; do
        if [[ "${1,,}" == "$( basename "${c}" )" ]]; then
            SHELLMIN_CONTROLLER="${c}";
            controller="${c}";
            shift;
            break;
        fi
    done
    
    export SHELLMIN_CONTROLLER;
    
    if [[ -z $controller ]]; then
        echo 'This controller does not exist: ' "${1,,}"
        echo 'Try the list command';
        exit 1;
    fi

    for a in $( find "${controller}" -mindepth 1 -maxdepth 1 -type f -executable ); do
        SHELLMIN_CONTROLLER_ACTIONS+="${a} "
        an=$( basename ${a%%.*} );
        if [[ "${1}" == "${an}" ]]; then
            action="$( basename ${a} )";
            shift;
            break;
        fi
    done
    
    export SHELLMIN_CONTROLLER_ACTIONS;
    
    if [[ -z $action ]]; then
        echo 'This action does not exist: ' "${1,,}"
        echo 'Try the list command';
        exit 1;
    fi

    params="${@}";
    
    source "${controller}/${action}" ${params};
    echo
}

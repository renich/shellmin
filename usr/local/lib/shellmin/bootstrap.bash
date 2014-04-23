#!/usr/bin/env bash

source $( readlink -m "$( dirname "${BASH_SOURCE}" )" )/env.bash

# get helpers
for path in "${SHELLMIN_HELPERSDIR[@]}"; do
    for helper in $( find -P "${path}" -mindepth 1 -maxdepth 1 -type f ); do
		source "${helper}"
	done
done

# get controllers
for path in "${SHELLMIN_CONTROLLERSDIR[@]}"; do
    for controller in $( find -P "${path}" -mindepth 1 -maxdepth 1 -type d -not -iname 'helpers' ); do
        SHELLMIN_CONTROLLERS+="${controller} ";
    done
done

export SHELLMIN_CONTROLLERS;
export SHELLMIN_HELPERS;

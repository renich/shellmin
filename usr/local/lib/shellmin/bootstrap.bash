#!/usr/bin/env bash

# get helpers
for helper in $( find -P "${SHELLMIN_HELPERSDIR}" -mindepth 1 -maxdepth 1 -type f ); do
    source "${helper}"
done

# get controllers
for path in "${SHELLMIN_CONTROLLERSDIR[@]}"; do
    for controller in $( find -P "${path}" -mindepth 1 -maxdepth 1 -type d ); do
        SHELLMIN_CONTROLLERS+="${controller} ";
    done
done

export SHELLMIN_CONTROLLERS;

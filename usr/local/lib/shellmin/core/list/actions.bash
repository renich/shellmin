#!/usr/bin/env bash

if [[ -z "${1}" ]]; then
    echo 'list actions expects, at least, a parameter.';
    exit 1;
fi

for c in ${SHELLMIN_CONTROLLERS}; do
    if [[ "${1,,}" == "$( basename "${c}" )" ]]; then
        controller="${c}";
        shift;
        break;
    fi
done

if [[ -z $controller ]]; then
    echo 'This controller does not exist: ' "${1,,}"
    echo 'Try the list command';
    exit 1;
fi

for a in $( find "${controller}" -mindepth 1 -maxdepth 1 -type f -executable ); do
    an=$( basename ${a%%.*} );
    echo "${an}";
done

exit 0;

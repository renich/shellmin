#!/usr/bin/env bash

for c in ${SHELLMIN_CONTROLLERS}; do
    echo $( basename "${c}" );
done

exit 0;

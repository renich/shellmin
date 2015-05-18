#!/usr/bin/env bash

source $( readlink -m "$( dirname "${BASH_SOURCE}" )/usr/local/lib/shellmin/env.bash" );
source ${SHELLMIN_LIBDIR}/bootstrap.bash

check_if_ran_by_root

# Warning
cat << 'EOF'

###############################################################################
#                           WARNING! WARNING! WARNINNG!                       #
###############################################################################

You are about to install shellmin! Are you 100% shure you want to do this?
If your answer is not: 

'yes, I am 100% sure I want to do this... really... pinky promise'

installation won't happen...

EOF

echo -n 'Answer: '
read answer

if [[ "${answer}" != 'yes, I am 100% sure I want to do this... really... pinky promise' ]]; then
	echo
	echo 'Installation aborted... phew!'
	exit 1
else
	echo
	echo "Ok, you've been warned!"
fi


# Installation
echo 'installing...'
GIT_WORK_TREE='/' git checkout -f

echo 'cleaning up...'
rm -fr /.git* /INSTALL.md /LICENSE /README.md /installme.bash /TODO.md

echo 'fixing permissions...'
find /usr/local/{etc,lib,share/doc}/shellmin -type d -exec chmod 500 {} \; -exec chown root:root {} \;
find /usr/local/{etc,share/doc}/shellmin -type f -exec chmod 400 {} \; -exec chown root:root {} \;
find /usr/local/{sbin,lib}/shellmin -type f -exec chmod 700 {} \; -exec chown root:root {} \;

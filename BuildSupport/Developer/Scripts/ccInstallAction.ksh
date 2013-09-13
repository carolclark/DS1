#!/bin/ksh

# ccInstallAction.ksh
# Support
#
#  Created by Carol Clark on 1/23/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# ccInstallAction -- call ccInstall on behalf of external targets
#  	$SRCROOT targetFolder
'

. ccInstall

if [[ ! -n "${1}" ]] ; then
	print "missing $SRCROOT parameter"
	exit 1
fi

if [[ ! -n "${2}" ]] ; then
	print "missing targetFolder parameter"
	exit 1
fi

print "ccInstall ${1} ${2} ${3}"
msg=$(ccInstall "${1}" "${2}" "${3}")
st="${?}"
print "${msg}"
exit "${st}"

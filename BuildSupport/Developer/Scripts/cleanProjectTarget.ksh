#!/bin/ksh

#  cleanProjectTarget.ksh
#  Support
#
#  Created by Carol Clark on 11/11/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# cleanProjectTarget.ksh -- trigger files in specified target for reinstallation
#	cleanProjectTarget project target
'

#^ 1 === top
trap 'echo "$(basename $0)#$LINENO: Command exited with status $?." 1>&2' ERR

RC_MissingArgument=11

if [[ ! -n "${1}" ]] || [[ ! -n "${2}" ]] ; then
	print "USAGE: cleanProjectTarget project target"
	return $RC_MissingArgument
fi

project="${1}"
target="${2}"

ccInstall "${DEV}/${project}" "${target}" -c
	
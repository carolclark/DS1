#!/bin/ksh

# ccInstallAction.ksh
# Support
#
#  Created by Carol Clark on 1/23/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# ccInstallAction -- call ccInstall on behalf of external targets
'

#^ 1 === top

. ccInstall

# for target ${DEV}/Support/BuildSupport/Developer:
#	old params: workspacePath ${DEV}/Support; projectTarget BuildSupport/Developer
#	new params: sourceRoot $SRCROOT; targetFolder Developer

if [[ ! -n "${1}" ]] ; then
	print "missing sourceRoot parameter"
	exit 1
fi
sourceRoot="${1}"

if [[ ! -n "${2}" ]] ; then
	print "missing targetFolder parameter"
	exit 1
fi
targetFolder="${2}"

actionFlags="-it"
if [[ "${3}" = "clean" ]] ; then
	actionFlags="-c"
fi

print "ccInstall ${sourceRoot} ${targetFolder} ${actionFlags}"
msg=$(ccInstall "${sourceRoot}" "${targetFolder}" "${actionFlags}")
st="${?}"
print "${msg}"
exit "${st}"

# previous
if [[ ! -n "${1}" ]] ; then
	print "missing SRCROOT parameter"
	exit 1
fi
srcroot="${1}"

if [[ ! -n "${2}" ]] ; then
	print "missing target parameter"
	exit 1
fi
targetPath="${2}"

actionFlags="-it"
if [[ "${3}" = "clean" ]] ; then
	actionFlags="-c"
fi

projectName="${srcroot##*/}"
workspacePath="${srcroot%/*}"
projectTarget="${projectName}/${targetPath}"

print "ccInstall ${workspacePath} ${projectTarget} ${actionFlags}"
msg=$(ccInstall "${workspacePath}" "${projectTarget}" "${actionFlags}")
st="${?}"
print "${msg}"
exit "${st}"

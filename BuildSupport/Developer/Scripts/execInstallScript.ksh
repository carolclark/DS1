#!/bin/ksh

#  execInstallScript
#  Support
#
#  Created by Carol Clark on 10/11/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='
# execInstallScript -- dispatch code for <Target>_install scripts
'
USAGE='
include at end of <Target>_install scripts
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. resultCodes

#pragma mark 0 === Top
#pragma mark 8 === execInstallScript
if [[ "${1}" = -* ]] ; then
	command="${1}"
	shift
fi
sourceRoot="${1}"
shift
targetFolder="${1}"
shift
if [[ $# > 0 ]] ; then
	actionFlags="${1}"
	shift
fi
if [[ -n "${command}" ]] ; then
	case "${command}" in
		"--getSubtargetDestination" )
			msg=$(getSubtargetDestination "${sourceRoot}" "${targetFolder}" "${actionFlags}" "${1}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--prepareFileOperation" )
			msg=$(prepareFileOperation "${sourceRoot}" "${targetFolder}" "${actionFlags}" "${1}" "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--cleanTarget" )
			msg=$(cleanTarget)
			es=$?
			print "${msg}"
			return "${es}"
			;;
		* )
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid commandFlag ${command}"
			exit $?
			;;
	esac
fi
if [[ -n "${sourceRoot}" ]] && [[ -n "${targetFolder}" ]] ; then
	msg=$(ccInstall "${sourceRoot}" "${targetFolder}" "${actionFlags}")
	es=$?
	print "${msg}"
	return "${es}"
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: $0 [--commandFlag] sourceRoot targetFolder (-actionFlags | 'clean') [...]"
	return
fi

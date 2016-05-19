#!/bin/ksh

#  execInstallScript
#  Support
#
#  Created by Carol Clark on 10/11/13.
#  Copyright (c) 2013-16 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='
# execInstallScript -- dispatch code for <Target>_install scripts
'
USAGE='
include at end of <Target>_install scripts
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

#pragma mark 0 === Top
CCDev="${HOME}/Library/CCDev"
. ${CCDev}/bin/resultCodes

#pragma mark 8 === execInstallScript

#WRITE_INFO="yes"	# if "yes", writes extra information and exits

missingArgumentMessage="USAGE: $0 [--commandFlag] sourceRoot targetFolder (-actionFlags | 'clean') [...]"

if [[ $# > 0 ]] ; then
	if [[ "${1}" = -* ]] ; then
		command="${1}"
		shift
	fi
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	exit $RC_MissingArgument
fi
if [[ $# > 1 ]] ; then
	sourceRoot="${1}"
	shift
	targetFolder="${1}"
	shift
	if [[ $# > 0 ]] ; then
		actionFlags="${1}"
		shift
	fi
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	exit $RC_MissingArgument
fi
if [[ ${WRITE_INFO} = "yes" ]] ; then
	print "sourceRoot: ${sourceRoot}"
	print "targetFolder: ${targetFolder}"
	print "actionFlags: ${actionFlags}"
	print "$0#$LINENO: WRITE_INFO mode; exiting now"
	exit 1
fi
if [[ -n "${command}" ]] ; then
	case "${command}" in
		"--getSubtargetDestination" )
			msg=$(getSubtargetDestination "${1}")
			es=$?
			print "${msg}"
			exit "${es}"
			;;
		"--prepareFileOperation" )
			msg=$(prepareFileOperation "${1}" "${2}" "${3}")
			es=$?
			print "${msg}"
			exit "${es}"
			;;
		"--cleanTarget" )
			msg=$(cleanTarget)
			es=$?
			print "${msg}"
			exit "${es}"
			;;
		* )
			st=$?
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid commandFlag ${command}"
			exit ${st}
			;;
	esac
fi
if [[ -z "${sourceRoot}" ]] || [[ -z "${targetFolder}" ]] ; then	# if either parameter is null
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	exit $RC_MissingArgument
fi
logger "$0#$LINENO: args: $* #callargs"
msg=$(ccInstall "${0}" "$(pwd)" "${targetFolder}" "${actionFlags}")
es=$?
if [[ ${es} -ne 0 ]] ; then
	print "FAILED: $msg"
	exit "${es}"
fi
print "Success"
print "${msg}"

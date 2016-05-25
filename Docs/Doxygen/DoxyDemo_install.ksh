#!/bin/ksh

#  DoxyDemo_install.ksh
#  Support
#
#  Created by Carol Clark on 5/6/14.
#  Copyright (c) 2014-16 C & C Software, Inc. All rights reserved.

USAGE='
DoxyDemo_install.ksh -- demonstration Doxygen project
'

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ 1 === top
command=""
sourceRoot="$(pwd)"
targetFolder="DoxyDemo"
actionFlags=""

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination ${subtarget}"
		return $RC_MissingArgument
	fi
#	print "subtarget: ${1}"
	destinationFolder=""
	case "${subtarget}" in
		"DoxyDemo" )
			destinationFolder="${CCDev}/Sites/candcsoft_host/public_html/Doxygen/DoxyDemo"
			;;
		* )
			;;		# all other files skipped now; processed later by Doxygen
	esac
	print "${destinationFolder}"
	return 0
}

#^ 5 === prepareFileOperation
function prepareFileOperation {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		subtarget="${1}"
		filepath="${2}"
		destinationFolder="${3}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --prepareFileOperation subtarget filepath destinationFolder"
		return $RC_MissingArgument
	fi

	if [[ -n "${destinationFolder}" ]] ; then
		srcname="${filepath}"
		destname="${srcname%.ksh}"
		action="copy"
		sourceForCopy="${sourceRoot}/${targetFolder}/${subtarget}/${filepath}"
		destinationForCopy="${destinationFolder}/${destname}"
	else
		action="ignore"
	fi

	fl="${CCDev}/tmp/copyInfo"
	mkdir -p "${CCDev}/tmp"
	print "${action}\n${sourceForCopy}\n${destinationForCopy}" > "${fl}"
	print "${fl}"
	return 0
}

#^ 7 === cleanTarget
function cleanTarget {
	print "no CCDev clean action for Doxygen target"
	return 0
}

#^ 8 === main
missingArgumentMessage="USAGE: $0 [--commandFlag] sourceRoot targetFolder (-actionFlags | 'clean') [...]"

logger "$0#$LINENO: args: $@ #callargs"
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
logger "$0#$LINENO: args: $@ #callargs"
msg=$(ccInstall "${0}" "$(pwd)" "${targetFolder}" "${actionFlags}")
es=$?
if [[ ${es} -ne 0 ]] ; then
	print "FAILED: $msg"
	exit "${es}"
fi
print "Success"
print "${msg}"

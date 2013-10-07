#!/bin/ksh

#  BBEdit_install.ksh
#  Support
#
#  Created by Carol Clark on 6/28/12.
#  Copyright 2012-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
BBEdit_install.ksh -- provide functions for ccInstall to support CCDev installation
#	--getSubtargetDestination subtarget
#		output destination location for files of subtarget
#	--prepareFileOperation sourceRoot targetFolder actionFlags subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanFiles
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

. "${CCDev}/bin/ccInstall"

#^ 1 === top
command=""
sourceRoot=""
targetFolder=""
actionFlags=""

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		print "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination subtarget"
		return $RC_MissingArgument
	fi
	destinationFolder=""
	case "${subtarget}" in
		"AppleScripts" )
			destinationFolder="${HOME}/Library/Application Support/BBEdit/Scripts"
			;;
		"_plist" )
			;;	# used by Xcode build system
		* )
			print "source folder ${sourceRoot}/${targetFolder}/${subtarget} not handled"
			return $RC_InputNotHandled
			;;
	esac
	print "${destinationFolder}"
	return 0
}

#^ 5 === prepareFileOperation
function prepareFileOperation {
	if [[ -n "${4}" ]] && [[ -n "${5}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
		actionFlags="${3}"
		subtarget="${4}"
		filepath="${5}"
		destinationFolder="${6}"
	else
		print "USAGE: ${targetFolder}_install.ksh --prepareFileOperation sourceRoot targetFolder actionFlags subtarget filepath destinationFolder"
		return $RC_MissingArgument
	fi

	if [[ "${subtarget}" = "AppleScripts" ]] ; then
		fname="${filepath%.applescript}.scpt"
		action="copy"
		sourceForCopy="${CCDev}/build/Support/BuildSupport/Applications/BBEdit/BBEditScripts.bundle/Contents/Resources/${fname}"
		destinationForCopy="${destinationFolder}/${fname}"
	elif [[ -n "${destinationFolder}" ]] ; then
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
	for folder in "${HOME}/Library/Application Support/BBEdit/Scripts" ; do
		msg=$(ccInstall --removeFolder "${folder}")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			print "error: ${msg}"
			return ${st}
		fi
	done
	return 0
}

#^ 8 === main

if [[ "${1}" = -* ]] ; then
	command="${1}"
	shift
fi
if [[ "${command}" != "--getSubtargetDestination" ]] && [[ "${command}" != "--cleanTarget" ]] ; then
	sourceRoot="${1}"
	shift
	targetFolder="${1}"
	shift
	if [[ $# > 0 ]] ; then
		actionFlags="${1}"
		shift
	fi
fi
if [[ -n "${command}" ]] ; then
	case "${command}" in
		"--getSubtargetDestination" )
			msg=$(getSubtargetDestination "${1}")
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
	errorMessage $RC_InvalidInput "$0#$LINENO:" "USAGE: $0 [--commandFlag] sourceRoot targetFolder [-actionFlags | 'clean']"
	return
fi

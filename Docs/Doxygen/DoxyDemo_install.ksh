#!/bin/ksh

#  Doxygen_install.ksh
#  Support
#
#  Created by Carol Clark on 5/6/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
DoxyDemo_install.ksh -- demonstration Doxygen project
#	--getSubtargetDestination subtarget
#		output destination location for files of subtarget
#	--prepareFileOperation subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanTarget
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
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
. "${CCDev}/bin/execInstallScript"

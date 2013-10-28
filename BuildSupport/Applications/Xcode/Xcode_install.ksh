#!/bin/ksh

#  Xcode_install.ksh
#  Support
#
#  Created by Carol Clark on 11/29/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
Xcode_install.ksh -- provide functions for ccInstall to support CCDev installation
#	--getSubtargetDestination sourceRoot targetFolder actionFlags subtarget
#		output destination location for files of subtarget
#	--prepareFileOperation sourceRoot targetFolder actionFlags subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanTarget sourceRoot targetFolder actionFlags
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

CCDev="${HOME}/Library/CCDev"
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination sourceRoot targetFolder actionFlags subtarget"
		return
	fi
	destinationFolder=""
	case "${subtarget}" in
		"AppleScripts" )
			destinationFolder="${HOME}/Library/Scripts/Xcode"
			;;
		"Templates" )
			destinationFolder="${HOME}/Library/Developer/Xcode/Templates"
			;;
		"Workflows" )
			;&	#obsolete
		"_plist" )
			;&	#used by Xcode build process
		"_Tests" )
			;;	#handled elsewhere
		* )
			errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${subtarget} not handled"
			return
			;;
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --prepareFileOperation sourceRoot targetFolder actionFlags subtarget filepath destinationFolder"
		return
	fi

	if [[ "${subtarget}" = "AppleScripts" ]] ; then
		fname="${filepath%.applescript}.scpt"
		action="copy"
		sourceForCopy="${CCDev}/build/Support/BuildSupport/Applications/Xcode/XcodeScripts.bundle/Contents/Resources/${fname}"
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
	for folder in "${HOME}/Library/Scripts/Xcode" "${HOME}/Library/Developer/Xcode/Templates" "${CCDev}/build/Support/BuildSupport/Applications/Xcode" ; do
		msg=$(ccInstall --removeFolder "${folder}")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			return
		fi
	done
	return 0
}

#^ 8 === main

. "${CCDev}/bin/execInstallScript"

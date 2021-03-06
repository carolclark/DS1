#!/bin/ksh
#  Cdoc_install.ksh
#  DevSupport
#
#  Created by Carol Clark on 1/15/13.
#  Copyright (c) 2013-16 C & C Software, Inc. All rights reserved.

USAGE='
Cdoc_install.ksh -- provide functions for ccInstall to support CCDev installation
#	--getSubtargetDestination subtarget
#		output destination location for files of subtarget
#	--prepareFileOperation subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanTarget
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

HOME="/Users/carolclark"
CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ 1 === top
command=""
sourceRoot=""
targetFolder=""
actionFlags=""

technicalDocs="/Users/carolclark/Library/CCDev/Sites/candcsoft_host/public_html/TechnicalDocs"

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination subtarget"
		return $RC_MissingArgument
	fi
	destinationFolder=""
	case "${subtarget}" in
		"html" )
			destinationFolder="${technicalDocs}/DevSupport"
			;;
		"_tech" )
			destinationFolder="${technicalDocs}"
			;;
		"Cdoc_install.ksh" )
			;&	# this script
		"plist" )
			;;	# used by Xcode build system
		* )
			errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${subtarget} not handled"
			return $RC_InputNotHandled
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --prepareFileOperation subtarget filepath destinationFolder"
		return $RC_MissingArgument
	fi

	if [[ -n "${destinationFolder}" ]] ; then
		srcname="${filepath}"
		destname="${srcname%.ksh}"
		if [[ "${srcname%.html}" = "${srcname}" ]] ; then
			action="copy"
		else
			action="translateCdoc"
		fi
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
	for folder in "${technicalDocs}/DevSupport" "${technicalDocs}/img" "${technicalDocs}/css"; do
		msg=$(ccInstall --removeFolder "${folder}")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			return ${st}
		fi
	done
	return 0
}

#^ 8 === main

. "${CCDev}/bin/execInstallScript"

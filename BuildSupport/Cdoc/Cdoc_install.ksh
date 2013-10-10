#!/bin/ksh

#  Cdoc_install.ksh
#  Support
#
#  Created by Carol Clark on 1/15/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
Cdoc_install.ksh -- provide functions for ccInstall to support CCDev installation
#	--getSubtargetDestination sourceRoot targetFolder actionFlags subtarget
#		output destination location for files of subtarget
#	--prepareFileOperation sourceRoot targetFolder actionFlags subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanTarget sourceRoot targetFolder actionFlags
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

. "${CCDev}/bin/ccInstall"

#^ 1 === top

sourceRoot="${DEV}/Support/BuildSupport"
targetFolder="Cdoc"

technicalDocs="${CCDev}/Sites/TechnicalDocs"

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${4}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
		actionFlags="${3}"
		subtarget="${4}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination sourceRoot targetFolder actionFlags subtarget"
		return
	fi
	destinationFolder=""
	case "${subtarget}" in
		"html" )
			destinationFolder="${technicalDocs}/Support"
			;;
		"_tech" )
			destinationFolder="${technicalDocs}"
			;;
		"Cdoc_install.ksh" )
			;&	# this script
		"plist" )
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
	for folder in "${technicalDocs}/Support" "${technicalDocs}/img" "${technicalDocs}/css"; do
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

if [[ $# = 0 ]] ; then
	print "$0: missing commandFlag"
	return $RC_MissingArgument
fi
case "${1}" in
	"--getSubtargetDestination" )
		msg=$(getSubtargetDestination "${2}" "${3}" "${4}" "${5}")
		es=$?
		print "${msg}"
		return "${es}"
		;;
	"--prepareFileOperation" )
		msg=$(prepareFileOperation "${2}" "${3}" "${4}" "${5}" "${6}" "${7}")
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
		print "invalid subcommand $1"
		return $RC_InvalidArgument
		;;
esac
return 0

#!/bin/ksh

#  BBEdit_install
#  Support
#
#  Created by Carol Clark on 6/28/12.
#  Copyright 2012 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
BBEdit_install.ksh -- provide functions for ccInstall to support CCDev installation
#	--getSubtargetDestination subtarget
#		output destination location for files of subtarget
#	--handleFile subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanFiles
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

. "${CCDev}/bin/resultCodes.ksh"

#^ 1 === top
trapString='errtrap $0#$LINENO'
trap "$trapString" ERR

projectPath="${DEV}/Support"
target="BBEdit"

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		print "USAGE: ${target}_install.ksh --getSubtargetDestination subtarget"
		return $RC_MissingArgument
	fi
	destinationFolder=""
	case "${subtarget}" in
		"AppleScripts" )
			destinationFolder="${HOME}/Library/Application Support/BBEdit/Scripts"
			;;
	* )
			print "source folder ${projectPath}/${target}/${subtarget} not handled"
			return $RC_InputNotHandled
			;;
	esac
	print "${destinationFolder}"
	return 0
}

#^ 5 === handleFile
function handleFile {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		subtarget="${1}"
		filepath="${2}"
		destinationFolder="${3}"
	else
		print "USAGE: ${target}_install.ksh --handleFile subtarget filepath destinationFolder"
		return $RC_MissingArgument
	fi

	if [[ "${subtarget}" = "AppleScripts" ]] ; then
		fname="${filepath%.applescript}.scpt"
		action="copy"

		sourceForCopy="${BUILT_PRODUCTS_DIR}/BBEdit.bundle/Contents/Resources/${fname}"
		destinationForCopy="${destinationFolder}/${fname}"
	elif [[ -n "${destinationFolder}" ]] ; then
		srcname="${filepath}"
		destname="${srcname%.ksh}"
		action="copy"

		sourceForCopy="${projectPath}/${target}/${subtarget}/${filepath}"
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
	return 0
}

#^ 8 === main

if [[ $# = 0 ]] ; then
	print "$0: missing commandFlag"
	return $RC_MissingArgument
fi
case "${1}" in
	"--getSubtargetDestination" )
		msg=$(getSubtargetDestination "${2}")
		es=$?
		print "${msg}"
		return "${es}"
		;;
	"--handleFile" )
		msg=$(handleFile "${2}" "${3}" "${4}")
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
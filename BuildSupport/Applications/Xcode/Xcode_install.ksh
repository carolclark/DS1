#!/bin/ksh

#  Xcode_install.ksh
#  Support
#
#  Created by Carol Clark on 11/29/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
Xcode_install.ksh -- provide functions for ccInstall to support CCDev installation
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
target="BuildSupport/Applications/Xcode"

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
		sourceForCopy="${CCDev}/build/Support/BuildSupport/Applications/Xcode/XcodeScripts.bundle/Contents/Resources/${fname}"
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

function removeFolder {
	if [[ -n "${1}" ]] ; then
		folder="${1}"
	else
		print "error: USAGE: ccInstall --get<Path> pathToProject target"
		return $RC_MissingArgument
	fi
	if [[ -d ${folder} ]]; then
		iofile="${CCDev}/tmp/found3"
		origdir=$(pwd)
		print "= ${folder}"
		cd "${folder}"
		st=${?}
		if [[ ${st} > 0 ]] ; then
			print "error: could set directory to ${folder} because it does not exist or is not a directory"
			cd "${origdir}"
			return ${st}
		fi
		find . -path -prune -or -type f | sed 's|\./||' > "${iofile}"
		chmod a+r "${iofile}"

		while read fl ; do
			print -n "${fl}: "
			rm "${fl}"
			st=$?
			if [[ ${st} > 0 ]] ; then
				print "error: could not remove"
				cd "${origdir}"
				return ${st}
			fi
			print "removed"
		done < "${iofile}"
		
		find . -path -prune -or -type d | sed 's|\./||' | tail -r > "${iofile}"
		chmod a+r "${iofile}"

		while read fl ; do
			if ! [[ ${fl} = "." ]] ; then
				print T228"(${fl}: "
				rmdir "${fl}"
				st=$?
				if [[ ${st} > 0 ]] ; then
					print "error: could not remove"
					cd "${origdir}"
					return ${st}
				fi
				print "removed"
			fi
		done < "${iofile}"

		cd "${origdir}"
	fi
	return 0
}

#^ 7 === cleanTarget
function cleanTarget {
	for folder in "${HOME}/Library/Scripts/Xcode" "${HOME}/Library/Developer/Xcode/Templates" "${CCDev}/build/Support/BuildSupport/Applications/Xcode" ; do
		removeFolder "${folder}"
		st=${?}
		if [[ ${st} > 0 ]] ; then
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

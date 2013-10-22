#!/bin/ksh

#  Developer_install.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
CCDev_install.ksh -- provide functions for ccInstall to support CCDev installation
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

servicesFolder="${HOME}/Library/Services"
scriptsFolder="${CCDev}/bin"
applescriptsFolder="${HOME}/Library/Scripts/Developer"

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
		"Scripts" )
			destinationFolder="${scriptsFolder}"
			;;
		"Services" )
			destinationFolder="${servicesFolder}"
			;;
		"AppleScripts" )
			destinationFolder="${applescriptsFolder}"
			;;
		"Snippets.txt" )		# used by Snippets.applescript (obsolete; saved for reference) only
			;;
		"Doxygen" )				# files for reference only
			;&
		"plist" )				# used by Xcode build system for Developer_Setup.ksh
			;&
		"Developer_Setup.ksh" )	# custom setup script Developer_Setup.ksh
			;&
		"ThirdParty" )			# handled by Developer_Setup.ksh
			;&
		"Environment" )			# handled by Developer_Setup.ksh
			;;
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
		if [[ "${subtarget}" = "AppleScripts" ]] ; then
			if [[ ${filepath%.applescript} = ${filepath} ]] ; then		# not an AppleScript file
				action="ignore"
			else
				fname="${filepath%.applescript}.scpt"
				action="copy"
				sourceForCopy="${CCDev}/build/Support/BuildSupport/Developer/DeveloperScripts.bundle/Contents/Resources/${fname}"
				destinationForCopy="${destinationFolder}/${fname}"
			fi
		else
			srcname="${filepath}"
			destname="${srcname%.ksh}"
			action="copy"
			sourceForCopy="${sourceRoot}/${targetFolder}/${subtarget}/${filepath}"
			destinationForCopy="${destinationFolder}/${destname}"
		fi
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
	for folder in "${applescriptsFolder}"  "${scriptsFolder}"; do
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

. "${CCDev}/bin/execInstallScript"

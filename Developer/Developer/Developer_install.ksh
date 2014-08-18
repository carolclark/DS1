#!/bin/ksh

#  Developer_install.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
Developer_install.ksh -- provide functions for ccInstall to support Developer installation
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

# setup and configure if necessary
typeset -i buildIsClean					# > 0 if clean
if [[ -e "${CCDev}/build_output/Support/Developer/Developer.lastbuilt" ]] ; then
	buildIsClean=0
else
	buildIsClean=1
fi
if [[ $# > 0 ]] && [[ "${1}" != -* ]] ; then			# not a callback
	if [[ $# > 2 ]] && [[ "${3}" = "clean" ]] ; then	# clean action
		if [[ ! -e "${CCDev}/bin/ccInstall" ]] ; then
			print "== clean skipped: target Developer is already clean"
			return
		fi
	elif [[ $# > 2 ]] && [[ "${3}" = "-t" ]] ; then		# test action
		break
	else												# not a clean action
		# installing
		print -n "== Setup and Configure: "
		. Developer/DevConfig.ksh
		st=$?
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "Setup and Configuration failed"
			return
		fi
		print "Setup and Configuration successful"
	fi
fi

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
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination subtarget"
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
		"Python" )
			destinationFolder="${scriptsFolder}/python"
			;;
		"Snippets.txt" )		# used by Snippets.applescript (obsolete; saved for reference) only
			;;
		"Doxygen" )				# files for reference only
			;&
		"CocoaTestBundle" )		# used by Xcode build system for these tests
			;&
		"DevConfig.ksh" )		# custom setup script DevConfig.ksh
			;&
		"ThirdParty" )			# handled elsewhere
			;;
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --prepareFileOperation subtarget filepath destinationFolder"
		return
	fi

	if [[ -n "${destinationFolder}" ]] ; then
		if [[ "${subtarget}" = "AppleScripts" ]] ; then
			if [[ ${filepath%.applescript} = ${filepath} ]] ; then		# not an AppleScript file
				action="ignore"
			else
				fname="${filepath%.applescript}.scpt"
				action="copy"
				sourceForCopy="${CCDev}/build/Support/Developer/Developer/AppleScripts.bundle/Contents/Resources/${fname}"
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
	if [[ ${buildIsClean} > 0 ]] ; then
		return
	fi
	if [[ -e "${scriptsFolder}/bin/.kshrc" ]] ; then
		rm "${scriptsFolder}/bin/.kshrc"
	fi
	for folder in "${servicesFolder}" "${applescriptsFolder}"  "${scriptsFolder}"; do
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

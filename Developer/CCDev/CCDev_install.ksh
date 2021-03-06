#!/bin/ksh

#  CCDev_install.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-14 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
CCDev_install.ksh -- provide functions for ccInstall to support CCDev installation
#	--getSubtargetDestination subtarget
#		output destination location for files of subtarget
#	--prepareFileOperation subtarget filepath destinationFolder
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	--cleanTarget
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

#pragma mark === Markers ===
# 1 getSubtargetDestination; 2 prepareFileOperation; 3 cleanTarget; 8 main

CCDev="${HOME}/Library/CCDev"

#pragma mark 1 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh --getSubtargetDestination subtarget"
		return $RC_MissingArgument
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
		"CCDev_ReadMe.html" )
			;&
		"CCDev_UTests" )
			;&
		"Python" )				# separate target
			;&
		"Snippets.txt" )		# used by Snippets.applescript (obsolete; saved for reference) only
			;&
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
			return $RC_InputNotHandled
			;;
	esac
	print "${destinationFolder}"
	return 0
}

#pragma mark 2 === prepareFileOperation
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
		if [[ "${subtarget}" = "AppleScripts" ]] ; then
			if [[ ${filepath%.applescript} = ${filepath} ]] ; then		# not an AppleScript file
				action="ignore"
			else
				fname="${filepath%.applescript}.scpt"
				action="copy"
				sourceForCopy="${CCDev}/build/Support/Developer/CCDev/AppleScripts.bundle/Contents/Resources/${fname}"
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

#pragma mark 3 === cleanTarget
function cleanTarget {
	if [[ ${buildIsClean} > 0 ]] ; then
		return
	fi
	if [[ -e "${scriptsFolder}/.kshrc" ]] ; then
		msg=$(rm "${scriptsFolder}/.kshrc")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "failed to remove file ${scriptsFolder}/.kshrc: ${msg}"
			return
		fi
	fi
	for folder in "${applescriptsFolder}"; do
		msg=$(ccInstall --removeFolder "${folder}")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			return
		fi
	done

	return 0
}

#pragma mark 8 === main

# setup and configure if necessary
typeset -i buildIsClean					# > 0 if clean
if [[ -e "${CCDev}/build_output/Support/Developer/CCDev.lastbuilt" ]] ; then
	buildIsClean=0
else
	buildIsClean=1
fi
if [[ $# > 0 ]] && [[ "${1}" != -* ]] ; then			# not a callback
	if [[ $# > 2 ]] && [[ "${3}" = "clean" ]] ; then	# clean action
		if [[ ! -e "${CCDev}/bin/ccInstall" ]] ; then
			print "== clean skipped: target CCDev is already clean"
			return
		fi
	elif [[ $# > 2 ]] && [[ "${3}" = "test" ]] ; then	# test action
		break
	else												# install action
		# installing
		print -n "== Setup and Configure: "
		. CCDev/DevConfig.ksh
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "$0#$LINENO: Setup and Configuration failed (Error#${st})"
			return ${st}
		fi
		print "Setup and Configuration successful"
	fi
fi

. "${CCDev}/bin/ccInstall"

servicesFolder="${HOME}/Library/Services"
scriptsFolder="${CCDev}/bin"
applescriptsFolder="${HOME}/Library/Scripts/Developer"

missingArgumentMessage="USAGE: $0 [--commandFlag] sourceRoot targetFolder (-actionFlags | 'clean') [...]"

command=""
sourceRoot=""
targetFolder=""
actionFlags=""

if [[ $# > 0 ]] ; then
	if [[ "${1}" = -* ]] ; then
		command="${1}"
		shift
	fi
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	return $RC_MissingArgument
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
	return $RC_MissingArgument
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
			msg=$(prepareFileOperation "${1}" "${2}" "${3}")
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
	msg=$(ccInstall "${0}" "${sourceRoot}" "${targetFolder}" "${actionFlags}")
	es=$?
	print "${msg}"
	return "${es}"
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	return $RC_MissingArgument
fi

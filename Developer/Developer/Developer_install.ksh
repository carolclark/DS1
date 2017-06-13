#!/bin/ksh

#  Developer_install.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-16 C & C Software, Inc. All rights reserved.
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

#^ === install
function install {
	src="${1}"
	dst="${2}"
	nm="${3:-}"
	if [[ ! -n "${nm}" ]] ; then
		nm="$(basename ${src})"
	fi
	print -n "${src}: "
	mkdir -p "${dst}"
	cp "${src}" "${dst}/${nm}"
	if [[ "${?}" = "0" ]] ; then
		print -n "=> ${dst}"
		if [[ "${nm}" = "" ]] ; then
			print
		else
			print "/${nm}"
		fi
		return 0
	else
		print "could not copy to ${dst}"
		return 69	#$RC_NoSuchFileOrDirectory
	fi
}

# setup and configure if necessary
if [[ $# > 0 ]] && [[ "${1}" != -* ]] ; then			# not a callback
	if [[ $# > 2 ]] && [[ "${3}" = "clean" ]] ; then	# clean action
		if [[ ! -e "${CCDev}/bin/ccInstall" ]] ; then
			print "== clean skipped: target Developer is already clean"
			return
		fi
	elif [[ $# > 2 ]] && [[ "${3}" = "test" ]] ; then		# test action
		st=$?
		if [[ $st == $RC_InvalidArgument ]] ; then
			print  "$0#$LINENO: Testing supported by target DeveloperTests. RC_InvalidArgument"
		else
			print "$0#$LINENO:" "Setup and Configuration failed: error code #${st}"
		fi
		exit ${st}
	else												# not clean or test
		# installing
		print -n "== Setup and Configure: "
		logger "$0#$LINENO: pwd:$(pwd) #runDC"
		msg=$(Developer/DevConfig.ksh)
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "$0#$LINENO:" "failed: ${msg} #${st}"
			exit ${st}
		else
			print ${msg}
		fi

		# set up to install $CCDev files
		print "creating CCDev (${CCDev}) subdirectories"
		srcdir="$(dirname $0)"; export srcdir
		mkdir -p $CCDev/bin
		mkdir -p $CCDev/tmp

		print "installing files ..."
		# install bootstrap scripts
		install "${srcdir}/Scripts/resultCodes.ksh" "$CCDev/bin" "resultCodes"
		st=$?
		if [[ $st > 0 ]] ; then
			exit $st
		fi
		install "${srcdir}/Scripts/errcc.ksh" "$CCDev/bin" "errcc"
		install "${srcdir}/Scripts/ccInstall.ksh" "$CCDev/bin" "ccInstall"
		install "${srcdir}/Scripts/execInstallScript.ksh" "$CCDev/bin" "execInstallScript"

		# test
		print "== Developer/_Tests/testDevConfig.ksh"
		result="$(Developer/_Tests/testDevConfig.ksh)"
		if [[ "${?}" > 0 ]] ; then
			failcnt="${failcnt}"+1
		fi
		print "${result}"
		if [[ $failcnt > 0 ]] ; then
			exit $failcnt
		fi
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
launchdaemonsFolder="/Library/LaunchDaemons"

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
		"Scripts" )
			destinationFolder="${scriptsFolder}"
			;;
		"Bash" )
			destinationFolder="${scriptsFolder}"
			;;
		"Services" )
			destinationFolder="${servicesFolder}"
			;;
		"AppleScripts" )
			destinationFolder="${applescriptsFolder}"
			;;
		"JetBrains" )
			if [[ ${filepath} == "youtrack.jmvoptions" ]] ; then
				destinationFolder="/Volumes/Servers/jb/YouTrack/YouTrack_current/conf"
			else
				destinationFolder="${launchdaemonsFolder}"
			fi
			;;
		"MySQL" )				# probably handled by new build file
			;;
		"test" )
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
			if [[ "${srcname}" == "${destname}" ]] ; then
				destname="${srcname%.sh}"
			fi
			action="copy"
			sourceForCopy="${sourceRoot}/${targetFolder}/${subtarget}/${filepath}"
			destinationForCopy="${destinationFolder}/${destname}"
		fi
	# /todo remove this block when my.cnf is properly intsalled
	elif [[ "${destinationFolder}" = "${launchdaemonsFolder}" ]] ; then
		if [[ "${filepath}" != "jetbrains.teamcity.server.plist" ]] ; then
			action="ignore"
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
	if [[ -e "${scriptsFolder}/.kshrc" ]] ; then
		msg=$(rm "${scriptsFolder}/.kshrc")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "failed to remove file ${scriptsFolder}/.kshrc: ${msg}"
			return ${st}
		fi
	fi
	for folder in "${applescriptsFolder}"; do
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

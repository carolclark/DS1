#!/bin/ksh

#  Python_install
#  Support/Python
#
#  Created by Carol Clark on 10/1/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
Python_install.ksh -- provide functions for ccInstall to support CCDev installation
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
sourceRoot=""
targetFolder=""
actionFlags=""

pythonFolder="${CCDev}/bin/python"

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
			destinationFolder="${pythonFolder}"
			;;
		"Python_UTests" )
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
		srcname="${filepath}"
		destname="${srcname}"
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
	if [[ -d "${pythonFolder}" ]] ; then
		if [[ -d "${pythonFolder}/__pycache__" ]] ; then
			if [[ $(ls -A ${pythonFolder}/__pycache__) ]] ; then
				for fl in $(ls -a ${pythonFolder}/__pycache__); do
					if [[ "${fl}" != '.' ]] ; then
						if [[ "${fl}" != '..' ]] ; then
							chmod a+w "${pythonFolder}/__pycache__/${fl}"
							rm "${pythonFolder}/__pycache__/${fl}"
							print "removed ${pythonFolder}/__pycache__/${fl}"
							st=${?}
							if [[ ${st} > 0 ]] ; then
								errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
								return
							fi
						fi
					fi
				done
			fi
			chmod a+w "${pythonFolder}/__pycache__"
			rmdir "${pythonFolder}/__pycache__"
			print "removed directory ${pythonFolder}/__pycache__"
			st=${?}
			if [[ ${st} > 0 ]] ; then
				errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
				return
			fi
		fi
		if [[ $(ls -A ${pythonFolder}) ]] ; then
			for fl in $(ls -a "${pythonFolder}"); do
				if [[ "${fl}" != '.' ]] ; then
					if [[ "${fl}" != '..' ]] ; then
						rm "${pythonFolder}/${fl}"
						print "removed ${pythonFolder}/${fl}"
						st=${?}
						if [[ ${st} > 0 ]] ; then
							errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
							return
						fi
					fi
				fi
			done
		fi
		rmdir "${pythonFolder}"
		print "removed directory ${pythonFolder}"
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			return
		fi
	fi
	return 0
}

#^ 8 === main
. "${CCDev}/bin/execInstallScript"

#!/bin/ksh

#  Python_install
#  Support/Python
#
#  Created by Carol Clark on 10/1/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
Python_install.ksh -- provide functions for ccInstall to support CCDev installation
#	getSubtargetDestination subtarget
#		output destination location for files of subtarget
#	prepareFileOperation subtarget filepath subtargetDestination
#		perform any preprocessing indicated for the specified file
#		output path to file containing: "copy"|"ignore" sourceForCopy destinationForCopy
#	cleanTarget
#		perform any cleanup indicated for files that this target installs
#		return 0 to have caller continue by updating last built data
'

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ 1 === top
command=""
sourceRoot=""
targetFolder=""

pythonFolder="${CCDev}/bin/python"

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh getSubtargetDestination subtarget"
		return
	fi
	subtargetDestination=""
	case "${subtarget}" in
		"Scripts" )
			subtargetDestination="${pythonFolder}"
			;;
		"Python_UTests" )
			;;
		* )
			errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${subtarget} not handled"
			return
			;;
	esac
	print "${subtargetDestination}"
	return 0
}

#^ 5 === prepareFileOperation
function prepareFileOperation {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		subtarget="${1}"
		filepath="${2}"
		subtargetDestination="${3}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh prepareFileOperation subtarget filepath subtargetDestination"
		return
	fi

	if [[ -n "${subtargetDestination}" ]] ; then
		srcname="${filepath}"
		destname="${srcname}"
		fileAction="copy"
		sourceForCopy="${sourceRoot}/${targetFolder}/${subtarget}/${filepath}"
		destinationForCopy="${subtargetDestination}/${destname}"
	else
		fileAction="ignore"
	fi

	fl="${CCDev}/tmp/copyInfo"
	mkdir -p "${CCDev}/tmp"
	print "${fileAction}\n${sourceForCopy}\n${destinationForCopy}" > "${fl}"
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
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh sourceRoot targetFolder [action]"
		return
	fi
	action=${3:-"install"}

# clean
	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${targetFolder}..."
		msg=$(cleanTarget "${sourceRoot}" "${targetFolder}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: cleanTarget failed: ${msg}"
			return
		fi
		print ${msg}
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"

# install
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
		typeset -i failcnt=0
		previousSubtarget=""
		while read fl ; do
			subtarget="${fl%%/*}"
			fpath="${fl#*/}"
			if [[ ! "${previousSubtarget}" = "${subtarget}" ]] ; then
				msg=$(getSubtargetDestination "${subtarget}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
				else
					subtargetDestination="${msg}"
					previousSubtarget="${subtarget}"
				fi
				if [[ -n "${subtargetDestination}" ]] ; then
					print "=${sourceRoot##*/}/${targetFolder}/${subtarget}:"
				fi
			fi
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				errorMessage ${st} "$0#$LINENO:" "error while finding subtarget destination: ${msg}"
			else
				print -n "${fpath}: "
				msg=$(prepareFileOperation "${subtarget}" "${fpath}" "${subtargetDestination}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
				else
					hfile="${msg}"
					set -A copyInfo
					while read ln ; do
						copyInfo+=("${ln}")
					done < "${hfile}"
					fileAction="${copyInfo[0]}"
					sourceForCopy="${copyInfo[1]}"
					destinationForCopy="${copyInfo[2]}"
				fi
				msg=$(ccInstall --installOneFile "${fileAction}" "${sourceForCopy}" "${destinationForCopy}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					msg=$(errorMessage ${st} "$0#$LINENO:" "error: ${msg}")
				fi
				print "${msg}"
			fi
		done < "${iofile}"
		if [[ ${failcnt} = 0 ]] ; then
			ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
			print "build succeeded"
		else
			pl="s"
			if [[ ${failcnt} = 1 ]] ; then
				pl=""
			fi
			errorMessage 1 "$0#$LINENO:" "error: Build Failed: ${errcnt} error${pl} encountered"
			exit "${failcnt}"
		fi

# invalid action
	else
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid action ${action}"
	fi

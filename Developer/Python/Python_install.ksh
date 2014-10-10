#!/bin/ksh

#  Python_install
#  Support/Python
#
#  Created by Carol Clark on 10/1/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
Python_install.ksh -- install Python scripts
#	Python_install		sourceRoot targetFolder action
'

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ 1 === top
sourceRoot=""
targetFolder=""

pythonFolder="${CCDev}/bin/python"

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
			filepath="${fl#*/}"
			if [[ ! "${previousSubtarget}" = "${subtarget}" ]] ; then
				subtargetDestination=""
				case "${subtarget}" in
					"Scripts" )
						subtargetDestination="${pythonFolder}"
						;;
					"Python_UTests" )
						;;
					* )
						failcnt="${failcnt}"+1
						errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${subtarget} not handled"
						;;
				esac
				if [[ -n "${subtargetDestination}" ]] ; then
					print "=${sourceRoot##*/}/${targetFolder}/${subtarget}:"
					previousSubtarget="${subtarget}"
				fi
			fi
			print -n "${filepath}: "
			if [[ -n "${subtargetDestination}" ]] ; then
				srcname="${filepath}"
				destname="${srcname}"
				fileAction="copy"
				fullSourcePath="${sourceRoot}/${targetFolder}/${subtarget}/${filepath}"
				fullDestinationPath="${subtargetDestination}/${destname}"
			else
				fileAction="ignore"
			fi
			msg=$(ccInstall --installOneFile "${fileAction}" "${fullSourcePath}" "${fullDestinationPath}")
			st=$?
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				msg=$(errorMessage ${st} "$0#$LINENO:" "error: ${msg}")
			fi
			print "${msg}"
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

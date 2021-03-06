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

#^ 1 === top
HOME="/Users/carolclark"
DEV="${HOME}/Dev"
CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

pythonFolder="${CCDev}/bin/python"

#^ 8 === main
	sourceRoot=""
	targetFolder=""
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh sourceRoot targetFolder [action]"
		return $RC_MissingArgument
	fi
	action=${3:-"install"}

# clean
	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${targetFolder}..."
		for folder in "${pythonFolder}" ; do
			msg=$(ccInstall --removeFolder "${folder}")
			st=${?}
			if [[ ${st} > 0 ]] ; then
				errorMessage ${st} "$0#$LINENO:" "error: cleanTarget failed: ${msg}"
				return ${st}
			fi
		done
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"

# install
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "ccInstall findSources: ${msg}"
			return ${st}
		fi
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
					"cmdlineTests" )
						;;
					"pyparsing" )
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

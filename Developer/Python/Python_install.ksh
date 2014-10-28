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
		return
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
				return
			fi
		done
		print ${msg}
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"

# install
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
		typeset -i failcnt=0
		previous_source_folder=""
		while read fl ; do
			source_folder="${fl%/*}"
			file_name="${fl##*/}"
			file_basename="${file_name%.*}"
			file_extension="${file_name#*.}"
			if [[ ! "${previous_source_folder}" = "${source_folder}" ]] ; then
				destination_folder=""
				case "${source_folder}" in
					"Scripts" )
						destination_folder="${pythonFolder}"
						;;
					"Python_UTests" )
						;;
					* )
						failcnt="${failcnt}"+1
						errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${source_folder} not handled"
						;;
				esac
				if [[ -n "${destination_folder}" ]] ; then
					print "=${sourceRoot##*/}/${targetFolder}/${source_folder}:"
					previous_source_folder="${source_folder}"
				fi
			fi
			print -n "${file_name}: "
			if [[ -n "${destination_folder}" ]] ; then
				fileAction="copy"
				fullSourcePath="${sourceRoot}/${targetFolder}/${source_folder}/${file_name}"
				fullDestinationPath="${destination_folder}/${file_name}"
			else
				fileAction="ignore"
			fi
			case "${fileAction}" in
				"ignore" )
					msg="skipped"
					;;
				"copy" )
					msg=$(ccInstall --copyFile "${fullSourcePath}" "${fullDestinationPath}")
					st=$?
					if [[ ${st} > 0 ]] ; then
						failcnt="${failcnt}"+1
					else
						msg="succeeded"
					fi
					;;
				* )
					msg=$(errorMessage $RC_InputNotHandled "$0#$LINENO:" "error: Unrecognized action string ${action}")
					failcnt="${failcnt}"+1
					;;
			esac
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

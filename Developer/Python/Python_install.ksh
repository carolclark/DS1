#!/bin/ksh

#  Python_install.ksh
#  Support/Developer/Python
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
			# set up to process file
			source_folder="${fl%/*}"
			file_name="${fl##*/}"
			file_basename="${file_name%.*}"
			file_extension="${file_name#*.}"
			destination_folder=""
			fileAction=""
			case "${source_folder}" in
				"Scripts" )
					fileAction="copy"
					destination_folder="${pythonFolder}"
					;;
				"Python_UTests" )
					fileAction="ignore"
					;;
				* )
					failcnt="${failcnt}"+1
					errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${source_folder} not handled"
					;;
			esac
			if [[ ! "${fileAction}" = "ignore" ]] ; then
				fullSourcePath="${sourceRoot}/${targetFolder}/${source_folder}/${file_name}"
				fullDestinationPath="${destination_folder}/${file_name}"
			fi

			# display and process
			if [[ ! "${previous_source_folder}" = "${source_folder}" ]] ; then
				print "=${sourceRoot##*/}/${targetFolder}/${source_folder}:"
				previous_source_folder="${source_folder}"
			fi
			print -n "${file_name}: "
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
						msg="copied"
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

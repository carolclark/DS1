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
	if [[ -n "${SRCROOT}" ]] ; then
		sourceRoot="${SRCROOT}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "Environment variable SRCROOT required."
		return
	fi
	if [[ -n "${TARGET_NAME}" ]] ; then
		targetFolder="${TARGET_NAME}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "Environment variable TARGET_NAME required."
		return
	fi
	action=${1:-"install"}

	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${targetFolder}..."
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
	elif [[ ! ${action} = "clean" ]] && [[ ! ${action} = "install" ]] ; then
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid action ${action}"
		return
	fi

	iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
	typeset -i failcnt=0
	previous_source_folder=""
	while read fl ; do
		# establish installation parameters
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

		msg=""
		if [[ "${action}" = "clean" ]] ; then
			if [[ ! "${fileAction}" = "ignore" ]] ; then
				if [[ -e "${fullDestinationPath}" ]] ; then
					print -n "${file_name}: "
					chmod a+w "${fullDestinationPath}"
					st=$?
					if [[ $st > 0 ]] ; then
						errorMessage ${st} "$0#$LINENO:" "error: could not set permission for ${fullDestinationPath}"
						return
					fi
					rm "${fullDestinationPath}"
					st=$?
					if [[ $st > 0 ]] ; then
						errorMessage ${st} "$0#$LINENO:" "error: could not remove ${fullDestinationPath}"
						return
					fi
					msg="${fullDestinationPath} removed"
				fi
			fi
		else
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
		fi
		print "${msg}"
	done < "${iofile}"

	# display result
	if [[ "${action}" = "clean" ]] ; then
		print "clean succeeded"
	else
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
	fi
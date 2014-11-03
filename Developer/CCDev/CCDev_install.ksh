#!/bin/ksh

#  CCDev_install.ksh
#  Support/Developer/CCDev
#
#  Created by Carol Clark on 10/29/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
CCDev_install.ksh -- install CCDev scripts
#	CCDev_install.ksh		action
'

#^ 1 === top

#^ == Setup and Configure
print -n "== Setup and Configure: "
. CCDev/DevConfig.ksh
st=$?
if [[ ${st} > 0 ]] ; then
	print "Error#${st}@$0#$LINENO:Setup and Configuration failed"
	return $st
fi
print "Setup and Configuration successful"

#^ == Install
CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

scriptsFolder="${CCDev}/bin"

#^ 8 === main
	if [[ -n "${SRCROOT}" ]] ; then
		sourceRoot="${SRCROOT}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "Environment variable SRCROOT required."
		return
	fi
	sourcePath=${0%/*}
	action=${1:-"install"}

# shunit tests
	if [[ ${action} = "test" ]] ; then
		testFolder="${sourceRoot}/${PROJECT_NAME}/_Tests"
		if [[ -e "${testFolder}" ]] ; then
			if [[ -d "${testFolder}" ]] ; then
				msg=$(ccInstall --runShunitTests "${testFolder}")
				es=$?
				print "${msg}"
				return "${es}"
			fi
		fi
		print "*** no shunit tests found ***"
		return 0
	fi

# clean / install
	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${sourcePath} output"
		ccInstall --clearLastbuilt "${sourceRoot}" "${sourcePath}"
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${sourcePath}..."
	elif [[ ! ${action} = "clean" ]] && [[ ! ${action} = "install" ]] ; then
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid action ${action}"
		return
	fi

	iofile=$(ccInstall --findSources "${sourceRoot}" "${sourcePath}")
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
					destination_folder="${scriptsFolder}"
				;;
			"CCDev_UTests" )
				fileAction="ignore"
				;;
			"CCDev_UTests/OtherSources" )
				fileAction="ignore"
				;;
			"DevConfig.ksh" )
				fileAction="ignore"
				;;
			* )
				failcnt="${failcnt}"+1
				errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${sourcePath}/${source_folder} not handled"
				;;
		esac
		if [[ ! "${fileAction}" = "ignore" ]] ; then
			if [[ "${file_extension}" = "applescript" ]] ; then
				fname="${file_basename}.scpt"
				action="copy"
				fullSourcePath="${CCDev}/build/Support/Developer/CCDev/AppleScripts.bundle/Contents/Resources/${fname}"
				fullDestinationPath="${destination_folder}/${fname}"
			elif [[ "${file_extension}" = "ksh" ]] ; then
				fullSourcePath="${sourceRoot}/${sourcePath}/${source_folder}/${file_name}"
				fullDestinationPath="${destination_folder}/${file_basename}"
			else
				fullSourcePath="${sourceRoot}/${sourcePath}/${source_folder}/${file_name}"
				fullDestinationPath="${destination_folder}/${file_name}"
			fi
		fi

		# display and process
		if [[ ! "${previous_source_folder}" = "${source_folder}" ]] ; then
			print "=${sourceRoot##*/}/${sourcePath}/${source_folder}:"
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
			ccInstall --updateLastbuilt "${sourceRoot}" "${sourcePath}"
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

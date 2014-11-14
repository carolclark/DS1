#!/bin/ksh

#  CCDev_install.ksh
#  Support/Developer/CCDev
#
#  Created by Carol Clark on 10/29/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
CCDev_install.ksh -- install CCDev scripts
#	CCDev_install.ksh		action
	script to install files and/or packages
'

CCDev="${HOME}/Library/CCDev"

#^ 1 === top
action=${1:-"install"}

#^ == Setup and Configure
if [[ "${action}" = "install" ]] ; then
	print -n "== Setup and Configure: "
	. CCDev/DevConfig.ksh
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "Error#${st}@$0#$LINENO:Setup and Configuration failed"
		return $st
	fi
	print "Setup and Configuration successful"
fi
if [[ "${action}" = "clean" ]] ; then
	if [[ ! -e "${CCDev}/bin/ccInstall" ]] ; then
		print "== clean skipped: target CCDev is already clean"
		return
	fi
fi

#^ == Process Action
. "${CCDev}/bin/ccInstall"

scriptsFolder="${CCDev}/bin"
servicesFolder="${HOME}/Library/Services"

#^ 8 === main
	if [[ -n "${SRCROOT}" ]] ; then
		sourceRoot="${SRCROOT}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "Environment variable SRCROOT required."
		return
	fi
	if [[ -n "${PROJECT_NAME}" ]] ; then
		projectName="${PROJECT_NAME}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "Environment variable PROJECT_NAME required."
		return
	fi
	if [[ "$projectName" != ${0%/*} ]] ; then			# result of this condition is undefined
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "Expected install script at ${sourceRoot}/${projectName}."
		return
	fi
	action=${1:-"install"}

# shunit tests
	if [[ ${action} = "test" ]] ; then
		testFolder="${sourceRoot}/${PROJECT_NAME}/_Tests"
		print "== testing ${testFolder}"
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
		print "== cleaning ${sourceRoot##*/}/${projectName} output"
		ccInstall --clearLastbuilt "${sourceRoot}" "${projectName}"
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${projectName}..."
	else
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid action ${action}"
		return
	fi

	iofile=$(ccInstall --findSources "${sourceRoot}" "${projectName}")
	typeset -i failcnt=0
	previous_subtarget=""
	while read fl ; do
		# establish installation parameters
		subtarget="${fl%%/*}"
		file_name="${fl##*/}"
		file_basename="${file_name%.*}"
		file_extension="${file_name#*.}"
		destination_folder=""
		fileAction=""

		is_package="NO"
		package_name=""
		pathFromSubtarget="${fl#*/}"
		if [[ "${pathFromSubtarget}" != "${file_name}" ]] ; then
			is_package="YES"
			package_name="${pathFromSubtarget%%/*}"
		fi

		case "${subtarget}" in
			"Scripts" )
				fileAction="copy"
				destination_folder="${scriptsFolder}"
				;;
			"Services" )
				fileAction="copy"
				destination_folder="${servicesFolder}"
				;;
			"CCDev_UTests" )
				;&
			"DevConfig.ksh" )
				fileAction="ignore"
				;;
			* )
				failcnt="${failcnt}"+1
				errorMessage $RC_InputNotHandled "$0#$LINENO:" "subtarget ${sourceRoot}/${projectName}/${subtarget} not handled"
				;;
		esac

		if [[ ! "${fileAction}" = "ignore" ]] ; then
			fullSourcePath="${sourceRoot}/${projectName}/${fl}"
			fullDestinationPath="${destination_folder}/${file_name}"
			if [[ ${is_package} = "YES" ]] ; then
				fullDestinationPath="${destination_folder}/${fl#*/}"
			else
				if [[ "${file_extension}" = "applescript" ]] ; then
					fname="${file_basename}.scpt"
					action="copy"
					fullSourcePath="${CCDev}/build/Support/Developer/CCDev/AppleScripts.bundle/Contents/Resources/${fname}"
					fullDestinationPath="${destination_folder}/${fname}"
				elif [[ "${file_extension}" = "ksh" ]] ; then
					fullSourcePath="${sourceRoot}/${projectName}/${subtarget}/${file_name}"
					fullDestinationPath="${destination_folder}/${file_basename}"
				fi
			fi
		fi

		# display and process
		if [[ "${previous_subtarget}" != "${subtarget}" ]] ; then
			print "=${sourceRoot##*/}/${projectName}/${subtarget}:"
			previous_subtarget="${subtarget}"
		fi

		msg=""
		if [[ "${action}" = "clean" ]] ; then
			if [[ ! "${fileAction}" = "ignore" ]] ; then
				if [[ -e "${fullDestinationPath}" ]] ; then
					if [[ "${subtarget}" = "Services" ]] ; then
						print -n "${package_name}"
						msg=$(ccInstall --removeFolder "${destination_folder}/${package_name}")
						st=$?
						if [[ ${st} > 0 ]] ; then
							failcnt="${failcnt}"+1
						else
							msg=": removed"
						fi
					else
						print -n "${file_name}"
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
						msg=": removed"
					fi
				fi
			fi
		else
			if [[ "${subtarget}" = "Services" ]] ; then
				if [[ "${file_name}" = "document.wflow" ]] ; then		# once per service
					print -n "${package_name}"
				fi
			else
				print -n "${file_name}"
			fi
			case "${fileAction}" in
				"ignore" )
					msg="skipped"
					;;
				"copy" )
					if [[ "${subtarget}" = "Services" ]] ; then
						if [[ "${file_name}" = "document.wflow" ]] ; then		# once per service
							print -n " -> ${fullDestinationPath}"
						fi
					else
						print -n " -> ${fullDestinationPath}"
					fi
					msg=$(ccInstall --copyFile "${fullSourcePath}" "${fullDestinationPath}")
					st=$?
					if [[ ${st} > 0 ]] ; then
						failcnt="${failcnt}"+1
					else
						msg=": copied"
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
			ccInstall --updateLastbuilt "${sourceRoot}" "${projectName}"
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

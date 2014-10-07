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
#	prepareFileOperation subtarget filepath destinationFolder
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
actionFlags=""

pythonFolder="${CCDev}/bin/python"

#^ 3 === getSubtargetDestination
function getSubtargetDestination {
	if [[ -n "${1}" ]] ; then
		subtarget="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh getSubtargetDestination subtarget"
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh prepareFileOperation subtarget filepath destinationFolder"
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

#pragma mark 5 --- processAction
function processAction {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
		actionIn="${3}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh sourceRoot targetFolder [action]"
		return
	fi
	action=$(getAction "${sourceRoot}" "${targetFolder}" ${actionIn})
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: function getAction failed: ${action}"
		return
	fi

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
	fi

# doxygen
	if [[ ${action} = "doxygen" ]] ; then
		targetName=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
		outputDir=$(getSubtargetDestination "Doxygen")
		installName="${outputDir##*/}"
		print "== installing ${installName} documentation"
		doxygenPath="/Applications/Doxygen.app/Contents/Resources/doxygen"
		mkdir -p "${outputDir}"
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "failed to create output directory $outputDir"
			return
		fi

	#  Run doxygen on the config file (builds local site)
		$doxygenPath "${sourceRoot}/${targetFolder}/${installName}_doxygen.txt"
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error while generating Doxygen docs"
			return
		fi

	# Make docset using the Makefile that just generated
		print $outputDir/html
		make -C $outputDir/html install
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error while creating $workspaceName.docset"
			return
		fi

	# Copy the docset to the location expected by Xcode
		docsetPath="/Users/$USER/Library/Developer/Shared/Documentation/DocSets/com.candcsoft.${installName}.docset"
		cp -r $outputDir/html/com.candcsoft.${installName}.docset $docsetPath
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "could not copy docset to $docsetPath"
			return
		fi

	# Tell Xcode to load the docset
		osascript -e "tell application \"Xcode\" to load documentation set with path \"$docsetPath\""
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error loading $docsetPath into Xcode"
			return
		fi

	fi

# install
	if [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
		typeset -i failcnt=0
		prevFolder=""
		while read fl ; do
			sourceFolder="${fl%%/*}"
			fpath="${fl#*/}"
			if [[ ! "${prevFolder}" = "${sourceFolder}" ]] ; then
				msg=$(getSubtargetDestination "${sourceFolder}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
				else
					destination="${msg}"
					prevFolder="${sourceFolder}"
				fi
				if [[ -n "${destination}" ]] ; then
					print "=${sourceRoot##*/}/${targetFolder}/${sourceFolder}:"
				fi
			fi
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			else
				print -n "${fpath}: "
				msg=$(prepareFileOperation "${sourceFolder}" "${fpath}" "${destination}")
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
					action="${copyInfo[0]}"
					sourceForCopy="${copyInfo[1]}"
					destinationForCopy="${copyInfo[2]}"
				fi
				msg=$(ccInstall --installOneFile "${action}" "${sourceForCopy}" "${destinationForCopy}")
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
			errorMessage 1 "$0#$LINENO:" "error: Build Failed: ${errcnt} error${pl} encountered; tests not run"
			exit "${failcnt}"
		fi
	fi

# test
	if [[ ${action} = "test" ]] ; then
		runShunitTests "${sourceRoot}/${targetFolder}"
	fi
}

#^ 8 === main
missingArgumentMessage="USAGE: $0 [--commandFlag] sourceRoot targetFolder (-actionFlags | 'clean') [...]"

if [[ $# > 1 ]] ; then
	sourceRoot="${1}"
	shift
	targetFolder="${1}"
	shift
	if [[ $# > 0 ]] ; then
		actionFlags="${1}"
		shift
	fi
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	return
fi
if [[ -n "${command}" ]] ; then
	case "${command}" in
		* )
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid commandFlag ${command}"
			exit $?
			;;
	esac
fi
if [[ -n "${sourceRoot}" ]] && [[ -n "${targetFolder}" ]] ; then
	msg=$(processAction "${sourceRoot}" "${targetFolder}" "${actionFlags}")
	es=$?
	print "${msg}"
	return "${es}"
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	return
fi

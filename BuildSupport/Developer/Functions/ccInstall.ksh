#!/bin/ksh

#  ccInstall.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='ccInstall -- installation script and supporting functions'
USAGE='
ccInstall projectPath target [actionFlags]
#	build the specified project target
#		actionFlags: [-[citu]+] - actions requested (clean, install, test, upload); default: -it
ccInstall commandFlag [argument(s)]
#	--getActions	resultObject [actionString]
#		actionString: [-[citu]+] - actions requested (clean, install, test, upload)
#			default: -it
#			resultObject: object to contain results
#	--get<Path>		projectPath target
#		<Path>: 	BaseBath | SourcePath | TargetScript | Lastbuilt
#		result: 	string containing specified path
#	--findTests 	projectPath target
#		result: 	path to file containing list of tests for <projectPath>/<target>
#	--findSources	projectPath target
#		result: 	path to file containing list of source files for <projectPath>/<target>
#	--help
#		print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. "${CCDev}/bin/resultCodes.ksh"

#^ 1 === top
trapString='errtrap $0 $LINENO'
#trap "$trapString" ERR

scriptpath=""
target=""
basePath=""
project=""
sourcePath=""
lastbuilt=""

#^ 2 === Paths
#^ setPaths
function setPaths {
	projectPath="${1}"
	target="${2}"
	basePath="${projectPath%/*}"
	project="${projectPath##/*/}"
	sourcePath="${projectPath}/${target}"
	targetScript="${sourcePath}/${target##*/}_install.ksh"
		lastbuilt="${CCDev}/build/${project}/${target}.lastbuilt"
}

#^ getPath
function getPath {
	typeset command patharg
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		command="${1}"
		projectPath="${2}"
		target="${3}"
	else
		print "USAGE: ccInstall --get<Path> pathToProject target"
		return $RC_MissingArgument
	fi
	
	setPaths "${projectPath}" "${target}"
	typeset -i index=-1
	case "${command}" in
		"--getBasePath" )		path="${basePath}";;
		"--getSourcePath" )		path="${sourcePath}";;
		"--getTargetScript" )	path="${targetScript}";;
		"--getLastbuilt" )		path="${lastbuilt}";;
		* ) 					return $RC_InvalidParameter;;
	esac
	print "${path}"
}

#^ updateLastbuilt
function updateLastbuilt {
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
		return ${st}
	fi
	mkdir -p "$(dirname ${lastbuilt})"
	print $(basename ${lastbuilt}) $(date) > ${lastbuilt}	
}

#^ clearLastbuilt
function clearLastbuilt {
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
		return ${st}
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		rm "${lastbuilt}"
		st="$?"
		if [[ ${st} > 0 ]] ; then
			print "*** error ${st} attempting to remove file ${lastbuilt}"
			return ${st}
		fi
	fi	
}

#^ 3 === getActions
function getActions {
	typeset -n resultObj=$1
	resultObj=(
		actionString=""
		doClean=0
		doInstall=0
		doTest=0
		doUpload=0
	)

	if [[ -n ${2} ]] ; then
		actionString="${2#-}"
		if [[ ${actionString} = ${2} ]] ; then
			print "$0#$LINENO: actionString $2: expected first character '-'"
			return $RC_SyntaxError
		fi
	else
		actionString="it"
	fi
	resultObj.actionString=${actionString}	
	typeset -i i=${#actionString}
	typeset -i errorCount=0
	while [[ $i > 0 ]] ; do
		ch=$(print ${actionString} | cut -c ${i})
		case "${ch}" in
			"c" )	resultObj.doClean=1;;
			"i" )	resultObj.doInstall=1;;
			"t" )	resultObj.doTest=1;;
			"u" )	resultObj.doUpload=1;;
			* )		errorCount+=1;;
		esac
		i=i-1
	done
	if [[ ${errorCount} > 0 ]] ; then
		print "$0#$LINENO: --getActions ${actionString}: ${errorCount} invalid action flags"
		return $RC_InvalidInput
	fi
}

#^ 5 === Find ...
function findTests {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		projectPath="${1}"
		target="${2}"
	else
		print "USAGE: ccInstall findTests pathToProject target"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile="${CCDev}/tmp/found"
	cd "${projectPath}/${target}"
	find . -type f -and -name "test*.ksh"| sed 's|\./||' > "${iofile}"
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

function findSources {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		projectPath="${1}"
		target="${2}"
	else
		print "USAGE: ccInstall findTests pathToProject target"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile="${CCDev}/tmp/sources"
	cd "${projectPath}/${target}"
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
		return ${st}
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		find . -path '*/.git' -prune -or -type f -newer ${lastbuilt} | grep -v .git | grep -v .DS_Store | grep -v _install.ksh | grep -v '_Tests/*' | sed 's|\./||' > "${iofile}"
	else
		find . -path '*/.git' -prune -or -type f | grep -v .git | grep -v .DS_Store | grep -v _install.ksh | grep -v '_Tests/*' | sed 's|\./||' > "${iofile}"
	fi
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

#^ 7 === processActions
function processActions {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		projectPath="${1}"
		target="${2}"
		actionFlags="${3}"
	else
		print "USAGE: ccInstall processActions pathToProject target [-actionFlags]"
		return $RC_MissingArgument
	fi
	getActions actions ${actionFlags}
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$0#$LINENO: ${msg}"
		return ${st}
	fi

	targetScript=$(ccInstall --getTargetScript "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getTargetScript ${projectPath} ${target} failed"
		return ${st}
	fi

# clean
	if [[ ${actions.doClean} > 0 ]] ; then
		print "== cleaning ${projectPath##*/}/${target}..."
		msg=$("${targetScript}" --cleanTarget)
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "*** ${msg}"
			return ${st}
		fi
		lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
			return ${st}
		fi
		ccInstall --clearLastbuilt "${projectPath}" "${target}"
	fi

# install
	if [[ ${actions.doInstall} > 0 ]] ; then
		print "== installing ${projectPath##*/}/${target}..."
		iofile=$(findSources "${projectPath}" "${target}")
		cd ${projectPath}
		typeset -i failcnt=0
		prevFolder=""
		while read fl ; do
			sourceFolder="${fl%%/*}"
			fpath="${fl#*/}"
			if [[ ! "${prevFolder}" = "${sourceFolder}" ]] ; then
				msg=$("${targetScript}" --getSubtargetDestination "${sourceFolder}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					print "*** ${msg}"
				else
					destination="${msg}"
					prevFolder="${sourceFolder}"
				fi
				if [[ -n "${destination}" ]] ; then
					print "=${projectPath##*/}/${target}/${sourceFolder}:"
				fi
			fi
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				print "*** ${msg}"
			else
				print -n "${fpath}: "
				msg=$("${targetScript}" --handleFile "${sourceFolder}" "${fpath}" "${destination}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					print "*** ${msg}"
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
				case "${action}" in
					"ignore" )
						print "skipped"
						;;
					"copy" )
						print "mkdir -p $(dirname ${destinationForCopy})"
						mkdir -p $(dirname "${destinationForCopy}")
						st=$?
						if [[ $st > 0 ]] ; then
							failcnt="${failcnt}"+1
							print "*** could not create directory $(dirname ${destinationForCopy})"
						else
							cp "${sourceForCopy}" "${destinationForCopy}"
							st=$?
							if [[ $st > 0 ]] ; then
								failcnt="${failcnt}"+1
								print "*** could not copy to ${destinationForCopy}"
							else
								print "copied to ${destinationForCopy}"
							fi
						fi
						;;
					* )
						print "*** Unrecognized action string ${action}"
						;;
				esac
			fi
		done < "${iofile}"
		if [[ ${failcnt} = 0 ]] ; then
			ccInstall --updateLastbuilt "${projectPath}" "${target}"
			print "build succeeded"
		else
			pl="s"
			if [[ ${failcnt} = 1 ]] ; then
				pl=""
			fi
			print "*** Build Failed: ${errcnt} error${pl} encountered; tests not run"
			exit "${failcnt}"
		fi
	fi

# test
	if [[ ${actions.doTest} > 0 ]] ; then
		iofile=$(findTests "${projectPath}" "${target}")
		cd ${projectPath}
		typeset -i failcnt=0

		while read ln ; do
			print "== ${target}/${ln}"
			trap "" ERR
			"${target}/${ln}"
			st=$?
			trap "$trapString" ERR
			if [[ "${st}" > 0 ]] ; then
				failcnt="${failcnt}"+1
			fi
			results="${msg}${result}\n"
		done < "${iofile}"

		print "${results}"
		exit "${failcnt}"
	fi
}

#^ 8 === ccInstall
function ccInstall {
	if [[ $# = 0 ]] ; then
		print "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--getActions" )
			getActions "${2}" "${3}"
			return $?
			;;
		"--get"* )
			val=$(getPath "${1}" "${2}" "${3}")
			es=$?
			print "${val}"
			return "${es}"
			;;
		"--help" )
			print "${HELP}"
			;;
		"--findTests" )
			msg=$(findTests "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--findSources" )
			msg=$(findSources "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--updateLastbuilt" )
			msg=$(updateLastbuilt "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--clearLastbuilt" )
			msg=$(clearLastbuilt "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			msg=$(processActions "${1}" "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
	esac
	return 0
}

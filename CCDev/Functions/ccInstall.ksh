#!/bin/ksh

#  ccInstall.func
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='ccInstall -- installation script and supporting functions'
USAGE='
ccInstall project target [actionFlags]
#	build the specified project target
#		actionFlags: [-[citu]+] - actions requested (clean, install, test, upload); default: -it
ccInstall commandFlag [argument(s)]
#	--getActions resultObject [actionString]
#		actionString: [-[citu]+] - actions requested (clean, install, test, upload)
#			default: -it
#			resultObject: object to contain results
#	--help
#		print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

#^ 1 === top
trapString='errtrap $0 $LINENO'
#trap "$trapString" ERR

RC_SyntaxError=10
RC_MissingArgument=11
RC_InvalidArgument=12
RC_InvalidInput=13

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
		"--getBasePath" )	path="${basePath}";;
		"--getSourcePath" )	path="${sourcePath}";;
		"--getLastbuilt" )	path="${lastbuilt}";;
		* ) 				return $RC_InvalidParameter;;
	esac
	print "${path}"
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
	fl="${CCDev}/tmp/found"
	cd "${projectPath}/${target}"
	find . -type f -and -name "test*.ksh"| sed 's|\./||' > "${fl}"
	chmod a+r "${fl}"
	cd "${origdir}"

	print "${fl}"
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

# test
	if [[ ${actions.doTest} > 0 ]] ; then
		fl=$(findTests "${projectPath}" "${target}")
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
		done < "${fl}"

		exit "${failcnt}"
	fi
	print "${results}"
}

#^ 8 === ccInstall projectPath target [-[citu]+]
function ccInstall {
#*** temporary
	cp ${HOME}/Dev/Support/CCDev/Functions/ccInstall.ksh ${FPATH}/ccInstall		# install new installer first
	cp ${HOME}/Dev/Support/CCDev/Scripts/cleanProjectTarget.ksh ${CCDev}/bin/cleanProjectTarget
	chmod a+x ${CCDev}/bin/cleanProjectTarget
#*
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

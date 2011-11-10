#!/bin/ksh

#  ccInstall.func
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='ccInstall -- provides functions that support install scripts'
USAGE='ccInstall commandFlag ...
#		commandFlag: see descriptions below
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

#^ setPaths
function setPaths {
	scriptpath="${1}"
	target="$(basename ${scriptpath%_install.ksh})"
	basePath="${scriptpath%/*/${target}_install.ksh}"
	project="${basePath##/*/}"
	sourcePath="${basePath}/${target}"
	lastbuilt="${CCDev}/build/${project}/${target}.lastbuilt"
}

#^ getPath
function getPath {
	typeset command patharg
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		command="${1}"
		patharg="${2}"
	else
		print "USAGE: ccInstall --get<Path> pathToInstallScript"
		return $RC_MissingArgument
	fi
	
	setPaths "${patharg}"
	typeset -i index=-1
	case "${command}" in
		"--getBasePath" )	path="${basePath}";;
		"--getSourcePath" )	path="${sourcePath}";;
		"--getLastbuilt" )	path="${lastbuilt}";;
		* ) 				return $RC_InvalidParameter;;
	esac
	print "${path}"
}

#^ 2 === getActions
function getActions {
	typeset -n resultObj=$1
	resultObj=(
		actionString=""
		doClean=0
		doInstall=0
		doTest=0
		doUpload=0
		errorCount=0
		errorMessage=""
		resultTag=""
		resultString=""
	)
	resultCode=0

	if [[ -n ${2} ]] ; then
		actionString="${2#-}"
		if [[ ${actionString} = ${2} ]] ; then
			resultObj.resultTag="err_SyntaxError"
			resultObj.errorMessage="actionString $2: expected first character '-'"
			resultCode=$RC_SyntaxError
		fi
	else
		actionString="it"
	fi
	resultObj.actionString=${actionString}

	if [[ ${resultCode} = 0 ]] ; then
		typeset -i i=${#actionString}
		typeset -i errorCount
		while [[ $i > 0 ]] ; do
			ch=$(print ${actionString} | cut -c ${i})
			case "${ch}" in
				"c" )	resultObj.doClean=1;;
				"i" )	resultObj.doInstall=1;;
				"t" )	resultObj.doTest=1;;
				"u" )	resultObj.doUpload=1;;
				* )		if [[ ${resultObj.errorCount} = 0 ]] ; then
							resultObj.resultTag="err_InvalidInput"
							errorString='invalid action flag '"${ch}"
						fi
						errorCount+=1
						resultCode=$RC_InvalidInput
						;;
			esac
			i=i-1
		done
		if [[ errorCount > 0 ]] ; then
			resultObj.errorMessage='ccInstall --getActions: '"${errorString}"
			resultObj.errorCount=$errorCount
		fi
	fi

	return $resultCode
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
			val=$(getPath "${1}" "${2}")
			es=$?
			print "${val}"
			return "${es}"
			;;
		"--help" )
			print "${HELP}"
			;;
		* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
	esac
	return 0
}

#!/bin/ksh

#  errcc
#  Support
#
#  Created by Carol Clark on 5/10/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark === Markers ===
# 1 errorMessage; 2 errorExit; 8 errcc

NAME='errcc -- error handling'
USAGE='
errorMessage	[errorCode [location [message]]]
#		errorCode:	numeric error code
#						if errorCode is defined in resultCodes, message includes text equivalent
#						if errorCode is not a number, it is ignored
#		location: 	source file and line ($0#$LINENO)
#		message:	string to be displayed; default "Error encountered"
#	construct and return message based on arguments provided
errorExit		[errorCode [location [message]]]
#	construct errorMessage and print to stderr; exit with nonzero value (errorCode if supplied)
#	NOTE: running this from Terminal exits the current shell process; quit and restart Terminal
Note: to avoid generating new errors, these methods do not provide direct feedback for invalid arguments
errcc			subcommand
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

HOME="/Users/carolclark"
CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/resultCodes"

#pragma mark 1 === errorMessage
function errorMessage {
	location=""
	errorInfo=""
	message=""
	sp1=""
	sp2=""
	errorCode="$1"
	[[ $errorCode -ne 0 ]] || errorCode=$RC_UnknownError
	errorInfo="$(errorCodeText $errorCode)"
	if [[ $# > 0 ]] ; then
		if [[ $# > 1 ]] ; then
			location="$2"
			[[ -n ${errorInfo} ]] && sp2=" "
		fi
		if [[ $# > 	2 ]] ; then
			message="$3"
			sp1=" "
		fi
	fi
	echo "$location$sp1$message$sp2$errorInfo"
	return $errorCode
}

#pragma mark 2 === errorExit
function errorExit {
	errorMessage "$1" "$2" "$3" 1>&2
	exit $?
}

#pragma mark 6 === errorCodeText
function errorCodeText {
	errorCode=$1
	if [[ $((${errorCode})) > 0 ]] ; then
		case "${errorCode}" in
			$RC_SyntaxError );	echo "[RC_SyntaxError:#$RC_SyntaxError]"	;;
			$RC_MissingArgument );	echo "[RC_MissingArgument:#$RC_MissingArgument]"	;;
			$RC_InvalidArgument );	echo "[RC_InvalidArgument:#$RC_InvalidArgument]"	;;
			$RC_InvalidInput );	echo "[RC_InvalidInput:#$RC_InvalidInput]"	;;
			$RC_InputNotHandled );	echo "[RC_InputNotHandled:#$RC_InputNotHandled]"	;;
			$RC_NoSuchFileOrDirectory );	echo "[RC_NoSuchFileOrDirectory:#$RC_NoSuchFileOrDirectory]"	;;
			$RC_UnknownError );	echo "[RC_UnknownError:#$RC_UnknownError]"	;;
			$RC_CURLError ); echo "[RC_CURLError:#$RC_CURLError]" ;;
			* );	echo "[UnknownErrorCode:#$errorCode]"	;;
		esac
	else
		echo ""
	fi
}

#pragma mark 8 === errcc
function errcc {
	if [[ $# = 0 ]] ; then
		print "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--help" )
			echo "${HELP}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			echo "${HELP}"
			;;
	esac
	return 0
}

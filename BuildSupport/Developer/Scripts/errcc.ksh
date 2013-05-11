#!/bin/ksh

#  errsig
#  Support
#
#  Created by Carol Clark on 5/10/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark === Markers ===
# 1 errorMessage; 2 errorExit; 8 errsig

NAME='errsig -- error and signal handling'
USAGE='
errorMessage	location [message [errorCode]]
#		location: 	source file and line ($0#$LINENO)
#		message:	string to be displayed; default "Error encountered"
#		errorCode:	numeric error code
#						if errorCode is defined in resultCodes.ksh, message includes text equivalent
#						if errorCode is not a number, it is ignored
#	construct and return message based on arguments provided
errorExit	location [message [errorCode]]
#	construct errorMessage and print to stderr; exit with nonzero value (errorCode if supplied)
Note: to avoid generating new errors, these methods do not provide direct feedback for invalid arguments
errsig			subcommand
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. resultCodes

#pragma mark 1 === errorMessage
function errorMessage {
	location="[UnknownFile#Line]:"
	errorInfo=""
	message=""
	if [[ $# > 0 ]] ; then
		location="$1"
	fi
	if [[ $# > 1 ]] ; then
		message="$2"
	fi
	if [[ $# > 2 ]] ; then
		errorCode=$3
		errorCodeText=""
		if [[ $((${errorCode})) > 0 ]] ; then
			case "${errorCode}" in
				$RC_SyntaxError )
					errorCodeText="RC_SyntaxError"
					;;
				$RC_MissingArgument )
					errorCodeText="RC_MissingArgument"
					;;
				$RC_InvalidArgument )
					errorCodeText="RC_InvalidArgument"
					;;
				$RC_InvalidArgument )
					errorCodeText="RC_InvalidArgument"
					;;
				$RC_InvalidInput )
					errorCodeText="RC_InvalidInput"
					;;
				$RC_InputNotHandled )
					errorCodeText="RC_InputNotHandled"
					;;
				$RC_NoSuchDirectory )
					errorCodeText="RC_NoSuchDirectory"
					;;
				* )
					errorCodeText="UnknownErrorCode"
					;;
			esac
			errorInfo=" [$errorCodeText:#$errorCode]"
		fi
	fi
	echo "$location $message$errorInfo"
	exit 0
}

#pragma mark 2 === errorExit
function errorExit {
	echo $(errorMessage "$1" "$2" "$3" 1>&2)
	errorCode="$3"
	if [[ $((${errorCode})) = 0 ]] ; then
		errorCode=255
	fi
	exit $errorCode
}

#pragma mark 8 === errsig
function errsig {
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

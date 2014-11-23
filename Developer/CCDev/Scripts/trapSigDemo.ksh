#!/bin/ksh

#  trapSigDemo
#  Support

#  Created by Carol Clark on 5/10/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='
# trapSigDemo -- demonstrates detection of interrupts including control-C
'
USAGE='
trapSigDemo -- <no args>
#	use from command line to enter an infinite loop that can interrupted with control-C
#	WARNING: technique is for use only in scripts, not in function files that are dotted in
#		once the file is dotted in, the signal stays trapped until Terminal is closed
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

#pragma mark 0 === Top

function cleanUp {
	echo "loop interrupted"
	exit 0
}
trap cleanUp SIGHUP SIGINT SIGTERM

#pragma mark 8 === trapSigDemo
if [[ $# > 0 ]] ; then
	case "${1}" in
		"--help" )
			print "${HELP}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			print "${HELP}"
			;;
	esac
	return 0
else
	echo "you must interrupt this loop with control-C to stop it" >&1
	x=0
	while [[ 0 = 0 ]] ; do
		x=x+1
	done
	return 0
fi

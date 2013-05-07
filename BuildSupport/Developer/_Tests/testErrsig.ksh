#!/bin/ksh

#  testErrsig.ksh
#  Support
#
#  Created by Carol Clark on 5/6/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top

function errorExit {
	echo $1 1>&2
	exit 1
}

testErrorExit() {
	# verify error message content
	errmsg="This is an error."
	msg=$(errorExit "$errmsg" 2>&1)
	assertEquals "$(basename $0)#$LINENO:" "$errmsg" "$msg"

	# verify error message sent to stderr
	msg=$(errorExit "EXPECTED ERROR: $errmsg")
	assertEquals "$(basename $0)#$LINENO:" "" "$msg"
}

# load shunit2
. ${SHUnit}

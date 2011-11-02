#!/bin/ksh

#  testCCDev.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#^	ccInstall
testCcInstall() {
	ccInstall > /dev/null
	assertEquals "$LINENO: " $RC_InsufficientArguments $?

	ccInstall --help result
	assertEquals "$LINENO: " "helpString" "${result.resultTag}"

	ccInstall --xxx result
	assertEquals "$LINENO: " $RC_InvalidActionParameter $?
	assertEquals "$LINENO: " "err_InvalidActionParameter" "${result.resultTag}"

	ccInstall --getActions result
	assertEquals "$LINENO: " 0 $?
	assertEquals "$LINENO: " "-it" ${result.actionString}
	assertEquals "$LINENO: " "err_Hello" ${result.resultTag}
}

# load shunit2
. ${SHUnit}

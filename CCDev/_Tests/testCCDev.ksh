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
	assertEquals "$LINENO: RC_InsufficientArguments expected" $RC_InsufficientArguments $?

	ccInstall --help result
	assertEquals "$LINENO: incorrect resultTag for action param '--help': " "helpString" "${result.resultTag}"

	ccInstall --xxx result
	assertEquals "$LINENO: incorrect return code for action param '--xxx': " $RC_InvalidCommandParameter $?
	assertEquals "$LINENO: incorrect resultTag for action param '--xxx': " "err_InvalidActionParameter" "${result.resultTag}"

	ccInstall --getActions result
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect default action string: " "it" "${result.actionString}"

	ccInstall --getActions result abc
	st=$?
	assertEquals "$LINENO: expected result code RC_SyntaxError: " $RC_SyntaxError $st
	assertEquals "$LINENO: expected resultTag err_SyntaxError: " "err_SyntaxError" "${result.resultTag}"

	ccInstall --getActions result -ciu
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result -ciu' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$LINENO: expected doInstall=1: " 1 "${result.doInstall}"
	assertEquals "$LINENO: expected doTest=0: " 0 "${result.doTest}"

	ccInstall --getActions result -xyz
	st=$?
	assertEquals "$LINENO: RC_InvalidActionFlag expected" $RC_InvalidActionFlag $st
	assertEquals "$LINENO: expected resultTag err_InvalidActionFlag: " "err_InvalidActionFlag" "${result.resultTag}"
	assertEquals "$LINENO: incorrect error count" 3 "${result.errorCount}"
}

# load shunit2
. ${SHUnit}

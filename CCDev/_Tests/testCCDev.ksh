#!/bin/ksh

#  testCCDev.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#^	1 === ccInstall
testCciGeneral() {
	typeset str

	ccInstall > /dev/null
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument $?

	typeset str=$(ccInstall --help result)
	st=$?
	assertEquals "$LINENO: 'ccInstall --help' failed with code $st" 0 $st
	assertNotNull "$LINENO: empty help string: " "${str}"

	str=$(ccInstall --xxx)
	assertEquals "$LINENO: incorrect return code for action param '--xxx': " $RC_InvalidArgument $?
	assertNotNull "$LINENO: empty error string: " "${str}"
}

#^ --getActions
testCciGetActions() {
	typeset str

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
	assertEquals "$LINENO: RC_InvalidInput expected" $RC_InvalidInput $st
	assertEquals "$LINENO: expected resultTag err_InvalidActionFlag: " "err_InvalidInput" "${result.resultTag}"
	assertEquals "$LINENO: incorrect error count" 3 "${result.errorCount}"
}


#^ Paths
testCciPaths() {
	str=$(ccInstall --getBasePath)
	st=$?
	assertEquals "$LINENO: expected error RC_MissingArgument" $RC_MissingArgument "${st}"

	scriptPath="${CCDev}/TestData/A/A_install.ksh"		# not a real file
	str=$(ccInstall --getBasePath "${scriptPath}")
	assertEquals "$LINENO: incorrect base path: " "${CCDev}/TestData" "${str}"
	str=$(ccInstall --getSourcePath "${scriptPath}")
	assertEquals "$LINENO: incorrect source path: " "${CCDev}/TestData/A" "${str}"
	str=$(ccInstall --getLastbuilt "${scriptPath}")
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/TestData/A.lastbuilt" "${str}"
}

# load shunit2
. ${SHUnit}

#!/bin/ksh

#  testDoxygenInstall.ksh
#  Support
#
#  Created by Carol Clark on 1/30/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

setUp() {
	workspaceRoot="${DEV}/Support"
	target="BuildSupport/Doxygen"
}

. "${CCDev}/bin/resultCodes.ksh"
. "${CCDev}/bin/ccInstall"

testTargetName() {
	assertEquals "$LINENO: " 1 1
	targetScript=$(ccInstall --getTargetScript "${workspaceRoot}" "${target}")
	assertEquals "$LINENO: incorrect target" "${targetScript}" "${workspaceRoot}/${target}/Doxygen_install.ksh"

	str=$(ccInstall --getBasePath)
	st=$?
	assertEquals "$LINENO: expected error RC_MissingArgument" $RC_MissingArgument "${st}"

	str=$(ccInstall --getBasePath "${workspaceRoot}" "${target}")
	st=$?
	assertEquals "$LINENO: ${str}" 0 "${st}"
	assertEquals "$LINENO: incorrect base path: " "${DEV}" "${str}"
	str=$(ccInstall --getSourcePath "${DEV}/Support" "${target}")
	assertEquals "$LINENO: incorrect source path: " "${DEV}/Support/BuildSupport/Doxygen" "${str}"
	str=$(ccInstall --getTargetScript "${workspaceRoot}" "${target}")
	assertEquals "$LINENO: incorrect target script: " "${DEV}/Support/BuildSupport/Doxygen/Doxygen_install.ksh" "${str}"
	lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${target}")
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/Support/BuildSupport/Doxygen.lastbuilt" "${lastbuilt}"
	ccInstall --updateLastbuilt "${workspaceRoot}" "${target}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${workspaceRoot}" "${target}"
	assertFalse "$LINENO: file ${lastbuilt} still present" "[ -e ${lastbuilt} ]"

	targetName=$(ccInstall --getTargetName "${workspaceRoot}" "${target}")
	assertEquals "$LINENO: incorrect target name" "${targetName}" "Doxygen"
}

testDoxygenGetActions() {
	typeset str

	ccInstall --getActions result "${workspaceRoot}" "${target}"
	st=$?
	assertEquals "$0#$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$0#$LINENO: incorrect default action string: " "it" "${result.actionString}"

	str=$(ccInstall --getActions result "${workspaceRoot}" "${target}" abc)
	st=$?
	assertEquals "$0#$LINENO: expected result code RC_SyntaxError: " $RC_SyntaxError $st
	assertNotNull "$0#$LINENO: expected error message" "${str}"

	ccInstall --getActions result "${workspaceRoot}" "${target}" -ciu
	st=$?
	assertEquals "$0#$LINENO: 'ccInstall --getActions result -ciu' failed with code $st" 0 $st
	assertEquals "$0#$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$0#$LINENO: expected doInstall=0: " 0 "${result.doInstall}"
	assertEquals "$0#$LINENO: expected doDoxygen=1: " 1 "${result.doDoxygen}"
	assertEquals "$0#$LINENO: expected doTest=0: " 0 "${result.doTest}"

	str=$(ccInstall --getActions result "${workspaceRoot}" "${target}" -xyz)
	st=$?
	assertEquals "$0#$LINENO: RC_InvalidInput expected" $RC_InvalidInput "${st}"
	assertNotNull "$0#$LINENO: error message expected" "${str}"
	errstr="--getActions xyz: 3 invalid action flags"
	assertNotEquals "$0#$LINENO: incorrect error message" "${str%${errstr}}" "${str}"
}


# load shunit2
. ${SHUnit}

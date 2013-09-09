#!/bin/ksh

#  testDoxygenInstall.ksh
#  Support
#
#  Created by Carol Clark on 1/30/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

setUp() {
	sourceRoot="${DEV}/Support/BuildSupport"
	targetFolder="Doxygen"

	arg1="${sourceRoot}"
	arg2="${targetFolder}"
}

. "${CCDev}/bin/resultCodes.ksh"
. "${CCDev}/bin/ccInstall"

testTargetName() {
	assertEquals "$LINENO: " 1 1
	targetScript=$(ccInstall --getTargetScript "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect target script" "${targetScript}" "${arg1}/${arg2}/Doxygen_install.ksh"

	str=$(ccInstall --getTargetScript)
	st=$?
	assertEquals "$LINENO: expected error RC_MissingArgument" $RC_MissingArgument "${st}"

	str=$(ccInstall --getTargetScript "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect target script: " "${DEV}/Support/BuildSupport/Doxygen/Doxygen_install.ksh" "${str}"
	sourceRoot=$(ccInstall --getSourceRoot "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect sourceRoot: " "${DEV}/Support/BuildSupport" "${sourceRoot}"
	workspacePath=$(ccInstall --getWorkspacePath "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect workspacePath: " "${DEV}/Support" "${workspacePath}"
	workspaceName=$(ccInstall --getWorkspaceName "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect workspaceName: " "Support" "${workspaceName}"
	lastbuilt=$(ccInstall --getLastbuilt "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/Support/BuildSupport/Doxygen.lastbuilt" "${lastbuilt}"
	ccInstall --updateLastbuilt "${arg1}" "${arg2}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${arg1}" "${arg2}"
	assertFalse "$LINENO: file ${lastbuilt} still present" "[ -e ${lastbuilt} ]"

	targetName=$(ccInstall --getTargetName "${arg1}" "${arg2}")
	assertEquals "$LINENO: incorrect target name" "${targetName}" "Doxygen"
}

testDoxygenGetActions() {
	typeset str

	ccInstall --getActions result "${arg1}" "${arg2}"
	st=$?
	assertEquals "$0#$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$0#$LINENO: incorrect default action string: " "it" "${result.actionString}"

	ccInstall --getActions result "${arg1}" "${arg2}" -ciu
	st=$?
	assertEquals "$0#$LINENO: 'ccInstall --getActions result -ciu' failed with code $st" 0 $st
	assertEquals "$0#$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$0#$LINENO: expected doInstall=0: " 0 "${result.doInstall}"
	assertEquals "$0#$LINENO: expected doDoxygen=1: " 1 "${result.doDoxygen}"
	assertEquals "$0#$LINENO: expected doTest=0: " 0 "${result.doTest}"

	str=$(ccInstall --getActions result "${arg1}" "${arg2}" -xyz)
	st=$?
	assertEquals "$0#$LINENO: RC_InvalidInput expected" $RC_InvalidInput "${st}"
	assertNotNull "$0#$LINENO: error message expected" "${str}"
	errstr="--getActions xyz: 3 invalid action flags"
	assertNotEquals "$0#$LINENO: incorrect error message" "${str%${errstr}}" "${str}"
}


# load shunit2
. ${SHUnit}

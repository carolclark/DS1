#!/bin/ksh

#  testDoxygenInstall.ksh
#  Support
#
#  Created by Carol Clark on 1/30/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

. "${CCDev}/bin/ccInstall"

setUp() {
	DEV="$(ccInstall --DEV ${USER})"
	sourceRoot="${DEV}/Support/BuildSupport"
	targetFolder="Doxygen"
}

testTargetName() {
	assertEquals "$LINENO: " 1 1
	targetScript=$(ccInstall --getTargetScript "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect target script" "${targetScript}" "${sourceRoot}/${targetFolder}/Doxygen_install.ksh"

	str=$(ccInstall --getTargetScript)
	st=$?
	assertEquals "$LINENO: expected error RC_MissingArgument" $RC_MissingArgument "${st}"

	str=$(ccInstall --getTargetScript "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect target script: " "${DEV}/Support/BuildSupport/Doxygen/Doxygen_install.ksh" "${str}"
	sourceRoot=$(ccInstall --getSourceRoot "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect sourceRoot: " "${DEV}/Support/BuildSupport" "${sourceRoot}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/Support/BuildSupport/Doxygen.lastbuilt" "${lastbuilt}"
	ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	assertFalse "$LINENO: file ${lastbuilt} still present" "[ -e ${lastbuilt} ]"

	targetName=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect target name" "${targetName}" "Doxygen"
}

testDoxygenGetActions() {
	typeset str

	ccInstall --getActions result "${sourceRoot}" "${targetFolder}"
	st=$?
	assertEquals "$0#$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$0#$LINENO: incorrect default action string: " "it" "${result.actionString}"

	str=$(ccInstall --getActions result "${sourceRoot}" "${targetFolder}" abc)
	st=$?
	assertEquals "$0#$LINENO: expected result code RC_SyntaxError: " $RC_SyntaxError $st
	assertNotNull "$0#$LINENO: expected error message" "${str}"

	ccInstall --getActions result "${sourceRoot}" "${targetFolder}" -ciu
	st=$?
	assertEquals "$0#$LINENO: 'ccInstall --getActions result -ciu' failed with code $st" 0 $st
	assertEquals "$0#$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$0#$LINENO: expected doInstall=0: " 0 "${result.doInstall}"
	assertEquals "$0#$LINENO: expected doDoxygen=1: " 1 "${result.doDoxygen}"
	assertEquals "$0#$LINENO: expected doTest=0: " 0 "${result.doTest}"

	str=$(ccInstall --getActions result "${sourceRoot}" "${targetFolder}" -xyz)
	st=$?
	assertEquals "$0#$LINENO: RC_InvalidInput expected" $RC_InvalidInput "${st}"
	assertNotNull "$0#$LINENO: error message expected" "${str}"
	errstr="--getActions xyz: 3 invalid action flags \[RC_InvalidInput:#67]"
	assertNotEquals "$0#$LINENO: incorrect error message" "${str%${errstr}}" "${str}"
}


# run tests
. $(ccInstall --SHUnit)

#!/bin/ksh

#  testDoxygenInstall.ksh
#  Support
#
#  Created by Carol Clark on 1/30/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

setUp() {
	DEV="$(ccInstall --DEV ${USER})"
	sourceRoot="${DEV}/Support/BuildSupport"
	targetFolder="Doxygen"
}

testTargetName() {
	sourceRoot=$(ccInstall --getSourceRoot "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect sourceRoot: " "${DEV}/Support/BuildSupport" "${sourceRoot}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build_output/Support/BuildSupport/Doxygen.lastbuilt" "${lastbuilt}"
	ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	assertFalse "$LINENO: file ${lastbuilt} still present" "[ -e ${lastbuilt} ]"

	targetName=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
	assertEquals "$LINENO: incorrect target name" "${targetName}" "Doxygen"
}

# run tests
. $(ccInstall --SHUnit)

#!/bin/ksh

#  testCCDev.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

. "${CCDev}/bin/resultCodes.ksh"

#^ CCDev_install.ksh
testCCDevInstall() {
	str=$(${HOME}/Dev/Support/CCDev/CCDev_install.ksh)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument ${st}

	str=$(${HOME}/Dev/Support/CCDev/CCDev_install.ksh --getSubtargetDestination)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination (no args): " $RC_MissingArgument ${st}
	str=$(${HOME}/Dev/Support/CCDev/CCDev_install.ksh --getSubtargetDestination xxx)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination xxx: " $RC_InputNotHandled ${st}

	str=$(${HOME}/Dev/Support/CCDev/CCDev_install.ksh --handleFile)
	st=$?
	assertEquals "$LINENO: --handleFile (no args): " $RC_MissingArgument ${st}	
	
	targetScript=$(ccInstall --getTargetScript "${HOME}/Dev/Support" "CCDev")
	assertEquals "$LINENO: incorrect target script: " "${HOME}/Dev/Support/CCDev/CCDev_install.ksh" "${targetScript}"
	# test Functions/ccInstall.ksh
	dest=$("${targetScript}" --getSubtargetDestination Functions)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination Functions: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination Functions" "${CCDev}/func" "${dest}"
	fl=$(${HOME}/Dev/Support/CCDev/CCDev_install.ksh --handleFile "Functions" "ccInstall.ksh" "${dest}")
	st=$?
	assertEquals "$LINENO: --handleFile failed with code $st" 0 $st
	set -A copyInfo
	while read ln ; do
		copyInfo+=("${ln}")
	done < "${fl}"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertEquals "$LINENO: incorrect action: " "copy" "${copyInfo[0]}"
	assertEquals "$LINENO: incorrect sourceForCopy: " "${HOME}/Dev/Support/CCDev/Functions/ccInstall.ksh" "${copyInfo[1]}"
	assertEquals "$LINENO: incorrect destinationForCopy: " "${CCDev}/func/ccInstall" "${copyInfo[2]}"

	# test Environment/kshrc.ksh
	dest=$("${targetScript}" --getSubtargetDestination Environment)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination Environment: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination Environment" "" "${dest}"
	fl=$(${HOME}/Dev/Support/CCDev/CCDev_install.ksh --handleFile "Environment" "kshrc.ksh" "${dest}")
	st=$?
	assertEquals "$LINENO: --handleFile failed with code $st" 0 $st
	set -A copyInfo
	while read ln ; do
		copyInfo+=("${ln}")
	done < "${fl}"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertEquals "$LINENO: incorrect action: " "ignore" "${copyInfo[0]}"
}

#^ Installation.ksh
testInstallation() {
	testData="${CCDev}/TestData"
	# Scripts/cleanProjectTarget
	fl="${CCDev}/bin/cleanProjectTarget"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script cleanProjectTarget missing" 
	fi
}

# load shunit2
. ${SHUnit}

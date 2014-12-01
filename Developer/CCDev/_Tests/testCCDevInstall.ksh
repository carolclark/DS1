#!/bin/ksh

#  testCCDev.ksh
#  Support/Developer
#
#  Created by Carol Clark on 11/24/2014.
#  Copyright 2011-14 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

myDir="${0%/*}"
theScript="${myDir%/*}/CCDev_install.ksh"

#pragma mark 1 === test installation
testInstallation() {
	testData="${CCDev}/TestData"
	assertEquals "$LINENO: incorrect "'$SHELL' /bin/ksh $(launchctl getenv SHELL)

	# Scripts/errcc
	fl="${CCDev}/bin/errcc"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script errcc missing"
	fi
	# Scripts/archive
	fl="${CCDev}/bin/archive"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script archive missing"
	fi

}

#pragma mark 2 === test variable values
testTargetVars() {
	assertEquals "$LINENO: script to be tested" "${HOME}/Dev/Support/Developer/CCDev/CCDev_install.ksh" "${theScript}"
	assertTrue "$LINENO: script CCDev_install.ksh not found" "[ -e ${theScript} ]"
}

#pragma mark 3 === test --getSubtargetDestination and --prepareFileOperation results
testFunctionResults() {
	DEV=$(ccInstall --DEV ${USER})
	installScript="${DEV}/Support/Developer/CCDev/CCDev_install.ksh"
	str=$(${installScript})
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument ${st}

	str=$(${installScript} --getSubtargetDestination)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination (no args): " $RC_MissingArgument ${st}
	str=$(${installScript} --getSubtargetDestination ${DEV}/Support/Developer Developer -i xxx)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination ${DEV}/Support/Developer CCDev -i xxx: " $RC_InputNotHandled ${st}

	str=$(${installScript} --prepareFileOperation)
	st=$?
	assertEquals "$LINENO: --prepareFileOperation (no args): " $RC_MissingArgument ${st}

	# test Scripts/ccInstall.ksh
	dest=$("${installScript}" --getSubtargetDestination ${DEV}/Support/Developer CCDev -i  Scripts)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination ${DEV}/Support/Developer CCDev -i  Scripts: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination ${DEV}/Support/Developer CCDev -i  Scripts" "${CCDev}/bin" "${dest}"
	fl=$(${installScript} --prepareFileOperation "${DEV}/Support/Developer" "CCDev" "-i" "Scripts" "ccInstall.ksh" "${dest}")
	st=$?
	assertEquals "$LINENO: --prepareFileOperation failed with code $st" 0 $st
	set -A copyInfo
	while read ln ; do
		copyInfo+=("${ln}")
	done < "${fl}"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertEquals "$LINENO: incorrect action: " "copy" "${copyInfo[0]}"
	assertEquals "$LINENO: incorrect sourceForCopy: " "${DEV}/Support/Developer/CCDev/Scripts/ccInstall.ksh" "${copyInfo[1]}"
	assertEquals "$LINENO: incorrect destinationForCopy: " "${CCDev}/bin/ccInstall" "${copyInfo[2]}"

	# test AppleScripts/FixWindow.applescript
	dest=$("${installScript}" --getSubtargetDestination ${DEV}/Support/Developer CCDev∫q22 -i  AppleScripts)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination AppleScripts: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination AppleScripts" "${HOME}/Library/Scripts/Developer" "${dest}"
	fl=$(${installScript} --prepareFileOperation 0 0 0 "AppleScripts" "FixWindow.applescript" "${dest}")
	st=$?
	assertEquals "$LINENO: --prepareFileOperation failed with code $st" 0 $st
	set -A copyInfo
	while read ln ; do
		copyInfo+=("${ln}")
	done < "${fl}"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertEquals "$LINENO: incorrect action: " "copy" "${copyInfo[0]}"
}

# run tests
. $(ccInstall --SHUnit)

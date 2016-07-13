#!/bin/ksh

#  testDeveloper.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright (c) 2011-16 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ Installation
testInstallation() {
	testData="${CCDev}/TestData"
	assertEquals "$LINENO: incorrect "'$SHELL' /bin/ksh $(launchctl getenv SHELL)

	# Scripts/errcc
	fl="${CCDev}/bin/errcc"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script errcc missing"
	fi

}

#^ Developer_install.ksh
testDeveloperInstall() {
	logger "$0#$LINENO: directory: $(pwd) #pwd"
	DEV=$(ccInstall --DEV ${USER})
	assertEquals "$LINENO: expected '/Users/carolclark/Dev'; got $DEV" "/Users/carolclark/Dev" "$DEV"
	callbackScript="${DEV}/Support/Developer/Developer/Developer_install.ksh"
	str=$(${callbackScript})
	st=$?
	if [[ ${str} != ${callbackScript}* ]] ; then
		assertEquals "$LINENO: expected ${callbackScript}...; got $str" "${callbackScript}" "$str"
	fi
	assertEquals "$LINENO: RC_MissingArgument expected; callbackScript: $str" $RC_MissingArgument ${st}

	str=$(${callbackScript} --getSubtargetDestination)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination (no args): " $RC_MissingArgument ${st}
	str=$(${callbackScript} --getSubtargetDestination ${DEV}/Support/Developer Developer -i xxx)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination ${DEV}/Support/Developer Developer -i xxx: " $RC_InputNotHandled ${st}

	str=$(${callbackScript} --prepareFileOperation)
	st=$?
	assertEquals "$LINENO: --prepareFileOperation (no args): " $RC_MissingArgument ${st}

	# test Scripts/ccInstall.ksh
	dest=$("${callbackScript}" --getSubtargetDestination ${DEV}/Support/Developer Developer -i  Scripts)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination ${DEV}/Support/Developer Developer -i  Scripts: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination ${DEV}/Support/Developer Developer -i  Scripts" "${CCDev}/bin" "${dest}"
	fl=$(${callbackScript} --prepareFileOperation "${DEV}/Support/Developer" "Developer" "-i" "Scripts" "ccInstall.ksh" "${dest}")
	st=$?
	assertEquals "$LINENO: --prepareFileOperation failed with code $st" 0 $st
	set -A copyInfo
	while read ln ; do
		copyInfo+=("${ln}")
	done < "${fl}"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertEquals "$LINENO: incorrect action: " "copy" "${copyInfo[0]}"
	assertEquals "$LINENO: incorrect sourceForCopy: " "${DEV}/Support/Developer/Developer/Scripts/ccInstall.ksh" "${copyInfo[1]}"
	assertEquals "$LINENO: incorrect destinationForCopy: " "${CCDev}/bin/ccInstall" "${copyInfo[2]}"

	# test AppleScripts/FixWindow.applescript
	dest=$("${callbackScript}" --getSubtargetDestination ${DEV}/Support/Developer Developer -i  AppleScripts)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination AppleScripts: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination AppleScripts" "${HOME}/Library/Scripts/Developer" "${dest}"
	fl=$(${callbackScript} --prepareFileOperation 0 0 0 "AppleScripts" "FixWindow.applescript" "${dest}")
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

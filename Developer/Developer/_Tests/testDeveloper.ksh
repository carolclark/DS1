#!/bin/ksh

#  testDeveloper.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ Installation
testInstallation() {
	testData="${CCDev}/TestData"
	assertEquals "$LINENO: incorrect "'$SHELL' /bin/ksh $(launchctl getenv SHELL)

	# launchd settings
	#	dev=$(launchctl getenv DEV)
	#	if [[ ${USER} = carolclark ]] ; then
	#		assertEquals "$LINENO"': incorrect $DEV' "/Volumes/Mac/Users/carolclark/Dev" ${dev}
	#	elif [[ ${USER} = lauramartinez ]] ; then
	#		assertEquals "$LINENO"': incorrect $DEV' "${HOME}/Documents/Projects" ${dev}
	#	else
	#		assertEquals "$LINENO"': incorrect $DEV' ${HOME}/Dev ${dev}
	#	fi
	#	assertEquals "$LINENO"': incorrect $CCDev' ${HOME}/Library/CCDev $(launchctl getenv CCDev)
	#	assertEquals "$LINENO"': incorrect $VISUAL' \"/usr/bin/emacs\" $(launchctl getenv VISUAL)

	# Scripts/errcc
	fl="${CCDev}/bin/errcc"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script errcc missing"
	fi

	# ~/Library/Scripts/Developer/FixWindow.scpt
#	fl="${HOME}/Library/Scripts/Developer/FixWindow.scpt"
#	if [[ ! -e "${fl}" ]] ; then
#		fail "$LINENO: AppleScript FixWindow.scpt missing"
#	fi
}

#^ Developer_install.ksh
testDeveloperInstall() {
	DEV=$(ccInstall --DEV ${USER})
	logger "$0#$LINENO: DEV=$DEV #forexit"
	callbackScript="${DEV}/Support/Developer/Developer/Developer_install.ksh"
	str=$(${callbackScript})
	st=$?
	logger "$0#$LINENO: results: ${str}; $st #forexit"
	assertEquals "err" 65 ${st}
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument "${st}"
	logger "$0#$LINENO: results: ${str}; $st #forexit"

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

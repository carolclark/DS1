#!/bin/ksh

#  testDeveloper.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

. "${CCDev}/bin/resultCodes.ksh"

#^ Developer_install.ksh
testDeveloperInstall() {
	script=${DEV}/Support/BuildSupport/Developer/Developer_install.ksh
	str=$(${script})
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument ${st}

	str=$(${script} --getSubtargetDestination)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination (no args): " $RC_MissingArgument ${st}
	str=$(${script} --getSubtargetDestination xxx)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination xxx: " $RC_InputNotHandled ${st}

	str=$(${script} --handleFile)
	st=$?
	assertEquals "$LINENO: --handleFile (no args): " $RC_MissingArgument ${st}	
	
	targetScript=$(ccInstall --getTargetScript "${DEV}/Support" "BuildSupport/Developer")
	assertEquals "$LINENO: incorrect target script: " "${script}" "${targetScript}"
	# test Functions/ccInstall.ksh
	dest=$("${targetScript}" --getSubtargetDestination Functions)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination Functions: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination Functions" "${CCDev}/func" "${dest}"
	fl=$(${script} --handleFile "Functions" "ccInstall.ksh" "${dest}")
	st=$?
	assertEquals "$LINENO: --handleFile failed with code $st" 0 $st
	set -A copyInfo
	while read ln ; do
		copyInfo+=("${ln}")
	done < "${fl}"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertTrue "$LINENO: incorrect array count" "[ ${#copyInfo[*]} -lt 4 ]"
	assertEquals "$LINENO: incorrect action: " "copy" "${copyInfo[0]}"
	assertEquals "$LINENO: incorrect sourceForCopy: " "${DEV}/Support/BuildSupport/Developer/Functions/ccInstall.ksh" "${copyInfo[1]}"
	assertEquals "$LINENO: incorrect destinationForCopy: " "${CCDev}/func/ccInstall" "${copyInfo[2]}"

	# test Environment/kshrc.ksh
	dest=$("${targetScript}" --getSubtargetDestination Environment)
	st=$?
	assertEquals "$LINENO: --getSubtargetDestination Environment: error: " 0 ${st}
	assertEquals "$LINENO: --getSubtargetDestination Environment" "" "${dest}"
	fl=$(${script} --handleFile "Environment" "kshrc.ksh" "${dest}")
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
	assertEquals "$LINENO: incorrect "'$SHELL' /bin/ksh $(launchctl getenv SHELL)

	# launchd settings
	dev=$(launchctl getenv DEV)
	if [[ ${USER} = carolclark ]] ; then
		assertEquals "$LINENO"': incorrect $DEV' "/Volumes/Mac/Users/carolclark/Dev" ${dev}
	else
		assertEquals "$LINENO"': incorrect $DEV' ${HOME}/Dev ${dev}
	fi
	assertEquals "$LINENO"': incorrect $CCDev' ${HOME}/CCDev $(launchctl getenv CCDev)
	assertEquals "$LINENO"': incorrect $VISUAL' \"/usr/bin/emacs\" $(launchctl getenv VISUAL)

	# Scripts/cleanProjectTarget
	fl="${CCDev}/bin/cleanProjectTarget"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script cleanProjectTarget missing" 
	fi
	
	# ~/Library/Scripts/Developer/FixWindow.scpt
	fl="${HOME}/Library/Scripts/Developer/FixWindow.scpt"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: AppleScript FixWindow.scpt missing" 
	fi

}

# load shunit2
. ${SHUnit}

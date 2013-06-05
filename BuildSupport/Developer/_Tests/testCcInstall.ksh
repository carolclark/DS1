#!/bin/ksh

#  testCcInstall.ksh
#  Support
#
#  Created by Carol Clark on 11/11/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

setUp() {
	workspaceRoot="${CCDev}/TestData/WorkspaceA"
	targetFolder=ProjA/Tar1
}

. "${CCDev}/bin/resultCodes.ksh"
. "${CCDev}/bin/ccInstall"

#^	1 === General
testCciGeneral() {
	typeset str

	ccInstall > /dev/null
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument $?

	str=$(ccInstall --help result)
	st=$?
	assertEquals "$LINENO: 'ccInstall --help' failed with code $st" 0 $st
	assertNotNull "$LINENO: empty help string: " "${str}"

	str=$(ccInstall --xxx)
	assertEquals "$LINENO: incorrect return code for action param '--xxx': " $RC_InvalidArgument $?
	assertNotNull "$LINENO: empty error string: " "${str}"
	
	str=$(ccInstall abc)
	st=$?
	assertEquals "$LINENO: expected result code RC_MissingArgument:" $RC_MissingArgument "${st}"
	assertNotNull "$LINENO: expected error message:" "${str}"
}

#^ --getActions
testCciGetActions() {
	typeset str

	ccInstall --getActions result "${workspaceRoot}" "${targetFolder}"
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect default action string: " "it" "${result.actionString}"

	str=$(ccInstall --getActions result "${workspaceRoot}" "${targetFolder}" abc)
	st=$?
	assertEquals "$LINENO: expected result code RC_SyntaxError: " $RC_SyntaxError $st
	assertNotNull "$LINENO: expected error message" "${str}"

	ccInstall --getActions result "${workspaceRoot}" "${targetFolder}" -ciu
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result ... -ciu' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$LINENO: expected doInstall=1: " 1 "${result.doInstall}"
	assertEquals "$LINENO: expected doTest=0: " 0 "${result.doTest}"

	str=$(ccInstall --getActions result "${workspaceRoot}" "${targetFolder}" -xyz)
	st=$?
	assertEquals "$LINENO: RC_InvalidInput expected" $RC_InvalidInput "${st}"
	assertNotNull "$LINENO: error message expected" "${str}"
	errstr="--getActions xyz: 3 invalid action flags"
	assertNotEquals "$LINENO: incorrect error message" "${str%${errstr}}" "${str}"
}

#^ Paths
testCciPaths() {
	str=$(ccInstall --getSourceRoot)
	assertEquals "$0#$LINENO:" $RC_MissingArgument $?

	str=$(ccInstall --getSourceRoot "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect source root: " "${CCDev}/TestData/WorkspaceA/ProjA" "${str}"

	str=$(ccInstall --getOldTargetFolder "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect oldTargetFolder: " "ProjA/Tar1" "${str}"

	str=$(ccInstall --getSourceRoot "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect source root: " "${CCDev}/TestData/WorkspaceA/ProjA" "${str}"

	str=$(ccInstall --getTargetFolder "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect targetFolder: " "Tar1" "${str}"

	str=$(ccInstall --getTargetName "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target name: " "Tar1" "${str}"

	str=$(ccInstall --getWorkspaceName "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect workspaceName: " "WorkspaceA" "${str}"

	str=$(ccInstall --getTargetScript "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target script: " "${CCDev}/TestData/WorkspaceA/ProjA/Tar1/Tar1_install.ksh" "${str}"

	lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/WorkspaceA/ProjA/Tar1.lastbuilt" "${lastbuilt}"

	ccInstall --updateLastbuilt "${workspaceRoot}" "${targetFolder}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${workspaceRoot}" "${targetFolder}"
	assertFalse "$LINENO: file ${lastbuilt} still present" "[ -e ${lastbuilt} ]"
}

fileContainsLine() {		# returns 1 iff file "${1}" contains line "${2}"
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		file="${1}"
		comp="${2}"
	else
		return 0
	fi
	while read line ; do
		if [[ "${line}" = "${comp}" ]] ; then
			return 1
		fi
	done < "${file}"
	return 0
}

#^ find
testFind() {
	mkdir -p ${workspaceRoot}/${targetFolder}/_Tests
	print "Tom" > "${workspaceRoot}/${targetFolder}/_Tests/testTom.ksh"
	print "Dick" > "${workspaceRoot}/${targetFolder}/_Tests/testDick.ksh"
	print "Harry" > "${workspaceRoot}/${targetFolder}/_Tests/testHarry.ksh"
	print "Jane" > "${workspaceRoot}/${targetFolder}/_Tests/Jane.ksh"
	mkdir -p ${workspaceRoot}/${targetFolder}/A
	print "One" > "${workspaceRoot}/${targetFolder}/A/One"
	print "Two" > "${workspaceRoot}/${targetFolder}/A/Two"
	print "store" > "${workspaceRoot}/${targetFolder}/A/.DS_Store"
	mkdir -p ${workspaceRoot}/${targetFolder}/B
	print "red" > "${workspaceRoot}/${targetFolder}/B/red"
	print "blue" > "${workspaceRoot}/${targetFolder}/B/blue"
	
	ccInstall --clearLastbuilt "${workspaceRoot}" "${targetFolder}"
	fl=$(ccInstall --findTests)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected: " $RC_MissingArgument "${st}"

	fl=$(ccInstall --findTests "${workspaceRoot}/${targetFolder}")
	set -A lines
	while read ln ; do
		lines+=("${ln}")
	done < "${fl}"
	assertEquals "$LINENO: incorrect line count: " 3 "${#lines[*]}"
	fileContainsLine
	result=$?
	assertEquals "$LINENO: call with no arguments should return false: " 0 "${result}"
	fileContainsLine "${fl}" "_Tests/testTom.ksh"
	result=$?
	assertEquals "$LINENO: line missing: " 1 "${result}"

	fl=$(ccInstall --findSources)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected: " $RC_MissingArgument "${st}"

	fl=$(ccInstall --findSources "${workspaceRoot}" "${targetFolder}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: line missing: " 1 "${result}"
	fileContainsLine "${fl}" "A/.DS_Store"
	result=$?
	assertEquals "$LINENO: A/.DS_Store found: " 0 "${result}"
	set -A lines
	while read ln ; do
		lines+=("${ln}")
	done < "${fl}"
	assertEquals "$LINENO: incorrect line count: " 4 "${#lines[*]}"

	ccInstall --updateLastbuilt "${workspaceRoot}" "${targetFolder}"
	fl=$(ccInstall --findSources "${workspaceRoot}" "${targetFolder}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now up-to-date: " 0 "${result}"
	ccInstall --clearLastbuilt "${workspaceRoot}" "${targetFolder}"
	print "One" > "${workspaceRoot}/${targetFolder}/A/One"
	fl=$(ccInstall --findSources "${workspaceRoot}" "${targetFolder}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now changed: " 1 "${result}"

	rm "${workspaceRoot}/${targetFolder}/_Tests/testTom.ksh"
	rm "${workspaceRoot}/${targetFolder}/_Tests/testDick.ksh"
	rm "${workspaceRoot}/${targetFolder}/_Tests/testHarry.ksh"
	rm "${workspaceRoot}/${targetFolder}/_Tests/Jane.ksh"
	rmdir "${workspaceRoot}/${targetFolder}/_Tests/"
	rm "${workspaceRoot}/${targetFolder}/A/One"
	rm "${workspaceRoot}/${targetFolder}/A/Two"
	rm "${workspaceRoot}/${targetFolder}/A/.DS_Store"
	rmdir "${workspaceRoot}/${targetFolder}/A"
	rm "${workspaceRoot}/${targetFolder}/B/red"
	rm "${workspaceRoot}/${targetFolder}/B/blue"
	rmdir "${workspaceRoot}/${targetFolder}/B"
	rmdir "${workspaceRoot}/${targetFolder}"
	rmdir "${workspaceRoot}/ProjA"
	rmdir "${workspaceRoot}"
}

#^ removeFolder
testRemoveFolder() {
	workspaceRoot="${CCDev}/TestData/ProjB"
	str=$(ccInstall --removeFolder)
	st=$?
	assertEquals "$LINENO: error RC_MissingArgument expected" $RC_MissingArgument "${st}"

	mkdir -p "${workspaceRoot}/Corlan"
	mkdir -p "${workspaceRoot}/Emily"
	mkdir -p "${workspaceRoot}/Corlan/Two"
	print "red" > "${workspaceRoot}/Corlan/Two/red"
	print "green" > "${workspaceRoot}/Corlan/Two/green"
	mkdir -p "${workspaceRoot}/Emily/Nine"
	print "pink" > "${workspaceRoot}/Emily/Nine/pink"
	print "blue" > "${workspaceRoot}/Emily/Nine/blue"

	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file ${workspaceRoot}/Emily/Nine/blue missing"
	fi

	fl="${workspaceRoot}/Emily/Nine/blue"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file ${workspaceRoot}/Emily/Nine/blue missing"
	fi
	fl="${workspaceRoot}/Corlan/Two"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file ${fl} missing"
	fi
	if [[ ! -d "${fl}" ]] ; then
		fail "$LINENO: file ${fl}: directory expected" 
	fi

	d1="${workspaceRoot}/Corlan/Two"
	d2="${workspaceRoot}/Emily/Nine/blue"
	str=$(ccInstall --removeFolder "${d1}")
	if [[ -e "${d1}" ]] ; then
		fail "$LINENO: file ${d1} should have been removed"
	fi

	if [[ ! -e "${d2}" ]] ; then
		fail "$LINENO: file ${d2} should still be present"
	fi

	d3="${workspaceRoot}/Emily/Nine/blue"
	str=$(ccInstall --removeFolder "${d3}")
	st=$?
	assertEquals "$LINENO: error: ${d3} is not a directory" $RC_NoSuchFileOrDirectory "${st}"

	str=$(ccInstall --removeFolder "${workspaceRoot}/Corlan")
	str=$(ccInstall --removeFolder "${workspaceRoot}/Emily")
	dr="${workspaceRoot}/Corlan"
	if [[ -e "${dr}" ]] ; then
		fail "$LINENO: directory ${dr} should have been removed"
	fi
	dr="${workspaceRoot}/Emily"
	if [[ -e "${dr}" ]] ; then
		fail "$LINENO: directory ${dr} should have been removed"
	fi
}

#^ 7 === testInstall
testInstall() {
	str=$(ccInstall a)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected" $RC_MissingArgument "${st}"
	
	str=$(ccInstall a b abc)
	st=$?
	assertEquals "$LINENO: RC_SyntaxError expected" $RC_SyntaxError "${st}"
	
	str=$(ccInstall a b -abc)
	st=$?
	assertEquals "$LINENO: RC_InvalidInput expected" $RC_InvalidInput "${st}"
}

# load shunit2
. ${SHUnit}

#!/bin/ksh

#  testCcInstall.ksh
#  Support
#
#  Created by Carol Clark on 11/11/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

setUp() {
	workspaceRoot="${CCDev}/TestData/WorkspaceA"
	target=ProjA/Tar1
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

	ccInstall --getActions result
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect default action string: " "it" "${result.actionString}"

	str=$(ccInstall --getActions result abc)
	st=$?
	assertEquals "$LINENO: expected result code RC_SyntaxError: " $RC_SyntaxError $st
	assertNotNull "$LINENO: expected error message" "${str}"

	ccInstall --getActions result -ciu
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result -ciu' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$LINENO: expected doInstall=1: " 1 "${result.doInstall}"
	assertEquals "$LINENO: expected doTest=0: " 0 "${result.doTest}"

	str=$(ccInstall --getActions result -xyz)
	st=$?
	assertEquals "$LINENO: RC_InvalidInput expected" $RC_InvalidInput "${st}"
	assertNotNull "$LINENO: error message expected" "${str}"
	errstr="--getActions xyz: 3 invalid action flags"
	assertNotEquals "$LINENO: incorrect error message" "${str%${errstr}}" "${str}"
}

#^ Paths
testCciPaths() {
	str=$(ccInstall --getBasePath)
	assertEquals "$0#$LINENO:" $RC_MissingArgument $?

	str=$(ccInstall --getWorkspaceRoot "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect workspace root: " "${CCDev}/TestData/WorkspaceA" "${str}"

	str=$(ccInstall --getTarget "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target: " "ProjA/Tar1" "${str}"

	str=$(ccInstall --getTargetName "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target name: " "Tar1" "${str}"

	str=$(ccInstall --getBasePath "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target: " "${CCDev}/TestData" "${str}"

	str=$(ccInstall --getProject "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect project: " "WorkspaceA" "${str}"

	str=$(ccInstall --getSourcePath "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect source path: " "${CCDev}/TestData/WorkspaceA/ProjA/Tar1" "${str}"

	str=$(ccInstall --getTargetScript "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target script: " "${CCDev}/TestData/WorkspaceA/ProjA/Tar1/Tar1_install.ksh" "${str}"

	lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${target}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/WorkspaceA/ProjA/Tar1.lastbuilt" "${lastbuilt}"

	ccInstall --updateLastbuilt "${workspaceRoot}" "${target}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${workspaceRoot}" "${target}"
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
	mkdir -p ${workspaceRoot}/${target}/_Tests
	print "Tom" > "${workspaceRoot}/${target}/_Tests/testTom.ksh"
	print "Dick" > "${workspaceRoot}/${target}/_Tests/testDick.ksh"
	print "Harry" > "${workspaceRoot}/${target}/_Tests/testHarry.ksh"
	print "Jane" > "${workspaceRoot}/${target}/_Tests/Jane.ksh"
	mkdir -p ${workspaceRoot}/${target}/A
	print "One" > "${workspaceRoot}/${target}/A/One"
	print "Two" > "${workspaceRoot}/${target}/A/Two"
	print "store" > "${workspaceRoot}/${target}/A/.DS_Store"
	mkdir -p ${workspaceRoot}/${target}/B
	print "red" > "${workspaceRoot}/${target}/B/red"
	print "blue" > "${workspaceRoot}/${target}/B/blue"
	
	ccInstall --clearLastbuilt "${workspaceRoot}" "${target}"
	fl=$(ccInstall --findTests)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected: " $RC_MissingArgument "${st}"

	fl=$(ccInstall --findTests "${workspaceRoot}/${target}")
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

	fl=$(ccInstall --findSources "${workspaceRoot}" "${target}")
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

	ccInstall --updateLastbuilt "${workspaceRoot}" "${target}"
	fl=$(ccInstall --findSources "${workspaceRoot}" "${target}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now up-to-date: " 0 "${result}"
	ccInstall --clearLastbuilt "${workspaceRoot}" "${target}"
	print "One" > "${workspaceRoot}/${target}/A/One"
	fl=$(ccInstall --findSources "${workspaceRoot}" "${target}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now changed: " 1 "${result}"

	rm "${workspaceRoot}/${target}/_Tests/testTom.ksh"
	rm "${workspaceRoot}/${target}/_Tests/testDick.ksh"
	rm "${workspaceRoot}/${target}/_Tests/testHarry.ksh"
	rm "${workspaceRoot}/${target}/_Tests/Jane.ksh"
	rmdir "${workspaceRoot}/${target}/_Tests/"
	rm "${workspaceRoot}/${target}/A/One"
	rm "${workspaceRoot}/${target}/A/Two"
	rm "${workspaceRoot}/${target}/A/.DS_Store"
	rmdir "${workspaceRoot}/${target}/A"
	rm "${workspaceRoot}/${target}/B/red"
	rm "${workspaceRoot}/${target}/B/blue"
	rmdir "${workspaceRoot}/${target}/B"
	rmdir "${workspaceRoot}/${target}"
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

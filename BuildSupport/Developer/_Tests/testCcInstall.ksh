#!/bin/ksh

#  testCcInstall.ksh
#  Support
#
#  Created by Carol Clark on 11/11/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

setUp() {
	sourceRoot="${CCDev}/TestData/WorkspaceA/ProjA"
	targetFolder=Tar1
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

	ccInstall --getActions result "${sourceRoot}" "${targetFolder}"
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect default action string: " "it" "${result.actionString}"

	str=$(ccInstall --getActions result "${sourceRoot}" "${targetFolder}" abc)
	st=$?
	assertEquals "$LINENO: expected result code RC_SyntaxError: " $RC_SyntaxError $st
	assertNotNull "$LINENO: expected error message" "${str}"

	ccInstall --getActions result "${sourceRoot}" "${targetFolder}" -ciu
	st=$?
	assertEquals "$LINENO: 'ccInstall --getActions result ... -ciu' failed with code $st" 0 $st
	assertEquals "$LINENO: incorrect action string: " "ciu" "${result.actionString}"
	assertEquals "$LINENO: expected doInstall=1: " 1 "${result.doInstall}"
	assertEquals "$LINENO: expected doTest=0: " 0 "${result.doTest}"

	str=$(ccInstall --getActions result "${sourceRoot}" "${targetFolder}" -xyz)
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

	str=$(ccInstall --getSourceRoot "${sourceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect source root: " "${CCDev}/TestData/WorkspaceA/ProjA" "${str}"

	str=$(ccInstall --getTargetFolder "${sourceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect targetFolder: " "Tar1" "${str}"

	str=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target name: " "Tar1" "${str}"

	str=$(ccInstall --getTargetScript "${sourceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect target script: " "${CCDev}/TestData/WorkspaceA/ProjA/Tar1/Tar1_install.ksh" "${str}"

	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/WorkspaceA/ProjA/Tar1.lastbuilt" "${lastbuilt}"

	ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	assertFalse "$LINENO: file ${lastbuilt} still present" "[ -e ${lastbuilt} ]"

	rmdir "${CCDev}/build/WorkspaceA/ProjA"
	rmdir "${CCDev}/build/WorkspaceA"
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
	mkdir -p ${sourceRoot}/${targetFolder}/_Tests
	print "Tom" > "${sourceRoot}/${targetFolder}/_Tests/testTom.ksh"
	print "Dick" > "${sourceRoot}/${targetFolder}/_Tests/testDick.ksh"
	print "Harry" > "${sourceRoot}/${targetFolder}/_Tests/testHarry.ksh"
	print "Jane" > "${sourceRoot}/${targetFolder}/_Tests/Jane.ksh"
	mkdir -p ${sourceRoot}/${targetFolder}/A
	print "One" > "${sourceRoot}/${targetFolder}/A/One"
	print "Two" > "${sourceRoot}/${targetFolder}/A/Two"
	print "store" > "${sourceRoot}/${targetFolder}/A/.DS_Store"
	mkdir -p ${sourceRoot}/${targetFolder}/B
	print "red" > "${sourceRoot}/${targetFolder}/B/red"
	print "blue" > "${sourceRoot}/${targetFolder}/B/blue"
	
	ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	fl=$(ccInstall --findTests)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected: " $RC_MissingArgument "${st}"

	fl=$(ccInstall --findTests "${sourceRoot}/${targetFolder}")
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

	fl=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
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

	ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
	fl=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now up-to-date: " 0 "${result}"
	ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	print "One" > "${sourceRoot}/${targetFolder}/A/One"
	fl=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now changed: " 1 "${result}"

	rm "${sourceRoot}/${targetFolder}/_Tests/testTom.ksh"
	rm "${sourceRoot}/${targetFolder}/_Tests/testDick.ksh"
	rm "${sourceRoot}/${targetFolder}/_Tests/testHarry.ksh"
	rm "${sourceRoot}/${targetFolder}/_Tests/Jane.ksh"
	rmdir "${sourceRoot}/${targetFolder}/_Tests/"
	rm "${sourceRoot}/${targetFolder}/A/One"
	rm "${sourceRoot}/${targetFolder}/A/Two"
	rm "${sourceRoot}/${targetFolder}/A/.DS_Store"
	rmdir "${sourceRoot}/${targetFolder}/A"
	rm "${sourceRoot}/${targetFolder}/B/red"
	rm "${sourceRoot}/${targetFolder}/B/blue"
	rmdir "${sourceRoot}/${targetFolder}/B"
	rmdir "${sourceRoot}/${targetFolder}"

	rmdir "${sourceRoot}"
	rmdir "${CCDev}/TestData/WorkspaceA"
	rmdir "${CCDev}/build/WorkspaceA/ProjA"
	rmdir "${CCDev}/build/WorkspaceA"
}

#^ removeFolder
testRemoveFolder() {
	folder="${CCDev}/TestData/ProjB"
	str=$(ccInstall --removeFolder)
	st=$?
	assertEquals "$LINENO: error RC_MissingArgument expected" $RC_MissingArgument "${st}"

	mkdir -p "${folder}/Corlan"
	mkdir -p "${folder}/Emily"
	mkdir -p "${folder}/Corlan/Two"
	print "red" > "${folder}/Corlan/Two/red"
	print "green" > "${folder}/Corlan/Two/green"
	mkdir -p "${folder}/Emily/Nine"
	print "pink" > "${folder}/Emily/Nine/pink"
	print "blue" > "${folder}/Emily/Nine/blue"

	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file ${folder}/Emily/Nine/blue missing"
	fi

	fl="${folder}/Emily/Nine/blue"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file ${folder}/Emily/Nine/blue missing"
	fi
	fl="${folder}/Corlan/Two"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file ${fl} missing"
	fi
	if [[ ! -d "${fl}" ]] ; then
		fail "$LINENO: file ${fl}: directory expected" 
	fi

	d1="${folder}/Corlan/Two"
	d2="${folder}/Emily/Nine/blue"
	str=$(ccInstall --removeFolder "${d1}")
	if [[ -e "${d1}" ]] ; then
		fail "$LINENO: file ${d1} should have been removed"
	fi

	if [[ ! -e "${d2}" ]] ; then
		fail "$LINENO: file ${d2} should still be present"
	fi

	d3="${folder}/Emily/Nine/blue"
	str=$(ccInstall --removeFolder "${d3}")
	st=$?
	assertEquals "$LINENO: error: ${d3} is not a directory" $RC_NoSuchFileOrDirectory "${st}"

	str=$(ccInstall --removeFolder "${folder}/Corlan")
	str=$(ccInstall --removeFolder "${folder}/Emily")
	dr="${folder}/Corlan"
	if [[ -e "${dr}" ]] ; then
		fail "$LINENO: directory ${dr} should have been removed"
	fi
	dr="${folder}/Emily"
	if [[ -e "${dr}" ]] ; then
		fail "$LINENO: directory ${dr} should have been removed"
	fi

	rmdir "${folder}"
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

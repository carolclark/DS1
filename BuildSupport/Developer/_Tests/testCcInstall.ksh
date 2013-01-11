#!/bin/ksh

#  testCcInstall.ksh
#  Support
#
#  Created by Carol Clark on 11/11/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

setUp() {
	projectPath="${CCDev}/TestData/ProjA"
	target=Tar1
}

. "${CCDev}/bin/resultCodes.ksh"

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
	st=$?
	assertEquals "$LINENO: expected error RC_MissingArgument" $RC_MissingArgument "${st}"

	str=$(ccInstall --getBasePath "${projectPath}" "${target}")
	st=$?
	assertEquals "$LINENO: ${str}" 0 "${st}"
	assertEquals "$LINENO: incorrect base path: " "${CCDev}/TestData" "${str}"
	str=$(ccInstall --getSourcePath "${projectPath}" "${target}")
	assertEquals "$LINENO: incorrect source path: " "${CCDev}/TestData/ProjA/Tar1" "${str}"
	str=$(ccInstall --getTargetScript "${projectPath}" "${target}")
#	assertEquals "$LINENO: incorrect target script: " "${CCDev}/TestData/ProjA/Tar1/Tar1_install.ksh" "${str}"
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	assertEquals "$LINENO: incorrect lastbuilt: " "${CCDev}/build/ProjA/Tar1.lastbuilt" "${lastbuilt}"
	ccInstall --updateLastbuilt "${projectPath}" "${target}"
	assertTrue "$LINENO: file ${lastbuilt} missing" "[ -e ${lastbuilt} ]"
	ccInstall --clearLastbuilt "${projectPath}" "${target}"
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
	mkdir -p ${projectPath}/${target}/_Tests
	print "Tom" > "${projectPath}/${target}/_Tests/testTom.ksh"
	print "Dick" > "${projectPath}/${target}/_Tests/testDick.ksh"
	print "Harry" > "${projectPath}/${target}/_Tests/testHarry.ksh"
	print "Jane" > "${projectPath}/${target}/_Tests/Jane.ksh"
	mkdir -p ${projectPath}/${target}/A
	print "One" > "${projectPath}/${target}/A/One"
	print "Two" > "${projectPath}/${target}/A/Two"
	print "store" > "${projectPath}/${target}/A/.DS_Store"
	mkdir -p ${projectPath}/${target}/B
	print "red" > "${projectPath}/${target}/B/red"
	print "blue" > "${projectPath}/${target}/B/blue"
	
	ccInstall --clearLastbuilt "${projectPath}" "${target}"
	fl=$(ccInstall --findTests)
	st=$?
	assertEquals "$LINENO: RC_MissingArgument expected: " $RC_MissingArgument "${st}"

	fl=$(ccInstall --findTests "${projectPath}" "${target}")
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

	fl=$(ccInstall --findSources "${projectPath}" "${target}")
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

	ccInstall --updateLastbuilt "${projectPath}" "${target}"
	fl=$(ccInstall --findSources "${projectPath}" "${target}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now up-to-date: " 0 "${result}"
	ccInstall --clearLastbuilt "${projectPath}" "${target}"
	print "One" > "${projectPath}/${target}/A/One"
	fl=$(ccInstall --findSources "${projectPath}" "${target}")
	fileContainsLine "${fl}" "A/One"
	result=$?
	assertEquals "$LINENO: file A/One is now changed: " 1 "${result}"

	rm "${projectPath}/${target}/_Tests/testTom.ksh"
	rm "${projectPath}/${target}/_Tests/testDick.ksh"
	rm "${projectPath}/${target}/_Tests/testHarry.ksh"
	rm "${projectPath}/${target}/_Tests/Jane.ksh"
	rmdir "${projectPath}/${target}/_Tests/"
	rm "${projectPath}/${target}/A/One"
	rm "${projectPath}/${target}/A/Two"
	rm "${projectPath}/${target}/A/.DS_Store"
	rmdir "${projectPath}/${target}/A"
	rm "${projectPath}/${target}/B/red"
	rm "${projectPath}/${target}/B/blue"
	rmdir "${projectPath}/${target}/B"
	rmdir "${projectPath}/${target}"
	rmdir "${projectPath}"
}

#^ cleanProjectTarget
testCleanProjectTarget() {
	str=$(cleanProjectTarget)
	st=$?
	assertEquals "$LINENO: error RC_MissingArgument expected" $RC_MissingArgument "${st}"
	str=$(cleanProjectTarget abc)
	st=$?
	assertEquals "$LINENO: error RC_MissingArgument expected" $RC_MissingArgument "${st}"
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

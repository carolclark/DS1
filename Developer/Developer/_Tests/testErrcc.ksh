#!/bin/ksh

#  testErrcc.ksh
#  Support
#
#  Created by Carol Clark on 5/6/13.
#  Copyright 2013-16 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/errcc"
. "${CCDev}/bin/ccInstall"
testData="${CCDev}/TestData"


#pragma mark 2 === test for text in message
function assertTextInMessage {	# _where_ expectedText message
	x=$(echo "$3" | grep "$2")
	assertTrue "$1 expected text '$2' not found in message '$3'" $?
}

function assertTextNotInMessage {	# _where_ expectedText message
	x=$(echo "$3" | grep "$2")
	assertFalse "$1 unexpected text '$2' found in message '$3'" $?
}

testErrorCodeText() {
	assertEquals "$0#$LINENO:" "[RC_InvalidArgument:#$RC_InvalidArgument]" "$(errorCodeText $RC_InvalidArgument)"
}

testErrorMessage() {
	assertTextInMessage "$0#$LINENO:" "abc" "abcdef"
	assertTextNotInMessage "$0#$LINENO:" "abc" "def"

	hello="Hello, World"

	msg=$(errorMessage)
	assertEquals "$0#$LINENO:" $RC_UnknownError $?
	assertTextInMessage "$0#$LINENO:" "[RC_UnknownError:#$RC_UnknownError]" "$msg"
	assertEquals "$0#$LINENO:" "[RC_UnknownError:#$RC_UnknownError]" "$msg"

	msg=$(errorMessage $RC_InvalidInput "file#line:")
	assertEquals "$0#$LINENO:" $RC_InvalidInput $?
	assertEquals "$0#$LINENO:" "file#line: [RC_InvalidInput:#$RC_InvalidInput]" "$msg"

	msg=$(errorMessage $RC_InputNotHandled "file#line:" "$hello")
	assertEquals "$0#$LINENO:" $RC_InputNotHandled $?
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_InputNotHandled:#$RC_InputNotHandled]" "$msg"

	msg=$(errorMessage $RC_MissingArgument "file#line:" "$hello")
	assertEquals "$0#$LINENO:" $RC_MissingArgument $?
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_MissingArgument:#$RC_MissingArgument]" "$msg"

	msg=$(errorMessage 145 "file#line:")
	assertEquals "$0#$LINENO:" 145 $?
	assertEquals "$0#$LINENO:" "file#line: [UnknownErrorCode:#145]" "$msg"

	msg=$(errorMessage "abc" "file#line:" "$hello")
	assertEquals "$0#$LINENO:" $RC_UnknownError $?
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_UnknownError:#$RC_UnknownError]" "$msg"

	msg=$(errorMessage $RC_SyntaxError "file#line:" "$hello")
	assertEquals "$0#$LINENO:" $RC_SyntaxError $?
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_SyntaxError:#${RC_SyntaxError}]" "$msg"
}

testErrorExit() {
	# verify error message content
	errmsg="This is an error."
	msg=$(errorExit 132 "file#line:" "$errmsg" 2>&1)
	assertNotEquals "$0#$LINENO: should show nonzero exit status" 0 $?
	assertEquals "$0#$LINENO:" "file#line: $errmsg [UnknownErrorCode:#132]" "$msg"

	errmsg="This is an error."
	msg=$(errorExit 255 "file#line:" "$errmsg" 2>&1)
	assertEquals "$0#$LINENO:" 255 $?
	assertEquals "$0#$LINENO:" "file#line: $errmsg [UnknownErrorCode:#255]" "$msg"

	# set up temporary directory and files for output
	local_testdir=$(mktemp -d "${local_testdir}/${testData}/testErrcc_ksh.$$$$")
	outfile="${local_testdir}/outfile"
	errfile="${local_testdir}/errfile"

	print "" > ${outfile}
	print "" > ${errfile}
	# verify error message sent to errfile, outfile empty
	msg=$(errorExit "EXPECTED ERROR: $errmsg" 1>${outfile} 2>${errfile})
	assertEquals "$0#$LINENO:" "" "$(cat ${outfile})"
	assertNotEquals "$0#$LINENO:" "" "$(cat ${errfile})"
	assertEquals "$0#$LINENO:" "" "$msg"

	# clean up
	rm "${outfile}"
	rm "${errfile}"
	rmdir "${local_testdir}"
}

# run tests
. $(ccInstall --SHUnit)

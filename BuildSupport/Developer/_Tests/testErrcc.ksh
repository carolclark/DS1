#!/bin/ksh

#  testErrcc.ksh
#  Support
#
#  Created by Carol Clark on 5/6/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===

. "${CCDev}/bin/errcc"

testErrorCodeText() {
	assertEquals "$0#$LINENO:" "[RC_InvalidArgument:#$RC_InvalidArgument]" "$(errorCodeText $RC_InvalidArgument)"
}

testErrorMessage() {
	hello="Hello, World"

	msg=$(errorMessage)
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "An unknown error occurred." "$msg"

	msg=$(errorMessage $RC_InvalidInput "file#line:")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "file#line: [RC_InvalidInput:#$RC_InvalidInput]" "$msg"

	msg=$(errorMessage $RC_InputNotHandled "file#line:" "$hello")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_InputNotHandled:#$RC_InputNotHandled]" "$msg"

	msg=$(errorMessage 145 "file#line:")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "file#line: [UnknownErrorCode:#145]" "$msg"

	msg=$(errorMessage abc "file#line:" "$hello")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "file#line: $hello" "$msg"

	msg=$(errorMessage $RC_SyntaxError "file#line:" "$hello")
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_SyntaxError:#${RC_SyntaxError}]" "$msg"
}

testErrorExit() {
	# verify error message content
	errmsg="This is an error."
	msg=$(errorExit 132 "file#line:" "$errmsg" 2>&1)
	assertNotEquals "$0#$LINENO: should show failure" 0 $?
	assertEquals "$0#$LINENO:" "file#line: $errmsg [UnknownErrorCode:#132]" "$msg"

	errmsg="This is an error."
	msg=$(errorExit 255 "file#line:" "$errmsg" 2>&1)
	assertEquals "$0#$LINENO:" 255 $?
	assertEquals "$0#$LINENO:" "file#line: $errmsg [UnknownErrorCode:#255]" "$msg"

	# verify error message sent to stderr
	msg=$(errorExit "EXPECTED ERROR: $errmsg")
	assertEquals "$0#$LINENO:" "" "$msg"
}

# load shunit2
. ${SHUnit}

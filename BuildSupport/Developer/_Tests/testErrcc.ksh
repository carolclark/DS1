#!/bin/ksh

#  testErrsig.ksh
#  Support
#
#  Created by Carol Clark on 5/6/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top

. "${CCDev}/bin/errsig"

testErrorMessage() {
	hello="Hello, World"

	msg=$(errorMessage)
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "[UnknownFile#Line]: " "$msg"

	msg=$(errorMessage file#line:)
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "file#line: " "$msg"

	msg=$(errorMessage "file#line:" "$hello")
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "file#line: $hello" "$msg"

	msg=$(errorMessage "file#line:" 55)
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "file#line: 55" "$msg"

	msg=$(errorMessage "file#line:" "$hello" abc)
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "file#line: $hello" "$msg"

	msg=$(errorMessage "file#line:" "$hello" 7)
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "file#line: $hello [UnknownErrorCode:#7]" "$msg"

	msg=$(errorMessage "file#line:" "$hello" $RC_SyntaxError)
	st=$?
	assertEquals "$0#$LINENO:" 0 $st
	assertEquals "$0#$LINENO:" "file#line: $hello [RC_SyntaxError:#${RC_SyntaxError}]" "$msg"
}

testErrorExit() {
	# verify error message content
	errmsg="This is an error."
	msg=$(errorExit "file#line:" "$errmsg" 2>&1)
	st=$?
	assertNotEquals "$0#$LINENO: should show failure" 0 $st
	assertEquals "$0#$LINENO:" "file#line: $errmsg" "$msg"

	errmsg="This is an error."
	msg=$(errorExit "file#line:" "$errmsg" 55 2>&1)
	st=$?
	assertEquals "$0#$LINENO:" 55 $st
	assertEquals "$0#$LINENO:" "file#line: $errmsg [UnknownErrorCode:#55]" "$msg"

	# verify error message sent to stderr
	msg=$(errorExit "EXPECTED ERROR: $errmsg")
	assertEquals "$0#$LINENO:" "" "$msg"
}

# load shunit2
. ${SHUnit}

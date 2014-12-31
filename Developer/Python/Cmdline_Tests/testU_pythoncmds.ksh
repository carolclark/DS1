#!/bin/ksh

#  testU_pythoncmds.ksh
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/30/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

#pragma mark 0 === Top
#pragma mark === Markers ===

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

## 	@package	testU_pythoncmds	test command-line interface for our python scripts
#
#	@note		for Xcode compatibility, relative paths to scripts are specified here; these can be omitted when used from Terminal

testEquality() {
	assertEquals "$LINENO: " 1 1
}

#pragma mark 1 === testRuntests
##	@test		run passing test
#	@code		runtests.py [ --filepath | --fi ] <filepath>@endcode
testRunOneTest() {
	fldr="${HOME}/Library/CCDev/TestData/pythoncmds_ksh/SampleTests"
	tf="${fldr}/test_equality_pass.py"

	mkdir -p ${fldr}
	print "#! /usr/local/bin/python3" > ${tf}
	print "import unittest" >> ${tf}
	print "class TestEqualityPass (unittest.TestCase):" >> ${tf}
	print "\tdef test_equality_pass (self):" >> $tf
	print "\t\tself.assertTrue (1 == 1)" >> $tf
	print "if __name__ == '__main__':" >> $tf
	print "\tunittest.main(verbosity=2)" >> $tf
	chmod a+x ${tf}

	msg=$("Python/Scripts/runtests.py" "fi" "$tf")
	assertEquals "$0#$LINENO:" 0 $?
}


# run tests
. $(ccInstall --SHUnit)

#!/bin/ksh

#  testU_pythoncmds.ksh
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/30/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

#pragma mark 0 === Top
#pragma mark === Markers ===

HOME="/Users/carolclark"
CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

## 	@package	testU_pythoncmds	test command-line interface for our python scripts
#
#	@note		for Xcode compatibility, relative paths to scripts are specified here; these must be omitted when used from Terminal because they are not correct for that environment

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

#pragma mark 2 == testScm
##	@test	generate and validate several merge messages
#	@code			merge_message.py branchName repoIssue [[ --repository | -r ] repository ]
testMergeMessage() {
	# successes
	msg=$("Python/Scripts/scm.py" 'merge_message' 'abc' '40')
	assertEquals $? 0
	assertEquals "$0#$LINENO:" "${msg}" "Merge branch 'abc' (#40)"

	msg=$("Python/Scripts/scm.py" 'mm' 'xyz' '24')
	assertEquals $? 0
	assertEquals "$0#$LINENO:" "${msg}" "Merge branch 'xyz' (#24)"

	msg=$("Python/Scripts/scm.py" 'mm' 'aTask' '567' '-r' "Repo")
	assertEquals $? 0
	assertEquals "$0#$LINENO:" "${msg}" "Merge branch 'aTask' (Repo#567)"

	msg=$("Python/Scripts/scm.py" 'mm' 'abc' 0)
	assertEquals $? 0
	assertEquals "$0#$LINENO:" "${msg}" "Merge branch 'abc'"

	# failures
	msg=$("Python/Scripts/scm.py" 2>&1)
	assertNotEquals $? 0

	msg=$("Python/Scripts/scm.py" 'mm' 'abc' 'def' 2>&1)
	assertNotEquals $? 0

	msg=$("Python/Scripts/scm.py" 'merge_message' 40 2>&1)
	assertNotEquals $? 0

	msg=$("Python/Scripts/scm.py" "abc" 2>&1)
	assertNotEquals $? 0

	msg=$("Python/Scripts/scm.py" "-hi" 2>&1)
	assertNotEquals $? 0
}

# run tests
. $(ccInstall --SHUnit)

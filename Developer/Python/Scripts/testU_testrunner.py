#! /usr/local/bin/python3

#  testU_testrunner.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/23/14.
#  Copyright (c) 2014-15 C & C Software, Inc. All rights reserved.


import unittest
import logging
import os
import stat
import util
import sampletests
import runtests

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)



##	@package testU_testrunner			testing of test runner
#

##	return path to folder for use by testRuntests
#
def testrunnerTestData():
	return os.path.join (sampletests.ccdevTestDataFolder(), "testrunner_py")


##	return path to folder containing test files for use by these tests
#
def sample_test_folder():
	return (os.path.join (testrunnerTestData(), "SampleTests"))


##	@class	TestEquality
#
#	a simple test class that can be used to verify the operation of the testing system
class TestEquality (unittest.TestCase):

	## test that can be easily modified to verify system behavior with a passing or a failing test
	#
	def test_equality (self):

		self.assertTrue (1 == 1)


##	@class	TestTesting
#
#	test testing functionality
class TestTesting (unittest.TestCase):

	## generate test files to use in tests
	#
	@classmethod
	def setUpClass(cls):
		sampletests.generate_sample_tests (sample_test_folder())


	##	remove our test folders
	#
	@classmethod
	def tearDownClass(cls):
		if not sampletests.suppressTearDown():
			util.remove_my_folder (testrunnerTestData())
			util.remove_my_folder (sample_test_folder())


	##	@test	test running individual test file; verify captured text and status
	#
	#	@todo	implement error count
	def test_do_test_file (self):
		testsWithExceptions = 0
		printResult = False

		# passing test passes
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_pass.py")
		self.assertTrue (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# failing test fails
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_fail.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# test with error fails
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_error.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# test with pass and fail
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_PF.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# test with fail and pass
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_FP.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# test with fail and fail
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_FF.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# test with pass and pass
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_PP.py")
		self.assertTrue (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		# test with fail, pass, error
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_FPE.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.captured_text))

		self.assertTrue (testsWithExceptions == 8)


if __name__ == '__main__':
	unittest.main (verbosity = 2)

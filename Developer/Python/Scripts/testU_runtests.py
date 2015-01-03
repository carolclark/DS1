#! /usr/local/bin/python3

#  testU_runtests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/23/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.


import unittest
import logging
import os
import stat
import util
import runtests

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package testRuntests			test functions for module runtests
#

##	return path to folder for use by testRuntests
#
def runtestsTestFolder():
	return os.path.expanduser ("~") + "/Library/CCDev/TestData/runtests_py"


##	@class	TestEquality
#
#	a simple test class that can be used to verify the operation of the testing system
class TestEquality (unittest.TestCase):

	## test that can be easily modified to verify system behavior with a passing or a failing test
	#
	def test_equality (self):

		self.assertTrue (1 == 1)


##	@class	TestTestFileResult
#
#	tests for class TestFileResult
class TestTestFileResult (unittest.TestCase):


	@classmethod
	def setUpClass(cls):

		cls.filenames, cls.outputs = filename_and_output_data()


	##	@test	validate creation of TestFileResult
	#
	def test_creation (self):
		testresult = runtests.TestFileResult (self.filenames["p"], self.outputs["p"])
		self.assertEqual (testresult.filepath, self.filenames["p"])
		self.assertEqual (testresult.outputlines[0], "test_equality_pass (__main__.TestEquality_Pass) ... ok")
		self.assertEqual (testresult.outputlines[1], runtests.TestFileResult.standardLine)
		self.assertEqual (testresult.outputlines[2], "Ran 1 test in 0.000s")
		self.assertEqual (testresult.outputlines[3], "OK")

		testresult = runtests.TestFileResult (self.filenames["ff"], self.outputs["ff"])
		self.assertEqual (testresult.outputlines[9], runtests.TestFileResult.exceptionheader)
		self.assertEqual (testresult.outputlines[10], "FAIL: test_equality_fail1 (__main__.TestEquality_FF)")


##	@class	TestParseCmdlist
#
class TestParseCmdlist (unittest.TestCase):

	##	@test	parse_runtests_args() parses arguments as expected
	#
	def test_parse_command_list (self):
		args = runtests.parse_runtests_args (['fi', 'a_filepath'])
		self.assertEqual (args.cmd, 'fi')
		self.assertEqual (args.file, 'a_filepath')


##	set up arrays containing filenames and corresponding actual python output
#
#	output data obtained by setting printResult to True in testU_runtests.test_do_test_file
def filename_and_output_data():
	filenames = dict()
	outputs = dict()
	filenames["p"] = "test_equality_pass.py"
	outputs["p"] = """test_equality_pass (__main__.TestEquality_Pass) ... ok
----------------------------------------------------------------------
Ran 1 test in 0.000s
OK
"""
	filenames["f"] = "test_equality_fail.py"
	outputs["f"] = """test_equality_fail (__main__.TestEquality_Fail) ... FAIL
======================================================================
FAIL: test_equality_fail (__main__.TestEquality_Fail)
----------------------------------------------------------------------
Traceback (most recent call last):
File "/Users/carolclark/Library/CCDev/TestData/testrunner_py/SampleTests/test_equality_fail.py", line 6, in test_equality_fail
self.assertTrue (2 == 1)
AssertionError: False is not true
----------------------------------------------------------------------
Ran 1 test in 0.000s
FAILED (failures=1)"""
	filenames["e"] = "test_equality_error.py"
	outputs ["e"] = """^^^test_equality_error (__main__.TestEquality_Error) ... ERROR
======================================================================
ERROR: test_equality_error (__main__.TestEquality_Error)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carolclark/Library/CCDev/TestData/testrunner_py/SampleTests/test_equality_error.py", line 5, in test_equality_error
    self.assertTrueX (1 == 1)
AttributeError: 'TestEquality_Error' object has no attribute 'assertTrueX'
----------------------------------------------------------------------
Ran 1 test in 0.001s
FAILED (errors=1)
"""
	filenames["pf"] = "test_equality_PF.py"
	outputs ["pf"] = """^^^test_equality_fail (__main__.TestEquality_PF) ... FAIL
test_equality_pass (__main__.TestEquality_PF) ... ok
======================================================================
FAIL: test_equality_fail (__main__.TestEquality_PF)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carolclark/Library/CCDev/TestData/testrunner_py/SampleTests/test_equality_PF.py", line 7, in test_equality_fail
    self.assertTrue (2 == 1)
AssertionError: False is not true
----------------------------------------------------------------------
Ran 2 tests in 0.001s
FAILED (failures=1)
"""
	filenames["fp"] = "test_equality_FP.py"
	outputs ["fp"] = """^^^test_equality_fail (__main__.TestEquality_FP) ... FAIL
test_equality_pass (__main__.TestEquality_FP) ... ok
======================================================================
FAIL: test_equality_fail (__main__.TestEquality_FP)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carolclark/Library/CCDev/TestData/testrunner_py/SampleTests/test_equality_FP.py", line 5, in test_equality_fail
    self.assertTrue (2 == 1)
AssertionError: False is not true
----------------------------------------------------------------------
Ran 2 tests in 0.001s
FAILED (failures=1)
"""
	filenames["ff"] = "test_equality_FF.py"
	outputs ["ff"] = """^^^test_equality_fail (__main__.TestEquality_FF) ... FAIL
test_equality_fail1 (__main__.TestEquality_FF) ... FAIL
======================================================================
FAIL: test_equality_fail (__main__.TestEquality_FF)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carolclark/Library/CCDev/TestData/testrunner_py/SampleTests/test_equality_FF.py", line 5, in test_equality_fail
    self.assertTrue (1 == 2)
AssertionError: False is not true
======================================================================
FAIL: test_equality_fail1 (__main__.TestEquality_FF)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carolclark/Library/CCDev/TestData/testrunner_py/SampleTests/test_equality_FF.py", line 7, in test_equality_fail1
    self.assertTrue (2 == 1)
AssertionError: False is not true
----------------------------------------------------------------------
Ran 2 tests in 0.001s
FAILED (failures=2)
"""
	filenames["pp"] = "test_equality_PP.py"
	outputs ["PP"] = """^^^test_equality_pass (__main__.TestEquality_PP) ... ok
test_equality_pass1 (__main__.TestEquality_PP) ... ok
----------------------------------------------------------------------
Ran 2 tests in 0.001s
OK
"""

	return filenames, outputs


if __name__ == '__main__':
	unittest.main (verbosity = 2)

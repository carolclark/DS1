#! /usr/local/bin/python3

#  testU_runtests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/23/14.
#  Copyright (c) 2014-15 C & C Software, Inc. All rights reserved.


import unittest
import logging
import os
import stat
import util
import runtests

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


##	@package testU_runtests			test methods for module runtests
#
#	@sa		filename_and_output_data()

##	return path to folder for use by testRuntests
#
def runtestsTestFolder():
	return os.path.expanduser ("~") + "/Library/CCDev/TestData/runtests_py"


##	@class	TestTestMethod
#
#	tests for class TestMethod
class TestTestMethod (unittest.TestCase):

	##	generate collection of simple test files with expected test output
	#
	@classmethod
	def setUpClass(cls):
		cls._filenames, cls._outputs = filename_and_output_data()


	##	@test	validate construction of TestMethod object
	#
	def test_TestMethod (self):
		# test_equality_pass (__main__.TestEquality_Pass) ... ok
		sumline = self._outputs["p"].splitlines()[0]
		test = runtests.TestMethod (sumline)
		self.assertEqual (test._summary, sumline)


##	@class	TestTestFileResult
#
#	tests for class TestFileResult
class TestTestFileResult (unittest.TestCase):


	##	generate collection of simple test files with expected test output
	#
	@classmethod
	def setUpClass(cls):
		cls._filenames, cls._outputs = filename_and_output_data()


	##	@test	validate creation of TestFileResult
	#
	def test_creation (self):
		# test_equality_pass (__main__.TestEquality_Pass) ... ok
		testresult = runtests.TestFileResult (self._filenames["p"], self._outputs["p"])
		self.assertEqual (testresult._filepath, self._filenames["p"])
		self.assertEqual (testresult._outputlines[0], "test_equality_pass (__main__.TestEquality_Pass) ... ok")
		self.assertEqual (testresult._outputlines[1], runtests.TestFileResult.standardLine)
		self.assertEqual (testresult._outputlines[2], "Ran 1 test in 0.000s")
		self.assertEqual (testresult._outputlines[3], "OK")

		# test_equality_fail (__main__.TestEquality_FF) ... FAIL
		# test_equality_fail1 (__main__.TestEquality_FF) ... FAIL
		testresult = runtests.TestFileResult (self._filenames["ff"], self._outputs["ff"])
		self.assertEqual (testresult._outputlines[9], runtests.TestFileResult.exceptionHeader)
		self.assertEqual (testresult._outputlines[10], "FAIL: test_equality_fail1 (__main__.TestEquality_FF)")


	##	@test	validate attributes obtained by parsing output
	#
	def test_parse_results (self):
		# test_equality_pass (__main__.TestEquality_Pass) ... ok
		testresult = runtests.TestFileResult (self._filenames["p"], self._outputs["p"])
		testresult.parse_output()
		self.assertEqual (len(testresult._tests), 1)


##	@class	TestParseCmdlist
#
#	verify that parser parses arguments as expected
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
	outputs["e"] = """test_equality_error (__main__.TestEquality_Error) ... ERROR
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
	outputs["pf"] = """test_equality_fail (__main__.TestEquality_PF) ... FAIL
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
	outputs["fp"] = """test_equality_fail (__main__.TestEquality_FP) ... FAIL
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
	outputs["ff"] = """test_equality_fail (__main__.TestEquality_FF) ... FAIL
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
	outputs["PP"] = """test_equality_pass (__main__.TestEquality_PP) ... ok
test_equality_pass1 (__main__.TestEquality_PP) ... ok
----------------------------------------------------------------------
Ran 2 tests in 0.001s
OK
"""

	return filenames, outputs


if __name__ == '__main__':
	unittest.main (verbosity = 2)

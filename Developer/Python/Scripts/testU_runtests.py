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

def filename_and_output_data():
	filenames = dict()
	outputs = dict()
	filenames["p"] = "test_equality_pass.py",
	outputs["p"] = """test_equality_pass (__main__.TestEquality_Pass) ... ok
----------------------------------------------------------------------
Ran 1 test in 0.000s
OK
"""
	return filenames, outputs

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
#	@desc	tests for class TestFileResult
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


##	@class	TestParseCmdlist
#
class TestParseCmdlist (unittest.TestCase):

	##	@test	parse_runtests_args() parses arguments as expected
	#
	def test_parse_command_list (self):
		args = runtests.parse_runtests_args (['fi', 'a_filepath'])
		self.assertEqual (args.cmd, 'fi')
		self.assertEqual (args.file, 'a_filepath')


if __name__ == '__main__':
	unittest.main (verbosity = 2)

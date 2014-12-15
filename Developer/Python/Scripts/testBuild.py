#! /usr/local/bin/python3

#  testBuild.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/10/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.


import unittest
import logging
import sys
import os
import stat
import util
import build

loglevel=logging.DEBUG
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package testBuild			test functions for building, cleaning and testing of products
#
#	<b>Command-Line Interface:</b><ul>
#		<li></li>
#	</ul>

##	return path to folder for use by testBuild
#
def buildTestFolder():
	return os.path.expanduser("~") + "/Library/CCDev/TestData/build_py"


##	@class	TestEquality
#
#	a simple test class that can be used to verify the operation of the testing system
class TestEquality (unittest.TestCase):

	## test that can be easily modified to verify system behavior with a passing or a failing test
	def test_equality (self):

		self.assertTrue (1 == 1)


## @class	TestTesting
#
#	test testing functionality
class TestTesting (unittest.TestCase):

	## generate test files to use in tests
	#
	@classmethod
	def setUpClass(cls):
		x=1
		# set up folder for sample test files
		cls.sampleTestsFolder = buildTestFolder() + "/SampleTests"
		#		cls.assertTrue (class.buildSampleTests + "/Users/carolclark/Library/CCDev/TestData/build_py/SampleTests")
		util.ensure_directory (cls.sampleTestsFolder)

		cls.test_equality = cls.sampleTestsFolder + "/test_equality.py"
		f = open (cls.test_equality, 'w')
		f.write ("#! /usr/local/bin/python3\n")
		f.write ("import unittest\n")
		f.write ("class TestTesting (unittest.TestCase):\n")
		f.write ("\tdef test_equality (self):\n")
		f.write ("\t\tself.assertTrue (1 == 1)\n")
		f.write ("if __name__ == '__main__':\n")
		f.write ("\tunittest.main(verbosity=2)")
		f.close()
		st = os.stat(cls.test_equality)
		os.chmod(cls.test_equality, st.st_mode | stat.S_IEXEC)

	##	parse_command_list(cmdlist=None) parses arguments as expected
	#
	def test_parse_command_list (self):
		x=1


	##	runs one test file and returns its output and status
	#
	#	@return		test output and status
	def test_run_python_test_file (self):
		errorsEncountered = 0
		result = build.run_python_test_file ("/Users/carolclark/Library/CCDev/TestData/build_py/SampleTests/test_equality.py")
		if result != None:
			errorsEncountered = 1
		if errorsEncountered:
			raise AssertionError("test errors and/or failures encountered")


if __name__ == '__main__':
	unittest.main(verbosity=2)

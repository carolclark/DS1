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


##	@class	TestFile
#
#	a python test file for SampleTests
class TestFile:

	def __init__ (self, class_name, file_basename, test_methods):
		self._class_name = class_name
		self._file_basename = file_basename
		self._test_methods = test_methods
		self._file = None


	def add_test_method (self, method):
		self._test_methods.append (method)


	def write_test_file (self):
		file_path = self._sample_test_folder + "/" + self._file_basename + ".py"
		self._file = open (file_path, 'w')
		self._file.write ("#! /usr/local/bin/python3\n")
		self._file.write ("import unittest\n")
		self._file.write ("class {} (unittest.TestCase):\n".format (self._class_name))

		for method in self._test_methods:
			method.write_test_method (self._file)

		self._file.write ("if __name__ == '__main__':\n")
		self._file.write ("\tunittest.main(verbosity=2)")
		self._file.close()
		st = os.stat(file_path)
		os.chmod(file_path, st.st_mode | stat.S_IEXEC)


	_sample_test_folder = buildTestFolder() + "/SampleTests"
	_class_name = "ATestClass"
	_file_basename = "a_test_class"
	_test_methods = []
	_file = None


##	@class	TestMethod
#
#	a test method for a python file in SampleTests
class TestMethod:

	def __init__ (self, method_name, code_lines):
		self._method_name = method_name
		self._code_lines = code_lines


	def write_test_method (self, file):
		file.write ("\tdef {} (self):\n".format (self._method_name))
		for ln in self._code_lines:
			file.write ("\t\t{}\n".format(ln))


	_method_name = "a_method_name"
	_code_lines = []


##	@class	TestTesting
#
#	test testing functionality
class TestTesting (unittest.TestCase):

	## generate test files to use in tests
	#
	@classmethod
	def setUpClass(cls):

		# set up folder for sample test files
		cls.sampleTestsFolder = buildTestFolder() + "/SampleTests"
		util.ensure_directory (cls.sampleTestsFolder)

		test_equality_pass = TestFile ("TestEquality_Pass", "test_equality_pass", [])

		test_equality_pass_method = TestMethod ("test_equality_pass", [ "self.assertTrue (1 == 1)", "self.assertTrue (2 == 2)" ] )
		test_equality_pass.add_test_method (test_equality_pass_method)
		test_equality_pass.write_test_file()


	##	parse_command_list(cmdlist=None) parses arguments as expected
	#
	def test_parse_command_list (self):
		x=1


	##	runs one test file and returns its output and status
	#
	#	@return		test output and status
	def test_run_python_test_file (self):
		errorsEncountered = 0
		result = build.run_python_test_file ("/Users/carolclark/Library/CCDev/TestData/build_py/SampleTests/test_equality_pass.py")
		if result != None:
			errorsEncountered = 1
		if errorsEncountered:
			raise AssertionError("test errors and/or failures encountered")


if __name__ == '__main__':
	unittest.main(verbosity=2)

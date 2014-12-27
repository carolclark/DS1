#! /usr/local/bin/python3

#  testU_runtests.py
#  support/Developer/Python
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


## @package testRuntests			test functions for test runner
#
#	<b>Command-Line Interface:</b><ul>
#		<li>testRuntests.py	run these tests</li>
#	</ul>

##	return path to folder for use by testRuntests
#
def runtestsTestFolder():
	return os.path.expanduser ("~") + "/Library/CCDev/TestData/runtests_py"

##	return path to folder containing test files for use by these tests
#
def sample_test_folder():
	return runtestsTestFolder() + "/SampleTests"


def generate_sample_tests():
	# set up folder for sample test files
	util.ensure_directory (sample_test_folder())

	test_equality_pass = GenerateTestFile ("TestEquality_Pass", "test_equality_pass",
								[ GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 2)" ] ) ])
	test_equality_pass.write_test_file()

	test_equality_fail = GenerateTestFile ("TestEquality_Fail", "test_equality_fail",
								[ GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_fail.write_test_file()
	test_equality_error = GenerateTestFile ("TestEquality_Error", "test_equality_error",
								[ GenerateTestMethod ("test_equality_error", [
																"self.assertTrueX (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_error.write_test_file()


#================================================================================
#
#							Test File Generation
#
#================================================================================
##	@class	GenerateTestFile
#
#	generates a python test file for SampleTests
class GenerateTestFile:

	def __init__ (self, class_name, file_basename, test_methods):
		self._class_name = class_name
		self._file_basename = file_basename
		self._test_methods = test_methods
		self._file = None


	def add_test_method (self, method):
		self._test_methods.append (method)


	def write_test_file (self):
		file_path = sample_test_folder() + "/" + self._file_basename + ".py"
		with open (file_path, 'w', encoding='utf-8') as f:
			f.write ("#! /usr/local/bin/python3\n")
			f.write ("import unittest\n")
			f.write ("class {} (unittest.TestCase):\n".format (self._class_name))

			for method in self._test_methods:
				method.write_test_method (f)

			f.write ("if __name__ == '__main__':\n")
			f.write ("\tunittest.main(verbosity=2)")
		st = os.stat(file_path)
		os.chmod(file_path, st.st_mode | stat.S_IEXEC)


	_class_name = "ATestClass"
	_file_basename = "a_test_class"
	_test_methods = []
	_file = None


##	@class	GenerateTestMethod
#
#	generates a test method for GenerateTestFile
class GenerateTestMethod:

	def __init__ (self, method_name, code_lines):
		self._method_name = method_name
		self._code_lines = code_lines


	def write_test_method (self, file):
		file.write ("\tdef {} (self):\n".format (self._method_name))
		for ln in self._code_lines:
			file.write ("\t\t{}\n".format(ln))


	_method_name = "a_method_name"
	_code_lines = []


#================================================================================
#
#							The Tests
#
#================================================================================
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
		generate_sample_tests()


	##	@test	test running individual test file; verify output and status
	#
	#	@todo	implement error count
	def test_do_test_file (self):
		errorsEncountered = 0
		printResult = False

		# temporary - for visual verification
		result = runtests.do_test_file ("/Users/carolclark/Library/CCDev/bin/python/testScm.py")
		if printResult:
			print ('^^^{}^^^'.format(result))

		# passing test passes
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_pass.py")
		if printResult:
			print ('^^^{}^^^'.format(result))

		# failing test fails
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_fail.py")
		if printResult:
			print ('^^^{}^^^'.format(result))

		# test with error fails
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_error.py")
		if printResult:
			print ('^^^{}^^^'.format(result))

		self.assertTrue (errorsEncountered == 0)


class TestDoTestFile (unittest.TestCase):

	##	parse_command_list(cmdlist=None) parses arguments as expected
	#
	def test_parse_command_list (self):
		args = runtests.parse_runtests_args (['fi', 'filepath'])
		self.assertEqual (args.cmd, 'fi')
		self.assertEqual (args.filepath, 'filepath')


if __name__ == '__main__':
	unittest.main (verbosity = 2)

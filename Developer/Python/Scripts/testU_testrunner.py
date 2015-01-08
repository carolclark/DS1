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
import runtests

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)



##	@package testU_testrunner			testing of test runner
#

##	return path to folder for use by testRuntests
#
def testrunnerTestFolder():
	return os.path.expanduser ("~") + "/Library/CCDev/TestData/testrunner_py"

##	return path to folder containing test files for use by these tests
#
def sample_test_folder():
	return testrunnerTestFolder() + "/SampleTests"


#================================================================================
#
#							Test File Generation
#
#================================================================================
##	write simple tests for use by testing methods that validate testing
#
def generate_sample_tests():
	# set up folder for sample test files
	util.ensure_directory (sample_test_folder())

	test_equality_pass = GenerateTestFile ("TestEquality_Pass", "test_equality_pass", [
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 2)" ] ) ])
	test_equality_pass.write_test_file()

	test_equality_fail = GenerateTestFile ("TestEquality_Fail", "test_equality_fail", [
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_fail.write_test_file()

	test_equality_error = GenerateTestFile ("TestEquality_Error", "test_equality_error", [
								GenerateTestMethod ("test_equality_error", [
																"self.assertTrueX (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_error.write_test_file()

	test_equality_PF = GenerateTestFile ("TestEquality_PF", "test_equality_PF", [
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ),
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_PF.write_test_file()

	test_equality_FP = GenerateTestFile ("TestEquality_FP", "test_equality_FP", [
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (2 == 1)" ] ),
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ) ])
	test_equality_FP.write_test_file()

	test_equality_FF = GenerateTestFile ("TestEquality_FF", "test_equality_FF", [
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 2)" ] ),
								GenerateTestMethod ("test_equality_fail1", [
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_FF.write_test_file()

	test_equality_PP = GenerateTestFile ("TestEquality_PP", "test_equality_PP", [
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ),
								GenerateTestMethod ("test_equality_pass1", [
																"self.assertTrue (1 == 1)" ] ) ])
	test_equality_PP.write_test_file()


##	@class	GenerateTestFile
#
#	generates a python test file for SampleTests
class GenerateTestFile:

	##	create with @link class_name class_name @endlink, @link file_basename file_basename @endlink, @link test_methods list of test_methods @endlink
	#
	#	@todo		should provide for multiple test classes per file
	def __init__ (self, class_name, file_basename, test_methods):
			##	class name for collection of test methods
		self.class_name = class_name
			##	basename for file to be written
		self.file_basename = file_basename
			##	list of test methods for the specified class
		self.test_methods = test_methods
			##	file currently open for writing
		self.file = None


		##	adds the test method to list of testing_methods
		#
		def add_test_method (self, method):
			self.test_methods.append (method)


	##	write a python test file containing the methods in test_methods
	#
	def write_test_file (self):
		file_path = sample_test_folder() + "/" + self.file_basename + ".py"
		with open (file_path, 'w', encoding='utf-8') as f:
			f.write ("#! /usr/local/bin/python3\n")
			f.write ("import unittest\n")
			f.write ("class {} (unittest.TestCase):\n".format (self.class_name))

			for method in self.test_methods:
				method.write_test_method (f)

			f.write ("if __name__ == '__main__':\n")
			f.write ("\tunittest.main(verbosity=2)")
		st = os.stat(file_path)
		os.chmod(file_path, st.st_mode | stat.S_IEXEC)


##	@class	GenerateTestMethod
#
#	generates a test method for GenerateTestFile
class GenerateTestMethod:

	##	create with method_name and list of code_lines
	#
	def __init__ (self, method_name, code_lines):
		self.method_name = method_name
		self.code_lines = code_lines


	## write the test method
	#
	#	@param	file	the open file to be written to
	def write_test_method (self, file):
		file.write ("\tdef {} (self):\n".format (self.method_name))
		for ln in self.code_lines:
			file.write ("\t\t{}\n".format(ln))


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
		testsWithExceptions = 0
		printResult = False

		# passing test passes
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_pass.py")
		self.assertTrue (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		# failing test fails
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_fail.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		# test with error fails
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_error.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		# test with pass and fail
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_PF.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		# test with fail and pass
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_FP.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		# test with fail and fail
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_FF.py")
		self.assertFalse (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		# test with pass and pass
		result = runtests.do_test_file (sample_test_folder() + "/test_equality_PP.py")
		self.assertTrue (result.passed)
		testsWithExceptions = testsWithExceptions + result.failcount + result.errorcount
		if printResult:
			print ('^^^{}^^^'.format(result.output))

		self.assertTrue (testsWithExceptions == 6)


if __name__ == '__main__':
	unittest.main (verbosity = 2)

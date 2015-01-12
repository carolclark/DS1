#! /usr/local/bin/python3

#  sampletests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 1/12/15.
#  Copyright (c) 2015 C & C Software, Inc. All rights reserved.

import sys
import logging
import argparse
import os
import stat
import util

loglevel=logging.WARNING
logging.basicConfig (format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package sampletests			testing support including sample tests
#

##	write simple tests for use by test cases that validate testing
#
#	@param		destination		folder where tests are written
def generate_sample_tests (destination):
	target_folder = destination + "2"

	# set up folder for sample test files
	util.ensure_directory (target_folder)

	test_equality_pass = GenerateTestFile ("TestEquality_Pass", "test_equality_pass", [
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 2)" ] ) ])
	test_equality_pass.write_test_file (target_folder)

	test_equality_fail = GenerateTestFile ("TestEquality_Fail", "test_equality_fail", [
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_fail.write_test_file (target_folder)

	test_equality_error = GenerateTestFile ("TestEquality_Error", "test_equality_error", [
								GenerateTestMethod ("test_equality_error", [
																"self.assertTrueX (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_error.write_test_file (target_folder)

	test_equality_PF = GenerateTestFile ("TestEquality_PF", "test_equality_PF", [
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ),
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_PF.write_test_file (target_folder)

	test_equality_FP = GenerateTestFile ("TestEquality_FP", "test_equality_FP", [
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (2 == 1)" ] ),
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ) ])
	test_equality_FP.write_test_file (target_folder)

	test_equality_FF = GenerateTestFile ("TestEquality_FF", "test_equality_FF", [
								GenerateTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 2)" ] ),
								GenerateTestMethod ("test_equality_fail1", [
																"self.assertTrue (2 == 1)" ] ) ])
	test_equality_FF.write_test_file (target_folder)

	test_equality_PP = GenerateTestFile ("TestEquality_PP", "test_equality_PP", [
								GenerateTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ),
								GenerateTestMethod ("test_equality_pass1", [
																"self.assertTrue (1 == 1)" ] ) ])
	test_equality_PP.write_test_file (target_folder)


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
	def write_test_file (self, target_folder):
		file_path = target_folder + "/" + self.file_basename + ".py"
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
#	generates a test method for 2
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


##	process command-line input and dispatch to selected function
#
def main (cmdlist=None):
	pass

if __name__ == '__main__':
	print (main(sys.argv[1:]))

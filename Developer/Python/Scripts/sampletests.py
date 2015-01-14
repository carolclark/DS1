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

	# set up folder for sample test files
	util.ensure_directory (destination)

	test_equality_pass = SampleTestFile ("test_equality_pass", [
							SampleTestClass ("TestEquality_Pass", [
								SampleTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 2)" ] ) ] ) ] )
	test_equality_pass.write_test_file (destination)

	test_equality_fail = SampleTestFile ("test_equality_fail", [
							SampleTestClass ("TestEquality_Fail", [
								SampleTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ] ) ] )
	test_equality_fail.write_test_file (destination)

	test_equality_error = SampleTestFile ("test_equality_error", [
							SampleTestClass ("TestEquality_Error", [
								SampleTestMethod ("test_equality_error", [
																"self.assertTrueX (1 == 1)",
																"self.assertTrue (2 == 1)" ] ) ] ) ] )
	test_equality_error.write_test_file (destination)

	test_equality_PF = SampleTestFile ("test_equality_PF", [
							SampleTestClass ("TestEquality_PF", [
								SampleTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ),
								SampleTestMethod ("test_equality_fail", [
																"self.assertTrue (2 == 1)" ] ) ] ) ] )
	test_equality_PF.write_test_file (destination)

	test_equality_FP = SampleTestFile ("test_equality_FP", [
							SampleTestClass ("TestEquality_FP", [
								SampleTestMethod ("test_equality_fail", [
																"self.assertTrue (2 == 1)" ] ),
								SampleTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ) ] ) ] )
	test_equality_FP.write_test_file (destination)

	test_equality_FF = SampleTestFile ("test_equality_FF", [
							SampleTestClass ("TestEquality_FF", [
								SampleTestMethod ("test_equality_fail", [
																"self.assertTrue (1 == 2)" ] ),
								SampleTestMethod ("test_equality_fail1", [
																"self.assertTrue (2 == 1)" ] ) ] ) ] )
	test_equality_FF.write_test_file (destination)

	test_equality_PP = SampleTestFile ("test_equality_PP", [
							SampleTestClass ("TestEquality_PP", [
								SampleTestMethod ("test_equality_pass", [
																"self.assertTrue (1 == 1)" ] ),
								SampleTestMethod ("test_equality_pass1", [
																"self.assertTrue (1 == 1)" ] ) ] ) ] )
	test_equality_PP.write_test_file (destination)


##	@class	SampleTestFile
#
#	data for a python test file for SampleTests
class SampleTestFile:

	##	create with @link file_basename file_basename @endlink, @link test_classes list of test_classes @endlink
	#
	def __init__ (self, file_basename, test_classes):
			##	basename for file to be written
		self.file_basename = file_basename
			##	list of test classes
		self.test_classes = test_classes
			##	file currently open for writing
		self.file = None


	##	adds the test class to list of test_classes
	#
	def add_test_class (self, cls):
		self.test_class.append (cls)


	##	write a python test file containing the classes in test_classes
	#
	def write_test_file (self, target_folder):
		file_path = target_folder + "/" + self.file_basename + ".py"
		with open (file_path, 'w', encoding='utf-8') as f:
			f.write ("#! /usr/local/bin/python3\n")
			f.write ("import unittest\n")

			for cls in self.test_classes:
				cls.write_test_class (f)

			f.write ("if __name__ == '__main__':\n")
			f.write ("\tunittest.main(verbosity=2)")
		st = os.stat(file_path)
		os.chmod(file_path, st.st_mode | stat.S_IEXEC)


##	@class		SampleTestClass
#
#	a Python test class for SampleTestFile
class SampleTestClass:

	## construct from @link classname classname @endlink, @link test_methods list of test_methods @endlink
	def __init__ (self, classname, test_methods):
			## name of this class
		self.classname = classname
			##	list of test methods
		self.test_methods = test_methods


	##	add method to list of test_methods
	#
	def add_test_method (self, method):
		self.test_methods.append (method)


	##	write the test class
	#
	#	@param	file	the open file to be written to
	def write_test_class (self, file):
		file.write ("class {} (unittest.TestCase):\n".format (self.classname))
		for method in self.test_methods:
			method.write_test_method (file)


##	@class	SampleTestMethod
#
#	a test method of class SampleTestClass
class SampleTestMethod:

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

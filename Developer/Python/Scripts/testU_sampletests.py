#! /usr/local/bin/python3

#  testU_sampletests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 1/12/15.
#  Copyright (c) 2015 C & C Software, Inc. All rights reserved.


import unittest
import logging
import os
import util
import sampletests

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %///(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


##	@package testSampleTests			test for SampleTests class
#

##	return path to folder for use by testU_SampleTests
#
def sampletestsTestFolder():
	return os.path.join (sampletests.ccdevTestDataFolder(), "sampletests_py")


##	return path to folder for testU_SampleTests' generated test files
#
def sampletestsDestination():
	return sampletestsTestFolder() + "/Tests"


##	create the test folder and a folder for tests to be run
#
def setUpModule():

	# set up folder for testSampletest files
	util.ensure_directory (sampletestsTestFolder())

	# set up folder for tests generated for running
	util.ensure_directory (sampletestsDestination())


##	remove our test folders
#
def tearDownModule():
	if not sampletests.suppressTearDown():
		util.remove_my_folder (sampletestsDestination())
		util.remove_my_folder (sampletestsTestFolder())


##	@class	TestSampleTestMethod
#
#	tests for class SampleTestMethod
class TestSampleTestMethod (unittest.TestCase):

	##	@test	write_test_method generates expected content
	#
	def test_write_test_method (self):
		file_path = sampletestsTestFolder() + "/testmethod"
		testmethod = sampletests.SampleTestMethod ("testmethod", [
									"self.assertTrue (1 == 1)" ] )
		with open (file_path, 'w', encoding='utf-8') as f:
			testmethod.write_test_method (f)

		with open (file_path, 'r', encoding='utf-8') as f:
			actual = f.read()
		expected = """	def testmethod (self):
		self.assertTrue (1 == 1)
"""
		self.assertEqual (actual, expected)


##	@class	TestSampleTestClass
#
#	tests for class SampleTestClass
class TestSampleTestClass (unittest.TestCase):

	##	@test	SampleTestClass.write_test_class generates expected content
	#
	def test_write_test_class (self):
		file_path = sampletestsTestFolder() + "/testclass"
		testclass = sampletests.SampleTestClass ("TestClass", [
									sampletests.SampleTestMethod ("testmethod", [
										"self.assertTrue (1 == 1)" ] ) ] )
		with open (file_path, 'w', encoding='utf-8') as f:
			testclass.write_test_class (f)

		with open (file_path, 'r', encoding='utf-8') as f:
			actual = f.read()
		expected = """class TestClass (unittest.TestCase):
	def testmethod (self):
		self.assertTrue (1 == 1)
"""
		self.assertEqual (actual, expected)


##	@class		TestSampleTestFile
#
#	tests for class SampleTestFile
class TestSampleTestFile (unittest.TestCase):

	##	@test	write_test_file generates expected content
	def test_write_test_file (self):
		test_equality_pass = sampletests.SampleTestFile ("test_equality_pass", [
								sampletests.SampleTestClass ("TestEquality_Pass", [
									sampletests.SampleTestMethod ("test_equality_pass", [
										"self.assertTrue (1 == 1)",
										"self.assertTrue (2 == 2)" ] ) ] ) ] )
		test_equality_pass.write_test_file (sampletestsTestFolder())

		file_path = sampletestsTestFolder() + "/" + test_equality_pass.file_basename + ".py"
		with open (file_path, 'r', encoding='utf-8') as f:
			actualContent = f.read()
		expectedContent = """#! /usr/local/bin/python3
import unittest
class TestEquality_Pass (unittest.TestCase):
	def test_equality_pass (self):
		self.assertTrue (1 == 1)
		self.assertTrue (2 == 2)
if __name__ == '__main__':
	unittest.main(verbosity=2)"""
		self.assertEqual (actualContent , expectedContent)


if __name__ == '__main__':
	unittest.main (verbosity = 2)

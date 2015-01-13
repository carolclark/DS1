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


## @package testSampleTests			test for SampleTests class
#

##	return path to folder for use by testU_SampleTests
#
def sampletestsTestFolder():
	return os.path.expanduser ("~") + "/Library/CCDev/TestData/sampletests_py"


##	return path to folder for testU_SampleTests' generated test files
#
def sampletestsDestination():
	return sampletestsTestFolder() + "/Tests"


##	@class	TestEquality
#
#	a simple test class that can be used to verify the operation of the testing system
class TestEquality (unittest.TestCase):

	## test that can be easily modified to verify system behavior with a passing or a failing test
	#
	def test_equality (self):

		self.assertTrue (1 == 1)


##	@class		tests for class SampleTest
#
class testSampleTest (unittest.TestCase):

	##	@test	write_test_file generates expected content
	def test_write_test_file(self):
		# set up folder for sample test files
		util.ensure_directory (sampletestsDestination())

		test_equality_pass = sampletests.SampleTestFile ("test_equality_pass", [
								sampletests.SampleTestClass ("TestEquality_Pass", [
									sampletests.SampleTestMethod ("test_equality_pass", [
										"self.assertTrue (1 == 1)",
										"self.assertTrue (2 == 2)" ] ) ] ) ] )
		test_equality_pass.write_test_file (sampletestsDestination())
		file_path = sampletestsDestination() + "/test_equality_pass.py"
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
		self.assertEqual (actualContent, expectedContent)


if __name__ == '__main__':
	unittest.main (verbosity = 2)

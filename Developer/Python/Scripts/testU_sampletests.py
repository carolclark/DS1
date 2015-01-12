#! /usr/local/bin/python3

#  testU_sampletests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 1/12/15.
#  Copyright (c) 2015 C & C Software, Inc. All rights reserved.


import unittest
import logging
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
class TestSampleTest (unittest.TestCase):

	##	@test	testSampleTests class
	def test_SampleTests(self):
		pass


if __name__ == '__main__':
	unittest.main (verbosity = 2)

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


	##	parse_command_list(cmdlist=None) parses arguments as expected
	#
	def test_parse_command_list (self):
		x=1


if __name__ == '__main__':
	unittest.main(verbosity=2)

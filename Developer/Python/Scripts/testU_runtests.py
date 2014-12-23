#! /usr/local/bin/python3

#  testU_runtests.py
#  support/Developer/Python
#
#  Created by Carol Clark on 12/23/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.


import unittest
import logging
import os
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


##	@class	TestEquality
#
#	a simple test class that can be used to verify the operation of the testing system
class TestEquality (unittest.TestCase):

	## test that can be easily modified to verify system behavior with a passing or a failing test
	#
	def test_equality (self):

		self.assertTrue (1 == 1)


class TestDoTestfile (unittest.TestCase):

	##	parse_command_list(cmdlist=None) parses arguments as expected
	#
	def test_parse_command_list (self):
		args = runtests.passe_runtests_args (['fi', 'filepath'])
		self.assertEqual (args.cmd, 'fi')
		self.assertEqual (args.filepath, 'filepath')


	## test: test_do_testfile; verify result
	def test_do_testfile (self):
		x = 1


if __name__ == '__main__':
	unittest.main (verbosity = 2)

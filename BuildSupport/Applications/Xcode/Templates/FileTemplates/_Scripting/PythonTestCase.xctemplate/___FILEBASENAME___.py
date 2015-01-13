#! /usr/local/bin/python3

#  ___FILENAME___
#  <#ProjectPathFromDev#>/___PROJECTNAME___
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.


import unittest
import logging
import os
import util
import <#module#>

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package test<#Module#>			test methods for <#description#>
#

##	return path to folder for use by testU_<#Module#>
#
def <#module#>TestFolder():
	return os.path.expanduser ("~") + "/Library/CCDev/TestData/<#module#>_py"


##	@class	TestEquality
#
#	a simple test class that can be used to verify the operation of the testing system
class TestEquality (unittest.TestCase):

	## test that can be easily modified to verify system behavior with a passing or a failing test
	#
	def test_equality (self):

		self.assertTrue (1 == 1)


##	@class		tests for method <#MethodToTest#>
#
class Test<#MethodToTest#> (unittest.TestCase):

	##	@test	<#desc#>
	def test_<#method_name#>(self):
		x = 1


##	@class	TestParseCmdlist
#
#	verify that parser parses arguments as expected
class TestParseCmdlist (unittest.TestCase):

	##	@test	test parse_cmdlist()
	#
	def test_parse_command_list (self):
		args = <#module#>.parse_<#module#>_args(['<#abbrev#>', '<#args#>'])
		self.assertEqual(args.cmd, '<#abbrev#>')


if __name__ == '__main__':
	unittest.main (verbosity = 2)

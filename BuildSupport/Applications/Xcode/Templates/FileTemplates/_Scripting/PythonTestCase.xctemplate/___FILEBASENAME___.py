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
#	<b>Command-Line Interface:</b><ul>
#		<li>test<#Module#>.py	run these tests</li>
#	</ul>

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


class Test<#MethodToTest#> (unittest.TestCase):

	##	parse_command_list(cmdlist=None) parses arguments as expected
	#
	def test_parse_command_list (self):
		args = util.parse_runtests_args (['<#abbrev#>', '<#args#>', '--<#flags#>'])
		self.assertEqual (args.cmd, '<#abbrev#>')


	## test <#method_name#>; verify result
	def test_<#method_name#>(self):
		x  = 1


if __name__ == '__main__':
	unittest.main (verbosity = 2)

#! /usr/local/bin/python3

#  ___FILENAME___
#  <#Repository#>/___PROJECTNAME___
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.


import unittest
import logging
import <#module#>

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


class TestEquality(unittest.TestCase):

	def test_equality(self):
		""" test: can be easily modified to verify system behavior with a passing or a failing test """

		self.assertTrue(1 == 1)


class Test<#Method#>(unittest.TestCase):

	def test_parse_command_list(self):
		""" test: parse_<#method#>_args(cmdlist=None) parses arguments as expected"""


	def test_<#methodOrTestname#>(self):
		""" test: <#description#>) """


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromName(["test<#Module#>.TestEquality", "test<#Module#>.Test<#Method#>"])
	unittest.TextTestRunner(verbosity=2).run(suite)

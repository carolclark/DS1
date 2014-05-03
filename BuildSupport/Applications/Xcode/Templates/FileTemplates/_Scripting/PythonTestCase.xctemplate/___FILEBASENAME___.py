#!/bin/python

#  ___FILENAME___
#  <#Project#>
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.


import unittest
import <#module#>


class Test<#Module#>(unittest.TestCase):

	def test_<#methodOrTestname#>(self):
		""" test <#description#>) """


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromName(["test<#Module#>.Test<#Module#>"])
	unittest.TextTestRunner(verbosity=2).run(suite)

#! /usr/bin/python

#  testScm.py
#  CCDev
#
#  Created by Carol Clark on 12/1/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

import unittest

class TestEquality(unittest.TestCase):

	def test_equality(self):
		""" This test can be easily modified to verify system behavior with a passing or a failing test. """

		self.assertTrue(1 == 1)

class TestScm(unittest.TestCase):

	def test_equality(self):
		""" This test can be easily modified to verify system behavior with a passing or a failing test. """

		self.assertTrue(1 == 1)

if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromTestCase(TestEquality)
	suite = unittest.TestLoader().loadTestsFromTestCase(TestScm)
	unittest.TextTestRunner(verbosity=2).run(suite)

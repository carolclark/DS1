#! /usr/bin/python

#  testScm.py
#  CCDev
#
#  Created by Carol Clark on 12/1/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

import unittest
import scm

class TestEquality(unittest.TestCase):

	def test_equality(self):
		""" This test can be easily modified to verify system behavior with a passing or a failing test. """

		self.assertTrue(1 == 1)

class TestScm(unittest.TestCase):

	def testMergeMessage(self):
		""" test mergeMessage(branchName="", issueNum=0) """

		self.assertEqual(scm.mergeMessage("abc", 55), "Merge branch 'abc' (#55)")
		self.assertEqual(scm.mergeMessage(), "Merge branch")
		self.assertEqual(scm.mergeMessage("abc"), "Merge branch 'abc'")
		self.assertEqual(scm.mergeMessage(55), "Merge branch '55'")
		self.assertEqual(scm.mergeMessage(issueNum=55), "Merge branch (#55)")


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testScm.TestEquality", "testScm.TestScm"])
	unittest.TextTestRunner(verbosity=2).run(suite)

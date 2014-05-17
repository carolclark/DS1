#! /usr/bin/python

#  testScm.py
#  Developer
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

	def test_merge_message(self):
		""" test merge_message(branchName="", issueNum=0) """

		self.assertEqual(scm.merge_message("abc", 55), "Merge branch 'abc' (#55)")
		self.assertEqual(scm.merge_message(), "Merge branch")
		self.assertEqual(scm.merge_message("abc"), "Merge branch 'abc'")
		self.assertEqual(scm.merge_message(55), "Merge branch '55'")
		self.assertEqual(scm.merge_message(issueNum=55), "Merge branch (#55)")

	def test_merge_message_cmd(self):
		""" test scm.main(--merge_message branchName="", issueNum=0)

			equivalent to command line: scm.py --mergeMessage branchName="", issueNum=0
		"""

		self.assertEqual(scm.main("abc 40"), "Merge branch 'abc' (#40)")


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testScm.TestEquality", "testScm.TestScm"])
	unittest.TextTestRunner(verbosity=2).run(suite)

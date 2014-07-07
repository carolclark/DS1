#! /usr/local/bin/python3

#  testScm.py
#  Developer
#
#  Created by Carol Clark on 12/1/13.
#  Copyright 2013-14 C & C Software, Inc. All rights reserved.


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
		with self.assertRaises(TypeError): scm.merge_message ("abc", "55", "more")
		self.assertEqual(scm.merge_message(), "Merge branch")

	def test_merge_message_cmd(self):
		""" test scm.main(['--flag', 'foo', 'bar'])

			equivalent to command line: scm.py --flag foo bar
		"""

		self.assertEqual(scm.main(['--merge-message', 'abc', '40']), "Merge branch 'abc' (#40)")
		self.assertEqual(scm.main(['-m', 'xyz', '24']), "Merge branch 'xyz' (#24)")
		with self.assertRaises(SyntaxError): scm.main(["abc"])
		with self.assertRaises(SyntaxError): scm.main([])
		with self.assertRaises(SyntaxError): scm.main(['--merge-message', 40])

if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testScm.TestEquality", "testScm.TestScm"])
	unittest.TextTestRunner(verbosity=2).run(suite)

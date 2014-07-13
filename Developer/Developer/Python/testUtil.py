#! /usr/local/bin/python3

#  testUtil.py
#  Support/Developer
#
#  Created by Carol Clark on 7/12/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.


import unittest
import logging
import util

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


class TestEquality(unittest.TestCase):

	def test_equality(self):
		""" test: can be easily modified to verify system behavior with a passing or a failing test """

		self.assertTrue(1 == 1)


class TestParseCmdlist(unittest.TestCase):

	def test_parse_cmdlist(self):
		""" test: test command-list parser) """

		self.assertTrue(1 == 1)


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testUtil.TestEquality", "testUtil.TestParseCmdlist"])
	unittest.TextTestRunner(verbosity=2).run(suite)

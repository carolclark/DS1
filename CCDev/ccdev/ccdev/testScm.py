#! /usr/bin/python

#  testScm.py
#  CCDev
#
#  Created by Carol Clark on 12/1/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

import unittest

class TestScm(unittest.TestCase):

	def test_equality(self):
		self.assertTrue(1 == 1)

if __name__ == '__main__':
	unittest.main()

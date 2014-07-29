#! /usr/local/bin/python3

#  testUtil.py
#  Support/Developer
#
#  Created by Carol Clark on 7/12/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.


import unittest
import argparse
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
		""" test: parse_cmdlist, including help and error handling """

		# make a parser
		parser = argparse.ArgumentParser(description="test argparser")
		parser.add_argument ("arg1")

		# success
		args = util.parse_cmdlist(parser, ['abc'])
		self.assertEqual(args.arg1, 'abc')

		# syntax errors
		with self.assertRaises(SyntaxError): util.parse_cmdlist(parser, [])
		with self.assertRaises(SyntaxError): util.parse_cmdlist(parser, ['abc', 123])

		# help: does not generate error; does output help-type string
			# capture output from --help
		from io import StringIO
		import sys
		old_stdout = sys.stdout
		redirectedOutput = StringIO()
		sys.stdout = redirectedOutput
		self.assertFalse(util.parse_cmdlist(parser, ['--help']))
		sys.stdout = old_stdout
		result_string = redirectedOutput.getvalue()

			# test result
		self.assertTrue(result_string.startswith('usage: '))


	def test_parse_cmdlist_cmd(self):
		""" test: scm.main(['parse_cmdlist', ...]) not supported from command line """

		with self.assertRaises(SyntaxError): util.main(['ps', 'abc'])


class TestRemoveFolder(unittest.TestCase):

	def test_parse_removefolder(self):
		""" test: parse_utility_args(cmdlist=None) parses arguments as expected"""

		args = util.parse_utility_args(['rf', 'fldr', '--dry-run'])
		self.assertEqual(args.cmd, 'rf')

		args = util.parse_utility_args(['remove_folder', 'aPath'])
		self.assertEqual(args.cmd, 'remove_folder')
		args = util.parse_utility_args(['rf', 'somewhere'])
		self.assertEqual(args.cmd, 'rf')
		self.assertEqual(args.folder, 'somewhere')

		args = util.parse_utility_args(['remove_folder', 'aPath', '--parent', 'parentArg'])
		self.assertEqual(args.cmd, 'remove_folder')
		self.assertEqual(args.parent, ['parentArg'])

		args = util.parse_utility_args(['remove_folder', 'aPath', '--parent', 'parentArg', '--dry-run'])
		self.assertTrue(args.dry_run)
		args = util.parse_utility_args(['remove_folder', 'aPath', '--parent', 'parentArg'])
		self.assertFalse(args.dry_run)


	def test_remove_folder_cmd(self):
		""" test: scm.main(['remove_folder', 'folder'[, '--parent PARENT'], ['--dry-run]]) """

		self.assertEqual(util.main(['remove_folder', 'abc', '--dry-run']), 0)
		self.assertEqual(util.main(['rf', 'aFolder', '-p', "~/parent", '--dry-run']), 0)
		with self.assertRaises(SyntaxError):
			util.main(['rf', 'aFolder', '-p', "parent", '--dry-run'])
		with self.assertRaises(SyntaxError): util.main([])


	def test_path_to_remove(self):
		""" test calculation and verification of path_to_remove """

		from os.path import expanduser
		home = expanduser("~")

		# success
		self.assertEqual(util.path_to_remove('CCDev/bin'), home + '/Library/CCDev/bin')
		self.assertEqual(util.path_to_remove('bin', '~/Library/CCDev'), home + '/Library/CCDev/bin')
		self.assertEqual(util.remove_folder_at_home_path('CCDev/tmp', 'dry_run'), home + '/Library/CCDev/tmp')
		self.assertEqual(util.remove_folder_at_home_path("CCDev/tmpX"), None)

		# raises error if path does not start with '~/' or if path exists but is not a directory
		with self.assertRaises(SyntaxError): util.path_to_remove('ab', '/c')
		with self.assertRaises(SyntaxError): util.path_to_remove('', '/c')
		with self.assertRaises(IOError): util.path_to_remove('CCDev/bin/errcc')

		# returns None if path does not exist
		self.assertEqual(util.path_to_remove('fake_name_xyz987'), None)


	def test_remove_folder_at_home_path(self):
		""" test: remove_folder_at_home_path(folder, parent=None) """

		self.assertFalse(util.remove_folder_at_home_path("xxxxx",
														 dry_run='DRY_RUN'))

		# takes no action if error in path specification
#		with self.assertRaises(SyntaxError): util.remove_folder_at_home_path("CCDev/tmpX", None, dry_run='DRY_RUN')


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testUtil.TestEquality", "testUtil.TestParseCmdlist", "testUtil.TestRemoveFolder"])
	unittest.TextTestRunner(verbosity=2).run(suite)

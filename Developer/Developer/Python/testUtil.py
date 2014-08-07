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
import os

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

	def setUp(self):
		self.home = os.path.expanduser("~")
		self.testFolder = self.home + "/Library/CCDev/TestData/util_py"	# used by conformance tests


	def test_parse_removefolder(self):
		""" test: parse_utility_args(cmdlist=None) parses arguments as expected"""

		args = util.parse_utility_args(['rf', 'fldr', '--dry-run'])
		self.assertEqual(args.cmd, 'rf')
		self.assertEqual(args.parent, None)
		self.assertEqual(args.dry_run, 'DRY_RUN')

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

		# folder present; would have been removed
		self.assertTrue(util.main(['remove_folder', 'CCDev/tmp', '--dry-run']).startswith('=== ' + self.home + '/Library/CCDev/tmp:'))

		# syntax errors for invalid input
		with self.assertRaises(SyntaxError):
			util.main(['rf', 'aFolder', '-p', "parent", '--dry-run'])
		with self.assertRaises(SyntaxError): util.main([])


	def test_path_to_remove(self):
		""" test: calculation and verification of path_to_remove """

		# success
		self.assertEqual(util.path_to_remove('CCDev/bin'), self.home + '/Library/CCDev/bin')
		self.assertEqual(util.path_to_remove('bin', '~/Library/CCDev'), self.home + '/Library/CCDev/bin')

		# returns None if path does not exist
		self.assertEqual(util.path_to_remove('fake_name_xyz987'), None)
		self.assertEqual(util.path_to_remove('abc'), None)

		# raise SyntaxError if composed path does not start with '~/'
		with self.assertRaises(SyntaxError): util.path_to_remove('ab', '/c')
		with self.assertRaises(SyntaxError): util.path_to_remove('', '/c')

		# raise if path exists but is not a directory
		with self.assertRaises(IOError): util.path_to_remove('CCDev/bin/errcc')


	def test_ensure_directory(self):
		""" test that directory is created; no action if directory or file already present """

		# ensure test folder
		folder = self.testFolder + "/EnsureDirectory"
		util.ensure_directory(folder, False)

		# ok if directory already present
		util.ensure_directory(folder, False)

		# add a regular file inside test folder
		textfile = folder + '/textfile'
		f = open(textfile, 'w')
		f.write(textfile)
		f.close()
		self.assertTrue(os.path.exists(textfile))

		# does nothing if regular file already present at path
		util.ensure_directory(textfile, False)
		self.assertTrue(os.path.exists(textfile))

		# can add another folder inside
		util.ensure_directory(folder + '/textfile2', False)
		self.assertTrue(os.path.exists(folder + '/textfile2'))

		# clean up
		os.rmdir(folder + '/textfile2')
		os.remove(textfile)
		os.rmdir(folder)
		self.assertFalse(os.path.isdir(folder))


	def test_do_remove_fs_item(self):
		""" test: remove single item, changing permissions if necessary """

		# set up TestData folder
		folder = self.testFolder + "/RemoveItem"
		self.assertEqual(folder, "/Users/carolclark/Library/CCDev/TestData/util_py/RemoveItem")
		util.ensure_directory(folder, False)

		# dry-run remove top folder: check values returned, actual file status
		self.assertTrue(os.path.isdir(folder))
		output, remove_count = util.do_remove_fs_item(folder, 'DRY_RUN')
		self.assertEqual(output, 'remove directory {}\n'.format(folder))
		self.assertEqual(remove_count, 1)
		self.assertTrue(os.path.isdir(folder))

		# remove top folder without dry-run: check values returned, actual file status
		output, remove_count = util.do_remove_fs_item(folder, False)
		self.assertEqual(output, 'remove directory {}\n'.format(folder))
		self.assertEqual(remove_count, 1)
		self.assertFalse(os.path.isdir(folder))


	def test_remove_folder_at_home_path(self):
		""" test: dry-runs; verify action that would have been taken """

		# success - would remove folder
		_, remove_count = util.remove_folder_at_home_path('CCDev/tmp', dry_run='DRY_RUN')
		self.assertNotEqual(remove_count, 0)

		# no action if specified folder not present; may already have been removed
		_, remove_count = util.remove_folder_at_home_path("xxxxx", dry_run='DRY_RUN')
		self.assertEqual(remove_count, 0)
		_, remove_count = util.remove_folder_at_home_path('aFolder', "~/parent", 'DRY_RUN')
		self.assertEqual(remove_count, 0)


	def test_do_remove_folder_with_contents(self):
		""" test that specified files are actually removed """

		# set test folder path
		folder = self.testFolder + "/RemoveFolder/Proj C"

		# does nothing if folder does not exist
		_, remove_count = util.do_remove_folder_with_contents(folder + '/xxxxx', dry_run='DRY_RUN')
		self.assertEqual(remove_count, 0)

		# set up TestData folder
		if not os.path.exists(folder):
			os.makedirs(folder)

		dirname = folder + '/Bryson'
		if not os.path.exists(dirname):
			os.makedirs(dirname)

		# remove TestData folder
		#		import pdb; pdb.set_trace()
		#		result = util.do_remove_folder_with_contents(folder, None)
#		self.assertFalse(os.path.isdir(folder))


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testUtil.TestEquality", "testUtil.TestParseCmdlist", "testUtil.TestRemoveFolder"])
	unittest.TextTestRunner(verbosity=2).run(suite)

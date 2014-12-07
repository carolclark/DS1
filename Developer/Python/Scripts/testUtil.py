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
from io import StringIO

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
		self.utilTestFolder = self.home + "/Library/CCDev/TestData/util_py"	# used by conformance tests


	def test_parse_removefolder(self):
		""" test: parse_utility_args(cmdlist=None) parses arguments as expected"""

		args = util.parse_utility_args(['rf', 'fldr', '--dry-run'])
		self.assertEqual(args.cmd, 'rf')
		self.assertEqual(args.parent, None)
		self.assertEqual(args.dry_run, 'DRY_RUN')

		args = util.parse_utility_args(['remove_my_folder', 'aPath'])
		self.assertEqual(args.cmd, 'remove_my_folder')
		args = util.parse_utility_args(['rf', 'somewhere'])
		self.assertEqual(args.cmd, 'rf')
		self.assertEqual(args.folder, 'somewhere')

		args = util.parse_utility_args(['remove_my_folder', 'aPath', '--parent', 'parentArg'])
		self.assertEqual(args.cmd, 'remove_my_folder')
		self.assertEqual(args.parent, ['parentArg'])

		args = util.parse_utility_args(['remove_my_folder', 'aPath', '--parent', 'parentArg', '--dry-run'])
		self.assertTrue(args.dry_run)
		args = util.parse_utility_args(['remove_my_folder', 'aPath', '--parent', 'parentArg'])
		self.assertFalse(args.dry_run)


	def test_remove_my_folder_cmd(self):
		""" test: scm.main(['remove_my_folder', 'folder'[, '--parent PARENT'], ['--dry-run]]) """

		# folder present; would have been removed
		self.assertTrue(util.main(['remove_my_folder', 'CCDev/tmp', '--dry-run']).startswith('=== ' + self.home + '/Library/CCDev/tmp:'))

		# syntax errors for invalid input
		with self.assertRaises(SyntaxError):
			util.main(['rf', 'aFolder', '-p', "parent", '--dry-run'])
		with self.assertRaises(SyntaxError): util.main([])


	def test_path_to_my_folder(self):
		""" test: calculation and verification of path_to_my_folder """

		# success
		self.assertEqual(util.path_to_my_folder('CCDev/bin'), self.home + '/Library/CCDev/bin')
		self.assertEqual(util.path_to_my_folder('bin', '~/Library/CCDev'), self.home + '/Library/CCDev/bin')

		# returns None if path does not exist
		self.assertEqual(util.path_to_my_folder('fake_name_xyz987'), None)
		self.assertEqual(util.path_to_my_folder('abc'), None)

		# raise SyntaxError if composed path does not start with '~/'
		with self.assertRaises(SyntaxError): util.path_to_my_folder('ab', '/c')
		with self.assertRaises(SyntaxError): util.path_to_my_folder('', '/c')

		# raise if path exists but is not a directory
		with self.assertRaises(IOError): util.path_to_my_folder('CCDev/bin/errcc')


	def test_ensure_directory(self):
		""" test that directory is created; no action if directory or file already present """

		# ensure test folder
		localFolder = self.utilTestFolder + "/EnsureDirectory"
		util.ensure_directory(localFolder)

		# ok if directory already present
		util.ensure_directory(localFolder)

		# does nothing if regular file already present at path
			# add a regular file inside test folder
		textfile = os.path.join (localFolder, 'textfile')
		util.make_small_textfile(localFolder, 'textfile')
		self.assertTrue(os.path.exists(textfile))
			# attempt to overwrite regular file with directory
		util.ensure_directory(textfile)
		self.assertTrue(os.path.exists(textfile))
		self.assertFalse(os.path.isdir(textfile))

		# can add another folder inside
		util.ensure_directory(localFolder + '/textfile2')
		self.assertTrue(os.path.exists(localFolder + '/textfile2'))

		# clean up
		os.rmdir(localFolder + '/textfile2')
		os.remove(textfile)
		os.rmdir(localFolder)
		self.assertFalse(os.path.isdir(localFolder))


	def test_do_remove_fs_item(self):
		""" test: remove single item, changing permissions if necessary """

		# set up TestData folder
		folder = self.utilTestFolder + "/RemoveItem"
		self.assertEqual(folder, "/Users/carolclark/Library/CCDev/TestData/util_py/RemoveItem")
		util.ensure_directory(folder)

		# dry-run remove top folder: check values returned, actual file status
		self.assertTrue(os.path.isdir(folder))
		output, remove_count = util.do_remove_fs_item(folder, 'DRY_RUN')
		self.assertEqual(output, 'remove directory {}\n'.format(folder))
		self.assertEqual(remove_count, 1)
		self.assertTrue(os.path.isdir(folder))

		# remove top folder without dry-run: check values returned, actual file status
		output, remove_count = util.do_remove_fs_item(folder)
		self.assertEqual(output, 'remove directory {}\n'.format(folder))
		self.assertEqual(remove_count, 1)
		self.assertFalse(os.path.isdir(folder))


	def test_remove_my_folder(self):
		""" test: dry-runs; verify action that would have been taken """

		# success - would remove folder
		_, remove_count = util.remove_my_folder('CCDev/tmp', dry_run='DRY_RUN')
		self.assertNotEqual(remove_count, 0)

		# no action if specified folder not present; may already have been removed
		_, remove_count = util.remove_my_folder("xxxxx", dry_run='DRY_RUN')
		self.assertEqual(remove_count, 0)
		_, remove_count = util.remove_my_folder ('aFolder', "~/parent", 'DRY_RUN')
		self.assertEqual(remove_count, 0)


	def test_do_remove_folder_with_contents(self):
		""" test that specified files are actually removed """

		# does nothing if folder does not exist
		_, remove_count = util.do_remove_folder_with_contents(self.utilTestFolder + '/xxxxx', dry_run='DRY_RUN')
		self.assertEqual(remove_count, 0)

		# set up TestData folder
		localFolder = self.utilTestFolder + "/Remove Folder"
		util.ensure_directory(localFolder)
		self.assertTrue(os.path.isdir(localFolder))

		projc = localFolder + "/Proj C"
		util.ensure_directory(projc)
		self.assertTrue(os.path.isdir(projc))

		bryson = os.path.join(projc, 'Bryson')
		util.ensure_directory (bryson)
		emily = os.path.join(projc, 'Emily', 'Nine')
		util.ensure_directory(emily)
		corlan = os.path.join(projc, 'Corlan', 'Three')
		util.ensure_directory (corlan)

		util.make_small_textfile (corlan, 'red')
		util.make_small_textfile (corlan, 'green')
		util.make_small_textfile (emily, 'blue')
		util.make_small_textfile (emily, 'pink')

		# verify some local folder contents
		self.assertTrue(os.path.isdir(bryson))
		self.assertTrue(os.path.isdir(corlan))
		self.assertTrue (os.path.exists(os.path.join (emily, 'blue')))

		# attempt to remove folder does not remove regular file
		util.do_remove_folder_with_contents (os.path.join (emily, 'blue'))
		self.assertTrue (os.path.exists(os.path.join (emily, 'blue')))

		# removing interior folder removes that folder
		util.do_remove_folder_with_contents (corlan)
		self.assertFalse (os.path.exists(corlan))
		self.assertTrue (os.path.exists(emily))

		# top folder corlan should still be present; remove now
		self.assertTrue (os.path.isdir(os.path.join (projc, 'Corlan')))
		util.do_remove_folder_with_contents (os.path.join (projc, 'Corlan'))
		self.assertFalse (os.path.isdir(os.path.join (projc, 'Corlan')))

		# full folder corlan should still be present; remove now
		self.assertTrue (os.path.isdir(os.path.join (projc, 'Emily')))
		util.do_remove_folder_with_contents (os.path.join (projc, 'Emily'))
		self.assertFalse (os.path.isdir(os.path.join (projc, 'Emily')))

		# remove this test's local folder
		util.do_remove_folder_with_contents(localFolder)
		self.assertFalse(os.path.isdir(localFolder))


if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testUtil.TestEquality", "testUtil.TestParseCmdlist", "testUtil.TestRemoveFolder"])
	unittest.TextTestRunner(verbosity=2).run(suite)

#! /usr/local/bin/python3

#  testScm.py
#
#  Support/Developer
#
#  Created by Carol Clark on 12/1/13.
#  Copyright (c) 2013-14 C & C Software, Inc. All rights reserved.


import unittest
import logging
import scm

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


class TestScm(unittest.TestCase):

	def test_parse_command_list(self):
		""" test: parse_scm_args(cmdlist=None) parses arguments as expected"""

		args = scm.parse_scm_args(['sb'])
		self.assertEqual(args.cmd, 'sb')

		args = scm.parse_scm_args(['mergemessage', 'hello', '678'])
		self.assertEqual(args.cmd, 'mergemessage')
		args = scm.parse_scm_args(['mm', 'hello', '678'])
		self.assertEqual(args.cmd, 'mm')
		self.assertEqual(args.branchName, 'hello')
		self.assertEqual(args.repoIssue, '678')

		args = scm.parse_scm_args(['mm', 'aTask', '567', '-r', "Repo"])
		self.assertEqual(args.repository, ['Repo'])


	def test_merge_message(self):
		""" test: merge_message(branchName="", repoIssue=0) """

		self.assertEqual(scm.merge_message("abc", 55), "Merge branch 'abc' (#55)")
		self.assertEqual(scm.merge_message("aBranch3", '76', 'Repo'), "Merge branch 'aBranch3' (Repo#76)")
		self.assertEqual(scm.merge_message(), "Merge branch")
		self.assertEqual(scm.merge_message("abc"), "Merge branch 'abc'")
		self.assertEqual(scm.merge_message(55), "Merge branch '55'")
		self.assertEqual(scm.merge_message(repoIssue=55), "Merge branch (#55)")
		self.assertEqual(scm.merge_message ("abc", "55", "more"), "Merge branch 'abc' (more#55)")
		self.assertEqual(scm.merge_message(), "Merge branch")
		self.assertEqual(scm.merge_message('aTask', '567', "Repo"), "Merge branch 'aTask' (Repo#567)")


	def test_merge_message_cmd(self):
		""" test: scm.main(['mergemessage', 'branchName', 'repoIssue'])

			equivalent to command line:
				scm.py mergemessage <branchName> <repoIssue>
		"""

		self.assertEqual(scm.main(['mergemessage', 'abc', '40']), "Merge branch 'abc' (#40)")
		self.assertEqual(scm.main(['mm', 'xyz', '24']), "Merge branch 'xyz' (#24)")
		self.assertEqual(scm.main(['mm', 'aTask', '567', '-r', "Repo"]), "Merge branch 'aTask' (Repo#567)")
		self.assertEqual(scm.main(['mm', 'abc', '0']), "Merge branch 'abc'")
		with self.assertRaises(SyntaxError): scm.main([])
		with self.assertRaises(ValueError): scm.main(['mm', 'abc', 'def'])
		with self.assertRaises(SyntaxError): scm.main(['mergemessage', 40])
		# following pass, but generate superfluous error messages
		#with self.assertRaises(SyntaxError): scm.main(["abc"])
		#with self.assertRaises(SyntaxError): scm.main(["-hi"])

if __name__ == '__main__':
	suite = unittest.TestLoader().loadTestsFromNames(["testScm.TestScm"])
	unittest.TextTestRunner(verbosity=2).run(suite)

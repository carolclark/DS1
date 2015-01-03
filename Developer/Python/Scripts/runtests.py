#! /usr/local/bin/python3

#  runtests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/22/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

import sys
import logging
import argparse
import os
import subprocess
import util

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package runtests			runs tests; gathers and reports results
#
#	@par @b Command-Line @b Interface:
#	@code		runtests.py [ --filepath | --fi ] <filepath>@endcode
#	runs a single test file: prints output to stderr
#	@result	(NYI)	return status code: 0 pass; 1 fail; 2 error

##	@class		TestFileResult
#
#	result of running one test file
class TestFileResult:

	standardLine = "-" * 70

	def __init__ (self, filepath, output):
		self.filepath = filepath
		self.output = output
		self.outputlines = output.splitlines()


##	run one test file
#
#	@param		filepath		path to test file to run
def do_test_file (filepath):
	output = None
	savedPath = os.getcwd()
	os.chdir(os.path.dirname(filepath))

	# run the test file
	p = subprocess.Popen(filepath, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
	_, output = p.communicate()

	result = TestFileResult (filepath, output)

	os.chdir (savedPath)
	return result


##	process argments for runtests commands
#
#	function is separate to allow direct testing
def parse_runtests_args (cmdlist=None):

	# create runtests parser
	parser = argparse.ArgumentParser(description="run tests")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create `do_test_file` parser
	parser_fi = subparsers.add_parser('file', aliases=['fi'], help="run single test file")
	parser_fi.add_argument("file", help="name of test file to run")

	args = util.parse_cmdlist(parser, cmdlist)
	return args


##	process command-line input and dispatch to selected function
#
def main (cmdlist=None):

	args = parse_runtests_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'do_test_file' or args.cmd == 'fi':
		print (do_test_file (args.file).output)


if __name__ == '__main__':
	print (main(sys.argv[1:]))

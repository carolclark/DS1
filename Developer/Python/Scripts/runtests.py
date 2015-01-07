#! /usr/local/bin/python3

#  runtests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/22/14.
#  Copyright (c) 2015 C & C Software, Inc. All rights reserved.

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

##	@class		TestMethod
#
#	a test method of a TestFileResult
class TestMethod:

	## construct from test's @link summary summary @endlink
	def __init__ (self, summary):
			##	summary line for this test method in unittest's verbose output
		self._summary = summary


	##	parse method's summary line
	#
	#	python output (verbose) for a test file begins with a summary line for each test method run
	#	@n parse summary line to establish the test method's class, method name, and status
	def	parse_summary(self):
		return True


##	@class		TestFileResult
#
#	result of running one test file
class TestFileResult:

		##	standard line used to separate sections in test output
	standardLine = "-" * 70
		##	line used to start an exception section
	exceptionHeader = "=" * 70

	## construct from @link filepath filepath @endlink and @link output output @endlink
	#
	def __init__ (self, filepath, output):
			##	path of file that was tested
		self._filepath = filepath
			## expected test output, as a multi-line string
		self._output = output
			##	array of lines comprising output
		self._outputlines = output.splitlines()
			##	array of TestMethod objects parsed from the test's output
		self._tests = []


	##	parses output; generates top-level data and TestMethod objects
	#
	def parse_output (self):
		test = TestMethod (self._outputlines[0])
		if test.parse_summary():
			self._tests.append (test)
		else:
			del test


##	runs a single test file
#
#	@param		filepath		path to test file to run
#	@return		TestFileResult object
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
		print (do_test_file (args.file)._output)


if __name__ == '__main__':
	print (main(sys.argv[1:]))

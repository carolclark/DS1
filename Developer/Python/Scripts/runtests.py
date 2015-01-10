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
import re
import util

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


##	@package runtests			runs tests; gathers and reports results
#

##	@class		ParseError
#
#	custom exception class
class ParseError (Exception):
	pass


##	@class		ParseOutputError
#
#	custom exception class for errors encountered while parsing output of a script
class ParseOutputError (Exception):

	## construct from @link scriptname scriptname @endlink
	def __init__ (self, scriptname, lineno, expected, found):
			## filename of script whose output is being parsed
		self.scriptname = scriptname
			## number of line being parsed
		self.lineno = lineno
			## string expected
		self.expected = expected
			## string found
		self.found = found


	## generate string representation of ParseOutputError
	def __str__ (self):
		msg = "output line {}#{}: expected: {}; found: {}".format (self.scriptname, self.lineno, self.expected, self.found)
		return msg


##	@class		TestMethod
#
#	a test method of a TestFileResult
class TestMethod:

	## construct from test's @link summary summary @endlink
	def __init__ (self, summary):
			##	summary line for this test method in unittest's verbose output
		self.summary = summary
			## test method name
		self.name = ""
			## class signature
		self.signature = ""
			## status: ok | FAIL | ERROR"
		self.status = ""


	##	parse method's summary line
	#
	#	python output (verbose) for a test file begins with a summary line for each test method run
	#	@n parse summary line to establish the test method's class, method name, and status
	def	parse_summary(self):
		m = re.match (r"([A-Z,a-z,0-9,_]*) \(([A-Z,a-z,0-9,_,\.]*)\) \.\.\. (ok|FAIL|ERROR)", self.summary)
		if not m:
			return False
		self.name = m.group(1)
		self.signature = m.group(2)
		self.status = m.group(3)
		return True


##	@class		TestFileResult
#
#	result of running one test file
#	@n
#	@n Python:
#		- When run from cmdline, each Python test generates the output we need.
#		- However, the test runner outputs only a series of '.EF' results plus failure/error information.
#		- TestFileResult gathers text and statistics from the full output, and provides output that shows a summary line for each test method that was run.
#
class TestFileResult:

		##	standard line used to separate sections in test output
	standardLine = "-" * 70
		##	line used to start an exception section
	exceptionHeader = "=" * 70

	## construct from @link filepath filepath @endlink and @link output output @endlink
	#
	def __init__ (self, filepath, output):
			##	path of file that was tested
		self.filepath = filepath
			## expected test output, as a multi-line string
		self.output = output
			##	array of lines comprising output
		self.outputlines = output.splitlines()
			##	array of TestMethod objects parsed from the test's output
		self.tests = []
			## number of test methods run
		self.testcount = 0
			## number of test methods resulting in test failures
		self.failcount = 0
			## number of test methods resulting in errors
		self.errorcount = 0
			## whether all tests in file passed
		self.passed = True


	##	parses output; generates top-level data and TestMethod objects
	#
	def parse_output (self):
		self.passed = True
		i = 0				# index into self._ouptutlines
		while True:			# parse summary lines
			test = TestMethod (self.outputlines[i])
			if test.parse_summary():
				self.tests.append (test)
				self.testcount = self.testcount + 1
				if test.status != "ok":
					self.passed = False
					if test.status == "ERROR":
						self.errorcount = self.errorcount + 1
					if test.status == "FAIL":
						self.failcount = self.failcount + 1
				i = i + 1
			else:
				del test
				break

		if self.testcount == 0:
			raise ParseError ("file `{}`: no test results found".format(self.filepath))

		if self.outputlines[i] != "":
			raise ParseError ("file {} input line #{}: expected {}; found {}".format(self.filepath, i, TestFileResult.exceptionHeader, self.outputlines[i]))

		i = i + 1
		if not self.passed:
			if self.outputlines[i] != TestFileResult.exceptionHeader:
				raise ParseOutputError (self.filepath, i, TestFileResult.exceptionHeader, self.outputlines[i])


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
	try:
		result.parse_output()
	except ParseError as e:
		raise e
	finally:
		os.chdir (savedPath)

	return result


##	process argments for runtests commands
#
#	function is separate to allow direct testing
def parse_runtests_args (cmdlist=None):

	# create runtests parser
	parser = argparse.ArgumentParser(description="run tests")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create `file` parser
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

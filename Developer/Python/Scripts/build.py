#! /usr/local/bin/python3

#  build.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/10/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

import sys
import os
import logging
import argparse
import subprocess
import util

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)



## @package build			handle building, cleaning and testing of products
#
#	<b>Command-Line Interface:</b><ul>
#		<li>(add command-line patterns here)</li>
#	</ul>


##	run one test file
#
#	@param		filepath		path to test file to run
def run_one_test_file (filepath):
	result = None
	printResult = False
	savedPath = os.getcwd()
	os.chdir(os.path.dirname(filepath))

	# run the test file
	p = subprocess.Popen(filepath, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
	_, result = p.communicate()
	if printResult:
		print ('^^^{}^^^'.format(result))

	os.chdir (savedPath)
	return result


##	process argments for build commands
#
#	function is separate to allow direct testing
def parse_build_args (cmdlist=None):

	# create build parser
	parser = argparse.ArgumentParser (description="handle building, cleaning and testing of products")
	subparsers = parser.add_subparsers (help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create test parser
	parser_ts = subparsers.add_parser ('test', aliases=['ts '], help="functions to support automated testing")
	parser_ts.add_argument ("path", help="path to file or folder")

	args = util.parse_cmdlist (parser, cmdlist)
	return args


##	process command-line input and dispatch to selected function
#
def main (cmdlist=None):

	args = parse_build_args (cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'test' or args.cmd == 'ts':
		print ('run some tests')


if __name__ == '__main__':
	print (main(sys.argv[1:]))

#! /usr/local/bin/python3

#  runtests.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/22/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

import sys
import logging
import argparse
import util

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package runtests			runs tests; gathers and reports results
#
#	<b>Command-Line Interface:</b><ul>
#		<li>runtests --run_testfile	filepath</li>
#	</ul>


##	runs and reports results for one test file
#
def do_testfile (filepath):
	x = 1


##	process argments for runtests commands
#
#	function is separate to allow direct testing
def parse_runtests_args (cmdlist=None):

	# create runtests parser
	parser = argparse.ArgumentParser(description="run tests")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create do_testfile` parser
	parser_fi = subparsers.add_parser('do_testfile', aliases=['fi'], help="run single test file")
	parser_fi.add_argument("filepath", help="name of test file to run")

	args = util.parse_cmdlist(parser, cmdlist)
	return args


##	process command-line input and dispatch to selected function
#
def main (cmdlist=None):

	args = parse_runtests_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'do_testfile' or args.cmd == 'fi':
		return (do_testfile (filepath))


if __name__ == '__main__':
	print (main(sys.argv[1:]))

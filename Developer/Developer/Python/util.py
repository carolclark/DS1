#! /usr/local/bin/python3

#  util.py
#  Support/Developer
#
#  Created by Carol Clark on 7/12/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

import sys
import argparse
import logging

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


def parse_cmdlist(parser, cmdlist=None):
	""" parse 'cmdlist' with 'parser', generating exception if unsuccessful

		on help request: returns False; request already handled by parser
		else on success: return successfully parsed args
		on error: raise SyntaxError with appropriate message
	"""

	try:
		if cmdlist:
			try:
				args = parser.parse_args(cmdlist)
			except:
				if ('-h' in cmdlist or '--help' in cmdlist):
					return False	# may cause 'None' to be printed after help
				raise SyntaxError("parsing failed: {}".format(cmdlist))
		else:
			raise SyntaxError("missing argument list")
	except:
		raise SyntaxError("invalid command list '{}'".format(cmdlist))
	return args


def parse_utility_args(cmdlist=None):
	""" process argments for util commands

		function is separate in order to allow direct testing
	"""

	# create utility parser
	parser = argparse.ArgumentParser(description="general utility functions")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create parse_cmdlist parser
	parser_ps = subparsers.add_parser('parse_cmdlist', aliases=['ps'], help="parses command list <cmdlist> with parser <parser>")
	parser_ps.add_argument("parser", help="parser to use")

	args = parse_cmdlist(parser, cmdlist)
	return args


def main(cmdlist=None):
	""" process command-line input and dispatch to selected function """

	args = parse_utility_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'parse_cmdlist' or args.cmd == 'ps':
		return "Hello, World!"


if __name__ == '__main__':
	print (main(sys.argv[1:]))

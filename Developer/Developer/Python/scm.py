#! /usr/local/bin/python3

#  scm.py
#  Support/Developer
#
#  Created by Carol Clark on 12/4/13.
#  Copyright {c} 2013-14 C & C Software, Inc. All rights reserved.


import argparse
import logging
import sys

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


def merge_message(branchName="", repoIssue=""):
	""" construct scm merge message for the specified branch

		includes branchName and GitHub repoIssue if supplied
		prepends '#' to repoIssue if an integer
	"""

	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"
	if (len(str(repoIssue))) > 0:
		msg = msg + ' ('
		try:
			if int(repoIssue) > 0:
				repoIssueIsInt=True
		except:
			repoIssueIsInt=False
		if repoIssueIsInt:
			msg = msg + '#'
		msg = msg + str(repoIssue) + ')'
	return msg


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


def parse_scm_args(cmdlist=None):
	""" process argments for Source Control commands

		function is separate in order to allow direct testing
	"""

	# create the top-level parser
	parser = argparse.ArgumentParser(description="source control utility functions")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create merge_message parser
	parser_mm = subparsers.add_parser('mergemessage', aliases=['mm'], help="generate commit message for merging 'branchName' into master")
	parser_mm.add_argument("branchName", help="name of branch to be merged")
	parser_mm.add_argument("repoIssue",  help="applicable GitHub issue")

	# create sync_branch parser
	parser_sb = subparsers.add_parser('syncbranch', aliases=['sb'], help="sync  branch with master (merge master into current branch)")

	args = parse_cmdlist(parser, cmdlist)
	return args


def main(cmdlist=None):
	""" process command-line input and dispatch to selected function """

	args = parse_scm_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'mergemessage' or args.cmd == 'mm':
		mm = merge_message(args.branchName, args.repoIssue)
		return mm

if __name__ == '__main__':
	print (main(sys.argv[1:]))

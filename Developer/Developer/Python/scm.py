#! /usr/local/bin/python3

#  scm.py
#  Support/Developer
#
#  Created by Carol Clark on 12/4/13.
#  Copyright {c} 2013-14 C & C Software, Inc. All rights reserved.


import sys
import logging
import argparse
import util

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


def merge_message(branchName="", repoIssue="", repository=""):
	""" construct scm merge message for the specified branch

		includes branchName, and GitHub repoIssue if nonzero
		if present, repository specifies repository for repoIssue
	"""

	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"

	if repoIssue and int(repoIssue):
		msg = msg + ' ('
		if repository and len(repository) > 0:
			msg = msg + repository
		msg = msg + '#' + str(repoIssue) + ")"
	return msg


def parse_scm_args(cmdlist=None):
	""" process argments for Source Control commands

		function is separate in order to allow direct testing
	"""

	# create the top-level parser
	parser = argparse.ArgumentParser(description="source control utility functions")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create merge_message parser
	parser_mm = subparsers.add_parser('merge_message', aliases=['mm'], help="generate commit message for merging 'branchName' into master")
	parser_mm.add_argument("branchName", help="name of branch to be merged")
	parser_mm.add_argument("repoIssue",  help="applicable GitHub issue")
	parser_mm.add_argument("--repository", '-r', nargs=1,
		help="name of repository for this issue")

	# create sync_branch parser
	parser_sb = subparsers.add_parser('sync_branch', aliases=['sb'], help="sync  branch with master (merge updated master into current branch)")

	args = util.parse_cmdlist(parser, cmdlist)
	return args


def main(cmdlist=None):
	""" process command-line input and dispatch to selected function """

	args = parse_scm_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'merge_message' or args.cmd == 'mm':
		repoArg=None
		if args.repository:
			repoArg=args.repository[0]
		mm = merge_message(args.branchName, args.repoIssue, repoArg)
		return mm

if __name__ == '__main__':
	print (main(sys.argv[1:]))

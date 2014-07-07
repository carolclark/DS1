#! /usr/local/bin/python3

#  scm.py
#  Developer
#
#  Created by Carol Clark on 12/4/13.
#  Copyright 2013-14 C & C Software, Inc. All rights reserved.


import argparse
import logging
import sys

logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S')


def merge_message(branchName="", issueNum=0):
	""" construct scm merge message for the specified branch, including GitHub issue number if supplied """

	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"
	if issueNum > 0:
		msg = msg + " (#" + str(issueNum) + ")"
	return msg


def main(cmdlist=None):
	""" process command-line input and dispatch to selected function """

	parser = argparse.ArgumentParser(description="source control utility functions")
	parser.add_argument("-m", "--merge-message",
						help="generate commit message for merging 'branchName' into master",
						action="store_true")
	parser.add_argument("branchName",
					help="name of branch to be merged")
	parser.add_argument("issueNum", type=int,
					help="applicable GitHub issue number")
	if cmdlist:
		try:
			args = parser.parse_args(cmdlist)
		except:
			if (cmdlist == ['-h']) or (cmdlist == ['--help']):
				return
			raise SyntaxError("parsing failed")
	else:
		raise SyntaxError("missing argument list")
	if args.merge_message:
		mm = merge_message(args.branchName, args.issueNum)
		return mm
	else:
		raise SyntaxError("unrecognized command: '{}'".format(cmdlist[0]))

if __name__ == '__main__':
	print (main(sys.argv[1:]))

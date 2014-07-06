#! /usr/local/bin/python3

#  scm.py
#  Developer
#
#  Created by Carol Clark on 12/4/13.
#  Copyright 2013-14 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.


import argparse
import logging
import shlex
import sys

logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=logging.INFO)


def merge_message(branchName="", issueNum=0):
	""" construct scm merge message for the specified branch, including issue number if supplied """

	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"
	if int(issueNum) > 0:
		msg = msg + " (#" + str(issueNum) + ")"
	return msg


def main(cmdlist=None):
	""" process command-line input and dispatch to selected function """

	logging.info("cmdlist argument: {}".format(cmdlist))
	parser = argparse.ArgumentParser()
	parser.add_argument("branchName")
	parser.add_argument("issueNum")
	args=None
	if cmdlist:
		try:
			args = parser.parse_args(cmdlist)
		except:
			raise SyntaxError("parsing failed")
	else:
		raise SyntaxError("missing argument list")
	logging.info("parse result: {}".format(args))
	cmd = "--merge-message"
	if cmd == '--merge-message':
		mm = merge_message(args.branchName, args.issueNum)
		return mm
	else:
		raise SyntaxError('unrecognized command: {}'.format(cmd))

if __name__ == '__main__':
	print (main(sys.argv[1:]))

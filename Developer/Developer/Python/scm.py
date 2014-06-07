#! /usr/bin/python

#  scm.py
#  Developer
#
#  Created by Carol Clark on 12/4/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.


import argparse
import logging
import shlex

logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S')


def merge_message(branchName="", issueNum=0):
	""" construct scm merge message for the specified branch, including issue number if supplied """

#	import pdb; pdb.set_trace()
	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"
	if issueNum > 0:
		msg = msg + " (#" + str(issueNum) + ")"
	return msg


def main(cmdline=None):
	""" process command-line arguments and dispatch to selected function """

	logging.warning('Here is a pretend warning.')
	parser = argparse.ArgumentParser()
	parser.add_argument("branchName")
	parser.add_argument("issueNum")
	if cmdline is None:
		args = parser.parse_args()
	else:
		args = parser.parse_args(shlex.split(cmdline))
	return merge_message(args.branchName, args.issueNum)


if __name__ == '__main__':
	print main()

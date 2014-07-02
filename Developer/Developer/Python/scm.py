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

logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S')


def merge_message(branchName="", issueNum=0):
	""" construct scm merge message for the specified branch, including issue number if supplied """

	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"
	if int(issueNum) > 0:
		msg = msg + " (#" + str(issueNum) + ")"
	return msg


def main(*argsin):
	""" process command-line arguments and dispatch to selected function """

	args = argsin[0]
	branchName = ""
	issueNum = 0
	if len(args) == 1:
		if type(args[0]) is str:
			branchName = args[0]
		else:
			if type(args[0]) is int:
				issueNum = args[0]
	if len(args) == 2:
		branchName = args[0]
		issueNum = args[1]

	mm = merge_message(branchName, issueNum)
	return mm


if __name__ == '__main__':
	print (main(sys.argv[1:]))

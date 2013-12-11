#! /usr/bin/python

#  scm.py
#  CCDev
#
#  Created by Carol Clark on 12/4/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

def merge_message(branchName="", issueNum=0):
	""" construct scm merge message for the specified branch, including issue number if supplied """

	msg = "Merge branch"
	if (len(str(branchName))) > 0:
		msg = msg + " '" + str(branchName) + "'"
	if issueNum > 0:
		msg = msg + " (#" + str(issueNum) + ")"
	return msg

if __name__ == '__main__':
	print merge_message ("abc", 55)

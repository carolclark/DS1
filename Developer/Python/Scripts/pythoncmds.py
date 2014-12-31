#! /usr/local/bin/python3

#  pythoncmds.py
#  Support/Developer/Python
#
#  Created by Carol Clark on 12/31/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.


## 	@package	pythoncmds		command-line interface for our python scripts
#
#	in this document: commands are grouped by python module; each module is shown as if it were a function

#	runtests
##	run one or more test files
#	@par run one test file
#	@code		runtests.py [ --filepath | --fi ] <filepath>@endcode
#	runs a single test file
#	@n@b output: prints output to stderr
#	@n@b return: (NYI) return status code: 0 pass; 1 fail; 2 error
#
#	@par run tests from a folder
def runtests():
	x = 1

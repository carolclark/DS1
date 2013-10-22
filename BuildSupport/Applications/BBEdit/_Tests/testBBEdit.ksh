#!/bin/ksh

#  testBBEdit.ksh
#  Support
#
#  Created by Carol Clark on 9/16/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

CCDev="${HOME}/Library/CCDev"
. ${CCDev}/bin/ccInstall

testBBEditInstall() {
	# CheckSyntax.scpt
	if [[ ! -e "${HOME}/Library/Application Support/BBEdit/Scripts/CheckSyntax.scpt" ]] ; then
		fail "$LINENO: script CheckSyntax missing"
	fi
}

# run tests
. $(ccInstall --SHUnit)

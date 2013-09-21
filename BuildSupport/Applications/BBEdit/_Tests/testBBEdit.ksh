#!/bin/sh

#  testBBEdit.ksh
#  Support
#
#  Created by Carol Clark on 9/16/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

testBBEditInstall() {
	# CheckSyntax.scpt
	if [[ ! -e "${HOME}/Library/Application Support/BBEdit/Scripts/CheckSyntax.scpt" ]] ; then
		fail "$LINENO: script CheckSyntax missing"
	fi
}

# load shunit2
. ${SHUnit}

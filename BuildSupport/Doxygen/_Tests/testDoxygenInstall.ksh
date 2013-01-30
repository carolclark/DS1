#!/bin/ksh

#  testDoxygenInstall.ksh
#  Support
#
#  Created by Carol Clark on 1/30/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

testEquality() {
	assertEquals "$LINENO: " 1 1
}

# load shunit2
. ${SHUnit}

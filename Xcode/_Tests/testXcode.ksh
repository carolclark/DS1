#!/bin/sh

#  testXcodeBuild.ksh
#  BuildSupport
#
#  Created by Carol Clark on 9/13/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.

testEquality() {
	assertEquals "$LINENO: " 1 1
}

# load shunit2
. ${SHUnit}

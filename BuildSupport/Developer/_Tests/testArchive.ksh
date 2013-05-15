#!/bin/ksh

#  testArchive
#  Support
#
#  Created by Carol Clark on 5/15/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top

. "${CCDev}/bin/errcc"

oneTimeSetUp() {
	mkdir -p "${CCDev}/TestData/tarTest"
}

testEquality() {
	assertEquals "$LINENO: " 1 1
}


# load shunit2
. ${SHUnit}

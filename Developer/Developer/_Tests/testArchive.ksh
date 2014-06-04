#!/bin/ksh

#  testArchive
#  Support
#
#  Created by Carol Clark on 5/15/13.
#  Copyright 2013-14 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===
CCDev="${HOME}/Library/CCDev"
. ${CCDev}/bin/ccInstall

testEquality() {
	assertEquals "$0#$LINENO: " 1 1
}


# run tests
. $(ccInstall --SHUnit)

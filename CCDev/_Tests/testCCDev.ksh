#!/bin/ksh

#  testCCDev.ksh
#  Support
#
#  Created by Carol Clark on 10/21/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#^ CCDev_install.ksh
testCCDev() {
	testData="${CCDev}/TestData"
	# Scripts/cleanProjectTarget
	fl="${CCDev}/bin/cleanProjectTarget"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: CCDev script cleanProjectTarget missing" 
	fi
}

# load shunit2
. ${SHUnit}

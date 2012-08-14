#!/bin/ksh

#  ___FILENAME___
#  <#Project#>
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
#  Confidential and Proprietary.

testEquality() {
	assertEquals "$LINENO: " 1 1
}

# load shunit2
. ${SHUnit}

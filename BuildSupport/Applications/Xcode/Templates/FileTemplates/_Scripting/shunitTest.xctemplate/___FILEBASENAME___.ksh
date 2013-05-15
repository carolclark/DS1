#!/bin/ksh

#  ___FILENAME___
#  <#Project#>
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===

. "${CCDev}/bin/errcc"

testEquality() {
	assertEquals "$LINENO: " 1 1
}

<#body#>

# load shunit2
. ${SHUnit}

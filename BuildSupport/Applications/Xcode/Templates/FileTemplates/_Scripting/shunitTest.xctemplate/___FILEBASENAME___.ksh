#!/bin/ksh

#  ___FILENAME___
#  <#Project#>
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/errcc"
. "${CCDev}/bin/ccInstall"

testEquality() {
	assertEquals "$LINENO: " 1 1
}

<#body#>

# run tests
. $(ccInstall --SHUnit)

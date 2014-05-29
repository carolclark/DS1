#!/bin/ksh

#  ___FILENAME___
#  <#Repository#>/___PROJECTNAME___
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.

#pragma mark 0 === Top
#pragma mark === Markers ===

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

testEquality() {
	assertEquals "$LINENO: " 1 1
}

<#body#>

# run tests
. $(ccInstall --SHUnit)

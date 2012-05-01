#!/bin/ksh

#  testCCDev_Setup.ksh
#  Support
#
#  Created by Carol Clark on 10/19/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

testGitSetup() {
	if [[ ${CCDev} = "" ]] ; then
		fail "$LINENO: '${CCDev}' undefined"
	fi
	if [[ ! -e ${CCDev}/Git/exclude ]] ; then
		fail "$LINENO: file ${CCDev}/Git/exclude missing" 
	fi
	if [[ ! -e ${CCDev}/tmp ]] ; then
		fail "$LINENO: file ${CCDev}/tmp missing" 
	fi
}

testEnvironment() {
	if [[ ${FPATH} = "" ]] ; then
		fail "$LINENO: '${FPATH}' undefined"
	fi
	if [[ ! -e ${HOME}/.profile ]] ; then
		fail "$LINENO: file .profile missing" 
	fi
	if [[ ! -e ${CCDev}/bin/.kshrc ]] ; then
		fail "$LINENO: file .kshrc missing" 
	fi
	if [[ ! -e ${HOME}/.MacOSX/environment.plist ]] ; then
		fail "$LINENO: file environment.plist missing" 
	fi
}

testScripts() {
	if [[ ! -e $CCDev/func/errtrap ]] ; then
		fail "$LINENO: file errtrap missing" 
	fi
	
}

testThirdParty() {
	if [[ ! -e ${SHUnit} ]] ; then
		fail "$LINENO: shunit2 binary missing" 
	fi
}

# load shunit2
. ${SHUnit}

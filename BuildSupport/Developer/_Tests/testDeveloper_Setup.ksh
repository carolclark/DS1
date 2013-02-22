#!/bin/ksh

#  testDeveloper_Setup.ksh
#  Support
#
#  Created by Carol Clark on 10/19/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

testGitSetup() {
	assertEquals "$LINENO"': incorrect core.excludesfile' ${CCDev}/Git/exclude $(git config --global core.excludesfile)
	assertEquals "$LINENO"': incorrect diff.tool' opendiff $(git config --global diff.tool)
	assertEquals "$LINENO"': incorrect difftool.prompt' false $(git config --global difftool.prompt)
	
	excludesfile=$(git config --global core.excludesfile)
	assertTrue "$LINENO: git excludes file ${excludesfile} missing" "[ -e ${excludesfile} ]"

	attributesfile=$(git config --global core.attributesfile)
	assertTrue "$LINENO: git attributes file ${attributesfile} missing" "[ -e ${attributesfile} ]"
}

testEnvironment() {
	if [[ ${CCDev} = "" ]] ; then
		fail "$LINENO: '${CCDev}' undefined"
	fi
	if [[ ! -e ${CCDev}/tmp ]] ; then
		fail "$LINENO: file ${CCDev}/tmp missing" 
	fi
	if [[ ${FPATH} = "" ]] ; then
		fail "$LINENO: '${FPATH}' undefined"
	fi
	if [[ ! -e ${HOME}/.profile ]] ; then
		fail "$LINENO: file .profile missing" 
	fi
	if [[ ! -e ${CCDev}/bin/.kshrc ]] ; then
		fail "$LINENO: file .kshrc missing" 
	fi

	assertEquals "$LINENO: incorrect "'$SHELL' /bin/ksh $(launchctl getenv SHELL)
	dev=$(launchctl getenv DEV)
	if [[ ${USER} = carolclark ]] ; then
		assertEquals "$LINENO"': incorrect $DEV' "/Volumes/Mac/Users/carolclark/Dev" ${dev}
	else
		assertEquals "$LINENO"': incorrect $DEV' ${HOME}/Dev ${dev}
	fi
	assertEquals "$LINENO"': incorrect $CCDev' ${HOME}/CCDev $(launchctl getenv CCDev)
	assertEquals "$LINENO"': incorrect $VISUAL' \"/usr/bin/emacs\" $(launchctl getenv VISUAL)
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

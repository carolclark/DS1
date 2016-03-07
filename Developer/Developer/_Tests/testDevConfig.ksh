#!/bin/ksh

#  testDevConfig.ksh
#  Support
#
#  Created by Carol Clark on 10/19/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

HOME="/Users/carolclark"
CCDev="${HOME}/Library/CCDev"
DEV="${HOME}/Dev"
. ${CCDev}/bin/ccInstall

testEnvironment() {
	assertEquals "$LINENO: incorrect '${CCDev}'" "${CCDev}" "${HOME}/Library/CCDev"
	if [[ ! -e ${CCDev}/tmp ]] ; then
		fail "$LINENO: file ${CCDev}/tmp missing"
	fi
	if [[ ! -e ${HOME}/.profile ]] ; then
		fail "$LINENO: file .profile missing"
	fi
	if [[ ! -e ${CCDev}/bin/.kshrc ]] ; then
		fail "$LINENO: file .kshrc missing"
	fi
}

testGitSetup() {
	assertEquals "$LINENO"': incorrect core.excludesfile' ${CCDev}/Git/exclude $(git config --global core.excludesfile)
	assertEquals "$LINENO"': incorrect diff.tool' opendiff $(git config --global diff.tool)
	assertEquals "$LINENO"': incorrect difftool.prompt' false $(git config --global difftool.prompt)

	excludesfile=$(git config --global core.excludesfile)
	assertTrue "$LINENO: git excludes file ${excludesfile} missing" "[ -e ${excludesfile} ]"

	attributesfile=$(git config --global core.attributesfile)
	assertTrue "$LINENO: git attributes file ${attributesfile} missing" "[ -e ${attributesfile} ]"
}

testScripts() {
	if [[ ! -e ${CCDev}/bin/ccInstall ]] ; then
		fail "$LINENO: function file ccInstall missing"
	fi
	if [[ ! -e ${CCDev}/bin/execInstallScript ]] ; then
		fail "$LINENO: script file execInstallScript missing"
	fi
}

testThirdParty() {
	if [[ ! -e $(ccInstall --SHUnit) ]] ; then
		fail "$LINENO: shunit2 binary missing"
	fi
}

# run tests
. $(ccInstall --SHUnit)

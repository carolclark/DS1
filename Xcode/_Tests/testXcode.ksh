#!/bin/sh

#  testXcodeBuild.ksh
#  Support
#
#  Created by Carol Clark on 9/13/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

testEquality() {
	assertEquals "$LINENO: " 1 1
}

testXodeInstall() {
	# goMarker.workflow
	if [[ ! -e ${HOME}/Library/Scripts/Xcode/goMarker.workflow ]] ; then
		fail "$LINENO: script goMarker missing" 
	fi

	# HistoryFile.xctemplate
	fl="${HOME}/Library/Developer/Xcode/Templates/FileTemplates/Cdoc/HistoryFile.xctemplate"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file template Cdoc/HistoryFile.xctemplate missing" 
	fi
	if [[ ! -d "${fl}" ]] ; then
		fail "$LINENO: file template Cdoc/HistoryFile.xctemplate: directory expected" 
	fi

}

# load shunit2
. ${SHUnit}

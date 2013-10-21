#!/bin/ksh

#  testXcodeBuild.ksh
#  Support
#
#  Created by Carol Clark on 9/13/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

. "${CCDev}/bin/ccInstall"

testEquality() {
	assertEquals "$LINENO: " 1 1
}

testXcodeInstall() {
	# viewCdoc.scpt
	if [[ ! -e ${HOME}/Library/Scripts/Xcode/viewCdoc.scpt ]] ; then
		fail "$LINENO: script viewCdoc missing" 
	fi

	# HistoryFile.xctemplate
	fl="${HOME}/Library/Developer/Xcode/Templates/FileTemplates/_Documentation/HistoryFile.xctemplate"
	if [[ ! -e "${fl}" ]] ; then
		fail "$LINENO: file template _Documentation/HistoryFile.xctemplate missing" 
	fi
	if [[ ! -d "${fl}" ]] ; then
		fail "$LINENO: file template _Documentation/HistoryFile.xctemplate: directory expected" 
	fi
}

# run tests
. $(ccInstall --SHUnit)

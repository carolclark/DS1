#!/bin/ksh

#  testArchive
#  Support
#
#  Created by Carol Clark on 5/15/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===

testData="${CCDev}/TestData/tarTest"
archiveDestination="${CCDev}/TestData/tarArchives"; export archiveDestination
. "${CCDev}/bin/archive"

#pragma mark 1 === oneTimeSetUp
oneTimeSetUp() {
	mkdir -p "${testData}"
	mkdir -p "${testData}/folder"
	echo "fileA" > "${testData}/folder/fileA"
	mkdir -p "${testData}/folder/inside"
	echo "fileB" > "${testData}/folder/inside/fileB"
}

#pragma mark 2 === messageContainsText
function messageContainsText {	# message expectedText
	echo "$1" | grep "$2"
}

#pragma mark 3 === Check Archive Contents
function archiveContainsItem {
    lines=$(tar -tf "$1" | sed 's|\(.*\)|!\1!|g' | grep "!$2!")
	[[ -n "$lines" ]]
	return $?
}

function verify_Present {		# _where_, archivePath, item
	archiveContainsItem "${2}" "${3}"
	assertTrue "${1} archive item ${3} missing" $?
}

function verify_Missing {		# _where_, archivePath, item
	archiveContainsItem "${2}" "${3}"
	assertFalse "${1} unexpected archive item ${3} present" $?
}

#pragma mark 5 === testArchiveFolder
testArchiveFolder() {
	cd "${testData}"

	msg=$(archive --getArchiveDestination)
	assertEquals "$0#$LINENO:" 0 $?
	assertEquals "$0#$LINENO:" "$archiveDestination" "$msg"

	msg=$(archive --folder)
	assertEquals "$0#$LINENO:" $RC_InvalidArgument $?
	assertEquals "$0#$LINENO:" "expected --folder <folderName>" "$msg"

	msg=$(archive --folder "folder")
	assertEquals "$0#$LINENO:" 0 $?
	exp="folder: new archive $archiveDestination/$(archive --getLastArchivePath) created"
	assertEquals "$0#$LINENO:" "$exp" "$msg"

	msg=$(archive --folder "folderX")
	assertNotEquals "$0#$LINENO: error expected" 0 $?
	messageContainsText "$msg" "folder \"folderX\" does not exist \[RC_NoSuchFileOrDirectory:#$RC_NoSuchFileOrDirectory\]"
	assertTrue "$0#$LINENO: expected text not found" $?

	msg=$(archive --getLastArchivePath)
	assertEquals "$0#$LINENO:" 0 $?
	archivePath="$archiveDestination/$msg"
	assertTrue "$0#$LINENO: $archivePath is not a file" "[[ -f '$archivePath' ]]"

	archiveContainsItem "$archivePath" 'folder/inside'
	assertFalse "$0#$LINENO: archive item present" "[[ $? = 0 ]]"
	archiveContainsItem "$archivePath" 'folder/inside/'
	assertTrue "$0#$LINENO: archive item missing" "[[ $? = 0 ]]"

	verify_Missing "$0#$LINENO:" "$archivePath" "folder/inside"
	verify_Present "$0#$LINENO:" "$archivePath" "folder/inside/"
	verify_Present "$0#$LINENO:" "$archivePath" "folder/inside/fileB"
}


testEquality() {
	assertEquals "$0#$LINENO: " 1 1
}


# load shunit2
. ${SHUnit}

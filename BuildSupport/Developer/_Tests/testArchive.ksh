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

#pragma mark 2 === testArchiveFolder
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
}


testEquality() {
	assertEquals "$0$LINENO: " 1 1
}


# load shunit2
. ${SHUnit}

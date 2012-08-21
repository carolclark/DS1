#!/bin/ksh

#  doxygenBuild.ksh
#  Support
#
#  Created by Carol Clark on 12/20/11.
#  Copyright 2011-12 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# doxygenBuild.ksh -- builds Doxygen documentation
'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

if [[ ! -n $1 ]] ; then
	print "missing project parameter"
	exit 1
fi
project=$1

doxygenPath=/Applications/Doxygen.app/Contents/Resources/doxygen
outputDir=/Users/carolclark/CCDev/Sites/Doxygen/${project}
mkdir -p $outputDir
st=$?
if [[ $st > 0 ]] ; then
	print "failed to create output directory $outputDir"
	exit $st
fi

#  Run doxygen on the config file
$doxygenPath "${DEV}/${project}/Doxygen/${project}_doxygen.txt"
st=$?
if [[ $st > 0 ]] ; then
	print "error while generating Doxygen docs"
	exit $st
fi

# make docset using the Makefile that just generated
make -C $outputDir/html install
st=$?
if [[ $st > 0 ]] ; then
	print "error while creating $project.docset"
	exit $st
fi

# copy the docset to the location expected by Xcode
docsetPath="/Users/$USER/Library/Developer/Shared/Documentation/DocSets/com.candcsoft.$project.docset"
cp -r $outputDir/html/com.candcsoft.$project.docset $docsetPath
st=$?
if [[ $st > 0 ]] ; then
	print "could not copy docset to $docsetPath"
	exit $st
fi

# tell Xcode to load the docset
osascript -e "tell application \"Xcode\" to load documentation set with path \"$docsetPath\""
st=$?
if [[ $st > 0 ]] ; then
	print "error loading $docsetPath into Xcode"
	exit $st
fi

exit 0

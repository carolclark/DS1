#!/bin/ksh

#  CCDev.install
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
CCDev.install -- install CCDev support
'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

cp CCDev/Functions/ccInstall.ksh ${FPATH}/ccInstall		# install new installer first
cp CCDev/Scripts/cleanProjectTarget.ksh ${CCDev}/bin/cleanProjectTarget
chmod a+x ${CCDev}/bin/cleanProjectTarget

ccInstall --getActions result "${1}"
st=$?
if [[ ${st} > 0 ]] ; then
	print "$0 $LINENO: ${result.errorMessage}"
	exit ${st}
fi

# run tests
typeset -i failcnt=0

trap "" ERR
print "== CCDev/_Tests/testCCDev.ksh"
result=$(CCDev/_Tests/testCCDev.ksh)
if [[ "${?}" > 0 ]] ; then
	failcnt="${failcnt}"+1
fi
trap "$trapString" ERR
print "${result}"

print "== CCDev/_Tests/testCcInstall.ksh"
result=$(CCDev/_Tests/testCcInstall.ksh)
if [[ "${?}" > 0 ]] ; then
	failcnt="${failcnt}"+1
fi
trap "$trapString" ERR
print "${result}"

print "== CCDev/_Tests/testCCDev_Setup.ksh"
result=$(CCDev/_Tests/testCCDev_Setup.ksh)
if [[ "${?}" > 0 ]] ; then
	failcnt="${failcnt}"+1
fi
trap "$trapString" ERR
print "${result}"

exit "${failcnt}"

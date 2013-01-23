#!/bin/ksh

# ccInstallAction.ksh
# Support
#
#  Created by Carol Clark on 1/23/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# ccInstallAction -- call ccInstall on behalf of external targets
'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

actionFlags="-it"
if [[ "${3}" = "clean" ]] ; then
	actionFlags="-c"
fi

msg=$(ccInstall "${1}" "${2}" "${actionFlags}")
st="${?}"
print "${msg}"
exit "${st}"

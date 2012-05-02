#!/bin/ksh

#  cleanProjectTarget.ksh
#  Support
#
#  Created by Carol Clark on 11/11/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# cleanProjectTarget.ksh -- trigger files in specified target for reinstallation
#	cleanProjectTarget project target
'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

RC_MissingArgument=11

if [[ ! -n "${1}" ]] || [[ ! -n "${2}" ]] ; then
	print "USAGE: cleanProjectTarget project target"
	return $RC_MissingArgument
fi

project="${1}"
target="${2}"

case "${target}" in
	Cdoc )
		print -n "== cleaning ${project}/${target}... "
		lastbuilt="${CCDev}/build/${project}/Cdoc.lastbuilt"
		if [[ -e "${lastbuilt}" ]] ; then
			rm "${lastbuilt}"
			st="$?"
			if [[ ${st} > 0 ]] ; then
				print "*** error ${st} attempting to remove file ${lastbuilt}"
				return ${st}
			fi
		fi
		print "succeeded"
		;;
	* )
		ccInstall "${HOME}/Dev/${project}" "${target}" -c
		;;
esac
	
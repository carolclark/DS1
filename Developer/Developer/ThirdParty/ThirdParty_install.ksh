#!/bin/ksh

#  ThirdParty_install.ksh
#  Developer
#
#  Created by Carol Clark on 5/18/14.
#  Copyright (c) 2014 C & C Software, Inc8. All rights reserved.

USAGE='
ThirdParty_install.ksh -- install ThirdParty software
#	custom install script to install ThirdParty software
'

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

#^ 1 === top
missingArgumentMessage="USAGE: $0 pathToTargetFolder targetFolder ['clean']"

#^ 2 ===  shunitInstall
function shunitInstall {
	src=${sourceRoot}/${targetFolder}/shunit
	dst=${CCDev}/shunit

	if [[ -e ${dst}/lib/versions ]] ; then
		v_dst=$(${dst}/lib/versions | grep "bin/ksh")
		v_src=$(${src}/lib/versions | grep "bin/ksh")
		if [[ "${v_dst}" = "${v_src}" ]] ; then
			print "shunit installation up-to-date - skipping"
			return
		fi
	fi

	print "= installing shunit"
	chmod a+x ${src}/src/shunit2		# make sure shunit app is executable
	mkdir -p ${dst}
	if [[ "${?}" != "0" ]] ; then
		print "failure while installing shunit"
		exit 1
	fi
	mkdir -p ${dst}/bin
	if [[ "${?}" != "0" ]] ; then
		print "failure while installing shunit"
		exit 1
	fi
	for fl in $(ls "${src}/bin") ; do
		print "${src}/bin/${fl} => ${dst}/bin"
		cp "${src}/bin/${fl}" "${dst}/bin"
		if [[ "${?}" != "0" ]] ; then
			print "failure while installing shunit"
			exit 1
		fi
	done
	mkdir -p ${dst}/lib
	for fl in $(ls "${src}/lib") ; do
		print "${src}/lib/${fl} => ${dst}/lib"
		cp "${src}/lib/${fl}" "${dst}/lib"
		if [[ "${?}" != "0" ]] ; then
			print "failure while installing shunit"
			exit 1
		fi
	done
	mkdir -p ${dst}/src
	for fl in $(ls "${src}/src") ; do
		print "${src}/src/${fl} => ${dst}/src"
		cp "${src}/src/${fl}" "${dst}/src"
		if [[ "${?}" != "0" ]] ; then
			print "failure while installing shunit"
			exit 1
		fi
	done
}

#^ 7 === cleanTarget
function cleanTarget {
	for folder in "${HOME}/Library/AppleScripts/ThirdParty" "${CCDev}/shunit"; do
		msg=$(ccInstall --removeFolder "${folder}")
		st=${?}
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			return
		fi
	done
	return 0
}

#^ 8 === main
# install shunit (third party)

sourceRoot=""
targetFolder=""
command=""

if [[ $# > 1 ]] ; then
	sourceRoot="${1}"
	shift
	targetFolder="${1}"
	shift
	if [[ $# > 0 ]] ; then
		command="${1}"
		shift
	fi
else
	errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgumentMessage}"
	return
fi

if [[ -n "${command}" ]] ; then
	case "${command}" in
		"clean" )
			msg=$(cleanTarget)
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"*" )
			print "== installing third-party software ..."
			msg=$(shunitInstall)
			es=$?
			print "${msg}"
			return "${es}"
			;;
	esac
fi
shunitInstall
exit

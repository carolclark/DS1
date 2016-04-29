#!/bin/ksh

#  shunit2_install.ksh
#  Support/Developer
#
#  Created by Carol Clark on 5/18/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

USAGE='
shunit2_install.ksh -- install ThirdParty shunit2 shell testing script
#	custom install script to install shunit2
'

CCDev="${HOME}/Library/CCDev"

#^ 1 === top
missingArgumentMessage="USAGE: $0 pathToTargetFolder targetFolder ['clean']"
fauxproduct="${HOME}/Library/CCDev/build_output/Support/Developer/shunit2.fauxprod"

#^ 2 ===  shunitInstall
function shunitInstall {
	src=${sourceRoot}/${targetFolder}/shunit2-2.1.6
	dst=${CCDev}/shunit

	if [[ -e ${dst}/lib/versions ]] ; then
		v_dst=$(cat ${dst}/lib/versions)
		v_src=$(cat ${src}/lib/versions)
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
	st="${?}"
	if [[ "$st" != "0" ]] ; then
		print "failure while making CCev directory shunit"
		exit $st
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
	mkdir -p "$(dirname ${fauxproduct})"
	st=$?
	print $(basename ${fauxproduct}) $(date) > ${fauxproduct}
	return ${st}
}

#^ 7 === cleanTarget
function cleanTarget {
	if [[ -e "${CCDev}/bin/ccInstall" ]] ; then
		. "${CCDev}/bin/ccInstall"
		for folder in "${CCDev}/shunit"; do
			print -n "folder ${folder}: "
			msg=$(ccInstall --removeFolder "${folder}")
			st=${?}
			if [[ ${st} > 0 ]] ; then
				print "$0#$LINENO: error #${st} while cleaning folder shunit: ${msg} "
				return ${st}
			else
				print "removed"
			fi
		done
		if [[ -e "${fauxproduct}" ]] ; then
			rm "${fauxproduct}"
			st="$?"
			if [[ ${st} > 0 ]] ; then
				print "$0#$LINENO: error #${st} while attempting to remove file ${fauxproduct}"
				return ${st}
			fi
		fi
	else
		print "Warning: Cannot clean target shunit2 because required script ccInstall is not yet present."
	fi
	return 0
}

#^ 8 === main
# install shunit (third party)

sourceRoot=""
targetFolder=""
command="install"

if [[ $# > 1 ]] ; then
	sourceRoot=""
	targetFolder=""
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
	else
		print "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh sourceRoot targetFolder [action] (RC_MissingArgument)"
		return 65
	fi
	if [[ $# > 2 ]] ; then
		command="${3}"
	fi
fi

if [[ -n "${command}" ]] ; then
	case "${command}" in
		"clean" )
			msg=$(cleanTarget)
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"install" )
			print "== installing third-party software ..."
			msg=$(shunitInstall)
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"test" )
			cd "${HOME}/Library/CCDev/shunit/src"
			msg=$("${HOME}/Library/CCDev/shunit/src/shunit2_test.sh")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		* )
			es=66
			print "$0#$LINENO: invalid subcommand ${1} (RC_InvalidArgument)"
			return "${es}"
			;;
	esac
fi

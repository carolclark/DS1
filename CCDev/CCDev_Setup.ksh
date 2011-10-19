#! /bin/ksh

#  CCDev_Setup.ksh
#  Support
#
#  Created by Carol Clark on 10/18/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# CCDev_Setup.ksh -- set up basic CCDev development environment
'

#^	install
function install {
	src="${1}"
	dst="${2}"
	nm="${3:-}"
	if [[ ! -n "${nm}" ]] ; then
		nm="$(basename ${src})"
	fi
	print -n "${src}: "
	mkdir -p "${dst}"
	cp "${src}" "${dst}/${nm}"
	if [[ "${?}" = "0" ]] ; then
		print -n "=> ${dst}"
		if [[ "${nm}" = "" ]] ; then
			print
		else
			print "/${nm}"
		fi
		return 0
	else
		print "could not copy to ${dst}"
		exit 1
	fi
}

#^	gitPrintConfig
function gitPrintConfig {
	print "[user]"
	print "\tname = ${user}"
	print "\temail = ${email}"
	print
	print "[core]"
	print "\texcludesfile = ${exclude}"
}

#^	gitPrintExclude
function gitPrintExclude {
	print '.DS_Store'
	print 'xcuserdata'
	print '*.bbprojectsettings'
	print '_rf_*'
}

#^	main

# identify and set variables for currentf user
user="${USER}"
ccdevFolder="/Users/${user}/.ccdev"
typeset -i installCCDevSupport=0

case "${user}" in
	"carolclark" )
		fullname="Carol Clark"
		email="carolclark@cox.net"
		ccdevFolder="${HOME}/CCDev"
		installCCDevSupport=1
		;;
	"lauramartinez" )
		fullname="Laura Martinez"
		email="cello.laura@gmail.com"
		;;
	"scottclark" )
		fullname="Scott Clark"
		email="scotttclark@verizon.net"
		;;
	"ginaclark" )
		fullname="Gina N. Clark"
		email="missdarma@yahoo.com"
		;;
	* )
		print "User not found."
		exit 1
		;;
esac

# configure git
CCDev="${ccdevFolder}"; export CCDev
config="/Users/${user}/.gitconfig"
exclude="${CCDev}/Git/exclude"
gitPrintConfig > "${config}"				# configure git
gitPrintExclude > "${exclude}"				# specify files for git to ignore

# configure Xcode ORGANIZATIONNAME
print "writing Xcode defaults ..."
defaults write com.apple.Xcode PBXCustomTemplateMacroDefinitions '{ "ORGANIZATIONNAME" = "C & C Software, Inc.";}'
if [[ "${?}" != "0" ]] ; then
	print "failed to write Xcode ORGANIZATIONNAME"
	exit 1
fi

# install CCDev Support
if [[ installCCDevSupport ]] ; then
	# configure XCCodeSenseAllowAutoCompletionInPlainFiles
	defaults write com.apple.Xcode XCCodeSenseAllowAutoCompletionInPlainFiles -true
	if [[ "${?}" != "0" ]] ; then
		print "failed to write XCCodeSenseAllowAutoCompletionInPlainFiles"
		exit 1
	fi

	# set up environment variables
	PATH="$PATH:$CCDev/bin:$CCDev/func"; export PATH
	FPATH="$CCDev/func"; export FPATH
	SHUnit="$CCDev/shunit/src/shunit2"; export SHUnit

	# set up to install $CCDev files
	srcdir="$(dirname $0)"; export srcdir
	mkdir -p $CCDev/func
	mkdir -p $CCDev/bin

	# install environment files
	fldr="${srcdir}/Environment"
#	install "${fldr}/profile.ksh" "${HOME}" ".profile"			# establish shell environment
#	install "${fldr}/kshrc.ksh" "${CCDev}/bin" ".kshrc"			# establish ksh (Korn shell) environment
#	install "${fldr}/environment.plist" "${HOME}/.MacOSX"		# establish some environment variables for use by applications

	# install bootstrap scripts
#	install "${srcdir}/Scripts/errtrap.func" "$CCDev/func" "errtrap"

	# install third party software
#	cd $(dirname ${srcdir})/ThirdParty
#	if [[ -e "shunit" ]] && [[ -d "shunit" ]] ; then
#		shunit/shunit.build
#		if [[ "${?}" != "0" ]] ; then
#			print "failed to install shunit"
#			exit 1
#		fi
#	fi
fi


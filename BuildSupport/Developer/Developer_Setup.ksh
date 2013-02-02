#! /bin/ksh

#  Developer_Setup.ksh
#  Support
#
#  Created by Carol Clark on 10/18/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
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

#^	envProfile
function envProfile {
	print "SHELL=/bin/ksh"
	print "export ENV=${CCDev}/bin/.kshrc"
}

#^	envEnvironment
function envEnvironment {
	#terminal promp	apt: "<username> <lineno> $ "
	if [[ ${setTerminalPrompt} = "yes" ]] ; then
		export PS1="$LOGNAME ! $ "
		print "export PS1=\"$LOGNAME ! $ \""
	fi
	DEV="${devFolder}"; export DEV
	print "DEV=\"${devFolder}\"; export DEV"
	CCDev="${ccdevFolder}"; export CCDev
	print "CCDev=\"${ccdevFolder}\"; export CCDev"
	PATH="$PATH:$CCDev/bin:$CCDev/func"; export PATH
	print 'PATH="$PATH:$CCDev/bin:$CCDev/func"; export PATH'
	FPATH="$CCDev/func"; export FPATH
	print 'FPATH="$CCDev/func"; export FPATH'
	SHUnit="$CCDev/shunit/src/shunit2"; export SHUnit
	print 'SHUnit="$CCDev/shunit/src/shunit2"; export SHUnit'
}

#^	envLaunchctl
function envLaunchctl {
	print "setenv DEV ${devFolder}"
	print "setenv CCDev ${ccdevFolder}"
	print "setenv PATH ${PATH}:${CCDev}/bin:${CCDev}/func"
	print "setenv FPATH ${FPATH}:${CCDev}/func"
	print "setenv SHUnit ${CCDev}/shunit/src/shunit2"
	if [[ ${setTerminalPrompt} = "yes" ]] ; then
		print "setenv PS1 \"${LOGNAME} ! $ \""
	fi
	if [[ ${setTerminalEditMode} = "yes" ]] ; then
		print "setenv VISUAL \"$(whereis emacs)\""
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
	print
	print "[diff]"
	print "\ttool = opendiff"
	print
	print "[difftool]"
	print "\tprompt = false"
}

#^	gitPrintExclude
function gitPrintExclude {
	print '.DS_Store'
	print 'xcuserdata'
	print '*.bbprojectsettings'
	print '_rf_*'
}

#^	shunitInstall
function shunitInstall {
	src=${srcdir}/ThirdParty/shunit
	dst=${CCDev}/shunit
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

#^	main

# identify and set variables for current user
user=${USER}
devFolder=${HOME}/Dev
ccdevFolder=${HOME}/CCDev
installEnvironmentPlist="yes"
setTerminalPrompt="no"
setTerminalEditMode="yes"

case "${user}" in
	"carolclark" )
		fullname="Carol Clark"
		email="carolclark@cox.net"
		devFolder=/Volumes/Mac/Users/carolclark/Dev
		setTerminalPrompt="yes"
		;;
	"lauramartinez" )
		fullname="Laura Martinez"
		email="cello.laura@gmail.com"
		devFolder=${HOME}/Documents/Projects
		;;
	"scottclark" )
		fullname="Scott Clark"
		email="scottclark@kualumni.org"
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

# configure environment
print "configuring environment"
envProfile > "${HOME}/.profile"
chmod a+x "${HOME}/.profile"
mkdir -p "${CCDev}/bin"
envEnvironment > "${CCDev}/bin/.kshrc"
chmod a+x "${CCDev}/bin/.kshrc"
envLaunchctl > "${CCDev}/tmp/launchd.conf"

# configure git
print "configuring git"
CCDev="${ccdevFolder}"; export CCDev
config="/Users/${user}/.gitconfig"
exclude="${CCDev}/Git/exclude"
mkdir -p "${CCDev}/Git"
gitPrintConfig > "${config}"				# configure git
gitPrintExclude > "${exclude}"				# specify files for git to ignore

# configure Xcode ORGANIZATIONNAME
print "writing Xcode defaults"
defaults write com.apple.Xcode PBXCustomTemplateMacroDefinitions '{ "ORGANIZATIONNAME" = "C & C Software, Inc.";}'
if [[ "${?}" != "0" ]] ; then
	print "failed to write Xcode ORGANIZATIONNAME"
	exit 1
fi

# configure XCCodeSenseAllowAutoCompletionInPlainFiles
if [[ "${user}" = "carolclark" ]] ; then
	print "configuring XCCodeSenseAllowAutoCompletionInPlainFiles"	
	defaults write com.apple.Xcode XCCodeSenseAllowAutoCompletionInPlainFiles -true
	if [[ "${?}" != "0" ]] ; then
		print "failed to write XCCodeSenseAllowAutoCompletionInPlainFiles"
		exit 1
	fi
fi

# set up to install $CCDev files
print "creating CCDev (${CCDev}) subdirectories"
srcdir="$(dirname $0)"; export srcdir
mkdir -p $CCDev/func
mkdir -p $CCDev/bin
mkdir -p $CCDev/tmp

print "installing files ..."
# install environment files
if [[ ${installEnvironmentPlist} = "yes" ]] ; then
	install "${srcdir}/Environment/environment.plist" "${HOME}/.MacOSX"		# establish some environment variables for use by applications
fi

# install bootstrap scripts
install "${srcdir}/Functions/errtrap.ksh" "$CCDev/func" "errtrap"
install "${srcdir}/Functions/ccInstall.ksh" "$CCDev/func" "ccInstall"
install "${srcdir}/Scripts/ccInstallAction.ksh" "$CCDev/bin" "ccInstallAction"
install "${srcdir}/Scripts/resultCodes.ksh" "$CCDev/bin"

# install shunit (third party)
shunitInstall

# test CCDev_Setup
typeset -i failcnt=0

print "== Developer/_Tests/testDeveloper_Setup.ksh"
result=$(Developer/_Tests/testDeveloper_Setup.ksh)
if [[ "${?}" > 0 ]] ; then
	failcnt="${failcnt}"+1
fi
print "${result}"

if [[ "${failcnt}" = 0 ]] ; then
	print "***"
	print "*** If you are comfortable editing a file with sudo from Terminal:"
	print "***		To finish setting up your environment, copy the contents of file ${CCDev}/tmp/launchd.conf. Then sudo edit /private/etc/launchd.conf, and paste clipboard contents into that file. ***"
	print "*** If not, ask for help."
	print "***"
fi

exit "${failcnt}"

#! /bin/ksh

#  Developer_Setup.ksh
#  Support
#
#  Created by Carol Clark on 10/18/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# Developer_Setup.ksh -- set up basic C & C Software development environment
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
	print "export ENV=${ccdevFolder}/bin/.kshrc"
}

#^	envKsh				Korn shell configuration
function envKsh {
	DEV="${devFolder}"; export DEV						# folder containing development projects
	print "DEV=${DEV}; export DEV"
	CCDev="${ccdevFolder}"; export CCDev				# C & C derived data
	print "CCDev=${CCDev}; export CCDev"
	if [[ $(print ":$PATH:" | grep ":$CCDev/bin:") = "" ]] ; then
		PATH="$PATH:$CCDev/bin:"
	fi
	if [[ $(print ":$PATH:" | grep ":$CCDev/func:") = "" ]] ; then
		PATH="$PATH:$CCDev/func:"
	fi
	export PATH											# path to search for unix scripts
	print "PATH=${PATH}; export PATH"
	if [[ $(print ":$FPATH:" | grep ":$CCDev/func:") = "" ]] ; then
		FPATH="$FPATH:$CCDev/func:"
	fi
	export FPATH										# path to search for unix functions
	print "FPATH=${FPATH}; export FPATH"
	SHUnit="$CCDev/shunit/src/shunit2"; export SHUnit	# third-party library used for unix testing
	print "SHUnit=${SHUnit}; export SHUnit"
	if [[ ${configureTerminal} = "yes" ]] ; then
		PS1="$LOGNAME ! $ "; export PS1					# terminal prompt: "<username> <lineno> $ "
		print "PS1=\"${PS1}\"; export PS1"
		VISUAL="\"$(whereis emacs)\""; export VISUAL	# emacs editor
		print "VISUAL=${VISUAL}; export VISUAL"
	fi
}

#^	envLaunchctld		MacOSX launchd configuration
function envLaunchctl {
	print "setenv DEV ${DEV}"
	print "setenv CCDev ${CCDev}"
	print "setenv PATH ${PATH}"
	print "setenv FPATH ${FPATH}"
	print "setenv SHUnit ${SHUnit}"
	if [[ ${configureTerminal} = "yes" ]] ; then
		print "setenv PS1 ${PS1}"
		print "setenv VISUAL ${VISUAL}"
	fi
}

#^	writeValueFunction
function writeValueFunction {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		name="${1}"
		value="${2}"
	else
		print "Usage: writeValueFunction: <name> <value>"
		exit 1
	fi
	mkdir -p "${CCDev}/func"
	ffpath="${CCDev}/func/${name}"
	print "function ${name} {" > "${ffpath}"
	print "	print ${value}" >> "${ffpath}"
	print "	exit 0" >> "${ffpath}"
	print "}" >> "${ffpath}"
	chmod a+x "${ffpath}"
}

#^	gitPrintConfig		git SCM system configuration
function gitPrintConfig {
	git config --global user.name "${user}"
	git config --global user.email "${email}"

	git config --global core.excludesfile "${exclude}"
	git config --global core.attributesfile "${attributes}"

	git config --global color.ui true

	git config --global core.editor emacs

	git config --global diff.tool opendiff

	git config --global difftool.prompt false

	git config --global merge.tool opendiff
}

#^	gitPrintExclude
function gitPrintExclude {
	print '.DS_Store'
	print '*.bbprojectsettings'
	print 'xcuserdata/'
	print '_patches'
}

#^	gitPrintAttributes
function gitPrintAttributes {
	print 'content.pcode text'
	print '*.png binary'
	print 'snippets.dash binary'
	print '*./pbxproj merge=union'		# include changes from both parents when merging project files
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

#^	removeFileIfPresent
function removeFileIfPresent {
	if [[ -e "${1}" ]] ; then
		rm "${1}"
	fi
}

#^	main

ccdevFolder=${HOME}/CCDev

if [[ "${1}" = clean ]] ; then
	removeFileIfPresent "${HOME}/.profile"
	removeFileIfPresent "${HOME}/.MacOSX/environment.plist"
	removeFileIfPresent "${HOME}/.gitconfig"
	removeFileIfPresent "${HOME}/.launchd.conf"
	removeFileIfPresent "${ccdevFolder}/bin/.kshrc"
	removeFileIfPresent "${ccdevFolder}/bin/ccInstallAction"
	removeFileIfPresent "${ccdevFolder}/bin/resultCodes.ksh"
	removeFileIfPresent "${ccdevFolder}/Git/attributes"
	removeFileIfPresent "${ccdevFolder}/Git/exclude"
	exit
fi

# identify and set variables for current user
user=${USER}
devFolder=${HOME}/Dev
ccdevFolder=${HOME}/CCDev
configureTerminal="no"

case "${user}" in
	"carolclark" )
		fullname="Carol Clark"
		email="carolclark@cox.net"
		devFolder=/Volumes/Mac/Users/carolclark/Dev
		configureTerminal="yes"
		;;
	"lauramartinez" )
		fullname="Laura Martinez"
		email="cello.laura@gmail.com"
		devFolder=${HOME}/Documents/Projects
		configureTerminal="yes"
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
mkdir -p "${ccdevFolder}/bin"
envKsh > "${ccdevFolder}/bin/.kshrc"
chmod a+x "${CCDev}/bin/.kshrc"
envLaunchctl > "${HOME}/.launchd.conf"
chmod a+x "${HOME}/.launchd.conf"

# write functions DEV, CCDev
writeValueFunction "DEV" "${devFolder}"
writeValueFunction "CCDev" "${ccdevFolder}"

# configure git
print "configuring git"
config="/Users/${user}/.gitconfig"
exclude="${CCDev}/Git/exclude"
attributes="${CCDev}/Git/attributes"
mkdir -p "${CCDev}/Git"
gitPrintConfig > "${config}"				# configure git
gitPrintExclude > "${exclude}"				# specify files for git to ignore
gitPrintAttributes > "${attributes}"		# specify file attributes

# configure Xcode
print "writing Xcode defaults"
defaults write com.apple.Xcode PBXCustomTemplateMacroDefinitions '{ "ORGANIZATIONNAME" = "C & C Software, Inc.";}'
if [[ "${?}" != "0" ]] ; then
	print "failed to write Xcode ORGANIZATIONNAME"
	exit 1
fi

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
# install bootstrap scripts
install "${srcdir}/Functions/errtrap.ksh" "$CCDev/func" "errtrap"
install "${srcdir}/Scripts/resultCodes.ksh" "$CCDev/bin"
install "${srcdir}/Functions/ccInstall.ksh" "$CCDev/func" "ccInstall"
install "${srcdir}/Scripts/ccInstallAction.ksh" "$CCDev/bin" "ccInstallAction"

# install shunit (third party)
shunitInstall

# test CCDev_Setup
typeset -i failcnt=0

print "== Developer/_Tests/testDeveloper_Setup.ksh"
#result=$(Developer/_Tests/testDeveloper_Setup.ksh)
#if [[ "${?}" > 0 ]] ; then
#	failcnt="${failcnt}"+1
#fi
#print "${result}"

if [[ "${failcnt}" = 0 ]] ; then
	# print instructions for completing configuration
	print "***"
	print "*** To finish setting up your environment:"
	print "*** from Terminal:"
	print "sudo cp ${HOME}/.launchd.conf /private/etc/launchd.conf"
		# supposedly ${HOME}/.launchd.conf should suffice, but for now (2/22/13) it is not
	print "*** Then shut down your computer and reboot."
#	print "*** If you are configuring your system for the first time, shut down your computer and reboot."
	print "*** Then reopen workspace Support and build target Developer."
	print "***"
fi

exit "${failcnt}"

#! /bin/ksh

#  DevConfig.ksh
#  Support
#
#  Created by Carol Clark on 10/18/11.
#  Copyright 2011-14 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# DevConfig.ksh -- set up and configure C & C Software development environment
'

CCDev="${HOME}/Library/CCDev"

#^	install
function install {
	src="${1}"
	dst="${2}"
	nm="${3:-}"
	if [[ ! -n "${nm}" ]] ; then
		nm="$(basename ${src})"
	fi
	print -n "${src}:"
	mkdir -p "${dst}"
	cp "${src}" "${dst}/${nm}"
	if [[ "${?}" = "0" ]] ; then
		print -n " -> ${dst}"
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
	if [[ $(print "$PYTHONPATH") = "" ]] ; then
		PYTHONPATH="${CCDev}/bin/python"
	fi
	print "PYTHONPATH=${PYTHONPATH}; export PYTHONPATH"		# path to search for python scripts
}

#^	envKsh				Korn shell configuration
function envKsh {
	DEV="${DEV}"; export DEV								# folder containing development projects
	print "DEV=${DEV}; export DEV"
	CCDev="${CCDev}"; export CCDev							# C & C derived data
	print "CCDev=${CCDev}; export CCDev"
	if [[ $(print ":$PATH:" | grep ":/usr/local/bin:") = "" ]] ; then
		PATH="$PATH:/usr/local/bin:$CCDev/bin:$CCDev/bin/python:"
	fi
	print "PATH=${PATH}; export PATH"						# path to search for scripts
	SHUnit="$CCDev/shunit/src/shunit2"; export SHUnit		# third-party library used for unix testing
	print "SHUnit=${SHUnit}; export SHUnit"
	if [[ ${configureTerminal} = "yes" ]] ; then
		PS1="\033[1;33m$LOGNAME !\033[0m \033[1;34m$\033[0m "; export PS1		# colorized terminal prompt: "<username> <lineno> $ "
		print "PS1=\"${PS1}\"; export PS1"
		VISUAL="\"$(whereis emacs)\""; export VISUAL		# emacs editor
		print "VISUAL=${VISUAL}; export VISUAL"
		CLICOLOR=1; export CLICOLOR							# color ls output
		print "CLICOLOR=${CLICOLOR}; export CLICOLOR"
		LSCOLORS=exfxcxdxbxegedabagacad; export LSCOLORS
		print "LSCOLORS=${LSCOLORS}; export LSCOLORS"
		GREP_OPTIONS='--color=auto'; export GREP_OPTIONS	# highlight grep matches
		print "GREP_OPTIONS=${GREP_OPTIONS}; export GREP_OPTIONS"
# Terminal Aliases
															# alias gmm: get merge message
#	GET_MERGE_MESSAGE='print "''scm.py currentBranch issueNumber''"''; print -n issueNumber: ; read issueNumber;'
#	print -n gmm="'"; print -n "$GET_MERGE_MESSAGE"; print "'; export gmm"
#print -n "gmm='"print scm.py currentBranch issueNumber"; print -n issueNumber: ; read issueNumber; mm=$" #; print '(${CCDev}/bin/python/scm.py $cb $issueNumber)'"# print "$mm"'
	fi
}

#^	envLaunchctld		MacOSX launchd configuration
function envLaunchctl {
	print "setenv DEV ${DEV}"
	print "setenv CCDev ${CCDev}"
	print "setenv PATH ${PATH}"
	print "setenv SHUnit ${SHUnit}"
	if [[ ${configureTerminal} = "yes" ]] ; then
		print "setenv PS1 ${PS1}"
		print "setenv VISUAL ${VISUAL}"
		print "setenv CLICOLOR ${CLICOLOR}"
		print "setenv LSCOLORS ${LSCOLORS}"
		print "setenv GREP_OPTIONS ${GREP_OPTIONS}"
	fi
}

#^	gitPrintConfig		git SCM system configuration
function gitPrintConfig {
	git config --global user.name "${USER}"
	git config --global user.email "${email}"

	git config --global core.autocrlf input
	git config --global core.editor emacs
	git config --global core.excludesfile "${exclude}"
	git config --global core.attributesfile "${attributes}"

	git config --global color.ui true

	git config --global push.default simple			# push only the current branch

	git config --global diff.tool opendiff

	git config --global difftool.prompt false

	git config --global merge.tool opendiff

	git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset' --abbrev-commit --date=relative"
	git config --global alias.fetchup '!git remote update -p; git merge --ff-only @{u}'
}

#^	gitPrintExclude
function gitPrintExclude {
	print '.DS_Store'
	print '*.bbprojectsettings'
	print '*.xccheckout'
	print '*.pyc'
	print 'xcuserdata/'
	print '.idea/'
	print '_patches'
}

#^	gitPrintAttributes
function gitPrintAttributes {
	print '*.png binary'				# identify some binary files
	print 'snippets.dash binary'
	print 'content.pcode -crlf'			# do not change line endings in PaintCode files
	print '*./pbxproj merge=union'		# include changes from both parents when merging project files
}

#^	removeFileIfPresent
function removeFileIfPresent {
	if [[ -e "${1}" ]] ; then
		rm "${1}"
	fi
}

#^	main

# identify and set variables for current user
DEV=${HOME}/Dev
CCDev=${HOME}/Library/CCDev
configureTerminal="no"

case "${USER}" in
	"carolclark" )
		fullname="Carol Clark"
		email="carolclark@cox.net"
        if [[ -e "${HOME}/Dev" ]] ; then
            DEV="${HOME}/Dev"
        else
            DEV="/Volumes/Mac/Users/${username}/Dev"
        fi
		configureTerminal="yes"
		;;
	"lauramartinez" )
		fullname="Laura Martinez"
		email="cello.laura@gmail.com"
		DEV=${HOME}/Documents/Projects
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

# if ACTION is clean, clean and exit
if [[ "${1}" = clean ]] ; then
	removeFileIfPresent "${HOME}/.profile"
	removeFileIfPresent "${HOME}/.gitconfig"
	removeFileIfPresent "${HOME}/.launchd.conf"
	removeFileIfPresent "${CCDev}/bin/.kshrc"
	removeFileIfPresent "${CCDev}/Git/attributes"
	removeFileIfPresent "${CCDev}/Git/exclude"
	exit
fi

print
# configure environment
print "configuring environment"
envProfile > "${HOME}/.profile"
chmod a+x "${HOME}/.profile"
mkdir -p "${CCDev}/bin"
envKsh > "${CCDev}/bin/.kshrc"
chmod a+x "${CCDev}/bin/.kshrc"
envLaunchctl > "${HOME}/.launchd.conf"
chmod a+x "${HOME}/.launchd.conf"

# configure git
print "configuring git"
config="/Users/${USER}/.gitconfig"
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

if [[ "${USER}" = "carolclark" ]] ; then
	print "configuring XCCodeSenseAllowAutoCompletionInPlainFiles"
	defaults write com.apple.Xcode XCCodeSenseAllowAutoCompletionInPlainFiles YES
	if [[ "${?}" != "0" ]] ; then
		print "failed to write XCCodeSenseAllowAutoCompletionInPlainFiles"
		exit 1
	fi
fi

# set up to install $CCDev files
print "creating CCDev (${CCDev}) subdirectories"
srcdir="${0%/*}"; export srcdir
mkdir -p $CCDev/bin
mkdir -p $CCDev/tmp

print "installing files ..."
# install bootstrap scripts
install "${srcdir}/Scripts/resultCodes.ksh" "$CCDev/bin" "resultCodes"
install "${srcdir}/Scripts/errcc.ksh" "$CCDev/bin" "errcc"
install "${srcdir}/Scripts/ccInstall.ksh" "$CCDev/bin" "ccInstall"
install "${srcdir}/Scripts/execInstallScript.ksh" "$CCDev/bin" "execInstallScript"

# test
print "== CCDev/_Tests/testDevConfig.ksh"
errout="$CCDev/tmp/errout"
errinfo="$CCDev/tmp/errinfo"
typeset -i failcnt=0
typeset -i errcnt=0
echo "" > "$errinfo"

(CCDev/_Tests/testDevConfig.ksh) 2>"${errout}"
st=$?
if [[ "${st}" > 0 ]] ; then
	failcnt="${failcnt}"+1
fi
if [[ $(cat "$errout") != "" ]] ; then										# errout file is not empty
	if [[ $(cat "$errout" | sed 's|\n||g' | sed s'| ||g') != "" ]] ; then	# contains non-whitespace
		errcnt=$errcnt+1
		cat $errout >> $errinfo
	fi
fi
if [[ $failcnt > 0 ]] ; then
	echo "FAILURES ($failcnt test files encountered failing tests)"
fi
if [[ $errcnt > 0 ]] ; then
	echo "ERRORS ($errcnt test files encountered execution errors):"
	cat "$errinfo"
fi
return $(($failcnt+$errcnt))

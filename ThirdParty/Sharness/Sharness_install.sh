#! /bin/bash
# Sharness_install.sh

# Copyright (c) 2016 by C & C Software, Inc.
# Created using AppCode by carolclark on 2016-08-16 for project Support.


##	\fn		installs Sharness testing tool for Bash
#
##	\todo	address 'unresolved variable' issues reported by code analysis on checkin
main() {
	local sharness_version="1.0.1"
	local CCDev="${HOME}/Library/CCDev"
	local source="${HOME}/Dev/Support/ThirdParty/Sources/Sharness_/Sharness_${sharness_version}"
	local dest="${CCDev}/bin/Sharness"
	local src="${source#/Users/carolclark/}"
	local msg
	local RESET=$(tput sgr0)
	local RED=$(tput setaf 1)
	local DK_GREEN=$(tput setaf 2)


	mkdir -p "${dest}"
	for fl in sharness.sh aggregate-results.sh ; do
		echo "${source#/Users/carolclark/}/${fl} => ${dest#/Users/carolclark/}"
		cp ${source}/${fl} ${dest}
		if [[ $? != 0 ]] ; then
			echo "${RED}    *** failed: ${0}${LINENO}${RESET}"
		else
			echo "${DK_GREEN}    success${RESET}"
		fi
	done
}

main "$@"

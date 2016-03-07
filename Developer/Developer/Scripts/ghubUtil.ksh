#!/bin/ksh

#  ghubUtil.ksh
#  Support
#
#  Created by Carol Clark on 11/7/13.
#  Copyright 2013-15 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark 0 === Top
#pragma mark === Markers ===

HOME="/Users/carolclark"
CCDev="${HOME}/Library/CCDev"
DEV="${HOME}/Dev"
. "${CCDev}/bin/errcc"

NAME='
# ghubUtil -- utility functions for git and GitHub
'
USAGE='
ghubUtil --
#	--backupIssues		<no args>
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

function backupIssues {
	generateCombinedFile=0		# whether to generate file including all repos in addition to repo-specific files
	combinedFile="/Volumes/Archives/GitHubIssues.json"
	if [[ -d "/Volumes/Archives" ]] ; then
		generateCombinedFile=1
		echo "" > "${combinedFile}"
	else
		echo "skipping creation of combined file because /Volumes/Archives does not exist or is not a directory"
	fi

	for repo in Support Accessor Punkin ; do
		if [[ ! -d "${DEV}/${repo}" ]] ; then
			errorMessage $RC_NoSuchFileOrDirectory "$0#$LINENO:" "${DEV}/${repo} does not exist or is not a directory"
			exit ${st}
		fi
		echo "==${repo}"
		echo " -${repo}_ghissues.json:"
		curl --user "carolclark:cc6868gh" "https://api.github.com/repos/carolclark/${repo}/issues" > "${DEV}/${repo}/Docs/OtherDocuments/${repo}_ghissues.json"
		st=$?
		if [[ ${st} > 0 ]] ; then
			errorMessage $RC_CURLError "$0#$LINENO:" "curl error: ${repo} -> ${repo}_ghissues.json"
			exit ${st}
		fi
		if [[ generateCombinedFile -ne 0 ]] ; then
			echo "$ -adding issues to combined file"
			curl --user "carolclark:cc6868gh" "https://api.github.com/repos/carolclark/${repo}/issues" >> "${combinedFile}"
			st=$?
			if [[ ${st} > 0 ]] ; then
				errorMessage $RC_CURLError "$0#$LINENO:" "curl error: ${repo} -> ${combinedFile}"
				exit ${st}
			fi
		fi
	done
}

#pragma mark 8 === main
if [[ $# = 0 ]] ; then
	errorMessage $RC_MissingArgument "$0#$LINENO:" "$0: missing commandFlag"
	print "${HELP}"
	return
fi
case "${1}" in
	"--help" )
		print "${HELP}"
		;;
	"--backupIssues" )
		backupIssues
		;;
	"--"* )
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid subcommand $1"	# <invalid arg>
		print "${HELP}"
		return
		;;
	* )
		;;
esac
return 0

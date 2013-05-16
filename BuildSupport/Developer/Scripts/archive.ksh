#!/bin/ksh

#  archive.ksh
#  Support
#
#  Created by Carol Clark on 7/13/12.
#  Copyright 2012-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='archive -- create tar archive for specified content'
USAGE='
#	--project (default)
#		current Terminal workspace: includes code and git repository, associated technical docs
#	--code
#		current Terminal workspace: code only
#	--repository
#		current repository: git repository for Terminal workspace
#	--folder folderName
#		contents of specified folder in working directory
#	--getArchiveDestination
#		returns current destination folder for archives; used for testing
#	--getLastArchivePath
#		returns path to last archive constructed archive
#	--help	<no args>
#		print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. "${CCDev}/bin/errcc"

#pragma mark 0 === Top
#pragma mark === Markers ===
# 1 archiveCode; 2 archiveRepository; 3 appendRepository; 4 appendGitReadMe; 5 appendCdoc; 6 archiveFolder; 7 revealArchive; 8 main

#pragma mark 1 === archiveCode
function archiveCode {	# archivePath projectName
	cd ${baseDir}
	cd ..
	tar --file="${archiveDestination}/${archivePath}" --create --exclude ".git" "${projectName}"/*
	st=$?
	cd ${baseDir}
	[[ $st = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	echo "${projectName}: new archive ${archiveDestination}/${archivePath} created"
}

#pragma mark 2 === archiveRepository
function archiveRepository {	# archivePath projectName
	cd ${baseDir}
	cd ..
	tar --file="${archiveDestination}/${archivePath}" --create "${projectName}/.git"/*
	st=$?
	cd ${baseDir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "${projectName}: new archive ${archiveDestination}/${archivePath} created"
}

#pragma mark 3 === appendRepository
function appendRepository {	# archivePath projectName
	cd ${baseDir}
	cd ..
	tar --file="${archiveDestination}/${archivePath}" --append "${projectName}/.git"/*
	st=$?
	cd ${baseDir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "repository ${projectName}/.git: appended to ${archiveDestination}/${archivePath}"
}

#pragma mark 4 === appendGitReadMe
function appendGitReadMe {	# archivePath projectName
	print  "This archive contains a git repository in invisible folder .git." > "${CCDev}/tmp/gitReadMe"
	cd "${CCDev}/tmp"
	tar --file="${archiveDestination}/${archivePath}" --append "gitReadMe"
	st=$?
	cd ${basedir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "repository ${projectName}/.git: gitReadMe appended"
}

#pragma mark 5 === appendCdoc
function appendCdoc {	# archivePath projectName
	cd ${CCDev}/Sites
	tar --file="${archiveDestination}/${archivePath}" --append "TechnicalDocs/${projectName}"/* "TechnicalDocs/css" "TechnicalDocs/img"
	st=$?
	cd ${baseDir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "${projectName} Cdoc: appended to ${archiveDestination}/${archivePath}"
}

#pragma mark 6 === archiveFolder
function archiveFolder {	# archivePath folderName
	tar --file="${archiveDestination}/${archivePath}" --create "${folderName}"/*
	st=$?
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "${folderName}: new archive ${archiveDestination}/${archivePath} created"
}

#pragma mark 7 === revealArchive
function revealArchive {	# archivePath
	if [[ __testing__ = 0 ]] ; then
		osascript -e "tell application \"Finder\" to reveal POSIX file \"${archiveDestination}/${archivePath}\""
		osascript -e "tell application \"Finder\" to activate"
	fi
}

#pragma mark 8 === archive
function archive {
	cmd="${1}"
	if [[ $# = 0 ]] ; then
		cmd="--project"
	fi
	baseDir="$(pwd)"
	projectName="${baseDir##/*/}"

	__testing__=0
	if [[ -n "${archiveDestination}" ]] ; then
		__testing__=1
	else
		archiveDestination="${HOME}/Archives"
	fi
	archivePath=""													# path from ${archiveDestination}

	case "${cmd}" in
		"--project" )
			mkdir -p "$archiveDestination"
			archivePath="Dev/${projectName}-`date "+%Y-%m-%d-%H%M%S"`.tar"
			msg=$(archiveCode)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(appendRepository)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(appendGitReadMe)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(appendCdoc)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(revealArchive)
			es=$?
			if [[ ${es} > 0 ]] ; then
				print "${msg}"
			fi
			echo "$archivePath" > "${CCDev}/tmp/lastArchivePath"
			return "${es}"
			;;
		"--code" )
			mkdir -p "$archiveDestination"
			archivePath="Dev/${projectName}_code-`date "+%Y-%m-%d-%H%M%S"`.tar"
			msg=$(archiveCode)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(revealArchive)
			es=$?
			if [[ ${es} > 0 ]] ; then
				print "${msg}"
			fi
			echo "$archivePath" > "${CCDev}/tmp/lastArchivePath"
			return "${es}"
			;;
		"--repository" )
			mkdir -p "$archiveDestination"
			archivePath="Dev/${projectName}_Git-`date "+%Y-%m-%d-%H%M%S"`.tar"
			msg=$(archiveRepository)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(appendGitReadMe)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(revealArchive)
			es=$?
			if [[ ${es} > 0 ]] ; then
				print "${msg}"
			fi
			echo "$archivePath" > "${CCDev}/tmp/lastArchivePath"
			return "${es}"
			;;
		"--folder" )
			mkdir -p "$archiveDestination"
			if [[ $# < 2 ]] ; then
				print "expected --folder <folderName>"
				return $RC_InvalidArgument
			fi
			folderName="${2}"
			archivePath="${folderName}-`date "+%Y-%m-%d-%H%M%S"`.tar"
			msg=$(archiveFolder)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			msg=$(revealArchive)
			es=$?
			if [[ ${es} > 0 ]] ; then
				print "${msg}"
			fi
			echo "$archivePath" > "${CCDev}/tmp/lastArchivePath"
			return "${es}"
			;;
		"--getArchiveDestination" )
			echo "$archiveDestination"
			return 0
			;;
		"--getLastArchivePath" )
			cat "${CCDev}/tmp/lastArchivePath"
			return $?
			;;
		"--help" )
			print "${HELP}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			print "invalid argument $1"
			print "expected (no arg) | --project | --code | --repositories | --folder..."
			return $RC_InvalidArgument
			;;
	esac
	return 0
}

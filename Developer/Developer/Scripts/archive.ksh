#!/bin/ksh

#  archive.ksh
#  Support
#
#  Created by Carol Clark on 7/13/12.
#  Copyright 2012-14 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='archive -- create tar archive of the current folder ($pwd)'
USAGE='
#	archive [archiveType [archiveDestination]]
#	--project (default)
#		includes code and git repository with associated technical docs
#	--code
#		code only
#	--repository
#		git repository only
#	--folder
#		contents of current folder
#	--revealLastArchive
#		reveal in Finder the last created archive
#	--getArchiveDestination
#		returns current destination folder for archives; used for testing
#	--getLastArchivePath
#		returns path to the last created archive
#	--help	<no args>
#		print this information
#	archiveDestination
#		optional additional parameter; current default ~/Archives
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/errcc"

#pragma mark 0 === Top
#pragma mark === Markers ===
# 1 archiveCode; 2 archiveRepository; 3 appendRepository; 4 appendGitReadMe; 5 appendCdoc; 6 archiveFolder; 7 revealLastArchive; 8 main

#pragma mark 1 === archiveCode
function archiveCode {	# archivePath folderName
	cd ${baseDir}
	cd ..
	if [[ ! -d "${folderName}" ]] ; then
		echo $(errorMessage $RC_NoSuchFileOrDirectory "$0#$LINENO:" "folder '$folderName' does not exist in directory $pwd")
		return
	fi
	tar --file="${archiveDestination}/${archivePath}" --create --exclude ".git" "${folderName}"/*
	st=$?
	cd ${baseDir}
	[[ $st = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	echo "${folderName}: new archive ${archiveDestination}/${archivePath} created"
}

#pragma mark 2 === archiveRepository
function archiveRepository {	# archivePath folderName
	cd ${baseDir}
	cd ..
	tar --file="${archiveDestination}/${archivePath}" --create "${folderName}/.git"/*
	st=$?
	cd ${baseDir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "${folderName}: new archive ${archiveDestination}/${archivePath} created"
}

#pragma mark 3 === appendRepository
function appendRepository {	# archivePath folderName
	cd ${baseDir}
	cd ..
	tar --file="${archiveDestination}/${archivePath}" --append "${folderName}/.git"/*
	st=$?
	cd ${baseDir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "repository ${folderName}/.git: appended to ${archiveDestination}/${archivePath}"
}

#pragma mark 4 === appendGitReadMe
function appendGitReadMe {	# archivePath folderName
	print  "This archive contains a git repository in invisible folder .git." > "${CCDev}/tmp/gitReadMe"
	cd "${CCDev}/tmp"
	tar --file="${archiveDestination}/${archivePath}" --append "gitReadMe"
	st=$?
	cd ${basedir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "repository ${folderName}/.git: gitReadMe appended"
}

#pragma mark 5 === appendCdoc
function appendCdoc {	# archivePath folderName
	cd ${CCDev}/Sites
	tar --file="${archiveDestination}/${archivePath}" --append "TechnicalDocs/${folderName}"/* "TechnicalDocs/css" "TechnicalDocs/img"
	st=$?
	cd ${baseDir}
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "${folderName} Cdoc: appended to ${archiveDestination}/${archivePath}"
}

#pragma mark 6 === archiveFolder
function archiveFolder {	# folderName
	tar --file="${archiveDestination}/${archivePath}" --create "${folderName}"/*
	st=$?
	[[ ${st} = 0 ]] || errorExit $st "$0#$LINENO:" 'tar error'
	print "${folderName}: new archive ${archiveDestination}/${archivePath} created"
}

#pragma mark 7 === revealLastArchive
function revealLastArchive {	# archivePath
	lastArchivePath=$(archive --getLastArchivePath)
	osascript -e "tell application \"Finder\" to reveal POSIX file \"${lastArchivePath}\""
	osascript -e "tell application \"Finder\" to activate"
}

#pragma mark 8 === archive
function archive {
	arg="${1:---project}"

	baseDir="$(pwd)"
	folderName="${baseDir##/*/}"
	archiveDestination="/Volumes/Archives/In"
	lastArchivePath="${CCDev}/tmp/lastArchivePath"

	archivePath=""		# path from ${archiveDestination}

	case "${arg}" in
		"--project" )
			archivePath="Dev/${folderName}-`date "+%Y-%m-%d-%H%M%S"`.tar"
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
			print "${archiveDestination}/${archivePath}" > "${lastArchivePath}"
			;;
		"--code" )
			archivePath="Dev/${folderName}_code-`date "+%Y-%m-%d-%H%M%S"`.tar"
			msg=$(archiveCode)
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			print "${archiveDestination}/${archivePath}" > "${lastArchivePath}"
			;;
		"--repository" )
			archivePath="Dev/${folderName}_Git-`date "+%Y-%m-%d-%H%M%S"`.tar"
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
			print "${archiveDestination}/${archivePath}" > "${lastArchivePath}"
			;;
		"--folder" )
			archivePath="${folderName}-`date "+%Y-%m-%d-%H%M%S"`.tar"
			msg=$(archiveFolder ${folderName})
			es=$?
			print "${msg}"
			if [[ ${es} > 0 ]] ; then
				return "${es}"
			fi
			print "${archiveDestination}/${archivePath}" > "${lastArchivePath}"
			;;
		"--revealLastArchive" )
			msg=$(revealLastArchive)
			es=$?
			if [[ ${es} > 0 ]] ; then
				print "${msg}"
			fi
			return "${es}"
			;;
		"--getArchiveDestination" )
			echo "$archiveDestination"
			;;
		"--getLastArchivePath" )
			cat "${lastArchivePath}"
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
			print "expected (no arg) | --project | --code | --repositories | --folder ..."
			return $RC_InvalidArgument
			;;
	esac
	return 0
}

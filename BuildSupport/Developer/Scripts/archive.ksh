#!/bin/ksh

#  archive.ksh
#  Support
#
#  Created by Carol Clark on 7/13/12.
#  Copyright 2012 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='	
# archive -- create tar archive for specified content
#	--project (default)
#		current workspace: included code and git repository; associated technical docs
#	--code
#		current workspace: code only
#	--repository
#		current repository: git repository
#	--folder folderName
#		contents of specified folder in working directory
'

. "${CCDev}/bin/resultCodes.ksh"

#^ 0 === top

#^ 1 === archiveCode
function archiveCode {	# archivePath projectName
	cd ${baseDir}
	cd ..
	tar --file="${HOME}/Archives/${archivePath}" --create --exclude ".git" "${projectName}"/*
	err=$?
	cd ${baseDir}
	if [[ ${err} = 0 ]] ; then
		print "${projectName}: new archive ${HOME}/Archives/${archivePath} created"
	fi
	return ${err}
}

#^ 2 === archiveRepository
function archiveRepository {	# archivePath projectName
	cd ${baseDir}
	cd ..
	tar --file="${HOME}/Archives/${archivePath}" --create "${projectName}/.git"/*
	err=$?
	cd ${baseDir}
	if [[ ${err} = 0 ]] ; then
		print "${projectName}: new archive ${HOME}/Archives/${archivePath} created"
	fi
	return ${err}
}

#^ 3 === appendRepository
function appendRepository {	# archivePath projectName
	cd ${baseDir}
	cd ..
	tar --file="${HOME}/Archives/${archivePath}" --append "${projectName}/.git"/*
	err=$?
	cd ${baseDir}
	if [[ ${err} = 0 ]] ; then
		print "repository ${projectName}/.git: appended to ${HOME}/Archives/${archivePath}"
	fi
	return ${err}
}

#^ 4 === appendGitReadMe
function appendGitReadMe {	# archivePath projectName
	print "The contents of this archive are inside folder ${projectName} in invisible folder .git." > "${CCDev}/tmp/gitReadMe"
	cd "${CCDev}/tmp"
	tar --file="${HOME}/Archives/${archivePath}" --append "gitReadMe"
	err=$?
	cd ${basedir}
	if [[ ${err} = 0 ]] ; then
		print "repository ${projectName}/.git: gitReadMe appended"
	fi
	return ${err}
}

#^ 5 === appendCdoc
function appendCdoc {	# archivePath projectName
	cd ${CCDev}/Sites
	tar --file="${HOME}/Archives/${archivePath}" --append "TechnicalDocs/${projectName}"/* "TechnicalDocs/css" "TechnicalDocs/img"
	err=$?
	cd ${baseDir}
	if [[ ${err} = 0 ]] ; then
		print "${projectName} Cdoc: appended to ${HOME}/Archives/${archivePath}"
	fi
	return ${err}
}

#^ 6 === archiveFolder
function archiveFolder {	# archivePath folderName
	tar --file="${HOME}/Archives/${archivePath}" --create "${folderName}"/*
	err=$?
	if [[ ${err} = 0 ]] ; then
		print "${folderName}: new archive ${HOME}/Archives/${archivePath} created"
	fi
	return ${err}
}

#^ 7 === revealArchive
function revealArchive {	# archivePath
	osascript -e "tell application \"Finder\" to reveal POSIX file \"${HOME}/Archives/${archivePath}\""
	osascript -e "tell application \"Finder\" to activate"
}

#^ 8 === main

arg="${1}"
if [[ $# = 0 ]] ; then
	arg="--project"
fi
baseDir="$(pwd)"
projectName="${baseDir##/*/}"

archivePath=""		# path from ${HOME}/Archives

case "${arg}" in
	"--project" )
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
		return "${es}"
		;;
	"--code" )
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
		return "${es}"
		;;
	"--repository" )
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
		return "${es}"
		;;
	"--folder" )
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
		return "${es}"
		;;
	* )
		print "invalid argument $1"
		print "expected (no arg) | --project | --code | --repositories | --folder..."
		return $RC_InvalidArgument
		;;
esac
return 0

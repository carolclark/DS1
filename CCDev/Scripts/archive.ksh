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
#	--repositories
#		git repositories from active working copies
#	--folder inputFolder
#		contents of specified folder in working directory
'

. "${CCDev}/bin/resultCodes.ksh"

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

#^ 2 === archiveCode
function archiveCode {	# archivePath project
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

#^ 3 === appendRepository
function appendRepository {	# archivePath project
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

#^ 4 === appendCdoc
function appendCdoc {	# archivePath project
	cd ${CCDev}/Sites
	tar --file="${HOME}/Archives/${archivePath}" --append "TechnicalDocs/${projectName}"/* "TechnicalDocs/css" "TechnicalDocs/img"
	err=$?
	cd ${baseDir}
	if [[ ${err} = 0 ]] ; then
		print "${projectName} Cdoc: appended to ${HOME}/Archives/${archivePath}"
	fi
	return ${err}
}

#^ 7 === revealArchive
function revealArchive {	# revealArchive
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
inputPath=""		# path to parent of folder to be archived
inputFolder=""		# folder to be archived

case "${arg}" in
	"--project" )
		archivePath="Dev/${projectName}-`date "+%Y-%m-%d-%H%M%S"`.tar"
		msg=$(archiveCode ${archivePath} ${inputFolder})
		es=$?
		print "${msg}"
		if [[ ${es} > 0 ]] ; then
			return "${es}"
		fi
		msg=$(appendRepository ${archivePath} ${inputFolder})
		es=$?
		print "${msg}"
		if [[ ${es} > 0 ]] ; then
			return "${es}"
		fi
		msg=$(appendCdoc ${archivePath} ${inputFolder})
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
		msg=$(archiveCode ${archivePath} ${inputFolder})
		es=$?
		print "${msg}"
		return "${es}"
		;;
	* )
		print "invalid argument $1"
		print "expected (no arg) | --project | --code | --repositories | --folder..."
		return $RC_InvalidArgument
		;;
esac
return 0

#!/bin/ksh

#  ccBackup.ksh
#  Support
#
#  Created by Carol Clark on 12/21/11 from file created 04/28/11.
#  Copyright 2011-12 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# ccBackup destination
#	backs up selected files to specified external drive
#	intended to stand alone for use by other developers
'

#^ 1 === top

#^ processFolder
function processFolder {
	batch="${1:?'processFolder: batch not specified'}"
	folder="${2:?'processFolder: folder not specified'}"
	if [[ ${folder%.zip} != ${folder} ]] ; then
		print "archive skipped"
		return 0
	fi
	lastbuilt="${destination}/${batch}/${folder}/__lastBackup"
	if [[ -e "${HOME}/${folder}" ]] ; then
		if ! [[ -d "${HOME}/${folder}" ]] ; then
			print "specified folder ${HOME}/${folder} is not a directory"
			return 1
		fi
	else
		print "specified folder ${HOME}/${folder} not found"
		return 1
	fi
	cd "${HOME}/${folder}"
	if [[ -e "${lastbuilt}" ]] ; then
		find . -path '*/.svn' -prune -o -type f -newer "${lastbuilt}" | grep -v '/\.svn$' | grep -v '\.DS_Store$' | sed 's|\./||' > "${flist}"
	else
		find . -path '*/.svn' -prune -o -type f | grep -v '/\.svn$' | grep -v '\.DS_Store$' | sed 's|\./||' > "${flist}"
	fi
	if [[ "$?" > 0 ]] ; then
		print "*** could not write file list"
		return 1
	fi
	
	while read fl ; do
		print -n "${fl}: "
		fl="${fl:?*** missing filename}"
		src="${HOME}/${folder}/${fl}"
		dst=$(dirname "${destination}/${batch}/${folder}/${fl}")
		mkdir -p "${dst}"
		if [[ "${?}" > 0 ]] ; then
			print "*** could not create directory ${dst}"
			return 1
		fi
		cp "${src}" "${dst}"
		if [[ "${?}" > 0 ]] ; then
			print "*** could not copy ${src} to ${dst}"
			return 1
		else
			print -n "succeeded"
		fi
		print
	done < "${flist}"
	mkdir -p "${destination}/${batch}/${folder}"
	print "last backup: $(date)" > "${destination}/${batch}/${folder}/__lastBackup"
	if [[ "${?}" > 0 ]] ; then
		print "*** could not write lastBackup file ${destination}/${batch}/${folder}/__lastBackup"
		return 1
	fi
	return 0
}

#^ processCustomFolder
function processCustomFolder {
	folder="${1:?'processCustomFolder: folder not specified'}"
	batch="Custom"
	if [[ -e "${HOME}/${folder}" ]] ; then
		fldr="${folder}"
		processFolder "${batch}" "${fldr}"
		if [[ ${?} > 0 ]] ; then
			print "*** processing of custom folder ${fldr} failed"
			return 1
		fi
	fi
	return 0
}

#^	7 === main
# find and validate destination volume
	dstvol=${1:?"path to backup destination required: ccBackup <volname>"}
	dstvol="/Volumes/${dstvol}"
	msg=""
	if [[ -n "${dstvol}" ]] ; then
		if [[ -e "${dstvol}" ]] ; then
			if [[ ! -d "${dstvol}" ]] ; then
				msg="specified destination ${dstvol} is not a directory"
			fi
		else
			msg="destination ${dstvol} does not exist"
		fi
	else
		msg="destination undefined"
	fi
	if [[ -n "${msg}" ]] ; then
		print "*** ${msg}"
		exit 1
	fi	

# set up
	destination="${dstvol}/ccBackup"
	mkdir -p "${destination}/tmp"
	flist="${destination}/tmp/flist"
	
	set -A filesGeneral "Library/Application Support/AddressBook" "Library/Preferences" "Library/Keychains" "Library/Calendars" "Documents"
	set -A filesMail "Library/Mail"
	set -A filesMedia "Library/iTunes" "Music" "Movies" "Pictures"

# process folders
	batch="General"
	for (( i=0 ; i < "${#filesGeneral[*]}" ; i++ )) ; do
		fldr="${filesGeneral[i]}"
		processFolder "${batch}" "${fldr}"
		if [[ ${?} > 0 ]] ; then
			print "*** processing of folder ${fldr} failed"
			exit 1
		fi
	done
	# special handling for Safari bookmarks
		folder="/Library/Safari"
		lastbuilt="${destination}/${batch}/${folder}/__lastBackup"
		cd "${HOME}/${folder}/"
		typeset -i copy=1
		if [[ -e "${lastbuilt}" ]] ; then
			find . -name "Bookmarks.plist" -newer "${lastbuilt}" | sed 's|\./||' > "${flist}"
		fi
		while read fl ; do
			print -n "${fl}: "
			fl="${fl:?*** missing filename}"
			src="${HOME}/${folder}/${fl}"
			dst=$(dirname "${destination}/${batch}/${folder}/${fl}")
			mkdir -p "${dst}"
			if [[ "${?}" > 0 ]] ; then
				print "*** could not create directory ${dst}"
				return 1
			fi
			cp "${src}" "${dst}"
			if [[ "${?}" > 0 ]] ; then
				print "*** could not copy ${src} to ${dst}"
				exit 1
			else
				print -n "succeeded"
			fi
			print
		done < "${flist}"
		print "last backup: $(date)" > "${lastbuilt}"

	batch="Mail"
	for (( i=0 ; i < "${#filesMail[*]}" ; i++ )) ; do
		fldr="${filesMail[i]}"
		processFolder "${batch}" "${fldr}"
		if [[ ${?} > 0 ]] ; then
			print "*** processing of folder ${fldr} failed"
			exit 1
		fi
	done

	batch="Media"
	for (( i=0 ; i < "${#filesMedia[*]}" ; i++ )) ; do
		fldr="${filesMedia[i]}"
		processFolder "${batch}" "${fldr}"
		if [[ ${?} > 0 ]] ; then
			print "*** processing of folder ${fldr} failed"
			exit 1
		fi
	done

	# Carol's custom folders
	DEV="${HOME}/Dev"
	for fl in $(ls "${DEV}") ; do
		if [[ ${fl} = "svnrep" ]] ; then
			folder="${DEV}/svnrep"
			batch="Custom"
			target="${destination}/${batch}/Dev/svnrep-$(date '+%Y_%m_%d-%H%M%S')"
			if [[ -e "${folder}" ]] ; then
				for rep in $(ls "$folder") ; do
					print -n "Dev/svnrep/${rep}: "
					dst="${target}/${rep}"
					mkdir -p "${dst}"		
					svnadmin hotcopy "${folder}/${rep}" "${dst}"
					if [[ ${?} > 0 ]] ; then
						print "*** processing of subversion repository ${rep} failed"
						exit 1
					else
						print "succeeded"
					fi
				done
			fi
		else
			processCustomFolder "Dev/${fl}"
			if [[ ${?} > 0 ]] ; then
				print "*** processing of custom folder ${fldr} failed"
				exit 1
			fi
		fi
	done
	processCustomFolder "Archives"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Databases"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Reference"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Application Support/Dragon"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Application Support/Xcode"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Application Support/BBEdit"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Application Support/iCal"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Application Support/iWeb"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Application Support/Mail"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Developer/Xcode/Snapshots"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	processCustomFolder "Library/Developer/Xcode/UserData"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi
	
	# Laura's custom folders
	processCustomFolder "Library/Application Support/Adobe"
	if [[ ${?} > 0 ]] ; then
		print "*** processing of custom folder ${fldr} failed"
		exit 1
	fi

# no errors
	print "== backup successfully completed =="
	exit 0

#!/bin/ksh

#  Xcode.build
#  BuildSupport
#
#  Created by Carol Clark on 9/7/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='Xcode.build -- install custom Xcode support'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

#^ buildsource_process
function buildsource_process {
	basePath="${1?basePath not specified}"
	target="${2?target not specified}"
	processFunction="${3?process function not specified}"

	mkdir -p "${CCDev}/tmp"
	flist="${CCDev}/tmp/flist"
	prevfldr=""

	sourcePath=$(ccInstall --getSourcePath ${basePath} ${target})
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "${sourcePath}"
		return ${st}
	fi
	if [[ -e "${sourcePath}" ]] ; then
		if [[ ! -d "${sourcePath}" ]] ; then
			print "source path ${sourcePath} exists but is not a directory"
			return 1
		fi
	else
		print "source path ${sourcePath} does not exist"
		return 1
	fi
	
	lastbuilt=$(ccInstall --getLastbuilt ${basePath} ${target})
	fs=0
	typeset -i errcnt=0
	cd "${sourcePath}"
	if [[ -e "${lastbuilt}" ]] ; then
		find . -path '*/.svn' -prune -o -type f -newer ${lastbuilt} | grep -v '/\.svn$' | grep -v '\.DS_Store$' | grep -v '_install.ksh$' | grep -v '_test.ksh$' | sed 's|\./||' > "${flist}"
	else
		find . -path '*/.svn' -prune -o -type f | grep -v '/\.svn$' | grep -v '\.DS_Store$' | grep -v '_install.ksh$' | grep -v '_test.ksh$' | sed 's|\./||' > "${flist}"
	fi
	if [[ "$?" > 0 ]] ; then
		print "*** could not write file list"
		return 1
	fi

	fs=0
	typeset -i errcnt=0
	while read fl ; do
		print -n "${fl}: "

		"${processFunction}" "${fl}"

		fs="$?"
		msg="failed"
		if [[ ${fs} = 0 ]] ; then
			if [[ -n "${destinationDirectory}" ]] ; then
				msg="succeeded"
			else
				msg="no action"
			fi	
		else
			errcnt+=1
		fi
		print "${msg}"
	done < "${flist}"
	if [[ ${errcnt} = 0 ]] ; then
		mkdir -p "$(dirname ${lastbuilt})"
		print $(basename ${lastbuilt}) $(date) > ${lastbuilt}
		print "build succeeded"
		fs=0
	else
		pl="s"
		if [[ ${errcnt} = 1 ]] ; then
			pl=""
		fi
		print "***build failed: ${errcnt} error${pl} encountered"
		fs=1
	fi
	return "${fs}"
}

#^ buildsource_clean
function buildsource_clean {
	if [[ -e "${lastbuilt}" ]] ; then
		rm "${lastbuilt}"
	fi
}

#^ processFile
function processFile {
	
	fl="${1?missing filename}"
	sourceFolder="${fl%%/*}"	# first path component
	sourceRel="${fl#*/}"		# remaining path components

	targetRel="${sourceRel}"
	if [[ "${prevfldr}" != "${sourceFolder}" ]] ; then
		destinationDirectory=""
		case "${sourceFolder}" in
			"Templates" )
				destinationDirectory="${HOME}/Library/Developer/Xcode/Templates"
				;;
			"Scripts" )
				destinationDirectory="${HOME}/Library/Scripts/Xcode"
				;;
			"Workflows" )
				destinationDirectory="${HOME}/Library/Scripts/Xcode"
				;;
			"_Tests" )
				;;	#handled elsewhere
			* )
				print "source folder ${sourcePath}/${sourceFolder} not handled"
				return 1
				;;
		esac
		if [[ -n "${destinationDirectory}" ]] ; then
			mkdir -p "$(dirname "${destinationDirectory}"/${targetRel})"
			if [[ "${?}" > 0 ]] ; then
				print "*** could not create directory $(dirname ${destinationDirectory}/${targetRel})"
				return 1
			fi
		fi
		prevfldr="${sourceFolder}"
	fi

	if [[ -n "${destinationDirectory}" ]] ; then
		mkdir -p "$(dirname ${destinationDirectory}/${targetRel})"
		targetRel="${targetRel%.ksh}"
		cp "${sourcePath}/${sourceFolder}/${sourceRel}" "${destinationDirectory}/${targetRel}"
		if [[ "${?}" > 0 ]] ; then
			print "*** could not copy ${sourcePath}/"${sourceFolder}"/${sourceRel} to ${destinationDirectory}/${targetRel}"
			return 1
		fi
	fi
}

#^ copySource
function copySource {
	fl="${1?missing filename}"
	mkdir -p "$(dirname "${destinationDirectory}"/${fl})"
	if [[ "${?}" > 0 ]] ; then
		print "*** could not create directory $(dirname ${destinationDirectory}/${fl})"
		return 1
	fi
	cp "${sourceDirectory}/${fl}" "${destinationDirectory}/${fl}"
	if [[ "${?}" > 0 ]] ; then
		print "*** could not copy ${sourceDirectory}/${fl} to ${destinationDirectory}/${fl}"
		return 1
	fi
}

#^ 7 === main

# read action input
ccInstall --getActions actions "${1}"
st=$?
if [[ ${st} > 0 ]] ; then
	print "$0#$LINENO: ${result.errorMessage}"
	exit ${st}
fi

# get and cd to installation's base path
basePath=$(ccInstall --getBasePath "${HOME}/Dev/Support" Xcode)
st=$?
if [[ "${st}" > 0 ]] ; then
	print "$0#$LINENO: ${basePath}"
	exit ${st}
fi
	
cd "${basePath}"
if [[ "${st}" > 1 ]] ; then
	print "$0#$LINENO: could not cd to basePath ${basePath}"
	exit ${st}
fi

# clean
if [[ ${actions.doClean} > 0 ]] ; then
	lastbuilt=$(ccInstall --getLastbuilt "${HOME}/Dev/Support" Xcode)
	if [[ -e "${lastbuilt}" ]] ; then
		rm "${lastbuilt}"
		st="$?"
	fi
fi

# install
if [[ ${st} = 0 ]] && [[ ${actions.doInstall} > 0 ]] ; then
	buildsource_process "${HOME}/Dev/Support" Xcode "processFile"
	st="$?"
	if [[ "${st}" > 1 ]] ; then
		print "$0#$LINENO: buildsource_process error"
		exit ${st}
	fi
	cd "${basePath}"
	if [[ "${st}" > 1 ]] ; then
		print "$0#$LINENO: could not cd to basePath"
		exit ${st}
	fi
fi

# test
if [[ ${st} = 0 ]] && [[ ${actions.doTest} > 0 ]] ; then
	typeset -i failcnt=0

	print "== Xcode/_Tests/testXcode.ksh"
	trap "" ERR
	result=$(Xcode/_Tests/testXcode.ksh)
	if [[ "${?}" > 0 ]] ; then
		failcnt="${failcnt}"+1
	fi
	trap "$trapString" ERR
	print "${result}"

	exit "${failcnt}"
fi
	
exit ${st}

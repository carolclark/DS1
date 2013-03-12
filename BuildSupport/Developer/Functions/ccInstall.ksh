#!/bin/ksh

#  ccInstall.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='ccInstall -- installation script and supporting functions'
USAGE='
ccInstall projectPath target [actionFlags]
#	build the specified project target
#		actionFlags: [-[citud]+] - actions requested (clean, install, test, upload, doxygen); default: -it
ccInstall commandFlag [argument(s)]
#	--getActions	resultObject [actionString]
#		actionString: [-[citud]+] - actions requested (clean, install, test, upload, doxygen)
#			default: -it
#			resultObject: object to contain results
#	--get<Path>			projectPath target
#		<Path>: 		BaseBath | SourcePath | TargetScript | Lastbuilt | TargetName
#		result: 		string containing specified path
#	--findTests 		projectPath target
#		result: 		path to file containing list of tests for <projectPath>/<target>
#	--findSources		projectPath target
#		result: 		path to file containing list of source files for <projectPath>/<target>
#	--updateLastbuilt	projectPath target
#						set last built flag to the current date and time
#	--clearLastbuilt	projectPath target
#						clear last built flag; forces for rebuild on next install operation
#	--copyFile			sourceFile destinationPath
#						copy source file to the specified destination
#	--translateCdoc		sourceFile destinationPath
#						translate Cdoc markers in source file and store result at the specified destination
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. "$(CCDev)/bin/resultCodes.ksh"

#^ 1 === top
trapString='errtrap $0 $LINENO'
#trap "$trapString" ERR

scriptpath=""
target=""
targetName=""
basePath=""
project=""
sourcePath=""
lastbuilt=""

#^ 2 === Paths
#^ setPaths
function setPaths {
	projectPath="${1}"
	target="${2}"
	targetName="${target##*/}"
	basePath="${projectPath%/*}"
	project="${projectPath##/*/}"
	sourcePath="${projectPath}/${target}"
	targetScript="${sourcePath}/${target##*/}_install.ksh"
	lastbuilt="$(CCDev)/build/${project}/${target}.lastbuilt"
}

#^ getPath
function getPath {
	typeset command patharg
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		command="${1}"
		projectPath="${2}"
		target="${3}"
	else
		print "USAGE: ccInstall --get<Path> pathToProject target"
		return $RC_MissingArgument
	fi
	
	setPaths "${projectPath}" "${target}"
	typeset -i index=-1
	case "${command}" in
		"--getBasePath" )		path="${basePath}";;
		"--getSourcePath" )		path="${sourcePath}";;
		"--getTargetScript" )	path="${targetScript}";;
		"--getLastbuilt" )		path="${lastbuilt}";;
		"--getTargetName" )		path="${targetName}";;
		* ) 					return $RC_InvalidParameter;;
	esac
	print "${path}"
}

#^ 3 === actions
#^ updateLastbuilt
function updateLastbuilt {
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
		return ${st}
	fi
	mkdir -p "$(dirname ${lastbuilt})"
	st=$?
	print $(basename ${lastbuilt}) $(date) > ${lastbuilt}
	return ${st}
}

#^ clearLastbuilt
function clearLastbuilt {
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
		return ${st}
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		rm "${lastbuilt}"
		st="$?"
		if [[ ${st} > 0 ]] ; then
			print "error: error ${st} attempting to remove file ${lastbuilt}"
			return ${st}
		fi
	fi
	return ${st}
}

#^ copyFile
function copyFile {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceForCopy="${1}"
		destinationForCopy="${2}"
	else
		print "USAGE: ccInstall --copyFile sourceForCopy destinationForCopy"
		return $RC_MissingArgument
	fi

	dir="${destinationForCopy%/*}"
	print "mkdir -p ${dir}"
	mkdir -p "${dir}"
	st=$?
	if [[ $st > 0 ]] ; then
		print "error: could not create directory ${dir}"
		return ${st}
	fi
	cp "${sourceForCopy}" "${destinationForCopy}"
	st=$?
	if [[ $st > 0 ]] ; then
		print "error: could not copy to ${destinationForCopy}"
		return ${st}
	fi
	print "copied to ${destinationForCopy}"
	return 0
}

#^ translateCdoc
function translateCdoc {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		in="${1}"
		out="${2}"
	else
		print "USAGE: ccInstall --translateCdoc in out"
		return $RC_MissingArgument
	fi
	mkdir -p $(dirname "${out}")
	st=$?
	if [[ $st > 0 ]] ; then
		print "error: could not create directory $(dirname ${destinationForCopy})"
		return ${st}
	fi
	sed '
		s|<!-- @navhead "\([^"][^"]*\)" "\([^"][^"]*\)" "\([^"][^"]*\)" -->|<div class="navhead"><a name="Top"></a><table class="navhead"><col class="navhead_c1" /><tr> <td>[<a href="\1">\2</a>]</td> <td >[<a href="\3#Contents">History</a>]</td><td class="right">[<a href="#Contents">Contents</a>]</td></tr></table></div>|
		s|<!-- @vershead "\([^"][^"]*\)" "\([^"][^"]*\)" "\([^"][^"]*\)" -->|<div class="navhead"><a name="Top"></a><table class="navhead"><col class="navhead_c1" /><tr> <td>[<a href="\1">\2</a>]</td> <td >[<a href="#\3">Version \3</a>]</td><td class="right">[<a href="#Contents">Contents</a>]</td></tr></table></div>|
		s|<!-- @histhead "\([^"][^"]*\)" "\([^"][^"]*\)" -->|<div class="navhead"><a name="Top"></a><table class="navhead"><col class="navhead_c1" /><tr><td>[<a href="\1#Contents">\2</a>]</td> <td >[<a href="#InProgress">InProgress</a>]</td><td class="right">[<a href="#Contents">Contents</a>]</td></tr></table></div>|
		s|<!-- @topicList "\([^"][^"]*\)" "\([^"][^"]*\)" -->|<div class="topics"><table class="topics"><col class="topics_c1" /><caption class="topics"><a name="\2">Topics: \1</a></caption>|
		s|<!-- @/topicList -->|</table></div>|
		s|<!-- @topicItem "\([^"][^"]*\)" "\([^"][^"]*\)" "\([^"][^"]*\)" "\([^"]*\)" -->|<tr><td class="i\3"><a href="\2">\1</a></td><td class="i\3">\4</td></tr>|
		s|<!-- @topicGroup "\([^"]*\)" "\([^"]*\)" -->|<tr><td class="topicGroup">\1<span class="linetag">\2</span></td></tr>|
		s|<!-- @topicSep -->|<tr><td>\&nbsp;</td></tr>|
		s|<!-- @marker "\([^"][^"]*\)" -->|<!-- marker \1 -->|
		s|<!-- @objective "\([^"][^"]*\)" "\([^"]*\)" -->|<p class="blurb">\2</p><p class="milestart">\1</p>|
		s|<!-- @/objective "\([^"][^"]*\)" "\([^"]*\)" -->|<p class="mileend">\2 \1</p>|
		s|<!-- @historyMark "\([^"][^"]*\)" -->|<p class="hmark"><a name="hmark_\1">\&lt;-- \1</a></p>|
		s|<!-- @goal "\([^"]*\)" "\([^"][^"]*\)" "\([^"]*\)" "\([^"]*\)" -->|<tr> <td>\1</td> <td>\2</td> <td>\3</td> <td align=\"center\">\4</td> </tr>|
		s|<!-- @useCaseHeader "\([^"][^"]*\)" "\([^"][^"]*\)" "\([1-5]\)" "\([hsupx]\)" -->|<h4><img src="../img/space.tiff" alt="" /><img src="../img/ucds_\3.tiff" alt="design scope \3" style="vertical-align:text-bottom;" /><img src="../img/space.tiff" alt="" /><a id="\2">\1</a><img src="../img/space.tiff" alt="" /><img src="../img/ucgl_\4.tiff" alt="goal level \4" style="vertical-align:text-bottom;" /></h4>|
		s|<!-- @CrcCard "\([^"][^"]*\)" -->|<div class="crcholder"><table class="crc" border="0" cellspacing="0" cellpadding="5" width="100%"><caption></caption><tr><th colspan="2">\1</th> </tr>|
		s|<!-- @/CrcCard -->|</table></div>|
	' <"$in" >"$out"
	if [[ "${?}" > 0 ]] ; then
		print "\nerror: attempt to generate output file ${out} failed"
		return 1
	fi
	# check for untranslated tokens
	x=$(sed -n 's|<!-- @|&|p' <"$out")
	if [[ -n "${x}" ]] ; then
		print "\nerror: unrecognized translator token(s):"
		print "$x"
		return 1
	fi
	return 0
}

#^ unused Cdoc translations -- saved in case needed later
function unused {
sed '
s|<!-- @doctype -->|<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">|
s|<!-- @metacontent -->|<meta http-equiv="content-type" content="text/html; charset=utf-8">|
s|<!-- @doctitle "\([^"][^"]*\)" -->|<title>\1</title>|
s|<!-- @copyright "\([^"][^"]*\)" -->|<meta name="copyright" content="\1">|
s|<!-- @stylesheet "\([^"][^"]*\)" -->|<link rel="stylesheet" type="text/css" href="\1">|
s|<!-- @class "\([^"]*\)" -->|<div class="classholder">|
s|<!-- @/class "\([^"]*\)" -->|</div>|
s|<!-- @attributeTable "\([^"][^"]*\)" -->|<div class="tableholder"><table class="tabl" border="0" cellspacing="0" cellpadding="5"><caption>\1</caption><tr><th>Name</th><th>Type</th><th>Options</th><th>Description</th></tr>|
s|<!-- @/attributeTable -->|</table></div>|
s|<!-- @attribute "\([^"][^"]*\)" "\([^"]*\)" "\([^"]*\)" "\([^"]*\)" -->|<tr><td class="mono">\1</td> <td>\2</td> <td>\3</td> <td>\4</td></tr>|
s|<!-- @attributeGroup "\([^"][^"]*\)" "\([^"]*\)" -->|<tr><td class="attributeGroup">\1</td> <td></td> <td></td> <td class="attributeGroupComment">\2</td></tr>|
s|<!-- @constantTable "\([^"][^"]*\)" -->|<div class="tableholder"><table class="tabl" border="0" cellspacing="0" cellpadding="5"><caption>\1</caption><tr><th>Name</th><th>Type/Value</th><th>Description/Comments</th></tr>|
s|<!-- @/constantTable -->|</table></div>|
s|<!-- @constant "\([^"][^"]*\)" "\([^"]*\)" "\([^"]*\)" -->|<tr><td class="cod">\1</td> <td>\2</td> <td>\3</td></tr>|
' <"$in" >"$out"
}

#^ 4 === getActions
function getActions {
	typeset -n resultObj=$1
	resultObj=(
		actionString=""
		doClean=0
		doInstall=0
		doTest=0
		doUpload=0
		doDoxygen=0
	)

	if [[ -n ${2} ]] ; then
		actionString="${2#-}"
		if [[ ${actionString} = ${2} ]] ; then
			print "$0#$LINENO: actionString $2: expected first character '-'"
			return $RC_SyntaxError
		fi
	else
		actionString="it"
	fi
	resultObj.actionString=${actionString}	
	typeset -i i=${#actionString}
	typeset -i errorCount=0
	while [[ $i > 0 ]] ; do
		ch=$(print ${actionString} | cut -c ${i})
		case "${ch}" in
			"c" )	resultObj.doClean=1;;
			"i" )
				if [[ $(ccInstall --getTargetName "${projectPath}" "${target}") = "Doxygen" ]] ; then
					resultObj.doDoxygen=1
				else
					resultObj.doInstall=1
				fi
				;;
			"t" )	resultObj.doTest=1;;
			"u" )	resultObj.doUpload=1;;
			* )		errorCount+=1;;
		esac
		i=i-1
	done
	if [[ ${errorCount} > 0 ]] ; then
		print "$0#$LINENO: --getActions ${actionString}: ${errorCount} invalid action flags"
		return $RC_InvalidInput
	fi
}

#^ 5 === Find ...
function findTests {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		projectPath="${1}"
		target="${2}"
	else
		print "USAGE: ccInstall findTests pathToProject target"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile="$(CCDev)/tmp/found"
	cd "${projectPath}/${target}"
	find . -type f -and -name "test*.ksh"| sed 's|\./||' > "${iofile}"
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

function findSources {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		projectPath="${1}"
		target="${2}"
	else
		print "error: USAGE: ccInstall findSources pathToProject target"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile="$(CCDev)/tmp/sources"
	cd "${projectPath}/${target}"
	lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
		return ${st}
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		find . -path '*/.git' -prune -or -type f -newer ${lastbuilt} | grep -v .git | grep -v .DS_Store | grep -v _install.ksh | grep -v '_Tests/*' | sed 's|\./||' > "${iofile}"
	else
		find . -path '*/.git' -prune -or -type f | grep -v .git | grep -v .DS_Store | grep -v _install.ksh | grep -v '_Tests/*' | sed 's|\./||' > "${iofile}"
	fi
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

function removeFolder {
	if [[ -n "${1}" ]] ; then
		folder="${1}"
	else
		print "error: USAGE: ccInstall --get<Path> pathToProject target"
		return $RC_MissingArgument
	fi
	if [[ -e ${folder} ]]; then			# folder exists
		if ! [[ -d ${folder} ]]; then
			print "error: ${folder} is not a directory"
			return $RC_NoSuchDirectory
		fi
		iofile="$(CCDev)/tmp/found3"
		origdir=$(pwd)
		print "= ${folder}"
		cd "${folder}"
		st=${?}
		if [[ ${st} > 0 ]] ; then
			print "error: could set directory to ${folder} because it does not exist or is not a directory"
			cd "${origdir}"
			return ${st}
		fi
		find . -path -prune -or -type f | sed 's|\./||' > "${iofile}"
		chmod a+r "${iofile}"

		while read fl ; do
			print -n "${fl}: "
			rm "${fl}"
			st=$?
			if [[ ${st} > 0 ]] ; then
				print "error: could not remove"
				cd "${origdir}"
				return ${st}
			fi
			print "removed"
		done < "${iofile}"
		
		find . -path -prune -or -type d | sed 's|\./||' | tail -r > "${iofile}"
		chmod a+r "${iofile}"

		while read fl ; do
			if [[ ${fl} = "." ]] ; then
				fl="${folder}"
			fi
			print 	"(${fl}: "
			rmdir "${fl}"
			st=$?
			if [[ ${st} > 0 ]] ; then
				print "error: could not remove"
				cd "${origdir}"
				return ${st}
			fi
			print "removed"
		done < "${iofile}"

		cd "${origdir}"
	fi
	return 0
}

#^ 7 === processActions
function processActions {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		projectPath="${1}"
		target="${2}"
		actionFlags="${3}"
	else
		print "USAGE: ccInstall processActions pathToProject target [-actionFlags]"
		return $RC_MissingArgument
	fi
	getActions actions ${actionFlags}
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$0#$LINENO: could not read action flags"
		return ${st}
	fi

	targetScript=$(ccInstall --getTargetScript "${projectPath}" "${target}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getTargetScript ${projectPath} ${target} failed"
		return ${st}
	fi

# clean
	if [[ ${actions.doClean} > 0 ]] ; then
		print "== cleaning ${projectPath##*/}/${target}..."
		msg=$("${targetScript}" --cleanTarget)
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "error: ${targetScript} --cleanTarget failed: ${msg}"
			return ${st}
		else
			print ${msg}
		fi
		lastbuilt=$(ccInstall --getLastbuilt "${projectPath}" "${target}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "$LINENO: ccInstall --getLastbuilt ${projectPath} ${target} failed"
			return ${st}
		fi
		ccInstall --clearLastbuilt "${projectPath}" "${target}"
	fi

# doxygen
	if [[ ${actions.doDoxygen} > 0 ]] ; then
		targetName=$(ccInstall --getTargetName "${projectPath}" "${target}")
		outputDir=$("${targetScript}" --getSubtargetDestination "Doxygen")
		installName="${outputDir##*/}"
		print "== installing ${installName} documentation"
		doxygenPath="/Applications/Doxygen.app/Contents/Resources/doxygen"
		mkdir -p "${outputDir}"
		st=$?
		if [[ $st > 0 ]] ; then
			print "failed to create output directory $outputDir"
			exit $st
		fi

	#  Run doxygen on the config file (builds local site)
		$doxygenPath "${projectPath}/${target}/${installName}_doxygen.txt"
		st=$?
		if [[ $st > 0 ]] ; then
			print "error while generating Doxygen docs"
			exit $st
		fi

	# Make docset using the Makefile that just generated
		print $outputDir/html
		make -C $outputDir/html install
		st=$?
		if [[ $st > 0 ]] ; then
			print "error while creating $project.docset"
			exit $st
		fi

	# Copy the docset to the location expected by Xcode
		docsetPath="/Users/$USER/Library/Developer/Shared/Documentation/DocSets/com.candcsoft.${installName}.docset"
		cp -r $outputDir/html/com.candcsoft.${installName}.docset $docsetPath
		st=$?
		if [[ $st > 0 ]] ; then
			print "could not copy docset to $docsetPath"
			exit $st
		fi

	# Tell Xcode to load the docset
		osascript -e "tell application \"Xcode\" to load documentation set with path \"$docsetPath\""
		st=$?
		if [[ $st > 0 ]] ; then
			print "error loading $docsetPath into Xcode"
			exit $st
		fi

	fi

# install
	if [[ ${actions.doInstall} > 0 ]] ; then
		print "== installing ${projectPath##*/}/${target}..."
		iofile=$(findSources "${projectPath}" "${target}")
		cd ${projectPath}
		typeset -i failcnt=0
		prevFolder=""
		while read fl ; do
			sourceFolder="${fl%%/*}"
			fpath="${fl#*/}"
			if [[ ! "${prevFolder}" = "${sourceFolder}" ]] ; then
				msg=$("${targetScript}" --getSubtargetDestination "${sourceFolder}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					print "error: ${msg}"
				else
					destination="${msg}"
					prevFolder="${sourceFolder}"
				fi
				if [[ -n "${destination}" ]] ; then
					print "=${projectPath##*/}/${target}/${sourceFolder}:"
				fi
			fi
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				print "error: ${msg}"
			else
				print -n "${fpath}: "
				msg=$("${targetScript}" --handleFile "${sourceFolder}" "${fpath}" "${destination}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					print "error: ${msg}"
				else
					hfile="${msg}"
					set -A copyInfo
					while read ln ; do
						copyInfo+=("${ln}")
					done < "${hfile}"
					action="${copyInfo[0]}"
					sourceForCopy="${copyInfo[1]}"
					destinationForCopy="${copyInfo[2]}"
				fi
				case "${action}" in
					"ignore" )
						print "skipped"
						;;
					"copy" )
						msg=$(ccInstall --copyFile "${sourceForCopy}" "${destinationForCopy}")
						st=$?
						if [[ ${st} > 0 ]] ; then
							failcnt="${failcnt}"+1
							print "error: ${msg}"
						else
							print "succeeded"
						fi
						;;
					"translateCdoc" )
						msg=$(ccInstall --translateCdoc "${sourceForCopy}" "${destinationForCopy}")
						st=$?
						if [[ ${st} > 0 ]] ; then
							failcnt="${failcnt}"+1
							print "error: ${msg}"
						else
							print "succeeded"
						fi
						;;
					* )
						print "error: Unrecognized action string ${action}"
						;;
				esac
			fi
		done < "${iofile}"
		if [[ ${failcnt} = 0 ]] ; then
			ccInstall --updateLastbuilt "${projectPath}" "${target}"
			print "build succeeded"
		else
			pl="s"
			if [[ ${failcnt} = 1 ]] ; then
				pl=""
			fi
			print "error: Build Failed: ${errcnt} error${pl} encountered; tests not run"
			exit "${failcnt}"
		fi
	fi

# test
	if [[ ${actions.doTest} > 0 ]] ; then
		iofile=$(findTests "${projectPath}" "${target}")
		cd ${projectPath}
		typeset -i failcnt=0

		while read ln ; do
			print "== ${target}/${ln}"
			trap "" ERR
			"${target}/${ln}"
			st=$?
			trap "$trapString" ERR
			if [[ "${st}" > 0 ]] ; then
				failcnt="${failcnt}"+1
			fi
		done < "${iofile}"

		if [[ "${failcnt}" > 0 ]] ; then
			return "${failcnt}"
		fi
	fi
	return 0
}

#^ 8 === ccInstall
function ccInstall {
	if [[ $# = 0 ]] ; then
		print "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--getActions" )
			getActions "${2}" "${3}"
			return $?
			;;
		"--get"* )
			val=$(getPath "${1}" "${2}" "${3}")
			es=$?
			print "${val}"
			return "${es}"
			;;
		"--help" )
			print "${HELP}"
			;;
		"--findTests" )
			msg=$(findTests "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--findSources" )
			msg=$(findSources "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--updateLastbuilt" )
			msg=$(updateLastbuilt "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--clearLastbuilt" )
			msg=$(clearLastbuilt "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--removeFolder" )
			msg=$(removeFolder "${2}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--copyFile" )
			msg=$(copyFile "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--translateCdoc" )
			msg=$(translateCdoc "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			msg=$(processActions "${1}" "${2}" "${3}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
	esac
	return 0
}

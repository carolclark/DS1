#!/bin/ksh

#  ccInstall.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='ccInstall -- installation script and supporting functions'
USAGE='
ccInstall workspaceRoot targetFolder [actionFlags]
#	build the specified project target
#		actionFlags: [-[citud]+] - actions requested (clean, install, test, upload, doxygen); default: -it
ccInstall commandFlag [argument(s)]
#	--setPaths			set derived paths from arguments
#	--get<Path>			workspaceRoot targetFolder
#		<Path>: 		WorkspaceRoot | BaseBath | SourcePath | TargetScript | Lastbuilt | TargetName
#		result: 		string containing specified path
#	--updateLastbuilt	workspaceRoot targetFolder
#						set last built flag to the current date and time
#	--clearLastbuilt	workspaceRoot targetFolder
#						clear last built flag; forces for rebuild on next install operation
#	--copyFile			sourceFile destinationPath
#						copy source file to the specified destination
#	--translateCdoc		sourceFile destinationPath
#						translate Cdoc markers in source file and store result at the specified destination
#	--getActions		resultObject workspaceRoot targetFolder [actionString]
#		actionString: [-[citud]+] - actions requested (clean, install, test, upload, doxygen)
#			default: -it
#			resultObject: object to contain results
#	--findTests 		testPath
#		result: 		path to file containing list of shunit tests on <testPath>
#	--findSources		workspaceRoot targetFolder
#		result: 		path to file containing list of source files for <workspaceRoot>/<targetFolder>
#	--removeFolder		removes contents and folder for the folder specified
#	--runShunitTests	folder
#						runs all shunit tests found in folder
#	--processActions	workspaceRoot targetFolder actionFlags
#	--ccInstall			workspaceRoot targetFolder actionFlags
#						performs specified action on targetFolder
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. "${CCDev}/bin/resultCodes.ksh"

#^ 1 === top

workspaceRoot=""		# full path to folder containing Workspace file
scriptpath=""
target=""
targetFolder=""			# path from workspaceRoot to folder containing sources
targetName=""
basePath=""
project=""
sourcePath=""
lastbuilt=""

#^ 2 === Paths
#^ setPaths
function setPaths {
	workspaceRoot="${1}"
	targetFolder="${2}"
	target="${targetFolder}"
	targetName="${targetFolder##*/}"
	basePath="${workspaceRoot%/*}"
	project="${workspaceRoot##/*/}"
	sourcePath="${workspaceRoot}/${targetFolder}"
	targetScript="${sourcePath}/${targetFolder##*/}_install.ksh"
	lastbuilt="${CCDev}/build/${project}/${targetFolder}.lastbuilt"
}

#^ getPath
function getPath {
	typeset command patharg
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		command="${1}"
		workspaceRoot="${2}"
		targetFolder="${3}"
	else
		print "USAGE: ccInstall --get<Path> pathToProject targetFolder"
		return $RC_MissingArgument
	fi

	setPaths "${workspaceRoot}" "${targetFolder}"
	typeset -i index=-1
	case "${command}" in
		"--getWorkspaceRoot" )	path="${workspaceRoot}";;
		"--getTarget" )			path="${targetFolder}";;
		"--getTargetFolder" )	path="${targetFolder}";;
		"--getTargetName" )		path="${targetName}";;
		"--getBasePath" )		path="${basePath}";;
		"--getProject" )		path="${project}";;
		"--getSourcePath" )		path="${sourcePath}";;
		"--getTargetScript" )	path="${targetScript}";;
		"--getLastbuilt" )		path="${lastbuilt}";;
		* ) 					return $RC_InvalidParameter;;
	esac
	print "${path}"
}

#^ 3 === actions
#^ updateLastbuilt
function updateLastbuilt {
	workspaceRoot="${1}"
	targetFolder="${2}"
	lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${workspaceRoot} ${targetFolder} failed"
		return ${st}
	fi
	mkdir -p "$(dirname ${lastbuilt})"
	st=$?
	print $(basename ${lastbuilt}) $(date) > ${lastbuilt}
	return ${st}
}

#^ clearLastbuilt
function clearLastbuilt {
	workspaceRoot="${1}"
	targetFolder="${2}"
	lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${workspaceRoot} ${targetFolder} failed"
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
function getActions {			# resultObject workspaceRoot targetFolder actionString
	typeset -n resultObj=$1
	resultObj=(
		actionString=""
		doClean=0
		doInstall=0
		doTest=0
		doUpload=0
		doDoxygen=0
	)
	workspaceRoot="${2}"
	targetFolder="${3}"
	if [[ ! -n "${workspaceRoot}" ]] || [[ ! -n "${targetFolder}" ]]; then
		print "USAGE: ccInstall --getActions resultObject workspaceRoot targetFolder actionString"
		return $RC_MissingArgument
	fi
	if [[ -n ${4} ]] ; then
		actionString="${4#-}"
		if [[ ${actionString} = ${4} ]] ; then
			print "$0#$LINENO: actionString $4: expected first character '-'"
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
				if [[ $(ccInstall --getTargetName "${workspaceRoot}" "${targetFolder}") = "Doxygen" ]] ; then
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

#pragma mark 6 === runShunitTests
function runShunitTests {
	if [[ -n "${1}" ]] ; then
		testPath="${1}"
	else
		print "USAGE: ccInstall runShunitTests testPath"
		return $RC_MissingArgument
	fi

	errout="$CCDev/tmp/errout"
	errinfo="$CCDev/tmp/errinfo"
	errtmp="$CCDev/tmp/errtmp"
	iofile=$(findTests "${testPath}")
	cd ${workspaceRoot}
	typeset -i failcnt=0
	typeset -i errcnt=0
	echo "" > "$errinfo"

	while read ln ; do
		print "== ${testPath}/${ln}"
		"${testPath}/${ln}" 2>"$errout"
		st=$?
		if [[ "${st}" > 0 ]] ; then
			failcnt=$failcnt+1
		fi
		grep -v "EXPECTED ERROR" $errout > $errtmp
		if [[ $(cat "$errtmp") != "" ]] ; then										# file is not empty
			if [[ $(cat "$errtmp" | sed 's|\n||g' | sed s'| ||g') != "" ]] ; then	# contains non-whitespace
							# appears that long EXPECTED ERROR can output an extra CR into $errout
				errcnt=$errcnt+1
				cat $errtmp >> $errinfo
			fi
		fi
	done < "${iofile}"
	if [[ $failcnt > 0 ]] ; then
		echo "FAILURES ($failcnt test files encountered failing tests)"
	fi
	if [[ $errcnt > 0 ]] ; then
		echo "ERRORS ($errcnt test files encountered execution errors):"
		cat "$errinfo"
	fi
	return $(($failcnt+$errcnt))

}

#^ 5 === Find ...
function findTests {
	if [[ -n "${1}" ]] ; then
		testPath="${1}"
	else
		print "USAGE: ccInstall findTests testPath"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile="${CCDev}/tmp/found"
	cd "${testPath}"
	find . -type f -and -name "test*.ksh"| sed 's|\./||' > "${iofile}"
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

function findSources {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		workspaceRoot="${1}"
		targetFolder="${2}"
	else
		print "error: USAGE: ccInstall findSources pathToProject targetFolder"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile="${CCDev}/tmp/sources"
	cd "${workspaceRoot}/${targetFolder}"
	lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getLastbuilt ${workspaceRoot} ${targetFolder} failed"
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
		print "error: USAGE: ccInstall --get<Path> pathToProject targetFolder"
		return $RC_MissingArgument
	fi
	if [[ -e ${folder} ]]; then			# folder exists
		if ! [[ -d ${folder} ]]; then
			print "error: ${folder} is not a directory"
			return $RC_NoSuchFileOrDirectory
		fi
		iofile="${CCDev}/tmp/found3"
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
		workspaceRoot="${1}"
		targetFolder="${2}"
		actionFlags="${3}"
	else
		print "USAGE: ccInstall processActions pathToProject targetFolder [-actionFlags]"
		return $RC_MissingArgument
	fi
	getActions actions "${workspaceRoot}" "${targetFolder}" ${actionFlags}
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$0#$LINENO: could not read action flags"
		return ${st}
	fi

	targetScript=$(ccInstall --getTargetScript "${workspaceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		print "$LINENO: ccInstall --getTargetScript ${workspaceRoot} ${targetFolder} failed"
		return ${st}
	fi

# clean
	if [[ ${actions.doClean} > 0 ]] ; then
		print "== cleaning ${workspaceRoot##*/}/${targetFolder}..."
		msg=$("${targetScript}" --cleanTarget)
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "error: ${targetScript} --cleanTarget failed: ${msg}"
			return ${st}
		else
			print ${msg}
		fi
		lastbuilt=$(ccInstall --getLastbuilt "${workspaceRoot}" "${targetFolder}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			print "$LINENO: ccInstall --getLastbuilt ${workspaceRoot} ${targetFolder} failed"
			return ${st}
		fi
		ccInstall --clearLastbuilt "${workspaceRoot}" "${targetFolder}"
	fi

# doxygen
	if [[ ${actions.doDoxygen} > 0 ]] ; then
		targetName=$(ccInstall --getTargetName "${workspaceRoot}" "${targetFolder}")
		outputDir=$("${targetScript}" --getSubtargetDestination "Doxygen")
		installName="${outputDir##*/}"
		print "== installing ${installName} documentation"
		doxygenPath="/Applications/Doxygen.app/Contents/Resources/doxygen"
		mkdir -p "${outputDir}"
		st=$?
		if [[ $st > 0 ]] ; then
			print "failed to create output directory $outputDir"
			return $st
		fi

	#  Run doxygen on the config file (builds local site)
		$doxygenPath "${workspaceRoot}/${targetFolder}/${installName}_doxygen.txt"
		st=$?
		if [[ $st > 0 ]] ; then
			print "error while generating Doxygen docs"
			return $st
		fi

	# Make docset using the Makefile that just generated
		print $outputDir/html
		make -C $outputDir/html install
		st=$?
		if [[ $st > 0 ]] ; then
			print "error while creating $project.docset"
			return $st
		fi

	# Copy the docset to the location expected by Xcode
		docsetPath="/Users/$USER/Library/Developer/Shared/Documentation/DocSets/com.candcsoft.${installName}.docset"
		cp -r $outputDir/html/com.candcsoft.${installName}.docset $docsetPath
		st=$?
		if [[ $st > 0 ]] ; then
			print "could not copy docset to $docsetPath"
			return $st
		fi

	# Tell Xcode to load the docset
		osascript -e "tell application \"Xcode\" to load documentation set with path \"$docsetPath\""
		st=$?
		if [[ $st > 0 ]] ; then
			print "error loading $docsetPath into Xcode"
			return $st
		fi

	fi

# install
	if [[ ${actions.doInstall} > 0 ]] ; then
		print "== installing ${workspaceRoot##*/}/${targetFolder}..."
		iofile=$(findSources "${workspaceRoot}" "${targetFolder}")
		cd ${workspaceRoot}
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
					print "=${workspaceRoot##*/}/${targetFolder}/${sourceFolder}:"
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
			ccInstall --updateLastbuilt "${workspaceRoot}" "${targetFolder}"
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
#	When shunit tests encounter an error, output is sent to stdout and a nonzero exit status is returned.
#	The tests themselves may also also throw errors. Messages for those cases should include the text "EXPECTED ERROR".
#	Here:
#		failcnt: number of test files that encounter failures, +1 if execution errors are encountered
#		errout: file to collect stderr output
#	returns nonzero exit status if test failures are encountered or messages not including "EXPECTED ERROR" are sent to stderr.

	if [[ ${actions.doTest} > 0 ]] ; then
		runShunitTests "${workspaceRoot}/${targetFolder}"
	fi
}

#^ 8 === ccInstall
function ccInstall {
	if [[ $# = 0 ]] ; then
		print "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--getActions" )
			getActions "${2}" "${3}" "${4}" "${5}"
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
			msg=$(findTests "${2}")
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
		"--runShunitTests" )
			runShunitTests "${2}"
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

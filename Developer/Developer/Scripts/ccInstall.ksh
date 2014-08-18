#!/bin/ksh

#  ccInstall.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright 2011-13 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

NAME='ccInstall -- installation script and supporting functions'
USAGE='
ccInstall sourceRoot targetFolder [action]
#	build the specified project target
#		action: action requested (clean, install, test); default: install
ccInstall commandFlag [argument(s)]
#	--setPaths			set derived paths from arguments
#	--get<Path>			sourceRoot targetFolder
#		<Path>: 		SourceRoot | TargetFolder | TargetName | Lastbuilt
#		result: 		string containing specified path
#	--updateLastbuilt	sourceRoot targetFolder
#						set last built flag to the current date and time
#	--clearLastbuilt	sourceRoot targetFolder
#						clear last built flag; forces for rebuild on next install operation
#	--copyFile			sourceFile destinationPath
#						copy source file to the specified destination
#	--translateCdoc		sourceFile destinationPath
#						translate Cdoc markers in source file and store result at the specified destination
#	--getAction			sourceRoot targetFolder [actionString]
#						actionString: from (clean, install, test)
#						result: from (clean, install, test, doxygen)
#	--getActions		resultObject sourceRoot targetFolder [actionString]
#		actionString: [-[citud]+] - actions requested (clean, install, test, upload, doxygen)
#			default: -i, or -c if "clean" passed
#			resultObject: object to contain results
#	--findTests 		testPath
#		result: 		path to file containing list of shunit tests on <testPath>
#	--findSources		sourceRoot targetFolder
#		result: 		path to file containing list of source files for <sourceRoot>/<targetFolder>
#	--removeFolder		removes contents and folder for the folder specified
#	--runShunitTests	folder
#						runs all shunit tests found in folder
#	--processAction	callbackScript sourceRoot targetFolder action
#	--ccInstall			sourceRoot targetFolder action
#						performs specified action on targetFolder
#	--DEV				short user name (name of $HOME folder)
#						return path containing development projects for this user
#	--SHUnit			<no args>
#						return path to SHUnit test driver
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/errcc"

#^ 1 === top

sourceRoot=""			# path to folder containing project (Xcode's $SRCROOT)
targetFolder=""			# path from sourceRoot to folder containing sources
targetName=""			# name of Xcode target
lastbuilt=""			# path to internal file that knows when a target was last built

#^ 2 === Paths
#^ setPaths
function setPaths {
	sourceRoot="${1}"
	targetFolder="${2}"

	targetName="${targetFolder%%/*}"
	workspacePath="${sourceRoot%/*}"			# local var
	workspaceName="${workspacePath##/*/}"		# local var
	lastbuilt="${CCDev}/build_output/${workspaceName}/${sourceRoot##*/}/${targetName}.lastbuilt"
}

#^ getPath
function getPath {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		command="${1}"
		sourceRoot="${2}"
		targetFolder="${3}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --get<Path> SRCROOT targetFolder"
		return
	fi

	setPaths "${sourceRoot}" "${targetFolder}"
	typeset -i index=-1
	case "${command}" in
		"--getTargetFolder" )	path="${targetFolder}";;
		"--getSourceRoot" )		path="${sourceRoot}";;
		"--getTargetName" )		path="${targetName}";;
		"--getLastbuilt" )		path="${lastbuilt}";;
		* ) 					errorMessage $RC_InvalidParameter "$0#$LINENO:"; return;;
	esac
	print "${path}"
}

#^ 3 === actions
#^ updateLastbuilt
function updateLastbuilt {
	sourceRoot="${1}"
	targetFolder="${2}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "$LINENO: ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
		return
	fi
	mkdir -p "$(dirname ${lastbuilt})"
	st=$?
	print $(basename ${lastbuilt}) $(date) > ${lastbuilt}
	return ${st}
}

#^ clearLastbuilt
function clearLastbuilt {
	sourceRoot="${1}"
	targetFolder="${2}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "$LINENO: ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
		return
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		rm "${lastbuilt}"
		st="$?"
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: error ${st} attempting to remove file ${lastbuilt}"
			return
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --copyFile sourceForCopy destinationForCopy"
		return
	fi

	dir="${destinationForCopy%/*}"
	print "mkdir -p ${dir}"
	mkdir -p "${dir}"
	st=$?
	if [[ $st > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error #{st}: could not create directory ${dir}"
		return
	fi
	cp "${sourceForCopy}" "${destinationForCopy}"
	st=$?
	if [[ $st > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: could not copy to ${destinationForCopy}"
		return
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --translateCdoc in out"
		return
	fi
	mkdir -p $(dirname "${out}")
	st=$?
	if [[ $st > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: could not create directory $(dirname ${destinationForCopy})"
		return
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
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: attempt to generate output file ${out} failed"
		return
	fi
	# check for untranslated tokens
	x=$(sed -n 's|<!-- @|&|p' <"$out")
	if [[ -n "${x}" ]] ; then
		errorMessage $RC_SyntaxError "$0#$LINENO:" "error: unrecognized translator token(s): ${x}"
		return
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

#^ 4 === getAction
function getAction {			# sourceRoot targetFolder actionString
	sourceRoot="${1}"
	targetFolder="${2}"
	if [[ ! -n "${sourceRoot}" ]] || [[ ! -n "${targetFolder}" ]]; then
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --getAction  sourceRoot targetFolder [action]"
		return
	fi
	action="install"
	if [[ -n ${3} ]] ; then
		if [[ "${3}" = "install" ]] || [[ "${3}" = "clean" ]] || [[ "${3}" = "test" ]] ; then
			action="${3}"
		else
			errorMessage $RC_InvalidInput "$0#$LINENO:" "invalid action string ${3}"
			return
		fi
	fi
	if [[ $action = "install" ]] ; then
		if [[ $(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}") = "Doxygen" ]] ; then
			action="doxygen"
		fi
	fi
	print "${action}"
}

function getActions {			# resultObject sourceRoot targetFolder actionString
	typeset -n resultObj=$1
	resultObj=(
		actionString=""
		doClean=0
		doInstall=0
		doTest=0
		doUpload=0
		doDoxygen=0
	)
	sourceRoot="${2}"
	targetFolder="${3}"
	if [[ ! -n "${sourceRoot}" ]] || [[ ! -n "${targetFolder}" ]]; then
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --getActions resultObject sourceRoot targetFolder actionString"
		return
	fi
	actionString="i"
	if [[ -n ${4} ]] ; then
		if [[ "${4}" = "clean" ]] ; then
			actionString="c"
		else
			actionString="${4#-}"
			if [[ ${actionString} = ${4} ]] ; then
				errorMessage $RC_SyntaxError "$0#$LINENO:" "actionString $4: expected first character '-'"
				return
			fi
		fi
	fi
	resultObj.actionString=${actionString}
	typeset -i i=${#actionString}
	typeset -i errorCount=0
	while [[ $i > 0 ]] ; do
		ch=$(print ${actionString} | cut -c ${i})
		case "${ch}" in
			"c" )	resultObj.doClean=1;;
			"i" )
				if [[ $(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}") = "Doxygen" ]] ; then
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
		errorMessage $RC_InvalidInput "$0#$LINENO:" "--getActions ${actionString}: ${errorCount} invalid action flags"
		return
	fi
}

#pragma mark 6 === runShunitTests
function runShunitTests {
	if [[ -n "${1}" ]] ; then
		testPath="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall runShunitTests testPath"
		return
	fi

	errout="$CCDev/tmp/errout"
	errinfo="$CCDev/tmp/errinfo"
	errtmp="$CCDev/tmp/errtmp"
	iofile=$(findTests "${testPath}")
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
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall findTests testPath"
		return
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
		sourceRoot="${1}"
		targetFolder="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall findSources sourceRoot targetFolder"
		return
	fi

	origdir=$(pwd)
	iofile="${CCDev}/tmp/sources"
	cd "${sourceRoot}/${targetFolder}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
		return
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		find . -type f -newer ${lastbuilt} | grep -v '\.git' | grep -v .DS_Store | grep -v _install.ksh | grep -v '.pyc' | grep -v '_Tests/*' | sed 's|\./||' > "${iofile}"
	else
		find . -type f | grep -v '\.git' | grep -v .DS_Store | grep -v _install.ksh | grep -v '.pyc' | grep -v '_Tests/*' | sed 's|\./||' > "${iofile}"
	fi
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

function removeFolder {
	if [[ -n "${1}" ]] ; then
		check="${1#${HOME}}"
		if [[ "${1}" = "${check}" ]] ; then
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "removeFolder expects folder inside ${HOME}"
		else
			folder="${1}"
		fi
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall folder"
		return
	fi
	if [[ -e "${folder}" ]]; then			# folder exists
		if ! [[ -d "${folder}" ]]; then
			errorMessage $RC_NoSuchFileOrDirectory "$0#$LINENO:" "error: ${folder} is not a directory"
			return
		fi
		/usr/local/bin/python3 "${CCDev}/bin/python/util.py" "remove_folder" "${folder}"
	fi
	return 0
}

#^ 7 === processAction
function processAction {
	callbackScript=""
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		callbackScript="${1}"
		sourceRoot="${2}"
		targetFolder="${3}"
		actionIn="${4}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall processAction callbackScript sourceRoot targetFolder [action]"
		return
	fi
	action=$(getAction "${sourceRoot}" "${targetFolder}" ${actionIn})

# clean
	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${targetFolder}..."
		msg=$("${callbackScript}" --cleanTarget "${sourceRoot}" "${targetFolder}" "${action}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${callbackScript} --cleanTarget failed: ${msg}"
			return
		else
			print ${msg}
		fi
		lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
			return
		fi
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	fi

# doxygen
	if [[ ${action} = "doxygen" ]] ; then
		targetName=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
		outputDir=$("${callbackScript}" --getSubtargetDestination "${sourceRoot}" "${targetFolder}" "${action}" "Doxygen")
		installName="${outputDir##*/}"
		print "== installing ${installName} documentation"
		doxygenPath="/Applications/Doxygen.app/Contents/Resources/doxygen"
		mkdir -p "${outputDir}"
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "failed to create output directory $outputDir"
			return
		fi

	#  Run doxygen on the config file (builds local site)
		$doxygenPath "${sourceRoot}/${targetFolder}/${installName}_doxygen.txt"
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error while generating Doxygen docs"
			return
		fi

	# Make docset using the Makefile that just generated
		print $outputDir/html
		make -C $outputDir/html install
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error while creating $workspaceName.docset"
			return
		fi

	# Copy the docset to the location expected by Xcode
		docsetPath="/Users/$USER/Library/Developer/Shared/Documentation/DocSets/com.candcsoft.${installName}.docset"
		cp -r $outputDir/html/com.candcsoft.${installName}.docset $docsetPath
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "could not copy docset to $docsetPath"
			return
		fi

	# Tell Xcode to load the docset
		osascript -e "tell application \"Xcode\" to load documentation set with path \"$docsetPath\""
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error loading $docsetPath into Xcode"
			return
		fi

	fi

# install
	if [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(findSources "${sourceRoot}" "${targetFolder}")
		typeset -i failcnt=0
		prevFolder=""
		while read fl ; do
			sourceFolder="${fl%%/*}"
			fpath="${fl#*/}"
			if [[ ! "${prevFolder}" = "${sourceFolder}" ]] ; then
				msg=$("${callbackScript}" --getSubtargetDestination "${sourceRoot}" "${targetFolder}" "${action}" "${sourceFolder}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
				else
					destination="${msg}"
					prevFolder="${sourceFolder}"
				fi
				if [[ -n "${destination}" ]] ; then
					print "=${sourceRoot##*/}/${targetFolder}/${sourceFolder}:"
				fi
			fi
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
			else
				print -n "${fpath}: "
				msg=$("${callbackScript}" --prepareFileOperation "${sourceRoot}" "${targetFolder}" "${action}" "${sourceFolder}" "${fpath}" "${destination}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
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
							errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
						else
							print "succeeded"
						fi
						;;
					"translateCdoc" )
						msg=$(ccInstall --translateCdoc "${sourceForCopy}" "${destinationForCopy}")
						st=$?
						if [[ ${st} > 0 ]] ; then
							failcnt="${failcnt}"+1
							errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
						else
							print "succeeded"
						fi
						;;
					* )
						errorMessage $RC_InputNotHandled "$0#$LINENO:" "error: Unrecognized action string ${action}"
						;;
				esac
			fi
		done < "${iofile}"
		if [[ ${failcnt} = 0 ]] ; then
			ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
			print "build succeeded"
		else
			pl="s"
			if [[ ${failcnt} = 1 ]] ; then
				pl=""
			fi
			errorMessage 1 "$0#$LINENO:" "error: Build Failed: ${errcnt} error${pl} encountered; tests not run"
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
		runShunitTests "${sourceRoot}/${targetFolder}"
	fi
}

function DEV {
	if [[ -n "${1}" ]] ; then
		username="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --DEV user"
		return
	fi

	case "${username}" in
		"lauramartinez" )
			DEV="/Users/${username}/Documents/Projects"
			;;
		"carolclark" )
            if [[ -e "${HOME}/Dev" ]] ; then
                DEV="${HOME}/Dev"
            else
                DEV="/Volumes/Mac/Users/${username}/Dev"
            fi
			;;
		* )
			DEV="/Users/${username}/Dev"
			;;
	esac
	print "${DEV}"
}

function SHUnit {
	print "${CCDev}/shunit/src/shunit2"
}

#^ 8 === ccInstall
function ccInstall {
	if [[ $# = 0 ]] ; then
		errorMessage $RC_MissingArgument "$0#$LINENO:" "$0: missing commandFlag"
		return
	fi

	case "${1}" in
		"--getAction" )
			action=$(getAction "${2}" "${3}" "${4}")	# sourceRoot targetFolder [actionString]
			es=$?
			print "${action}"
			return "${es}"
			;;
		"--getActions" )
			getActions "${2}" "${3}" "${4}" "${5}"		# resultObject sourceRoot targetFolder [actionString]
			return $?
			;;
		"--get"* )
			val=$(getPath "${1}" "${2}" "${3}")			# command sourceRoot targetFolder
			es=$?
			print "${val}"
			return "${es}"
			;;
		"--help" )
			print "${HELP}"								# <no args>
			;;
		"--findTests" )
			msg=$(findTests "${2}")						# testPath
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--findSources" )
			msg=$(findSources "${2}" "${3}")			# sourceRoot targetFolder
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--updateLastbuilt" )
			msg=$(updateLastbuilt "${2}" "${3}")		# sourceRoot targetFolder
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--clearLastbuilt" )
			msg=$(clearLastbuilt "${2}" "${3}")			# sourceRoot targetFolder
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--removeFolder" )
			msg=$(removeFolder "${2}")					# folder
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--copyFile" )
			msg=$(copyFile "${2}" "${3}")				# sourceForCopy destinationForCopy
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--translateCdoc" )
			msg=$(translateCdoc "${2}" "${3}")			# sourceRoot targetFolder
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--runShunitTests" )
			runShunitTests "${2}"						# testPath
			;;
		"--DEV" )										# short user name
			msg=$(DEV "${2}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--SHUnit" )									# <no args>
			msg=$(SHUnit)
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--"* )
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid subcommand $1"	# <invalid arg>
			return
			;;
		* )
			msg=$(processAction "${1}" "${2}" "${3}" "${4}")	# callbackScript sourceRoot targetFolder action
			es=$?
			print "${msg}"
			return "${es}"
			;;
	esac
	return 0
}

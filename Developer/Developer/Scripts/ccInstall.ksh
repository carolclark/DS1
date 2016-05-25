#!/bin/ksh

#  ccInstall.ksh
#  Support
#
#  Created by Carol Clark on 10/20/11.
#  Copyright (c) 2011-16 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark === Markers ===
# 1 setPaths getPath DEV SHUnit
# 2 updateLastBuilt clearLastBuilt copyfile
# 3 runShunitTests
# 4 removeFolder
# 5 translateCdoc unusedCdocTranslations
# 6 (reserved - doxygen)
# 8 getAction findTests findSources installOneFile processAction
# 9 ccInstall

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
#						translate Cdoc markers in source file; store result at destination
#	--getAction			sourceRoot targetFolder [actionString]
#						actionString: from (clean, install, test)
#						result: from (clean, install, test, doxygen)
#	--findTests 		testPath
#		result: 		path to file containing list of shunit tests on <testPath>
#	--findSources		sourceRoot targetFolder
#		result: 		path to file containing natural-order list of source files for <sourceRoot>/<targetFolder>
#	--removeFolder		removes contents and folder for the folder specified
#	--runShunitTests	folder
#						runs all shunit tests found in folder
#	--installOneFile	installAction (install | translateCdoc | ignore) source destination
#	--processAction		callbackScript sourceRoot targetFolder action
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

#pragma mark 1 === Paths

sourceRoot=""			# path to folder containing project (Xcode's $SRCROOT)
targetFolder=""			# path from sourceRoot to folder containing sources
targetName=""			# name of Xcode target
lastbuilt=""			# path to internal file that knows when a target was last built

#pragma mark setPaths
function setPaths {
	sourceRoot="${1}"
	targetFolder="${2}"

	targetName="${targetFolder%%/*}"
	workspacePath="${sourceRoot%/*}"			# local var
	workspaceName="${workspacePath##/*/}"		# local var
	lastbuilt="${CCDev}/build_output/${workspaceName}/${sourceRoot##*/}/${targetName}.lastbuilt"
}

#pragma mark getPath
function getPath {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		command="${1}"
		sourceRoot="${2}"
		targetFolder="${3}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --get<Path> SRCROOT targetFolder"
		return $RC_MissingArgument
	fi

	setPaths "${sourceRoot}" "${targetFolder}"
	typeset -i index=-1
	case "${command}" in
		"--getTargetFolder" )	path="${targetFolder}";;
		"--getSourceRoot" )		path="${sourceRoot}";;
		"--getTargetName" )		path="${targetName}";;
		"--getLastbuilt" )		path="${lastbuilt}";;
		* ) 					errorMessage $RC_InvalidParameter "$0#$LINENO:"; return $RC_InvalidParameter;;
	esac
	print "${path}"
}

#pragma mark DEV
function DEV {
	if [[ -n "${1}" ]] ; then
		username="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --DEV user"
		return $RC_MissingArgument
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

#pragma mark SHUnit
function SHUnit {
	print "${CCDev}/shunit/src/shunit2"
}

#pragma mark 2 === Install
#pragma mark updateLastbuilt
function updateLastbuilt {
	sourceRoot="${1}"
	targetFolder="${2}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "$LINENO: ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
		return ${st}
	fi
	mkdir -p "$(dirname ${lastbuilt})"
	st=$?
	print $(basename ${lastbuilt}) $(date) > ${lastbuilt}
	return ${st}
}

#pragma mark clearLastbuilt
function clearLastbuilt {
	sourceRoot="${1}"
	targetFolder="${2}"
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "$LINENO: ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
		return ${st}
	fi
	if [[ -e "${lastbuilt}" ]] ; then
		rm "${lastbuilt}"
		st="$?"
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: error ${st} attempting to remove file ${lastbuilt}"
			return ${st}
		fi
	fi
	return ${st}
}

#pragma mark copyFile
function copyFile {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceForCopy="${1}"
		destinationForCopy="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --copyFile sourceForCopy destinationForCopy"
		return $RC_MissingArgument
	fi

	dir="${destinationForCopy%/*}"
	print "mkdir -p ${dir}"
	mkdir -p "${dir}"
	st=$?
	if [[ $st > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error #{st}: could not create directory ${dir}"
		return ${st}
	fi
	cp "${sourceForCopy}" "${destinationForCopy}"
	st=$?
	if [[ $st > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: could not copy to ${destinationForCopy}"
		return ${st}
	fi
	print "copied to ${destinationForCopy}"
	return 0
}

#pragma mark 3 === runShunitTests
function runShunitTests {
#	failcnt: number of test files that encounter failures, +1 if execution errors are encountered
#	errout: file to collect stderr output
#	returns nonzero exit status if test failures are encountered.
	if [[ -n "${1}" ]] ; then
		testPath="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall runShunitTests testPath"
		return $RC_MissingArgument
	fi

	errout="${CCDev}/tmp/errout"
	errinfo="${CCDev}/tmp/errinfo"
	iofile=$(findTests "${testPath}")
	typeset -i testfiles=0
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
		if [[ $(cat "$errout") != "" ]] ; then										# errout file is not empty
			if [[ $(cat "$errout" | sed 's|\n||g' | sed s'| ||g') != "" ]] ; then	# contains non-whitespace
				errcnt=$errcnt+1
				cat $errout >> $errinfo
			fi
		fi
		testfiles=$testfiles+1
	done < "${iofile}"
	echo "$testPath: $testfiles test files run"
	if [[ $failcnt > 0 ]] ; then
		echo "FAILURES ($failcnt test files encountered failing tests)"
	fi
	if [[ $errcnt > 0 ]] ; then
		echo "ERRORS ($errcnt test files encountered execution errors):"
		cat "$errinfo"
	fi
	return $(($failcnt+$errcnt))

}

#pragma mark 4 === Clean
#pragma mark removeFolder
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
		return $RC_MissingArgument
	fi
	if [[ -e "${folder}" ]]; then			# folder exists
		if ! [[ -d "${folder}" ]]; then
			errorMessage $RC_NoSuchFileOrDirectory "$0#$LINENO:" "error: ${folder} is not a directory"
			return $RC_NoSuchFileOrDirectory
		fi
		/usr/local/bin/python3 "${CCDev}/bin/python/util.py" "remove_my_folder" "${folder}"
	fi
	return 0
}

#pragma mark 5 === Cdoc
#pragma mark translateCdoc
function translateCdoc {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		in="${1}"
		out="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --translateCdoc in out"
		return $RC_MissingArgument
	fi
	mkdir -p $(dirname "${out}")
	st=$?
	if [[ $st > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: could not create directory $(dirname ${destinationForCopy})"
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
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: attempt to generate output file ${out} failed"
		return ${st}
	fi
	# check for untranslated tokens
	x=$(sed -n 's|<!-- @|&|p' <"$out")
	if [[ -n "${x}" ]] ; then
		errorMessage $RC_SyntaxError "$0#$LINENO:" "error: unrecognized translator token(s): ${x}"
		return $RC_SyntaxError
	fi
	return 0
}

#pragma mark unused Cdoc translations -- saved in case needed later
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

#pragma mark 8 === Action
# inside: 1 getAction; 2 findTests; 3 findSources; 4 installOneFile; 5 processAction
#pragma mark 1 --- getAction
function getAction {			# sourceRoot targetFolder actionString
	sourceRoot="${1}"
	targetFolder="${2}"
	if [[ ! -n "${sourceRoot}" ]] || [[ ! -n "${targetFolder}" ]]; then
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall --getAction  sourceRoot targetFolder [action]"
		return $RC_MissingArgument
	fi
	action="install"
	if [[ -n ${3} ]] ; then
		if [[ "${3}" = "install" ]] || [[ "${3}" = "clean" ]] || [[ "${3}" = "test" ]] ; then
			action="${3}"
		else
			errorMessage $RC_InvalidInput "$0#$LINENO:" "invalid action string ${3}"
			return $RC_InvalidInput
		fi
	fi
	installName=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
	if [[ $action = "install" ]] ; then
		if [[ "${installName}" = "Doxygen" ]] || [[ "${installName}" = "DoxyDemo" ]] ; then
			action="doxygen"
		fi
	fi
	print "${action}"
}

#pragma mark 2 --- findTests
function findTests {
	if [[ -n "${1}" ]] ; then
		testPath="${1}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall findTests testPath"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile=$(mktemp -t ccInstall_tests.$$)
	cd "${testPath}"
	find . -type f -and -name "test*.ksh"| sed 's|\./||' > "${iofile}"
	chmod a+r "${iofile}"
	cd "${origdir}"

	print "${iofile}"
}

# pragma mark 3 --- findSources
function findSources {
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall findSources sourceRoot targetFolder"
		return $RC_MissingArgument
	fi

	origdir=$(pwd)
	iofile=$(mktemp -t ccInstall_sources.$$)
	cd "${sourceRoot}/${targetFolder}"
	st=${?}
	if [[ ${st} > 0 ]] ; then
		cd "${origdir}"
		errorMessage ${st} "$0#$LINENO:" "ccInstall --findSources: could not set directory to ${sourceRoot}/${targetFolder}; ${msg}"
		return ${st}
	fi
	lastbuilt=$(ccInstall --getLastbuilt "${sourceRoot}" "${targetFolder}")
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "ccInstall --getLastbuilt ${sourceRoot} ${targetFolder} failed"
		return ${st}
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

#pragma mark 4 --- installOneFile
function installOneFile {
	missingArgMessage="USAGE: ccInstall --installOneFile action source destination"
	msg=""
	if [[ -n "${1}" ]] ; then
		action="${1}"
		shift
	else
		msg=$(errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgMessage}")
		return $RC_MissingArgument
	fi
	if ! [[ "${action}" = "ignore" ]] ; then
		if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
			sourceForCopy="${1}"
			destinationForCopy="${2}"
		else
			msg=$(errorMessage $RC_MissingArgument "$0#$LINENO:" "${missingArgMessage}")
			return $RC_MissingArgument
		fi
	fi

#	action="${1}"
#	sourceForCopy="${2}"
#	destinationForCopy="${3}"

	case "${action}" in
		"ignore" )
			msg="skipped"
			;;
		"copy" )
			msg1=$(ccInstall --copyFile "${sourceForCopy}" "${destinationForCopy}")
			st=$?
			if [[ ${st} > 0 ]] ; then
				msg=$(errorMessage ${st} "$0#$LINENO:" "error copying ${sourceForCopy} to ${destinationForCopy}: ${msg1}")
			else
				msg="succeeded"
			fi
			;;
		"translateCdoc" )
			msg1=$(ccInstall --translateCdoc "${sourceForCopy}" "${destinationForCopy}")
			st=$?
			if [[ ${st} > 0 ]] ; then
				msg=$(errorMessage ${st} "$0#$LINENO:" "error: ${msg1}")
			else
				msg="succeeded"
			fi
			;;
		* )
			msg=$(errorMessage $RC_InputNotHandled "$0#$LINENO:" "error: Unrecognized action string ${action}")
			return $RC_InputNotHandled
			;;
	esac
	print "${msg}"
	return 0
}

#pragma mark 5 --- processAction
function processAction {
	callbackScript=""
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] && [[ -n "${3}" ]] ; then
		callbackScript="${1}"
		sourceRoot="${2}"
		targetFolder="${3}"
		actionIn="${4}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ccInstall processAction callbackScript sourceRoot targetFolder [action]"
		return $RC_MissingArgument
	fi
	action=$(getAction "${sourceRoot}" "${targetFolder}" ${actionIn})
	st=$?
	if [[ ${st} > 0 ]] ; then
		errorMessage ${st} "$0#$LINENO:" "error: function getAction failed: ${action}"
		return ${st}
	fi

# clean
	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${targetFolder}..."
		msg=$("${callbackScript}" --cleanTarget "${sourceRoot}" "${targetFolder}")
		st=$?
		if [[ ${st} > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error: ${callbackScript} --cleanTarget failed: ${msg}"
			return ${st}
		fi
		print ${msg}
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"
	fi

# doxygen
	if [[ ${action} = "doxygen" ]] ; then
		targetName=$(ccInstall --getTargetName "${sourceRoot}" "${targetFolder}")
		outputDir="${CCDev}/Sites/candcsoft_host/public_html/Doxygen/${targetName}"
		installName="${outputDir##*/}"
		echo "== installing ${installName} documentation [$sourceRoot $targetFolder]"
		mkdir -p "${outputDir}"
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "failed to create output directory $outputDir"
			return ${st}
		fi

	#  Run doxygen on the config file (builds local site)
		doxygenPath="/Applications/Doxygen.app/Contents/Resources/doxygen"
		$doxygenPath "${sourceRoot}/Doxygen/${installName}_doxygen.txt"
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error while generating Doxygen docs"
			return ${st}
		fi

return 0
	# Make docset using the Makefile that just generated
		print $outputDir/html
		make -C $outputDir/html install
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error while creating $workspaceName.docset"
			return ${st}
		fi

	# Copy the docset to the location expected by Xcode
		docsetPath="${HOME}/Library/Developer/Shared/Documentation/DocSets/com.candcsoft.${installName}.docset"
		cp -R $outputDir/html/com.candcsoft.${installName}.docset $docsetPath
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "could not copy docset to $docsetPath"
			return ${st}
		fi

	# Tell Xcode to load the docset
		osascript -e "tell application \"Xcode\" to load documentation set with path \"$docsetPath\""
		st=$?
		if [[ $st > 0 ]] ; then
			errorMessage ${st} "$0#$LINENO:" "error loading $docsetPath into Xcode"
			return ${st}
		fi

	fi

# install
	if [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
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
				msg=$(ccInstall --installOneFile "${action}" "${sourceForCopy}" "${destinationForCopy}")
				st=$?
				if [[ ${st} > 0 ]] ; then
					failcnt="${failcnt}"+1
					msg=$(errorMessage ${st} "$0#$LINENO:" "error: ${action} ${sourceForCopy} : ${msg}")
				fi
				print "${msg}"
#				case "${action}" in
#					"ignore" )
#						print "skipped"
#						;;
#					"copy" )
#						msg=$(ccInstall --copyFile "${sourceForCopy}" "${destinationForCopy}")
#						st=$?
#						if [[ ${st} > 0 ]] ; then
#							failcnt="${failcnt}"+1
#							errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
#						else
#							print "succeeded"
#						fi
#						;;
#					"translateCdoc" )
#						msg=$(ccInstall --translateCdoc "${sourceForCopy}" "${destinationForCopy}")
#						st=$?
#						if [[ ${st} > 0 ]] ; then
#							failcnt="${failcnt}"+1
#							errorMessage ${st} "$0#$LINENO:" "error: ${msg}"
#						else
#							print "succeeded"
#						fi
#						;;
#					* )
#						errorMessage $RC_InputNotHandled "$0#$LINENO:" "error: Unrecognized action string ${action}"
#						;;
#				esac
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
	if [[ ${action} = "test" ]] ; then
		runShunitTests "${sourceRoot}/${targetFolder}"
		st=$?
		if [[ ${st} > 0 ]] ; then
			exit ${st}
		fi
	fi
}

#pragma mark 9 === ccInstall
function ccInstall {
	if [[ $# = 0 ]] ; then
		errorMessage $RC_MissingArgument "$0#$LINENO:" "$0: missing commandFlag"
		return $RC_MissingArgument
	fi

	case "${1}" in
		"--getAction" )
			action=$(getAction "${2}" "${3}" "${4}")	# sourceRoot targetFolder [actionString]
			es=$?
			print "${action}"
			return "${es}"
			;;
		"--get"* )
			logger "$0#$LINENO: command:$1 sourceRoot:$2 targetFolder:$3 #doxygen"
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
		"--installOneFile" )							# action source destination
			msg=$(installOneFile "${2}" "${3}" "${4}")
			es=$?
			print "${msg}"
			return "${es}"
			;;
		"--"* )
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid subcommand $1"	# <invalid arg>
			return $RC_InvalidArgument
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

#!/bin/ksh

#  buildCdoc.ksh
#  Support
#
#  Created by Carol Clark on 12/21/11 from file created 02/23/11.
#  Copyright 2011-12 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
buildCdoc projectName
#	build Cdoc documentation for the specified project
'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

#^ 3 === buildsource functions
#^ lastbuilt
function lastbuilt {
	print "${buildsource.derivedDirectory}.lastbuilt"
}

#^ buildsource_clean
function buildsource_clean {
	msg="$(buildsource_validate)"
	if [[ "$?" > 0 ]] ; then
		print "*** invalid buildsource: $msg"
		return 1
	fi

	print "Clean file $(lastbuilt)?"
	select action in yes no ; do
		case ${action} in
			yes )
				rm "$(lastbuilt)"
				;;
			no )
				print "target not cleaned -- user cancelled"
				;;
		esac
		break
	done
	return 0
}

#^ buildsource_validate
function buildsource_validate {
	srcdir="${buildsource.sourceDirectory}"
	dstdir="${buildsource.destinationDirectory}"
	derived="${buildsource.derivedDirectory}"
	msg=""
	if [[ -n "${srcdir}" ]] ; then
		if [[ -e "${srcdir}" ]] ; then
			if [[ ! -d "${srcdir}" ]] ; then
				msg="specified source directory ${srcdir} exists and is not a directory"
			fi
		else
			msg="source directory ${srcdir} does not exist"
		fi
	else
		msg="source directory undefined"
	fi
	if [[ ! -n "${msg}" ]] ; then
		if [[ -e "${dstdir}" ]] ; then
			if [[ ! -d "${dstdir}" ]] ; then
				msg="specified destination directory ${dstdir} exists and is not a directory"
			fi
		fi
	fi
	if [[ ! -n "${msg}" ]] ; then
		if [[ -e "${derived}" ]] ; then
			if [[ ! -d "${derived}" ]] ; then
				msg="specified derived directory ${derived} exists and is not a directory"
			fi
		fi
	fi
	if [[ -n "${msg}" ]] ; then
		print "${msg}"
		return 1
	fi	
}

#^ buildsource_process
function buildsource_process {
	processFunction="${1?process function not specified}"

	buildsource_validate
	if [[ "$?" > 0 ]] ; then
		print "*** invalid buildsource"
		return 1
	fi
	
	flist="${CCDev}/tmp/flist"
	fs=0
	typeset -i errcnt=0
	cd "${buildsource.sourceDirectory}"
	if [[ -e "$(lastbuilt)" ]] ; then
		find . -path '*/.svn' -prune -o -type f -newer $(lastbuilt) | grep -v '/\.svn$' | grep -v '\.DS_Store$' | grep -v '.build$' | grep -v '_test.ksh$' | sed 's|\./||' > "${flist}"
	else
		find . -path '*/.svn' -prune -o -type f | grep -v '/\.svn$' | grep -v '\.DS_Store$' | grep -v '.build$' | grep -v '_test.ksh$' | sed 's|\./||' > "${flist}"
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
			msg="succeeded"
		else
			errcnt+=1
		fi
		print "${msg}"
	done < "${flist}"

	print $(dirname ${buildsource.sourceDirectory})
	processCustomBuilds ${buildsource.sourceDirectory}
	errcnt+="${fs}"

	if [[ ${errcnt} = 0 ]] ; then
		mkdir -p "${buildsource.derivedDirectory}"
		print $(basename $(lastbuilt)) $(date) > $(lastbuilt)
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

#^ 5 === target functions
#^ installCdoc
function installCdoc {
	item="${1?missing item name}"

	fs=0
	tarname="${item}"										# default filename with relative path
	set -A destinations "${buildsource.destinationDirectory}"	# default destination list			
	if [[ ${item/#_/} != ${item/\/_/} ]] ; then	# if removing initial "_" or any "/_" changes value
#^ 6 custom destinations
		# check for resource folders with custom destinations
		if [[ ${item/#_tech\//} != ${item} ]] ; then
			tarname=${item/#_tech\//}
			set -A destinations "${CCDev}/Sites/TechnicalDocs"
		elif [[ ${item/#_blink\//} != ${item} ]] ; then
			tarname=${item}
			set -A destinations "${CCDev}/Sites/TechnicalDocs/Punkin"
		fi
	fi

	if [[ ${item/.html} = ${item} ]] ; then		# not an .html file
		for (( i=0; i < ${#destinations[*]}; ++i )) ; do
		#	print "copySource ${item} ${destinations[i]}/${tarname}"
			copySource "${item}" "${destinations[i]}/${tarname}"
			fs="${?}"
		done
	else										# html file
		mkdir -p $(dirname ${buildsource.destinationDirectory}/${item})
		translateCdoc "${buildsource.sourceDirectory}/${item}" "${buildsource.destinationDirectory}/${item}"
		if [[ "${?}" > 0 ]] ; then
			print "*** could not translate ${buildsource.sourceDirectory}/${item} to ${buildsource.destinationDirectory}/${item}"
			fs=1
		fi
	fi

	return "${fs}"
}

#^ copySource
function copySource {
	fl="${1?*** copySource: missing filename}"
	dst="${2?*** copySource: missing destination}"
	dstdir="$(dirname ${dst})"
	mkdir -p "${dstdir}"
	if [[ "${?}" > 0 ]] ; then
		print "*** could not create directory ${dstdir}"
		return 1
	fi
	cp "${buildsource.sourceDirectory}/${fl}" "${dstdir}"
	if [[ "${?}" > 0 ]] ; then
		print "*** could not copy ${buildsource.sourceDirectory}/${fl} to ${dstdir}"
		return 1
	fi
}

#^ processCustomBuilds
function processCustomBuilds {
	flist="${CCDev}/tmp/flist"
	fs=0
	cd "${buildsource.sourceDirectory}"
	find . -name "*.build" | sed 's|\./||' > "${flist}"
	if [[ "$?" > 0 ]] ; then
		print "*** could not write custom buildfile list"
		return 1
	fi

	while read fl ; do
		print -n "custom script ${fl}: "
		
		trap '' ERR
		"${buildsource.sourceDirectory}/${fl}" "$(dirname ${buildsource.sourceDirectory})"  "$(lastbuilt)" > "${CCDev}/tmp/errmsg"
		fs="${?}"
		trap "$trapString" ERR
		cat "${CCDev}/tmp/errmsg"

		msg="  script failed"
		if [[ ${fs} = 0 ]] ; then
			msg="  script succeeded"
		fi
		print "${msg}"
	done < "${flist}"
	return "${fs}"
}

#^ translateCdoc
function translateCdoc {
	in="${1}"
	out="${2}"
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
		s|<!-- @useCaseHeader "\([^"][^"]*\)" "\([^"][^"]*\)" "\([1-5]\)" "\([hsupx]\)" -->|<h4><img src="file:///Users/carolclark/CCDev/Sites/TechnicalDocs/img/space.tiff" alt="" /><img src="file:///Users/carolclark/CCDev/Sites/TechnicalDocs/img/ucds_\3.tiff" alt="design scope \3" /><img src="file:///Users/carolclark/CCDev/Sites/TechnicalDocs/img/space.tiff" alt="" /><a name="\2">\1</a><img src="file:///Users/carolclark/CCDev/Sites/TechnicalDocs/img/space.tiff" alt="" /><img src="file:///Users/carolclark/CCDev/Sites/TechnicalDocs/img/ucgl_\4.tiff" alt="goal level \4" /></h4>|
		s|<!-- @CrcCard "\([^"][^"]*\)" -->|<div class="crcholder"><table class="crc" border="0" cellspacing="0" cellpadding="5" width="100%"><caption></caption><tr><th colspan="2">\1</th> </tr>|
		s|<!-- @/CrcCard -->|</table></div>|
	' <"$in" >"$out"
	if [[ "${?}" > 0 ]] ; then
		print "\n*** attempt to generate output file ${out} failed"
		return 1
	fi
	# check for untranslated tokens
	x=$(sed -n 's|<!-- @|&|p' <"$out")
	if [[ -n "${x}" ]] ; then
		print "\n***unrecognized translator token(s):"
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

#^	8 === main
project=${1:?"usage: buildCdoc projectName"}
action=${2:-all}

# Builds $project/Cdoc at ~/CCDev/Sites/TechnicalDocs/$project
buildsource_Cdoc=(sourceDirectory="${DEV}/${project}/Cdoc" destinationDirectory="${CCDev}/Sites/TechnicalDocs/${project}" derivedDirectory="${CCDev}/build/${project}/Cdoc" subtarget="")

st=0
nameref buildsource=buildsource_Cdoc	
buildsource_process installCdoc
st="$?"
exit ${st}

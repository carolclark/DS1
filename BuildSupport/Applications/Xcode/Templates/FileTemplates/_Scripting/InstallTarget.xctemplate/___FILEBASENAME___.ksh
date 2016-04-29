#!/bin/ksh

#  ___FILENAME___.ksh
#  <#PathFromDev#>/___PROJECTNAME___
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.

USAGE='
<#Target#>_install.ksh -- install <#Target#> scripts
#	<#Target#>_install.ksh		sourceRoot targetFolder action
'

#^ 1 === top
CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/ccInstall"

<#xxFolder#>="${CCDev}/<##>"

#^ 8 === main
	sourceRoot=""
	targetFolder=""
	if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
		sourceRoot="${1}"
		targetFolder="${2}"
	else
		errorMessage $RC_MissingArgument "$0#$LINENO:" "USAGE: ${targetFolder}_install.ksh sourceRoot targetFolder [action]"
		return $RC_MissingArgument
	fi
	action=${3:-"install"}

# clean
	if [[ ${action} = "clean" ]] ; then
		print "== cleaning ${sourceRoot##*/}/${targetFolder}..."
		for folder in "${<#folder ...#>}" ; do
			msg=$(ccInstall --removeFolder "${folder}")
			st=${?}
			if [[ ${st} > 0 ]] ; then
				errorMessage ${st} "$0#$LINENO:" "error: cleanTarget failed: ${msg}"
				return ${st}
			fi
		done
		ccInstall --clearLastbuilt "${sourceRoot}" "${targetFolder}"

# install
	elif [[ ${action} = "install" ]] ; then
		print "== installing ${sourceRoot##*/}/${targetFolder}..."
		iofile=$(ccInstall --findSources "${sourceRoot}" "${targetFolder}")
		typeset -i failcnt=0
		previousSubtarget=""
		while read fl ; do
			subtarget="${fl%%/*}"
			filepath="${fl#*/}"
			if [[ ! "${previousSubtarget}" = "${subtarget}" ]] ; then
				subtargetDestination=""
				case "${subtarget}" in
					"<#subtarget#>" )
						subtargetDestination="${<#folder#>}"
						;;
					"<#...#>" )
						;;
					* )
						failcnt="${failcnt}"+1
						errorMessage $RC_InputNotHandled "$0#$LINENO:" "source folder ${sourceRoot}/${targetFolder}/${subtarget} not handled"
						;;
				esac
				if [[ -n "${subtargetDestination}" ]] ; then
					print "=${sourceRoot##*/}/${targetFolder}/${subtarget}:"
					previousSubtarget="${subtarget}"
				fi
			fi
			print -n "${filepath}: "
			if [[ -n "${subtargetDestination}" ]] ; then
				srcname="${filepath}"
				destname="${srcname}"
				fileAction="copy"
				fullSourcePath="${sourceRoot}/${targetFolder}/${subtarget}/${filepath}"
				fullDestinationPath="${subtargetDestination}/${destname}"
			else
				fileAction="ignore"
			fi
			msg=$(ccInstall --installOneFile "${fileAction}" "${fullSourcePath}" "${fullDestinationPath}")
			st=$?
			if [[ ${st} > 0 ]] ; then
				failcnt="${failcnt}"+1
				msg=$(errorMessage ${st} "$0#$LINENO:" "error: ${msg}")
			fi
			print "${msg}"
		done < "${iofile}"
		if [[ ${failcnt} = 0 ]] ; then
			ccInstall --updateLastbuilt "${sourceRoot}" "${targetFolder}"
			print "build succeeded"
		else
			pl="s"
			if [[ ${failcnt} = 1 ]] ; then
				pl=""
			fi
			errorMessage 1 "$0#$LINENO:" "error: Build Failed: ${errcnt} error${pl} encountered"
			exit "${failcnt}"
		fi

# invalid action
	else
		errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid action ${action}"
	fi

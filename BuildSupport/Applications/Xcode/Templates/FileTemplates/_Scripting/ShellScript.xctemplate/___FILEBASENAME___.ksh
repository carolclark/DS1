#!/bin/ksh

#  ___FILENAME___
#  <#Repository#>/___PROJECTNAME___
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.

NAME='
# ___FILENAME___ -- <#brief#>
'
USAGE='
___FILEBASENAME___ -- <#parameters#>
#	<#additional information#>
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

CCDev="${HOME}/Library/CCDev"
. "${CCDev}/bin/errcc"

#pragma mark 0 === Top
#pragma mark === Markers ===

<#body#>

#pragma mark 8 === ___FILEBASENAME___
function ___FILEBASENAME___ {
	if [[ $# = 0 ]] ; then
		errorMessage $RC_MissingArgument "$0#$LINENO:" "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--help" )
			print "${HELP}"
			;;
		"--"* )
			errorMessage $RC_InvalidArgument "$0#$LINENO:" "invalid subcommand $1"	# <invalid arg>
			return $RC_InvalidArgument
			;;
		* )
			;;
	esac
	return 0
}

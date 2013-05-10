#!/bin/ksh

#  ___FILENAME___
#  <#Project#>
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
#  Confidential and Proprietary.

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

. resultCodes.ksh"

#pragma mark 0 === Top

<#body#>

#pragma mark 8 === ___FILEBASENAME___
function ___FILEBASENAME___ {
	if [[ $# = 0 ]] ; then
		print "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--help" )
			print "${HELP}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			;;
	esac
	return 0
}

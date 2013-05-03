#!/bin/ksh

#  ___FILENAME___
#  <#Project#>
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# ___FILENAME___ -- <#brief#>
'

#^ 1 === top
trap 'echo "$(basename $0)#$LINENO: Command exited with status $?." 1>&2' ERR

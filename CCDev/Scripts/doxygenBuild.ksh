#!/bin/ksh

#  doxygenBuild.ksh
#  <#Project#>
#
#  Created by Carol Clark on 12/20/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# doxygenBuild.ksh -- <#brief#>
'

#^ 1 === top
trapString='errtrap $0 $LINENO'
trap "$trapString" ERR

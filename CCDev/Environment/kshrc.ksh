#!/bin/ksh

#  kshrc.ksh
#  Support
#
#  Created by Carol Clark on 10/19/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE='
# .kshrc -- user configuration file for Korn (ksh) shell
'

export PS1="$LOGNAME ! $ "
CCDev="$HOME/CCDev"; export CCDev
PATH="$PATH:$CCDev/bin:$CCDev/func"; export PATH
FPATH="$CCDev/func"; export FPATH
SHUnit="$CCDev/shunit/src/shunit2"; export SHUnit

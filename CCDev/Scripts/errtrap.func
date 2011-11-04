#! /bin/ksh

#  errtrap.func
#  Support
#
#  Created by Carol Clark on 10/19/11.
#  Copyright 2011 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

USAGE="errtrap -- error trap function for use by shell scripts"

function errtrap {
	es=$?
	print "$1#$2: Command exited with status $es."
}

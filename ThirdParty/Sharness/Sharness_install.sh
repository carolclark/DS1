#! /bin/bash
#  Sharness_install.sh

# Created by Carol Clark on 9/27/16 for project Sharness.
# Copyright (c) 2016 by C & C Software, Inc. All rights reserved.

USAGE='
Sharness_install.ksh -- install Sharness shell testing system
#	custom script to install Sharness
'

main() {
	mkdir -p "/Users/carolclark/Library/CCDev/bin/Sharness"

	cp "/Users/carolclark/Dev/Support/ThirdParty/Downloaded/Sharness_/Sharness_1.0.1/sharness.sh" "/Users/carolclark/Library/CCDev/bin/Sharness"
	chmod a+x "/Users/carolclark/Library/CCDev/bin/Sharness/Sharness.sh"
	cp "/Users/carolclark/Dev/Support/ThirdParty/Downloaded/Sharness_/Sharness_1.0.1/aggregate-results.sh" "/Users/carolclark/Library/CCDev/bin/Sharness"
	chmod a+x "/Users/carolclark/Library/CCDev/bin/Sharness/aggregate-results.sh"

	if [[ $(echo ":$PATH:" | grep "CCDev/bin/Sharness") = "" ]] ; then
		PATH="$PATH:$HOME/Library/CCDev/bin/Sharness:"
	fi

}

main "$@"

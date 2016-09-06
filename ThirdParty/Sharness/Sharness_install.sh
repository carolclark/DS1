#! /bin/bash
#  Sharness_install.sh

# Created by Carol Clark on 9/5/16 for project Sharness.
# Copyright (c) 2016 by C & C Software, Inc. All rights reserved.


# $1 - source directory
# $2 - output directory
# $3 - [action]
main() {
	local argcount=$#
	logger "$0#$LINENO: args in: ${1} ${2} ${3}; argcount: ${argcount} #args"
	local source_dir=$(pwd)
	local target_name=$1; shift
	local output_dir=$1; shift
	local action
	[[ "z${1}" = "z" ]] && action="install" || action="${1}"
	shift
	logger "$0#$LINENO: args: source_dir: ${source_dir}; target_name: ${target_name}; output_dir: ${output_dir}; action: ${action} #args"
}

main $1 $2 $3

#! /usr/local/bin/python3

#  ___FILENAME___
#  <#ProjectPathFromDev#>/___PROJECTNAME___
#
#  Created by ___FULLUSERNAME___ on ___DATE___.
#  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.

import sys
import logging
import argparse
import util

loglevel=logging.WARNING
logging.basicConfig (format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package <#module#>			<#description#>
#

##	process argments for <#module#> commands
#
#	function is separate to allow direct testing
def parse_<#module#>_args(cmdlist=None):

	# create <#module#> parser
	parser = argparse.ArgumentParser (description="<#desc#>")
	subparsers = parser.add_subparsers (help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create <#firstCmd#> parser
	parser_<#abbrev#> = subparsers.add_parser ('<#fullname#>', aliases=['<#abbrev#> '], help="<#firstCmd help#>")
	parser_<#abbrev#>.add_argument ("<#argName#>", help="<#argname help#>")

	args = util.parse_cmdlist (parser, cmdlist)
	return args


##	process command-line input and dispatch to selected function
#
def main (cmdlist=None):

	args = parse_<#module#>_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == '<#firstCmd#>' or args.cmd == '<#abbrev#>':
		<#doSomething#>


if __name__ == '__main__':
	print (main(sys.argv[1:]))

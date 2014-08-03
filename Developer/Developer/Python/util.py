#! /usr/local/bin/python3

#  util.py
#  Support/Developer
#
#  Created by Carol Clark on 7/12/14.
#  Copyright (c) 2014 C & C Software, Inc. All rights reserved.

import sys
import argparse
import logging
import os
import stat
from io import StringIO

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


def remove_folder_at_home_path(folder, parent=None, dry_run=None):
	""" test: removes <folder> and its contents from inside directory ~/

	if supplied, parent must begin with ~/; default: ~/Library
		intended to protect against unintended deletion
	"""

	try:
		targetPath = path_to_remove(folder, parent)
	except:
		raise

	is_dry_run = False
	if dry_run and dry_run == 'DRY_RUN':
		is_dry_run = True
	dry_run = True		# ***

	remove_items = 0
	if (targetPath):
		info = StringIO()
		info.write('=== {}:\n'.format(targetPath))

		if dry_run:
			info.write("This command would:\n")
		else:
			info.write("Actions taken:\n")
		for root, dirs, files in os.walk(targetPath, topdown=False):
			for name in files:
				fullname = os.path.join(root, name)
				st = os.stat(fullname)
				if not (st.st_mode & stat.S_IWRITE):
					if dry_run:
						info.write('make writable: {}\n'.format(fullname))
				if dry_run:
					info.write('remove file {}\n'.format(fullname))
					remove_items += 1
			for name in dirs:
				fullname = os.path.join(root, name)
				st = os.stat(fullname)
				if not (st.st_mode & stat.S_IWRITE):
					if dry_run:
						info.write('make writable: {}\n'.format(fullname))
				if dry_run:
					info.write('remove directory {}\n'.format(fullname))
					remove_items += 1
		if dry_run:
			info.write('remove target directory {}\n'.format(targetPath))
			remove_items += 1
		output = info.getvalue()
	else:
		output = "Folder '" + folder + "' not present; no action taken."
	return {'output':output, 'remove_items':remove_items}


def path_to_remove(folder, parent=None):
	""" constructs and verifies path to the folder to be removed by remove_folder_at_home_path

		returns path to folder to be removed
		returns None if path does not exist (folder may already have been removed)
		raises SyntaxError if parent not in directory ~/, IOError if <folder> is not a directory
	"""

	# calculate target path
	#	verify: parent is in directory '~'; targetPath is not parent
	home = os.path.expanduser("~")
	if parent:
		if parent.startswith('~/'):
			parent = os.path.expanduser(parent)
		else:
			raise SyntaxError("parent '{}' not a folder in home directory".format(parent))
	else:
		parent = home + '/Library'
	targetPath = parent + '/' + folder
	if targetPath == parent + '/':
		raise SyntaxError("subfolder not specified")

	# return None if targetPath does not exist
	# raise SyntaxError if targetPath exists but is not a directory
	if os.path.exists(targetPath):
		if not os.path.isdir(targetPath):
			raise IOError("path '{}' is not a directory".format(targetPath))
	else:
		return None

	# catch some disasters that should be impossible
	if targetPath == parent + '/':
		logging.error('no subfolder present in folder to remove: {}'.format(targetPath))
		raise SyntaxError("subfolder not specified")
	if not targetPath.startswith(home):
		logging.error("path '{}' not in home directory".format(targetPath))
		raise SyntaxError("target folder not in home directory")

	return targetPath


def parse_cmdlist(parser, cmdlist=None):
	""" parse 'cmdlist' with 'parser', generating exception if unsuccessful

		on help request: returns False; request already handled by parser
		else on success: return successfully parsed args
		on error: raise SyntaxError with appropriate message
	"""

	try:
		if cmdlist:
			try:
				args = parser.parse_args(cmdlist)
			except:
				if ('-h' in cmdlist or '--help' in cmdlist):
					return False	# may cause 'None' to be printed after help
				raise SyntaxError("parsing failed: {}".format(cmdlist))
		else:
			raise SyntaxError("missing argument list")
	except:
		raise SyntaxError("invalid command list '{}'".format(cmdlist))
	return args


def parse_utility_args(cmdlist=None):
	""" process argments for util commands

		function is separate in order to allow direct testing
	"""

	# create utility parser
	parser = argparse.ArgumentParser(description="general utility functions")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create parse_cmdlist parser
	parser_ps = subparsers.add_parser('parse_cmdlist', aliases=['ps'], help="parses command list <cmdlist> with parser <parser>")
	parser_ps.add_argument("parser", help="parser to use")

	# create remove_folder parser
	parser_rf = subparsers.add_parser('remove_folder', aliases=['rf'], help="removes a folder and its contents from inside ${HOME}/Library")
	parser_rf.add_argument("folder", help="folder to remove")
	parser_rf.add_argument("--parent", '-p', nargs=1, help="parent folder ~/<path>; default: ~/Library")
	parser_rf.add_argument("--dry-run", '-d', action='store_const', const='DRY_RUN', help="take no action, but report what the command would do")

	# parse the command list
	args = parse_cmdlist(parser, cmdlist)
	return args


def main(cmdlist=None):
	""" process command-line input and dispatch to selected function """

	args = parse_utility_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'parse_cmdlist' or args.cmd == 'ps':
		raise SyntaxError("parse_cmdlist not supported from command line")
	if args.cmd == 'remove_folder' or args.cmd == 'rf':
		parent = None
		if args.parent:
			parent = args.parent[0]
		result = remove_folder_at_home_path(args.folder, parent, args.dry_run)
		return result['output'] + '\n(remove_items: ' + str(result['remove_items']) + ')'


if __name__ == '__main__':
	print (main(sys.argv[1:]))

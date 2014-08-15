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
import re

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


def remove_folder_at_home_path(folder, parent=None, dry_run=False):
	""" test: removes <folder> and its contents from inside directory ~/

		if supplied, parent must begin with ~/; default: ~/Library
			intended to protect against unintended deletion
	"""

	try:
		targetPath = path_to_remove(folder, parent)
	except:
		raise

	return do_remove_folder_with_contents(targetPath, dry_run)


def path_to_remove(folder, parent=None):
	""" constructs and verifies path to the folder to be removed by remove_folder_at_home_path

		returns path to folder to be removed
		returns None if path does not exist (folder may already have been removed)
		raises SyntaxError if parent not in directory ~/, IOError if <folder> is not a directory
	"""

	if folder == None:
		raise SyntaxError("subfolder not specified")

	# calculate target path
	#	verify: parent is in directory '~'; targetPath is not parent
	home = os.path.expanduser("~")
	if parent:
		tempParent = os.path.expanduser(parent)
		if tempParent.startswith(home):
			parent = tempParent
		else:
			raise SyntaxError("parent '{}' not a folder in home directory".format(parent))
	else:
		parent = os.path.join(home, 'Library')
	targetPath = os.path.join(parent, folder)

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


def scan_directories(path):
	""" recursively lists all directories and files inside <path>

		list order is inside-out, as needed for removing files
	"""

	import glob
	itemlist = StringIO()
	for currentItem in glob.glob( os.path.join(path, '*') ):
		if os.path.isdir(currentItem):
			itemlist.write(scan_directories(currentItem))
		itemlist.write(currentItem + ',')
	return itemlist.getvalue()


def do_remove_folder_with_contents(targetPath, dry_run=False):
	""" removes the specified folder and its contents

	adjusts write permissions if necessary
	returns ( output, remove_count ), where remove_count is count of items removed
	"""

	is_dry_run = False
	if dry_run and dry_run == 'DRY_RUN':
		is_dry_run = True

	remove_count = 0
	if (targetPath):
		info = StringIO()
		info.write('=== {}:\n'.format(targetPath))

		if is_dry_run:
			info.write("This command would:\n")
		else:
			info.write("Actions taken:\n")

		itemlist = scan_directories (targetPath)
		for item in re.split(',', itemlist):
			if item != '':
				out, count = do_remove_fs_item(item, dry_run)
				info.write(out)
				remove_count += count
		import time
		time.sleep(.5)		# could attempt to remove directory come before deletions of files have been noticed?
		if os.path.isdir(targetPath):
			if not is_dry_run:
				os.rmdir(targetPath)
			info.write('remove target directory {}\n'.format(targetPath))
			remove_count += 1
		output = info.getvalue()
	else:
		output = "targetPath not present; no action taken."
	return (output, remove_count)


def do_remove_fs_item(path, dry_run=False):
	""" remove file or empty directory from file system

		adjusts write permissions if necessary
	"""

	remove_count = 0
	info = StringIO()
	perform_action = not dry_run
	if os.path.isdir(path):
		if perform_action:
			os.rmdir(path)
		info.write('remove directory {}\n'.format(path))
		remove_count += 1
	elif os.path.exists(path):
		if perform_action:
			os.remove(path)
		info.write('remove file {}\n'.format(path))
		remove_count += 1
	else:
		info.write('item {} does not exist\n'.format(path))
	return(info.getvalue(), remove_count)


def ensure_directory(path, dry_run=False):
	""" ensure directory at <path> exists

		uses permissions rw all for any folders created
		no action if regular file is at <path>
	"""

	info = StringIO()
	perform_action = not dry_run
	if not os.path.exists(path):
		if perform_action:
			os.makedirs(path)
		info.write('directory {} created\n'.format(path))
	return info.getvalue()


def make_small_textfile(folder, filename):
	""" make textfile containing its name; useful for testing """

	textfile = os.path.join(folder, filename)
	f = open(textfile, 'w')
	f.write(filename)
	f.close()


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
		output, remove_count = remove_folder_at_home_path(args.folder, parent, args.dry_run)
		return output + '\n(remove_count: ' + str(remove_count) + ')'


if __name__ == '__main__':
	print (main(sys.argv[1:]))

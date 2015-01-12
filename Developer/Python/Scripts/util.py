#! /usr/local/bin/python3

#  util.py
#  Support/Developer
#
#  Created by Carol Clark on 7/12/14.
#  Copyright (c) 2014-15 C & C Software, Inc. All rights reserved.

import sys
import argparse
import logging
import os
import stat
from io import StringIO
import re

loglevel=logging.WARNING
logging.basicConfig(format='%(asctime)s %(filename)s:%(funcName)s#%(lineno)d - %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S', level=loglevel)


## @package util			utility functions
#


##	removes &lt;folder&gt; and its contents from inside directory ~/
#
#	@param	folder	folder to be removed; must be in user's home folder
#	@param	parent	immediate parent directory of &lt;folder&gt;;
#					optional - default: ~/Library; if supplied, must begin with ~/
#						intended to protect against unintended deletion
#	@param	dry_run	take no action, but report what the command would do
#	@return	( command output, count ) where count is count of files removed
#	@sa		uses path_to_my_folder()
def remove_my_folder (folder, parent=None, dry_run=False):

	try:
		targetPath = path_to_my_folder(folder, parent)
	except:
		raise

	return do_remove_folder_with_contents(targetPath, dry_run)


##	constructs and verifies path to a folder in User's home directory
#
#	@param	folder	folder in user's home folder
#	@param	parent	immediate parent directory of &lt;folder&gt;;
#					optional - default: ~/Library; if supplied, must begin with ~/
#	@return			path to folder specified
#					returns None if path does not exist
#	@exception		SyntaxError if parent not in directory ~/
#	@exception		IOError if &lt;folder&gt; is not a directory
#	@sa				used by remove_my_folder()
def path_to_my_folder (folder, parent=None):

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
		logging.error('no subfolder present for specified folder: {}'.format(targetPath))
		raise SyntaxError("subfolder not specified")
	if not targetPath.startswith(home):
		logging.error("path '{}' not in home directory".format(targetPath))
		raise SyntaxError("target folder not in home directory")

	return targetPath


##	recursively lists all directories and files inside &lt;path&gt;
#
#	@param		path to folder to be scanned
#	@return		string containing list of directories and files
#				list order is inside-out, as needed for removing files
def scan_directories (path):

	import glob
	itemlist = StringIO()
	for currentItem in glob.glob( os.path.join(path, '*') ):	# visible files
		if os.path.isdir(currentItem):
			itemlist.write(scan_directories (currentItem))
		itemlist.write(currentItem + ',')
	for currentItem in glob.glob( os.path.join(path, '.*') ):	# invisible files
		if os.path.isdir(currentItem):
			itemlist.write(scan_directories (currentItem))
		itemlist.write(currentItem + ',')
	return itemlist.getvalue()


##	unconditionally removes the specified folder and its contents
#
#	adjusts write permissions if necessary
#	@param		targetPath	path to folder to be removed
#	@param		dry_run		take no action, but report what the command would do
#	@return 	( output, remove_count ), where remove_count is count of items removed
def do_remove_folder_with_contents (targetPath, dry_run=False):

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


##	remove file or empty directory from file system
#
#	adjusts write permissions if necessary
#	@param		path		path to file or empty folder to be removed
#	@param		dry_run		take no action, but report what the command would do
def do_remove_fs_item (path, dry_run=False):

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


##	ensure directory at &lt;path&gt; exists
#
#	uses permissions rw all for any folders created
#	takes no action if regular file is at &lt;path&gt;
#	@param		path		path to file or empty folder to be tested
#	@param		dry_run		take no action, but report what the command would do
#	@return		command output
def ensure_directory (path, dry_run=False):

	info = StringIO()
	perform_action = not dry_run
	if not os.path.exists(path):
		if perform_action:
			os.makedirs(path)
		info.write('directory {} created\n'.format(path))
	return info.getvalue()


##	make textfile containing its name
#
#	useful for testing
def make_small_textfile (folder, filename):

	textfile = os.path.join(folder, filename)
	f = open(textfile, 'w')
	f.write(filename)
	f.close()


##	wrapper for ArgumentParser that throws appropriate exception if unsuccessful
#
#	@param		parser		ArgumentParser for the command to be parsed
#	@param		cmdlist		list of string argumants to parse
#	@return		successfully parsed args, or False for help request already handled by parser
#
#	@exception	SyntaxError with appropriate message if parsing fails
def parse_cmdlist (parser, cmdlist=None):

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


##	process argments for util commands
#
#	function is separate in order to allow direct testing
#	@param	cmdlist		command name followed by list of other arguments
def parse_utility_args (cmdlist=None):

	# create utility parser
	parser = argparse.ArgumentParser(description="general utility functions")
	subparsers = parser.add_subparsers(help="subcommand info - <subcommand> --help for details", dest='cmd')

	# create parse_cmdlist parser
	parser_ps = subparsers.add_parser('parse_cmdlist', aliases=['ps'], help="parses command list <cmdlist> with parser <parser>")
	parser_ps.add_argument("parser", help="parser to use")

	# create remove_my_folder parser
	parser_rf = subparsers.add_parser('remove_my_folder', aliases=['rf'], help="removes a folder and its contents from inside ${HOME}/Library")
	parser_rf.add_argument("folder", help="folder to remove")
	parser_rf.add_argument("--parent", '-p', nargs=1, help="parent folder ~/<path>; default: ~/Library")
	parser_rf.add_argument("--dry-run", '-d', action='store_const', const='DRY_RUN', help="take no action, but report what the command would do")

	# parse the command list
	args = parse_cmdlist(parser, cmdlist)
	return args


##	process command-line input and dispatch to selected function
#
def main (cmdlist=None):

	args = parse_utility_args(cmdlist)
	if not args:		# help request
		return

	if args.cmd == 'parse_cmdlist' or args.cmd == 'ps':
		raise SyntaxError("parse_cmdlist not supported from command line")
	if args.cmd == 'remove_my_folder' or args.cmd == 'rf':
		parent = None
		if args.parent:
			parent = args.parent[0]
		output, remove_count = remove_my_folder(args.folder, parent, args.dry_run)
		return output + '\n(remove_count: ' + str(remove_count) + ')'


##	entry point for command-line call
#
if __name__ == '__main__':
	print (main(sys.argv[1:]))

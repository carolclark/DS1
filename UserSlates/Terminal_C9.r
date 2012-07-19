// =================================================================================
//	Terminal_C9.r				©2008-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

// Git reserved to resid_TermGit+49
#define resid_termGitBrowser	resid_TermGit+1
#define	resid_gitDiff			resid_termGit+2
#define	resid_gitLog			resid_termGit+3
#define	resid_gitStash			resid_termGit+4
#define	resid_gitBranch			resid_termGit+5
#define	resid_gitTag			resid_termGit+6
#define	resid_gitUndo			resid_termGit+7
#define resid_gitCommit			resid_termGit+8

#define	resid_termGitAdd		resid_termGit+20

resource restype_Slate (resid_termType, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "execute", "" },	_return,
		Event { "return	", "" },	_return,
		Event { "password", "" },	TypeText { "6868" },
		Event { "cancel", "" },		_cancel,
		Event { "quiver", "" },		Keypress { kc_Q, 0 },
		Event { "copy", "" },		Keypress { kc_C, mf_command },
		Event { "paste", "" },		Keypress { kc_V, mf_command },
	} }
} };

#pragma mark Git
resource restype_Slate (resid_gitDiff, "") { {
	Slate { "diff",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "unstaged", "" },		NilAction{},
		Event { "staged", "" },			TypeText { "--cached " },
		Event { "all", "" },			TypeText { "HEAD " },
		Event { "path", "" },			TypeText { "HEAD -- ./" },
		Event { "master", "" },			TypeText { "master " },
		Event { "abbreviate", "" },		TypeText { "--name-status " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
	} }
} };

resource restype_Slate (resid_gitLog, "") { {
	Slate { "log",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "master", "" },			TypeText { "master " },
		Event { "abbreviate,", "" },	TypeText { "--oneline " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
	} }
} };

resource restype_Slate (resid_gitStash, "") { {
	Slate { "stash",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "save", "" },			Sequence{}, _cancel, TypeText { "# git stash save <message>" }, _return, TypeText { "git stash save " }, ResSubslate { resid_termType }, endSequence{},
		Event { "keep index", "" },		TypeText { "--keep-index " },
		Event { "show", "" },			TypeText { "show " },
		Event { "pop", "" },			TypeText { "pop " },
		Event { "apply", "" },			Sequence{}, TypeText { "apply " }, ResSubslate { resid_termType }, endSequence{},
		Event { "branch", "" },			TypeText { "branch " },
		Event { "previous", "" },		Sequence{}, TypeText { "stash@{" }, ResSubslate { resid_termType }, endSequence{},
		Event { "abbreviate", "" },		TypeText { "--name-status " },
		Event { "list", "" },			TypeText { "list " },
		Event { "clear", "" },			TypeText { "clear " },
	} }
} };

resource restype_Slate (resid_gitBranch, "") { {
	Slate { "branch",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		ExitEvent { "list", "" },		_return,
		ExitEvent { "list all", "" },		Sequence{}, TypeText { "-a " }, _return, endSequence{},
		ExitEvent { "unmerged", "" },		Sequence{}, TypeText { "--no-merged " }, _return, endSequence{},
		Event { "rename", "" },			Sequence{}, TypeText { "-m " }, ResSubslate { resid_termType }, endSequence{},
		Event { "delete", "" },			Sequence{}, TypeText { "-d " }, ResSubslate { resid_termType }, endSequence{},
		Event { "checkout", "" },		Sequence{}, _cancel, TypeText { "git checkout -b " }, ResSubslate { resid_termType }, endSequence{}
	} }
} };

resource restype_Slate (resid_gitTag, "") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		ExitEvent { "list", "" },		_return,
		ExitEvent { "push", "" },		Sequence{}, _cancel, TypeText { "git push --tags" }, endSequence{},
		ExitEvent { "push remote", "known to work if cd is PunkinMain" }, Sequence{}, _cancel, TypeText { "git push --tags /Volumes/carollclark/gitrep/PunkinRemote" }, endSequence{},
		Event { "make", "" },			Sequence{}, _cancel, TypeText { "# git tag -a 'tagname' -m \"message\"" }, _return, TypeText { "git tag -a "}, ResSubslate { resid_termType }, endSequence{},
		Event { "delete", "" },			Sequence{}, TypeText { "-d " }, ResSubslate { resid_termType }, endSequence{},
		Event { "show", "" },			Sequence{}, _cancel, TypeText { "git show --name-status " }, ResSubslate { resid_termType }, endSequence{}, 
	} }
} };

resource restype_Slate (resid_gitUndo, "") { {
	Slate { "undo",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "file", "" },		Subslate { "file" },
			_TerminalStandards_,
			Event { "to index", "" },	Sequence{}, TypeText { "git checkout -- " }, ResSubslate { resid_termType }, endSequence{}, 
			Event { "to head", "" },	Sequence{}, TypeText { "git checkout HEAD " }, ResSubslate { resid_termType }, endSequence{}, 
			endSubslate{},
		Event { "working copy", "" },	Subslate { "working copy" },
			_TerminalStandards_,
			Event { "reset hard", "" },	Sequence{}, TypeText { "git reset --hard HEAD " }, ResSubslate { resid_termType }, endSequence{}, 
			Event { "file", "" },		Sequence{}, TypeText { "git checkout -- " }, ResSubslate { resid_termType }, endSequence{}, 
			Event { "revert last commit", "" },		Sequence{}, TypeText { "git revert HEAD " }, ResSubslate { resid_termType }, endSequence{}, 
			endSubslate{},
		Event { "unstage", "" },		TypeText { "git rm --cached " },
	} }
} };

resource restype_Slate (resid_gitCommit, "") { {
	Slate { "commit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		Event { "message", "" },		Sequence{}, TypeText { "-m \"" }, endSequence{},
		Event { "file", "" },			Sequence{}, TypeText { "-F \"${CCDev}/tmp/gitmessage" }, Keypress { kc_quote, mf_shift }, endSequence{},
	} }
} };

resource restype_Slate (resid_termGit, "") { {
	Slate { "Git",	{
		_TerminalStandards_,
		Event { "go back", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "workspace", "" },		Subslate { "workspace" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },		Sequence{}, TypeText { "cd ${DEV}/Support" }, _return, endSequence{},
			ExitEvent { "Punkin", "" },			Sequence{}, TypeText { "cd ${DEV}/Punkin" }, _return, endSequence{},
			ExitEvent { "Carbon", "" },			Sequence{}, TypeText { "cd ${DEV}/AccessorC9" }, _return, endSequence{},
			ExitEvent { "Accessor", "" },		Sequence{}, TypeText { "cd ${DEV}/Accessor" }, _return, endSequence{},
			endSubslate{},
		Event { "repository", "" },		Subslate { "repository" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },	Sequence{}, TypeText { "cd ${DEV}/gitrep/SupportMain" }, _return, endSequence{},
			ExitEvent { "Punkin", "" },		Sequence{}, TypeText { "cd git-CCSoftware@pl5.projectlocker.com:Punkin.git" }, _return, endSequence{},
			ExitEvent { "Carbon", "" },		Sequence{}, TypeText { "cd ${DEV}/gitrep/AccessorC9Main" }, _return,	 endSequence{},
			ExitEvent { "Accessor", "" },	Sequence{}, TypeText { "cd ${DEV}/gitrep/AccessorMain" }, _return,	 endSequence{},
			endSubslate{},
		Event { "project locker", "" },	TypeText { "ssh git-CCSoftware@pl5.projectlocker.com" },
		Event { "shell", "" },			TypeText { "sealsea v3ejc 6868" },
		Event { "version 3", "" },		TypeText { "4YZHqz5pq1" },
		Event { "directory", "" },		Sequence{}, TypeText { "pwd" }, _return, endSequence{},
		Event { "browser", "" },		Sequence{}, TypeText { "gitk" }, _return, ResSubslate { resid_termGitBrowser }, endSequence{},
		Event { "status", "" },			Sequence{}, TypeText { "git status" }, _return, endSequence{},
		Event { "branch", "" },			Sequence{}, TypeText { "git branch " }, ResSubslate { resid_gitBranch }, endSequence{},
		Event { "tag", "" },			Sequence{}, TypeText { "git tag " }, ResSubslate { resid_gitTag }, endSequence{},
		Event { "undo", "" },			ResSubslate { resid_gitUndo },
		Event { "difference", "" },		Sequence{}, TypeText { "git diff " }, ResSubslate { resid_gitDiff }, endSequence{},
		Event { "log", "" },			Sequence{}, TypeText { "git log " }, ResSubslate { resid_gitLog }, endSequence{},
		Event { "stash away", "" },		Sequence{}, TypeText { "git stash " }, ResSubslate { resid_gitStash }, endSequence{},
		Event { "add files", "" },		Sequence{}, TypeText { "git add --all --interactive" }, _return, ResSubslate { resid_termGitAdd }, endSequence{},
		Event { "commit", "" },			Sequence{}, TypeText { "git commit " }, ResSubslate { resid_gitCommit }, endSequence{},
	} }
} };

resource restype_Slate (resid_termGitAdd, "") { {
	Slate { "add -i",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_NumberKeys_,
		_ReturnKey_,
		Event { "minus sign", "" },	Keypress { kc_minus, 0 },
		Event { "return", "" },		_return,
		Event { "status", "" },		Sequence{}, Keypress { kc_S, 0 }, _return, endSequence{},
		Event { "update", "" },		Sequence{}, Keypress { kc_U, 0 }, _return, endSequence{},
		Event { "revert", "" },		Sequence{}, Keypress { kc_R, 0 }, _return, endSequence{},
		Event { "add", "" },		Sequence{}, Keypress { kc_A, 0 }, _return, endSequence{},
		Event { "patch", "" },		Sequence{}, Keypress { kc_P, 0 }, _return, endSequence{},
		Event { "diff", "" },		Sequence{}, Keypress { kc_D, 0 }, _return, endSequence{},
		ExitEvent { "quit", "" },	Sequence{}, Keypress { kc_Q, 0 }, _return, endSequence{},
		Event { "help", "" },		Sequence{}, Keypress { kc_H, 0 }, _return, endSequence{},
	} }
} };

resource restype_Slate (resid_termGitBrowser, "") { {
	Slate { "gitk",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlate_,
		Event { "activate", "" },	Click { 1, 0, 34, _screen, _topCenter },
		Event { "quit", "" },		Keypress { kc_Q, mf_command },
	} }
} };

#pragma mark Archive
resource restype_Slate (resid_termArchive, "") { {
	Slate { "Archive",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },			_cancel,
		ExitEvent { "execute", "" },		Keypress { kc_return, 0 },
		Event { "project", "" },			TypeText { "--project " },
		Event { "code", "" },				TypeText { "--code " },
		Event { "repository", "" },			TypeText { "--repository " },
		Event { "folder", "" },				Sequence{}, TypeText { "--folder " }, ResSubslate { resid_termType }, endSequence{},
		Event { "type", "" },				ResSubslate { resid_termType },
		Event { "paste", "" },				Keypress { kc_V, mf_command },
	} }
} };

#pragma mark Clean
resource restype_Slate (resid_termClean, "") { {
	Slate { "Clean",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		_cancel,
		ExitEvent { "execute", "" },	Keypress { kc_enter, 0 },
		Event { "Support", "" },		TypeText { "Support " },
		Event { "Punkin", "" },			TypeText { "Punkin " },
		Event { "Carbon", "" },			TypeText { "AccessorC9 " },
		Event { "Accessor", "" },		TypeText { "Accessor " },
		Event { "C doc", "" },			TypeText { "Cdoc " },
		Event { "C C Dev", "" },		TypeText { "CCDev " },
		Event { "Xcode", "" },			TypeText { "Xcode " },
	} }
} };

#pragma mark Build
resource restype_Slate (resid_termBuild, "") { {
	Slate { "Build",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "cancel", "" },		_cancel,
		Event { "build", "" },		Sequence{}, TypeText { "build.uia" }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "one", "" },		Sequence{}, Keypress { kc_1, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "two", "" },		Sequence{}, Keypress { kc_2, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "three", "" },		Sequence{}, Keypress { kc_3, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "four", "" },		Sequence{}, Keypress { kc_4, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "five", "" },		Sequence{}, Keypress { kc_5, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "six", "" },		Sequence{}, Keypress { kc_6, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "seven", "" },		Sequence{}, Keypress { kc_7, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "eight", "" },		Sequence{}, Keypress { kc_8, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "nine", "" },		Sequence{}, Keypress { kc_9, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "ten", "" },		Sequence{}, Keypress { kc_1, 0 }, Keypress { kc_0, 0 }, Keypress { kc_enter, 0 }, endSequence{},
	} }
} };

#pragma mark MacPorts
resource restype_Slate (resid_termMacPorts, "MacPorts Slate") { {
	Slate { "MacPorts", {
		Event { "update", "" },		TypeText { "sudo /opt/local/bin/port selfupdate" },
		Event { "define", "" },		TypeText { "p=" },
		Event { "where is", "" },	TypeText { "whereis \"$p\"" },
		Event { "search", "" },		TypeText { "/opt/local/bin/port search \"$p\"" },
		Event { "install", "" },	TypeText { "sudo /opt/local/bin/port install \"$p\"" },
		Event { "remove", "" },		TypeText { "sudo /opt/local/bin/port uninstall \"$p\"" },
		Event { "port", "" },		TypeText { "/opt/local/bin/port" },
		_TerminalStandards_,
	} },
} };

#pragma mark Apache
#define	_ApacheWrapperPath_ 	"/opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper"
resource restype_Slate (resid_termApache, "Apache Slate") { {
	Slate { "Apache", {
		Event { "start", "" },			TypeText { "sudo "_ApacheWrapperPath_" start" },
		Event { "stop", "" },			TypeText { "sudo "_ApacheWrapperPath_" stop" },
		Event { "restart", "" },		TypeText { "sudo "_ApacheWrapperPath_" restart" },
		Event { "load startup", "" },	TypeText { 
			"sudo launchctl load -w /Library/LaunchDaemons/org.macports.apache2.plist" },
		Event { "unload startup", "" },	TypeText { 
			"sudo launchctl unload -w /Library/LaunchDaemons/org.macports.apache2.plist" },
		Event { "check syntax", "" },	TypeText { "apachectl configtest" },
		Event { "edit", "" },			TypeText { "sudo pico /opt/local/apache2/conf/httpd.conf" },
		Event { "path", "" },			TypeText { "/opt/local/apache2/" },
		_TerminalStandards_,
	} },
} };

#pragma mark Telnet
resource restype_Slate (resid_termTelnet, "Telnet Slate") { {
	Slate { "Telnet", {
		Event { "get top", "" },			Sequence{}, TypeText { "GET / HTTP/1.1" }, _return, TypeText { "Host: www.candcsoft.com" }, _return, endSequence{},
		Event { "open address", "" },		TypeText { "telnet 192.168.0.104 80" },
		Event { "open subversion", "" },	TypeText { "telnet svn.candcsoft.com 80" },
		Event { "open web", "" },			TypeText { "telnet www.candcsoft.com 80" },
		_TerminalStandards_,
	} },
} };

#pragma mark Shell
resource restype_Slate (resid_termShell, "Shell Slate") { {
	Slate { "Shell", {
		Event { "password", "" },		TypeText { "6868" },
		Event { "where is", "" },		TypeText { "whereis " },
		_TerminalStandards_,
	} },
} };

#pragma mark Terminal
resource restype_Slate (resid_Terminal, "Terminal Slate") { {
	Slate { "Terminal",	{
		_SlateGlobals_,
		_LaunchSlate_,
		_TerminalItems_
	 } }
} };

// =================================================================================
//	Terminal_C9.r				©2008-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

// Git reserved to resid_termGit+49
#define resid_gitType			resid_termGit+1
#define resid_gitBrowser		resid_TermGit+2

#define	resid_gitDiff			resid_termGit+5
#define	resid_gitLog			resid_termGit+10
#define	resid_gitStash			resid_termGit+15
#define	resid_gitBranch			resid_termGit+20
#define	resid_gitTag			resid_termGit+25
#define resid_gitCommit			resid_termGit+30
#define resid_gitCheckout		resid_termGit+35

#define	resid_gitReset			resid_termGit+40
	#define resid_gitDoReset		resid_gitReset+1
	#define resid_gitReflog			resid_gitReset+2
	
#define	resid_gitAdd			resid_termGit+45

#pragma mark 0 === Index
// 1 Git; 2 Archive; 3 Clean; 4 Build; 5 MacPorts; 6 Apache; 7 Telnet; 8 Shell; 9 Terminal

#pragma mark Type
#define	_TypeTermItems_		\
	Event { "execute", "" },		_return,						\
	Event { "return	", "" },		_return,						\
	Event { "password", "" },		TypeText { "6868" },			\
	Event { "cancel", "" },			_cancel,						\
	Event { "copy", "" },			Keypress { kc_C, mf_command },	\
	Event { "paste", "" },			Keypress { kc_V, mf_command }

resource restype_Slate (resid_termType, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeTermItems_
	} }
} };

#pragma mark 1 === Git
// inside: 1 Difference; 2 Log; 3 Stash; 4 Branch; 5 Tag; 6 Checkout; Reset; 7 Commit; 9 Add; Browser
#define _GitStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		ExitEvent { "cancel", "" },		_cancel,						\
		ExitEvent { "execute", "" },	_return,						\
		Event { "return	", "" },		_return,						\
		Event { "copy", "" },			Keypress { kc_C, mf_command },	\
		Event { "paste", "" },			Keypress { kc_V, mf_command },	\
		Event { "quiver", "" },			Keypress { kc_Q, 0 },			\
		Event { "end display", "" },	Keypress { kc_Q, 0 },			\
		Event { "type", "" },			ResSubslate { resid_gitType }

resource restype_Slate (resid_termGit, "") { {
	Slate { "Git",	{
		_GitStandards_,
		Event { "go back", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "directory", "" },		Sequence{}, TypeText { "pwd" }, _return, endSequence{},
		Event { "browser", "" },		Sequence{}, TypeText { "gitk" }, _return, ResSubslate { resid_gitBrowser }, endSequence{},
		Event { "status", "" },			Sequence{}, TypeText { "git status" }, _return, endSequence{},
		Event { "branch", "" },			Sequence{}, TypeText { "git branch " }, ResSubslate { resid_gitBranch }, endSequence{},
		Event { "tag", "" },			Sequence{}, TypeText { "git tag " }, ResSubslate { resid_gitTag }, endSequence{},
		Event { "reset", "" },			ResSubslate { resid_gitReset },
		Event { "difference", "" },		Sequence{}, TypeText { "git diff " }, ResSubslate { resid_gitDiff }, endSequence{},
		Event { "log", "" },			Sequence{}, TypeText { "git log " }, ResSubslate { resid_gitLog }, endSequence{},
		Event { "stash away", "" },		Sequence{}, TypeText { "git stash " }, ResSubslate { resid_gitStash }, endSequence{},
		Event { "add files", "" },		Sequence{}, TypeText { "git add --all --interactive" }, _return, ResSubslate { resid_gitAdd }, endSequence{},
		Event { "commit", "" },			Sequence{}, TypeText { "git commit " }, ResSubslate { resid_gitCommit }, endSequence{},
		Event { "checkout", "" },		Sequence{}, TypeText { "git checkout " }, ResSubslate { resid_gitCheckout }, endSequence{},
	} }
} };

resource restype_Slate (resid_gitType, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeTermItems_,
		Event { "master", "" },			TypeText { "master " },
		Event { "current branch", "" },	TypeText { "$cb " },
		Event { "project locker", "" },	TypeText { "ssh git-CCSoftware@pl5.projectlocker.com" },
		Event { "shell", "" },			TypeText { "sealsea v3ejc 6868" },
		Event { "version 3", "" },		TypeText { "4YZHqz5pq1" },
	} }
} };

#pragma mark 1 -- Difference
resource restype_Slate (resid_gitDiff, "") { {
	Slate { "diff",	{
		_GitStandards_,
		Event { "cached", "between staged and head" },			TypeText { "--cached " },
		Event { "standard", "between staged and unstaged" },	NilAction{},
		Event { "head", "both staged and unstaged" },			TypeText { "HEAD " },
		Event { "end options", "" },	TypeText { "-- " },
		Event { "master", "" },			TypeText { "master " },
		Event { "current branch", "" },	TypeText { "$cb " },
		Event { "abbreviate", "" },		TypeText { "--name-status " },
		Event { "name status", "" },	TypeText { "--name-status " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
		Event { "tilde", "" },			Keypress { kc_accent, mf_shift },
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "space bar", "" },		Keypress { kc_space, 0 },
		_NumberKeys_,
	} }
} };

#pragma mark 2 -- Log	
resource restype_Slate (resid_gitLog, "") { {
	Slate { "log",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "master", "" },			TypeText { "master " },
		Event { "current branch", "" },	TypeText { "$cb " },
		Event { "abbreviate,", "" },	TypeText { "--oneline " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
	} }
} };

#pragma mark 3 -- Stash
resource restype_Slate (resid_gitStash, "") { {
	Slate { "stash",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "save", "" },			Sequence{}, _cancel, TypeText { "# git stash save <message>" }, _return, TypeText { "git stash save " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "keep index", "" },		TypeText { "--keep-index " },
		Event { "show", "" },			TypeText { "show " },
		Event { "pop", "" },			TypeText { "pop " },
		Event { "apply", "" },			Sequence{}, TypeText { "apply " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "branch", "" },			TypeText { "branch " },
		Event { "previous", "" },		Sequence{}, TypeText { "stash@{" }, ResSubslate { resid_gitType }, endSequence{},
		Event { "abbreviate", "" },		TypeText { "--name-status " },
		Event { "list", "" },			TypeText { "list " },
		Event { "clear", "" },			TypeText { "clear " },
	} }
} };

#pragma mark 4 -- Branch
resource restype_Slate (resid_gitBranch, "") { {
	Slate { "branch",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		ExitEvent { "list", "" },		_return,
		ExitEvent { "list all", "" },		Sequence{}, TypeText { "-a " }, _return, endSequence{},
		ExitEvent { "get current", "" },	Sequence{}, _cancel, TypeText { "cb=$(git branch | grep \"*\" | sed \"s/* //\"); print $cb" }, _return, endSequence{},
		ExitEvent { "unmerged", "" },	Sequence{}, TypeText { "--no-merged " }, _return, endSequence{},
		Event { "rename", "" },			Sequence{}, TypeText { "-m " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "delete", "" },			Sequence{}, TypeText { "-d " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "switch new", "" },		Sequence{}, _cancel, TypeText { "git checkout -b " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "checkout", "" },		Sequence{}, _cancel, TypeText { "git checkout " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "current branch", "" },	TypeText { "$cb " },
		Event { "master", "" },			TypeText { "master " },
	} }
} };

#pragma mark 5 -- Tag
resource restype_Slate (resid_gitTag, "") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		ExitEvent { "list", "" },		_return,
		ExitEvent { "push", "" },		Sequence{}, _cancel, TypeText { "git push --tags" }, endSequence{},
		ExitEvent { "push remote", "known to work if cd is PunkinMain" }, Sequence{}, _cancel, TypeText { "git push --tags /Volumes/carollclark/gitrep/PunkinRemote" }, endSequence{},
		Event { "make", "" },			Sequence{}, _cancel, TypeText { "# git tag -a 'tagname' -m \"message\"" }, _return, TypeText { "git tag -a "}, ResSubslate { resid_gitType }, endSequence{},
		Event { "delete", "" },			Sequence{}, TypeText { "-d " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "show", "" },			Sequence{}, _cancel, TypeText { "git show --name-status " }, ResSubslate { resid_gitType }, endSequence{}, 
	} }
} };

#pragma mark 6 -- Checkout
resource restype_Slate (resid_gitCheckout, "") { {
	Slate { "checkout",	{
		Event { "branch", "" },			TypeText { "-b " },
		Event { "to index", "" },		TypeText { "-- " },
		Event { "to head", "" },		TypeText { "HEAD " },
		Event { "path", "" },			TypeText { "./" },
		_GitStandards_,
	} }
} };

resource restype_Slate (resid_gitReset, "") { {
	Slate { "reset",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "reset", "" },			Sequence{}, TypeText { "git reset " }, ResSubslate { resid_gitDoReset}, endSequence{},
		Event { "reflog", "" },			Sequence{}, TypeText { "git reflog " }, ResSubslate { resid_gitReflog }, endSequence{},
		Event { "discard changes", "" },	Subslate { "discard changes" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "cancel", "" },		_cancel,
			Event { "reset", "" },			TypeText { "git reset " },
			Event { "hard", "" },			TypeText { "--hard " },
			Event { "HEAD", "" },			TypeText { "HEAD " },
			ExitEvent { "confirm discard changes", "" },	_return,
		endSubslate{},
	} }
} };

resource restype_Slate (resid_gitDoReset, "") { {
	Slate { "reset", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "soft", "" },			TypeText { "--soft " },
		Event { "head", "" },			TypeText { "HEAD " },
		Event { "tilde", "" },			Keypress { kc_accent, mf_shift },
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		_NumberKeys_,
	} }
} };

#pragma mark reflog
resource restype_Slate (resid_gitReflog, "") { {
	Slate { "reflog",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "show", "" },			TypeText { "show " },
		Event { "HEAD", "" },			TypeText { "HEAD " },
		Event { "master", "" },			TypeText { "master " },
		Event { "current branch", "" },	TypeText { "$cb " },
	} }
} };

#pragma mark 7 -- Commit
resource restype_Slate (resid_gitCommit, "") { {
	Slate { "commit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		Event { "message", "" },		Sequence{}, TypeText { "-m \"" }, ResSubslate { resid_gitType }, endSequence{},
		Event { "file", "" },			Sequence{}, TypeText { "-F \"${CCDev}/tmp/gitmessage" }, Keypress { kc_quote, mf_shift }, endSequence{},
	} }
} };

#pragma mark 9 -- Add
resource restype_Slate (resid_gitAdd, "") { {
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
		ExitEvent { "quit", "" },	Sequence{}, _return, Keypress { kc_Q, 0 }, _return, endSequence{},
		Event { "help", "" },		Sequence{}, Keypress { kc_H, 0 }, _return, endSequence{},
	} }
} };

resource restype_Slate (resid_gitBrowser, "") { {
	Slate { "gitk",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlate_,
		Event { "activate", "" },	Click { 1, 0, 34, _screen, _topCenter },
		Event { "quit", "" },		Keypress { kc_Q, mf_command },
	} }
} };

#pragma mark 2 === Archive
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

#pragma mark 3 === Clean
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

#pragma mark 4 === Build
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

#pragma mark 5 === MacPorts
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

#pragma mark 6 === Apache
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

#pragma mark 7 === Telnet
resource restype_Slate (resid_termTelnet, "Telnet Slate") { {
	Slate { "Telnet", {
		Event { "get top", "" },			Sequence{}, TypeText { "GET / HTTP/1.1" }, _return, TypeText { "Host: www.candcsoft.com" }, _return, endSequence{},
		Event { "open address", "" },		TypeText { "telnet 192.168.0.104 80" },
		Event { "open subversion", "" },	TypeText { "telnet svn.candcsoft.com 80" },
		Event { "open web", "" },			TypeText { "telnet www.candcsoft.com 80" },
		_TerminalStandards_,
	} },
} };

#pragma mark 8 === Shell
resource restype_Slate (resid_termShell, "Shell Slate") { {
	Slate { "Shell", {
		Event { "password", "" },		TypeText { "6868" },
		Event { "where is", "" },		TypeText { "whereis " },
		_TerminalStandards_,
	} },
} };

#pragma mark 9 === Terminal
resource restype_Slate (resid_Terminal, "Terminal Slate") { {
	Slate { "Terminal",	{
		_SlateGlobals_,
		_LaunchSlate_,
		_TerminalItems_
	 } }
} };

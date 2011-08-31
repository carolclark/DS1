// =================================================================================
//	Terminal_C9.r					©2008 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"


#define	resid_gitDiff			resid_termGit+1
#define resid_termGitBrowser	resid_TermGit+2

#pragma mark _TerminalStandards_
#define _TerminalStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		Event { "execute", "" },	_return,				\
		Event { "return	", "" },	_return,				\
		Event { "password", "" },	TypeText { "6868" },	\
		Event { "cancel", "" },		Keypress { kc_C, mf_command },		\
		Event { "quiver", "" },		Keypress { kc_Q, 0 },		\
		_TypeSlate_

#pragma mark Git
resource restype_Slate (resid_gitDiff, "") { {
	Slate { "diff",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "execute", "" },	_return,
		Event { "return	", "" },		_return,
		Event { "cancel", "" },			Keypress { kc_C, mf_command },
		Event { "cached", "" },			TypeText { "--cached " },
		Event { "head", "" },			TypeText { "HEAD " },
		Event { "file", "" },			TypeText { "HEAD -- ./" },
		Event { "master", "" },			TypeText { "master " },
		Event { "brief", "" },			TypeText { "--name-status " },
		Event { "quiver", "" },			Keypress { kc_Q, 0 },
		_TypeSlate_
	} }
} };

resource restype_Slate (resid_termGit, "") { {
	Slate { "Git",	{
		_TerminalStandards_,
		Event { "project", "" },		Subslate { "project" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },	Sequence{}, TypeText { "cd ~/Dev/Support" }, _return, endSequence{},
			ExitEvent { "Punkin", "" },		Sequence{}, TypeText { "cd ~/Dev/Punkin" }, _return, endSequence{},
			endSubslate{},
		Event { "repository", "" },		Subslate { "repository" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support main", "" },	Sequence{}, TypeText { "cd ~/Dev/gitrep/SupportMain" }, _return, endSequence{},
			ExitEvent { "Punkin main", "" },	Sequence{}, TypeText { "cd ~/Dev/gitrep/PunkinMain" }, _return,	 endSequence{},
			ExitEvent { "Punkin remote", "" },	Sequence{}, TypeText { "cd /Volumes/carollclark/gitrep/PunkinRemote" }, _return, endSequence{},
			endSubslate{},
		Event { "browser", "" },		Sequence{}, TypeText { "gitk" }, _return, ResSubslate { resid_termGitBrowser }, endSequence{},
		Event { "status", "" },			Sequence{}, TypeText { "git status" }, _return, endSequence{},
		Event { "differences", "" },	Sequence{}, TypeText { "git diff " }, ResSubslate { resid_gitDiff }, endSequence{},
		Event { "interact", "" },		Subslate { "interact" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "add", "" },			Sequence{}, TypeText { "git add --all --interactive" }, _return, ResSubslate { resid_TypeSlate }, endSequence{},
			Event { "squash", "" },			Sequence{}, TypeText { "git rebase -i HEAD~" }, ResSubslate { resid_TypeSlate }, endSequence{},
			endSubslate{},
	} }
} };

resource restype_Slate (resid_termGitBrowser, "") { {
	Slate { "gitk",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlate_,
		Event { "go browser", "" },		Click { 1, 0, 34, _screen, _topCenter },
		Event { "quit browser", "" },	Keypress { kc_Q, mf_command },
	} }
} };

#pragma mark Archive
resource restype_Slate (resid_termArchive, "") { {
	Slate { "Archive",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		Keypress { kc_C, mf_control },
		ExitEvent { "execute", "" },	Keypress { kc_return, 0 },
		Event { "project", "" },		TypeText { "project " },
		Event { "to retire", "" },		TypeText { "toRetire " },
		Event { "repositories", "" },	TypeText { "repositories " },
		_TypeProjectName_,
	} }
} };

#pragma mark Build
resource restype_Slate (resid_termBuild, "") { {
	Slate { "Build",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "cancel", "" },		Keypress { kc_C, mf_control },
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

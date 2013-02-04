// =================================================================================
//	Terminal_C9.r				©2008-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// Git
//	2 Git, Type, Checkout, Branch, Difference, Stash; 3 Add, Commit, Log, Tag, Merge, Push, Fetch; 4 Clean; Bisect; SelectFile, Reset, Browser, FileMerge
// Other
//	1 Type; Standards 5 Archive; Clean; Build; 6 MacPorts; 7 Apache; Telnet; 8 Shell; 9 Terminal

//#define resid_XCTerminal		resid_Terminal+1
#define resid_Type				resid_Terminal+20

#define resid_Build				resid_Terminal+50
#define resid_Clean				resid_Terminal+100
#define resid_Archive			resid_Terminal+150
#define	resid_Shell				resid_Terminal+200
#define resid_MacPorts			resid_Terminal+250
#define resid_Apache			resid_Terminal+300
#define resid_Telnet			resid_Terminal+350

#define resid_Git				resid_Terminal+400
	#define resid_gitType				resid_Git+10
	#define resid_gitCheckout			resid_Git+50
	#define	resid_gitBranch				resid_Git+80
	#define	resid_gitDiff				resid_Git+100
	#define	resid_gitStash				resid_Git+150
	#define	resid_gitAdd				resid_Git+170
		#define resid_gitAddInteract		resid_gitAdd+1
	#define resid_gitCommit				resid_Git+200
	#define	resid_gitLog				resid_Git+230
		#define resid_gitReflog				resid_gitLog+1	
	#define	resid_gitTag				resid_Git+250
	#define resid_gitMerge				resid_Git+270
	#define resid_gitPush				resid_Git+275
	#define resid_gitFetch				resid_Git+285
	#define resid_gitClean				resid_Git+290
	#define resid_Bisect				resid_Git+295

	#define resid_gitSelectFile			resid_Git+300
	#define	resid_gitReset				resid_Git+320
	#define resid_gitBrowser			resid_Git+340
	#define resid_FileMerge				resid_Git+350
		#define resid_FileMergeActions		resid_FileMerge+1
		#define resid_FileMergeEdit			resid_FileMerge+2

#define	_cancel			Keypress { kc_C, mf_control }


#pragma mark 1 === Standards
#define _TerminalStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		Event { "execute", "" },	_return,				\
		Event { "return	", "" },	_return,				\
		Event { "password", "" },	TypeText { "6868" },	\
		Event { "copy", "" },		Keypress { kc_C, mf_command },	\
		Event { "paste", "" },		Keypress { kc_V, mf_command },	\
		Event { "quiver", "" },		Keypress { kc_Q, 0 },		\
		ExitEvent { "cancel", "" },	_cancel,				\
		Event { "Type", "" },		ResSubslate { resid_Type }

#define	_TerminalItems_			\
		_StarterBase_,			\
		Event { "Type", "" },			ResSubslate { resid_Type },		\
		Event { "copy", "" },			Keypress { kc_C, mf_command },	\
		Event { "paste", "" },			Keypress { kc_V, mf_command },	\
		Event { "execute", "" },		_return,		\
		Event { "cancel", "" },			_cancel,			\
		Event { "next window", "" },	Keypress { kc_accent, mf_command },						\
		Event { "go next", "" }, 		Keypress { kc_closebracket, mf_command + mf_shift },	\
		Event { "go previous", "" },	Keypress { kc_bracket, mf_command + mf_shift },			\
		Event { "Menu", "" },			Subslate { "Menu" },		\
			_SlateGlobals_,		\
			_CloseSubslate_,		\
			ExitEvent { "Application", "'Terminal' menu" }, ClickMenu { "Terminal" },		\
			ExitEvent { "Shell", "'Shell' menu" }, ClickMenu { "Shell" },		\
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },		\
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },		\
			endSubslate{},		\
		Event { "git", "" },	ResSubslate { resid_Git },			\
		Event { "clean", "" },	Sequence{}, TypeText { "cleanProjectTarget " }, ResSubslate { resid_Clean }, endSequence{},		\
		Event { "build", "" },	Sequence{}, TypeText { "build.uia" }, Keypress { kc_enter, 0 }, ResSubslate { resid_Build }, endSequence{},		\
		Event { "archive", "" },	Sequence{}, TypeText { "archive " }, ResSubslate { resid_Archive }, endSequence{},		\
		Event { "backup", "" },			TypeText { "ccBackup Backup " },	\
		Event { "export", "" },			TypeText { "export " },				\
		Event { "ports", "" },			ResSubslate { resid_MacPorts },		\
		Event { "Shell", "" },			ResSubslate { resid_Shell },		\
		Event { "Apache", "" },			ResSubslate { resid_Apache },		\
		Event { "Telnet", "" },			ResSubslate { resid_Telnet }

#pragma mark Type
#define	_TypeTermItems_		\
	Event { "execute", "" },		_return,						\
	Event { "return	", "" },		_return,						\
	Event { "password", "" },		TypeText { "6868" },			\
	Event { "cancel", "" },			_cancel,						\
	Event { "copy", "" },			Keypress { kc_C, mf_command },	\
	Event { "paste", "" },			Keypress { kc_V, mf_command },	\
	Event { "system config", "" },	TypeText { "/private/etc/launchd.conf " },

resource restype_Slate (resid_Type, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeTermItems_
	} }
} };

#pragma mark 2 === Git
// inside: Standards; 1 Git; 2 Type; 3 Checkout; 4 Branch; 5 Difference; 6 Stash
#define _GitStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		ExitEvent { "cancel", "" },		_cancel,						\
		ExitEvent { "execute", "" },	_return,						\
		Event { "return	", "" },		_return,						\
		Event { "copy", "" },			Keypress { kc_C, mf_command },	\
		Event { "paste", "" },			Keypress { kc_V, mf_command },	\
		Event { "continue", "" },		Keypress { kc_space, 0 },		\
		Event { "end display", "" },	Keypress { kc_Q, 0 },			\
		Event { "dry run", "" },		TypeText { "--dry-run " },		\
		Event { "type", "" },			ResSubslate { resid_gitType }

#define	_CurrentBranch_		Event { "current branch", "" },	TypeText { "$cb " }
#define	_GitFile_			Event { "git file", "" },	TypeText { "$gf " }

#pragma mark 1 -- Git
resource restype_Slate (resid_Git, "") { {
	Slate { "Git",	{
		_GitStandards_,
		Event { "go back", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "FileMerge", "" },		Sequence{}, Launch { DevApps_"XCode.app/Contents/Applications/FileMerge.app", 0 }, ResSubslate { resid_FileMerge },  endSequence{},
		Event { "status", "" },			Sequence{}, TypeText { "git status" }, _return, endSequence{},
		Event { "checkout", "" },		Sequence{}, TypeText { "git checkout " }, ResSubslate { resid_gitCheckout }, endSequence{},
		Event { "branch", "" },			Sequence{}, TypeText { "git branch " }, ResSubslate { resid_gitBranch }, endSequence{},
		Event { "difference", "" },		Sequence{}, TypeText { "git difftool " }, ResSubslate { resid_gitDiff }, endSequence{},
		Event { "stash away", "" },		Sequence{}, TypeText { "git stash " }, ResSubslate { resid_gitStash }, endSequence{},
		Event { "add files", "" },		Sequence{}, TypeText { "git add " }, ResSubslate { resid_gitAdd }, endSequence{},
		Event { "commit", "" },			Sequence{}, TypeText { "git commit " }, ResSubslate { resid_gitCommit }, endSequence{},
		Event { "log", "" },			Sequence{}, TypeText { "git log " }, ResSubslate { resid_gitLog }, endSequence{},
		Event { "reflog", "" },			Sequence{}, TypeText { "git reflog " }, ResSubslate { resid_gitReflog }, endSequence{},
		Event { "tag", "" },			Sequence{}, TypeText { "git tag " }, ResSubslate { resid_gitTag }, endSequence{},
		Event { "merge", "" },			Sequence{}, TypeText { "git mergetool " }, ResSubslate { resid_gitMerge }, endSequence{},
		Event { "push", "" },			Sequence{}, TypeText { "git push " }, ResSubslate { resid_gitPush }, endSequence{},
		Event { "fetch", "" },			Sequence{}, TypeText { "git fetch " }, ResSubslate { resid_gitFetch }, endSequence{},
		Event { "clean", "" },			Sequence{}, TypeText { "git clean " }, ResSubslate { resid_gitClean }, endSequence{},
		Event { "bisect", "" },			Sequence{}, TypeText { "git bisect " }, ResSubslate { resid_Bisect }, endSequence{},
		Event { "show message file", "" },	Sequence{}, TypeText { "cat $CCDev/tmp/gitmessage.txt" }, _return, endSequence{},
		Event { "make executable", "" },	Sequence{}, TypeText { "chmod a+x " }, ResSubslate { resid_Type },  endSequence{},
		Event { "list tree", "" },		TypeText { "git ls-tree -r " },
		Event { "show", "" },			TypeText { "git show --pretty=\"format:\" --name-only " },
		Event { "directory", "" },		Sequence{}, TypeText { "pwd" }, _return, endSequence{},
		Event { "select file", "" },	Sequence{}, TypeText { "read lineno; gf=`cat $CCDev/tmp/gitstatus | grep \"^$lineno\" | cut -c 5-`; print $gf" }, _return, ResSubslate { resid_gitSelectFile }, endSequence{},
		Event { "reset", "" },			ResSubslate { resid_gitReset },
		Event { "browser", "" },		Sequence{}, TypeText { "gitk" }, _return, ResSubslate { resid_gitBrowser }, endSequence{},
	} }
} };

#pragma mark 2 -- Type
resource restype_Slate (resid_gitType, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeTermItems_,
		Event { "master", "" },			TypeText { "master " },
		_CurrentBranch_,
		_GitFile_,
		Event { "project locker", "" },	TypeText { "ssh git-CCSoftware@pl5.projectlocker.com" },
		Event { "shell", "" },			TypeText { "sealsea v3ejc 6868" },
		Event { "version 3", "" },		TypeText { "4YZHqz5pq1" },
		Event { "dry run", "" },		TypeText { "--dry-run " },
	} }
} };

#pragma mark 3 -- Checkout
resource restype_Slate (resid_gitCheckout, "") { {
	Slate { "checkout",	{
		Event { "new branch", "" },		TypeText { "-b " },
		Event { "top head", "" },		TypeText { "HEAD@{0} " },
		Event { "head", "" },			Sequence{}, TypeText { "HEAD@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "master", "" },			TypeText { "master " },
		_CurrentBranch_,
		Event { "path ", "" },			TypeText { "-- " },
		_GitFile_,
		_GitStandards_,
	} }
} };

#pragma mark 4 -- Branch
resource restype_Slate (resid_gitBranch, "") { {
	Slate { "branch",	{
		_GitStandards_,
		ExitEvent { "list", "" },			_return,
		ExitEvent { "list all", "" },		Sequence{}, TypeText { "-a " }, _return, endSequence{},
		ExitEvent { "get current", "" },	Sequence{}, _cancel, TypeText { "cb=$(git branch | grep \"*\" | sed \"s/* //\"); print $cb" }, _return, endSequence{},
		ExitEvent { "print current", "" },	Sequence{}, TypeText { "print $cb" }, _return, endSequence{},
		Event { "unmerged", "" },			Sequence{}, TypeText { "--no-merged " }, endSequence{},
		Event { "rename", "" },				Sequence{}, TypeText { "-m " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "delete", "" },				Sequence{}, TypeText { "-d " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "switch new", "" },			Sequence{}, _cancel, TypeText { "git checkout -b " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "checkout", "" },			Sequence{}, _cancel, TypeText { "git checkout " }, ResSubslate { resid_gitType }, endSequence{},
		_CurrentBranch_,
		Event { "master", "" },				TypeText { "master " },
	} }
} };

#pragma mark 5 -- Difference
resource restype_Slate (resid_gitDiff, "") { {
	Slate { "diff",	{
		_GitStandards_,
		Event { "file merge", "" },		Sequence{}, _return, ResSubslate { resid_FileMerge }, endSequence{},
		Event { "cached", "between staged and head" },			TypeText { "--cached " },
		Event { "standard", "between staged and unstaged" },	NilAction{},
		Event { "top head", "both staged and unstaged" },		TypeText { "HEAD@{0} " },
		Event { "head", "" },			Sequence{}, TypeText { "HEAD@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "stash", "" },			Sequence{}, TypeText { "stash@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "top stash", "" },		TypeText { "stash@{0} " },
		ExitEvent { "list files", "" },	Sequence{}, TypeText { "--name-status | grep -n \"[a-z,A-Z]\" > $CCDev/tmp/gitstatus; cat $CCDev/tmp/gitstatus" }, _return, endSequence{},
		Event { "add path", "" },		TypeText { "-- " },
		Event { "master", "" },			TypeText { "master " },
		_CurrentBranch_,
		_GitFile_,
		Event { "abbreviate", "" },		TypeText { "--name-status " },
		Event { "name status", "" },	TypeText { "--name-status " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
		Event { "tilde", "" },			Keypress { kc_accent, mf_shift },
		_NumberKeys_,
	} }
} };

#pragma mark 6 -- Stash
resource restype_Slate (resid_gitStash, "") { {
	Slate { "stash",	{
		_GitStandards_,
		Event { "save", "" },			Sequence{}, TypeText { "save " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "apply", "" },			TypeText { "apply " },
		Event { "drop", "" },			TypeText { "drop " },
		Event { "list", "" },			TypeText { "list " },
		Event { "show", "" },			TypeText { "show " },
		Event { "keep index", "" },		TypeText { "--keep-index " },
		Event { "to branch", "" },		TypeText { "branch " },
		Event { "stash", "" },			Sequence{}, TypeText { "stash@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "top stash", "" },		TypeText { "stash@{0} " },
	} }
} };

#pragma mark 3 === Add
// inside: Add; 1 Commit; 2 Log; 3 Tag; 4 Merge; 5 Push; 6 Fetch
resource restype_Slate (resid_gitAdd, "") { {
	Slate { "Add",	{
		_GitStandards_,
		Event { "select", "" },			Sequence{}, TypeText { "--all --interactive" }, _return, ResSubslate { resid_gitAddInteract }, endSequence{},
		Event { "update", "" }, 		TypeText { "--update" },
		Event { "all", "" }, 			TypeText { "--all" },
		Event { "dot", "" },			TypeText { "." },
	} }
} };

resource restype_Slate (resid_gitAddInteract, "") { {
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
		ExitEvent { "quit", "" },	Sequence{}, _return, Keypress { kc_Q, 0 }, _return, CloseSubslate{}, endSequence{},
		Event { "help", "" },		Sequence{}, Keypress { kc_H, 0 }, _return, endSequence{},
	} }
} };

#pragma mark 1 -- Commit
resource restype_Slate (resid_gitCommit, "") { {
	Slate { "commit",	{
		_GitStandards_,
		Event { "amend", "" },			TypeText { "--amend " },
		Event { "message", "" },		Sequence{}, TypeText { "-m \"" }, ResSubslate { resid_gitType }, endSequence{},
		Event { "message file", "" },	Sequence{}, TypeText { "-F \"${CCDev}/tmp/gitmessage.txt" }, Keypress { kc_quote, mf_shift }, endSequence{},
	} }
} };

#pragma mark 2 -- Log	
resource restype_Slate (resid_gitLog, "") { {
	Slate { "log",	{
		_GitStandards_,
		Event { "master", "" },			TypeText { "master " },
		_CurrentBranch_,
		_GitFile_,
		Event { "abbreviate,", "" },	TypeText { "--oneline " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
		Event { "reflog", "" },			TypeText { "--walk-reflogs " },
	} }
} };

#pragma mark reflog
resource restype_Slate (resid_gitReflog, "") { {
	Slate { "reflog",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "excecute", "" },	_return,
		ExitEvent { "cancel", "" },		_cancel,
		Event { "with dates", "" },		TypeText { "--format=\"%gd %h %ci %cn %s\" " },
		_CurrentBranch_,
		_GitFile_,
	} }
} };

#pragma mark 3 -- Tag
resource restype_Slate (resid_gitTag, "") { {
	Slate { "tag",	{
		ExitEvent { "annotate ", "" },			Sequence{}, Keypress { kc_C, mf_control }, TypeText { "git for-each-ref refs/tags --sort=-taggerdate -- format=\"%(objectname:short) %(taggerdate:short) %(refname:short)%09%09%(subject) %(body)\"" }, endSequence{},
		ExitEvent { "list ", "" },	_return,
		Event { "show", "" },				Sequence{}, _cancel, TypeText { "git show --name-status " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "make", "" },				Sequence{}, TypeText { "git tag -a "}, ResSubslate { resid_gitType }, endSequence{},
		Event { "delete", "" },				Sequence{}, TypeText { "-d " }, ResSubslate { resid_gitType }, endSequence{},
		_CurrentBranch_,
		_GitStandards_,	
	} }
} };

#pragma mark 4 -- Merge
resource restype_Slate (resid_gitMerge, "") { {
	Slate { "Merge",	{
		ExitEvent { "abort", "" },		TypeText { "--abort" },
		Event { "closing branch", "" },	Sequence{}, TypeText { "--no-ff -m \"merge branch \"$cb $cb"}, endSequence{},
		Event { "message", "" },		Sequence{}, TypeText { "$cb -m \"merge $cb: " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "remote", "" },			Sequence{}, TypeText { "--no-ff FETCH_HEAD -m \"merge artist: " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "tool", "" },			Sequence{}, Keypress { kc_delete, 0 }, TypeText { "tool --tool=opendiff " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "file merge", "" },		Sequence{}, _return, ResSubslate { resid_FileMerge }, endSequence{}, 
		_currentBranch_,
		_GitStandards_,
	} }
} };

#pragma mark 5 -- Push
#pragma mark gitPush
resource restype_Slate (resid_gitPush, "") { {
	Slate { "gitPush",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "origin", "" },			TypeText { "origin " },
		Event { "tags", "" },			TypeText { "--tags " },
		_GitStandards_,
	} }
} };

#pragma mark 6 -- Fetch
resource restype_Slate (resid_gitFetch, "") { {
	Slate { "Fetch",	{
		_GitStandards_,
	} }
} };

#pragma mark 4 === Clean
// inside: Clean 1 Bisect 2 SelectFile; 3 Reset; 4 Browser; 5 FileMerge
#pragma mark Clean
resource restype_Slate (resid_gitClean, "") { {
	Slate { "Clean",	{
		_GitStandards_,
		Event { "force", "" },			TypeText { "--force " },
	} }
} };

#pragma mark Bisect
resource restype_Slate (resid_Bisect, "") { {
	Slate { "Bisect",	{
		_GitStandards_,
		Event { "start", "" },			TypeText { "start " },
		Event { "bad", "" },			TypeText { "bad " },
		Event { "good", "" },			TypeText { "good " },
		Event { "skip", "" },			TypeText { "skip " },
		Event { "reset", "" },			TypeText { "reset " },
		Event { "log", "" },			TypeText { "log " },
		Event { "replay", "" },			TypeText { "replay " },
	} }
} };

#pragma mark 2 -- Select
resource restype_Slate (resid_gitSelectFile, "") { {
	Slate { "Select File",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "1", "" },			Sequence{}, Keypress { kc_1, 0 }, _return, endSequence{},
		ExitEvent { "2", "" },			Sequence{}, Keypress { kc_2, 0 }, _return, endSequence{},
		ExitEvent { "3", "" },			Sequence{}, Keypress { kc_3, 0 }, _return, endSequence{},
		ExitEvent { "4", "" },			Sequence{}, Keypress { kc_4, 0 }, _return, endSequence{},
		ExitEvent { "5", "" },			Sequence{}, Keypress { kc_5, 0 }, _return, endSequence{},
		ExitEvent { "6", "" },			Sequence{}, Keypress { kc_6, 0 }, _return, endSequence{},
		ExitEvent { "7", "" },			Sequence{}, Keypress { kc_7, 0 }, _return, endSequence{},
		ExitEvent { "8", "" },			Sequence{}, Keypress { kc_8, 0 }, _return, endSequence{},
		ExitEvent { "9", "" },			Sequence{}, Keypress { kc_9, 0 }, _return, endSequence{},
		ExitEvent { "10", "" },			Sequence{}, TypeText { "10" }, _return, endSequence{},
		ExitEvent { "11", "" },			Sequence{}, TypeText { "11" }, _return, endSequence{},
		ExitEvent { "12", "" },			Sequence{}, TypeText { "12" }, _return, endSequence{},
		ExitEvent { "13", "" },			Sequence{}, TypeText { "13" }, _return, endSequence{},
		ExitEvent { "14", "" },			Sequence{}, TypeText { "14" }, _return, endSequence{},
		ExitEvent { "15", "" },			Sequence{}, TypeText { "15" }, _return, endSequence{},
		ExitEvent { "16", "" },			Sequence{}, TypeText { "16" }, _return, endSequence{},
		ExitEvent { "17", "" },			Sequence{}, TypeText { "17" }, _return, endSequence{},
		ExitEvent { "18", "" },			Sequence{}, TypeText { "18" }, _return, endSequence{},
		ExitEvent { "19", "" },			Sequence{}, TypeText { "19" }, _return, endSequence{},
		ExitEvent { "20", "" },			Sequence{}, TypeText { "20" }, _return, endSequence{},
	} }
} };

#pragma mark 3 -- Reset
resource restype_Slate (resid_gitReset, "") { {
	Slate { "reset",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "dry run", "" },		TypeText { "--dry-run " },
		Event { "soft", "" },			TypeText { "--soft " },
		Event { "discard changes", "" },	Subslate { "discard changes" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "cancel", "" },		_cancel,
			Event { "reset", "" },			TypeText { "git reset " },
			Event { "hard", "" },			TypeText { "--hard " },
			Event { "top head", "" },		TypeText { "HEAD@{0} " },
			Event { "head", "" },			Sequence{}, TypeText { "HEAD@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
			ExitEvent { "confirm discard changes", "" },	_return,
		endSubslate{},
	} }
} };

#pragma mark 4 -- Browser
resource restype_Slate (resid_gitBrowser, "") { {
	Slate { "gitk",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlate_,
		Event { "activate", "" },	Click { 1, 0, 34, _screen, _topCenter },
		Event { "quit", "" },		Keypress { kc_Q, mf_command },
	} }
} };

#pragma mark 5 -- FileMerge
resource restype_Slate (resid_FileMerge, "") { {
	Slate { "FileMerge",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			CloseSubslate{},
		ExitEvent { "cancel", "" },			Sequence{}, Keypress { kc_period, mf_command }, CloseSubslate{}, endSequence{},
		ExitEvent { "Xcode", "" },			Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "continue", "" },			Keypress { kc_Q, mf_command },
		Event { "Terminal", "" }, 			Launch { Apps_"Utilities/Terminal.app", 0 },
		Event { "difference", "" },			Click { 1, 0, 75, _window, _topCenter },
		Event { "actions", "" },			Sequence{}, Click { 1, -110, -30, _window, _bottomRight }, _down, ResSubslate { resid_FileMergeActions }, endSequence{},
		Event { "edit", "" },				Sequence{}, Click { 1, -30, -260, _window, _bottomRight }, ResSubslate { resid_FileMergeEdit }, endSequence{},
		Event { "save", "" },				Keypress { kc_S, mf_command },
		Event { "return", "" },				_return,
		Event { "space", "" },				_space,
		_IMouseSlate_,
		_DirectionKeys_,
	} }
} };

#pragma mark FileMergeActions
resource restype_Slate (resid_FileMergeActions, "") { {
	Slate { "Actions",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "left", "" },			Sequence{}, TypeText { "choose left" }, _return, endSequence{},
		ExitEvent { "right", "" },			Sequence{}, TypeText { "choose right" }, _return, endSequence{},
		ExitEvent { "left first", "" },		Sequence{}, TypeText { "choose both (left first)" }, _return, endSequence{},
		ExitEvent { "right first", "" },	Sequence{}, TypeText { "choose both (right first)" }, _return, endSequence{},
		ExitEvent { "neither", "" },		Sequence{}, TypeText { "neither" }, _return, endSequence{},
	} }
} };

#pragma mark FileMergeEdit
resource restype_Slate (resid_FileMergeEdit, "") { {
	Slate { "Edit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "save", "" },			Sequence{}, Keypress { kc_S, mf_command }, endSequence{},
		_PageKeys_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_DoJumpSubslate_,
		_TypeSlate_,
	} }
} };

#pragma mark 5 === Archive
resource restype_Slate (resid_Archive, "") { {
	Slate { "Archive",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },			_cancel,
		ExitEvent { "execute", "" },		Keypress { kc_return, 0 },
		Event { "project", "" },			TypeText { "--project " },
		Event { "code", "" },				TypeText { "--code " },
		Event { "repository", "" },			TypeText { "--repository " },
		Event { "folder", "" },				Sequence{}, TypeText { "--folder " }, ResSubslate { resid_Type }, endSequence{},
		Event { "type", "" },				ResSubslate { resid_Type },
		Event { "paste", "" },				Keypress { kc_V, mf_command },
	} }
} };

#pragma mark Clean
resource restype_Slate (resid_Clean, "") { {
	Slate { "Clean",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		_cancel,
		ExitEvent { "execute", "" },	Keypress { kc_enter, 0 },
		Event { "Support", "" },		TypeText { "Support BuildSupport/" },
		Event { "Punkin", "" },			TypeText { "Punkin KidsCorner/" },
		Event { "Accessor", "" },		TypeText { "Accessor " },
		Event { "C doc", "" },			TypeText { "Cdoc " },
		Event { "Developer", "" },		TypeText { "Developer " },
		Event { "Xcode", "" },			TypeText { "Xcode " },
	} }
} };

#pragma mark Build
resource restype_Slate (resid_Build, "") { {
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

#pragma mark 6 === MacPorts
resource restype_Slate (resid_MacPorts, "MacPorts Slate") { {
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

#pragma mark 7 === Apache
#define	_ApacheWrapperPath_ 	"/opt/local/etc/LaunchDaemons/org.macports.apache2/apache2.wrapper"
resource restype_Slate (resid_Apache, "Apache Slate") { {
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
resource restype_Slate (resid_Telnet, "Telnet Slate") { {
	Slate { "Telnet", {
		Event { "get top", "" },			Sequence{}, TypeText { "GET / HTTP/1.1" }, _return, TypeText { "Host: www.candcsoft.com" }, _return, endSequence{},
		Event { "open address", "" },		TypeText { "telnet 192.168.0.104 80" },
		Event { "open subversion", "" },	TypeText { "telnet svn.candcsoft.com 80" },
		Event { "open web", "" },			TypeText { "telnet www.candcsoft.com 80" },
		_TerminalStandards_,
	} },
} };

#pragma mark 8 === Shell
resource restype_Slate (resid_Shell, "Shell Slate") { {
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

resource restype_Slate (resid_XCTerminal, "XcodeTerminal Slate") { {
	Slate { "Terminal",	{
		_SlateGlobals_,
		_LaunchSlate_,
		_TerminalItems_,
		ExitEvent { "quit", "" },	Keypress { kc_Q, mf_command },
		Event { "okay", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
	 } }
} };

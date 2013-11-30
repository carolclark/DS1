// =================================================================================
//	Terminal_C9.r				©2008-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// Git
//	2 Git, Type, Specify, Checkout, Branch, Remote, Difference, Show, Grep, Stash; 3 Add, Commit, Log, Rebase, Tag, Merge, Push, Fetch; 4 Clean; Bisect; Blame; SelectFile, Reset, Browser, FileMerge
// Other
//	1 Standards; Type; Emacs; Defines; 5 Archive; Clean; Build; 6 MacPorts; 7 Apache; Telnet; 8 Shell; 9 Terminal

//#define resid_XCTerminal		resid_Terminal+1
#define resid_Type				resid_Terminal+20
#define resid_Emacs				resid_Terminal+30

#define resid_Build				resid_Terminal+50
#define resid_Clean				resid_Terminal+100
#define resid_Archive			resid_Terminal+150
#define	resid_Shell				resid_Terminal+200
#define resid_MacPorts			resid_Terminal+250
#define resid_Apache			resid_Terminal+300
#define resid_Telnet			resid_Terminal+350

#define resid_Git				resid_Terminal+400
	#define resid_gitType				resid_Git+10
	#define resid_gitSpecify			resid_Git+40
	#define resid_gitCheckout			resid_Git+50
	#define	resid_gitBranch				resid_Git+80
		#define resid_gitShowBranch			resid_gitBranch+1
		#define resid_gitStandardBranch		resid_gitBranch+2
	#define resid_gitRemote				resid_Git+85
	#define	resid_gitDiff				resid_Git+100
	#define resid_gitShow				resid_Git+110
	#define resid_gitGrep				resid_Git+120
	#define	resid_gitStash				resid_Git+150
	#define	resid_gitAdd				resid_Git+170
		#define resid_gitAddInteract		resid_gitAdd+1
	#define resid_gitCommit				resid_Git+200
	#define	resid_gitLog				resid_Git+230
		#define resid_gitReflog				resid_gitLog+1	
	#define resid_gitRebase				resid_Git+240
	#define	resid_gitTag				resid_Git+250
	#define resid_gitMerge				resid_Git+270
	#define resid_gitMergeBase			resid_Git+300
	#define resid_gitPush				resid_Git+320
	#define resid_gitFetch				resid_Git+340
	#define resid_gitClean				resid_Git+360
	#define resid_gitBisect				resid_Git+380
	#define resid_gitBlame				resid_Git+400

	#define resid_gitSelectFile			resid_Git+500
	#define	resid_gitReset				resid_Git+520
	#define resid_gitBrowser			resid_Git+540
	#define resid_FileMerge				resid_Git+550
		#define resid_FileMergeActions		resid_FileMerge+1
		#define resid_FileMergeEdit			resid_FileMerge+2

#define	_cancel			Keypress { kc_C, mf_control }

#pragma mark 1 === Standards
#define	_EmacsKeys_				\
		_DirectionKeys_,		\
		Event { "beginning", "" },	Keypress { kc_A, mf_control },	\
		Event { "end", "" },		Keypress { kc_E, mf_control }

#define _TerminalStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		Event { "execute", "" },	_return,				\
		Event { "return	", "" },	_return,				\
		Event { "save directory", "" }, TypeText { "wd=$(pwd); print \"${wd}\"" },				\
		Event { "restore directory", "" }, TypeText { "cd \"${wd}\"; pwd" },					\
		Event { "password", "" },	TypeText { "6868" },	\
		Event { "source", "" },		TypeText { ". \"${CCDev}\"/bin/" },	\
		Event { "copy", "" },		Keypress { kc_C, mf_command },	\
		Event { "paste", "" },		Keypress { kc_V, mf_command },	\
		ExitEvent { "cancel", "" },	_cancel,				\
		_EmacsKeys_,										\
		Event { "Type", "" },		ResSubslate { resid_Type }

#define	_TerminalItems_			\
		_StarterBase_,			\
		Event { "Type", "" },			ResSubslate { resid_Type },		\
		Event { "copy", "" },			Keypress { kc_C, mf_command },	\
		Event { "paste", "" },			Keypress { kc_V, mf_command },	\
		Event { "execute", "" },		_return,		\
		Event { "cancel", "" },			_cancel,			\
		_EmacsKeys_,											\
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
		Event { "git", "" },			ResSubslate { resid_Git },			\
		Event { "clean", "" },			Sequence{}, TypeText { "cleanProjectTarget " }, ResSubslate { resid_Clean }, endSequence{},		\
		Event { "archive", "" },		Sequence{}, TypeText { "archive " }, ResSubslate { resid_Archive }, endSequence{},		\
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
	_EmacsKeys_,

#pragma mark emacs
resource restype_Slate (resid_Emacs, "") { {
	Slate { "emacs",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "help", "" },			Keypress { kc_H, mf_control },
		Event { "kill", "" },			Keypress { kc_K, mf_control },
		Event { "yank", "" },			Keypress { kc_Y, mf_control },
		Event { "save buffer", "" },	Sequence{}, Keypress { kc_X, mf_control }, Keypress { kc_S, mf_control }, endSequence{},
		Event { "exit", "" },			Sequence{}, Keypress { kc_X, mf_control }, Keypress { kc_C, mf_control }, endSequence{},
		Event { "undo", "" },			Keypress { kc_minus, mf_shift + mf_control },
		Event { "beginning", "" },		Keypress { kc_A, mf_control },
		Event { "end", "" },			Keypress { kc_E, mf_control },
		Event { "top", "" },			Sequence{}, Keypress { kc_X, mf_control }, Keypress { kc_bracket, 0 }, endSequence{},
		Event { "bottom", "" },			Sequence{}, Keypress { kc_X, mf_control }, Keypress { kc_closebracket, 0 }, endSequence{},
		Event { "reverse undo", "" },	Sequence{}, Keypress { kc_G, mf_control }, Keypress { kc_minus, mf_shift + mf_control }, endSequence{},
		Event { "pick out", "" },		Sequence{}, Keypress { kc_fdelete, mf_control }, Keypress { kc_fdelete, mf_control }, Keypress { kc_fdelete, mf_control }, Keypress { kc_fdelete, mf_control }, endSequence{},
		ExitEvent { "yes", "" },		TypeText { "yes" },
		ExitEvent { "no", "" },			TypeText { "no" },
		Event { "clear modifiers", "clear all modifier flags" }, Command { cmd_ClearModifiers },
		_DoJumpSubslate_,
		_DirectionKeys_,
		_ModifierKeys_,
		_WhitespaceKeys_,
		_DeleteKey_,
		_FDeleteKey_,
		_SymbolKeys_,
		_LetterKeys_,
		_NumberKeys_,
	} }
} };

#define	_CurrentBranch_			Event { "current branch", "" },	TypeText { "$cb " }
#define _RevisionNumber_		Event { "revision number", "" }, TypeText { "$vn " },
#define	_GitFile_				Event { "git file", "" },	TypeText { "$gf " }
#define _MyVariable_			Event { "my variable", "" },	TypeText { "$mv " }
#define _CompareMasterCurrent_	Event { "compare", "" },	TypeText { "master..$cb" }
#define _TypeVariable_		_CurrentBranch_,	\
							_RevisionNumber_,	\
							_GitFile_, 			\
							_MyVariable_,		\
							_CompareMasterCurrent_

#define	_Remotes_			\
	Event { "origin", "" },			TypeText { "origin " },				\
	Event { "origin master", "" },	TypeText { "origin/master " },		\
	Event { "laura", "" },			TypeText { "lm " },					\
	Event { "laura master", "" },	TypeText { "lm/master " },			\
	Event { "laura artist", "" },	TypeText { "lm/artist " }

#define	_StandardBranches_	\
	Event { "master", "" },			TypeText { "master " },		\
	Event { "production", "" },		TypeText { "production " },	\
	Event { "artist", "" },			TypeText { "artist " },		\
	Event { "origin", "" },			TypeText { "origin " },		\
	Event { "origin master", "" },	TypeText { "origin/master " },	\
	Event { "release", "" },		Sequence{}, TypeText { "release-" }, ResSubslate { resid_gitType }, endSequence{}, 	\
	Event { "hotfix", "" },			Sequence{}, TypeText { "hotfix-" }, ResSubslate { resid_gitType }, endSequence{}

#define	_specifyWhich	Sequence{}, Keypress { kc_delete, 0 }, TypeText { "@{" }, ResSubslate { resid_gitSpecify }, endSequence{}

resource restype_Slate (resid_Type, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeTermItems_
	} }
} };

#pragma mark 2 === Git
// inside: Standards; 1 Git; 2 Type; 3 Specify; 4 Checkout; 5 Branch; Show-Branch; Remote; 6 Difference; 7 Show; 8 Grep; 9 Stash
#define _GitStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		ExitEvent { "cancel", "" },		_cancel,						\
		ExitEvent { "execute", "" },	_return,						\
		Event { "return	", "" },		_return,						\
		Event { "copy", "" },			Keypress { kc_C, mf_command },	\
		Event { "paste", "" },			Keypress { kc_V, mf_command },	\
		_EmacsKeys_,													\
		Event { "less more", "" },		Keypress { kc_space, 0 },		\
		Event { "less end", "" },		Keypress { kc_Q, 0 },			\
		Event { "continue", "" },		Keypress { kc_space, 0 },		\
		Event { "end display", "" },	Keypress { kc_Q, 0 },			\
		Event { "type", "" },			ResSubslate { resid_gitType }

#pragma mark 1 -- Git
resource restype_Slate (resid_Git, "") { {
	Slate { "Git",	{
		_GitStandards_,
		Event { "specify", "" },		_specifyWhich,
		Event { "go back", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "FileMerge", "" },		Sequence{}, Launch { DevApps_"XCode.app/Contents/Applications/FileMerge.app", 0 }, ResSubslate { resid_FileMerge },  endSequence{},
		Event { "status", "" },			Sequence{}, TypeText { "git status" }, _return, endSequence{},
		Event { "checkout", "" },		Sequence{}, TypeText { "git checkout " }, ResSubslate { resid_gitCheckout }, endSequence{},
		Event { "branch", "" },			Sequence{}, TypeText { "git branch " }, ResSubslate { resid_gitBranch }, endSequence{},
		Event { "show branch", "" },	Sequence{}, TypeText { "git show-branch " }, ResSubslate { resid_gitShowBranch }, endSequence{},
		Event { "remote", "" },			Sequence{}, TypeText { "git remote " }, ResSubslate { resid_gitRemote }, endSequence{},
		Event { "difference", "" },		Sequence{}, TypeText { "git difftool " }, ResSubslate { resid_gitDiff }, endSequence{},
		Event { "show", "" },			Sequence{}, TypeText { "git show " }, ResSubslate { resid_gitShow }, endSequence{},
		Event { "grep", "" },			Sequence{}, TypeText { "git grep " }, ResSubslate { resid_gitGrep }, endSequence{},
		Event { "stash away", "" },		Sequence{}, TypeText { "git stash " }, ResSubslate { resid_gitStash }, endSequence{},
		Event { "add files", "" },		Sequence{}, TypeText { "git add " }, ResSubslate { resid_gitAdd }, endSequence{},
		Event { "commit", "" },			Sequence{}, TypeText { "git commit " }, ResSubslate { resid_gitCommit }, endSequence{},
		Event { "revert", "" },			Sequence{}, TypeText { "git revert HEAD" }, _left, ResSubslate { resid_gitType },  endSequence{},
		Event { "log", "" },			Sequence{}, TypeText { "git log " }, ResSubslate { resid_gitLog }, endSequence{},
		Event { "log oneline", "" },	Sequence{}, TypeText { "git lg " }, ResSubslate { resid_gitLog }, endSequence{},
		Event { "reflog", "" },			Sequence{}, TypeText { "git reflog " }, ResSubslate { resid_gitReflog }, endSequence{},
		Event { "rebase", "" },			Sequence{}, TypeText { "git rebase " }, ResSubslate { resid_gitRebase }, endSequence{},
		Event { "tag", "" },			Sequence{}, TypeText { "git tag " }, ResSubslate { resid_gitTag }, endSequence{},
		Event { "merge", "" },			Sequence{}, TypeText { "git merge --no-ff " }, ResSubslate { resid_gitMerge }, endSequence{},
		Event { "merge base", "" },		Sequence{}, TypeText { "git merge-base" }, ResSubslate { resid_gitMergeBase }, endSequence{},
		Event { "push", "" },			Sequence{}, TypeText { "git push " }, ResSubslate { resid_gitPush }, endSequence{},
		Event { "fetch updates", "" },	Sequence{}, TypeText { "git fetchup " }, _return, endSequence{},
		Event { "reset", "" },			Sequence{}, TypeText { "git reset " }, ResSubslate { resid_gitReset }, endSequence{},
		Event { "clean files", "" },	Sequence{}, TypeText { "git clean " }, ResSubslate { resid_gitClean }, endSequence{},
		Event { "bisect", "" },			Sequence{}, TypeText { "git bisect " }, ResSubslate { resid_gitBisect }, endSequence{},
		Event { "blame", "" },			Sequence{}, TypeText { "git blame " }, ResSubslate { resid_gitBlame }, endSequence{},
		Event { "set my variable", "" },	TypeText { "mv=" },
		Event { "show message file", "" },	Sequence{}, TypeText { "cat $CCDev/tmp/gitmessage.txt" }, _return, endSequence{},
		Event { "make executable", "" },	Sequence{}, TypeText { "chmod a+x " }, ResSubslate { resid_Type }, endSequence{},
		Event { "list markers", "" },		Sequence{}, TypeText { "cat $gf | grep '#pragma mark' | sed 's|#pragma mark ||'" }, _return, endSequence{},
		Event { "list tree", "" },			TypeText { "git ls-tree -r " },
		Event { "show", "" },				TypeText { "git show --pretty=\"format:\" --name-only " },
		Event { "set directory", "" },	Subslate { "set directory" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },		Sequence{}, TypeText { "cd ${DEV}/Support" }, _return, endSequence{},
			ExitEvent { "Accessor", "" },		Sequence{}, TypeText { "cd ${DEV}/Accessor" }, _return, endSequence{},
			ExitEvent { "Punkin", "" },			Sequence{}, TypeText { "cd ${DEV}/Punkin" }, _return, endSequence{},
			endSubslate{},
		Event { "print directory", "" },	Sequence{}, TypeText { "pwd" }, _return, endSequence{},
		Event { "print variables", "" },	TypeText { "print DEV: ${DEV}; print CCDev: ${CCDev}; print mv: $mv; print cb: $cb; print vn: $vn print gf: $gf" },
		Event { "print", "" },				Sequence{}, TypeText { "print " }, ResSubslate { resid_Type }, endSequence{},
		Event { "select file", "" },		Sequence{}, TypeText { "read lineno; gf=`cat $CCDev/tmp/gitstatus | grep \"^$lineno\" | cut -c 5-`; print $gf" }, _return, ResSubslate { resid_gitSelectFile }, endSequence{},
		Event { "parse revision", "" },		TypeText { "git rev-parse " },
		Event { "browser", "" },			Sequence{}, TypeText { "gitk" }, _return, ResSubslate { resid_gitBrowser }, endSequence{},
		Event { "backup issues", "" },		TypeText { "ghubUtil --backupIssues" },
	} }
} };

#pragma mark 2 -- Type
resource restype_Slate (resid_gitType, "Type") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeTermItems_,
		_TypeVariable_,
		Event { "branch", "" },			ResSubslate { resid_gitStandardBranch },
		Event { "shell", "" },			TypeText { "sealsea v3ejc 6868" },
		Event { "version 3", "" },		TypeText { "4YZHqz5pq1" },
		Event { "dry run", "" },		TypeText { "--dry-run " },
		Event { "source", "" },			TypeText { ". \"${CCDev}\"/bin/" },
		Event { "github path", "" },	TypeText { "https://carolclark@github.com/carolclark " },
	} }
} };

#pragma mark 3 -- Specify
resource restype_Slate (resid_gitSpecify, "") { {
	Slate { "specify",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },	TypeText { "} " },
		ExitEvent { "exit", "" },	NilAction{},
		Event { "1", "" },			TypeText { "1" },
		Event { "2", "" },			TypeText { "2" },
		Event { "3", "" },			TypeText { "3" },
		Event { "4", "" },			TypeText { "4" },
		Event { "5", "" },			TypeText { "5" },
		Event { "6", "" },			TypeText { "6" },
		Event { "7", "" },			TypeText { "7" },
		Event { "8", "" },			TypeText { "8" },
		Event { "9", "" },			TypeText { "9" },
		Event { "0", "" },			TypeText { "0" },
	} }
} };

#pragma mark 4 -- Checkout
resource restype_Slate (resid_gitCheckout, "") { {
	Slate { "checkout",	{
		Event { "new branch", "" },		TypeText { "-b " },
		Event { "head", "" },			Sequence{}, TypeText { "HEAD " }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "master", "" },			TypeText { "master " },
		Event { "path ", "" },			TypeText { "-- " },
		Event { "specify", "" },		_specifyWhich,
		_TypeVariable_,
		_GitStandards_,
		_StandardBranches_,
		_Remotes_,
	} }
} };

#pragma mark 5 -- Branch
resource restype_Slate (resid_gitBranch, "") { {
	Slate { "branch",	{
		ExitEvent { "list", "" },			_return,
		ExitEvent { "list all", "" },		Sequence{}, TypeText { "-a " }, _return, endSequence{},
		ExitEvent { "get current", "" },	Sequence{}, _cancel, TypeText { "cb=$(git branch | grep \"*\" | sed \"s/* //\"); print $cb" }, _return, endSequence{},
		ExitEvent { "print current", "" },	Sequence{}, _cancel, TypeText { "print $cb" }, _return, endSequence{},
		Event { "remotes", "" },			TypeText { "--remotes " },
		Event { "all", "" },				TypeText { "--all " },
		Event { "unmerged", "" },			TypeText { "--no-merged " },
		Event { "verbose", "" },			TypeText { "--verbose " },
		Event { "move", "" },				TypeText { "--move " },
		Event { "rename", "" },				TypeText { "--move " },
		Event { "delete", "" },				TypeText { "--delete " },
		Event { "master", "" },				TypeText { "master " },
		_GitStandards_,
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
	} }
} };

#pragma mark gitStandardBranch
resource restype_Slate (resid_gitStandardBranch, "") { {
	Slate { "gitStandardBranch",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_StandardBranches_,
	} }
} };

#pragma mark ShowBranch
resource restype_Slate (resid_gitShowBranch, "") { {
	Slate { "showBranch",	{
		Event { "all", "" },			TypeText { "--all " },
		Event { "topological", "" },	TypeText { "--topo-order " },
		Event { "merge base", "" },		TypeText { "--merge-base " },
		_GitStandards_,
		_TypeVariable_,
	} }
} };

#pragma mark gitRemote
resource restype_Slate (resid_gitRemote, "") { {
	Slate { "remote",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "show", "" },			TypeText { "show " },
		Event { "update", "" },			TypeText { "update " },
		Event { "verbose", "" },		TypeText { "--verbose " },
		Event { "list", "" },			TypeText { "--verbose " },
		Event { "preserve merge", "" },	TypeText { "--preserve-merges " },
		_GitStandards_,
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
	} }
} };

#pragma mark 6 -- Difference
resource restype_Slate (resid_gitDiff, "") { {
	Slate { "diff",	{
		_GitStandards_,
		Event { "file merge", "" },		Sequence{}, _return, ResSubslate { resid_FileMerge }, endSequence{},
		Event { "cached", "between staged and head" },			TypeText { "--cached " },
		Event { "standard", "between staged and unstaged" },	NilAction{},
		Event { "top head", "both staged and unstaged" },		TypeText { "HEAD@{0} " },
		Event { "head", "" },			TypeText { "HEAD " },
		Event { "stash", "" },			TypeText { "stash " },
		Event { "specify", "" },		_specifyWhich,
		Event { "top stash", "" },		TypeText { "stash@{0} " },
		Event { "between", "" },		Sequence{}, Keypress { kc_delete, 0 }, TypeText { ".." }, endSequence{},
		Event { "ancestor", "" },		Sequence{}, Keypress { kc_delete, 0 }, TypeText { "..." }, endSequence{},
		ExitEvent { "list files", "" },	Sequence{}, TypeText { "--name-status | grep -n \"[a-z,A-Z]\" > $CCDev/tmp/gitstatus; cat $CCDev/tmp/gitstatus" }, _return, endSequence{},
		Event { "add path", "" },		TypeText { "-- " },
		Event { "master", "" },			TypeText { "master " },
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
		Event { "name status", "" },	TypeText { "--name-status " },
		Event { "statistics", "" },		TypeText { "--stat " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "graph from top", "" },	TypeText { "--graph --topo-order " },
		Event { "check", "" },			TypeText { "--check " },
		_NumberKeys_,
	} }
} };

#pragma mark 7 -- Show
resource restype_Slate (resid_gitShow, "") { {
	Slate { "show",	{
		Event { "name only", "" },		TypeText { "--name-only " },
		Event { "oneline", "" },		TypeText { "--oneline " },
		Event { "head", "" },			TypeText { "HEAD " },
		Event { "stash", "" },			TypeText { "stash " },
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
		Event { "specify", "" },		_specifyWhich,
		_GitStandards_,
	} }
} };

#pragma mark 8 -- Grep
resource restype_Slate (resid_gitGrep, "") { {
	Slate { "grep",	{
		_GitStandards_,
		Event { "cached", "" },			TypeText { "--cached " },
		Event { "untracked", "" },		TypeText { "--untracked " },
		Event { "skip binary", "" },	TypeText { "-I " },
		Event { "depth", "" },			TypeText { "--max-depth " },
		Event { "word", "" },			TypeText { "--word-regexp " },
		Event { "invert", "" },			TypeText { "--invert-match " },
		Event { "number", "" },			TypeText { "--line-number " },
		Event { "name only", "" },		TypeText { "--name-only " },
		Event { "count", "" },			TypeText { "--count " },
		Event { "heading", "" },		TypeText { "--heading " },
		Event { "show function", "" },	TypeText { "--show-function " },
		Event { "context", "" },		TypeText { "--context " },
		Event { "pattern", "" },		TypeText { "-e " },
		Event { "and", "" },			TypeText { "--and " },
		Event { "or", "" },				TypeText { "--or " },
		Event { "not", "" },			TypeText { "--not " },
		Event { "path ", "" },			TypeText { "-- " },
		Event { "top head", "" },		TypeText { "HEAD@{0} " },
		Event { "head", "" },			Sequence{}, TypeText { "HEAD " }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "top stash", "" },		TypeText { "stash@{0} " },
		Event { "stash", "" },			Sequence{}, TypeText { "stash@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
	} }
} };

#pragma mark 9 -- Stash
resource restype_Slate (resid_gitStash, "") { {
	Slate { "stash",	{
		_GitStandards_,
		Event { "save", "" },			TypeText { "save " },
		Event { "keep index", "" },		TypeText { "--keep-index " },
		Event { "patch", "" },			TypeText { "--patch " },
		Event { "apply", "" },			TypeText { "apply " },
		Event { "drop", "" },			TypeText { "drop " },
		ExitEvent { "list", "" },		Sequence{}, TypeText { "list " }, _return, endSequence{},
		Event { "show", "" },			TypeText { "show " },
		Event { "pop to branch", "" },	TypeText { "branch " },
		Event { "stash", "" },			Sequence{}, TypeText { "stash@{}" }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "top stash", "" },		TypeText { "stash@{0} " },
		_TypeSlate_,
	} }
} };

#pragma mark 3 === Add
// inside: Add; 1 Commit; 2 Log; 3 Rebase; 4 Tag; 5 Merge; 6 Push; 7 Fetch
resource restype_Slate (resid_gitAdd, "") { {
	Slate { "Add",	{
		Event { "select", "" },			Sequence{}, TypeText { "--all --interactive" }, _return, ResSubslate { resid_gitAddInteract }, endSequence{},
		Event { "update", "" }, 		TypeText { "--update" },
		Event { "all", "" }, 			TypeText { "--all" },
		Event { "dot", "" },			TypeText { "." },
		Event { "path ", "" },			TypeText { "-- " },
		_TypeVariable_,
		_GitStandards_,
		_StandardBranches_,
		_Remotes_,
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
		Event { "message file", "" },	Sequence{}, TypeText { "-F \"${CCDev}/tmp/gitmessage.txt" }, Keypress { kc_quote, mf_shift }, endSequence{},
		Event { "message", "" },		Sequence{}, TypeText { "-m \"" }, ResSubslate { resid_gitType }, endSequence{},
		Event { "amend", "" },			TypeText { "--amend " },
		Event { "emacs", "" },			ResSubslate { resid_Emacs },
	} }
} };

#pragma mark 2 -- Log
resource restype_Slate (resid_gitLog, "") { {
	Slate { "log",	{
		_GitStandards_,
		Event { "master", "" },			TypeText { "master " },
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
		Event { "head", "" },			TypeText { "HEAD " },
		Event { "stash", "" },			TypeText { "stash " },
		Event { "between", "" },		Sequence{}, Keypress { kc_delete, 0 }, TypeText { ".." }, endSequence{},
		Event { "ancestor", "" },		Sequence{}, Keypress { kc_delete, 0 }, TypeText { "..." }, endSequence{},
		Event { "string", "" },			Sequence{}, TypeText { "-S''" }, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "add path", "" },		TypeText { "-- " },
		Event { "oneline", "" },		TypeText { "--oneline " },
		Event { "before", "" },			TypeText { "--before " },
		Event { "after", "" },			TypeText { "--after " },
		Event { "no merge", "" },		TypeText { "--no-merges " },
		Event { "statistics", "" },		TypeText { "--stat " },
		Event { "reflog", "" },			TypeText { "--walk-reflogs " },
		Event { "graph", "" },			TypeText { "--graph " },
		Event { "topological", "" },	TypeText { "--topo-order " },
		Event { "not", "" },			TypeText { "--not " },
		Event { "left right", "" },		TypeText { "--left-right " },
		Event { "unmerged branch", "" },	TypeText { "git log --graph --left-right --cherry-pick --oneline master..." },
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
		_TypeVariable_,
		_GitStandards_,
	} }
} };

#pragma mark 3 -- Rebase
resource restype_Slate (resid_gitRebase, "") { {
	Slate { "Rebase",	{
		Event { "abort", "" },			TypeText { "--abort " },
		Event { "continue", "" },		TypeText { "--continue " },
		Event { "preserve merges", "" }, TypeText { "--preserve-merges " },
		Event { "upstream", "" },		TypeText { "@{u} " },
		Event { "start", "" },			TypeText { "-i HEAD~" },
		Event { "1", "" },				Keypress { kc_1, 0 },
		Event { "2", "" },				Keypress { kc_2, 0 },
		Event { "3", "" },				Keypress { kc_3, 0 },
		Event { "4", "" },				Keypress { kc_4, 0 },
		Event { "5", "" },				Keypress { kc_5, 0 },
		Event { "6", "" },				Keypress { kc_6, 0 },
		Event { "7", "" },				Keypress { kc_7, 0 },
		Event { "8", "" },				Keypress { kc_8, 0 },
		Event { "9", "" },				Keypress { kc_9, 0 },
		Event { "0", "" },				Keypress { kc_0, 0 },
		Event { "emacs", "" },			ResSubslate { resid_Emacs },
		_GitStandards_,
		_TypeVariable_,
	} }
} };

#pragma mark 4 -- Tag
resource restype_Slate (resid_gitTag, "") { {
	Slate { "tag",	{
		ExitEvent { "annotate ", "" },		Sequence{}, Keypress { kc_C, mf_control }, TypeText { "git for-each-ref refs/tags --sort=-taggerdate -- format=\"%(objectname:short) %(taggerdate:short) %(refname:short)%09%09%(subject) %(body)\"" }, endSequence{},
		ExitEvent { "list ", "" },	_return,
		Event { "show", "" },				Sequence{}, _cancel, TypeText { "git show --name-status " }, ResSubslate { resid_gitType }, endSequence{},
		Event { "make", "" },				Sequence{}, TypeText { "-a '"}, ResSubslate { resid_gitType }, endSequence{},
		Event { "add message", "" },		Sequence{}, TypeText { "' -m \"\""}, _left, ResSubslate { resid_gitType }, endSequence{},
		Event { "delete", "" },				Sequence{}, TypeText { "-d " }, ResSubslate { resid_gitType }, endSequence{},
		_TypeVariable_,
		_GitStandards_,
	} }
} };

#pragma mark 5 -- Merge
resource restype_Slate (resid_gitMerge, "") { {
	Slate { "Merge",	{
		Event { "no fast forward", "" },	TypeText { "--no-ff " },
		Event { "no commit", "" },			TypeText { "--no-commit " },
		Event { "abort", "" },				TypeText { "--abort " },
		Event { "tool", "" },				Sequence{}, Keypress { kc_delete, 0 }, TypeText { "tool " }, endSequence{},
		Event { "file merge", "" },			Sequence{}, _return, ResSubslate { resid_FileMerge }, endSequence{},
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
		_GitStandards_,
	} }
} };

#pragma mark gitMergeBase
resource restype_Slate (resid_gitMergeBase, "") { {
	Slate { "merge-base",	{
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
		Event { "specify", "" },		_specifyWhich,
		_GitStandards_,
	} }
} };

#pragma mark 6 -- Push
#pragma mark Push
resource restype_Slate (resid_gitPush, "") { {
	Slate { "Push",	{
		Event { "tags", "" },			TypeText { "--tags " },
		Event { "authorize", "" },		TypeText { "gh6868cc" },
		Event { "set upstream", "" },	TypeText { "--set-upstream " },
		_StandardBranches_,
		_GitStandards_,
	} }
} };

#pragma mark 7 -- Fetch
resource restype_Slate (resid_gitFetch, "") { {
	Slate { "Fetch",	{
		_GitStandards_,
	} }
} };

#pragma mark 4 === Clean
// inside: Clean 1 Bisect; 2 Blame; 3 SelectFile; 4 Reset; 5 Browser; 6 FileMerge
#pragma mark Clean
resource restype_Slate (resid_gitClean, "") { {
	Slate { "Clean",	{
		_GitStandards_,
		Event { "dry run", "" },		TypeText { "--dry-run " },
		Event { "do clean", "" },		TypeText { "--force " },
	} }
} };

#pragma mark Bisect
resource restype_Slate (resid_gitBisect, "") { {
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

#pragma mark gitBlame
resource restype_Slate (resid_gitBlame, "") { {
	Slate { "Blame",	{
		Event { "lines", "" },			TypeText { "-L " },
		Event { "moved", "" },			TypeText { "-M " },
		Event { "changed", "" },		TypeText { "-C " },
		Event { "comma", "" },			Keypress { kc_comma, 0 },
		Event { "space", "" },			Keypress { kc_space, 0 },
		Event { "1", "" },				Keypress { kc_1, 0 },
		Event { "2", "" },				Keypress { kc_2, 0 },
		Event { "3", "" },				Keypress { kc_3, 0 },
		Event { "4", "" },				Keypress { kc_4, 0 },
		Event { "5", "" },				Keypress { kc_5, 0 },
		Event { "6", "" },				Keypress { kc_6, 0 },
		Event { "7", "" },				Keypress { kc_7, 0 },
		Event { "8", "" },				Keypress { kc_8, 0 },
		Event { "9", "" },				Keypress { kc_9, 0 },
		Event { "0", "" },				Keypress { kc_0, 0 },
		_GitStandards_,
		_TypeVariable_,
		_StandardBranches_,
		_Remotes_,
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
		_GitStandards_,
		Event { "dry run", "" },		TypeText { "--dry-run " },
		Event { "soft", "" },			TypeText { "--soft " },
		Event { "last commit", "" },	TypeText { "HEAD^ " },
		Event { "discard changes", "" },	Subslate { "discard changes" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "cancel", "" },		_cancel,
			Event { "reset", "" },			TypeText { "git reset " },
			Event { "hard", "" },			TypeText { "--hard " },
			Event { "head", "" },			Sequence{}, TypeText { "HEAD " }, _left, ResSubslate { resid_gitType }, endSequence{},
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
		Event { "north", "" },				_up,
		Event { "down", "" },				_down,
		_IMouseSlate_,
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

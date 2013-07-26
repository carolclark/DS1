// =================================================================================
//	GitHub_C9.h					©2013 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1

/* resid_ */
#define resid_MyPage				resid_GitHub+100
#define resid_Repository			resid_GitHub+200
	#define resid_RepoButtons			resid_Repository+1
		#define resid_RepoBtn_Label			resid_Repository+2
#define resid_DashIssues			resid_GitHub+300
#define resid_RepoIssues			resid_GitHub+400
#define resid_OpenIssue				resid_GitHub+500
#define resid_EditIssue				resid_GitHub+600

#define resid_TypeGitHub			resid_GitHub+700
	#define resid_TypeSpecialGitHub		resid_TypeGitHub+1

/*
dashboard
	DIssues > dashboard (IssueListBar open.closed.sort; project filter)
		Issue:Open < click issues; close subslate
			Edit: < Cancel/GoBack; Update
	Repo < .
		RIssues < repo (IssueListBar open.closed.sort; IssueTabBar open/close.label.assign.milestone; milestone and label filters; list selectable)
			Issue:Open < click issues; close subslate
	MyPage < .
		Repo < .
*/
#define	_ghup_				Keypress { kc_K, 0 }
#define	_ghdn_				Keypress { kc_J, 0 }
#define _ClickDashboard		Click { 1, -475, 90, _window, _topCenter }

#define	_GitHubStandards_		\
		Event { "next", "" },			Keypress { kc_tab, mf_option },		\
		Event { "previous", "" },		Keypress { kc_tab, mf_option + mf_shift },		\
		Event { "enter", "" },			Keypress { kc_enter, 0 },		\
		Event { "refresh", "" },		Keypress { kc_R, mf_command },		\
		Event { "address", "" },		Click { 1, 0, 35, _window, _topCenter },		\
		Event { "copy address", "" },	Sequence{}, Click { 1, 0, 35, _window, _topCenter }, Keypress { kc_A, mf_command }, Keypress { kc_C, mf_command }, endSequence{},		\
		Event { "go back", "" },		Keypress { kc_bracket, mf_command },		\
		Event { "go forward", "" },		Keypress { kc_closebracket, mf_command },		\
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },	\
		Event { "page north", "" },		Keypress { kc_pageup, 0 },		\
		Event { "page top", "" },		Keypress { kc_home, 0 },		\
		Event { "page end", "" },		Keypress { kc_end, 0 },		\
		Event { "help", "" },			Keypress { kc_slash, 0 },		\
		Event { "search GitHub", "" },	Keypress { kc_S, 0 },		\
		Event { "north", "" },			_ghup_,		\
		Event { "down", "" },			_ghdn_,		\
		_SlateGlobals_,		\
		_WindowSlate_,		\
		_IMouseSlate_

#pragma mark github
#define	_GitHubSlate_	\
resource restype_Slate (_GitHubID_, "") { {	\
	Slate { "gh",	{	\
		ExitEvent { "okay", "" },		Launch { _homeApp, 0 },	\
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { _homeApp, 0 }, endSequence{},	\
		Event { "dashboard", "" },		_ClickDashboard,	\
		Event { "news feed", "" },		Sequence{}, Click { 1, -346, 195, _window, _topCenter }, endSequence{},	\
		Event { "issues", "" },			Sequence{}, Click { 1, 125, 195, _window, _topCenter }, ResSubslate { resid_DashIssues }, endSequence{},	\
		Event { "my page", "" },		Sequence{}, Click { 1, 313, 90, _window, _topCenter }, ResSubslate { resid_MyPage }, endSequence{},	\
		Event { "repo 1", "" },			Sequence{}, Click { 1, 200, 660, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "repo 2", "" },			Sequence{}, Click { 1, 200, 691, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "repo 3", "" },			Sequence{}, Click { 1, 200, 722, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "repo 4", "" },			Sequence{}, Click { 1, 200, 753, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "broadcast", "" },		Subslate { "broadcast" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "hide", "" },	Click { 1, 172, 609, _window, _topCenter },	\
			Event { "show", "" },		Click { 1, 172, 558, _window, _topCenter },	\
			Event { "show all", "" },	Click { 1, 409, 558, _window, _topCenter },	\
			Event { "page top", "" },	Keypress { kc_home, 0 },	\
			Event { "page end", "" },	Keypress { kc_end, 0 },	\
			Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
			Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
			Event { "go back", "" },	Keypress { kc_bracket, mf_command },	\
			endSubslate{},	\
		Event { "slate", "" },			Subslate { "slate" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "my page", "" },		ResSubslate { resid_MyPage },	\
			ExitEvent { "dash issues", "" },	ResSubslate { resid_DashIssues },	\
			ExitEvent { "repository", "" },		ResSubslate { _GitHubRepoID_ },	\
			ExitEvent { "repo issues", "" },	ResSubslate { resid_RepoIssues },	\
			ExitEvent { "open issue", "" },		ResSubslate { resid_OpenIssue },	\
			endSubslate{},	\
		_GitHubStandards_,	\
	} }	\
} };

#pragma mark 2 --- Repository
#define	_GitHubRepoSlate_	\
resource restype_Slate (_GitHubRepoID_, "") { {	\
	Slate { "repo",	{	\
		ExitEvent { "okay", "" },		Keypress { kc_bracket, mf_command },	\
		ExitEvent { "exit", "" },		NilAction{},	\
		Event { "pulse", "" },			Click { 1, --440, 330, _window, _topCenter },	\
		Event { "code", "" },			Click { 1, -370, 190, _window, _topCenter },	\
			Event { "files", "" },			Click { 1, -223, 330, _window, _topCenter },	\
			Event { "commits", "" },		Click { 1, -180, 330, _window, _topCenter },	\
			Event { "branches", "" },		Click { 1, -100, 330, _window, _topCenter },	\
		Event { "network", "" },		Click { 1, -240, 190, _window, _topCenter },	\
		Event { "pull requests", "" },	Click { 1, -120, 190, _window, _topCenter },	\
		Event { "issues", "" },			Sequence{}, Click { 1, 10, 188, _window, _topCenter }, ResSubslate { resid_RepoIssues }, endSequence{},	\
		Event { "wiki", "" },			Click { 1, 145, 190, _window, _topCenter },	\
		Event { "graphs", "" },			Click { 1, 260, 190, _window, _topCenter },	\
		Event { "settings", "" },		Click { 1, 395, 190, _window, _topCenter },	\
		Event { "clear filter", "" },	Click { 1, -170, 298, _window, _topCenter },	\
		_GitHubStandards_,	\
	} }	\
} };

#define _IssueBar_	\
	Event { "paste", "" },				Keypress { kc_V, mf_command + mf_option + mf_shift },	\
	Event { "browse milestones", "" },	Click { 1, -290, 250, _window, _topCenter },		\
	Event { "search", "" },				Sequence{}, Click { 1, -355, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},		\
	Event { "new issue", "" },			Sequence{}, Click { 1, 415, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},			\
	Event { "submit issue", "" },		Sequence{}, Click { 1, 123, 700, _window, _topCenter }, ResSubslate { resid_OpenIssue },  endSequence{}

#pragma mark OpenIssue
#define _GitHubOpenIssueSlate_		\
resource restype_Slate (resid_OpenIssue, "") { {	\
	Slate { "open",	{	\
		ExitEvent { "okay", "back to issue list" },		Click { 1, -388, 290, _window, _topCenter },	\
		ExitEvent { "exit", "" },		NilAction{},	\
		Event { "back to host", "" },	Launch { _homeApp, _homeAppSlate },	\
		_IssueBar_,	\
		Event { "edit", "" },			Sequence{}, Click { 1, 300, 355, _window, _topCenter }, ResSubslate { resid_EditIssue }, endSequence{},	\
		Event { "assign", "" },			Sequence{}, Click { 1, -207, 425, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},	\
		Event { "milestone", "" },		Sequence{}, Click { 1, 306, 425, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},	\
		Event { "label", "" },			Sequence{}, Click { 1, 440, 425, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},	\
		_GitHubStandards_,	\
	} }	\
} };

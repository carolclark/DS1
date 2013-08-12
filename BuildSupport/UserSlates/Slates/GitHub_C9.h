// =================================================================================
//	GitHub_C9.h					©2013 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1

/* resid_ */
#define resid_MyPage				resid_GitHub+100
#define resid_Repository			resid_GitHub+200
	#define resid_IssueActions			resid_Repository+1
		#define resid_Action_Label			resid_Repository+2
	#define resid_RepoCode				resid_Repository+10
	#define resid_RepoTabDefault		resid_Repository+15
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
#define _SearchAll			Sequence{}, Keypress { kc_S, 0 }, ResSubslate { resid_TypeGitHub }, endSequence{}
#define _SearchCurrent		Sequence{}, Keypress { kc_slash, 0 }, ResSubslate { resid_TypeGitHub }, endSequence{}
#define _ClickDashboard		Click { 1, -475, 90, _window, _topCenter }

#define	_GitHubStandards_		\
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
		Event { "north", "" },			_ghup_,		\
		Event { "down", "" },			_ghdn_,		\
		_SlateGlobals_,		\
		_WindowSlate_,		\
		_IMouseSlate_

#pragma mark GitHub
#define	_GitHubSlate_	\
#define	gh_row1	675	\
#define gh_rsp	31	\
#define	gh_h	173	\
resource restype_Slate (_GitHubID_, "") { {	\
	Slate { "gh",	{	\
		ExitEvent { "okay", "" },		Launch { _homeApp, 0 },	\
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { _homeApp, 0 }, endSequence{},	\
		Event { "search", "" },			_SearchAll,		\
		Event { "dashboard", "" },		_ClickDashboard,	\
		Event { "news feed", "" },		Sequence{}, Click { 1, -346, 220, _window, _topCenter }, endSequence{},	\
		Event { "issues", "" },			Sequence{}, Click { 1, 125, 220, _window, _topCenter }, ResSubslate { resid_DashIssues }, endSequence{},	\
		Event { "my page", "" },		Sequence{}, Click { 1, 313, 90, _window, _topCenter }, ResSubslate { resid_MyPage }, endSequence{},	\
		Event { "repo 1", "" },			Sequence{}, Click { 1, gh_h, gh_row1+gh_rsp*0, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "repo 2", "" },			Sequence{}, Click { 1, gh_h, gh_row1+gh_rsp*0, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "repo 3", "" },			Sequence{}, Click { 1, gh_h, gh_row1+gh_rsp*0, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "repo 4", "" },			Sequence{}, Click { 1, 200, 753, _window, _topCenter }, ResSubslate { _GitHubRepoID_ },  endSequence{},	\
		Event { "broadcast", "" },		Subslate { "broadcast" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "hide", "" },	Click { 1, 183, 620, _window, _topCenter },	\
			Event { "show", "" },		Click { 1, 210, 575, _window, _topCenter },	\
			Event { "show all", "" },	Click { 1, 447, 620, _window, _topCenter },	\
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
#define _RepoHeaderItems_	\
		ExitEvent { "log out", "" },		Click { 1, 480, 90, _window, _topCenter },	\
		ExitEvent { "repository", "" },		Click { 1, -320, 145, _window, _topCenter },	\
		Event { "search", "" },				_SearchCurrent

#define	_GitHubRepoSlate_	\
#define	ri_h		365	\
#define	ri_row1		235	\
#define ri_rsp		41	\
#define	ri_sep		14	\
resource restype_Slate (_GitHubRepoID_, "") { {	\
	Slate { "repo",	{	\
		ExitEvent { "okay", "" },			_ClickDashboard,	\
		ExitEvent { "back to host", "" },	Launch { _homeApp, _homeAppSlate },	\
		ExitEvent { "exit", "" },			NilAction{},	\
		_RepoHeaderItems_,	\
		Event { "code", "" },				Sequence{}, Keypress { kc_G, 0 }, Keypress { kc_C, 0 },  ResSubslate { resid_RepoCode }, endSequence{},	\
		Event { "issues", "" },				Sequence{}, Keypress { kc_G, 0 }, Keypress { kc_I, 0 }, ResSubslate { resid_RepoIssues }, endSequence{},	\
		Event { "pull request", "" },		Sequence{}, Keypress { kc_G, 0 }, Keypress { kc_P, 0 }, ResSubslate { resid_RepoTabDefault }, endSequence{},	\
		Event { "wiki", "" },				Sequence{}, Click { 1, ri_h, ri_row1 + 3*ri_rsp + 0*ri_sep, _window, _topCenter }, ResSubslate { resid_RepoTabDefault }, endSequence{},	\
		Event { "pulse", "" },				Sequence{}, Click { 1, ri_h, ri_row1 + 4*ri_rsp + 1*ri_sep, _window, _topCenter }, ResSubslate { resid_RepoTabDefault }, endSequence{},	\
		Event { "graph", "" },				Sequence{}, Click { 1, ri_h, ri_row1 + 5*ri_rsp + 1*ri_sep, _window, _topCenter }, ResSubslate { resid_RepoTabDefault }, endSequence{},	\
		Event { "network", "" },			Sequence{}, Click { 1, ri_h, ri_row1 + 6*ri_rsp + 1*ri_sep, _window, _topCenter }, ResSubslate { resid_RepoTabDefault }, endSequence{},	\
		Event { "setting", "" },			Sequence{}, Click { 1, ri_h, ri_row1 + 7*ri_rsp + 2*ri_sep, _window, _topCenter }, ResSubslate { resid_RepoTabDefault }, endSequence{},	\
		_GitHubStandards_,	\
	} }	\
} };

#define _IssueBar_	\
	Event { "browse issues", "" },		Click { 1, -400, 220, _window, _topCenter },		\
	Event { "browse milestones", "" },	Click { 1, -290, 220, _window, _topCenter },		\
	Event { "submit issue", "" },		Sequence{}, Click { 1, 123, 700, _window, _topCenter }, ResSubslate { resid_OpenIssue },  endSequence{}

#pragma mark OpenIssue
#define _GitHubOpenIssueSlate_		\
resource restype_Slate (resid_OpenIssue, "") { {	\
	Slate { "open",	{	\
		ExitEvent { "okay", "back to issue list" },		Click { 1, -388, 290, _window, _topCenter },	\
		ExitEvent { "exit", "" },		NilAction{},	\
		Event { "back to host", "" },	Launch { _homeApp, _homeAppSlate },	\
		_IssueBar_,	\
		Event { "edit", "" },			Sequence{}, Click { 1, 270, 325, _window, _topCenter }, ResSubslate { resid_EditIssue }, endSequence{},	\
		Event { "assign", "" },			Sequence{}, Click { 1, -240, 390, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},	\
		Event { "milestone", "" },		Sequence{}, Click { 1, 275, 390, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},	\
		Event { "label", "" },			Sequence{}, Click { 1, 410, 390, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},	\
		_GitHubStandards_,	\
	} }	\
} };

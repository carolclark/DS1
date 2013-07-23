// =================================================================================
//	GitHub_C9.r					©2013 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1

/* resid_ */
#define resid_ghMyPage				resid_GitHub+100
#define resid_ghRepository			resid_GitHub+200
	#define resid_ghRepoButtons			resid_ghRepository+1
		#define resid_ghRepoBtn_Label		resid_ghRepository+2
#define resid_ghDashIssues			resid_GitHub+300
#define resid_ghRepoIssues			resid_GitHub+400
#define resid_ghOpenIssue			resid_GitHub+500
#define resid_ghEditIssue			resid_GitHub+600

#define resid_TypeGitHub			resid_GitHub+700
	#define resid_TypeSpecialGitHub		resid_TypeGitHub+1

#define _homeApp			DevApps_"Xcode.app"
#define	_homeAppSlate		resid_Xcode

/*
gh/dashboard
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
#define _ghClickDashboard	Click { 1, -475, 90, _window, _topCenter }

#define	_GitHubStandards_		\
		Event { "back to host", "" },	Launch { _homeApp, _homeAppSlate },		\
		Event { "dashboard", "" },		Sequence{}, _ghClickDashboard, SwitchSlate	{ resid_Xcode }, ResSubslate { resid_GitHub }, endSequence{},	\
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
resource restype_Slate (resid_GitHub, "") { {
	Slate { "gh",	{
		ExitEvent { "okay", "" },		Launch { _homeApp, 0 },
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { _homeApp, 0 }, endSequence{},
		Event { "dashboard", "" },		_ghClickDashboard,
		Event { "news feed", "" },		Sequence{}, Click { 1, -346, 195, _window, _topCenter }, endSequence{},
		Event { "issues", "" },			Sequence{}, Click { 1, 125, 195, _window, _topCenter }, ResSubslate { resid_ghDashIssues }, endSequence{},
		Event { "my page", "" },		Sequence{}, Click { 1, 313, 90, _window, _topCenter }, ResSubslate { resid_ghMyPage }, endSequence{},
		Event { "repo 1", "" },			Sequence{}, Click { 1, 200, 660, _window, _topCenter }, ResSubslate { resid_ghRepository },  endSequence{},
		Event { "repo 2", "" },			Sequence{}, Click { 1, 200, 691, _window, _topCenter }, ResSubslate { resid_ghRepository },  endSequence{},
		Event { "repo 3", "" },			Sequence{}, Click { 1, 200, 722, _window, _topCenter }, ResSubslate { resid_ghRepository },  endSequence{},
		Event { "repo 4", "" },			Sequence{}, Click { 1, 200, 753, _window, _topCenter }, ResSubslate { resid_ghRepository },  endSequence{},
		Event { "broadcast", "" },		Subslate { "broadcast" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "hide", "" },	Click { 1, 172, 609, _window, _topCenter },
			Event { "show", "" },		Click { 1, 172, 558, _window, _topCenter },
			Event { "show all", "" },	Click { 1, 409, 558, _window, _topCenter },
			Event { "page top", "" },	Keypress { kc_home, 0 },
			Event { "page end", "" },	Keypress { kc_end, 0 },
			Event { "page north", "" },	Keypress { kc_pageup, 0 },
			Event { "page down", "" },	Keypress { kc_pagedown, 0 },
			Event { "go back", "" },	Keypress { kc_bracket, mf_command },
			endSubslate{},
		Event { "slate", "" },			Subslate { "slate" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "my page", "" },		ResSubslate { resid_ghMyPage },
			ExitEvent { "dash issues", "" },	ResSubslate { resid_ghDashIssues },
			ExitEvent { "repository", "" },		ResSubslate { resid_ghRepository },
			ExitEvent { "repo issues", "" },	ResSubslate { resid_ghRepoIssues },
			ExitEvent { "open issue", "" },		ResSubslate { resid_ghOpenIssue },
			endSubslate{},
		_GitHubStandards_,
	} }
} };

#pragma mark ghMyPage
resource restype_Slate (resid_ghMyPage, "") { {
	Slate { "pg",	{
		ExitEvent { "okay", "" },		Keypress { kc_bracket, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "contributions", "" },	Click { 1, -150, 160, _window, _topCenter },
		Event { "repositories", "" },	Click { 1, -20, 160, _window, _topCenter },
		Event { "repo 1", "" },			Sequence{}, Click { 1, -160, 260, _window, _topCenter }, ResSubslate { resid_ghRepository }, endSequence{},
		Event { "repo 2", "" },			Sequence{}, Click { 1, -160, 370, _window, _topCenter }, ResSubslate { resid_ghRepository }, endSequence{},
		Event { "repo 3", "" },			Sequence{}, Click { 1, -160, 475, _window, _topCenter }, ResSubslate { resid_ghRepository }, endSequence{},
		_GitHubStandards_,
	} }
} };

#pragma mark 2 --- ghRepository
resource restype_Slate (resid_ghRepository, "") { {
	Slate { "repo",	{
		ExitEvent { "okay", "" },		Keypress { kc_bracket, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "pulse", "" },			Click { 1, --440, 330, _window, _topCenter },
		Event { "code", "" },			Click { 1, -370, 190, _window, _topCenter },
			Event { "files", "" },			Click { 1, -223, 330, _window, _topCenter },
			Event { "commits", "" },		Click { 1, -180, 330, _window, _topCenter },
			Event { "branches", "" },		Click { 1, -100, 330, _window, _topCenter },
		Event { "network", "" },		Click { 1, -240, 190, _window, _topCenter },
		Event { "pull requests", "" },	Click { 1, -120, 190, _window, _topCenter },
		Event { "issues", "" },			Sequence{}, Click { 1, 10, 188, _window, _topCenter }, ResSubslate { resid_ghRepoIssues }, endSequence{},
		Event { "wiki", "" },			Click { 1, 145, 190, _window, _topCenter },
		Event { "graphs", "" },			Click { 1, 260, 190, _window, _topCenter },
		Event { "settings", "" },		Click { 1, 395, 190, _window, _topCenter },
		Event { "clear filter", "" },	Click { 1, -170, 298, _window, _topCenter },
		_GitHubStandards_,
	} }
} };

#pragma mark ghRepoButtons
resource restype_Slate (resid_ghRepoButtons, "") { {
	Slate { "buttons",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "clear filter", "" },	Click { 1, 0, -45, _cursor },
		Event { "unclosed", "" },		Click { 1, 0, -35, _cursor },
		Event { "closed", "" },			Click { 1, 75, -35, _cursor },
		Event { "sort", "" },			Click { 1, 210, -35, _cursor },
		Event { "open", "" },			Click { 1, 0, 45, _cursor },
		Event { "label", "" },			Sequence{}, Click { 1, 70, 45, _cursor }, ResSubslate { resid_ghRepoBtn_Label }, endSequence{},
		Event { "assign", "" },			Click { 1, 150, 45, _cursor },
		Event { "milestone", "" },		Click { 1, 240, 45, _cursor },
	} }
} };

#pragma mark ghRepoBtn_Label
resource restype_Slate (resid_ghRepoBtn_Label, "") { {
	Slate { "label",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "update", "" },		Click { 1, 83, 190, _cursor },
		_LetterKeys_,
		_NumberKeys_,
		_DirectionKeys_,
		Event { "toggle", "" },			Keypress { kc_return, mf_command },
	} }
} };

#define _ghIssueBar_	\
	Event { "paste", "" },				Keypress { kc_V, mf_command + mf_option + mf_shift },	\
	Event { "browse milestones", "" },	Click { 1, -290, 250, _window, _topCenter },		\
	Event { "search", "" },				Sequence{}, Click { 1, -355, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},		\
	Event { "new issue", "" },			Sequence{}, Click { 1, 415, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},			\
	Event { "submit issue", "" },		Sequence{}, Click { 1, 123, 700, _window, _topCenter }, ResSubslate { resid_ghOpenIssue },  endSequence{}

#define	_ghIssueListStandards_	\
	ExitEvent { "exit", "" },		NilAction{},							\
	_GitHubStandards_,		\
	Event { "north", "" },			_ghup_,		\
	Event { "down", "" },			_ghdn_,		\
	Event { "open issue", "" },		Sequence{}, Keypress { kc_O, 0 }, ResSubslate { resid_ghOpenIssue }, endSequence{}

#pragma mark 3 --- Issues
//issue list params
#define	_issh	575		// horizontal
#define _isssp	40		// spacing
#define	_isstb	248		// tab row v, filtered
#define	_iss1v	315		// row1 v
#pragma mark ghDashIssues
resource restype_Slate (resid_ghDashIssues, "") { {
	Slate { "dissues",	{
		ExitEvent { "okay", "" },		_ghClickDashboard,
		_ghIssueListStandards_,
		Event { "filter 1", "" },		Click { 1, -500, 393, _window, _topCenter },
		Event { "filter 2", "" },		Click { 1, -500, 418, _window, _topCenter },
		Event { "filter 3", "" },		Click { 1, -500, 443, _window, _topCenter },
		Event { "button", "" },			Sequence{}, Click { 0, -170, 325, _window, _topCenter }, ResSubslate { resid_ghRepoButtons }, endSequence{},
		Event { "button 2", "" },		Sequence{}, Click { 0, -170, 355, _window, _topCenter }, ResSubslate { resid_ghRepoButtons }, endSequence{},
	} }
} };

#define	_isstb	334		// tab row v, filtered
#define	_iss1v	416		// row1 v
#pragma mark ghRepoIssues
resource restype_Slate (resid_ghRepoIssues, "") { {
	Slate { "rissues",	{
		ExitEvent { "okay", "" },		Click { 1, -310, 145, _window, _topCenter },
		ExitEvent { "exit", "" },		NilAction{},
		_ghIssueBar_,
		_ghIssueListStandards_,
		Event { "select", "" },			Keypress { kc_X, 0 },
		Event { "all", "" },			Click { 1, -406, 306, _window, _topCenter },
		Event { "assigned", "" },		Click { 1, -406, 347, _window, _topCenter },
		Event { "clear filter", "" },	Click { 1, -160, 300, _window, _topCenter },
		Event { "button", "" },			Sequence{}, Click { 0, -170, 325, _window, _topCenter }, ResSubslate { resid_ghRepoButtons }, endSequence{},
		Event { "button 2", "" },		Sequence{}, Click { 0, -170, 355, _window, _topCenter }, ResSubslate { resid_ghRepoButtons }, endSequence{},
		Event { "search", "" },			Sequence{}, Click { 1, 230, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		Event { "milestone", "" },		Sequence{}, Click { 1, -360, 490, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		Event { "label", "" },			Subslate { "label" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "1", "" },			Click { 1, -358, 535+1*26, _window, _topCenter },
			Event { "2", "" },			Click { 1, -358, 535+2*26, _window, _topCenter },
			Event { "3", "" },			Click { 1, -358, 535+3*26, _window, _topCenter },
			Event { "4", "" },			Click { 1, -358, 535+4*26, _window, _topCenter },
			Event { "5", "" },			Click { 1, -358, 535+5*26, _window, _topCenter },
			Event { "6", "" },			Click { 1, -358, 535+6*26, _window, _topCenter },
			Event { "7", "" },			Click { 1, -358, 535+7*26, _window, _topCenter },
			Event { "8", "" },			Click { 1, -358, 535+8*26, _window, _topCenter },
			Event { "9", "" },			Click { 1, -358, 535+9*26, _window, _topCenter },
			Event { "10", "" },			Click { 1, -358, 535+10*26, _window, _topCenter },
			endSubslate{},
	} }
} };

#pragma mark ghOpenIssue
resource restype_Slate (resid_ghOpenIssue, "") { {
	Slate { "open",	{
		ExitEvent { "okay", "back to issue list" },		Click { 1, -388, 290, _window, _topCenter },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "back to host", "" },	Launch { _homeApp, _homeAppSlate },
		_ghIssueBar_,
		Event { "edit", "" },			Sequence{}, Click { 1, 300, 355, _window, _topCenter }, ResSubslate { resid_ghEditIssue }, endSequence{},
		Event { "assign", "" },			Sequence{}, Click { 1, -207, 425, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		Event { "milestone", "" },		Sequence{}, Click { 1, 306, 425, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		Event { "label", "" },			Sequence{}, Click { 1, 440, 425, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		_GitHubStandards_,
	} }
} };

#pragma mark ghEditIssue
resource restype_Slate (resid_ghEditIssue, "") { {
	Slate { "edit",	{
		ExitEvent { "update", "" },		Keypress { kc_return, mf_command },
		ExitEvent { "cancel", "" },		Keypress { kc_bracket, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		_GitHubStandards_,
	} }
} };

resource restype_Slate (resid_TypeGitHub, "") { {
	Slate { "type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "undo", "" },			Keypress { kc_Z, mf_command },
	} }
} };

resource restype_Slate (resid_TypeSpecialGitHub, "") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
	} }
} };

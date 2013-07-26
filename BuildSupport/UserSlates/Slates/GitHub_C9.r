// =================================================================================
//	GitHub_C9.r					©2013 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "GitHub_C9.h"

#pragma mark === Markers ===
// 1

#pragma mark MyPage
resource restype_Slate (resid_MyPage, "") { {
	Slate { "pg",	{
		ExitEvent { "okay", "" },		Keypress { kc_bracket, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "contributions", "" },	Click { 1, -150, 160, _window, _topCenter },
		Event { "repositories", "" },	Click { 1, -20, 160, _window, _topCenter },
		Event { "repo 1", "" },			Sequence{}, Click { 1, -160, 260, _window, _topCenter }, ResSubslate { resid_Repository }, endSequence{},
		Event { "repo 2", "" },			Sequence{}, Click { 1, -160, 370, _window, _topCenter }, ResSubslate { resid_Repository }, endSequence{},
		Event { "repo 3", "" },			Sequence{}, Click { 1, -160, 475, _window, _topCenter }, ResSubslate { resid_Repository }, endSequence{},
		_GitHubStandards_,
	} }
} };

#pragma mark RepoButtons
resource restype_Slate (resid_RepoButtons, "") { {
	Slate { "buttons",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "clear filter", "" },	Click { 1, 0, -45, _cursor },
		Event { "unclosed", "" },		Click { 1, 0, -35, _cursor },
		Event { "closed", "" },			Click { 1, 75, -35, _cursor },
		Event { "sort", "" },			Click { 1, 210, -35, _cursor },
		Event { "open", "" },			Click { 1, 0, 45, _cursor },
		Event { "label", "" },			Sequence{}, Click { 1, 70, 45, _cursor }, ResSubslate { resid_RepoBtn_Label }, endSequence{},
		Event { "assign", "" },			Click { 1, 150, 45, _cursor },
		Event { "milestone", "" },		Click { 1, 240, 45, _cursor },
	} }
} };

#pragma mark RepoBtn_Label
resource restype_Slate (resid_RepoBtn_Label, "") { {
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

#define	_IssueListStandards_	\
	ExitEvent { "exit", "" },		NilAction{},							\
	_GitHubStandards_,		\
	Event { "north", "" },			_ghup_,		\
	Event { "down", "" },			_ghdn_,		\
	Event { "open issue", "" },		Sequence{}, Keypress { kc_O, 0 }, ResSubslate { resid_OpenIssue }, endSequence{}

#pragma mark 3 --- Issues
//issue list params
#define	_issh	575		// horizontal
#define _isssp	40		// spacing
#define	_isstb	248		// tab row v, filtered
#define	_iss1v	315		// row1 v
#pragma mark DashIssues
resource restype_Slate (resid_DashIssues, "") { {
	Slate { "dissues",	{
		ExitEvent { "okay", "" },		_ClickDashboard,
		_IssueListStandards_,
		Event { "filter 1", "" },		Click { 1, -500, 393, _window, _topCenter },
		Event { "filter 2", "" },		Click { 1, -500, 418, _window, _topCenter },
		Event { "filter 3", "" },		Click { 1, -500, 443, _window, _topCenter },
		Event { "button", "" },			Sequence{}, Click { 0, -170, 325, _window, _topCenter }, ResSubslate { resid_RepoButtons }, endSequence{},
		Event { "button 2", "" },		Sequence{}, Click { 0, -170, 355, _window, _topCenter }, ResSubslate { resid_RepoButtons }, endSequence{},
	} }
} };

#define	_isstb	334		// tab row v, filtered
#define	_iss1v	416		// row1 v
#pragma mark RepoIssues
resource restype_Slate (resid_RepoIssues, "") { {
	Slate { "rissues",	{
		ExitEvent { "okay", "" },		Click { 1, -310, 145, _window, _topCenter },
		ExitEvent { "exit", "" },		NilAction{},
		_IssueBar_,
		_IssueListStandards_,
		Event { "select", "" },			Keypress { kc_X, 0 },
		Event { "all", "" },			Click { 1, -406, 306, _window, _topCenter },
		Event { "assigned", "" },		Click { 1, -406, 347, _window, _topCenter },
		Event { "clear filter", "" },	Click { 1, -160, 300, _window, _topCenter },
		Event { "button", "" },			Sequence{}, Click { 0, -170, 325, _window, _topCenter }, ResSubslate { resid_RepoButtons }, endSequence{},
		Event { "button 2", "" },		Sequence{}, Click { 0, -170, 355, _window, _topCenter }, ResSubslate { resid_RepoButtons }, endSequence{},
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

#pragma mark EditIssue
resource restype_Slate (resid_EditIssue, "") { {
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

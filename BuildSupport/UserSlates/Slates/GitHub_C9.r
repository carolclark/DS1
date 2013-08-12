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
		Event { "search", "" },			_SearchAll,
		Event { "contributions", "" },	Click { 1, -150, 160, _window, _topCenter },
		Event { "repositories", "" },	Click { 1, -20, 160, _window, _topCenter },
		Event { "repo 1", "" },			Sequence{}, Click { 1, -160, 260, _window, _topCenter }, ResSubslate { resid_Repository }, endSequence{},
		Event { "repo 2", "" },			Sequence{}, Click { 1, -160, 370, _window, _topCenter }, ResSubslate { resid_Repository }, endSequence{},
		Event { "repo 3", "" },			Sequence{}, Click { 1, -160, 475, _window, _topCenter }, ResSubslate { resid_Repository }, endSequence{},
		_GitHubStandards_,
	} }
} };

#pragma mark RepoButtons
resource restype_Slate (resid_IssueActions, "") { {
	Slate { "actions",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "clear filter", "" },	Click { 1, -190, 265, _window, _topCenter },
		Event { "unclosed", "" },		Click { 1, 0, -35, _window, _topCenter },
		Event { "closed", "" },			Click { 1, 75, -35, _window, _topCenter },
		Event { "sort", "" },			Click { 1, 210, -35, _window, _topCenter },
		Event { "open", "" },			Click { 1, 0, 45, _window, _topCenter },
		Event { "label", "" },			Sequence{}, Click { 1, 70, 45, _window, _topCenter }, ResSubslate { resid_Action_Label }, endSequence{},
		Event { "assign", "" },			Click { 1, 150, 45, _window, _topCenter },
		Event { "milestone", "" },		Click { 1, 240, 45, _window, _topCenter },
	} }
} };

#pragma mark Action_Label
resource restype_Slate (resid_Action_Label, "") { {
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

#pragma mark repo Code
resource restype_Slate (resid_RepoCode, "") { {
	Slate { "code",	{
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "exit", "" },		NilAction{},
		Event { "commit", "" },			Click { 1, -385, 293, _window, _topCenter },
		Event { "branch", "" },			Click { 1, -173, 293, _window, _topCenter },
		Event { "release", "" },		Click { 1, 18, 293, _window, _topCenter },
		Event { "contribute", "" },		Click { 1, 717, 293, _window, _topCenter },
		Event { "compare", "" },		Click { 1, -465, 350, _window, _topCenter },
		Event { "switch", "" },			Click { 1, -375, 350, _window, _topCenter },
		_RepoHeaderItems_,
		_GitHubStandards_,
	} }
} };

#pragma mark RepoTabDefault
resource restype_Slate (resid_RepoTabDefault, "") { {
	Slate { "defaultTab",	{
		ExitEvent { "okay", "" },		Sequence{}, Keypress { kc_G, 0 }, Keypress { kc_C, 0 }, endSequence{},
		ExitEvent { "exit", "" },		NilAction{},
		_RepoHeaderItems_,
		_GitHubStandards_,
	} }
} };

#define	_IssueListStandards_	\
	ExitEvent { "exit", "" },		NilAction{},							\
	Event { "paste", "" },			Keypress { kc_V, mf_command + mf_option + mf_shift },	\
	Event { "search", "" },			_SearchCurrent,	\
	Event { "all issues", "" }, 	Click { 1, -400, 272, _window, _topCenter },	\
	Event { "assigned", "" },		Click { 1, -400, 312, _window, _topCenter },	\
	Event { "clear filter", "" },	Click { 1, -190, 265, _window, _topCenter },	\
	Event { "unclosed", "" },		Click { 1, -220, 265, _window, _topCenter },	\
	Event { "closed", "" },			Click { 1, -165, 265, _window, _topCenter },	\
	Event { "unclosed 2", "" },		Click { 1, -220, 305, _window, _topCenter },	\
	Event { "closed 2", "" },		Click { 1, -165, 305, _window, _topCenter },	\
	Event { "open issue", "" },		Sequence{}, Keypress { kc_O, 0 }, ResSubslate { resid_OpenIssue }, endSequence{},	\
	_GitHubStandards_,	\
	_RepoHeaderItems_

#pragma mark 3 --- Issues
#pragma mark DashIssues
resource restype_Slate (resid_DashIssues, "") { {
	Slate { "dissues",	{
		ExitEvent { "okay", "" },		_ClickDashboard,
		_IssueListStandards_,
		Event { "filter 1", "" },		Click { 1, -460, 420, _window, _topCenter },
		Event { "filter 2", "" },		Click { 1, -460, 445, _window, _topCenter },
		Event { "filter 3", "" },		Click { 1, -460, 470, _window, _topCenter },
	} }
} };

#define	lbl_h	-358
#define lbl_v	509
#define	lbl_sp	26
#pragma mark RepoIssues
resource restype_Slate (resid_RepoIssues, "") { {
	Slate { "rissues",	{
		ExitEvent { "okay", "" },		Click { 1, -310, 145, _window, _topCenter },
		ExitEvent { "exit", "" },		NilAction{},
		_IssueBar_,
		_IssueListStandards_,
		Event { "new issue", "" },			Sequence{}, Click { 1, 415, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		Event { "select", "" },			Keypress { kc_X, 0 },
		Event { "new issue", "" },			Sequence{}, Click { 1, 415, 250, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},			\
		Event { "action", "" },			Sequence{}, Click { 0, -210, 315, _window, _topCenter }, ResSubslate { resid_IssueActions }, endSequence{},
		Event { "action 2", "" },		Sequence{}, Click { 0, -210, 345, _window, _topCenter }, ResSubslate { resid_IssueActions }, endSequence{},
		Event { "milestone", "" },		Sequence{}, Click { 1, -295, 450, _window, _topCenter }, ResSubslate { resid_TypeGitHub }, endSequence{},
		Event { "label", "" },			Subslate { "label" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "1", "" },			Click { 1, lbl_h, lbl_v+0*lbl_sp, _window, _topCenter },
			Event { "2", "" },			Click { 1, lbl_h, lbl_v+1*lbl_sp, _window, _topCenter },
			Event { "3", "" },			Click { 1, lbl_h, lbl_v+2*lbl_sp, _window, _topCenter },
			Event { "4", "" },			Click { 1, lbl_h, lbl_v+3*lbl_sp, _window, _topCenter },
			Event { "5", "" },			Click { 1, lbl_h, lbl_v+4*lbl_sp, _window, _topCenter },
			Event { "6", "" },			Click { 1, lbl_h, lbl_v+5*lbl_sp, _window, _topCenter },
			Event { "7", "" },			Click { 1, lbl_h, lbl_v+6*lbl_sp, _window, _topCenter },
			Event { "8", "" },			Click { 1, lbl_h, lbl_v+7*lbl_sp, _window, _topCenter },
			Event { "9", "" },			Click { 1, lbl_h, lbl_v+8*lbl_sp, _window, _topCenter },
			Event { "10", "" },			Click { 1, lbl_h, lbl_v+9*lbl_sp, _window, _topCenter },
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

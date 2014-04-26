// =================================================================================
//	Xcode_C9.r					(c)2006-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "Developer_C9.h"
#include "GitHub_C9.h"

#pragma mark === Markers ===
// 0 Definitions; 1 Navigation; Utility; 2 Organizer; 3 Menus; 4 Target; 5 Editors; 6 Indexes; 7 Typing; 8 External; 9 Xcode

#define resid_TypeSafariSlate			resid_Safari+2

#pragma mark 0 === Definitions
// inside:  Slates: 1 Menus, Target; 2 Editor; 3 Index; 4 Typing; 5 External
//			Macros: 6 Menus; 7 Search/Find; 8 File Dialog; 9 Standards
/* resid_ */	// Xcode has 2000 resid's reserved
#define resid_Navigate				resid_Xcode+100
	#define resid_navFilter				resid_Navigate+1
	#define resid_GoTab					resid_Navigate+2
	#define resid_JumpBar				resid_Navigate+10
		#define resid_jumpPopup				resid_JumpBar+1

#define resid_Utilities				resid_Xcode+150
	#define resid_utilFile				resid_Utilities+10
		#define resid_utilFileLocate		resid_utilFile+1
	#define resid_utilHelp				resid_Utilities+20

#define resid_Organizer				resid_Xcode+200
	#define resid_Documentation			resid_Organizer+20

#pragma mark Menus
#define resid_FileMenu				resid_Xcode+250
		#define resid_SelectTargetsAdd		resid_FileMenu+1
		#define resid_SelectTargetsNew		resid_FileMenu+2
		#define resid_SaveFile				resid_FileMenu+3
	#define resid_NewFile				resid_FileMenu+10
	#define resid_OpenFile				resid_FileMenu+20
	#define resid_AddFiles				resid_FileMenu+30
	#define resid_SourceControl			resid_FileMenu+40
		#define resid_Commit				resid_SourceControl+1
		#define resid_Branch				resid_SourceControl+2

#define resid_EditMenu				resid_Xcode+300

#define resid_Refactor				resid_Xcode+350
	#define resid_refactorPreview		resid_Refactor+1
	#define resid_refactorView			resid_Refactor+2

#define resid_ProductMenu			resid_Xcode+400

#define resid_Scripts				resid_Xcode+450

#pragma mark Target
#define resid_Target				resid_Xcode+500
	#define resid_Profile				resid_Target+1
	#define	resid_TargetScheme			resid_Target+2
	#define	resid_TargetPopup			resid_Target+3

	#define resid_RunTarget				resid_Target+10

	#define resid_Accessor				resid_Target+20
		#define resid_BuildAccessor			resid_Accessor+1

	#define resid_RunWords				resid_Target+25
		#define resid_wordsPictures			resid_RunWords+1
		#define resid_wordsWords			resid_RunWords+2

#pragma mark Editor
#define	resid_Editor				resid_Xcode+600
	#define resid_Marker				resid_Editor+1

	#define resid_StandardEditor		resid_Editor+10
	#define resid_AssistantEditor		resid_Editor+20
		#define resid_asstSplit				resid_AssistantEditor+1
	#define resid_VersionEditor			resid_Editor+30

	#define	resid_ProjectSettings		resid_Editor+40
		#define resid_projTargetList		resid_ProjectSettings+1
		#define resid_projAddTarget			resid_ProjectSettings+2
		#define resid_projAddPhase			resid_ProjectSettings+3
		#define resid_phaseRunScript		resid_ProjectSettings+4

	#define resid_Workspace				resid_Editor+50

	#define resid_InterfaceBuilder		resid_Editor+60
		#define resid_IBMenu				resid_InterfaceBuilder+10
			#define	resid_WaitQuit				resid_IBMenu+1
			#define resid_IBPin					resid_IBMenu+2
			#define resid_IBAlign				resid_IBMenu+3
			#define resid_IBEmbed				resid_IBMenu+4
			#define resid_IBDocument			resid_IBMenu+5
			#define resid_IBUtility				resid_IBMenu+10
				#define resid_utilAttributes		resid_IBMenu+11
				#define resid_utilSize				resid_IBMenu+12
				#define resid_utilObject			resid_IBMenu+13

	#define resid_DataModel				resid_Xcode+90
		#define resid_DataModelUtility		resid_DataModel+1
		#define resid_utilModel				resid_DataModel+2

#pragma mark Index Slates
#define resid_Index						resid_Xcode+700
		#define resid_clickOpen					resid_Index+1
		#define resid_IndexMouse				resid_Index+2
	#define resid_ProjectIndex				resid_Index+10
		#define resid_NewGroup					resid_ProjectIndex+1
	#define resid_SymbolIndex				resid_Index+20
	#define	resid_SearchIndex				resid_Index+30
		#define resid_Search					resid_SearchIndex+1			// single-file find/replace
	#define	resid_IssueIndex				resid_Index+40
	#define resid_TestIndex					resid_Index+50
	#define resid_DebugIndex				resid_Index+60
		#define resid_Gauges					resid_DebugIndex+1
		#define resid_Threads					resid_DebugIndex+2
	#define resid_BreakpointIndex			resid_Index+70
	#define	resid_LogIndex					resid_Index+80

#pragma mark Typing Slates
#define resid_TypeXcodeSlate			resid_Xcode+800
	#define resid_Macro						resid_TypeXcodeSlate+3
	#define resid_TypeDialog				resid_TypeXcodeSlate+4
	#define resid_TypeDebugConsole			resid_TypeXcodeSlate+6
	#define resid_typeSearch				resid_TypeXcodeSlate+25

#pragma mark External Slates
#define resid_External				resid_Xcode+900
#define resid_Browser				resid_External+0
#define resid_BrowseDoxygen			resid_External+10
#define resid_GitHubXC				resid_External+20
	#define resid_ghRepository			resid_GitHub+1
	#define resid_ghOpenIssue			resid_GitHub+2

#define resid_XcodeServer			resid_External+30
#define resid_Stickies				resid_External+40
#define resid_Console				resid_External+50
#define resid_BBValidate			resid_External+60
	#define resid_BBContinueCheckAll	resid_BBValidate+1


#pragma mark 6 --- Macros

#define _splitter_x		260

// Events
#define _CloseDocument_		Event { "close document", "" },	Keypress { kc_W, mf_command + mf_control }
#define _TypeXcodeSlate_ 	Event { "Type", "" }, ResSubslate { resid_TypeXcodeSlate }
#define	_Focus_				Event { "focus", "" },			Keypress { kc_accent, mf_command + mf_option }
#define	_FocusBack_			Event { "focus back", "" },		Keypress { kc_accent, mf_command + mf_option + mf_shift }
#define _SetFocus_			Event { "set focus", "" },		Keypress { kc_J, mf_command }
#define _JumpBar_			Event { "jump bar", "" },	ResSubslate { resid_JumpBar }
#define _GoToReference_		Event { "go to reference", "" },	Sequence{}, Keypress { kc_slash, mf_command + mf_option + mf_control },	ResSubslate { resid_Documentation }, endSequence{}

// Menu Bar
#define	_clickEditMenu		ClickMenu { "Edit" }
#define _clickFileMenu		ClickMenu { "File" }
#define	_clickEditorMenu	ClickMenu { "Editor" }

// Actions
#define	_selword		Keypress { kc_W, mf_option + mf_control }
#define	_selline		Keypress { kc_W, mf_option + mf_control + mf_shift }
#define _capitalize		Keypress { kc_up, mf_control + mf_shift }
#define _lowercase		Keypress { kc_down, mf_control + mf_shift }
#define _breakpoint		Keypress { kc_backslash, mf_command },
#define	_newTab			Keypress { kc_T, mf_command }
#define	_closeTab		Keypress { kc_W, mf_command }
#define	_goPanel		Keypress { kc_J, mf_command }
#define	_skipAhead		Keypress { kc_right, mf_command + mf_control }
#define	_skipBack		Keypress { kc_left, mf_command + mf_control }
#define	_counterpart	Keypress { kc_down, mf_command + mf_control }
#define	_nextIssue		Keypress { kc_quote, mf_command }
#define	_previousIssue	Keypress { kc_quote, mf_command + mf_shift }
#define _goNext			Keypress { kc_closebracket, mf_command + mf_shift }
#define _goPrevious		Keypress { kc_bracket, mf_command + mf_shift }
#define	_goTab			ResSubslate { resid_GoTab }
#define	_standardEditor		Keypress { kc_return, mf_command }
#define _assistantEditor	Keypress { kc_return, mf_command + mf_option }
#define _versionEditor		Keypress { kc_return, mf_command + mf_shift + mf_option }
#define	_showHideNavigator	Keypress { kc_0, mf_command }


#pragma mark 7 --- Search/Find
#define _HideFindBar_			Event { "hide find bar", "" },			Sequence{}, ClickMenu { "Find" }, TypeText { "Hide Find Bar" }, _return, endSequence{}

#define _clickReplace			Click { 1, -30, 130, _window, _topRight }
#define _clickFindOptions		Click { 1, -281, 132, _window, _topRight }
#define _clickFindDone			Click { 1, -31, 105, _window, _topRight }

#define	_openDash			Event { "open Dash", "" },			Launch { MainApps_"Dash.app", resid_XcodeDash },
#define _lookup				Event { "lookup Dash", "" },		Sequence{}, Keypress { kc_accent, mf_command + mf_control }, ResSubslate { resid_XcodeDash }, endSequence{}

#pragma mark Popup macros
#define _PopupStandards_	\
		_SlateGlobals_,		\
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },								\
		ExitEvent { "return", "" },		Keypress { kc_return, 0 },								\
		ExitEvent { "cancel", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, endSequence{},	\
		ExitEvent { "close", "" },		Keypress { kc_escape, 0 },								\
		ExitEvent { "exit", "" },		CloseSubslate{},										\
		Event { "page top", "" },		Keypress { kc_home, 0 },								\
		Event { "page bottom", "" },	Keypress { kc_end, 0 },									\
		Event { "page north", "" },		Keypress { kc_pageup, 0 },								\
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },							\
		_JumpDownSubslate_,								\
		_JumpNorthSubslate_,							\
		_DoJumpSubslate_,								\
		_DirectionKeys_,								\
		_LetterKeys_,									\
		_NumberKeys_

#pragma mark 8 --- File Dialog macros
#define	_clickFilename			Click { 1, fname_h, fname_v, _window, _topCenter }
#define	_clickFilter			Click { 1, flt_h, flt_v, _window, _topCenter }

#define _FileDialogStandards_	\
	_SlateGlobals_,				\
	ExitEvent { "exit", "" },		NilAction{},                                            	\
	ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },			                     	\
	ExitEvent { "okay", "" },		_return,                                                	\
	Event { "go to folder", "" },	Sequence{}, Keypress { kc_G, mf_command }, ResSubslate { resid_GoToFolder }, endSequence{},		\
	Event { "history", "" },		Sequence{}, _clickFilter, Wait { 5 }, _tabBack, _tabBack, _tabBack, endSequence{},		\
	Event { "view", "" },			Sequence{}, _clickFilter, Wait { 5 }, _tabBack, _tabBack, endSequence{},	\
	Event { "location", "" },		Sequence{}, _clickFilter, Wait { 5 }, _tabBack, endSequence{},	    	\
	Event { "filter", "" },			_clickFilter,												\
	Event { "devices", "" },		Sequence{}, _clickFilter, Wait { 5 }, _tab, endSequence{},		\
	Event { "navigate", "" },		Sequence{}, _clickFilter, Wait { 5 }, _tab, _tab, endSequence{},		\
	_PageKeys_,				\
	_DirectionKeys_,        \
	_WhitespaceKeys_,       \
	Event { "tab back", "" },		Keypress { kc_tab, mf_shift },		\
	_CommandSlate_,         \
	_LetterKeys_,           \
	_IMouseSlate_,			\
	Event { "type", "" },			ResSubslate { resid_TypeDialog }

#define _fors	20
#define _FileOpenStandards_	\
	Event { "destination", "" },	Sequence{}, _clickFilter, _tab, _tab, _tab, endSequence{},	\
	Event { "folders", "" },		Sequence{}, _clickFilter, _tab, _tab, _tab,  _tab, endSequence{},	\
	_DoSelectSubslate_,																			\
	Event { "expand names", "" },	Sequence{}, Click { 1, 28, 560, _window, _topCenter }, Click { 1, 28, 560, _window, _topCenter }, endSequence{},	\
	Event { "row 1", "" },			Click { 1, 0, 148+_fors*0, _window, _topCenter },	\
	Event { "row 2", "" },			Click { 1, 0, 148+_fors*1, _window, _topCenter },	\
	Event { "row 3", "" },			Click { 1, 0, 148+_fors*2, _window, _topCenter },	\
	Event { "row 4", "" },			Click { 1, 0, 148+_fors*3, _window, _topCenter },	\
	Event { "row 5", "" },			Click { 1, 0, 148+_fors*4, _window, _topCenter },	\
	Event { "row 6", "" },			Click { 1, 0, 148+_fors*5, _window, _topCenter },	\
	Event { "row 7", "" },			Click { 1, 0, 148+_fors*6, _window, _topCenter },	\
	Event { "row 8", "" },			Click { 1, 0, 148+_fors*7, _window, _topCenter },	\
	Event { "row 9", "" },			Click { 1, 0, 148+_fors*8, _window, _topCenter },	\
	Event { "row 10", "" },			Click { 1, 0, 148+_fors*9, _window, _topCenter },	\
	Event { "row 11", "" },			Click { 1, 0, 148+_fors*10, _window, _topCenter },	\
	Event { "row 12", "" },			Click { 1, 0, 148+_fors*11, _window, _topCenter },	\
	Event { "row 13", "" },			Click { 1, 0, 148+_fors*12, _window, _topCenter },	\
	Event { "row 14", "" },			Click { 1, 0, 148+_fors*13, _window, _topCenter },	\
	_FileDialogStandards_

#define _FileSaveStandards_		\
	Event { "filename", "" },			_clickFilename,		\
	Event { "group", "" },				Sequence{}, _clickFilter, _tab, _tab, _tab, endSequence{},	\
	Event { "targets", "" },			Sequence{}, Click { 1, 0, 550, _window, _topCenter }, ResSubslate { resid_SelectTargetsNew }, endSequence{},		\
	Event { "new folder", "" },			Sequence{}, _clickFilter, _tab, _tab, _tab, _tab, _tab, endSequence{},		\
	Event { "parent", "" },				Click { 1, 310, 340, _window, _topCenter },					\
	Event { "subclass of", "" },		Click { 1, 310, 340, _window, _topCenter },					\
	Event { "template groups", "" },	Click { 1, -337, 506, _window, _topCenter },				\
	_FileDialogStandards_

#pragma mark 9 --- Standards
#define	_XcodeStandards_		\
	Event { "full screen", "" },		Keypress { kc_F, mf_command + mf_control },	\
	Event { "standard screen", "" },	Keypress { kc_escape, 0 }

#pragma mark 1 ===
// inside: Navigation, 1 Utility
#define	il_h	176
#define	il_r1	182
#define	il_psp	30
#define il_rsp	19

// Navigation Panel
#define	nb_h	120
#define	nb_r1	140
#define	nb_rsp	17

resource restype_Slate (resid_Navigate, "Navigate") { {
	Slate { "nav", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		_Focus_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "index", "" },			ResSubslate { resid_Index },
		Event { "project", "" },		Sequence{}, Keypress { kc_return, mf_command }, Keypress { kc_1, mf_command }, ResSubslate { resid_ProjectIndex }, endSequence{},
		Event { "symbol", "" },			Keypress { kc_2, mf_command },
		Event { "search", "" },			Keypress { kc_3, mf_command },
		Event { "issue", "" },			Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_IssueIndex }, endSequence{},
		Event { "test", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_TestIndex }, endSequence{},
		Event { "debug", "" },			Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_DebugIndex }, endSequence{},
		Event { "breakpoint", "" },		Keypress { kc_7, mf_command },
		Event { "log", "" },			Sequence{}, Keypress { kc_8, mf_command }, ResSubslate { resid_LogIndex }, endSequence{},
		Event { "new group", "" },		Keypress { kc_N, mf_command + mf_option },
		Event { "pop issues", "" },		Click { 1, -24, 108, _window, _topRight },
		Event { "filter", "" },			ResSubslate { resid_NavFilter },
		Event { "new tab", "" },		_newTab,
		Event { "close tab", "" },		_closeTab,
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go tab", "" },			_goTab,
		Event { "go panel", "" },		_goPanel,
		Event { "skip ahead", "" },		_skipAhead,
		Event { "skip back", "" },		_skipBack,
		Event { "counterpart", "" },	_counterpart,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
		Event { "reveal file", "" },	Keypress { kc_J, mf_command + mf_shift },
		Event { "reveal symbol", "" },	Sequence{}, ClickMenu { "Navigate" }, _down, TypeText { "Reveal in Symbol Navigator" }, _return, endSequence{},
		_JumpBar_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark NavFilter
// deprecated
resource restype_Slate (resid_NavFilter, "NavFilter") { {
	Slate { "filter", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_CloseDocument_,
		ExitEvent { "unsaved", "" },		Click { 1, 71, -10, _window, _bottomLeft },
		ExitEvent { "last build", "" },		Click { 1, 12, -10, _window, _bottomLeft },
	} }
} };

#pragma mark GoTab
#define	tabT	65
resource restype_Slate (resid_GoTab, "") { {
	Slate { "go tab",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "one", "" },		Click { 1, 100, tabT, _window, _topLeft },
		ExitEvent { "two", "" },		Click { 1, 300, tabT, _window, _topLeft },
		ExitEvent { "three", "" },		Click { 1, -300, tabT, _window, _topCenter },
		ExitEvent { "four", "" },		Click { 1, -140, tabT, _window, _topCenter },
		ExitEvent { "five", "" },		Click { 1, 102, tabT, _window, _topCenter },
		ExitEvent { "six", "" },		Click { 1, -476, tabT, _window, _topRight },
		ExitEvent { "seven", "" },		Click { 1, -310, tabT, _window, _topRight },
		ExitEvent { "eight", "" },		Click { 1, -235, tabT, _window, _topRight },
		ExitEvent { "nine", "" },		Click { 1, -100, tabT, _window, _topRight },
	} }
} };

#pragma mark Jump Bar
resource restype_Slate (resid_JumpBar, "JumpBar") { {
	Slate { "jbar", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },	NilAction{},
		Event { "related", "" },	Sequence{},	Keypress { kc_1, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "previous", "" },	Sequence{},	Keypress { kc_2, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "next", "" },		Sequence{},	Keypress { kc_3, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "project", "" },	Sequence{},	Keypress { kc_4, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "manual", "" },		Sequence{},	Keypress { kc_4, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "file", "" },		Sequence{},	Keypress { kc_5, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "symbol", "" },		Sequence{},	Keypress { kc_6, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
	} }
} };

resource restype_Slate (resid_jumpPopup, "") { {
    Slate { "jump", {
        _PopupStandards_,
    } }
} };

#pragma mark 1 --- Utility
// within sections, click relative to -110, 126*20n from cursor
#define secTop	126
#define secSp	20
#define	_UtilityStandards_		\
		Event { "section one", "" },			Click { 0, -110, secTop+0*secSp, _window, _topRight },		\
		Event { "section two", "" },			Click { 0, -110, secTop+1*secSp, _window, _topRight },		\
		Event { "section three", "" },			Click { 0, -110, secTop+2*secSp, _window, _topRight },		\
		Event { "section four", "" },			Click { 0, -110, secTop+3*secSp, _window, _topRight },		\
		Event { "section five", "" },			Click { 0, -110, secTop+4*secSp, _window, _topRight },		\
		Event { "section six", "" },			Click { 0, -110, secTop+5*secSp, _window, _topRight },		\
		Event { "click one", "" },				Click { 1, 0, 0, _cursor },		\
		Event { "expand", "" },					Click { 1, 0, 0, _cursor },		\
		Event { "collapse", "" },				Click { 1, 0, 0, _cursor },		\
		Event { "next", "" },					Click { 0, 0, secSp, _cursor },	\
		Event { "content", "" },				Click { 1, -40, 22, _cursor },	\
		Event { "return", "" },					_return,	\
		Event { "nav list", "" },				Keypress { kc_0, mf_command },	\
		Event { "doc list", "" },				Click { 1, 400, -35, _window, _bottomLeft },	\
		_DirectionKeys_

resource restype_Slate (resid_Utilities, "Utility") { {
	Slate { "util", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_0, mf_command + mf_option },
		Event { "show", "" },			Keypress { kc_0, mf_command + mf_option },
		Event { "hide", "" },			Keypress { kc_0, mf_command + mf_option },
		Event { "content", "" },		Click { 1, -155, 22, _cursor },
		Event { "filter", "" },			Click { 1, -130, -12, _window, _bottomRight },
		_TypeXcodeSlate_,
		Event { "file", "" },			Sequence{}, Keypress { kc_1, mf_command + mf_option }, ResSubslate { resid_utilFile }, endSequence{},
		Event { "help", "" },			Sequence{}, Keypress { kc_2, mf_command + mf_option }, ResSubslate { resid_utilHelp }, endSequence{},
		_IMouseSlate_,
		_UtilityStandards_,
	} }
} };

resource restype_Slate (resid_utilFile, "file util") { {
	Slate { "file", {
		_SlateGlobals_,
		_IMouseSlate_,
		_DirectionKeys_,
		_CloseSubslate_,
		_UtilityStandards_,
		Event { "discard changes", "" },	Click { 0, -70, 40, _cursor },
		Event { "autolayout", "" },			Click { 0, -130, 392, _window, _topRight, },
		Event { "locate", "" },				Sequence{}, Click { 1, 90, 110, _cursor }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate two", "" },			Sequence{}, Click { 1, 90, 126, _cursor }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate three", "" },		Sequence{}, Click { 1, 90, 142, _cursor }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate four", "" },		Sequence{}, Click { 1, 90, 158, _cursor }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate five", "" },		Sequence{}, Click { 1, 90, 172, _cursor }, ResSubslate { resid_utilFileLocate }, endSequence{},
	} }
} };

#define	flt_h	350		// filter field, from _window _topCenter
#define	flt_v	150
resource restype_Slate (resid_utilFileLocate, "locate file") { {
	Slate { "locate", {
		_FileOpenStandards_,
	} }
} };

#pragma mark utilHelp
resource restype_Slate (resid_utilHelp, "") { {
	Slate { "help",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "open", "" },			Sequence{}, Click { 1, -200, 155, _window, _topRight }, CloseSubslate{}, CloseSubslate{}, ResSubslate { resid_Documentation }, endSequence{},
	} }
} };

#pragma mark 2 ===
// inside: Organizer, 1 Documentation

// Organizer NavPanel
#define	ov_h	120
#define	ov_r1	97
#define	ov_rsp	30
#define	_OrgPanelRows_	\
	Event { "row one", "" },	Click { 1, ov_h, ov_r1 + 0 * ov_rsp, _window, _topLeft },	\
	Event { "row two", "" },	Click { 1, ov_h, ov_r1 + 1 * ov_rsp, _window, _topLeft },	\
	Event { "row three", "" },	Click { 1, ov_h, ov_r1 + 2 * ov_rsp, _window, _topLeft },	\
	Event { "row four", "" },	Click { 1, ov_h, ov_r1 + 3 * ov_rsp, _window, _topLeft },	\
	Event { "row five", "" },	Click { 1, ov_h, ov_r1 + 4 * ov_rsp, _window, _topLeft },	\
	Event { "row six", "" },	Click { 1, ov_h, ov_r1 + 5 * ov_rsp, _window, _topLeft },	\
	Event { "row seven", "" },	Click { 1, ov_h, ov_r1 + 6 * ov_rsp, _window, _topLeft },	\
	Event { "row eight", "" },	Click { 1, ov_h, ov_r1 + 7 * ov_rsp, _window, _topLeft },	\
	Event { "row nine", "" },	Click { 1, ov_h, ov_r1 + 8 * ov_rsp, _window, _topLeft },	\
	Event { "row ten", "" },	Click { 1, ov_h, ov_r1 + 9 * ov_rsp, _window, _topLeft },	\
	Event { "row eleven", "" },	Click { 1, ov_h, ov_r1 + 10 * ov_rsp, _window, _topLeft },	\
	Event { "row twelve", "" },	Click { 1, ov_h, ov_r1 + 11 * ov_rsp, _window, _topLeft },	\
	Event { "row thirteen", "" },	Click { 1, ov_h, ov_r1 + 12 * ov_rsp, _window, _topLeft },	\
	Event { "row fourteen", "" },	Click { 1, ov_h, ov_r1 + 13 * ov_rsp, _window, _topLeft },	\
	Event { "row fifteen", "" },	Click { 1, ov_h, ov_r1 + 14 * ov_rsp, _window, _topLeft },	\
	Event { "row sixteen", "" },	Click { 1, ov_h, ov_r1 + 15 * ov_rsp, _window, _topLeft },	\
	Event { "row seventeen", "" },	Click { 1, ov_h, ov_r1 + 16 * ov_rsp, _window, _topLeft },	\
	Event { "row eighteen", "" },	Click { 1, ov_h, ov_r1 + 17 * ov_rsp, _window, _topLeft },	\
	Event { "row nineteen", "" },	Click { 1, ov_h, ov_r1 + 18 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty", "" },		Click { 1, ov_h, ov_r1 + 19 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty one", "" },	Click { 1, ov_h, ov_r1 + 20 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty two", "" },	Click { 1, ov_h, ov_r1 + 21 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty three", "" },	Click { 1, ov_h, ov_r1 + 22 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty four", "" },	Click { 1, ov_h, ov_r1 + 23 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty five", "" },	Click { 1, ov_h, ov_r1 + 24 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty six", "" },		Click { 1, ov_h, ov_r1 + 25 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty seven", "" },	Click { 1, ov_h, ov_r1 + 26 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty eight", "" },	Click { 1, ov_h, ov_r1 + 27 * ov_rsp, _window, _topLeft },	\
	Event { "row twenty nine", "" },	Click { 1, ov_h, ov_r1 + 28 * ov_rsp, _window, _topLeft },	\
	Event { "row thirty", "" },			Click { 1, ov_h, ov_r1 + 29 * ov_rsp, _window, _topLeft }

resource restype_Slate (resid_Organizer, "Organizer") { {
	Slate { "org", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		_IMouseSlate_,
		_DirectionKeys_,
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _window, _topLeft },	Click { -1, 280, 29, _screen, _topLeft }, endSequence{},
		_OrgPanelRows_,
		ExitEvent { "open",	"" },		Keypress { kc_return, 0 },
		Event { "devices", "" },		Click { 1, -53, 45, _window, _topCenter },
		Event { "projects", "" },		Click { 1, 0, 45, _window, _topCenter },
		Event { "archives", "" },		Click { 1, 55, 45, _window, _topCenter },
	} }
} };

#pragma mark 1 --- Documentation
#define	_docMain_h		-23
#define	_docMain_v		63
#define	_docSplit1		308
#define	_docSplit2		528
#define	_toolbar_v		35
#define _mainlinks_h	24
#define	_mainlinks_v	82
#define	_mainlinks_sp	24

resource restype_Slate (resid_Documentation, "Xcode Reference Documentation") { {
	Slate { "Docs",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Keypress { kc_accent, mf_command },
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		_XcodeStandards_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_DoJumpSubslate_,
		_PageKeys_,
		_ScanAheadSubslate_,
		_ScanBackSubslate_,
		Event { "do scan", "" },		ResSubslate { resid_DoScan },
		Event { "go back", "" },		Click { 1, 24, _toolbar_v, _window, _topLeft },
		Event { "go forward", "" },		Click { 1, 50, _toolbar_v, _window, _topLeft },
		Event { "show navigator", "" },	Click { 1, 100, _toolbar_v, _window, _topLeft },
		Event { "show contents", "" },	Click { 1, 135, _toolbar_v, _window, _topLeft },
		Event { "search field", "" },	Click { 1, 0, _toolbar_v, _window, _topCenter },
		Event { "main frame", "" },		Click { 1, _docMain_h, _docMain_v, _window, _topRight },
		Event { "contents", "" },		Click { 1, _docSplit1+12, -13, _window, _bottomLeft },
		Event { "browse", "" },			Click { 1, 137, _toolbar_v, _window, _topLeft },
		Event { "bookmarks", "" },		Click { 1, 170, _toolbar_v, _window, _topLeft },
		Event { "share", "" },			Click { 1, -24, _toolbar_v, _window, _topRight },
		_OrgPanelRows_,
		Event { "main links", "" },		Subslate { "mainLinks" },
			_SlateGlobals_,
			ExitEvent { "okay", "" },		Click { 1, 0, 0, _cursor },
			ExitEvent { "cancel", "" },		NilAction{},
			Event { "north", "" },			Click { 0, 0, -10, _cursor },
			Event { "down", "" },			Click { 0, 0, 10, _cursor },
			Event { "left", "" },			Click { 0, -50, 0, _cursor },
			Event { "right", "" },			Click { 0, 50, 0, _cursor },
			Event { "one", "" },			Click { 0, _mainlinks_h, _mainlinks_v+0*_mainlinks_sp, _window, _topLeft },
			Event { "two", "" },			Click { 0, _mainlinks_h, _mainlinks_v+1*_mainlinks_sp, _window, _topLeft },
			Event { "three", "" },			Click { 0, _mainlinks_h, _mainlinks_v+2*_mainlinks_sp, _window, _topLeft },
			Event { "four", "" },			Click { 0, _mainlinks_h, _mainlinks_v+3*_mainlinks_sp, _window, _topLeft },
			Event { "five", "" },			Click { 0, _mainlinks_h, _mainlinks_v+4*_mainlinks_sp, _window, _topLeft },
			Event { "six", "" },			Click { 0, _mainlinks_h, _mainlinks_v+5*_mainlinks_sp, _window, _topLeft },
			Event { "seven", "" },			Click { 0, _mainlinks_h, _mainlinks_v+6*_mainlinks_sp, _window, _topLeft },
			Event { "eight", "" },			Click { 0, _mainlinks_h, _mainlinks_v+7*_mainlinks_sp, _window, _topLeft },
			Event { "nine", "" },			Click { 0, _mainlinks_h, _mainlinks_v+8*_mainlinks_sp, _window, _topLeft },
			Event { "ten", "" },			Click { 0, _mainlinks_h, _mainlinks_v+9*_mainlinks_sp, _window, _topLeft },
			Event { "eleven", "" },			Click { 0, _mainlinks_h, _mainlinks_v+10*_mainlinks_sp, _window, _topLeft },
			Event { "twelve", "" },			Click { 0, _mainlinks_h, _mainlinks_v+11*_mainlinks_sp, _window, _topLeft },
			Event { "thirteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+12*_mainlinks_sp, _window, _topLeft },
			Event { "fourteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+13*_mainlinks_sp, _window, _topLeft },
			Event { "fifteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+14*_mainlinks_sp, _window, _topLeft },
			Event { "sixteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+15*_mainlinks_sp, _window, _topLeft },
			Event { "seventeen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+16*_mainlinks_sp, _window, _topLeft },
			Event { "eighteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+17*_mainlinks_sp, _window, _topLeft },
			Event { "nineteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+18*_mainlinks_sp, _window, _topLeft },
			Event { "twenty", "" },			Click { 0, _mainlinks_h, _mainlinks_v+19*_mainlinks_sp, _window, _topLeft },
			Event { "twenty one", "" },		Click { 0, _mainlinks_h, _mainlinks_v+20*_mainlinks_sp, _window, _topLeft },
			Event { "twenty two", "" },		Click { 0, _mainlinks_h, _mainlinks_v+21*_mainlinks_sp, _window, _topLeft },
			Event { "twenty three", "" },	Click { 0, _mainlinks_h, _mainlinks_v+22*_mainlinks_sp, _window, _topLeft },
			Event { "twenty four", "" },	Click { 0, _mainlinks_h, _mainlinks_v+23*_mainlinks_sp, _window, _topLeft },
			Event { "twenty five", "" },	Click { 0, _mainlinks_h, _mainlinks_v+24*_mainlinks_sp, _window, _topLeft },
			Event { "twenty six", "" },		Click { 0, _mainlinks_h, _mainlinks_v+25*_mainlinks_sp, _window, _topLeft },
			Event { "twenty seven", "" },	Click { 0, _mainlinks_h, _mainlinks_v+26*_mainlinks_sp, _window, _topLeft },
			Event { "twenty eight", "" },	Click { 0, _mainlinks_h, _mainlinks_v+27*_mainlinks_sp, _window, _topLeft },
			Event { "twenty nine", "" },	Click { 0, _mainlinks_h, _mainlinks_v+28*_mainlinks_sp, _window, _topLeft },
			Event { "thirty", "" },			Click { 0, _mainlinks_h, _mainlinks_v+29*_mainlinks_sp, _window, _topLeft },
			Event { "thirty one", "" },		Click { 0, _mainlinks_h, _mainlinks_v+30*_mainlinks_sp, _window, _topLeft },
			Event { "thirty two", "" },		Click { 0, _mainlinks_h, _mainlinks_v+31*_mainlinks_sp, _window, _topLeft },
			Event { "thirty three", "" },	Click { 0, _mainlinks_h, _mainlinks_v+32*_mainlinks_sp, _window, _topLeft },
			Event { "thirty four", "" },	Click { 0, _mainlinks_h, _mainlinks_v+33*_mainlinks_sp, _window, _topLeft },
			Event { "thirty five", "" },	Click { 0, _mainlinks_h, _mainlinks_v+34*_mainlinks_sp, _window, _topLeft },
			endSubslate{},
	} }
} };

#pragma mark 3 === Menus
// inside: File Menu, 1 Source Control, 2 Edit Menu, 3 Refactor, 4 Product, 5 Scripts
#pragma mark File Menu
resource restype_Slate (resid_FileMenu, "File") { {
	Slate { "File", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },				CloseSubslate{},
		ExitEvent { "cancel", "" },				Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, endSequence{},
		Event { "New File", "" },				Sequence{}, Keypress { kc_N, mf_command }, ResSubslate { resid_NewFile }, endSequence{},
        Event { "New Project", "" },			Sequence{}, Keypress { kc_N, mf_command + mf_shift }, ResSubslate { resid_NewFile }, endSequence{},
        Event { "New Workspace", "" },			Sequence{}, Keypress { kc_N, mf_command + mf_control }, ResSubslate { resid_NewFile }, endSequence{},
		Event { "New Target", "" },				Sequence{}, ClickMenu { "File" }, _down, TypeText { "New" }, _right, TypeText { "Target" }, ResSubslate { resid_projAddTarget },  endSequence{},
		Event { "Open Name", "" },				Sequence{}, Keypress { kc_O, mf_command }, ResSubslate { resid_OpenFile }, endSequence{},
		Event { "new group", "" },				Keypress { kc_N, mf_command + mf_option },
		Event { "new tab", "" },				_newTab,
		ExitEvent { "close window", "" },		Keypress { kc_W, mf_command + mf_shift },
		ExitEvent { "close tab", "" },			_closeTab,
		ExitEvent { "close document", "" },		Keypress { kc_W, mf_command + mf_control },
		ExitEvent { "close workspace", "" },	Keypress { kc_W, mf_command + mf_option },
		ExitEvent { "Save All", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "Save As", "" },				Sequence{}, Keypress { kc_S, mf_command + mf_shift }, ResSubslate { resid_SaveFile }, endSequence{},
		Event { "Open Recent", "" },			Sequence{}, TypeText { "Open Recent" }, _right, endSequence{},
		ExitEvent { "Open External", "" },		Sequence{}, TypeText { "Open with External Editor" }, _return, endSequence{},
		Event { "BBEdit", "" },					Sequence{}, TypeText { "Open with External Editor" }, _return, Launch { MainApps_"BBEdit.app", 0 }, ResSubslate { resid_XCBBEdit }, endSequence{},
		Event { "AppleScript", "" },			Sequence{}, TypeText { "Open with External Editor" }, _return, Launch { Apps_"Utilities/AppleScript Editor.app", resid_ScriptEditor }, endSequence{},
		Event { "add files", "" },				Sequence{}, Keypress { kc_A, mf_command + mf_option }, ResSubslate { resid_AddFiles }, endSequence{},
		Event { "Source Control", "" }, 		Sequence{}, TypeText { "Source Control" }, _right, ResSubslate { resid_SourceControl }, endSequence{},
		Event { "create snapshot", "" },		Keypress { kc_S, mf_command + mf_control },
		_DirectionKeys_,
		_LetterKeys_,
		_NumberKeys_,
	} }
} };

#define	fname_h	0		// filename field, from _window _topCenter
#define	fname_v	130
#define	flt_h	200		// filter field, from _window _topCenter
#define	flt_v	176
#define tg_h	-100	// target rows, from _window _topCenter
#define	tg_t	560
#define	tg_s	19
resource restype_Slate (resid_NewFile, "New File") { {
	Slate { "New File", {
		Event { "select name", "" },	Sequence{}, Click { 1, 0, 300, _window, _topCenter }, Wait { 10 }, Keypress { kc_left, mf_command }, Keypress { kc_down, mf_shift }, endSequence{},
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "select all", "" },		Keypress { kc_A, mf_command },
		Event { "next", "" },			_return,
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "superclass", "" },		Subslate { "superclass" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "object", "" },				TypeText { "NSObject" },
			ExitEvent { "managed object", "" },		TypeText { "NSManagedObject" },
			ExitEvent { "view", "" },				TypeText { "NSView" },
			ExitEvent { "view controller", "" },	TypeText { "NSViewController" },
			ExitEvent { "window controller", "" },	TypeText { "NSWindowController" },
			ExitEvent { "document", "" },			TypeText { "NSDocument" },
			ExitEvent { "plus wrapper", "" },		TypeText { "CPPWrapper" },
			endSubslate{},
		_FileSaveStandards_,
	} }
} };

#define	flt_h	350		// filter field, from _window _topCenter
#define	flt_v	40
resource restype_Slate (resid_OpenFile, "Open File") { {
	Slate { "Open File", {
		_SlateGlobals_,
		_FileOpenStandards_,
	} }
} };

#define	flt_h	350		// filter field, from _window _topCenter
#define	flt_v	120
resource restype_Slate (resid_AddFiles, "Add Files") { {
	Slate { "Add Files", {
		_SlateGlobals_,
		Event { "targets", "" },	ResSubslate { resid_SelectTargetsAdd },
		_FileOpenStandards_,
	} }
} };

#define _headerHt	60
resource restype_Slate (resid_SaveFile, "Save File Dialog") { {
	Slate { "Save", {
		_SlateGlobals_,
		_FileSaveStandards_,
	} }
} };

#define	_TargetAddItems_		\
		_SlateGlobals_,			\
		_CloseSubslate_,	\
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },	\
		Event { "page north", "" },		Keypress { kc_pageup, 0 },	\
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },	\
		Event { "target list", "" },	Click { 1, 0, 550, _window, _topCenter },	\
		Event { "row one", "" },		Click { 1, _offset, _trow+0*_rsp, _window, _topCenter },	\
		Event { "row two", "" },		Click { 1, _offset, _trow+1*_rsp, _window, _topCenter },	\
		Event { "row three", "" },		Click { 1, _offset, _trow+2*_rsp, _window, _topCenter },	\
		Event { "row four", "" },		Click { 1, _offset, _trow+3*_rsp, _window, _topCenter },	\
		Event { "row five", "" },		Click { 1, _offset, _trow+4*_rsp, _window, _topCenter },	\
		_IMouseSlate_,	\
		_LetterKeys_,	\
		_NumberKeys_

#define _offset		-90
#define _rsp		18
#define	_trow		486
resource restype_Slate (resid_SelectTargetsAdd, "Select Add Targets") { {
	Slate { "Select Add", {
		_TargetAddItems_,
	} }
} };

#define	_trow		505
resource restype_Slate (resid_SelectTargetsNew, "Select New Targets") { {
	Slate { "Select New", {
		_TargetAddItems_,
	} }
} };

#pragma mark 1 --- SourceControl
resource restype_Slate (resid_SourceControl, "Source Control") { {
	Slate { "scm", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },			CloseSubslate{},
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		Event { "execute", "" },			_return,
		Event { "return	", "" },			_return,
		Event { "check branch", "" },		Keypress { kc_escape, 0 },
		Event { "refresh", "" },			TypeText { "Refresh Status" },
		Event { "history", "" },			TypeText { "History" },
		Event { "commit", "" },				Sequence{}, TypeText { "Commit" }, _return, ResSubslate { resid_Commit }, endSequence{},
	} }
} };

#pragma mark Branch
// NOTE: Switching Branches with this menu command does checkout with --merge flag, which we do not want
resource restype_Slate (resid_Branch, "") { {
	Slate { "Branch",	{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "execute", "" },		_return,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark Commit
resource restype_Slate (resid_Commit, "Commit") { {
	Slate { "commit", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "commit", "" },		Click { 1, -92, -32, _window, _bottomRight },
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
		_Focus_,
		_FocusBack_,
		Event { "down again", "" },		_down,
		Event { "top", "" },			Sequence{}, Click { 0, 157, 157, _window, _topLeft },
			Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "next", "" },			Sequence{}, Click { 0, 0, 17, _cursor },
			Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "previous", "" },		Sequence{}, Click { 0, 0, -17, _cursor },
			Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "checkbox", "" },		Click { 1, -100, 0, _cursor },
		Event { "list", "" },			Click { 1, -160, -112, _window, _bottomLeft },
		Event { "difference", "" },		Click { 1, 100, 125, _window, _topCenter },
		Event { "message", "" },		Click { 1, 0, -130, _window, _bottomCenter },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
	} }
} };

#pragma mark 2 --- Edit Menu
resource restype_Slate (resid_EditMenu, "Edit") { {
	Slate { "Edit", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "copy", "" },		Keypress { kc_C, mf_command },
		ExitEvent { "paste", "" },		Keypress { kc_V, mf_command + mf_option + mf_shift },
	} }
} };

#pragma mark 3 --- Refactor
#define	_ahead		Keypress { kc_tab, mf_option }
#define _back		Keypress { kc_tab, mf_option + mf_shift }
#define _content	Click { 1, -200, -200, _window, _bottomRight },	\
						_ahead, _ahead, _ahead, _ahead, _ahead, _ahead, _ahead, _ahead, _ahead
#define _rowleft	137
#define _rowtop		213
#define _rsp		17
resource restype_Slate (resid_Refactor, "Refactor") { {
	Slate { "Refactor", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		CloseSubslate{},
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		Event { "rename", "" },				Sequence{}, TypeText { "rename" }, _return, endSequence{},
		Event { "extract", "" },			Sequence{}, TypeText { "extract" }, _return, endSequence{},
		Event { "create superclass", "" },	Sequence{}, TypeText { "create superclass" }, _return, endSequence{},
		Event { "move up", "" },			Sequence{}, TypeText { "move up" }, _return, endSequence{},
		Event { "move down", "" },			Sequence{}, TypeText { "move down" }, _return, endSequence{},
		Event { "encapsulate", "" },		Sequence{}, TypeText { "encapsulate" }, _return, endSequence{},
		Event { "paste", "" },				Keypress { kc_V, mf_command	 },
		Event { "preview", "" },			Sequence{}, _return, ResSubslate { resid_refactorPreview }, endSequence{},
		_TypeXcodeSlate_,
		_IMouseSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
	} }
} };

#pragma mark refactorPreview
resource restype_Slate (resid_refactorPreview, "") { {
	Slate { "preview",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "save", "" },		Click { 1, -85, -33, _window, _bottomRight },
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		Event { "view", "" },			ResSubslate { resid_refactorView },
		Event { "top row", "" },		Sequence{}, Click { 0, _rowleft, _rowtop+0*_rsp, _window, _topLeft }, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "row zero", "" },		Sequence{}, Click { 0, _rowleft, _rowtop-22, _window, _topLeft }, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "next row", "" },		Sequence{}, Click { 0, 0, 17, _cursor }, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "row down", "" },		Sequence{}, Click { 0, 0, 17, _cursor }, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "previous row", "" },	Sequence{}, Click { 0, 0, -17, _cursor }, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "row north", "" },		Sequence{}, Click { 0, 0, -17, _cursor }, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "difference", "" },		Click { 1, 106, 182, _window, _topCenter },
		_DirectionKeys_,
		Event { "row one", "" },		Click { 1, _rowleft, _rowtop+0*_rsp, _window, _topLeft },
		Event { "row two", "" },		Click { 1, _rowleft, _rowtop+1*_rsp, _window, _topLeft },
		Event { "row three", "" },		Click { 1, _rowleft, _rowtop+2*_rsp, _window, _topLeft },
		Event { "row four", "" },		Click { 1, _rowleft, _rowtop+3*_rsp, _window, _topLeft },
		Event { "row five", "" },		Click { 1, _rowleft, _rowtop+4*_rsp, _window, _topLeft },
		Event { "row six", "" },		Click { 1, _rowleft, _rowtop+5*_rsp, _window, _topLeft },
		Event { "row seven", "" },		Click { 1, _rowleft, _rowtop+6*_rsp, _window, _topLeft },
		Event { "row eight", "" },		Click { 1, _rowleft, _rowtop+7*_rsp, _window, _topLeft },
		Event { "row nine", "" },		Click { 1, _rowleft, _rowtop+8*_rsp, _window, _topLeft },
		Event { "row ten", "" },		Click { 1, _rowleft, _rowtop+9*_rsp, _window, _topLeft },
		Event { "row eleven", "" },		Click { 1, _rowleft, _rowtop+10*_rsp, _window, _topLeft },
		Event { "row twelve", "" },		Click { 1, _rowleft, _rowtop+11*_rsp, _window, _topLeft },
	} }
} };

#pragma mark refactorView
resource restype_Slate (resid_refactorView, "") { {
	Slate { "view",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "project", "" },	Click { 1, -800, 165, _window, _topCenter },
		ExitEvent { "flat", "" },		Click { 1, -766, 165, _window, _topCenter },
		ExitEvent { "issue", "" },		Click { 1, -732, 165, _window, _topCenter },
	} }
} };

#pragma mark 4 --- ProductMenu
resource restype_Slate (resid_ProductMenu, "") { {
	Slate { "Product",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "archive", "" },					TypeText { "Archive" },
		Event { "perform action", "" },				Sequence{}, TypeText { "Perform Action" }, _right, endSequence{},
		Event { "create bot", "" },					TypeText { "Create Bot" },
		Event { "scheme", "" },						Sequence{}, TypeText { "Scheme" }, _right, endSequence{},
		ExitEvent { "next scheme", "" },			Keypress { kc_closebracket, mf_command + mf_control },
		ExitEvent { "previous scheme", "" },		Keypress { kc_bracket, mf_command + mf_control },
		ExitEvent { "next destination", "" },		Keypress { kc_closebracket, mf_command + mf_control },
		ExitEvent { "previous destination", "" },	Keypress { kc_bracket, mf_command + mf_control },
	} }
} };

#pragma mark 5 --- Scripts
resource restype_Slate (resid_Scripts, "Scripts") { {
	Slate { "Scripts", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		_IMouseSlate_,
		_DirectionKeys_,
		ExitEvent { "window tall", "" },		Sequence{}, TypeText { "windowTall" }, _return, endSequence{},
		ExitEvent { "window short", "" },		Sequence{}, TypeText { "windowShort" }, _return, endSequence{},
		ExitEvent { "view in browser", "" },	Sequence{}, TypeText { "viewCdoc" }, _return, endSequence{},
		ExitEvent { "view C doc", "" },			Sequence{}, TypeText { "viewCdoc" }, _return, endSequence{},
		ExitEvent { "view Doxygen", "" },		Sequence{}, TypeText { "viewDoxygen" }, _return, endSequence{},
	} }
} };

#pragma mark 4 === Target
// inside: 1 Accessor; 2 Words

#define _rtop	142
#define _rsp	18
#define	_targetPopup	Click { 1, 125, 40, _window, _topLeft }
#define _targetList		ClickMenu { "Product" }, TypeText { "Scheme" }, _right
#pragma mark Target
resource restype_Slate (resid_Target, "Target") { {
	Slate { "Target",	{
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		Event { "assistant", "" },		_assistantEditor,
		Event { "version", "" },		_versionEditor,
		Event { "standard", "" },		_standardEditor,
		Event { "Workspace", "" },		ResSubslate { resid_Workspace },
		Event { "save files", "" },		Keypress { kc_S, mf_command + mf_option },
		Event { "test", "" },			Keypress { kc_U, mf_command },
		Event { "analyze", "" },		Keypress { kc_B, mf_command + mf_shift },
		Event { "build", "" },			Keypress { kc_B, mf_command },
		Event { "run", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_RunTarget }, endSequence{},
		Event { "run words", "" },		Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_RunWords }, endSequence{},
		Event { "profile", "" },		Sequence{}, Keypress { kc_I	, mf_command }, ResSubslate { resid_Profile }, endSequence{},
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "validate", "" },		Sequence{}, ResSubslate { resid_BBValidate }, Launch { MainApps_"BBEdit.app", 0 }, endSequence{},
		Event { "open Dash", "" },		_openDash,
		Event { "Browser", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},
		Event { "view Doxygen", "" },	Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_BrowseDoxygen }, endSequence{},
		Event { "marker", "" },			ResSubslate { resid_Marker },
		_GoToReference_,
		Event { "project", "" },		Keypress { kc_1, mf_command },
		Event { "symbol", "" },			Keypress { kc_2, mf_command },
		Event { "issue", "" },			Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_IssueIndex }, endSequence{},
		Event { "debug", "" },			Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_DebugIndex }, endSequence{},
		Event { "log", "" },			Sequence{}, Keypress { kc_8, mf_command }, ResSubslate { resid_LogIndex }, endSequence{},
		Event { "Index", ""	},			ResSubslate { resid_Index },
		Event { "Utility", "" },		ResSubslate { resid_Utilities },
		Event { "Stickies", "" },		Sequence{}, ResSubslate { resid_Stickies }, Launch { Apps_"Stickies.app", 0 }, endSequence{},
		Event { "continue", "" },		Keypress { kc_Y, mf_command + mf_control },
		Event { "archive", "" },		Sequence{}, ClickMenu { "Product" }, TypeText { "Archive" }, _return, endSequence{},
		Event { "clean", "" },			Keypress { kc_K, mf_command + mf_shift },
		Event { "click back", "" },		Click { 1, -500, 40, _window, _topRight },
		Event { "scheme", "" },			Sequence{}, _targetPopup, ResSubslate { resid_TargetScheme }, endSequence{},
		Event { "pop up", "" },			Sequence{}, _targetPopup, ResSubslate { resid_TargetPopup }, endSequence{},
		_Focus_,
		_FocusBack_,
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go tab", "" },			_goTab,
		Event { "new tab", "" },		_newTab,
		Event { "close tab", "" },		_closeTab,
		Event { "skip ahead", "" },		_skipAhead,
		Event { "skip back", "" },		_skipBack,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
		Event { "build Accessor", "" },	Sequence{}, Keypress { kc_S, mf_command + mf_option }, Launch { Dev_"Accessor/Accessor.xcworkspace", 0 }, ResSubslate { resid_Accessor }, endSequence{},
		Event { "Test Target", "" },	Sequence{}, _targetList, TypeText { "Test" }, _return, endSequence{},
		Event { "Setup", "" },			Sequence{}, _targetList, TypeText { "Developer_Setup" }, _return, endSequence{},
		Event { "Developer", "" },		Sequence{}, _targetList, TypeText { "Developer" }, _return, endSequence{},
		Event { "Xcode", "" },			Sequence{}, _targetList, TypeText { "Xcode" }, _return, endSequence{},
		Event { "BBEdit", "" },			Sequence{}, _targetList, TypeText { "BBEdit" }, _return, endSequence{},
		Event { "Accessor", "" },		Sequence{}, _targetList, TypeText { "Accessor" }, _return, endSequence{},
		Event { "In House", "" },		Sequence{}, _targetList, TypeText { "InHouse" }, _return, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, _targetList, TypeText { "Doxygen" }, _return, endSequence{},
		Event { "C doc", "" },			Sequence{}, _targetList, TypeText { "Cdoc" }, _return, endSequence{},
		Event { "All Tests", "" },		Sequence{}, _targetList, TypeText { "AllTests" }, _return, endSequence{},
		Event { "User Slates", "" },	Sequence{}, _targetList, TypeText { "UserSlates" }, _return, endSequence{},
		Event { "Words", "" },			Sequence{}, _targetList, TypeText { "Words" }, _return, endSequence{},
		Event { "CCDev", "" },			Sequence{}, _targetList, TypeText { "CCDev" }, _return, endSequence{},
		_SlateGlobals_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
	} }
} };

resource restype_Slate (resid_Profile, "") { {
	Slate { "Profile",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "authorize", "" },		Sequence{}, TypeText { "6868" }, _return, endSequence{},
		Event { "activate", "" },		Launch { DevApps_"Instruments.app", 0 },
		Event { "record", "" },			Keypress { kc_R, mf_command },
		Event { "trace", "" },			Keypress { kc_R, mf_command },
		Event { "stop", "" },			Keypress { kc_R, mf_command },
		ExitEvent { "quit", "" },		Keypress { kc_Q, mf_command },
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "type", "" },			ResSubslate { resid_TypeSlate },
	} }
} };

resource restype_Slate (resid_RunTarget, "") { {
	Slate { "RunTarget",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "quit", "" },		Keypress { kc_Q, mf_command },
		Event { "debug", "" },			ResSubslate { resid_DebugIndex },
		Event { "continue", "" },		Keypress { kc_Y, mf_command + mf_control },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_CommandSlate_,
		Event { "type", "" },			ResSubslate { resid_TypeSlate },
	} }
} };

resource restype_Slate (resid_TargetScheme, "") { {
	Slate { "TargetScheme",	{
		_PopupStandards_,
		ExitEvent { "edit", "" },		Sequence{}, TypeText { "Edit Scheme" }, _down, _return, endSequence{},
		Event { "manage", "" },			Sequence{}, TypeText { "Manage Schemes" }, _down, _return, endSequence{},
		Event { "manage button", "" },	Click { 1, -100, 215, _window, _topCenter },
		Event { "shared", "" },			Click { 1, 284, 0, _cursor },
		Event { "show", "" },			Click { 1, -284, 0, _cursor },
		Event { "Xcode", "" },			Sequence{}, TypeText { "Xcode" }, _down, _return, endSequence{},
		Event { "Setup", "" },			Sequence{}, TypeText { "Developer_Setup" }, _down, _return, endSequence{},
		Event { "Developer", "" },		Sequence{}, TypeText { "Developer" }, _down, _return, endSequence{},
		Event { "Accessor", "" },		Sequence{}, TypeText { "Accessor" }, _down, _return, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, TypeText { "Doxygen" }, _down, _return, endSequence{},
		Event { "C doc", "" },			Sequence{}, TypeText { "Cdoc" }, _down, _return, endSequence{},
		Event { "row one", "" },		Click { 0, 0, 150+(1*_rsp), _window, _topCenter },
		Event { "row two", "" },		Click { 0, 0, 150+(2*_rsp), _window, _topCenter },
		Event { "row three", "" },		Click { 0, 0, 150+(3*_rsp), _window, _topCenter },
		Event { "row four", "" },		Click { 0, 0, 150+(4*_rsp), _window, _topCenter },
		Event { "row five", "" },		Click { 0, 0, 150+(5*_rsp), _window, _topCenter },
		Event { "row six", "" },		Click { 0, 0, 150+(6*_rsp), _window, _topCenter },
		Event { "row seven", "" },		Click { 0, 0, 150+(7*_rsp), _window, _topCenter },
		Event { "row eight", "" },		Click { 0, 0, 150+(8*_rsp), _window, _topCenter },
	} }
} };

resource restype_Slate (resid_TargetPopup, "") { {
	Slate { "TargetPopup",	{
		_PopupStandards_,
	} }
} };

#pragma mark 1 --- Accessor
resource restype_Slate (resid_Accessor, "") { {
	Slate { "Accessor",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "InHouse", "" },		Sequence{}, _targetList, TypeText { "InHouse" }, _return, endSequence{},
		Event { "analyze", "" },		Keypress { kc_B, mf_command + mf_shift },
		Event { "clean", "" },			Keypress { kc_K, mf_command + mf_shift },
		Event { "build", "" },			Sequence{}, Keypress { kc_B, mf_command }, ResSubslate { resid_BuildAccessor }, endSequence{},
		Event { "run", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_BuildAccessor }, endSequence{},
	} }
} };

resource restype_Slate (resid_BuildAccessor, "") { {
	Slate { "Accessor",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },		NilAction{},
		Event { "Target", "" },			Sequence{}, CloseSubslate{}, CloseSubslate{}, ResSubslate { resid_Target }, endSequence{},
		Event { "run original", "" },	Sequence{}, Click { 0, 1335, 365, _screen, _topLeft }, Launch { HomeApps_"Accessor.app", 0 }, endSequence{},
		Event { "return", "" },			_return,
		Event { "quit", "" },			Keypress { kc_Q, mf_command },
	} }
} };

#pragma mark 2 --- Words
#define _TypeEntityItems_			\
Event { "picture", "" },		TypeText { "Picture" },		\
Event { "words", "" },			TypeText { "Word" }

resource restype_Slate (resid_RunWords, "") { {
	Slate { "RunWords",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "quit", "" },		Keypress { kc_Q, mf_command },
		Event { "debug", "" },			ResSubslate { resid_DebugIndex },
		Event { "continue", "" },		Keypress { kc_Y, mf_command + mf_control },
		Event { "test 1", "" },			Keypress { kc_1, mf_command },
		Event { "test 2", "" },			Keypress { kc_2, mf_command },
		Event { "entity	menu", "" },	Click { 1, 230, 10, _screen, _topLeft },
		Event { "picture", "" },		Sequence{}, Keypress { kc_1, mf_command + mf_shift }, ResSubslate { resid_wordsPictures }, endSequence{},
		Event { "words", "" },			Sequence{}, Keypress { kc_2, mf_command + mf_shift }, ResSubslate { resid_wordsWords }, endSequence{},
		_DirectionKeys_,
		_WhitespaceKeys_,
		_CommandSlate_,
		_IMouseSlate_,
		Event { "type", "" },			ResSubslate { resid_TypeSlate },
	} }
} };

#define _EntityStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		_DirectionKeys_,	\
		_WhitespaceKeys_,	\
		_CommandSlate_,		\
		_IMouseSlate_

#pragma mark Picture
resource restype_Slate (resid_wordsPictures, "") { {
	Slate { "Pictures",	{
		Event { "Add Picture", "" },		Keypress { kc_A, mf_command + mf_option },
		Event { "Show File Images", "" },	Keypress { kc_I, mf_command + mf_option },
		Event { "words", "" },				Sequence{}, CloseSubslate{}, Keypress { kc_2, mf_command + mf_shift }, ResSubslate { resid_wordsWords }, endSequence{},
		_EntityStandards_,
	} }
} };

#pragma mark Word
resource restype_Slate (resid_wordsWords, "") { {
	Slate { "Words",	{
		Event { "picture", "" },			Sequence{}, CloseSubslate{}, Keypress { kc_1, mf_command + mf_shift }, ResSubslate { resid_wordsPictures }, endSequence{},
		_EntityStandards_,
	} }
} };

#pragma mark 5 === Editors
// inside: _EditorStandards_, 1 Marker, 2 Standard, 3 Assistant, 4 Version, 5 ProjectSettings, 6 Workspace, 7 Interface Builder, 8 Data Model Editor
// Editor Standards
#define	_Editors_ 	 				\
		Event { "Interface", "" },		ResSubslate { resid_InterfaceBuilder },	\
		Event { "Data Model", "" },		ResSubslate { resid_DataModel },		\
		Event { "Workspace", "" },		ResSubslate { resid_Workspace }

#define		_EditorStandards_	\
		Event { "filter", "" },			ResSubslate { resid_navFilter },	\
		Event { "marker", "" },			ResSubslate { resid_Marker }, 		\
		_GoToReference_,														\
		Event { "save files", "" },		Keypress { kc_S, mf_command + mf_option },		\
		_Focus_,																\
		_FocusBack_,															\
		Event { "skip ahead", "" },		_skipAhead,							\
		Event { "skip back", "" },		_skipBack,							\
		Event { "new tab", "" },		Keypress { kc_T, mf_command },		\
		Event { "close tab", "" },		_closeTab,		\
		Event { "go next", "tab" },		_goNext,							\
		Event { "go previous", "tab" },	_goPrevious,						\
		Event { "go tab", "" },			_goTab,								\
		Event { "open Assist", "" },	Sequence{}, ClickMenu { "Navigate" }, _down, TypeText { "Open in Assistant Editor" }, _return, endSequence{},		\
		Event { "pop issues", "" },		Click { 1, -24, 108, _window, _topRight },		\
		Event { "next issue", "" },		_nextIssue,		\
		Event { "previous issue", "" },	_previousIssue,		\
		_JumpBar_,		\
		Event { "reveal file", "" },	Keypress { kc_J, mf_command + mf_shift },		\
		Event { "reveal symbol", "" },	Sequence{}, ClickMenu { "Navigate" }, _down, TypeText { "Reveal in Symbol Navigator" }, _return, endSequence{},		\
		Event { "Stickies", "" },		Sequence{}, ResSubslate { resid_Stickies }, Launch { Apps_"Stickies.app", 0 }, endSequence{},	\
		_openDash,							\
		Event { "Script", "" },			Sequence{}, _systemScriptsMenu, ResSubslate { resid_Scripts }, Wait { 60 }, _down, TypeText { "Xcode" }, _right, endSequence{}, \
		_Editors_,							\
		Event { "Browser", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},		\
		Event { "Doxygen", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_BrowseDoxygen }, endSequence{},	\
		Event { "Index", ""	},			ResSubslate { resid_Index },		\
		Event { "Utility", "" },		ResSubslate { resid_Utilities },	\
		_SlateGlobals_,			\
		_CloseSubslate_,		\
		_IMouseSlate_,			\
		_DirectionKeys_,		\
		_CloseDocument_,			\
		_JumpNorthSubslate_,	\
		_JumpDownSubslate_,		\
		_PageKeys_,				\
		_TypeXcodeSlate_

#define _hideOpenFindBar		Click { 1, -30, 110, _window, _topRight }
#define	_findMarkerStart		Sequence{}, Keypress { kc_F, mf_command }
#define _findMarkerEnd			_hideOpenFindBar, endSequence{}
#pragma mark 1 --- Marker
resource restype_Slate (resid_Marker, "") { {
	Slate { "Marker",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "current", "" },	_findMarkerStart, TypeText { "id='hmark_Current'" }, _findMarkerEnd,
		Event { "pragma", "" },			_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark" }, _findMarkerEnd,
		Event { "resource", "" },		_findMarkerStart, TypeText { "resource" }, _findMarkerEnd,
		Event { "top", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark === Markers ===" }, _findMarkerEnd,
		Event { "zero", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 0 ===" }, _findMarkerEnd,
		Event { "one", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 1 ===" }, _findMarkerEnd,
		Event { "two", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 2 ===" }, _findMarkerEnd,
		Event { "three", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 3 ===" }, _findMarkerEnd,
		Event { "four", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 4 ===" }, _findMarkerEnd,
		Event { "five", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 5 ===" }, _findMarkerEnd,
		Event { "six", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 6 ===" }, _findMarkerEnd,
		Event { "seven", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 7 ===" }, _findMarkerEnd,
		Event { "eight", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 8 ===" }, _findMarkerEnd,
		Event { "nine", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 9 ===" }, _findMarkerEnd,
		Event { "inside", "" },		Subslate { "inside" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "zero", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 0 -" }, _findMarkerEnd,
			ExitEvent { "one", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 1 -" }, _findMarkerEnd,
			ExitEvent { "two", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 2 -" }, _findMarkerEnd,
			ExitEvent { "three", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 3 -" }, _findMarkerEnd,
			ExitEvent { "four", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 4 -" }, _findMarkerEnd,
			ExitEvent { "five", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 5 -" }, _findMarkerEnd,
			ExitEvent { "six", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 6 -" }, _findMarkerEnd,
			ExitEvent { "seven", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 7 -" }, _findMarkerEnd,
			ExitEvent { "eight", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 8 -" }, _findMarkerEnd,
			ExitEvent { "nine", "" },		_findMarkerStart, Keypress { kc_3, mf_shift }, TypeText { "pragma mark 9 -" }, _findMarkerEnd,
			endSubslate{},
		Event { "hide find bar", "" },	_hideOpenFindBar,
		Event { "next", "" },			Keypress { kc_G, mf_command },
		Event { "previous", "" },		Keypress { kc_G, mf_command + mf_shift },
	} }
} };

#pragma mark 2 --- StandardEditor
resource restype_Slate (resid_StandardEditor, "") { {
	Slate { "std",	{
		Event { "standard", "" },			_standardEditor,
		Event { "target", "" },				ResSubslate { resid_Target },
		Event { "project settings", "" },	Sequence{}, Keypress { kc_return, mf_command }, _showHideNavigator, ResSubslate { resid_ProjectSettings }, endSequence{},
		_EditorStandards_,
	} }
} };

#pragma mark 3 --- AssistantEditor
resource restype_Slate (resid_AssistantEditor, "") { {
	Slate { "asst",	{
		Event { "assistant", "" },		_assistantEditor,
		Event { "split panel", "" },	Sequence{}, ClickMenu { "View" }, _down, TypeText { "Assistant Editor" }, _right, ResSubslate { resid_asstSplit }, endSequence{},
		Event { "other side", "" },		Keypress { kc_comma, mf_command + mf_option },
		_JumpBar_,
		Event { "target", "" },			ResSubslate { resid_Target },
 		_EditorStandards_,
	} }
} };

resource restype_Slate (resid_asstSplit, "") { {
	Slate { "split",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "right", "" },			Sequence{}, TypeText { "Assistant Editors on Right" }, _return, endSequence{},
		ExitEvent { "bottom", "" },			Sequence{}, TypeText { "Assistant Editors on Bottom" }, _return, endSequence{},
	} }
} };

#pragma mark 4 --- VersionEditor
resource restype_Slate (resid_VersionEditor, "") { {
	Slate { "vers",	{
		Event { "version", "" },		_versionEditor,
		Event { "compare", "" },		Keypress { kc_C, mf_option + mf_control },
		Event { "blame", "" },			Keypress { kc_B, mf_option + mf_control },
		Event { "log", "" },			Keypress { kc_L, mf_option + mf_control },
		Event { "top", "" },			Sequence{}, Click { 1, 310, 160, _window, _topLeft }, Keypress { kc_up, mf_command }, endSequence{},
		Event { "end", "" },			Sequence{}, Click { 1, 310, 160, _window, _topLeft }, Keypress { kc_down, mf_command }, _up, _up, _up, _up, endSequence{},
		Event { "difference", "" },		Click { 1, 125, 125, _window, _topCenter },
		Event { "down again", "" },		_down,
		Event { "commit", "" },			Sequence{}, Keypress { kc_C, mf_command + mf_option }, ResSubslate { resid_Commit }, endSequence{},
		_EditorStandards_,
	} }
} };

#define _targetList		Click { 2, 14, -73, _window, _bottomLeft }
#pragma mark 5 --- ProjectSettings
resource restype_Slate (resid_ProjectSettings, "Project") { {
	Slate { "projSettings", {
		ExitEvent { "okay", "" },		_showHideNavigator,
		ExitEvent { "exit", "" },		NilAction{},
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "add target", "" },		Sequence{}, Click { 1, 86, -36, _window, _bottomLeft }, ResSubslate { resid_projAddTarget }, endSequence{},
		Event { "add build phase", "" },	Sequence{}, Click { 1, -72, -36, _window, _bottomRight }, ResSubslate { resid_projAddPhase }, endSequence{},
		Event { "modernize", "" },		Click { 1, 0, -36, _window, _bottomCenter },
		Event { "target list", "" },	ResSubslate { resid_projTargetList },
		Event { "info", "" },			Click { 1, -80, 134, _window, _topCenter },
		Event { "build settings", "" },	Click { 1, -5, 134, _window, _topCenter },
		Event { "build phases", "" },	Click { 1, 115, 134, _window, _topCenter },
		Event { "build rules", "" },	Click { 1, 250, 134, _window, _topCenter },
		Event { "open run script", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, ResSubslate { resid_phaseRunScript }, endSequence{},
		Event { "open dependencies", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open compile sources", "" },	Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Files", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Headers", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Resources", "" },	Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Link", "" },				Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		_SlateGlobals_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go tab", "" },			_goTab,
		Event { "scroll top", "" },		Click { 1, -7, 179, _window, _topRight },
		Event { "scroll end", "" },		Click { 1, -7, -99, _window, _bottomRight },
		Event { "search field", "" },	Click { 1, -100, 153, _window, _topRight },
		Event { "delete phase", "" },	Click { 0, 1640, 0, _cursor },
		Event { "add items", "" },		Click { 1, 3, 0, _cursor },
		Event { "remove items", "" },	Click { 0, 31, 0, _cursor },
		Event { "phase one", "" },		Click { 0, il_h+8, il_r1 + 0 * il_psp, _window, _topLeft },
		Event { "phase two", "" },		Click { 0, il_h+8, il_r1 + 1 * il_psp, _window, _topLeft },
		Event { "phase three", "" },	Click { 0, il_h+8, il_r1 + 2 * il_psp, _window, _topLeft },
		Event { "phase four", "" },		Click { 0, il_h+8, il_r1 + 3 * il_psp, _window, _topLeft },
		Event { "phase five", "" },		Click { 0, il_h+8, il_r1 + 4 * il_psp, _window, _topLeft },
		Event { "phase six", "" },		Click { 0, il_h+8, il_r1 + 5 * il_psp, _window, _topLeft },
		Event { "phase seven", "" },	Click { 0, il_h+8, il_r1 + 6 * il_psp, _window, _topLeft },
		Event { "phase eight", "" },	Click { 0, il_h+8, il_r1 + 7 * il_psp, _window, _topLeft },
		Event { "phase nine", "" },		Click { 0, il_h+8, il_r1 + 8 * il_psp, _window, _topLeft },
		Event { "phase ten", "" },		Click { 0, il_h+8, il_r1 + 9 * il_psp, _window, _topLeft },
		Event { "phase eleven", "" },	Click { 0, il_h+8, il_r1 + 10 * il_psp, _window, _topLeft },
		Event { "phase twelve", "" },	Click { 0, il_h+8, il_r1 + 11 * il_psp, _window, _topLeft },
		Event { "phase end one", "" },		Click { 0, il_h+8, -75 - 0 * il_psp, _window, _bottomLeft },
		Event { "phase end two", "" },		Click { 0, il_h+8, -75 - 1 * il_psp, _window, _bottomLeft },
		Event { "phase end three", "" },	Click { 0, il_h+8, -75 - 2 * il_psp, _window, _bottomLeft },
		Event { "phase end four", "" },		Click { 0, il_h+8, -75 - 3 * il_psp, _window, _bottomLeft },
		Event { "north one", "" },			Click { 0, 0, -1 * il_rsp, _cursor },
		Event { "north two", "" },			Click { 0, 0, -2 * il_rsp, _cursor },
		Event { "north three", "" },		Click { 0, 0, -3 * il_rsp, _cursor },
		Event { "north four", "" },			Click { 0, 0, -4 * il_rsp, _cursor },
		Event { "north five", "" },			Click { 0, 0, -5 * il_rsp, _cursor },
		Event { "north ten", "" },			Click { 0, 0, -10 * il_rsp, _cursor },
		Event { "row one", "" },			Click { 0, 0, 20 + 0 * il_rsp, _cursor },
		Event { "row two", "" },			Click { 0, 0, 20 + 1 * il_rsp, _cursor },
		Event { "row three", "" },			Click { 0, 0, 20 + 2 * il_rsp, _cursor },
		Event { "row four", "" },			Click { 0, 0, 20 + 3 * il_rsp, _cursor },
		Event { "row five", "" },			Click { 0, 0, 20 + 4 * il_rsp, _cursor },
		Event { "row six", "" },			Click { 0, 0, 20 + 5 * il_rsp, _cursor },
		Event { "row seven", "" },			Click { 0, 0, 25 + 6 * il_rsp, _cursor },
		Event { "row eight", "" },			Click { 0, 0, 25 + 7 * il_rsp, _cursor },
		Event { "row nine", "" },			Click { 0, 0, 25 + 8 * il_rsp, _cursor },
		Event { "row ten", "" },			Click { 0, 0, 25 + 9 * il_rsp, _cursor },
		Event { "row eleven", "" },			Click { 0, 0, 25 + 10 * il_rsp, _cursor },
		Event { "row twelve", "" },			Click { 0, 0, 25 + 11 * il_rsp, _cursor },
		Event { "row thirteen", "" },		Click { 0, 0, 25 + 12 * il_rsp, _cursor },
		Event { "row fourteen", "" },		Click { 0, 0, 25 + 13 * il_rsp, _cursor },
		Event { "row fifteen", "" },		Click { 0, 0, 25 + 14 * il_rsp, _cursor },
		Event { "row sixteen", "" },		Click { 0, 0, 25 + 15 * il_rsp, _cursor },
		Event { "row seventeen", "" },		Click { 0, 0, 25 + 16 * il_rsp, _cursor },
		Event { "row eighteen", "" },		Click { 0, 0, 25 + 17 * il_rsp, _cursor },
		Event { "row nineteen", "" },		Click { 0, 0, 25 + 18 * il_rsp, _cursor },
		Event { "row twenty", "" },			Click { 0, 0, 25 + 19 * il_rsp, _cursor },
		Event { "row twenty one", "" },		Click { 0, 0, 25 + 20 * il_rsp, _cursor },
		Event { "row twenty two", "" },		Click { 0, 0, 25 + 21 * il_rsp, _cursor },
		Event { "row twenty three", "" },	Click { 0, 0, 25 + 22 * il_rsp, _cursor },
		Event { "row twenty four", "" },	Click { 0, 0, 25 + 23 * il_rsp, _cursor },
		Event { "row twenty five", "" },	Click { 0, 0, 25 + 24 * il_rsp, _cursor },
		Event { "row twenty six", "" },		Click { 0, 0, 25 + 25 * il_rsp, _cursor },
		Event { "row twenty seven", "" },	Click { 0, 0, 25 + 26 * il_rsp, _cursor },
		Event { "row twenty eight", "" },	Click { 0, 0, 25 + 27 * il_rsp, _cursor },
		Event { "row twenty nine", "" },	Click { 0, 0, 25 + 28 * il_rsp, _cursor },
		Event { "row thirty", "" },			Click { 0, 0, 25 + 29 * il_rsp, _cursor },
	} }
} };

#pragma mark ..Targets
resource restype_Slate (resid_projTargetList, "projTargetList") { {
	Slate { "tarList", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		Event { "north", "" },		Sequence{}, _targetList, _up, endSequence{},
		Event { "down", "" },		Sequence{}, _targetList, _down, endSequence{},
	} }
} };

#define	fname_h	0		// filename field, from _window _topCenter
#define	fname_v	130
#define	flt_h	200		// filter field, from _window _topCenter
#define	flt_v	176
#define tg_h	-72		// target rows, from _window _topCenter
#define	tg_t	386
#define	tg_s	19
resource restype_Slate (resid_projAddTarget, "AddTarget") { {
	Slate { "addTarget", {
		_FileSaveStandards_,
		Event { "tab forward", "" },	_tab,
		Event { "tab back", "" },		_tabBack,
	} }
} };

#pragma mark ..BuildPhases
resource restype_Slate (resid_projAddPhase, "AddPhase") { {
	Slate { "addPhase", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },				_return,
		ExitEvent { "exit", "" },				NilAction{},
		Event { "Copy Files", "" },				TypeText { "Add Copy Files" },
		Event { "Run Script", "" },				TypeText { "Add Run Script" },
		Event { "Copy Headers", "" },			TypeText { "Add Copy Headers" },
		Event { "Copy Bundle Resources", "" },	TypeText { "Add Copy Headers" },
		Event { "Link", "" },					TypeText { "Add Link" },
	} }
} };

#define _PhaseStandards_		\
		_SlateGlobals_,			\
		_CloseSubslate_,		\
		_IMouseSlate_,			\
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },		\
		_DirectionKeys_,		\
		_WhitespaceKeys_,		\
		_TypeXcodeSlate_,		\
		_JumpDownSubslate_,		\
		_JumpNorthSubslate_,	\
		_DoJumpSubslate_

resource restype_Slate (resid_phaseRunScript, "resid_phaseRunScript") { {
	Slate { "phScript", {
		_PhaseStandards_,
		Event { "edit name", "" },			Click { 2, 40, 0, _cursor },
		Event { "shebang", "" },			Click { 1, 110, 27, _cursor },
		Event { "show environment", "" },	Click { 1, 8, 105, _cursor },
		Event { "run only", "" },			Click { 1, 8, 124, _cursor },
		Event { "script", "" },				Click { 1, 124, 68, _cursor },
	} }
} };

#pragma mark 6 --- Workspace
resource restype_Slate (resid_Workspace, "") { {
	Slate { "Workspace",	{
		ExitEvent { "Carbon", "" },			Launch { Dev_"AccessorC9/AccessorC9.xcworkspace", 0 },
		ExitEvent { "Accessor", "" },		Launch { Dev_"Accessor/Accessor.xcworkspace", 0 },
		ExitEvent { "Punkin", "" },			Launch { Dev_"Punkin/Punkin.xcworkspace", 0 },
		ExitEvent { "Support", "" },		Launch { Dev_"Support/Support.xcworkspace", 0 },
		ExitEvent { "Technical", "" },		Launch { Dev_"TechnicalDocs/TechnicalDocs.xcworkspace", 0 },
		ExitEvent { "old Support", "" },	Launch { Dev_"Support_svn/Support_svn.xcworkspace", 0 },
		ExitEvent { "Dev Support", "" },	Launch { Dev_"DevSupport/DevSupport.xcodeproj", 0 },
		Event { "next", "" },				Keypress { kc_accent, mf_command },
		Event { "close", "" },				Keypress { kc_W, mf_command + mf_option },
		ExitEvent { "assistant", "" },		_assistantEditor,
		ExitEvent { "version", "" },		_versionEditor,
		ExitEvent { "standard", "" },		_standardEditor,
		ExitEvent { "Interface", "" },		ResSubslate { resid_InterfaceBuilder },
		ExitEvent { "Data Model", "" },		ResSubslate { resid_DataModel },
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

#pragma mark 7 --- InterfaceBuilder
resource restype_Slate (resid_InterfaceBuilder, "") { {
	Slate { "IB",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "document", "" },		ResSubslate { resid_IBDocument },
		Event { "owner connections", "" },	ClickMod { 1, 280, 165, _window, _topLeft, mf_control },
		Event { "utility", "" },		ResSubslate { resid_IBUtility },
		Event { "show utility", "" },	Sequence{}, Keypress { kc_0, mf_command + mf_option }, ResSubslate { resid_IBUtility }, endSequence{},
		Event { "standard", "" },		Keypress { kc_return, mf_command },
		Event { "assist", "" },			Keypress { kc_return, mf_command + mf_option },
		Event { "split panel", "" },	Sequence{}, ClickMenu { "View" }, _down, TypeText { "Assistant Editor" }, _right, ResSubslate { resid_asstSplit }, endSequence{},
		Event { "canvas", "" },			Click { 1, -275, 130, _window, _topRight },
		Event { "size to fit", "" },	Keypress { kc_equal, mf_command },
		Event { "Menu", "" },			Sequence{}, ClickMenu { "Editor" }, _down, ResSubslate { resid_IBMenu }, endSequence{},
		ExitEvent { "assistant", "" },	_assistantEditor,
		ExitEvent { "version", "" },	_versionEditor,
		ExitEvent { "standard", "" },	_standardEditor,
		Event { "document", "" },		ResSubslate { resid_IBDocument },
		Event { "Data Model", "" },		ResSubslate { resid_DataModel },
		Event { "Workspace", "" },		ResSubslate { resid_Workspace },
		_IMouseSlate_,
		_DirectionKeys_,
		_ReturnKey_,
		_TabKey_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark Menu
resource restype_Slate (resid_IBMenu, "") { {
	Slate { "Menu",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "execute", "" },	_return,
		Event { "align", "" },			Sequence{}, TypeText { "Align" }, _right, ResSubslate { resid_IBAlign }, endSequence{},
		Event { "pin", "" },			Sequence{}, TypeText { "Pin" }, _right, ResSubslate { resid_IBPin }, endSequence{},
		Event { "embed in", "" },		Sequence{}, TypeText { "Embed In" }, _right, ResSubslate { resid_IBEmbed }, endSequence{},
		Event { "unembed", "" },		Sequence{}, TypeText { "Unembed" }, endSequence{},
		Event { "simulate", "" },		Sequence{}, TypeText { "Simulate Document" }, _return, ResSubslate { resid_WaitQuit }, endSequence{},
	} }
} };

#pragma mark WaitQuit
resource restype_Slate (resid_WaitQuit, "") { {
	Slate { "waitQuit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "quit", "" },		Sequence{}, Keypress { kc_Q, mf_command }, CloseSubslate{}, endSequence{},
	} }
} };


#pragma mark Pin
resource restype_Slate (resid_IBPin, "") { {
	Slate { "pin",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "width", "" },			Sequence{}, TypeText { "width" }, _return, endSequence{},
		ExitEvent { "height", "" },			Sequence{}, TypeText { "height" }, _return, endSequence{},
		ExitEvent { "horizontal", "" },		Sequence{}, TypeText { "horizontal" }, _return, endSequence{},
		ExitEvent { "vertical", "" },		Sequence{}, TypeText { "vertical" }, _return, endSequence{},
		ExitEvent { "leading", "" },		Sequence{}, TypeText { "leading" }, _return, endSequence{},
		ExitEvent { "trailing", "" },		Sequence{}, TypeText { "trailing" }, _return, endSequence{},
		ExitEvent { "top", "" },			Sequence{}, TypeText { "top" }, _return, endSequence{},
		ExitEvent { "bottom", "" },			Sequence{}, TypeText { "bottom" }, _return, endSequence{},
		ExitEvent { "widths equally", "" },	Sequence{}, TypeText { "widths equally" }, _return, endSequence{},
		ExitEvent { "heights equally", "" }, Sequence{}, TypeText { "heights equally" }, _return, endSequence{},
	} }
} };

#pragma mark IBAlign
resource restype_Slate (resid_IBAlign, "") { {
	Slate { "align",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "left", "" },			Sequence{}, TypeText { "left" }, _return, endSequence{},
		ExitEvent { "right", "" },			Sequence{}, TypeText { "right" }, _return, endSequence{},
		ExitEvent { "top", "" },			Sequence{}, TypeText { "top" }, _return, endSequence{},
		ExitEvent { "bottom", "" },			Sequence{}, TypeText { "bottom" }, _return, endSequence{},
		ExitEvent { "horizontal", "" },		Sequence{}, TypeText { "horizontal centers" }, _return, endSequence{},
		ExitEvent { "vertical", "" },		Sequence{}, TypeText { "vertical centers" }, _return, endSequence{},
		ExitEvent { "baselines", "" },		Sequence{}, TypeText { "baselines" }, _return, endSequence{},
		ExitEvent { "horizontal in container", "" },	Sequence{}, TypeText { "horizontal in container" }, _return, endSequence{},
		ExitEvent { "vertical in container", "" },		Sequence{}, TypeText { "vertical in container" }, _return, endSequence{},
	} }
} };

#pragma mark Embed
resource restype_Slate (resid_IBEmbed, "") { {
	Slate { "Embed",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "custom view", "" },	TypeText { "Custom View" },
		ExitEvent { "box", "" },			TypeText { "Box" },
		ExitEvent { "split view", "" },		TypeText { "Split View" },
		ExitEvent { "tab view", "" },		TypeText { "Tab View" },
		ExitEvent { "scroll view", "" },	TypeText { "Scroll View" },
	} }
} };

resource restype_Slate (resid_IBDocument, "") { {
	Slate { "doc",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		Event { "expand", "" },			Click { 1, 335, -20, _window, _bottomLeft },
		Event { "collapse", "" },		Click { 1, 550, -20, _window, _bottomLeft },
		Event { "placeholder", "" },	Click { 1, _splitter_x+150, 165, _window, _topLeft },
		Event { "object", "" },			Click { 1, _splitter_x+250, 250, _window, _topLeft },
		Event { "filter", "" },			Sequence{}, Click { 1, _splitter_x+150, -10, _window, _bottomLeft }, Wait { 10 }, Keypress { kc_A, mf_command }, ResSubslate { resid_TypeXcodeSlate },  endSequence{},
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
	} }
} };

resource restype_Slate (resid_IBUtility, "IB Utility") { {
	Slate { "util", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },	Keypress { kc_0, mf_command + mf_option },
		Event { "file", "" },		Sequence{}, Keypress { kc_1, mf_command + mf_option }, ResSubslate { resid_utilFile }, endSequence{},
		Event { "help", "" },		Sequence{}, Keypress { kc_2, mf_command + mf_option }, ResSubslate { resid_utilHelp }, endSequence{},
		Event { "model", "" },		Keypress { kc_3, mf_command + mf_option },
		Event { "show", "" },		Keypress { kc_0, mf_command + mf_option },
		Event { "hide", "" },		Keypress { kc_0, mf_command + mf_option },
		Event { "edit", "" },		Click { 1, -110, 25, _cursor },
		Event { "main frame", "" },	Click { 1, -10, 0, _screen, _center },
		Event { "file", "" },		Sequence{}, Keypress { kc_1, mf_command + mf_option }, ResSubslate { resid_utilFile }, endSequence{},
		Event { "help", "" },		Sequence{}, Keypress { kc_2, mf_command + mf_option }, ResSubslate { resid_utilHelp }, endSequence{},
		Event { "identity", "" },	Keypress { kc_3, mf_command + mf_option },
		Event { "attribute", "" },	Sequence{}, Keypress { kc_4, mf_command + mf_option }, ResSubslate { resid_utilAttributes }, endSequence{},
		Event { "size", "" },		Sequence{}, Keypress { kc_5, mf_command + mf_option }, ResSubslate { resid_utilSize }, endSequence{},
		Event { "connection", "" },	Keypress { kc_6, mf_command + mf_option },
		Event { "binding", "" },	Keypress { kc_7, mf_command + mf_option },
		Event { "effect", "" },		Keypress { kc_8, mf_command + mf_option },
		Event { "templates", "" },	Keypress { kc_1, mf_command + mf_option + mf_control },
		Event { "snippets", "" },	Keypress { kc_2, mf_command + mf_option + mf_control },
		Event { "object", "" },		Sequence{}, Keypress { kc_3, mf_command + mf_option + mf_control }, ResSubslate { resid_utilObject }, endSequence{},
		Event { "media", "" },		Keypress { kc_4, mf_command + mf_option + mf_control },
		_UtilityStandards_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark utilAttributes
resource restype_Slate (resid_utilAttributes, "") { {
	Slate { "attributes",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "font", "" },		Click { 1, -46, 310, _window, _topRight },
	} }
} };

#pragma mark utilSize
resource restype_Slate (resid_utilSize, "") { {
	Slate { "size",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "top", "" },		Click { 1, -108, 155, _cursor },
		Event { "bottom", "" },		Click { 1, -108, 207, _cursor },
		Event { "leading", "" },	Click { 1, -136, 182, _cursor },
		Event { "trailing", "" },	Click { 1, -84, 182, _cursor },
		Event { "height", "" },		Click { 1, -108, 174, _cursor },
		Event { "width", "" },		Click { 1, -113, 182, _cursor },
 		_UtilityStandards_,
	} }
} };

#pragma mark utilObject
#define _filterObjectStart		Sequence{}, Click { 0, -27, -9, _window, _bottomRight }, Click { 1, -130, -12, _window, _bottomRight }
#define _filterObjectEnd		endSequence{}
resource restype_Slate (resid_utilObject, "") { {
	Slate { "objects",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "enter", "" },		Keypress { kc_enter, 0 },
		Event { "filter", "" },			Click { 1, -130, -9, _window, _bottomRight },
		Event { "clear filter", "" },	Click { 1, -27, -9, _window, _bottomRight },
		Event { "delete", "" },			Keypress { kc_delete, 0 },
		Event { "label", "" },			_filterObjectStart, TypeText { "label" }, _filterObjectEnd,
		Event { "custom view", "" },	_filterObjectStart, TypeText { "custom view" }, _filterObjectEnd,
		Event { "button", "" },			_filterObjectStart, TypeText { "button" }, _filterObjectEnd,
		Event { "menu", "" },			_filterObjectStart, TypeText { "menu" }, _filterObjectEnd,
		Event { "menu item", "" },		_filterObjectStart, TypeText { "menu item" }, _filterObjectEnd,
		Event { "window", "" },			_filterObjectStart, TypeText { "window" }, _filterObjectEnd,
		Event { "table view", "" },		_filterObjectStart, TypeText { "table" }, _filterObjectEnd,
		_DirectionKeys_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark 8 --- Data Model

#define mpTopSect_		138
#define	mpSectHt_		32
#define mpSectOpenH_	471

resource restype_Slate (resid_DataModel, "DataModel") { {
	Slate { "DataModel", {
		_SlateGlobals_,
		_CloseSubslate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "object list", "" },	Click { 1, 340, -75, _window, _bottomLeft },
		_Focus_,
		_FocusBack_,
		Event { "type", "" },			ResSubslate { resid_TypeXcodeSlate },
		_Editors_,
		Event { "Add", "" },			Subslate { "Add" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Entity", "" },			Sequence{}, _clickEditMenu, TypeText { "Add Entity" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Fetch Request", "" },	Sequence{}, _clickEditMenu, TypeText { "Add Fetch Request" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Configuration", "" },	Sequence{}, _clickEditMenu, TypeText { "Add Configuration" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Attribute", "" },		Sequence{}, _clickEditMenu, TypeText { "Add Attribute" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Fetched", "" },		Sequence{}, _clickEditMenu, TypeText { "Add Fetched Property" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Relationship", "" },	Sequence{}, _clickEditMenu, TypeText { "Add Relationship" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			endSubslate{},
		Event { "attributes", "" },			Click { 1, 60, 172, _window, _topCenter },
		Event { "relationships", "" },		Click { 1, 60, 305, _window, _topCenter },
		Event { "utility", "" },			ResSubslate { resid_DataModelUtility },
		_IMouseSlate_,
		Event { "show diagram", "" },	Click { 1, -40, -38, _window, _bottomRight },
		Event { "show table", "" },		Click { 1, -70, -38, _window, _bottomRight },
		Event { "generate", "" },		Sequence{}, _clickEditMenu, TypeText { "Create NSManagedObject Subclass" }, _return, endSequence{},
/*
		Event { "properties", "" },		Subslate { "Properties" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "attributes", "" },		Sequence{}, Click { 1, 0, mpTopSect_+0*mpSectHt_, _window, _topCenter }, Click { 0, mpSectOpenH_, mpTopSect_+0*mpSectHt_, _window, _topLeft }, endSequence{},
			Event { "relationships", "" },	Sequence{}, Click { 1, 0, mpTopSect_+1*mpSectHt_, _window, _topCenter }, Click { 0, mpSectOpenH_, mpTopSect_+1*mpSectHt_, _window, _topLeft }, endSequence{},
			Event { "fetched", "" },		Sequence{}, Click { 1, 0, mpTopSect_+2*mpSectHt_, _window, _topCenter }, Click { 0, mpSectOpenH_, mpTopSect_+2*mpSectHt_, _window, _topLeft }, endSequence{},
			Event { "open", "" },			Click { 1, 0, 0, _cursor },
			Event { "close", "" },			Click { 1, 0, 0, _cursor },
			Event { "top row", "" },		Click { 1, 0, 34, _cursor },
			_DirectionKeys_,
			_WhitespaceKeys_,
			_JumpNorthSubslate_,
			_JumpDownSubslate_,
			_Focus_,
			_FocusBack_,
			Event { "type", "" },			ResSubslate { resid_TypeXcodeSlate },
			_IMouseSlate_,
			endSubslate{},
		Event { "Edit", "" },		Subslate { "Edit" },
			_SlateGlobals_,
			_CloseSubslate_,
			_TypeXcodeSlate_,
			_WhitespaceKeys_,
			_DirectionKeys_,
			Event { "name", "" },	Sequence{}, Click { 2, -115, 115, _window, _topRight },	ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "class", "" },	Sequence{}, Click { 2, -115, 165, _window, _topRight },	ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "parent", "" },		Click { 1, -145, 170, _window, _topRight },
			Event { "abstract", "" },	Click { 1, -210, 195, _window, _topRight },
			Event { "optional", "" },	Click { 1, -215, 140, _window, _topRight },
			Event { "transient", "" },	Click { 1, -160, 140, _window, _topRight },
			Event { "indexed", "" },	Click { 1, -80, 140, _window, _topRight },
			Event { "destination", "" },	Click { 1, -120, 165, _window, _topRight },
			Event { "inverse", "" },	Click { 1, -120, 185, _window, _topRight },
			Event { "to many", "" },	Click { 1, -130, 210, _window, _topRight },
			Event { "transformer", "" },	Sequence{}, Click { 1, -180, 214, _window, _topRight }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "minimum", "" },	Sequence{}, Click { 2, -170, 190, _window, _topRight }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "maximum", "" },	Sequence{}, Click { 2, -45, 215, _window, _topRight }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "default", "" },	Sequence{}, Click { 2, -45, 240, _window, _topRight }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "delete rule", "" },	Click { 1, -160, 260, _window, _topRight },
			endSubslate{},
		Event { "Entity", "" },		Click { 0, 270, 90, _window, _topLeft },
		Event { "Class", "" },		Click { 0, 270, 90, _window, _topLeft },
		Event { "Property", "" },	Click { 0, 0, 90, _window, _topCenter },
		Event { "row one", "" },	Click { 1, 0, 1 * rowHt_, _cursor },
		Event { "row two", "" },	Click { 1, 0, 2 * rowHt_, _cursor },
		Event { "row three", "" },	Click { 1, 0, 3 * rowHt_, _cursor },
		Event { "row four", "" },	Click { 1, 0, 4 * rowHt_, _cursor },
		Event { "row five", "" },	Click { 1, 0, 5 * rowHt_, _cursor },
		Event { "row six", "" },	Click { 1, 0, 6 * rowHt_, _cursor },
		Event { "row seven", "" },	Click { 1, 0, 7 * rowHt_, _cursor },
		Event { "row eight", "" },	Click { 1, 0, 8 * rowHt_, _cursor },
		Event { "row nine", "" },	Click { 1, 0, 9 * rowHt_, _cursor },
		Event { "row ten", "" },	Click { 1, 0, 10 * rowHt_, _cursor },
		Event { "row eleven", "" },	Click { 1, 11, 10 * rowHt_, _cursor },
		Event { "row twelve", "" },	Click { 1, 12, 11 * rowHt_, _cursor },
*/
	} }
} };

#pragma mark DataModelUtility
resource restype_Slate (resid_DataModelUtility, "") { {
	Slate { "utility",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "show", "" },			Keypress { kc_0, mf_command + mf_option },
		Event { "hide", "" },			Keypress { kc_0, mf_command + mf_option },
		_Focus_,
		_FocusBack_,
		Event { "type", "" },			ResSubslate { resid_TypeXcodeSlate },
		Event { "file", "" },			Sequence{}, Keypress { kc_1, mf_command + mf_option }, ResSubslate { resid_utilFile }, endSequence{},
		Event { "help", "" },			Sequence{}, Keypress { kc_2, mf_command + mf_option }, ResSubslate { resid_utilHelp }, endSequence{},
		Event { "model", "" },			Sequence{}, Keypress { kc_3, mf_command + mf_option }, ResSubslate { resid_utilModel }, endSequence{},
		_UtilityStandards_,
	} }
} };

#pragma mark utilModel
resource restype_Slate (resid_utilModel, "") { {
	Slate { "model",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "name", "" },			Click { 1, -150, 151, _window, _topRight },
		Event { "count", "" },			Click { 1, -150, 277, _window, _topRight },
		Event { "delete rule", "" },	Click { 1, -100, 326, _window, _topRight },
		Event { "rename", "" },			Click { 1, -150, 434, _window, _topRight },
		Event { "next", "" },			Keypress { kc_tab, 0 },
		Event { "previous", "" },		Keypress { kc_tab, mf_shift },
		_Focus_,
		_FocusBack_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark 6 === Indexes
// inside: 1 Project; 2 Symbol; 3 Search; 4 Issue; 5 Test; 6 Debug; 7 Breakpoints; 8 Log
#define	_IndexStandards_	\
	Event { "skip ahead", "" },		_skipAhead,		\
	Event { "skip back", "" },		_skipBack,		\
	Event { "new tab", "" },		_newTab,		\
	Event { "close tab", "" },		_closeTab,		\
	Event { "go next", "" },		_goNext,		\
	Event { "go previous", "" },	_goPrevious,	\
	Event { "go tab", "" },			_goTab,			\
	_Focus_,			\
	_FocusBack_,		\
	Event { "return", "" },			_return, 		\
	Event { "page top", "" },		Keypress { kc_home, 0 },		\
	Event { "page end", "" },		Keypress { kc_end, 0 },			\
	Event { "page north", "" },		Keypress { kc_pageup, 0 },		\
	Event { "page down", "" },		Keypress { kc_pagedown, 0 },	\
	_DirectionKeys_,		\
	_JumpDownSubslate_,		\
	_JumpNorthSubslate_,	\
	_DoJumpSubslate_

#define _FilterStandards_	\
	_SlateGlobals_,			\
	_CloseSubslate_,		\
	Event {	"filter", "" },				Click { 1, 150, -10, _window, _bottomLeft },	\
	Event { "clear filter", "" },		Click { 1, 243, -10, _window, _bottomLeft }

#define _filter_v		-12
#define _organize_v		105

resource restype_Slate (resid_Index, "") { {
	Slate { "Index",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "project", "" },		Sequence{}, Keypress { kc_1, mf_command }, ResSubslate { resid_ProjectIndex }, endSequence{},
		Event { "symbol", "" },			Sequence{}, Keypress { kc_2, mf_command }, ResSubslate { resid_SymbolIndex }, endSequence{},
		Event { "search", "" },			Sequence{}, Keypress { kc_3, mf_command }, ResSubslate { resid_SearchIndex }, endSequence{},
		Event { "issue", "" },			Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_IssueIndex }, endSequence{},
		Event { "test", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_TestIndex }, endSequence{},
		Event { "debug", "" },			Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_DebugIndex }, endSequence{},
		Event { "breakpoint", "" },		Sequence{}, Keypress { kc_7, mf_command }, ResSubslate { resid_BreakpointIndex }, endSequence{},
		Event { "log", "" },			Sequence{}, Keypress { kc_8, mf_command }, ResSubslate { resid_LogIndex }, endSequence{},
	} }
} };

#pragma mark clickOpen
resource restype_Slate (resid_clickOpen, "") { {
	Slate { "clickOpen",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "left", "" },		Click { 1, 0, 0, _cursor },
		ExitEvent { "right", "" },		ClickMod { 1, 0, 0, _cursor, mf_option },
		ExitEvent { "select", "" },		ClickMod { 1, 0, 0, _cursor, mf_option + mf_shift },
		ExitEvent { "new tab", "" },	Click { 2, 0, 0, _cursor },
	} }
} };


#pragma mark IndexMouse
resource restype_Slate (resid_IndexMouse, "") { {
	Slate { "mouse",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "click open", "" },		ResSubslate { resid_clickOpen },
		_PageKeys_,
		Event { "top", "" },			Click { 0, 80, 148, _window, _topLeft },
		Event { "bottom", "" },			Click { 0, 80, -30, _window, _bottomLeft },
		Event { "center", "" },			Click { 0, 80, 0, _window, _centerLeft },
		Event { "north", "" },			Click { 0, 0, -1 * nb_rsp, _cursor },
		Event { "down", "" },			Click { 0, 0, 1 * nb_rsp, _cursor },
		Event { "jump north", "" },		Subslate { "north" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "click open", "" },		ResSubslate { resid_clickOpen },
			Event { "one", "" },				Click { 0, 0, -1 * nb_rsp, _cursor },
			Event { "two", "" },				Click { 0, 0, -2 * nb_rsp, _cursor },
			Event { "three", "" },				Click { 0, 0, -3 * nb_rsp, _cursor },
			Event { "four", "" },				Click { 0, 0, -4 * nb_rsp, _cursor },
			Event { "five", "" },				Click { 0, 0, -5 * nb_rsp, _cursor },
			Event { "six", "" },				Click { 0, 0, -6 * nb_rsp, _cursor },
			Event { "seven", "" },				Click { 0, 0, -7 * nb_rsp, _cursor },
			Event { "eight", "" },				Click { 0, 0, -8 * nb_rsp, _cursor },
			Event { "nine", "" },				Click { 0, 0, -9 * nb_rsp, _cursor },
			Event { "ten", "" },				Click { 0, 0, -10 * nb_rsp, _cursor },
			endSubslate{},
		Event { "jump down", "" },		Subslate { "down" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "click open", "" },		ResSubslate { resid_clickOpen },
			Event { "one", "" },				Click { 0, 0, 1 * nb_rsp, _cursor },
			Event { "two", "" },				Click { 0, 0, 2 * nb_rsp, _cursor },
			Event { "three", "" },				Click { 0, 0, 3 * nb_rsp, _cursor },
			Event { "four", "" },				Click { 0, 0, 4 * nb_rsp, _cursor },
			Event { "five", "" },				Click { 0, 0, 5 * nb_rsp, _cursor },
			Event { "six", "" },				Click { 0, 0, 6 * nb_rsp, _cursor },
			Event { "seven", "" },				Click { 0, 0, 7 * nb_rsp, _cursor },
			Event { "eight", "" },				Click { 0, 0, 8 * nb_rsp, _cursor },
			Event { "nine", "" },				Click { 0, 0, 9 * nb_rsp, _cursor },
			Event { "ten", "" },				Click { 0, 0, 10 * nb_rsp, _cursor },
			endSubslate{},
		Event { "adjust", "" },			Subslate { "adjust" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "click open", "" },	ResSubslate { resid_clickOpen },
			Event { "north", "" },			Click { 0, 0, -4, _cursor },
			Event { "down", "" },			Click { 0, 0, 4, _cursor },
			endSubslate{},
	} }
} };

#pragma mark 1 --- Project
resource restype_Slate (resid_ProjectIndex, "") { {
	Slate { "Project",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		CloseSubslate{},
		_Focus_,
		_FocusBack_,
		_SetFocus_,
		Event { "reveal file", "" },	Keypress { kc_J, mf_command + mf_shift },
		Event { "open Assist", "" },	Sequence{}, ClickMenu { "Navigate" }, _down, TypeText { "Open in Assistant Editor" }, _return, endSequence{},
		Event { "new group", "" },		Sequence{}, Keypress { kc_N, mf_command + mf_option }, ResSubslate { resid_NewGroup }, endSequence{},
		Event { "filter", "" },			Subslate { "filter" },
			_FilterStandards_,
			Event { "recent", "" },			Click { 1, 40, _filter_v, _window, _bottomLeft },
			Event { "with status", "" },	Click { 1, 58, _filter_v, _window, _bottomLeft },
			endSubslate{},
		_IndexStandards_,
		_LetterKeys_,
		_NumberKeys_,
	} }
} };

#pragma mark New Group
resource restype_Slate (resid_NewGroup, "") { {
	Slate { "new group",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeXcodeSlate_,
		Event { "return", "" },			_return,
		_DirectionKeys_,
		_LetterKeys_,
		_NumberKeys_,
	} }
} };

#pragma mark 2 --- Symbol
resource restype_Slate (resid_SymbolIndex, "") { {
	Slate { "Symbol",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "filter", "" },			Subslate { "filter" },
			_FilterStandards_,
			Event { "hierarchical", "" },	Click { 1, 50, _organize_v, _window, _topLeft },
			Event { "flat", "" },			Click { 1, 114, _organize_v, _window, _topLeft },
			Event { "class", "" },			Click { 1, 12, _filter_v, _window, _bottomLeft },
			Event { "in project", "" },		Click { 1, 31, _filter_v, _window, _bottomLeft },
			Event { "containers only", "" }, Click { 1, 50, _filter_v, _window, _topLeft },
			endSubslate{},
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 3 --- Search
#define _clickFindOptionsMulti		Click { 1, 90, 132, _window, _topLeft }
#define	_rsp	32
resource restype_Slate (resid_SearchIndex, "Search Multiple") { {
	Slate { "searchMult", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },				CloseSubslate{},
		Event { "next", "" },					Keypress { kc_G, mf_command },
		Event { "previous", "" },				Keypress { kc_G, mf_command + mf_shift },
		_Focus_,
		_FocusBack_,
		Event { "specify", "" },				Click { 1, 30, 107, _window, _topLeft },
		Event { "search field", "" },			Sequence{}, Click { 1, 40, 125, _window, _topLeft }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "clear search", "" },			Click { 1, 40, _splitter_x-18, _window, _topLeft },
		Event { "replace field", "" },			Sequence{}, Click { 1, 40, 160, _window, _topLeft }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "recent", "" },					Click { 1, 24, 128, _window, _topLeft },
		Event { "pattern", "" },				Keypress { kc_P, mf_command + mf_option + mf_control },
		Event { "search in", "" },				Click { 1, 50, 145, _window, _topLeft },
		Event { "match case", "" },				Click { 1, _splitter_x-100, 145, _window, _topLeft },
		Event { "preview", "" },				Click { 1, 40, 188, _window, _topLeft },
		Event { "change", "" },					Click { 1, 128, 188, _window, _topLeft },
		Event { "replace all", "" },			Click { 0, _splitter_x-45, 188, _window, _topLeft },
		Event { "click one", "" },				Click { 1, 0, 0, _cursor },
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_DeleteKey_,
	} }
} };

#pragma mark Search
resource restype_Slate (resid_Search, "Search") { {
	Slate { "Search", {
		_SlateGlobals_,
		ExitEvent { "exit", "" },			NilAction{},
		ExitEvent { "close", "" },			_clickFindDone,
		ExitEvent { "done", "" },			_clickFindDone,
		Event { "specify", "" },			Click { 1, _splitter_x+30, 107, _window, _topLeft },
		Event { "search field", "" },		Sequence{}, Click { 1, 0, 105, _window, _topCenter }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "clear search", "" },		Click { 1, -105, 105, _window, _topRight },
		Event { "options", "" },			Click { 1, _splitter_x, 107, _window, _topLeft },
		Event { "pattern", "" },			Keypress { kc_P, mf_command + mf_option + mf_control },
		Event { "find next", "" },			Keypress { kc_G, mf_command },
		Event { "find previous", "" },		Keypress { kc_G, mf_command + mf_shift },
		Event { "replace field", "" },		Sequence{}, Click { 1, 0, 127, _window, _topCenter}, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "change", "" },				Click { 1, 35, 130, _window, _topRight },
		Event { "replace all", "" },		Click { 0, -80, 130, _window, _topRight },
		Event { "click one", "" },			Click { 1, 0, 0, _cursor },
		_TypeXcodeSlate_,
		_IMouseSlate_,
	} }
} };

#pragma mark 4 --- Issues
resource restype_Slate (resid_IssueIndex, "Issues") { {
	Slate { "issues", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
		Event { "filter", "" },			Subslate { "filter" },
			_FilterStandards_,
			Event { "by file", "" },		Click { 1, 35, _organize_v, _window, _topLeft },
			Event { "by type", "" },		Click { 1, 92, _organize_v, _window, _topLeft },
			Event { "recent", "" },			Click { 1, 13, _filter_v, _window, _bottomLeft },
			Event { "errors", "" },			Click { 1, 33, _filter_v, _window, _bottomLeft },
			endSubslate{},
		_EndKey_,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 5 --- Tests
resource restype_Slate (resid_TestIndex, "") { {
	Slate { "TestIndex",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "filter", "" },			Subslate { "filter" },
			_FilterStandards_,
			Event { "current scheme", "" },		Click { 1, 36, _filter_v, _window, _bottomLeft },
			Event { "failures", "" },			Click { 1, 57, _filter_v, _window, _bottomLeft },
			endSubslate{},
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };


#pragma mark 6 --- Debug
resource restype_Slate (resid_DebugIndex, "") { {
	Slate { "Debug",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_XcodeStandards_,
		ExitEvent { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "click back", "" },			Click { 1, -125, 33, _screen, _topRight },
		Event { "next workspace", "" }, 	Keypress { kc_accent, mf_command },
		Event { "run", "" },				Keypress { kc_R, mf_command },
		Event { "Gauges", "" },				ResSubslate { resid_Gauges },
		Event { "Threads", "" },			Click { 1, -110, 110, _window, _topRight },
		Event { "panel", "" },				Keypress { kc_Y, mf_command + mf_shift },
		Event { "step", "" },				Keypress { kc_fn6, 0 },
		Event { "in", "" },					Keypress { kc_fn7, 0 },
		Event { "finish", "step out" },		Keypress { kc_fn8, 0 },
		Event { "pause", "" },				Keypress { kc_Y, mf_command + mf_control },
		Event { "continue", "" },			Keypress { kc_Y, mf_command + mf_control },
		Event { "variable", "" },			Subslate { "variable" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "scope", "" },				Click { 1, _splitter_x+25, _filter_v, _window, _bottomLeft },
			Event { "quick look", "" },			Click { 1, _splitter_x+50, _filter_v, _window, _bottomLeft },
			Event { "description", "" },		Click { 1, _splitter_x+70, _filter_v, _window, _bottomLeft },
			Event { "filter", "" },				Click { 1, _splitter_x+60, _filter_v, _window, _bottomLeft },
			endSubslate{},
		Event { "breakpoint", "" },			Subslate { "breakpoint" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "index", "" },				Sequence{}, Keypress { kc_7, mf_command }, ResSubslate { resid_BreakpointIndex }, endSequence{},
			Event { "set", "" },				_breakpoint,
			Event { "clear", "" },				_breakpoint,
			Event { "activate", "" },			Keypress { kc_Y, mf_command	 },
			endSubslate{},
		Event { "threads", "" },			Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_Threads },endSequence{},
		Event { "console", "" },			Sequence{}, Keypress { kc_C, mf_command + mf_shift }, ResSubslate { resid_TypeDebugConsole }, endSequence{},
		_EndKey_,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark Gauges
#define gauge_top		75
#define gauge_left		124
#define gauge_sp		36
resource restype_Slate (resid_Gauges, "") { {
	Slate { "Gauges",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "click open", "" },	ResSubslate { resid_clickOpen },
		ExitEvent { "profile", "" },	Click { 1, -110, 110, _window, _topRight },
		Event { "show", "" },			Click { 1, _splitter_x-60, 110, _window, _topLeft },
		Event { "1", "" },				Click { 0, gauge_left, gauge_top+1*gauge_sp, _window, _topLeft },
		Event { "2", "" },				Click { 0, gauge_left, gauge_top+2*gauge_sp, _window, _topLeft },
		Event { "3", "" },				Click { 0, gauge_left, gauge_top+3*gauge_sp, _window, _topLeft },
		Event { "4", "" },				Click { 0, gauge_left, gauge_top+4*gauge_sp, _window, _topLeft },
		Event { "5", "" },				Click { 0, gauge_left, gauge_top+5*gauge_sp, _window, _topLeft },
		Event { "6", "" },				Click { 0, gauge_left, gauge_top+6*gauge_sp, _window, _topLeft },
	} }
} };

#pragma mark Threads
resource restype_Slate (resid_Threads, "") { {
	Slate { "threads",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_EndKey_,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 7 --- Breakpoints
resource restype_Slate (resid_BreakpointIndex, "") { {
	Slate { "breakpoint",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "filter", "" },			Subslate { "filter" },
			_FilterStandards_,
			Event { "set", "" },				Keypress { kc_backslash, mf_command },
			Event { "clear", "" },				Keypress { kc_backslash, mf_command },
			Event { "activate", "" },			Keypress { kc_Y, mf_command },
			Event { "delete", "" },				_delete,
			endSubslate{},
		_EndKey_,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 8 --- Log
resource restype_Slate (resid_LogIndex, "Log") { {
	Slate { "log", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "robots", "" },			Click { 1, 12, _filter_v, _window, _bottomLeft },
		Event { "filter", "" },			Subslate { "filter" },
			_FilterStandards_,
			Event { "by group", "" },		Click { 1, 44, _organize_v, _window, _topLeft },
			Event { "by time", "" },		Click { 1, 113, _organize_v, _window, _topLeft },
			Event { "recent", "" },			Click { 1, 37, _filter_v, _window, _bottomLeft },
			Event { "local", "" },			Click { 1, 57, _filter_v, _window, _bottomLeft },
			endSubslate{},
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go tab", "" },			_goTab,
		Event { "expand", "" },			Sequence{}, _clickEditorMenu, TypeText { "Expand Selected Transcripts" }, endSequence{},
		Event { "collapse", "" },		Sequence{}, _clickEditorMenu, TypeText { "Collapse Selected Transcripts" }, endSequence{},
		_Focus_,
		_IndexStandards_,
		_DirectionKeys_,
	} }
} };

#pragma mark 7 === Typing
// inside: 1 Special; Copyright; Macro 2 TypeDialog; 3 _TypeXcodeItems_; Package; 4 TypeXcode [unix]; TypeDebugConsole; 5 InsertSnippet; 6 InsertElement; Styles; InsertTag; 7 UserSlate; 8 Doxygen; 9 typeSearch

#pragma mark Macro
resource restype_Slate (resid_Macro, "") { {
	Slate { "Macro",	{
		_Focus_,
		_FocusBack_,
		Event { "one", "temp" },				Sequence{},
			Keypress { kc_accent, mf_control + mf_shift },
			endSequence{},
		Event { "two", "temp" },				Sequence{},
			TypeText { "arg2" },
			endSequence{},
		Event { "three", "temp" },				Sequence{},
			Keypress { kc_C, mf_command }, _right, Keypress { kc_comma, 0 }, _return,
			Keypress { kc_V, mf_command + mf_option + mf_shift }, _up, Keypress { kc_M, mf_command }, _left,
			Keypress { kc_G, mf_command }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
			_left, Keypress { kc_O, mf_control }, TypeText { "YES" },
			endSequence{},
		Event { "four", "temp" },				Sequence{},
			_right, _down, _down,
			endSequence{},
		Event { "five", "temp" },				Sequence{},
			Keypress { kc_M, mf_command }, _right, _down,
			endSequence{},
		Event { "six", "temp" },				Sequence{},
			Keypress { kc_left, mf_command }, _down, _down, _down, _down,
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, _right, Keypress { kc_O, mf_control },
			endSequence{},
		_DevMacroItems_,
	} }
} };

#define _insertTab	Keypress { kc_tab, mf_option }
#pragma mark 8 --- Doxygen
resource restype_Slate (resid_Doxygen, "Doxygen") { {
	Slate { "Doxygen", {
		_DoxygenItems_
	} }
} };

#pragma mark 3 --- _TypeXcodeItems_
#define _TypeXcodeItems_	\
	Event { "complete", "" },	Keypress { kc_escape, 0 },	\
	Event { "finish", "" },		Keypress { kc_escape, 0 },	\
	Event { "choose north", "" }, ResSubslate { resid_ChooseUp },		\
	_GoToReference_,	\
	_JumpBar_,		\
	_CloseDocument_,	\
	Event { "goto line", "" },		Keypress { kc_L, mf_command },	\
	Event { "select word", "" },	_selword,		\
	Event { "select line", "" },	_selline,		\
	Event { "capitalize", "" },		_capitalize,	\
	Event { "lower case", "" },		_lowercase,		\
	Event { "breakpoint", "" },		_breakpoint,	\
	Event { "balance", "" },		Keypress { kc_M, 0 },	\
	Event { "paste", "" },			Keypress { kc_V, mf_command + mf_option + mf_shift },	\
	_TypeDevItems_


#pragma mark 4 --- TypeXcode
resource restype_Slate (resid_TypeXcodeSlate, "Type Slate") { {
	Slate { "Type",	{
		_TypeDevSlateItems_,
		Event { "Doxygen", "" },				ResSubslate { resid_Doxygen },
		Event { "Macro", "" },					ResSubslate { resid_Macro },
		_JumpBar_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "counterpart", "" },			_counterpart,
		_Focus_,
		_FocusBack_,
		Event { "next issue", "" },				_nextIssue,
		Event { "previous issue", "" },			_previousIssue,
		Event { "edit scope", "" },				Keypress { kc_E, mf_command + mf_control },
		Event { "go definition", "" },			Keypress { kc_J, mf_command + mf_control },
		Event { "save files", "" },				Keypress { kc_S, mf_command + mf_option },
		Event { "search", "" },					ResSubslate { resid_typeSearch },
		Event { "show selection", "" },			Keypress { kc_L, mf_command + mf_shift },
		_TypeXcodeItems_,
	} }
} };

#pragma mark TypeDebugConsole
resource restype_Slate (resid_TypeDebugConsole, "") { {
	Slate { "TypeDebugConsole",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "print object", "" },		TypeText { "po " },
		_TypeXcodeItems_,
	} }
} };

#pragma mark 2 --- TypeDialog
resource restype_Slate (resid_TypeDialog, "") { {
	Slate { "type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "undo", "" },			Keypress { kc_Z, mf_command },
	} }
} };

#pragma mark 9 --- typeSearch
resource restype_Slate (resid_typeSearch, "") { {
	Slate { "search",	{
		_SlateGlobals_,
		ExitEvent { "close", "" },		Click { 1, -32, 130, _window, _topRight },
		ExitEvent { "okay", "" },		NilAction{},
		Event { "multiple", "" },		Sequence{}, Keypress { kc_F, mf_command + mf_shift }, ResSubslate { resid_SearchIndex }, _right, endSequence{},
		Event { "find", "" },			Sequence{}, Keypress { kc_F, mf_command }, endSequence{},
		Event { "replace", "" },		Sequence{}, Keypress { kc_F, mf_command + mf_option }, Click { 1, -200, 150, _window, _topRight }, endSequence{},
		_HideFindBar_,
		Event { "this", "" },			Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, Keypress { kc_E, mf_command }, Keypress { kc_G, mf_command }, endSequence{},
		Event { "next", "" },			Keypress { kc_G, mf_command },
		Event { "previous", "" },		Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },			_clickReplace,
		Event { "change again", "" },	_clickReplace,
	} }
} };

#pragma mark 8 === External
// inside: Safari Browsers; 1 GitHub; 2 Xcode Server; 4 Stickies; 5 Console; 6 BBEdit; 7 AppCode

#define _mainFrame_h		0
#define _mainFrame_v		75
#define _homeApp			DevApps_"Xcode.app"
#define	_homeAppSlate		resid_Xcode

#pragma mark Browser
	#define	_BrowseCdocResID_	resid_Browser
_BrowseCdocSlate_

#pragma mark BrowseDoxygen
	#define	_BrowseDoxygenResID_	resid_BrowseDoxygen
_BrowseDoxygenSlate_

#pragma mark 1 --- Github
#define	_GitHubID_			resid_GitHubXC
	#define _GitHubRepoID_		resid_ghRepository
	#define _GitHubOpenIssueID_	resid_ghOpenIssue
_GitHubSlate_
_GitHubRepoSlate_
_GitHubOpenIssueSlate_

#pragma mark 2 --- XcodeServer
#define	_XcodeServerStandards_		\
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

resource restype_Slate (resid_XcodeServer, "") { {
	Slate { "XcodeServer",	{
		ExitEvent { "okay", "" },		Launch { DevApps_"Xcode.app", 0 },
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { DevApps_"Xcode.app", 0 },  endSequence{},
		Event { "big screen", "" },		OpenURL { "http://carol-clarks-imac.local/xcode/bigscreen" },
		_XcodeServerStandards_,
		_SlateGlobals_,
	} }
} };

#pragma mark 4 --- Stickies
resource restype_Slate (resid_Stickies, "") { {
	Slate { "Stickies",	{
		_SlateGlobals_,
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { DevApps_"XCode.app", 0 }, endSequence{},
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "quit", "" },		Keypress { kc_Q, mf_command },
		ExitEvent { "okay", "" },		Launch { DevApps_"XCode.app", 0 },
		Event { "select all", "" },		Keypress { kc_A, mf_command },
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command + mf_option + mf_shift },
		Event { "copy all", "" },		Sequence{}, Keypress { kc_A, mf_command }, Keypress { kc_C, mf_command }, _right, endSequence{},
		Event { "new window", "" },		Keypress { kc_N, mf_command },
		Event { "close window", "" },	Keypress { kc_W, mf_command },
		Event { "go next", "" },		Keypress { kc_accent, mf_command },
		Event { "save message file", "" },	Sequence{}, Keypress { kc_A, mf_command }, ClickMenu { "Stickies" }, _down, TypeText { "Services" }, _right, TypeText { "Git Save Message" }, _return, endSequence{},
		_CommandSlate_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
	} }
} };

#pragma mark 5 --- Console
resource restype_Slate (resid_Console, "") { {
	Slate { "Console",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { DevApps_"XCode.app", 0 }, endSequence{},
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "quit", "" },		Keypress { kc_Q, mf_command },
		ExitEvent { "okay", "" },		Launch { DevApps_"XCode.app", 0 },
	} }
} };

#pragma mark 6 --- BBEdit
#define _BBClickScriptsMenu	Click { 1, 580, 10, _screen, _topLeft }
resource restype_Slate (resid_BBValidate, "html validation support") { {
	Slate { "ValidateHTML",	{
		_SlateGlobals_,
		ExitEvent { "close", "" },	Sequence{}, Keypress { kc_W, mf_command }, Launch { DevApps_"XCode.app", 0 }, endSequence{},
		ExitEvent { "exit", "" },	NilAction{},
		ExitEvent { "quit", "" },	Keypress { kc_Q, mf_command },
		ExitEvent { "okay", "" },	Sequence{}, _return, Launch { DevApps_"XCode.app", 0 }, endSequence{},
		_CommandSlate_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "technical", "" },	 Sequence{}, _BBClickScriptsMenu, _down, TypeText { "CheckSyntax" }, _return, ResSubslate { resid_BBContinueCheckAll }, endSequence{},
	} }
} };

resource restype_Slate (resid_BBContinueCheckAll, "resid_BBContinueCheckAll") { {
	Slate { "Continue",	{
		_SlateGlobals_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "continue", "" },	Sequence{}, _return, _BBClickScriptsMenu, _down, TypeText { "CheckLinks" }, _return, endSequence{},
		Event { "close window", "" },	Keypress { kc_W, mf_command },
	} }
} };

#pragma mark 9 === Xcode

#define	topRow_		83
#define	rowHt_		17

resource restype_Slate (resid_Xcode, "Xcode Slate") { {
	Slate { "Xcode",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeXcodeSlate_,
		_XcodeStandards_,
		Event { "test click", "" },		Subslate { "test clicks" },
			_SlateGlobals_,
			_CloseSubslate_,
			_TestClicksItems_,
			endSubslate{},
		Event { "window", "" },			Subslate { "window" },
			ExitEvent { "organizer", "" },	Keypress { kc_2, mf_command + mf_shift },
			_WindowItems_,
			endSubslate{},
		_openDash,
		Event { "open git hub", "" },	Sequence{}, Launch { Apps_"Safari.app", 0 }, OpenURL { "https://github.com" }, ResSubslate { resid_GitHubXC }, endSequence{},
		Event { "git hub", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_GitHubXC }, endSequence{},
		Event { "open server", "" },	OpenURL { "http://carol-clarks-imac.local/xcode" },
		Event { "server", "" },			Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_XcodeServer }, endSequence{},
		Event { "Browser", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_BrowseDoxygen }, endSequence{},
		_Focus_,
		_FocusBack_,
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page bottom", "" },	Keypress { kc_end, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "target", "" },			ResSubslate { resid_Target },
		Event { "Project", ""	},		Sequence{}, Keypress { kc_2, mf_command }, Keypress { kc_1, mf_command }, ResSubslate { resid_ProjectIndex }, endSequence{},
		Event { "Index", ""	},			ResSubslate { resid_Index },
		Event { "navigate", "" },		ResSubslate { resid_Navigate },
		Event { "standard", "" },		Sequence{}, Keypress { kc_return, mf_command }, ResSubslate { resid_StandardEditor }, endSequence{},
		Event { "assistant", "" },		Sequence{}, Keypress { kc_return, mf_command + mf_option }, ResSubslate { resid_AssistantEditor }, endSequence{},
		Event { "version", "" },		Sequence{}, Keypress { kc_return, mf_command + mf_option + mf_shift }, ResSubslate { resid_VersionEditor }, endSequence{},
		Event { "Organizer", "" },		Sequence{}, Keypress { kc_2, mf_command + mf_shift }, ResSubslate { resid_Organizer }, endSequence{},
		Event { "documentation", "" },	Sequence{}, Keypress { kc_slash, mf_command + mf_option + mf_shift }, ResSubslate { resid_Documentation }, endSequence{},
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		_HideFindBar_,
		Event { "select tab", "" },		_goTab,
		Event { "go next", "tab" },		_goNext,
		Event { "go previous", "tab" },	_goPrevious,
		_JumpBar_,
		Event { "context menu", "" },	ClickMod { 1, 0, 0, _cursor, mf_control },
		Event { "Terminal", "" },		Sequence{}, ResSubslate { resid_XCTerminal }, Launch { Apps_"Utilities/Terminal.app", 0 }, endSequence{},
		Event { "go AppCode", "" },		Sequence{}, Launch { MainApps_"AppCode.app", 0 }, ResSubslate { resid_XCAppCode }, endSequence{},
		Event { "BBEdit", "" },			Sequence{}, Launch { MainApps_"BBEdit.app", 0 }, ResSubslate { resid_XCBBEdit }, endSequence{},
		Event { "Validate", "" },		Sequence{}, ResSubslate { resid_BBValidate }, Launch { MainApps_"BBEdit.app", 0 }, endSequence{},
		Event { "Stickies", "" },		Sequence{}, ResSubslate { resid_Stickies }, Launch { Apps_"Stickies.app", 0 }, endSequence{},
		Event { "Console", "" },		Sequence{}, ResSubslate { resid_Console }, Launch { Apps_"Utilities/Console.app", 0 },  endSequence{},
		Event { "Menu", "access menus" },
			Subslate { "Menu" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "select", "" },		_return,
				ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
				Event { "return", "" },			_return,
				Event { "File", "" }, 			Sequence{}, _clickFileMenu, _down, ResSubslate { resid_FileMenu }, endSequence{},
				Event { "Source Control", "" },	Sequence{}, ClickMenu { "Source Control" }, ResSubslate { resid_SourceControl }, endSequence{},
				Event { "Edit", "" }, 			Sequence{}, ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
				Event { "Refactor", "" }, 		Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Refactor" }, _return, ResSubslate { resid_Refactor }, endSequence{},
				Event { "Product", "" },		Sequence{}, ClickMenu { "Product" }, _down, ResSubslate { resid_ProductMenu }, endSequence{},
				ExitEvent { "View", "" }, 		ClickMenu { "View" },
				ExitEvent { "Find", "" }, 		ClickMenu { "Find" },
				ExitEvent { "Build", "" }, 		ClickMenu { "Build" },
				ExitEvent { "Window", "" },		ClickMenu { "Window" },
				endSubslate{},
		Event { "Script", "" },			Sequence{}, _systemScriptsMenu, ResSubslate { resid_Scripts }, _down, Wait { 60 }, TypeText { "Xcode" }, _right, endSequence{},
		Event { "Interface", "" },		ResSubslate { resid_InterfaceBuilder },
		Event { "Data Model", "" },		ResSubslate { resid_DataModel },
		Event { "Workspace", "" },		ResSubslate { resid_Workspace },
		Event { "Search", "" },			ResSubslate { resid_Search },
		Event { "save files", "" },		Keypress { kc_S, mf_command + mf_option },
		_GoToReference_,
		Event { "Documentation", "" },	Sequence{},
			Keypress { kc_slash, mf_command + mf_option + mf_shift }, ResSubslate { resid_Documentation }, endSequence{},
	 } }
} };

/* Saved for Possible Future Use
		Event { "deallocate zombies", "" },	TypeText { "NSDeallocateZombies=YES" },
		Event { "check autorelease", "" },	TypeText { "NSAutoreleaseFreedObjectCheckEnabled=YES" },
		Event { "hang uncaught", "" },		TypeText { "NSHangOnUncaughtException=YES" },
		Event { "enable zombie", "" },		TypeText { "NSZombieEnabled=YES" },
		Event { "enable debug", "" },		TypeText { "NSDebugEnabled=YES" },
		Event { "log stack", "" },			TypeText { "MallocStackLogging=1" },
		Event { "set reraise", "" },		TypeText { "GHUNIT_RERAISE" },
		Event { "set autorun", "" },		TypeText { "GHUNIT_AUTORUN" },

		Event { "specify script", "" },		TypeText { "/Users/Shared/CCDev/Scripts/buildRules.sh" },
		Event { "specify output", "" },		TypeText { "$(DERIVED_FILES_DIR)/$(INPUT_FILE_NAME)o" },
*/

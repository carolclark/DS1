// =================================================================================
//	Xcode_C9.r					©2006-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1 Navigation; Utility; 2 Organizer; 3 Menus; 4 Target; 5 Editors; 6 Indexes; 7 Typing; 8 External; 9 Xcode

#define resid_TypeSafariSlate			resid_Safari+2

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
	#define resid_Repositories			resid_Organizer+10
		#define resid_AddRepository			resid_Repositories+1
		#define resid_Update				resid_Repositories+2
		#define resid_SwitchBranch			resid_Repositories+3
	#define resid_Documentation			resid_Organizer+20

#pragma mark Menus
#define resid_FileMenu				resid_Xcode+250
		#define resid_SelectTargetsAdd		resid_FileMenu+1
		#define resid_SelectTargetsNew		resid_FileMenu+2
	#define resid_NewFile				resid_FileMenu+10
	#define resid_OpenFile				resid_FileMenu+20
	#define resid_AddFiles				resid_FileMenu+30
	#define resid_SourceControl			resid_FileMenu+40
		#define resid_Commit				resid_SourceControl+1
		#define resid_SaveFile				resid_SourceControl+2

#define resid_EditMenu				resid_Xcode+300

#define resid_Refactor				resid_Xcode+350
	#define resid_refactorPreview		resid_Refactor+1
	#define resid_refactorView			resid_Refactor+2

#define resid_Scripts				resid_Xcode+400

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

#pragma mark Editor Slates
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
	#define resid_IndexMouse				resid_Index+10
	#define resid_ProjectIndex				resid_Index+20
		#define resid_NewGroup					resid_ProjectIndex+1
	#define resid_SymbolIndex				resid_Index+30
	#define	resid_SearchIndex				resid_Index+40
		#define resid_MultFindOptions			resid_SearchIndex+1
		#define resid_Search					resid_SearchIndex+2
		#define resid_FindReplace				resid_SearchIndex+3
		#define resid_FindOptions				resid_SearchIndex+4
	#define	resid_IssueIndex				resid_Index+50
	#define resid_DebugIndex				resid_Index+60
		#define resid_Threads					resid_DebugIndex+1
	#define resid_BreakpointIndex			resid_Index+70
	#define	resid_LogIndex					resid_Index+80

#pragma mark Typing Slates
#define resid_TypeXcodeSlate			resid_Xcode+800
	#define resid_TypeSpecialXcodeSlate		resid_TypeXcodeSlate+1
	#define resid_Copyright					resid_TypeXcodeSlate+2
	#define resid_Macro						resid_TypeXcodeSlate+3
	#define resid_TypeDialog				resid_TypeXcodeSlate+4
	#define resid_Package					resid_TypeXcodeSlate+5
	#define resid_TypeDebugConsole			resid_TypeXcodeSlate+6
	#define	resid_InsertSnippet				resid_TypeXcodeSlate+10
		#define resid_ucLevel					resid_InsertSnippet+1
		#define resid_ucActor					resid_InsertSnippet+2
	#define	resid_InsertElement				resid_TypeXcodeSlate+20
	#define	resid_InsertStyle				resid_TypeXcodeSlate+21
	#define	resid_InsertTag					resid_TypeXcodeSlate+22
	#define	resid_InsertSlateText			resid_TypeXcodeSlate+23
	#define resid_Doxygen					resid_TypeXcodeSlate+24
	#define resid_typeSearch				resid_TypeXcodeSlate+25

#pragma mark External Slates
#define resid_External				resid_Xcode+900
#define resid_Browser				resid_External+0
#define resid_BrowseDoxygen			resid_External+10
#define resid_GitHub				resid_External+20		// Xcode+920
	#define resid_ghMyPage				resid_GitHub+1
	#define resid_ghRepository			resid_GitHub+2
		#define resid_ghRepoButtons			resid_GitHub+3
			#define resid_ghRepoBtn_Label		resid_GitHub+4
	#define resid_ghDashIssues			resid_GitHub+5
	#define resid_ghRepoIssues			resid_GitHub+6
	#define resid_ghOpenIssue			resid_GitHub+7
	#define resid_ghEditIssue			resid_GitHub+8

#define resid_Stickies				resid_External+40
#define resid_Console				resid_External+50
#define resid_BBValidate			resid_External+60
	#define resid_BBContinueCheckAll	resid_BBValidate+1


#define _splitter_x		260

#define	_EditorMenu_			ClickMenu { "Editor" }, _down
#define _TypeXcodeSlate_ 		Event { "Type", "" }, ResSubslate { resid_TypeXcodeSlate }
#define closeDocument_			Event { "close document", "" },	Keypress { kc_W, mf_command + mf_control }

#define	focus_			Event { "focus", "" },			Keypress { kc_accent, mf_command + mf_option }
#define	focusBack_		Event { "focus back", "" },		Keypress { kc_accent, mf_command + mf_option + mf_shift }

#define	_next			Keypress { kc_slash, mf_control }
#define	_previous		Keypress { kc_slash, mf_control + mf_shift }
#define	_optionTab		Keypress { kc_tab, mf_option }
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
#define _clickFile	Click { 1, 126, 10, _screen, _topLeft }
#define _navList	Click { 1, 30, -30, _window, _bottomLeft }
#define _topRow		Click { 1, 130, 148, _window, _topLeft }
#define _bottomRow	Click { 1, 130, -30, _window, _bottomLeft }

#define _cutNextLine	Keypress { kc_right, mf_command }, Keypress { kc_right, 0 },	\
	Keypress { kc_right, mf_command + mf_shift }, Keypress { kc_X, mf_command }
#define _indent			Keypress { kc_closebracket, mf_command }
#define _indentBack		Keypress { kc_bracket, mf_command }
#define _hideFindBar			Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Hide Find Bar" }, _return, endSequence{}
#define _clickOptionsButton		Click { 1, -281, 132, _window, _topRight }

// macros for changing Editor displays
#define	_standardEditor		Keypress { kc_return, mf_command }
#define _assistantEditor	Keypress { kc_return, mf_command + mf_option }
#define _versionEditor		Keypress { kc_return, mf_command + mf_shift + mf_option }

#define	_openDash			Event { "open Dash", "" },			Sequence{}, Keypress { kc_accent, mf_command + mf_control + mf_shift }, ResSubslate { resid_XcodeDash }, endSequence{}
#define _lookup				Event { "lookup Dash", "" },		Sequence{}, Keypress { kc_accent, mf_command + mf_control }, ResSubslate { resid_XcodeDash }, endSequence{}
#define goToReference_		Event { "go to reference", "" },	Sequence{}, Keypress { kc_slash, mf_command + mf_option + mf_control },	ResSubslate { resid_Documentation }, endSequence{}

#define	_showHideNavigator	Keypress { kc_0, mf_command }

#define _JumpBar_	\
	Event { "jump bar", "" },	ResSubslate { resid_JumpBar }

// clear bogus error from assertion failure
#define _assert	Sequence{}, _tab, Keypress { kc_space, 0 }, endSequence{}

#define jump_right_ Keypress { kc_right, mf_option }
#define	_XcodeStandards_	\
		Event { "main panel", "" },		Keypress { kc_J, mf_command },		\
		Event { "dismiss assert", "" },	_assert

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
	Event { "template groups", "" },	Click { 1, -270, 530, _window, _topCenter },				\
	_FileDialogStandards_

#pragma mark Popups
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
		focus_,
		Event { "nav list", "" },		_navList,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "top row", "" },		_topRow,
		Event { "index", "" },			ResSubslate { resid_Index },
		Event { "project", "" },		Sequence{}, Keypress { kc_return, mf_command }, Keypress { kc_1, mf_command }, ResSubslate { resid_ProjectIndex }, endSequence{},
		Event { "symbol", "" },			Keypress { kc_2, mf_command },
		Event { "search", "" },			Keypress { kc_3, mf_command },
		Event { "issue", "" },			Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_IssueIndex }, endSequence{},
		Event { "debug", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_DebugIndex }, endSequence{},
		Event { "breakpoint", "" },		Keypress { kc_6, mf_command },
		Event { "log", "" },			Sequence{}, Keypress { kc_7, mf_command }, ResSubslate { resid_LogIndex }, endSequence{},
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
resource restype_Slate (resid_NavFilter, "NavFilter") { {
	Slate { "filter", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		closeDocument_,
		ExitEvent { "recent", "" },			Click { 1, 45, -10, _window, _bottomLeft },
		ExitEvent { "source control", "" },	Click { 1, 58, -10, _window, _bottomLeft },
		ExitEvent { "unsaved", "" },		Click { 1, 71, -10, _window, _bottomLeft },
		Event { "clear filter", "" },		Click { 1, 243, -10, _window, _bottomLeft },
		Event {	"filter", "" },				Click { 1, 200, -10, _window, _bottomLeft },
		ExitEvent { "last build", "" },		Click { 1, 12, -10, _window, _bottomLeft },
	} }
} };

#pragma mark GoTab
#define	tabT	96
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
		Event { "nav list", "" },				_navList,	\
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
// inside: Organizer, 1 Repositories, 2 Documentation

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
		Event { "devices", "" },		Click { 1, -128, 45, _window, _topCenter },
		Event { "repositories", "" },	Sequence{}, Click { 1, -64, 45, _window, _topCenter }, ResSubslate { resid_Repositories }, endSequence{},
		Event { "projects", "" },		Click { 1, 0, 45, _window, _topCenter },
		Event { "archives", "" },		Click { 1, 64, 45, _window, _topCenter },
		Event { "documentation", "" },	Sequence{}, Click { 1, 128, 45, _window, _topCenter }, ResSubslate { resid_Documentation }, endSequence{},
	} }
} };

#define replist_top	182
#define	replist_sp	84
#define	_rowSupport			replist_top+0*replist_sp
#define	_rowAccessor		replist_top+1*replist_sp
#define	_rowPunkin			replist_top+2*replist_sp

#pragma mark 1 --- Repositories
resource restype_Slate (resid_Repositories, "Repositories") { {
	Slate { "rep", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_TypeXcodeSlate_,
		Event { "cancel", "" },			Keypress { kc_period, mf_command },
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "select", "" },			Subslate { "select repository" },
			_SlateGlobals_,
			ExitEvent { "exit", "" },			NilAction{},
			ExitEvent { "okay", "" },			Click { 1, 0, 0, _cursor },
			ExitEvent { "Branches", "" },		Click { 1, 0, 27, _cursor },
			ExitEvent { "Remotes", "" },		Click { 1, 0, 42, _cursor },
			ExitEvent { "Working Copy", "" },	Click { 1, 0, 57, _cursor },
			Event { "Punkin", "" },				Click { 0, 25, _rowPunkin, _window, _topLeft },
			Event { "Accessor", "" },			Click { 0, 25, _rowAccessor, _window, _topLeft },
			Event { "Support", "" },			Click { 0, 25, _rowSupport, _window, _topLeft },
			endSubslate{},
		Event { "content", "" },		Click { 1, 0, 90, _window, _topCenter },
		Event { "pull changes", "" },	 Sequence{}, Click { 1, 214, -33, _window, _bottomLeft },
			ResSubslate { resid_Update }, endSequence{},
		Event { "commit", "" },			Sequence{}, Click { 1, 270, -33, _window, _bottomLeft }, Click { 0, 83, 125, _window, _topLeft }, ResSubslate { resid_Commit }, endSequence{},
		Event { "refresh", "" },		Click { 1, 88, -33, _window, _bottomCenter },
		Event { "add repository", "" },	Sequence{}, Click { 1, 15, -9, _window, _bottomLeft },
			ResSubslate { resid_AddRepository }, endSequence{},
		Event { "add branch", "" },		Click { 1, 225, -35, _window, _bottomLeft },
		Event { "remove branch", "" },	Click { 0, 315, -35, _window, _bottomLeft },
		Event { "switch branch", "" },	Sequence{}, Click { 1, -132, -32, _window, _bottomRight },
			ResSubslate { resid_SwitchBranch }, endSequence{},
	} }
} };

#pragma mark AddRepository
resource restype_Slate (resid_AddRepository, "Add Repository") { {
	Slate { "add repository", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		_return,
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "exit", "" },
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "Working Copy", "" },	TypeText { "Add Working" },
		Event { "Repository", "" },		TypeText { "Add Repository" },
		Event { "Clone", "" },			TypeText { "Checkout or Clone" },
		Event { "continue", "" },		_return,
		Event { "git path", "" },		Sequence{}, TypeText { "https://carolclark@github.com/carolclark" }, _left, _left, _left, _left, endSequence{},
		Event { "working path", "" },	TypeText { "/Users/carolclark/Dev/" },
		Event { "next", "" },			_return,
		Event { "finish", "" },			Sequence{}, _return, ResSubslate { resid_SaveFile }, endSequence{},
	} }
} };

#pragma mark Update
resource restype_Slate (resid_Update, "Update") { {
	Slate { "update", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Sequence{}, Click { 1, 0, 140, _window, _topCenter },
			Keypress { kc_space, 0 }, endSequence{},
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _window, _topLeft },		Click { -1, 280, 29, _screen, _topLeft }, endSequence{},
	} }
} };

#pragma mark SwitchBranch
resource restype_Slate (resid_SwitchBranch, "SwitchBranch") { {
	Slate { "switch", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_LetterKeys_,
	} }
} };

#pragma mark 2 --- Documentation
#define _xcr_splitter_h		173
#define _xcr_splitter_v		292
#define _xcr_button_bar_v	80
#define _xcr_sort_bar_v		100
#define _xcr_rowTop			117
#define _xcr_rowSp			17
#define _xcr_idx_top		_xcr_splitter_v+28
#define _xcr_idx_left		_xcr_splitter_h+45
#define _xcr_idx_right		_xcr_idx_left+163
#define _xcr_idx_sp			17
#define	_xcr_sdbar_left		50
#define _xcr_sdbar_top		132
#define _xcr_sdbar_sp		20

#define	_mainFrame_h	0		// wrt center
#define	_mainFrame_v	105
#define	_docSplitter	260
#define	_toolbar_v		90
#define _bc_left		380
#define	_bc_sp			80
#define _mainlinks_h	_docSplitter+220
#define	_mainlinks_v	_toolbar_v+23
#define	_mainlinks_sp	16
resource restype_Slate (resid_Documentation, "Xcode Reference Documentation") { {
	Slate { "Docs",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Keypress { kc_accent, mf_command },
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		_WhitespaceKeys_,
		_DirectionKeys_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_DoJumpSubslate_,
		_PageKeys_,
		Event { "explore", "" },		Click { 1, 153, 93, _window, _topLeft },
		Event { "search", "" },			Click { 1, 153, 123, _window, _topLeft },
		Event { "bookmarks", "" },		Click { 1, 153, 153, _window, _topLeft },
		Event { "jump bar", "" },		Subslate { "docsJumpBar" },
			_SlateGlobals_,
			_CloseSubslate_,
			_SlateGlobals_,
			ExitEvent { "okay", "" },	NilAction{},
			Event { "related", "" },	Sequence{},	Keypress { kc_1, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
			Event { "previous", "" },	Sequence{},	Keypress { kc_2, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
			Event { "next", "" },		Sequence{},	Keypress { kc_3, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
			Event { "docset", "" },		Sequence{},	Keypress { kc_4, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
			Event { "symbol", "" },		Sequence{},	Keypress { kc_5, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
			endSubslate{},
		Event { "index frame", "" },	Click { 1, _docSplitter+14, -27, _window, _bottomLeft },
		Event { "main frame", "" },		Click { 1, -30, 110, _window, _topRight },
		Event { "do scan", "" },		ResSubslate { resid_DoScan },
		_OrgPanelRows_,
		Event { "main links", "" },				Subslate { "mainLinks" },
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
// inside: File Menu, 1 Source Control, 2 Edit Menu, 3 Refactor, 4 Scripts
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
		Event { "Open File", "" },				Sequence{}, Keypress { kc_O, mf_command }, ResSubslate { resid_OpenFile }, endSequence{},
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
		ExitEvent { "okay", "" },			NilAction{},
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		Event { "execute", "" },			_return,
		Event { "return	", "" },			_return,
		Event { "commit", "" },				Sequence{}, TypeText { "Commit" }, _return, ResSubslate { resid_Commit }, endSequence{},
		Event { "merge", "" },				TypeText { "Merge" },
		Event { "push", "" },				TypeText { "Push" },
		Event { "pull", "" },				TypeText { "Pull" },
		Event { "discard changes", "" },	TypeText { "Discard Changes" },
		Event { "repositories", "" },		Sequence{}, TypeText { "Repositories" }, _return, ResSubslate { resid_Repositories }, endSequence{},
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
		focus_,
		focusBack_,
		Event { "down again", "" },		_down,
		Event { "dismiss assert", "" },	_assert,
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

#pragma mark 4 --- Scripts
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
		Event { "goto line", "" },		Keypress { kc_L, mf_command },
		gotoReference_,
		Event { "top row", "" },		_topRow,
		Event { "project", "" },		Keypress { kc_1, mf_command },
		Event { "symbol", "" },			Keypress { kc_2, mf_command },
		Event { "issue", "" },			Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_IssueIndex }, endSequence{},
		Event { "debug", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_DebugIndex }, endSequence{},
		Event { "log", "" },			Sequence{}, Keypress { kc_7, mf_command }, ResSubslate { resid_LogIndex }, endSequence{},
		Event { "Index", ""	},			ResSubslate { resid_Index },
		Event { "Utility", "" },		ResSubslate { resid_Utilities },
		Event { "Stickies", "" },		Sequence{}, ResSubslate { resid_Stickies }, Launch { Apps_"Stickies.app", 0 }, endSequence{},
		Event { "continue", "" },		Keypress { kc_Y, mf_command + mf_control },
		Event { "archive", "" },		Sequence{}, ClickMenu { "Product" }, TypeText { "Archive" }, _return, endSequence{},
		Event { "clean", "" },			Keypress { kc_K, mf_command + mf_shift },
		Event { "click back", "" },		Click { 1, -500, 40, _window, _topRight },
		Event { "scheme", "" },			Sequence{}, _targetPopup, ResSubslate { resid_TargetScheme }, endSequence{},
		Event { "pop up", "" },			Sequence{}, _targetPopup, ResSubslate { resid_TargetPopup }, endSequence{},
		focus_,
		focusBack_,
		Event { "nav list", "" },		_navList,
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
		Event { "Test Target", "" },	Sequence{}, _targetPopup, TypeText { "Test" }, _down, _return, endSequence{},
		Event { "Setup", "" },			Sequence{}, _targetPopup, TypeText { "Developer_Setup" }, _down, _return, endSequence{},
		Event { "Developer", "" },		Sequence{}, _targetPopup, TypeText { "Developer" }, _down, _return, endSequence{},
		Event { "Xcode", "" },			Sequence{}, _targetPopup, TypeText { "Xcode" }, _down, _return, endSequence{},
		Event { "BBEdit", "" },			Sequence{}, _targetPopup, TypeText { "BBEdit" }, _down, _return, endSequence{},
		Event { "Accessor", "" },		Sequence{}, _targetPopup, TypeText { "Accessor" }, _down, _return, endSequence{},
		Event { "In House", "" },		Sequence{}, _targetPopup, TypeText { "InHouse" }, _down, _return, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, _targetPopup, TypeText { "Doxygen" }, _down, _return, endSequence{},
		Event { "C doc", "" },			Sequence{}, _targetPopup, TypeText { "Cdoc" }, _down, _return, endSequence{},
		Event { "All Tests", "" },		Sequence{}, _targetPopup, TypeText { "AllTests" }, _down, _return, endSequence{},
		Event { "User Slates", "" },	Sequence{}, _targetPopup, TypeText { "UserSlates" }, _down, _return, endSequence{},
		Event { "Words", "" },			Sequence{}, _targetPopup, TypeText { "Words" }, _down, _return, endSequence{},
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
		Event { "Target", "" },			ResSubslate { resid_Target },
		Event { "analyze", "" },		Keypress { kc_B, mf_command + mf_shift },
		Event { "build", "" },			Sequence{}, Keypress { kc_B, mf_command }, ResSubslate { resid_BuildAccessor }, endSequence{},
		Event { "run", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_BuildAccessor }, endSequence{},
	} }
} };

resource restype_Slate (resid_BuildAccessor, "") { {
	Slate { "Accessor",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },		NilAction{},
		Event { "Target", "" },			Sequence{}, CloseSubslate{}, CloseSubslate{}, ResSubslate { resid_Target }, endSequence{},
		Event { "run original", "" },	Launch { HomeApps_"Accessor.app", 0 },
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

#pragma mark 6 === Editors
// inside: _EditorStandards_, 1 Marker, 2 Standard, 3 Assistant, 4 Version, 5 ProjectSettings, 6 Workspace, 7 Interface Builder, 8 Data Model Editor
// Editor Standards
#define	_Editors_ 	 				\
		Event { "Interface", "" },		ResSubslate { resid_InterfaceBuilder },	\
		Event { "Data Model", "" },		ResSubslate { resid_DataModel },		\
		Event { "Workspace", "" },		ResSubslate { resid_Workspace }

#define		_EditorStandards_	\
		Event { "filter", "" },			ResSubslate { resid_navFilter },	\
		Event { "marker", "" },			ResSubslate { resid_Marker }, 		\
		gotoReference_,														\
		Event { "nav list", ""},		_navList,							\
		Event { "top row", "" },		_topRow,							\
		Event { "save files", "" },		Keypress { kc_S, mf_command + mf_option },		\
		focus_,																\
		focusBack_,															\
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
		closeDocument_,			\
		_JumpNorthSubslate_,	\
		_JumpDownSubslate_,		\
		_PageKeys_,				\
		_TypeXcodeSlate_

#define _regularExpression		_clickOptionsButton, TypeText { "reg" }, _return,
#define _hideOpenFindBar		Click { 1, -30, 130, _window, _topRight }
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
		Event { "compare", "" },		Click { 1, -100, -20, _window, _bottomRight },
		Event { "annotate", "" },		Click { 1, -73, -20, _window, _bottomRight },
		Event { "revisions", "" },		Click { 1, -46, -20, _window, _bottomRight },
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
		focus_,
		focusBack_,
		Event { "type", "" },			ResSubslate { resid_TypeXcodeSlate },
		_Editors_,
		Event { "Add", "" },			Subslate { "Add" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Entity", "" },			Sequence{}, _EditorMenu_, TypeText { "Add Entity" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Fetch Request", "" },	Sequence{}, _EditorMenu_, TypeText { "Add Fetch Request" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Configuration", "" },	Sequence{}, _EditorMenu_, TypeText { "Add Configuration" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Attribute", "" },		Sequence{}, _EditorMenu_, TypeText { "Add Attribute" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Fetched", "" },		Sequence{}, _EditorMenu_, TypeText { "Add Fetched Property" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			Event { "Relationship", "" },	Sequence{}, _EditorMenu_, TypeText { "Add Relationship" }, _return, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
			endSubslate{},
		Event { "attributes", "" },			Click { 1, 60, 172, _window, _topCenter },
		Event { "relationships", "" },		Click { 1, 60, 305, _window, _topCenter },
		Event { "utility", "" },			ResSubslate { resid_DataModelUtility },
		_IMouseSlate_,
		Event { "show diagram", "" },	Click { 1, -40, -38, _window, _bottomRight },
		Event { "show table", "" },		Click { 1, -70, -38, _window, _bottomRight },
		Event { "generate", "" },		Sequence{}, _EditorMenu_, TypeText { "Create NSManagedObject Subclass" }, _return, endSequence{},
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
			focus_,
			focusBack_,
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
		focus_,
		focusBack_,
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
		focus_,
		focusBack_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_TypeXcodeSlate_,
	} }
} };

#pragma mark 6 === Indexes
// inside: 1 Project; 2 Symbol; 3 Search; 4 Issue; 5 Debug; 6 Breakpoints; 7 Log
#define	_IndexStandards_	\
	Event { "skip ahead", "" },		_skipAhead,		\
	Event { "skip back", "" },		_skipBack,		\
	Event { "new tab", "" },		_newTab,		\
	Event { "close tab", "" },		_closeTab,		\
	Event { "go next", "" },		_goNext,		\
	Event { "go previous", "" },	_goPrevious,	\
	Event { "go tab", "" },			_goTab,			\
	focus_,			\
	focusBack_,		\
	Event { "return", "" },			_return, 		\
	Event { "page top", "" },		Keypress { kc_home, 0 },		\
	Event { "page end", "" },		Keypress { kc_end, 0 },			\
	Event { "page north", "" },		Keypress { kc_pageup, 0 },		\
	Event { "page down", "" },		Keypress { kc_pagedown, 0 },	\
	_DirectionKeys_,		\
	_JumpDownSubslate_,		\
	_JumpNorthSubslate_,	\
	_DoJumpSubslate_

resource restype_Slate (resid_Index, "") { {
	Slate { "Index",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "project", "" },		Sequence{}, Keypress { kc_1, mf_command }, ResSubslate { resid_ProjectIndex }, endSequence{},
		Event { "symbol", "" },			Sequence{}, Keypress { kc_2, mf_command }, ResSubslate { resid_SymbolIndex }, endSequence{},
		Event { "search", "" },			Sequence{}, Keypress { kc_3, mf_command }, ResSubslate { resid_SearchIndex }, endSequence{},
		Event { "issue", "" },			Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_IssueIndex }, endSequence{},
		Event { "debug", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_DebugIndex }, endSequence{},
		Event { "breakpoint", "" },		Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_BreakpointIndex }, endSequence{},
		Event { "log", "" },			Sequence{}, Keypress { kc_7, mf_command }, ResSubslate { resid_LogIndex }, endSequence{},
		Event { "mouse", "" },			ResSubslate { resid_IndexMouse },
	} }
} };

#pragma mark IndexMouse
resource restype_Slate (resid_IndexMouse, "") { {
	Slate { "mouse",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "top row", "" },		_topRow,
		Event { "nav list", "" },		_navList,
		Event { "top", "" },			Click { 0, 80, 148, _window, _topLeft },
		Event { "bottom", "" },			Click { 0, 80, -30, _window, _bottomLeft },
		Event { "center", "" },			Click { 0, 80, 0, _window, _centerLeft },
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "open main", "" },		Click { 1, 0, 0, _cursor },
		Event { "open assist", "" },	ClickMod { 1, 0, 0, _cursor, mf_option },
		Event { "north", "" },			Click { 0, 0, -1 * nb_rsp, _cursor },
		Event { "down", "" },			Click { 0, 0, 1 * nb_rsp, _cursor },
		Event { "jump north", "" },		Subslate { "north" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "open main", "" },		Click { 1, 0, 0, _cursor },
			ExitEvent { "open assist", "" },	ClickMod { 1, 0, 0, _cursor, mf_option },
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
			ExitEvent { "open main", "" },		Click { 1, 0, 0, _cursor },
			ExitEvent { "open assist", "" },	ClickMod { 1, 0, 0, _cursor, mf_option },
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
			Event { "north", "" },			Click { 0, 0, -2, _cursor },
			Event { "down", "" },			Click { 0, 0, 2, _cursor },
			endSubslate{},
	} }
} };

#pragma mark 1 --- Project
resource restype_Slate (resid_ProjectIndex, "") { {
	Slate { "Project",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		CloseSubslate{},
		Event { "click list", "" },		Sequence{}, Click { 1, 160, -15, _window, _bottomLeft }, Wait { 30 }, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _left, endSequence{},
		Event { "top row", "" },		_topRow,
		Event { "row two", "" },		Click { 1, 100, 160, _window, _topLeft },
		Event { "nav list", "" },		_navList,
		Event { "reveal file", "" },	Keypress { kc_J, mf_command + mf_shift },
		Event { "open Assist", "" },	Sequence{}, ClickMenu { "Navigate" }, _down, TypeText { "Open in Assistant Editor" }, _return, endSequence{},
		Event { "mouse", "" },			ResSubslate { resid_IndexMouse },
		Event { "new group", "" },		Sequence{}, Keypress { kc_N, mf_command + mf_option }, ResSubslate { resid_NewGroup }, endSequence{},
		Event { "pop issues", "" },		Click { 1, -24, 108, _window, _topRight },
		Event { "filter", "" },			ResSubslate { resid_NavFilter },
		Event { "new tab", "" },		_newTab,
		Event { "close tab", "" },		_closeTab,
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go tab", "" },			_goTab,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
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
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 3 --- Search
#define _clickOptionsButton		Click { 1, 90, 132, _window, _topLeft }
#define	_rsp	32
resource restype_Slate (resid_SearchIndex, "Search Multiple") { {
	Slate { "searchMult", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },				CloseSubslate{},
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "next", "" },					Keypress { kc_G, mf_command },
		Event { "previous", "" },				Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },					Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace" }, _return, endSequence{},
		Event { "change again", "" },			Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace and Find Again" }, _return, endSequence{},
		focus_,
		focusBack_,
		Event { "find", "" },					Sequence{}, Click { 1, 25, 130, _window, _topLeft }, Keypress { kc_F, 0 }, _return, endSequence{},
		Event { "replace", "" },				Sequence{}, Click { 1, 25, 130, _window, _topLeft }, Keypress { kc_R, 0 }, _return, endSequence{},
		Event { "search field", "" },			Sequence{}, Click { 1, 143, 130, _window, _topLeft }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "clear search", "" },			Click { 1, 240, 131, _window, _topLeft },
		Event { "replace field", "" },			Sequence{}, Click { 1, 150, 152, _window, _topLeft }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "options", "" },				Click { 1, 89, 132, _window, _topLeft },
		Event { "style", "" },					Click { 1, 110, 155, _window, _topLeft },
		Event { "hits", "" },					Click { 1, 110, 176, _window, _topLeft },
		Event { "match case", "" },				Click { 1, 110, 191, _window, _topLeft },
		Event { "folder", "" },					Click { 1, 110, 219, _window, _topLeft },
		Event { "linked", "" },					Click { 1, 110, 236, _window, _topLeft },
		Event { "preview", "" },				Click { 1, 40, 297, _window, _topLeft },
		Event { "navigate", "" },				ResSubslate { resid_Navigate },
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		Event { "row 1", "" },	Click { 1, 90, 250+1*_rsp, _window, _topLeft },
		Event { "row 2", "" },	Click { 1, 90, 250+2*_rsp, _window, _topLeft },
		Event { "row 3", "" },	Click { 1, 90, 250+3*_rsp, _window, _topLeft },
		Event { "row 4", "" },	Click { 1, 90, 250+4*_rsp, _window, _topLeft },
		Event { "row 5", "" },	Click { 1, 90, 250+5*_rsp, _window, _topLeft },
		Event { "row 6", "" },	Click { 1, 90, 250+6*_rsp, _window, _topLeft },
		Event { "row 7", "" },	Click { 1, 90, 250+7*_rsp, _window, _topLeft },
		Event { "row 8", "" },	Click { 1, 90, 250+8*_rsp, _window, _topLeft },
		Event { "row 9", "" },	Click { 1, 90, 250+9*_rsp, _window, _topLeft },
		Event { "row 10", "" },	Click { 1, 90, 250+10*_rsp, _window, _topLeft },
		Event { "row 11", "" },	Click { 1, 90, 250+11*_rsp, _window, _topLeft },
		Event { "row 12", "" },	Click { 1, 90, 250+12*_rsp, _window, _topLeft },
		Event { "row 13", "" },	Click { 1, 90, 250+13*_rsp, _window, _topLeft },
		Event { "row 14", "" },	Click { 1, 90, 250+14*_rsp, _window, _topLeft },
		Event { "row 15", "" },	Click { 1, 90, 250+15*_rsp, _window, _topLeft },
		Event { "row 16", "" },	Click { 1, 90, 250+16*_rsp, _window, _topLeft },
		Event { "row 17", "" },	Click { 1, 90, 250+17*_rsp, _window, _topLeft },
	} }
} };

resource restype_Slate (resid_MultFindOptions, "edFind Options") { {
	Slate { "opt", {
		_SlateGlobals_,
		ExitEvent { "close", "" },		Sequence{}, _clickOptionsButton, _down, _return, endSequence{},
		ExitEvent { "exit", "" },		NilAction{},
		Event { "style", "" },			Click { 1, 120, 155, _window, _topLeft },
		Event { "hits", "" },			Click { 1, 120, 176, _window, _topLeft },
		Event { "match", "" },			Click { 1, 120, 196, _window, _topLeft },
		Event { "find in", "" },		Click { 1, 120, 218, _window, _topLeft },
		Event { "frameworks", "" },		Click { 1, 120, 239, _window, _topLeft },
		_TypeXcodeSlate_,
		_IMouseSlate_,
		_ReturnKey_,
		_DirectionKeys_,
	} }
} };

#pragma mark Search
resource restype_Slate (resid_Search, "Search") { {
	Slate { "Search", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "hide find bar", "" },			_hideFindBar,
		Event { "multiple", "" },				Sequence{}, Keypress { kc_F, mf_command + mf_shift }, ResSubslate { resid_SearchIndex }, _right, endSequence{},
		Event { "find", "" },					Sequence{}, Keypress { kc_F, mf_command }, ResSubslate { resid_FindReplace }, endSequence{},
		Event { "replace", "" },				Sequence{}, Keypress { kc_F, mf_command + mf_option }, ResSubslate { resid_FindReplace }, endSequence{},
		Event { "find again", "" },				Keypress { kc_G, mf_command },
		Event { "find previous", "" },			Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },					Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace" }, _return, endSequence{},
		Event { "change again", "" },			Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace and Find Again" }, _return, endSequence{},
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#define _r1_v	132
#define	_r2_v	154
resource restype_Slate (resid_FindReplace, "FindReplace") { {
	Slate { "file", {
		_SlateGlobals_,
		ExitEvent { "exit", "" },			NilAction{},
		ExitEvent { "close", "" },			Click { 1, -31, _r1_v, _window, _topRight },
		ExitEvent { "done", "" },			Click { 1, -31, _r1_v, _window, _topRight },
		Event { "options", "" },			Sequence{}, _clickOptionsButton, _down, _return, ResSubslate { resid_findOptions }, endSequence{},
		Event { "search field", "" },		Sequence{}, Click { 1, -94, _r1_v, _window, _topRight }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "replace field", "" },		Sequence{}, Click { 1, -94, _r2_v, _window, _topRight }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "find again", "" },			Keypress { kc_G, mf_command },
		Event { "replace all", "" },		Click { 0, -542, _r2_v, _window, _topRight },
		Event { "replace", "" },			Click { 1, -454, _r2_v, _window, _topRight },
		Event { "replace and find", "" },	Click { 1, -364, _r2_v, _window, _topRight },
		Event { "change", "" },				Click { 1, -454, _r2_v, _window, _topRight },
		Event { "change again", "" },		Click { 1, -364, _r2_v, _window, _topRight },
		_TypeXcodeSlate_,
		_IMouseSlate_,
	} }
} };

resource restype_Slate (resid_findOptions, "Find Options") { {
	Slate { "opt", {
		_SlateGlobals_,
		ExitEvent { "close", "" },		Sequence{}, _clickOptionsButton, _down, _return, endSequence{},
		ExitEvent { "exit", "" },		NilAction{},
		Event { "style", "" },			Click { 1, -450, _r2_v, _window, _topRight },
		Event { "hits", "" },			Click { 1, -240, _r2_v, _window, _topRight },
		Event { "match", "" },			Click { 1, -110, _r2_v, _window, _topRight },
		Event { "wrap", "" },			Click { 1, -35, _r2_v, _window, _topRight },
		_TypeXcodeSlate_,
		_IMouseSlate_,
		_ReturnKey_,
		_DirectionKeys_,
	} }
} };

#pragma mark 4 --- Issues
resource restype_Slate (resid_IssueIndex, "Issues") { {
	Slate { "issues", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "by file", "" },		Click { 1, 35, 132, _window, _topLeft },
		Event { "by type", "" },		Click { 1, 92, 132, _window, _topLeft },
		Event { "nav list", "" },		_navList,
		_EndKey_,
		Event { "top row", "" },		_topRow,
		Event { "bottom row", "" },		_bottomRow,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 5 --- Debug
resource restype_Slate (resid_DebugIndex, "") { {
	Slate { "Debug",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "click back", "" },			Click { 1, -500, 40, _window, _topRight },
		Event { "next workspace", "" }, 	Keypress { kc_accent, mf_command },
		Event { "run", "" },				Keypress { kc_R, mf_command },
		Event { "panel", "" },				Keypress { kc_Y, mf_command + mf_shift },
		Event { "step", "" },				Keypress { kc_fn6, 0 },
		Event { "in", "" },					Keypress { kc_fn7, 0 },
		Event { "finish", "step out" },		Keypress { kc_fn8, 0 },
		Event { "pause", "" },				Keypress { kc_Y, mf_command + mf_control },
		Event { "continue", "" },			Keypress { kc_Y, mf_command + mf_control },
		Event { "threads", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_Threads },endSequence{},
		Event { "breakpoint index", "" },	Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_BreakpointIndex }, endSequence{},
		Event { "set breakpoint", "" },		_breakpoint,
		Event { "clear breakpoint", "" },	_breakpoint,
		Event { "console", "" },			Sequence{}, Keypress { kc_C, mf_command + mf_shift }, ResSubslate { resid_TypeDebugConsole }, endSequence{},
		Event { "nav list", "" },			_navList,
		_EndKey_,
		Event { "top row", "" },			_topRow,
		Event { "bottom row", "" },			_bottomRow,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark Threads
resource restype_Slate (resid_Threads, "") { {
	Slate { "threads",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "nav list", "" },			_navList,
		_EndKey_,
		Event { "top row", "" },			_topRow,
		Event { "bottom row", "" },			_bottomRow,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 6 --- Breakpoints
resource restype_Slate (resid_BreakpointIndex, "") { {
	Slate { "bkpt",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "add", "" },				Keypress { kc_backslash, mf_command },
		Event { "activate", "" },			Keypress { kc_Y, mf_command },
		Event { "nav list", "" },			_navList,
		Event { "remove breakpoint", "" },	_delete,
		_EndKey_,
		Event { "top row", "" },			_topRow,
		Event { "bottom row", "" },			_bottomRow,
		_IndexStandards_,
		_IMouseSlate_,
	} }
} };

#pragma mark 7 --- Log
resource restype_Slate (resid_LogIndex, "Log") { {
	Slate { "log", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "show all", "" },		Click { 1, 295, 132, _window, _topLeft },
		Event { "show recent", "" },	Click { 1, 345, 132, _window, _topLeft },
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "expand", "" },			Sequence{}, ClickMenu { "Editor", }, _down, TypeText { "Expand Selected Transcripts" }, _return, endSequence{},
		Event { "collapse", "" },		Sequence{}, ClickMenu { "Editor", }, _down, TypeText { "Collapse Selected Transcripts" }, _return, endSequence{},
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go tab", "" },			_goTab,
		Event { "pop issues", "" },		Click { 1, -24, 108, _window, _topRight },
		Event { "top row", "" },		_topRow,
		Event { "item one", "" },		Click { 0, -32, 187, _window, _topRight },
		focus_,
		_IndexStandards_,
		_DirectionKeys_,
	} }
} };

#pragma mark 7 === Typing
// inside: 1 Special; Copyright; Macro 2 TypeDialog; 3 _TypeXcodeItems_; Package; 4 TypeXcode [unix]; TypeDebugConsole; 5 InsertSnippet; 6 InsertElement; Styles; InsertTag; 7 UserSlate; 8 Doxygen; 9 typeSearch
#define _quote Keypress { kc_quote, mf_shift }
#define _uc1		Keypress { kc_tab, 0 }, TypeText { "<p><b>" }
#define _uc2		TypeText { ": </b><" }, Keypress { kc_3, mf_shift }
#define _uc3		Keypress { kc_3, mf_shift }, TypeText { "></p>" }, Keypress { kc_slash, mf_control + mf_shift }
#pragma mark 1 --- TypeSpecial
resource restype_Slate (resid_TypeSpecialXcodeSlate, "Type Special Xcode Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "pragma mark", "" },				TypeText { "#pragma mark " },
		ExitEvent { "pragma unused", "" },				Sequence{}, TypeText { "#pragma unused()" }, _left, endSequence{},
		ExitEvent { "pragma heading", "" },				Sequence{}, TypeText { "#pragma mark <#digit#> === <#text#>" }, _previous, _previous, endSequence{},
		ExitEvent { "pragma subhead", "" },				Sequence{}, TypeText { "#pragma mark <#digit#> -- <#text#>" }, _previous, _previous, endSequence{},
		ExitEvent { "define", "" },						TypeText { "#define " },
		ExitEvent { "confidential", "" },				Sequence{}, TypeText { "//" }, Keypress { kc_tab, mf_option }, TypeText { "Confidential and Proprietary." }, _return, endSequence{},
		ExitEvent { "mark spot", "" },					TypeText { "<##>" },
		ExitEvent { "indent topic item", "" },			Sequence{}, Keypress { kc_left, mf_command }, Keypress { kc_tab, mf_option }, Keypress { kc_right, mf_command }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_fdelete, 0 }, Keypress { kc_1, 0 }, endSequence{},
		ExitEvent { "test actual", "" },				TypeText { "@\"actual: %@ (%@)\", <#arg#>, _WHERE_);" };
		ExitEvent { "resource id", "" },				TypeText { "resid_" },
		ExitEvent { "in use development", "" },			TypeText { "in-use development" },
		ExitEvent { "web extension", "" },				TypeText { ".html" },
		ExitEvent { "korn extension", "" },				TypeText { ".ksh" },
		ExitEvent { "Xcode selection", "" },			TypeText { "%%%{PBXSelection}%%%" },
		ExitEvent { "verify", "" },						TypeText { "verify" },
		ExitEvent { "empty", "" },						TypeText { "&lt;empty&gt;" },
		ExitEvent { "string literal", "" },				Sequence{}, TypeText { "@\"\"" }, Keypress { kc_left, 0 }, endSequence{},
		ExitEvent { "format", "" },						TypeText { "@\"%@\"" },
		ExitEvent { "localized", "" },					Sequence{}, TypeText { "NSLocalizedString(@\"<#string#>\", nil)<##>" }, _previous, _previous, endSequence{},
		ExitEvent { "not yet implemented", "" },		TypeText { "_NotYetImplemented_" },
		ExitEvent { "object", "" },						TypeText { "NSObject" },
		ExitEvent { "is equal to", "" },				TypeText { "isEqualTo" },
		ExitEvent { "string", "" },						TypeText { "NSString " },
		ExitEvent { "string with format", "" },			TypeText { "stringWithFormat" },
		ExitEvent { "is equal to string", "" },			TypeText { "isEqualToString" },
		ExitEvent { "integer", "" },					TypeText { "NSInteger " },
		ExitEvent { "error", "" },						TypeText { "NSError " },
		ExitEvent { "error with domain", "" },			TypeText { "errorWithDomain" },
		ExitEvent { "a ray", "" },						TypeText { "NSArray " },
		ExitEvent { "a ray with objects", "" },			TypeText { "arrayWithObjects" },
		ExitEvent { "dictionary", "" }, 				TypeText { "NSDictionary " },
		ExitEvent { "dictionary with objects", "" },	TypeText { "dictionaryWithObjects" },
		ExitEvent { "app delegate", "" },				TypeText { "[NSApp delegate]" },
		ExitEvent { "encoding", "" },					TypeText { "NSUTF8StringEncoding" },
		ExitEvent { "log standard", "" },				Sequence{}, TypeText { "NSLog(@\"%s#%d <##>\", __PRETTY_FUNCTION__, __LINE__, <##>);" }, _previous, _previous, endSequence{};
		ExitEvent { "log always", "" },					Sequence{}, TypeText { "_ALog_(@\"<#fmt#>\", <#args#>);" }, _previous, _previous, endSequence{},
		ExitEvent { "log debug", "" },					Sequence{}, TypeText { "_DLog_(@\"<#fmt#>\", <#args#>);" }, _previous, _previous, endSequence{},
		ExitEvent { "declare test", "" },				TypeText { "- (void)test" },
		Event { "keys", "" },		Subslate { "keys" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "localized description", "" },	TypeText { "NSLocalizedDescriptionKey" },
			Event { "reason", "" },					TypeText { "NSLocalizedFailureReasonErrorKey" },
			Event { "underlying error", "" },		TypeText { "NSUnderlyingErrorKey" },
			Event { "where", "" },					TypeText { "WhereErrorKey" },
			Event { "comma", "" },					Keypress { kc_comma, 0 },
			Event { "space", "" },					Keypress { kc_space, 0 },
			endSubslate{},
		Event { "assert", "" },			Subslate { "assert" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "true", "" },			Sequence{}, TypeText { "STAssertTrue (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "fail", "" },			Sequence{}, TypeText { "STFail (<#msgFormat#>)" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "equal objects", "" },	Sequence{}, TypeText { "STAssertEqualObjects (<#object_1#>, <#object_2#>, nil);" }, _previous, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "equal strings", "" },	Sequence{}, TypeText { "_AssertEqualStrings_(<#str1#>,<#str2#>)" }, _previous, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "equals", "" },			Sequence{}, TypeText { "STAssertEquals (<#value_1#>, <#value_2#>, nil);" }, _previous, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "equals with accuracy", "" }, Sequence{}, TypeText { "STAssertEqualsWithAccuracy (<#value_1#>, <#value_2#>, <#accuracy#>, nil);" }, _previous, _previous, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "nil", "" },			Sequence{}, TypeText { "STAssertNil (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "not nil", "" },		Sequence{}, TypeText { "STAssertNotNil (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "true", "" },			Sequence{}, TypeText { "STAssertTrue (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "false", "" },			Sequence{}, TypeText { "STAssertFalse (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "throw", "" },			Sequence{}, TypeText { "STAssertThrows (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "no throw", "" },		Sequence{}, TypeText { "STAssertNoThrow (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "true no throw", "" },	Sequence{}, TypeText { "STAssertTrueNoThrow (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "false no throw", "" },	Sequence{}, TypeText { "STAssertFalseNoThrow (<#expression#>, nil);" }, _previous, CloseSubslate{}, endSequence{},
			ExitEvent { "verify", "" },			TypeText { "STAssertTrue ([verifier verify], [verifier message]);" },
			endSubslate{},
		ExitEvent { "Use Case", "" },		Subslate { "Use Case" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "scope", "" },		Sequence{}, _uc1, TypeText { "Scope" }, _uc2, TypeText { "scope" }, _uc3, endSequence{},
			ExitEvent { "Actor", "" },		Sequence{}, _uc1, TypeText { "Primary Actor" }, _uc2, TypeText { "Primary Actor" }, _uc3, endSequence{},
			ExitEvent { "Context", "" },	Sequence{}, _uc1, TypeText { "Context of Use" }, _uc2, TypeText { "Context" }, _uc3, endSequence{},
			ExitEvent { "Interests", "" },	Sequence{}, _uc1, TypeText { "Stakeholders and Interests" }, _uc2, TypeText { "Stakeholders: Interest" }, _uc3, endSequence{},
			ExitEvent { "Precondition", "" },	Sequence{}, _uc1, TypeText { "Precondition" }, _uc2, TypeText { "Precondition" }, _uc3, endSequence{},
			ExitEvent { "Minimal", "" },	Sequence{}, _uc1, TypeText { "Minimal Guarantee" }, _uc2, TypeText { "Minimal" }, _uc3, endSequence{},
			ExitEvent { "Success", "" },	Sequence{}, _uc1, TypeText { "Success Guarantee" }, _uc2, TypeText { "Success" }, _uc3, endSequence{},
			ExitEvent { "Trigger", "" },	Sequence{}, _uc1, TypeText { "Trigger" }, _uc2, TypeText { "Trigger" }, _uc3, endSequence{},
			ExitEvent { "Scenario", "" },	Sequence{}, _uc1, TypeText { "Main Success Scenario" },
				TypeText { ": </b><ol>" }, _return, _tab, Keypress { kc_comma, mf_shift }, Keypress { kc_3, mf_shift },
				TypeText { "Scenario" }, Keypress { kc_3, mf_shift }, Keypress { kc_period, mf_shift },
				_return, _tab, TypeText { "</ol>" }, Keypress { kc_slash, mf_control + mf_shift },
				endSequence{},
			ExitEvent { "Extensions", "" },	Sequence{}, _uc1, TypeText { "Extensions" }, _uc2, TypeText { "Extensions" }, _uc3, endSequence{},
			ExitEvent { "Variations", "" },	Sequence{}, _uc1, TypeText { "Technology &amp; Data Variations" }, _uc2, TypeText { "Variations" }, _uc3, endSequence{},
			ExitEvent { "Related", "" },	Sequence{}, _uc1, TypeText { "Related Information" }, _uc2, TypeText { "Related" }, _uc3, endSequence{},
			ExitEvent { "Diagram", "" },	Sequence{}, _uc1, TypeText { "Diagram" }, _uc2, TypeText { "link to diagram" }, _uc3, endSequence{},
			endSubslate{},
	} }
} };

#pragma mark Copyright
resource restype_Slate (resid_Copyright, "") { {
	Slate { "Copyright",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "code", "" },				Sequence{}, Keypress { kc_up, mf_command }, _down, _down, _down, _down, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "resource", "" },			Sequence{}, Keypress { kc_up, mf_command }, _down, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "markup", "" },				Sequence{}, Keypress { kc_down, mf_command }, _up, _up, _up, _up, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },  Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "shell", "" },				Sequence{}, Keypress { kc_up, mf_command }, _down, _down, _down, _down, _down, _down, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
	} }
} };

#pragma mark Macro
resource restype_Slate (resid_Macro, "") { {
	Slate { "Macro",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		_CommandSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoSelectSubslate_,
		focus_,
		focusBack_,
		ExitEvent { "add marker", "from start of named header line" },		Sequence{},
			_return, _up,
			jump_right_, jump_right_, jump_right_, jump_right_, jump_right_, jump_right_, jump_right_, jump_right_,
			Keypress { kc_left, mf_shift + mf_option },	Keypress { kc_C, mf_command }, _up,
			TypeText { "<!-- marker " }, Keypress { kc_quote, mf_shift }, Keypress { kc_V, mf_command },
			Keypress { kc_quote, mf_shift }, TypeText { " -->" },
			endSequence{},
		ExitEvent { "add line", "for ArbonneIn" },	Sequence{},
			Keypress { kc_right, mf_command }, Keypress { kc_right, 0 }, Keypress { kc_right, mf_command + mf_shift }, Keypress { kc_X, mf_command },
			TypeText { "<tr><td class=\"mono\"><#name#></td> <td><#type#></td> <td><#options#></td> <td><#desc#></td></tr>" },
			Keypress { kc_slash, mf_control }, Keypress { kc_V, mf_command }, Keypress { kc_slash, mf_control }, endSequence{},
		ExitEvent { "find topic lists", "" },	Sequence{}, Keypress { kc_F, mf_command }, TypeText { "@topicList" }, endSequence{},
		ExitEvent { "blurb", "" },	Sequence{}, _left, _left, TypeText { " class='blurb'" }, Keypress { kc_slash, mf_control }, endSequence{},
		ExitEvent { "copy prototype", "" },	Sequence{}, Keypress { kc_right, mf_command },
			Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_C, mf_command }, _right, endSequence{},
		ExitEvent { "combine lines", "" },	Sequence{}, Keypress { kc_right, mf_command }, Keypress { kc_right, mf_option },
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_delete, 0 },
			Keypress { kc_delete, 0 }, Keypress { kc_space, 0 }, endSequence{},
		Event { "comment line", "" },	Sequence{},
			Keypress { kc_down, 0 }, Keypress { kc_left, mf_command },
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
			Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
			Keypress { kc_return, 0 },
			endSequence{},
		Event { "comment hyphen", "" },	Sequence{},
			Keypress { kc_down, 0 }, Keypress { kc_left, mf_command },
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
			Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
			Keypress { kc_return, 0 }, Keypress { kc_period, 0 }, Keypress { kc_space, 0 },
			endSequence{},
		Event { "period", "" },					Keypress { kc_period, 0 },
		Event { "comment title", "" },			Sequence{},
			Keypress { kc_left, mf_command }, TypeText { "-- " },
			Keypress { kc_right, mf_command }, TypeText { " --" }, endSequence{},
		Event { "add item", "" },				Keypress { kc_A, mf_command + mf_option },
		Event { "next document", "" },			Sequence{},
			Click { 1, _splitter_x+110, 75, _window, _topLeft }, _down, _return,
			endSequence{},
		Event { "step tag", "" },				Sequence{},
			TypeText { "<a href=\<##>_hist.html#" }, Keypress { kc_V, mf_command }, TypeText { "\">" }, Keypress { kc_V, mf_command },
			TypeText { "</a>" }, Keypress { kc_slash, mf_control }, endSequence{},
		Event { "make list item", "" },			Sequence{}, _cutNextLine, _delete, _return, TypeText { "<li></li>" },
			_left, _left, _left, _left, _left, Keypress { kc_V, mf_command }, endSequence{},
		Event { "indent items", "" },		Sequence{},
			Keypress { kc_closebracket, mf_command }, Keypress { kc_left, mf_shift },
			Keypress { kc_X, mf_command }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
			TypeText { "<ul>" }, Keypress { kc_return, mf_option },
			Keypress { kc_V, mf_command + mf_option + mf_shift }, _delete, _return, _delete,
			TypeText { "</ul>" }, endSequence{},
		Event { "add plain list", "" },		Sequence{},
			TypeText { "<ul>" }, _return, TypeText { "</ul>" }, Keypress { kc_M, mf_control }, Keypress { kc_X, mf_command },
			endSequence{},
		Event { "one", "temp" },				Sequence{},
			TypeText { "_insert_row, " },
			endSequence{},
		Event { "two", "temp" },				Sequence{},
			Keypress { kc_left, mf_command }, TypeText { "//" }, Keypress { kc_left, mf_command }, _down,
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

#pragma mark 3 --- _TypeXcodeItems_
#define _TypeXcodeItems_	\
	Event { "complete", "" },	Keypress { kc_escape, 0 },	\
	Event { "finish", "" },		Keypress { kc_escape, 0 },	\
	Event { "add space", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_space, 0 }, endSequence{},	\
	Event { "add comma", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_comma, 0 }, endSequence{},	\
	Event { "list item", "" },	Sequence{}, TypeText { "<li><#item#></li>" }, _previous, endSequence{},	\
	gotoReference_,	\
	_JumpBar_,		\
	closeDocument_,	\
	Event { "page top", "" },	Keypress { kc_home, 0 },	\
	Event { "page bottom", "" },	Keypress { kc_end, 0 },	\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	Event { "next field", "" },	Keypress { kc_slash, mf_control },	\
	Event { "previous field", "" },	Keypress { kc_slash, mf_control + mf_shift },	\
	Event { "goto line", "" },		Keypress { kc_L, mf_command },	\
	Event { "select word", "" },	_selword,		\
	Event { "select line", "" },	_selline,		\
	Event { "capitalize", "" },		_capitalize,	\
	Event { "lower case", "" },		_lowercase,		\
	Event { "breakpoint", "" },		_breakpoint,	\
	Event { "balance", "" },		Keypress { kc_M, 0 },	\
	Event { "copy", "" },			Keypress { kc_C, mf_command },	\
	Event { "paste", "" },			Keypress { kc_V, mf_command + mf_option + mf_shift },	\
	Event { "undo", "" },			Keypress { kc_Z, mf_command },	\
	Event { "Snippet", "" },			ResSubslate { resid_InsertSnippet }, \
	Event { "Special", "" },			ResSubslate { resid_TypeSpecialXcodeSlate }, \
	Event { "choose two", "" }, _down,	\
	Event { "choose three", "" }, Sequence{}, _down, _down, endSequence{},	\
	Event { "choose four", "" }, Sequence{}, _down, _down, _down, endSequence{},	\
	Event { "choose five", "" }, Sequence{}, _down, _down, _down, _down, endSequence{},	\
	Event { "choose six", "" }, Sequence{}, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose seven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose eight", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose nine", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose ten", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose eleven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose twelve", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose thirteen", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose north", "" }, Subslate { "selUp" },		\
		_SlateGlobals_,		\
		_CloseSubslate_,	\
		ExitEvent { "one", "" }, 	_up,	\
		ExitEvent { "two", "" }, 	Sequence{}, _up, _up, endSequence{},	\
		ExitEvent { "three", "" },	Sequence{}, _up, _up, _up, endSequence{},	\
		ExitEvent { "four", "" }, 	Sequence{}, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "five", "" }, 	Sequence{}, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "six", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "seven", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "eight", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "nine", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "ten", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up,_up, _up, _up, _up, endSequence{},	\
		ExitEvent { "eleven", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "twelve", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "thirteen", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		endSubslate{},		\
	_DoJumpSubslate_,		\
	_DoSelectSubslate_,		\
	Event { "jump right", "option-right <n> times" },	Subslate { "<n>" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		ExitEvent { "one", "" },		Sequence{},	\
			Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "two", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "three", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "four", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "five", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "six", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "seven", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "eight", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "nine", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "ten", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		endSubslate{},	\
	Event { "jump left", "option-left <n> times" },	Subslate { "<n>" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		ExitEvent { "one", "" },		Sequence{},	\
			Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "two", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "three", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "four", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "five", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "six", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "seven", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "eight", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "nine", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "ten", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		endSubslate{},	\
	_JumpDownSubslate_,	\
	_JumpNorthSubslate_,	\
	_TypeSlateItems_

resource restype_Slate (resid_Package, "") { {
	Slate { "Package", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Accessor", "" },		TypeText { "_AC" },
		ExitEvent { "Carbon", "" },			TypeText { "_C9" },
		ExitEvent { "Access Library", "" },	TypeText { "_AL" },
		ExitEvent { "Cocoa", "" },			TypeText { "NS" },
	} }
} };

#pragma mark 4 --- TypeXcode
#define _where_	"\"$0#$LINENO:\""
resource restype_Slate (resid_TypeXcodeSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Package", "" },		ResSubslate { resid_Package },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "Copyright", "" },		ResSubslate { resid_Copyright },
		_JumpBar_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "start line", "" },		Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_delete, 0 }, endSequence{},
		Event { "counterpart", "" },	_counterpart,
		focus_,
		focusBack_,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
		Event { "edit scope", "" },		Keypress { kc_E, mf_command + mf_control },
		Event { "cut next line", "" },	Sequence{}, _cutNextLine, endSequence{},
		Event { "exec line", "" },		Sequence{}, Keypress { kc_right, mf_command }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_R, mf_control }, endSequence{},
		Event { "Add Style", "" },			ResSubslate { resid_InsertStyle },
		Event { "Insert Tag", "" },			ResSubslate { resid_InsertTag },
		Event { "User", "" },				ResSubslate { resid_InsertSlateText },
		Event { "Doxygen", "" },			ResSubslate { resid_Doxygen },
		Event { "indent", "" },				_indent,
		Event { "indent back", "" },		_indentBack,
		Event { "go definition", "" },		Keypress { kc_J, mf_command + mf_control },
		_lookup,
		Event { "save files", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "search", "" },				ResSubslate { resid_typeSearch },
		Event { "unix", "" },				Subslate { "unix" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "clipboard", "" },					Sequence{}, _selword, Keypress { kc_X, mf_command }, endSequence{},
			ExitEvent { "shebang", "" },				Sequence{}, TypeText { "#! /bin/ksh" }, _return, _return, endSequence{},
			ExitEvent { "variable", "" },				Sequence{}, TypeText { "\"${<##>}\"<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "plain variable", "" },			Sequence{}, TypeText { "${<##>}<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "enclose variable", "" },		Sequence{}, _selword, Keypress { kc_X, mf_command }, TypeText { "\"${" }, Keypress { kc_V, mf_command }, TypeText { "}\"" },endSequence{},
			ExitEvent { "enclose plain variable", "" },	Sequence{}, _selword, Keypress { kc_X, mf_command }, TypeText { "${" }, Keypress { kc_V, mf_command }, TypeText { "}" },endSequence{},
			ExitEvent { "condition", "" },				Sequence{}, TypeText { "[[ <#condition#> ]] <*##>" }, _previous, endSequence{},
			ExitEvent { "logical or", "" },				TypeText { "|| " },
			ExitEvent { "logical and", "" },			TypeText { "&& " },
			ExitEvent { "command", "" },				Sequence{},	TypeText { "\"$(<##>)\"<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "plain command", "" },			Sequence{},	TypeText { "$(<##>)<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "if block", "" },		Sequence{}, TypeText { "if [[ <##> ]] ; then" },
				_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },
				_previous, _previous, endSequence{},
			ExitEvent { "case block", "" },		Sequence{}, TypeText { "case \"${<#varname#>}\" in" },
				_return, _tab, TypeText { "<#item#> )" }, _return, _tab, TypeText { "<#block#>" }, _return,
				TypeText { ";;" }, 	_return, _delete, TypeText { "* )" }, _return, _delete, TypeText { "esac" },
				_previous, _previous, _previous, endSequence{},
			ExitEvent { "check status", "" },		Sequence{},
				TypeText { "if [[ \"${?}\" > 0 ]] ; then" },
				_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },
				_previous, _previous, endSequence{},
			ExitEvent { "where", "" },				TypeText { _where_ },
			ExitEvent { "error exit", "" },			Sequence{}, TypeText { "errorExit $?<##> "_where_" \"<#msg#>\"" }, _previous, _previous, endSequence{},
			ExitEvent { "error message", "" },		Sequence{}, TypeText { "errorMessage $?<##> "_where_" \"<#msg#>\"" }, _previous, _previous, endSequence{},
			ExitEvent { "function", "" },			TypeText { "unixFunction#" },
			ExitEvent { "test", "" },				TypeText { "unixTest#" },
			ExitEvent { "test function", "" },		TypeText { "unixTestFunction#" },
			ExitEvent { "assert equal", "" },		Sequence{}, TypeText { "assertEquals "_where_" <#expected#> <#actual#>" }, _previous, _previous, endSequence{},
			ExitEvent { "assert not equal", "" },	Sequence{}, TypeText { "assertNotEquals "_where_" <#unexpected#> <#actual#>" }, _previous, _previous, endSequence{},
			ExitEvent { "assert null", "" },		Sequence{}, TypeText { "assertNull "_where_" <#value#>" }, _previous, endSequence{},
			ExitEvent { "assert not null", "" },	Sequence{}, TypeText { "assertNotNull "_where_" <#value#>" }, _previous, endSequence{},
			ExitEvent { "assert true", "" },		Sequence{}, TypeText { "assertTrue "_where_" <#condition#>" }, _previous, endSequence{},
			ExitEvent { "assert false", "" },		Sequence{}, TypeText { "assertFalse "_where_" <#condition#>" }, _previous, endSequence{},
			ExitEvent { "assert failure", "" },		TypeText { "fail "_where_"" },
			endSubslate{},
		Event { "Insert Element", "" },		ResSubslate { resid_InsertElement },
		Event { "Element", "" },			ResSubslate { resid_InsertElement },
		Event { "show selection", "" },		Keypress { kc_L, mf_command + mf_shift },
		_TypeXcodeItems_
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

#pragma mark 5 --- InsertSnippet
resource restype_Slate (resid_InsertSnippet, "") { {
	Slate { "snippet",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },						NilAction{},
		ExitEvent { "okay", "" },						_return,
		Event { "continue", "" },						_return,
		Event { "clipboard", "" },						Sequence{}, _selword, Keypress { kc_X, mf_command }, endSequence{},
		ExitEvent { "file header", "" },	 			TypeText { "fileHeader#" },
		ExitEvent { "window controller property", "" },	TypeText { "windowControllerProperty#" },
		ExitEvent { "dynamic property", "" },			TypeText { "dynamicProperty#" },
		ExitEvent { "accessor retain", "" },			TypeText { "accessorRetain#" },
		ExitEvent { "category accessors", "" },			TypeText { "categoryAccessors#" },
		ExitEvent { "relationship accessors", "" },		TypeText { "relationshipAccessors#" },
		ExitEvent { "file images sheet", "" },			TypeText { "fileImagesSheet#" },
		ExitEvent { "table view", "" },					TypeText { "tableView#" },
		ExitEvent { "init", "" },						TypeText { "init#" },
		ExitEvent { "constant", "" },					TypeText { "constant#" },
		Event { "property", "" },						TypeText { "property#" },
		Event { "attribute", "" },						Subslate { "attribute" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "read only", "" },						TypeText { "readonly, " },
			ExitEvent { "strong", "" },						TypeText { "strong" },
			ExitEvent { "weak", "" },						TypeText { "weak" },
			ExitEvent { "retain", "" },						TypeText { "retain" },
			ExitEvent { "assign", "" },						TypeText { "assign" },
			ExitEvent { "copy", "" },						TypeText { "copy" },
			endSubslate{},
		Event { "project", "" },						Subslate { "project" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },					TypeText { "Support" },
			ExitEvent { "Accessor", "" },					TypeText { "Accessor" },
			ExitEvent { "Punkin", "" },						TypeText { "Punkin" },
			endSubslate{},
		Event { "user slate", "" },						TypeText { "userSlate#" },
		ExitEvent { "heading with name", "" },			TypeText { "headingWithName#" },
		ExitEvent { "heading with topics", "" },		TypeText { "headingWithTopics#" },
		Event { "developer link", "" },					TypeText { "developerLink#" },
		ExitEvent { "developer item", "" },				TypeText { "developerItem#" },
		ExitEvent { "glossary item", "" },				TypeText { "glossaryItem#" },
		Event { "use case", "" },						Sequence{}, TypeText { "useCase#" }, ResSubslate { resid_ucActor }, endSequence{},
		Event { "use case link", "" },					Sequence{}, TypeText { "useCaseLink#" }, endSequence{},
		Event { "level", "" },							ResSubslate { resid_ucLevel },
	} }
} };

#pragma mark ucLevel
resource restype_Slate (resid_ucLevel, "") { {
	Slate { "goal level",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "high", "" },			Sequence{}, _previous, _previous, _previous, _previous, TypeText { "High Summary" }, endSequence{},
		ExitEvent { "summary", "" },		Sequence{}, _previous, _previous, _previous, _previous, TypeText { "Summary" }, endSequence{},
		ExitEvent { "user", "" },			Sequence{}, _previous, _previous, _previous, _previous, TypeText { "User Goal" }, endSequence{},
		ExitEvent { "function", "" },		Sequence{}, _previous, _previous, _previous, _previous, TypeText { "Subfunction" }, endSequence{},
		ExitEvent { "low", "" },			Sequence{}, _previous, _previous, _previous, _previous, TypeText { "Low" }, endSequence{},
	} }
} };

#pragma mark ucActor
resource restype_Slate (resid_ucActor, "") { {
	Slate { "ucActor",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "continue", "" },				_return,
		Event { "Product", "" },			TypeText { "Product" },
		Event { "Developer", "" },			TypeText { "Developer" },
		Event { "Activity", "" },			TypeText { "Activity" },
		Event { "Word", "" },				TypeText { "Word" },
		Event { "Picture", "" },			TypeText { "Picture" },
		Event { "Image", "" },				TypeText { "Image" },
		Event { "Layer", "" },				TypeText { "Layer" },
	} }
} };

#pragma mark 6 --- InsertElement
resource restype_Slate (resid_InsertElement, "") { {
	Slate { "Element",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "marker", "" },					Sequence{}, TypeText { "<!-- @marker \"p\" -->" }, _return, _up, _next, endSequence{},
		ExitEvent { "topic item", "" },				Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"<#linkDestination#>\" \"<#indent0-3#>\" \"<#[description]#>\" -->" }, _up, _next, endSequence{},
		ExitEvent { "topic Group", "" },	Sequence{},
			TypeText { "<!-- @topicGroup \"<#title#>\" \"<#linenum#>\" -->" }, _previous, _previous, endSequence{},
		ExitEvent { "topic Separator", "" },	TypeText { "<!-- @topicSep -->" },
		ExitEvent { "goal", "" },		Sequence{}, TypeText { "<tr> <td><#Project#></td> <td><#goal#></td> <td class='small'><#comments#></td> <td align=\"center\"><#priority#></td> </tr>" }, _previous,  _previous, _previous, _previous, endSequence{},
		ExitEvent { "heading with topics", "" },		Sequence{},
			TypeText { "<#=== -> topicList [1]#>" }, _indentBack, _return,
			TypeText { "<!-- @topicItem \"<#title#>\" \"#<#name#>\" \"0\" \"\" -->" }, _return,
			TypeText { "<!-- @marker \"<#title#>\" -->" }, _indentBack, _return,
			TypeText { "<h<#level#>><#title#></h<#level#>><##>" }, _indentBack, _return,
			TypeText { "<!-- @topicList \"<#title#>\" \"<#name#>\" -->" }, _indentBack, _return,
			TypeText { "<!-- @/topicList --><##>" }, _indentBack, _return,
			_indentBack, _next, endSequence{},
		ExitEvent { "bug or issue", "" },	Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"#BI_<#abbreviatedDate#>-01\" \"0\" \"[BI_<#abbreviatedDate#>-01]\" -->" }, _indent, _return,
			TypeText { "<h5 id='BI_<#abbreviatedDate#>-01'>__title__ [BI_<#abbreviatedDate#>-01] new</h5>" }, _return,
			endSequence{},
		ExitEvent { "current tag", "" },	Sequence{},	TypeText { "<li class='tlmark'>&lt;--</li>" }, _previous, endSequence{},
		ExitEvent { "date mark", "" },		Sequence{},	TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previous, endSequence{},
		ExitEvent { "date list", "" },		Sequence{}, TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previous, endSequence{},
		ExitEvent { "date paragraph", "" },	Sequence{}, TypeText { "<p class='tldate'>[<#date#>]</p>" }, _previous, endSequence{},
		ExitEvent { "version marker", "" },	Sequence{}, TypeText { "<p class='tlversion'>[v<#version#> <#milestone#>]</p>" }, _previous, _previous, endSequence{},
		ExitEvent { "unix selection", "" }, TypeText { "%%%{PBXSelection}%%%" },
		ExitEvent { "ampersand", "" }, 		TypeText { "&amp;" },
		ExitEvent { "less than", "" }, 		TypeText { "&lt;" },
		ExitEvent { "greater than", "" }, 	TypeText { "&gt;" },
		ExitEvent { "angle brackets", "" },	Sequence{}, TypeText { "&lt;&gt;<##> " }, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "hard space", "" }, 	TypeText { "&nbsp;" },
		ExitEvent { "arrow left", "" }, 	TypeText { "&larr;" },
		ExitEvent { "arrow right", "" },	TypeText { "&rarr;" },
		ExitEvent { "arrow up", "" }, 		TypeText { "&uarr;" },
		ExitEvent { "arrow down", "" },		TypeText { "&darr;" },
		ExitEvent { "check mark", "" }, 	TypeText { "&radic;" },
		ExitEvent { "bullet", "" }, 		TypeText { "&bull;" },
		ExitEvent { "diamond", "" }, 		TypeText { "&loz;" },
	} }
} };
//ExitEvent { "heading with name", "" }, Sequence{}, TypeText { "@headingWithName <#title#>; <#name#>; <#level#>" }, _return, _up, _next, endSequence{},
//ExitEvent { "heading with topics", "" }, Sequence{}, TypeText { "@headingWithTopics <#title#>; <#name#>; <#level#>" }, _return, _up, _next, endSequence{},
//ExitEvent { "bug or issue", "" }, Sequence{}, TypeText { "@bugOrIssue <#title#>" }, _return, _up, _next, endSequence{},

#pragma mark Styles
resource restype_Slate (resid_InsertStyle, "css Styles") { {
	Slate { "Style",	{
		_SlateGlobals_,
		_StyleItems_,
	} }
} };

resource restype_Slate (resid_InsertTag, "HTML tag") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		_TagItems_,
	} }
} };

#pragma mark 7 --- UserSlate
resource restype_Slate (resid_InsertSlateText, "Slate text") { {
	Slate { "UserSlate",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "define", "" },				Sequence{}, TypeText { "#define" }, Keypress { kc_tab, mf_option }, endSequence{},
		ExitEvent { "exit event", "" },			TypeText { "ExitEvent { \"" },
		ExitEvent { "event", "" },				TypeText { "Event { \"" },
		ExitEvent { "plain event", "" },		TypeText { "Event { \"" },
		ExitEvent { "end event", "" },			Sequence{}, TypeText { "\", \"\" }," }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},
		ExitEvent { "sequence", "" },			Sequence{}, TypeText { "Sequence{}, <##>endSequence{}," }, _previous, endSequence{},
		ExitEvent { "subslate", "" },			Sequence{}, TypeText { "Subslate { \"<##>\" }," }, _return, _tab, TypeText { "_SlateGlobals_," }, _return, TypeText { "_CloseSubslate_," }, _return, TypeText { "<##>" }, _return, TypeText { "endSubslate{}," }, _previous, _previous, endSequence{},
		ExitEvent { "indent subslate", "" },	Sequence{}, _indent, _down, _indent, _indent, _down, _indent, _indent, _down, _indent, endSequence{},
		ExitEvent { "type text", "" },			Sequence{}, TypeText { "TypeText { \"<##>\" }," }, _previous, endSequence{},
		ExitEvent { "resource subslate", "" },	Sequence{}, TypeText { "ResSubslate { <##> }, " }, _previous, endSequence{},
		ExitEvent { "click menu", "" },			Sequence{}, TypeText { "ClickMenu { \"<##>\" }, " }, _previous, endSequence{},
		ExitEvent { "launch", "" },				Sequence{}, TypeText { "Launch { \"<#path#>\", <#slate#> }, " }, _previous, _previous, endSequence{},
		ExitEvent { "script", "" },				Sequence{}, TypeText { "Script { \"<#script#>\", \"<#target#>\" }," }, _previous, _previous, endSequence{},
		ExitEvent { "interface script", "" },	Sequence{}, TypeText { "UIScript { \"<#script#>\", \"<#target#>\" }," }, _previous, _previous, endSequence{},
		ExitEvent { "wait", "" },				Sequence{}, TypeText { "Wait { <##> }, " }, _previous, endSequence{},
		ExitEvent { "open site", "" },			Sequence{}, TypeText { "OpenURL { \"<##>\" }," }, _previous, endSequence{},
		ExitEvent { "nil action", "" },			TypeText { "NilAction{}" },
		ExitEvent { "close subslate", "" },		TypeText { "CloseSubslate{}," },
		Event { "keypress", "" },				Sequence{}, TypeText { "Keypress { kc_<##>, <##> }," }, _previous, _previous, endSequence{},
			ExitEvent { "key return", "" },			TypeText { "return" },
			ExitEvent { "key space", "" },			TypeText { "space" },
			ExitEvent { "key enter", "" },			TypeText { "enter" },
			ExitEvent { "key delete", "" },			TypeText { "delete" },
			ExitEvent { "key forward delete", "" },	TypeText { "fdelete" },
			ExitEvent { "key tab", "" },			TypeText { "tab" },
			ExitEvent { "key escape", "" },			TypeText { "escape" },
			ExitEvent { "key left", "" },			TypeText { "left" },
			ExitEvent { "key right", "" },			TypeText { "right" },
			ExitEvent { "key up", "" },				TypeText { "up" },
			ExitEvent { "key down", "" },			TypeText { "down" },
			ExitEvent { "key comma", "" },			TypeText { "comma" },
			ExitEvent { "key period", "" },			TypeText { "period" },
			ExitEvent { "key backslash", "" },		TypeText { "backslash" },
			ExitEvent { "modify command", "" },		TypeText { "mf_command" },
			ExitEvent { "modify shift", "" },		TypeText { "mf_shift" },
			ExitEvent { "modify capslock", "" },	TypeText { "mf_capslock" },
			ExitEvent { "modify option", "" },		TypeText { "mf_option" },
			ExitEvent { "modify control", "" },		TypeText { "mf_control" },
		ExitEvent { "click", "" },				Sequence{}, TypeText { "Click { <#count#>, <#h#>, <#v#>, <#position#> }," }, _previous, _previous, _previous, _previous, endSequence{},
		ExitEvent { "click modified", "" },		Sequence{}, TypeText { "ClickMod { <#count#>, <#h#>, <#v#>, <#position#>, <#modifiers#> }," }, _previous, _previous, _previous, _previous, _previous, endSequence{},
			Event { "window", "" },					Sequence{}, TypeText { "_window, <#corner#>" }, _previous, endSequence{},
			Event { "screen", "" },					Sequence{}, TypeText { "_screen, <#corner#>" }, _previous, endSequence{},
			ExitEvent { "cursor", "" },				TypeText { "_cursor" },
			ExitEvent { "top left", "" },			TypeText { "_topLeft" },
			ExitEvent { "top center", "" },			TypeText { "_topCenter" },
			ExitEvent { "top right", "" },			TypeText { "_topRight" },
			ExitEvent { "bottom right", "" },		TypeText { "_bottomRight" },
			ExitEvent { "bottom center", "" },		TypeText { "_bottomCenter" },
			ExitEvent { "bottom left", "" },		TypeText { "_bottomLeft" },
			ExitEvent { "center right", "" },		TypeText { "_centerRight" },
			ExitEvent { "center center", "" },		TypeText { "_centerCenter" },
			ExitEvent { "center left", "" },		TypeText { "_centerLeft" },
		ExitEvent { "slate", "" },				Sequence{},
			TypeText { "#define resid_<##>" }, Keypress { kc_tab, mf_option }, TypeText { "<#relative_resid#>+<##>" }, _return,
			TypeText { "Event { \"<##>\", \"\" }," }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, TypeText { "ResSubslate { resid_<##> }," }, _return,
			Keypress { kc_3, mf_shift }, TypeText { "pragma mark <##>" }, _return,
			TypeText { "resource restype_Slate (resid_<##>, \"\") { {" }, _return,
			TypeText { "Slate { \"<##>\"," }, Keypress { kc_tab, mf_option }, TypeText { "{" }, _return,
			TypeText { "_SlateGlobals_," }, _return,
			TypeText { "_CloseSubslate_," }, _return,
			TypeText { "<##>" }, _return,
			TypeText { "} }" }, _return,
			TypeText { "} };" }, _return,
			_previous, _previous, _previous, _previous, _previous, _previous, _previous, _previous, _previous,
			endSequence{},
		Event { "macro", "" },					Subslate { "macro" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "define", "" },				Sequence{}, TypeText { "#define" }, _tab, endSequence{},
			ExitEvent { "mark", "" },				Sequence{}, Keypress { kc_3, mf_shift }, TypeText { "pragma mark <##>" }, _return, _previous, endSequence{},
			ExitEvent { "mark spot", "" },			TypeText { "<##>, " },
			ExitEvent { "return", "" },				TypeText { "_return, " },
			ExitEvent { "tab", "" },				TypeText { "_tab, " },
			ExitEvent { "next", "" },				TypeText { "_next, " },
			ExitEvent { "previous", "" },			TypeText { "_previous, " },
			ExitEvent { "up", "" },					TypeText { "_up, " },
			ExitEvent { "down", "" },				TypeText { "_down, " },
			ExitEvent { "left", "" },				TypeText { "_left, " },
			ExitEvent { "right", "" },				TypeText { "_right, " },
			Event { "Slate Globals", "" },			Sequence{}, TypeText { "_SlateGlobals_," }, _return, endSequence{},
			Event { "Close Subslate", "" },			Sequence{}, TypeText { "_CloseSubslate_," }, _return, endSequence{},
			Event { "Jump Down Subslate", "" },		Sequence{}, TypeText { "_JumpDownSubslate_," }, _return, endSequence{},
			Event { "Jump North Subslate", "" },	Sequence{}, TypeText { "_JumpNorthSubslate_," }, _return, endSequence{},
			Event { "Jump Left Subslate", "" },		Sequence{}, TypeText { "_JumpLeftSubslate_," }, _return, endSequence{},
			Event { "Jump Right Subslate", "" },	Sequence{}, TypeText { "_JumpRightSubslate_," }, _return, endSequence{},
			Event { "Do Jump Subslate", "" },		Sequence{}, TypeText { "_DoJumpSubslate_," }, _return, endSequence{},
			Event { "Direction Keys", "" },			Sequence{}, TypeText { "_DirectionKeys_," }, _return, endSequence{},
			Event { "Letter Keys", "" },			Sequence{}, TypeText { "_LetterKeys_," }, _return, endSequence{},
			Event { "Number Keys", "" },			Sequence{}, TypeText { "_NumberKeys_," }, _return, endSequence{},
			Event { "Whitespace Keys", "" },		Sequence{}, TypeText { "_WhitespaceKeys_," }, _return, endSequence{},
			Event { "Page Keys", "" },				Sequence{}, TypeText { "_PageKeys_," }, _return, endSequence{},
			Event { "Click One", "" },				Sequence{}, TypeText { "_ClickOne_," }, _return, endSequence{},
			Event { "Mouse Slate", "" },			Sequence{}, TypeText { "_IMouseSlate_," }, _return, endSequence{},
			Event { "Full Access Slate", "" },		Sequence{}, TypeText { "_FullAccessSlate_," }, _return, endSequence{},
			Event { "Command Slate", "" },			Sequence{}, TypeText { "_CommandSlate_," }, _return, endSequence{},
			endSubslate{},
	} }
} };

#pragma mark 8 --- Doxygen
resource restype_Slate (resid_Doxygen, "Doxygen") { {
	Slate { "Doxygen", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "exit", "" },					NilAction{},
		ExitEvent { "cancel", "" },					NilAction{},
		Event { "block", "" },						Sequence{}, TypeText { "/*!" }, _optionTab, Keypress { kc_return, 0 },
			TypeText { "*/" }, _return, _left, Keypress { kc_left, mf_command }, Keypress { kc_left, 0 }, endSequence{},
		Event { "comment", "" },					Sequence{}, TypeText { "/*!  */" }, _left, _left, _left, endSequence{},
		ExitEvent { "trailing", "trailing comment" }, Sequence{}, TypeText { "/*!< \\brief" }, _optionTab,
			TypeText { " */" }, _left, _left, _left, endSequence{},
		ExitEvent { "brief", "" },					Sequence{}, TypeText { "\\brief" }, _optionTab, _optionTab, endSequence{},
		ExitEvent { "category", "" },					Sequence{}, TypeText { "\\category <#className#>(<#categoryName#>" }, _optionTab, _previous, _previous, endSequence{},
		ExitEvent { "details", "" },				Sequence{}, TypeText { "\\details" }, _optionTab, endSequence{},
		ExitEvent { "parameter", "" },				Sequence{}, TypeText { "\\param" }, _optionTab, _optionTab,
				TypeText { "<#paramName#>" }, _optionTab, TypeText { "<#description#>" }, _previous, _previous, endSequence{},
		ExitEvent { "result", "" },					Sequence{}, TypeText { "\\result" }, _optionTab, _optionTab, endSequence{},
		ExitEvent { "file", "" },					Sequence{}, TypeText { "\\file" }, _optionTab, _optionTab,
				TypeText { "<#filename#>" }, _optionTab, TypeText { "<#description#>" }, endSequence{},
		ExitEvent { "internal", "" },				Sequence{}, TypeText { "\\internal" }, _optionTab, endSequence{},
		ExitEvent { "attention", "" },				Sequence{}, TypeText { "\\attention" }, _optionTab, endSequence{},
		ExitEvent { "bug", "" },					Sequence{}, TypeText { "\\bug" }, _optionTab, _optionTab, endSequence{},
		ExitEvent { "deprecated", "" },				Sequence{}, TypeText { "\\deprecated" }, _optionTab, endSequence{},
		ExitEvent { "exception", "" },				Sequence{}, TypeText { "\\exception" }, _optionTab, endSequence{},
		ExitEvent { "invariant", "" },				Sequence{}, TypeText { "\\invariant" }, _optionTab, endSequence{},
		ExitEvent { "note", "" },					Sequence{}, TypeText { "\\note" }, _optionTab, _optionTab, endSequence{},
		ExitEvent { "to do", "" },					Sequence{}, TypeText { "\\todo" }, _optionTab, _optionTab, endSequence{},
		ExitEvent { "paragraph", "" },				Sequence{}, TypeText { "\\par" }, _optionTab,
				TypeText { "<#title#>" }, _previous, endSequence{},
		ExitEvent { "postconditions", "" },			Sequence{}, TypeText { "\\post" }, _optionTab, endSequence{},
		ExitEvent { "preconditions", "" },			Sequence{}, TypeText { "\\pre" }, _optionTab, endSequence{},
		ExitEvent { "see also", "" },				Sequence{}, TypeText { "\\sa" }, _optionTab, endSequence{},
		ExitEvent { "since", "" },					Sequence{}, TypeText { "\\since" }, _optionTab, _optionTab,
				TypeText { "<#version#>" }, _previous, endSequence{},
		ExitEvent { "test", "" },					Sequence{}, TypeText { "\\test" }, _optionTab, endSequence{},
		ExitEvent { "throw", "" },					Sequence{}, TypeText { "\\throw" }, _optionTab, _optionTab,
				TypeText { "<#exceptionObject#>" }, _optionTab, TypeText { "<#because#>" }, _previous, _previous, endSequence{},
		ExitEvent { "copydoc", "" },					Sequence{}, TypeText { "\\copydoc" }, _optionTab,
				TypeText { "<#class#>::<#member#>\\n" }, _previous, _previous, endSequence{},
		ExitEvent { "markup", "" },					Sequence{}, TypeText { "\\htmlonly" }, _return,
				TypeText { "\\endhtmlonly" }, _up, endSequence{},
		ExitEvent { "list item", "" },				Sequence{}, TypeText { "\\li" }, _optionTab, _optionTab, endSequence{},

		ExitEvent { "group", "" },					Sequence{}, TypeText { "#pragma mark" }, _optionTab, TypeText	{ "<#groupName#>" },
				_return, TypeText { "/*! \\name" }, _optionTab, _optionTab,
				TypeText { "<#groupName#>" }, _return, TypeText { "*/" }, _return,
				TypeText { "//@{" }, _return, TypeText { "//@}" }, _return, Keypress { kc_up, mf_shift }, endSequence{},
		ExitEvent { "mainpage", "" },				Sequence{}, TypeText { "\\mainpage" }, _optionTab,
				TypeText { "<#optTitle#>" }, _optionTab, _previous, endSequence{},
		ExitEvent { "page", "" },					Sequence{}, TypeText { "\\page" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},

		ExitEvent { "anchor", "" },					Sequence{}, TypeText { "\\anchor" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, _previous, endSequence{},
		ExitEvent { "reflink", "" },				Sequence{}, TypeText { "\\ref" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "subpage", "" },				Sequence{}, TypeText { "\\subpage" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "section", "" },				Sequence{}, TypeText { "\\section" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "subsection", "" },				Sequence{}, TypeText { "\\subsection" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "subsubsection", "" },			Sequence{}, TypeText { "\\subsubsection" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "page paragraph", "" },			Sequence{}, TypeText { "\\paragraph" }, _optionTab,
				TypeText { "<#name#>" }, _optionTab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "less than", "" },				TypeText { "&lt;" },
		ExitEvent { "greater than", "" },			TypeText { "&gt;" },
		ExitEvent { "ampersand", "" },				TypeText { "&amp;" },
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
		Event { "hide find bar", "" },	_hideFindBar,
		Event { "this", "" },			Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, Keypress { kc_E, mf_command }, Keypress { kc_G, mf_command }, endSequence{},
		Event { "next", "" },			Keypress { kc_G, mf_command },
		Event { "previous", "" },		Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },			Click { 1, -454, 154, _window, _topRight },
		Event { "change again", "" },	Click { 1, -364, 154, _window, _topRight },
	} }
} };

#pragma mark 9 === External
// inside: Safari Browsers;
// GitHub
//	1 GitHub; MyPage; 2 Repository; RepoButtons; 5 Issues
// Other
//	4 Stickies; 5 Console; 6 BBEdit

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
#define _BBClickScriptsMenu	Click { 1, 628, 11, _screen, _topLeft }
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
		Event { "fix window", "" },		Script { "run (load script POSIX file \"/Users/carolclark/Library/Scripts/Developer/FixWindow.scpt\")", "" },
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
		Event { "open git hub", "" },	Sequence{}, Launch { Apps_"Safari.app", 0 }, OpenURL { "https://github.com" }, ResSubslate { resid_GitHub }, endSequence{},
		Event { "git hub", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_GitHub }, endSequence{},
		Event { "Browser", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_BrowseDoxygen }, endSequence{},
		focus_,
		focusBack_,
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page bottom", "" },	Keypress { kc_end, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "target", "" },			ResSubslate { resid_Target },
		Event { "Project", ""	},		Sequence{}, Keypress { kc_2, mf_command }, Keypress { kc_1, mf_command }, ResSubslate { resid_ProjectIndex }, endSequence{},
		Event { "Index", ""	},			ResSubslate { resid_Index },
		Event { "nav list", "" },		_navList,
		Event { "navigate", "" },		ResSubslate { resid_Navigate },
		Event { "top row", "" },		_topRow,
		Event { "standard", "" },		Sequence{}, Keypress { kc_return, mf_command }, ResSubslate { resid_StandardEditor }, endSequence{},
		Event { "assistant", "" },		Sequence{}, Keypress { kc_return, mf_command + mf_option }, ResSubslate { resid_AssistantEditor }, endSequence{},
		Event { "version", "" },		Sequence{}, Keypress { kc_return, mf_command + mf_option + mf_shift }, ResSubslate { resid_VersionEditor }, endSequence{},
		Event { "Organizer", "" },		Sequence{}, Keypress { kc_2, mf_command + mf_shift },
			ResSubslate { resid_Organizer }, endSequence{},
		Event { "Repositories", "" },	ResSubslate { resid_Repositories },
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "hide find bar", "" },	_hideFindBar,
		Event { "select tab", "" },		_goTab,
		Event { "go next", "tab" },		_goNext,
		Event { "go previous", "tab" },	_goPrevious,
		_JumpBar_,
		Event { "context menu", "" },	ClickMod { 1, 0, 0, _cursor, mf_control },
		Event { "Terminal", "" },		Sequence{}, ResSubslate { resid_XCTerminal }, Launch { Apps_"Utilities/Terminal.app", 0 }, endSequence{},
		Event { "BBEdit", "" },			Sequence{}, TypeText { "Open with External Editor" }, _return, Launch { MainApps_"BBEdit.app", 0 }, ResSubslate { resid_XCBBEdit }, endSequence{},
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
				Event { "File", "" }, 			Sequence{}, _clickFile, _down, ResSubslate { resid_FileMenu }, endSequence{},
				Event { "Source Control", "" },	Sequence{}, ClickMenu { "File" }, _down, TypeText { "Source Control" }, _right, ResSubslate { resid_SourceControl }, endSequence{},
				Event { "Edit", "" }, 			Sequence{}, ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
				Event { "Refactor", "" }, 		Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Refactor" }, _return, ResSubslate { resid_Refactor }, endSequence{},
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
		goToReference_,
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

#pragma mark Navigate
#define	_NavPanelRows_	\
	Event { "one", "" },	Click { 0, nb_h, nb_r1 + 0 * nb_rsp, _window, _topLeft },	\
	Event { "two", "" },	Click { 0, nb_h, nb_r1 + 1 * nb_rsp, _window, _topLeft },	\
	Event { "three", "" },	Click { 0, nb_h, nb_r1 + 2 * nb_rsp, _window, _topLeft },	\
	Event { "four", "" },	Click { 0, nb_h, nb_r1 + 3 * nb_rsp, _window, _topLeft },	\
	Event { "five", "" },	Click { 0, nb_h, nb_r1 + 4 * nb_rsp, _window, _topLeft },	\
	Event { "six", "" },	Click { 0, nb_h, nb_r1 + 5 * nb_rsp, _window, _topLeft },	\
	Event { "seven", "" },	Click { 0, nb_h, nb_r1 + 6 * nb_rsp, _window, _topLeft },	\
	Event { "eight", "" },	Click { 0, nb_h, nb_r1 + 7 * nb_rsp, _window, _topLeft },	\
	Event { "nine", "" },	Click { 0, nb_h, nb_r1 + 8 * nb_rsp, _window, _topLeft },	\
	Event { "ten", "" },	Click { 0, nb_h, nb_r1 + 9 * nb_rsp, _window, _topLeft },	\
	Event { "eleven", "" },	Click { 0, nb_h, nb_r1 + 10 * nb_rsp, _window, _topLeft },	\
	Event { "twelve", "" },	Click { 0, nb_h, nb_r1 + 11 * nb_rsp, _window, _topLeft },	\
	Event { "thirteen", "" },	Click { 0, nb_h, nb_r1 + 12 * nb_rsp, _window, _topLeft },	\
	Event { "fourteen", "" },	Click { 0, nb_h, nb_r1 + 13 * nb_rsp, _window, _topLeft },	\
	Event { "fifteen", "" },	Click { 0, nb_h, nb_r1 + 14 * nb_rsp, _window, _topLeft },	\
	Event { "sixteen", "" },	Click { 0, nb_h, nb_r1 + 15 * nb_rsp, _window, _topLeft },	\
	Event { "seventeen", "" },	Click { 0, nb_h, nb_r1 + 16 * nb_rsp, _window, _topLeft },	\
	Event { "eighteen", "" },	Click { 0, nb_h, nb_r1 + 17 * nb_rsp, _window, _topLeft },	\
	Event { "nineteen", "" },	Click { 0, nb_h, nb_r1 + 18 * nb_rsp, _window, _topLeft },	\
	Event { "twenty", "" },		Click { 0, nb_h, nb_r1 + 19 * nb_rsp, _window, _topLeft },	\
	Event { "twenty one", "" },	Click { 0, nb_h, nb_r1 + 20 * nb_rsp, _window, _topLeft },	\
	Event { "twenty two", "" },	Click { 0, nb_h, nb_r1 + 21 * nb_rsp, _window, _topLeft },	\
	Event { "twenty three", "" },	Click { 0, nb_h, nb_r1 + 22 * nb_rsp, _window, _topLeft },	\
	Event { "twenty four", "" },	Click { 0, nb_h, nb_r1 + 23 * nb_rsp, _window, _topLeft },	\
	Event { "twenty five", "" },	Click { 0, nb_h, nb_r1 + 24 * nb_rsp, _window, _topLeft },	\
	Event { "twenty six", "" },		Click { 0, nb_h, nb_r1 + 25 * nb_rsp, _window, _topLeft },	\
	Event { "twenty seven", "" },	Click { 0, nb_h, nb_r1 + 26 * nb_rsp, _window, _topLeft },	\
	Event { "twenty eight", "" },	Click { 0, nb_h, nb_r1 + 27 * nb_rsp, _window, _topLeft },	\
	Event { "twenty nine", "" },	Click { 0, nb_h, nb_r1 + 28 * nb_rsp, _window, _topLeft },	\
	Event { "thirty", "" },			Click { 0, nb_h, nb_r1 + 29 * nb_rsp, _window, _topLeft },	\
	Event { "thirty one", "" },		Click { 0, nb_h, nb_r1 + 30 * nb_rsp, _window, _topLeft },	\
	Event { "thirty two", "" },		Click { 0, nb_h, nb_r1 + 31 * nb_rsp, _window, _topLeft },	\
	Event { "thirty three", "" },	Click { 0, nb_h, nb_r1 + 32 * nb_rsp, _window, _topLeft },	\
	Event { "thirty four", "" },	Click { 0, nb_h, nb_r1 + 33 * nb_rsp, _window, _topLeft },	\
	Event { "thirty five", "" },	Click { 0, nb_h, nb_r1 + 34 * nb_rsp, _window, _topLeft },	\
	Event { "thirty six", "" },		Click { 0, nb_h, nb_r1 + 35 * nb_rsp, _window, _topLeft },	\
	Event { "thirty seven", "" },	Click { 0, nb_h, nb_r1 + 36 * nb_rsp, _window, _topLeft },	\
	Event { "thirty eight", "" },	Click { 0, nb_h, nb_r1 + 37 * nb_rsp, _window, _topLeft },	\
	Event { "thirty nine", "" },	Click { 0, nb_h, nb_r1 + 38 * nb_rsp, _window, _topLeft },	\
	Event { "forty", "" },			Click { 0, nb_h, nb_r1 + 39 * nb_rsp, _window, _topLeft },	\
	Event { "forty one", "" },		Click { 0, nb_h, nb_r1 + 40 * nb_rsp, _window, _topLeft },	\
	Event { "forty two", "" },		Click { 0, nb_h, nb_r1 + 41 * nb_rsp, _window, _topLeft },	\
	Event { "forty three", "" },	Click { 0, nb_h, nb_r1 + 42 * nb_rsp, _window, _topLeft },	\
	Event { "forty four", "" },		Click { 0, nb_h, nb_r1 + 43 * nb_rsp, _window, _topLeft },	\
	Event { "forty five", "" },		Click { 0, nb_h, nb_r1 + 44 * nb_rsp, _window, _topLeft },	\
	Event { "forty six", "" },		Click { 0, nb_h, nb_r1 + 45 * nb_rsp, _window, _topLeft },	\
	Event { "forty seven", "" },	Click { 0, nb_h, nb_r1 + 46 * nb_rsp, _window, _topLeft },	\
	Event { "forty eight", "" },	Click { 0, nb_h, nb_r1 + 47 * nb_rsp, _window, _topLeft },	\
	Event { "forty nine", "" },		Click { 0, nb_h, nb_r1 + 48 * nb_rsp, _window, _topLeft },	\
	Event { "fifty", "" },			Click { 0, nb_h, nb_r1 + 49 * nb_rsp, _window, _topLeft }

*/

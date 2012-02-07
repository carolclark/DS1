// =================================================================================
//	Xcode_C9.r					�2006-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

// xckbbug: Key Bindings do not currently work in Xcode (rdar:10029381)
//		'xckbbug' tags workarounds for this bug</li>

#define _pwindow		window, "1"

#pragma mark 0 === Top
#define splitter_x		255

/* resid_ */
#define resid_Browser				resid_Xcode+1
#define resid_TypeSpecialXcodeSlate	resid_Xcode+2
#define resid_TypeXcodeSlate		resid_Xcode+3
#define	resid_InsertElement			resid_Xcode+4
#define	resid_InsertStyle			resid_Xcode+5
#define	resid_InsertTag				resid_Xcode+6
#define	resid_InsertSlateText		resid_Xcode+7
#define resid_Workspace				resid_Xcode+8
#define resid_Find					resid_Xcode+9
#define resid_FindMultiple			resid_Xcode+10
	#define resid_SearchIn				resid_FindMultiple+1
#define resid_RunSlate				resid_Xcode+12
#define resid_Snapshots				resid_Xcode+13
#define resid_Package				resid_Xcode+14

#define resid_Debug					resid_Xcode+20
	#define resid_Threads				resid_Debug+1
	#define resid_Breakpoints			resid_Debug+2

#define resid_Panel					resid_Xcode+30
#define resid_JumpBar				resid_Xcode+35
	#define resid_jumpPopup				resid_JumpBar+1

#define resid_XCTerminal			resid_Xcode+40

#define resid_BBValidate			resid_Xcode+42
#define resid_BBContinueCheckAll		resid_BBValidate+1

#define resid_FileMenu				resid_Xcode+45
	#define resid_NewFile				resid_FileMenu+1
	#define resid_OpenFile				resid_FileMenu+2
	#define resid_AddFiles				resid_FileMenu+3
	#define resid_SourceControl			resid_FileMenu+4

#define resid_firstFileDialog		resid_Xcode+50
	#define resid_FileOpen				resid_firstFileDialog+0
	#define resid_FileSave				resid_firstFileDialog+1

#define resid_SelectTargets			resid_Xcode+60	

#define resid_EditMenu				resid_Xcode+70

#define resid_DesignMenu			resid_Xcode+90
	#define	resid_TypeDesign			resid_DesignMenu+1
	#define resid_DataModel				resid_DesignMenu+2

#define resid_Accessor				resid_Xcode+100
	#define resid_BuildAccessor			resid_Accessor+1

#define resid_Scripts				resid_Xcode+150
	#define	resid_bbeSelectMarker			resid_Scripts+1

#define resid_Editor				resid_Xcode+200
	#define resid_edStandard			resid_Editor+10
	#define resid_edAssistant			resid_Editor+20
	#define resid_edVersion				resid_Editor+30
	#define	resid_edProject				resid_Editor+40
		#define resid_projTargetList		resid_edProject+1
		#define resid_projAddTarget			resid_edProject+2
		#define resid_projAddPhase			resid_edProject+3
			#define resid_phaseRunScript		resid_edProject+10
	#define	resid_edLog					resid_Editor+60
	#define	resid_edIssues				resid_Editor+65
	#define	resid_edSearch				resid_Editor+70
		#define resid_edFindOptions			resid_edSearch+1

#define resid_Search				resid_Xcode+300
	#define resid_FindReplace			resid_Search+1
	#define resid_FindOptions			resid_Search+2

#define resid_Navigate				resid_Xcode+350
	#define resid_navFilter				resid_Navigate+1
	#define resid_SelectRow				resid_Navigate+2

#define resid_Utilities				resid_Xcode+370
	#define resid_utilFile				resid_Utilities+5
		#define resid_utilFileLocate		resid_utilFile+1

#define resid_Organizer				resid_Xcode+400
	#define resid_Repositories			resid_Organizer+10
		#define resid_AddRepository			resid_Repositories+1
		#define resid_Update				resid_Repositories+2
		#define resid_Commit				resid_Repositories+3
		#define resid_SwitchBranch			resid_Repositories+4

#define resid_Refactor				resid_Xcode+500
	#define resid_RefactorHelp			resid_Refactor+15

#define	resid_GHTest				resid_Xcode+550

#define resid_Doxygen				resid_Xcode+600
	#define resid_BrowseDoxygen			resid_Doxygen+1

#define resid_Macro					resid_Xcode+700

#define resid_Target				resid_Xcode+900
	#define resid_RunTarget				resid_Target+1
	#define	resid_TargetScheme			resid_Target+2

/* todo */
#define resid_Documentation				resid_Xcode+800
	#define resid_refDocset					resid_Documentation+1
	#define resid_refBookmarks				resid_Documentation+2
	#define resid_refSearch					resid_Documentation+10
		#define resid_refSearchResults			resid_refSearch+1

#define _scriptsMenu	Click { 1, -340, 13, _screen, _topRight }, Wait { 20 }, _down, TypeText { "Xcode" }, _right
#define closeDocument_	\
	Event { "close document", "" },	Keypress { kc_W, mf_command + mf_control },

#define	focus_			Event { "focus", "" },			Keypress { kc_period, mf_command + mf_option }
#define	focusBack_		Event { "focus back", "" },		Keypress { kc_period, mf_command + mf_option + mf_shift }

#define	_next			Keypress { kc_slash, mf_control }
#define	_previous		Keypress { kc_slash, mf_control + mf_shift }
/* xckbbug
#define	_selword		Keypress { kc_W, mf_option + mf_control }
#define _selline		Keypress { kc_M, mf_control }
#define _capitalize		Keypress { kc_up, mf_control + mf_shift }
#define _lowercase		Keypress { kc_down, mf_control + mf_shift }	*/
#define	_selword		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, endSequence{}
#define	_selline		Sequence{}, Keypress { kc_left, mf_command }, Keypress { kc_right, mf_command + mf_shift }, endSequence{}
#define	_capitalize		Sequence{}, ClickMenu { "Edit" }, TypeText { "Format" }, _right, TypeText { "Transformations" }, _right, TypeText { "capitalize" }, _return, endSequence{}
#define	_lowercase		Sequence{}, ClickMenu { "Edit" }, TypeText { "Format" }, _right, TypeText { "Transformations" }, _right, TypeText { "Make Lower Case" }, _return, endSequence{}

#define	_newTab			Keypress { kc_T, mf_command }
#define	_closeTab		Keypress { kc_W, mf_command }
#define	_goPanel		Keypress { kc_J, mf_command }
#define	_nextPanel		Keypress { kc_period, mf_command + mf_option }
#define	_previousPanel	Keypress { kc_period, mf_command + mf_option + mf_shift }
#define	_skipAhead		Keypress { kc_right, mf_command + mf_control }
#define	_skipBack		Keypress { kc_left, mf_command + mf_control }
#define	_counterpart	Keypress { kc_down, mf_command + mf_control }
#define	_nextIssue		Keypress { kc_quote, mf_command }
#define	_previousIssue	Keypress { kc_quote, mf_command + mf_shift }
#define _goNext			Keypress { kc_closebracket, mf_command + mf_shift }
#define _goPrevious		Keypress { kc_bracket, mf_command + mf_shift }

#define _clickFile	Click { 1, 126, 10, _screen, _topLeft }
#define _navList	Click { 1, 30, -30, _window, _bottomLeft }
#define _topRow		Click { 1, 130, 148, _window, _topLeft }
#define _bottomRow	Click { 1, 130, -30, _window, _bottomLeft }

#define goToReference_							\
		Event { "go to reference", "" },	Sequence{},					\
			Keypress { kc_slash, mf_command + mf_option + mf_control },	\
			ResSubslate { resid_Documentation },							\
			endSequence{}

#define	_showHideNavigator	Keypress { kc_0, mf_command }

#define _JumpBar_	\
	Event { "jump bar", "" },	ResSubslate { resid_JumpBar }

// clear bogus error from assertion failure
#define _assert	Sequence{}, _tab, Keypress { kc_space, 0 }, endSequence{}

#define jump_right_ Keypress { kc_right, mf_option }
#define	_XcodeStandards_	\
		Event { "main panel", "" },		Keypress { kc_J, mf_command },		\
		Event { "dismiss assert", "" },	_assert
	
#pragma mark 1 === TypeSpecial
#define _quote Keypress { kc_quote, mf_shift }
#define _uc1		Keypress { kc_tab, 0 }, TypeText { "<p><b>" }
#define _uc2		TypeText { ": </b><" }, Keypress { kc_3, mf_shift }
#define _uc3		Keypress { kc_3, mf_shift }, TypeText { "></p>" }, Keypress { kc_slash, mf_control + mf_shift }
resource restype_Slate (resid_TypeSpecialXcodeSlate, "Type Special Xcode Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "define", "" },			TypeText { "#define" },
		ExitEvent { "confidential", "" },	Sequence{}, TypeText { "//" }, Keypress { kc_tab, mf_option }, TypeText { "Confidential and Proprietary." }, _return, endSequence{},
		ExitEvent { "mark spot", "" },		TypeText { "<##>" },
		ExitEvent { "test actual", "" },	TypeText { "@\"actual: %@ (%@)\", <#arg#>, _WHERE_);" };
		ExitEvent { "resource id", "" },	TypeText { "resid_" },
		ExitEvent { "in use development", "" },	TypeText { "in-use development" },
		ExitEvent { "end event", "" },		Sequence{},
			_quote, TypeText { ", " }, _quote, _quote, Keypress { kc_space, 0 }, Keypress { kc_closebracket, mf_shift }, Keypress { kc_comma, 0 }, Keypress { kc_tab, mf_option }, endSequence{},
		ExitEvent { "web extension", "" },	TypeText { ".html" },
		ExitEvent { "korn extension", "" },	TypeText { ".ksh" },
		ExitEvent { "Xcode selection", "" }, TypeText { "%%%{PBXSelection}%%%" },
		ExitEvent { "empty", "" },			TypeText { "&lt;empty&gt;" },
		ExitEvent { "string", "" },			Sequence{}, TypeText { "@\"\"" }, Keypress { kc_left, 0 }, endSequence{},
		ExitEvent { "format", "" },			TypeText { "@\"%@\"" },
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

#define _TypeXcodeItems_	\
	Event { "complete", "" },	Keypress { kc_comma, mf_control },	\
	Event { "finish", "" },		Keypress { kc_comma, mf_control },	\
	Event { "add space", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_space, 0 }, endSequence{},	\
	Event { "add comma", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_comma, 0 }, endSequence{},	\
	Event { "list item", "" },	Sequence{}, TypeText { "<li><#item#></li>" }, _previous, endSequence{},	\
	_JumpBar_,		\
	closeDocument_,	\
	Event { "page top", "" },	Keypress { kc_home, 0 },	\
	Event { "page end", "" },	Keypress { kc_end, 0 },	\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	Event { "next field", "" },	Keypress { kc_slash, mf_control },	\
	Event { "previous field", "" },	Keypress { kc_slash, mf_control + mf_shift },	\
	Event { "goto line", "" },		Keypress { kc_L, mf_command },	\
	Event { "select word", "" },	_selword,		\
	Event { "select line", "" },	_selline,		\
	Event { "capitalize", "" },		_capitalize,	\
	Event { "lower case", "" },		_lowercase,		\
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
	Event { "up one", "" }, _up,	\
	Event { "up two", "" }, 	Sequence{}, _up, _up, endSequence{},	\
	Event { "up three", "" },	Sequence{}, _up, _up, _up, endSequence{},	\
	Event { "up four", "" }, 	Sequence{}, _up, _up, _up, _up, endSequence{},	\
	Event { "up five", "" }, 	Sequence{}, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up six", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up seven", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up eight", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up nine", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up ten", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up,_up, _up, _up, _up, endSequence{},	\
	Event { "up eleven", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up twelve", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
	Event { "up thirteen", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
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
		ExitEvent { "Accessor", "" },		TypeText { "AC" },
		ExitEvent { "Carbon 9", "" },		TypeText { "_C9" },
		ExitEvent { "Access Library", "" },	TypeText { "_AL" },
		ExitEvent { "Cocoa", "" },			TypeText { "NS" },
	} }
} };

#define _cutNextLine	Keypress { kc_right, mf_command }, Keypress { kc_right, 0 },	\
	Keypress { kc_right, mf_command + mf_shift }, Keypress { kc_X, mf_command }
#define _indent			Keypress { kc_closebracket, mf_command }
#define _indentBack		Keypress { kc_bracket, mf_command }
resource restype_Slate (resid_TypeXcodeSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Package", "" },		ResSubslate { resid_Package },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		_JumpBar_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "start line", "" },		Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_delete, 0 }, endSequence{},
		Event { "counterpart", "" },	_counterpart,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command + mf_option + mf_shift },
		Event { "cut next line", "" },	Sequence{}, _cutNextLine, endSequence{},
		Event { "exec line", "" },		Sequence{},
			Keypress { kc_right, mf_command },
			Keypress { kc_left, mf_command + mf_shift },
			Keypress { kc_R, mf_control },
			endSequence{},
		Event { "Insert Element", "" },		ResSubslate { resid_InsertElement },
		Event { "Element", "" },			ResSubslate { resid_InsertElement },
		Event { "Add Style", "" },			ResSubslate { resid_InsertStyle },
		Event { "Insert Tag", "" },			ResSubslate { resid_InsertTag },
		Event { "User", "" },				ResSubslate { resid_InsertSlateText },
		Event { "indent", "" },				_indent,
		Event { "indent back", "" },		_indentBack,
//		Event { "hide bubbles", "" },		Keypress { kc_H, mf_shift + mf_option + mf_command },
//		Event { "select exec", "click the Active Executable popup" }, Click { 1, 315, 40, _pwindow, _topLeft },
//		Event { "error icon", "click the error/warning icon" }, Click { 1, -32, -11, _pwindow, _bottomRight },
		Event { "mark cells", "" },	Subslate { "mark cells" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "bullet", "" },			Sequence{}, TypeText { "&bull;" }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "disabled", "" },		Sequence{}, TypeText { "<span class='gray'>&bull;</span>" }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "minus sign", "" },		Sequence{}, Keypress { kc_minus, 0 }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "not applicable", "" },	Sequence{}, TypeText { "n/a" }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "question", "" },		Sequence{}, Keypress { kc_slash, mf_shift }, Keypress { kc_slash, mf_control }, endSequence{},
			endSubslate{},
		Event { "show selection", "" },		Keypress { kc_L, mf_command + mf_shift },
		Event { "go to definition", "" },	Keypress { kc_J, mf_command + mf_option },
		goToReference_,
		Event { "save files", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialXcodeSlate },
		Event { "Doxygen", "" },			ResSubslate { resid_Doxygen },
		_TypeXcodeItems_
	} }
} };

#pragma mark InsertElement
resource restype_Slate (resid_InsertElement, "") { {
	Slate { "Element",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "unix", "" },				Subslate { "unix" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "shebang", "" },				Sequence{},
				TypeText { "#! /bin/ksh" }, _return, _return, endSequence{},
			ExitEvent { "quote variable", "" },				Sequence{},
				TypeText { "\"${<##>}\"<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "variable", "" },				Sequence{},
				TypeText { "${<##>}<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "command", "" },				Sequence{},
				TypeText { "\"$(<##>)\"<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "plain command", "" },				Sequence{},
				TypeText { "$(<##>)<##>" }, _previous, _previous, endSequence{},
			ExitEvent { "if block", "" },		Sequence{}, TypeText { "if [[ <##> ]] ; then" },
				_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },
				_previous, _previous, endSequence{},
			ExitEvent { "check status", "" },		Sequence{},
				TypeText { "if [[ \"${?}\" > 0 ]] ; then" },
				_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },
				_previous, _previous, endSequence{},
			ExitEvent { "where", "" },			TypeText { "$0#$LINENO: " },
			ExitEvent { "assert equal", "" },	TypeText { "assertEquals \"$LINENO: <#message#>\" <#expected#> <#actual#>" },
			ExitEvent { "assert not equal", "" },	TypeText { "assertNotEquals \"$LINENO: <#message#>\" <#unexpected#> <#actual#>" },
			ExitEvent { "assert null", "" },	TypeText { "assertNull \"$LINENO: <#message#>\" <#value#>" },
			ExitEvent { "assert not null", "" },	TypeText { "assertNotNull \"$LINENO: <#message#>\" <#value#>" },
			ExitEvent { "assert true", "" },	TypeText { "assertTrue \"$LINENO: <#message#>\" <#condition#>" },
			ExitEvent { "assert false", "" },	TypeText { "assertFalse \"$LINENO: <#message#>\" <#condition#>" },
			ExitEvent { "assert failure", "" },	TypeText { "fail \"$LINENO: <#message#>\"" },
			endSubslate{},
		ExitEvent { "assert true", "" },		Sequence{}, TypeText { "STAssertTrue" }, _next, endSequence{},
		ExitEvent { "assert not nil", "" },		Sequence{}, TypeText { "STAssertNotNil" }, _next, endSequence{},
		ExitEvent { "marker", "" },					Sequence{}, TypeText { "<!-- @marker \"p\" -->" }, _return, _up, _next, endSequence{},
		ExitEvent { "topic item", "" },				Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"<#linkDestination#>\" \"<#indent0-3#>\" \"<#[description]#>\" -->" }, _up, _next, endSequence{},
		ExitEvent { "topic Group", "" },	Sequence{},
			TypeText { "<!-- @topicGroup \"<#title#>\" \"<#linenum#>\" -->" }, _previous, _previous, endSequence{},
		ExitEvent { "topic Separator", "" },	TypeText { "<!-- @topicSep -->" },
		ExitEvent { "goal", "" },		Sequence{}, TypeText { "<tr> <td><#Project#></td> <td><#goal#></td> <td class='small'><#comments#></td> <td align=\"center\"><#priority#></td> </tr>" }, _previous,  _previous, _previous, _previous, endSequence{},
		ExitEvent { "heading with name", "" },		Sequence{},
			TypeText { "<#=== -> topicList [1]#>" }, _indentBack, _return,
			TypeText { "<!-- @topicItem \"<#title#>\" \"#<#name#>\" \"0\" \"\" -->" }, _return,
			TypeText { "<!-- @marker \"<#title#>\" -->" }, _indentBack, _return,
			TypeText { "<h<#level#> id='<#name#>'><#title#></h<#level#>><##>" }, _indentBack, _return, _indentBack, _next, endSequence{},
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
		ExitEvent { "date mark", "" },		Sequence{},
			TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previous, endSequence{},
		ExitEvent { "date list", "" },		Sequence{},
			TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previous, endSequence{},
		ExitEvent { "date paragraph", "" },		Sequence{},
			TypeText { "<p class='tldate'>[<#date#>]</p>" }, _previous, endSequence{},
		ExitEvent { "pragma", "" }, TypeText { "#pragma mark " },
		ExitEvent { "unix selection", "" }, TypeText { "%%%{PBXSelection}%%%" },
		ExitEvent { "ampersand", "" }, TypeText { "&amp;" },
		ExitEvent { "less than", "" }, TypeText { "&lt;" },
		ExitEvent { "greater than", "" }, TypeText { "&gt;" },
		ExitEvent { "angle brackets", "" },	Sequence{}, TypeText { "&lt;&gt;<##> " }, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "hard space", "" }, TypeText { "&nbsp;" },
		ExitEvent { "arrow left", "" }, TypeText { "&larr;" },
		ExitEvent { "arrow right", "" }, TypeText { "&rarr;" },
		ExitEvent { "arrow up", "" }, TypeText { "&uarr;" },
		ExitEvent { "arrow down", "" }, TypeText { "&darr;" },
		ExitEvent { "check mark", "" }, TypeText { "&radic;" },
		ExitEvent { "bullet", "" }, TypeText { "&bull;" },
		ExitEvent { "diamond", "" }, TypeText { "&loz;" }
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

resource restype_Slate (resid_InsertSlateText, "Slate text") { {
	Slate { "UserSlate",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "exit event", "" },			TypeText { "ExitEvent { \"" },
		ExitEvent { "event", "" },				TypeText { "Event { \"" },
		ExitEvent { "plain event", "" },		TypeText { "Event { \"" },
		ExitEvent { "end event", "" },			Sequence{}, TypeText { "\", \"\" }," }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},
		ExitEvent { "sequence", "" },			Sequence{}, TypeText { "Sequence{}, <##> endSequence{}," }, _previous, endSequence{},
		ExitEvent { "subslate", "" },			Sequence{}, TypeText { "Subslate { \"<##>\" }," }, _return, _tab, _tab, _tab, TypeText { "<##>" }, _return, _tab, _tab, _tab, TypeText { "endSubslate{}," }, _previous, endSequence{},
		ExitEvent { "type text", "" },			Sequence{}, TypeText { "TypeText { \"<##>\" }," }, _previous, endSequence{},
		ExitEvent { "resource subslate", "" },	Sequence{}, TypeText { "ResSubslate { resid_<##> }, " }, _previous, endSequence{},
		ExitEvent { "keypress", "" },			Sequence{}, TypeText { "Keypress { kc_<##>, <##> }," }, _previous, _previous, endSequence{},
			ExitEvent { "key return", "" },			TypeText { "return" },
			ExitEvent { "key space", "" },			TypeText { "space" },
			ExitEvent { "key enter", "" },			TypeText { "enter" },
			ExitEvent { "key delete", "" },			TypeText { "delete" },
			ExitEvent { "key tab", "" },			TypeText { "tab" },
			ExitEvent { "key escape", "" },			TypeText { "escape" },
			ExitEvent { "key left", "" },			TypeText { "left" },
			ExitEvent { "key right", "" },			TypeText { "right" },
			ExitEvent { "key up", "" },				TypeText { "up" },
			ExitEvent { "key down", "" },			TypeText { "down" },
			ExitEvent { "key comma", "" },			TypeText { "comma" },
			ExitEvent { "key period", "" },			TypeText { "period" },
			ExitEvent { "modify command", "" },		TypeText { "mf_command" },
			ExitEvent { "modify shift", "" },		TypeText { "mf_shift" },
			ExitEvent { "modify capslock", "" },	TypeText { "mf_capslock" },
			ExitEvent { "modify option", "" },		TypeText { "mf_option" },
			ExitEvent { "modify control", "" },		TypeText { "mf_control" },
		ExitEvent { "click", "" },				Sequence{}, TypeText { "Click { <#count#>, <#h#>, <#v#>, <#position#> }," }, _previous, _previous, _previous, _previous, endSequence{},
			Event { "window", "" },					Sequence{}, TypeText { "_window, <#corner#>" }, _previous, endSequence{},
			Event { "screen", "" },					Sequence{}, TypeText { "_screen, <#corner#>" }, _previous, endSequence{},
			ExitEvent { "cursor", "" },				TypeText { "_cursor" },
			ExitEvent { "top left", "" },			TypeText { "_topLeft" },
			ExitEvent { "top right", "" },			TypeText { "_topRight" },
			ExitEvent { "bottom right", "" },		TypeText { "_bottomRight" },
			ExitEvent { "bottom left", "" },		TypeText { "_bottomLeft" },
		ExitEvent { "slate", "" },				Sequence{}, 
			TypeText { "#define resid_<##>" }, Keypress { kc_tab, mf_option }, TypeText { "resid_<#relative_resid#>+<##>" }, _return,
			TypeText { "#pragma mark <##>" }, _return,
			TypeText { "resource restype_Slate (resid_<##>, \"\") { {" }, _return,
			TypeText { "Slate { \"<##>\"," }, Keypress { kc_tab, mf_option }, TypeText { "{" }, _return,
			TypeText { "_SlateGlobals_," }, _return,
			TypeText { "_CloseSubslate_," }, _return,
			TypeText { "} }" }, _return,
			TypeText { "} };" }, _return,
			_previous, _previous, _previous, _previous, _previous, _previous,
			endSequence{},
		Event { "macro", "" },					Subslate { "macro" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "define", "" },				Sequence{}, TypeText { "#define" }, _tab, endSequence{},
			ExitEvent { "mark", "" },				Sequence{}, TypeText { "#pragma mark <##>" }, _return, _previous, endSequence{},
			ExitEvent { "mark spot", "" },			TypeText { "<##>, " },
			ExitEvent { "return", "" },				TypeText { "_return, " },
			ExitEvent { "tab", "" },				TypeText { "_tab, " },
			ExitEvent { "next", "" },				TypeText { "_next, " },
			ExitEvent { "previous", "" },			TypeText { "_previous, " },
			ExitEvent { "up", "" },					TypeText { "_up, " },
			ExitEvent { "down", "" },				TypeText { "_down, " },
			ExitEvent { "left", "" },				TypeText { "_left, " },
			ExitEvent { "right", "" },				TypeText { "_right, " },
			ExitEvent { "Slate Globals", "" },			TypeText { "_SlateGlobals_," },
			ExitEvent { "Close Subslate", "" },			TypeText { "_CloseSubslate_," },
			ExitEvent { "Jump Down Subslate", "" },		TypeText { "_JumpDownSubslate_," },
			ExitEvent { "Jump North Subslate", "" },	TypeText { "_JumpNorthSubslate_," },
			ExitEvent { "Do Jump Subslate", "" },		TypeText { "_DoJumpSubslate_," },
			ExitEvent { "Direction Keys", "" },			TypeText { "_DirectionKeys_," },
			ExitEvent { "Letter Keys", "" },			TypeText { "_LetterKeys_," },
			ExitEvent { "Number Keys", "" },			TypeText { "_NumberKeys_," },
			ExitEvent { "Whitespace Keys", "" },		TypeText { "_WhitespaceKeys_," },
			endSubslate{},
	} }
} };

#define _TypeXcodeSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeXcodeSlate }

#pragma mark Popups
#define _PopupStandards_	\
		_SlateGlobals_,		\
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },								\
		ExitEvent { "return", "" },		Keypress { kc_return, 0 },								\
		ExitEvent { "cancel", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, endSequence{},																		\
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, endSequence{},																		\
		ExitEvent { "exit", "" },		CloseSubslate{},										\
		Event { "page top", "" },		Keypress { kc_home, 0 },								\
		Event { "page end", "" },		Keypress { kc_end, 0 },									\
		Event { "page north", "" },		Keypress { kc_pageup, 0 },								\
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },							\
		_JumpDownSubslate_,								\
		_JumpNorthSubslate_,							\
		_DoJumpSubslate_,								\
		_DirectionKeys_,								\
		_LetterKeys_,									\
		_NumberKeys_

#pragma mark Workspace
resource restype_Slate (resid_Workspace, "") { {
	Slate { "Workspace",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Carbon", "" },			Launch { Dev_"AccessorC9/AccessorC9.xcworkspace", 0 },
		ExitEvent { "Accessor", "" },		Launch { Dev_"Accessor/Accessor.xcworkspace", 0 },
		ExitEvent { "Punkin", "" },			Launch { Dev_"Punkin/Punkin.xcworkspace", 0 },
		ExitEvent { "Support", "" },		Launch { Dev_"Support/Support.xcworkspace", 0 },
		ExitEvent { "Technical", "" },		Launch { Dev_"TechnicalDocs/TechnicalDocs.xcworkspace", 0 },
		ExitEvent { "old Support", "" },	Launch { Dev_"Support_svn/Support_svn.xcworkspace", 0 },
		ExitEvent { "Dev Support", "" },	Launch { Dev_"DevSupport/DevSupport.xcodeproj", 0 },
	} }
} };

#pragma mark 2 === Accessor
resource restype_Slate (resid_Accessor, "") { {
	Slate { "Accessor",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "analyze", "" },		Keypress { kc_B, mf_command + mf_shift },
		Event { "build", "" },			Sequence{}, Keypress { kc_B, mf_command }, ResSubslate { resid_BuildAccessor }, endSequence{},
	} }
} };

resource restype_Slate (resid_BuildAccessor, "") { {
	Slate { "Accessor",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "cancel", "" },		NilAction{},
		Event { "run original", "" },	Launch { HomeApps_"Accessor_C9.app", 0 },
		Event { "quit", "" },			Keypress { kc_Q, mf_command },
	} }
} };

#pragma mark RunSlate
resource restype_Slate (resid_RunSlate, "run test application with its own slate") { {
	Slate { "run slate",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close window", "" },	Keypress { kc_W, mf_command },
		ExitEvent { "quit testing", "" },	Keypress { kc_Q, mf_command },
		Event { "Testing", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_GHTest }, endSequence{},
		Event { "Prototype", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_ArbProto }, endSequence{},
		Event { "Automator", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_Automator }, endSequence{},
	} }
} };

#pragma mark Test
resource restype_Slate (resid_GHTest, "") { {
	Slate { "GHTest",	{
		_SlateGlobals_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_IMouseSlate_,
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "quit back", "" },	Sequence{}, Keypress { kc_Q, mf_command }, Launch { "/Developer/Applications/XCode.app", 0 }, endSequence{},
		Event { "run", "" },			Keypress { kc_R, mf_command },
		Event { "test list", "" },		Click { 1, -60, 65, _window, _topCenter },
		Event { "filter", "" },			Click { 1, 50, -110, _window, _bottomLeft },
		Event { "select tests", "" },	Sequence{}, Click { 1, 50, -110, _window, _bottomLeft }, _tab, endSequence{},
		Event { "select log", "" },		Sequence{}, Click { 1, -45, 0, _window, _centerRight }, _tab, endSequence{},
		Event { "wrap text", "" },		Click { 1, -40, 50, _window, _topRight },
		Event { "link file", "" },		Click { 1, 110, 50, _window, _topCenter },
		Event { "Activities", "" },		Launch { Apps_"Utilities/Activity Monitor.app", 0 },
		Event { "Shell Window", "" },	Launch { MainApps_"BBEdit.app", 0 },
		Event { "Xcode", "" },			Launch { "/Developer/Applications/XCode.app", 0 },
		Event { "Testing", "" },		Click { 1, 570, -170, _screen, _bottomLeft },
		_TypeXcodeSlate_,
	} }
} };

#pragma mark Debug
resource restype_Slate (resid_Debug, "") { {
	Slate { "Debug",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "next workspace", "" }, 	Keypress { kc_accent, mf_command },
		Event { "panel", "" },				Keypress { kc_Y, mf_command + mf_shift },
		Event { "over", "" },				Keypress { kc_fn6, 0 },
		Event { "in", "" },					Keypress { kc_fn7, 0 },
		Event { "finish", "step out" },		Keypress { kc_fn8, 0 },
		Event { "pause", "" },				Keypress { kc_Y, mf_command + mf_control },
		Event { "continue", "" },			Keypress { kc_Y, mf_command + mf_control },
		Event { "terminate", "" },			Keypress { kc_period, mf_command },
		Event { "threads", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_Threads },endSequence{},
		Event { "breakpoints", "" },		Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_Breakpoints }, endSequence{},
		Event { "nav list", "" },			_navList,
		_EndKey_,
		Event { "top row", "" },			_topRow,
		Event { "bottom row", "" },			_bottomRow,
		Event { "select row", "" },			ResSubslate { resid_SelectRow },
		_WhitespaceKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DirectionKeys_,
		_TypeXcodeSlate_,
		_CommandSlate_,
	} }
} };

#pragma mark Threads
resource restype_Slate (resid_Threads, "") { {
	Slate { "threads",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "select row", "" },			ResSubslate { resid_SelectRow },
		Event { "nav list", "" },			_navList,
		_EndKey_,
		Event { "top row", "" },			_topRow,
		Event { "bottom row", "" },			_bottomRow,
		_DirectionKeys_,
		_WhitespaceKeys_,
	} }
} };

#pragma mark Breakpoints
resource restype_Slate (resid_Breakpoints, "") { {
	Slate { "bkpt",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "add", "" },				Keypress { kc_backslash, mf_command },
		Event { "activate", "" },			Keypress { kc_Y, mf_command },
		Event { "nav list", "" },			_navList,
		_EndKey_,
		Event { "top row", "" },			_topRow,
		Event { "bottom row", "" },			_bottomRow,
	} }
} };


#pragma mark 3 === Find
resource restype_Slate (resid_Find, "Find") { {
	Slate { "Find", {
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeXcodeSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
		Event { "click one", "" },			Click { 1, 0, 0, _cursor },
		Event { "find string", "" },		Click { 1, 250, 43, _pwindow, _topLeft },
		Event { "replace string", "" },		Click { 1, 250, 73, _pwindow, _topLeft },
		Event { "select find", "" },		Click { 1, -162, 43, _pwindow, _topRight },
		Event { "select replace", "" },		Click { 1, -162, 73, _pwindow, _topRight },
		Event { "replace all scope", "" },	Click { 1, 115, 148, _pwindow, _topLeft },
		Event { "ignore case", "" },		Click { 1, 245, 127, _pwindow, _topLeft },
		Event { "wrap around", "" },		Click { 1, 245, 148, _pwindow, _topLeft },
		Event { "textual", "" },			Click { 1, 407, 127, _pwindow, _topLeft },
		Event { "contains", "" },			Click { 1, 407, 148, _pwindow, _topLeft },
		Event { "replace all", "" },		Click { 0, -65, -30, _pwindow, _bottomRight },
	} }
} };

/* todo */
#pragma mark FindMultiple
resource restype_Slate (resid_FindMultiple, "Find Multiple") { {
	Slate { "Multiple", {
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeXcodeSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "find string", "" },		Click { 1, 250, 43, _pwindow, _topLeft },
		Event { "replace string", "" },		Click { 1, 250, 73, _pwindow, _topLeft },
		Event { "select find", "" },		Click { 1, -327, 43, _pwindow, _topRight },
		Event { "select replace", "" },		Click { 1, -327, 73, _pwindow, _topRight },
		Event { "search scope", "" },		Click { 1, -257, 43, _pwindow, _topRight },
		Event { "textual", "" },			Click { 1, -257, 70, _pwindow, _topRight },
		Event { "contains", "" },			Click { 1, -257, 97, _pwindow, _topRight },
		Event { "ignore case", "" },		Click { 1, -166, 100, _pwindow, _topRight },
		Event { "smart group", "" },		Click { 1, 32, 100, _pwindow, _topLeft },
		Event { "find", "" },				Click { 1, -46, 45, _pwindow, _topRight },
		Event { "list", "" },				Click { 1, 0, 125, _pwindow, _topCenter },
		Event { "search in", "" },			Sequence{},
			Click { 1, -215, 43, _pwindow, _topRight }, ResSubslate { resid_SearchIn },
			endSequence{},
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
	} }
} };

resource restype_Slate (resid_SearchIn, "search in") { {
	Slate { "search in", {
		_SlateGlobals_,
		_CloseSubslate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		ExitEvent { "cancel", "" },					Keypress { kc_escape, 0 },
		ExitEvent { "All Open Files", "" },			Sequence{}, TypeText { "In All Open Files" }, _return, endSequence{},
		ExitEvent { "All Open Projects", "" },		Sequence{}, TypeText { "In All Open Projects" }, _return, endSequence{},
		ExitEvent { "Project", "" },				Sequence{}, TypeText { "In Project" }, _return, endSequence{},
		ExitEvent { "Frameworks", "" },				Sequence{}, TypeText { "In Frameworks" }, _return, endSequence{},
		ExitEvent { "Projects and Frameworks", "" },Sequence{}, TypeText { "In Projects and Frameworks" }, _return, endSequence{},
		ExitEvent { "Selected Project Items", "" },	Sequence{}, TypeText { "In Selected Project Items" }, _return, endSequence{},
	} }
} };

/* todo */
#pragma mark Snapshots
#define _trow	120
#define	_rsp	18
#define	_rowx	520
resource restype_Slate (resid_Snapshots, "Snapshots") { {
	Slate { "Snapshots", {
		_SlateGlobals_,
		_DirectionKeys_,
		_CommandSlate_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		Event { "click one", "" },		IMouse { im_Click, 1 },
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "okay", "" },		NilAction{},
		Event { "make snapshot", "" },	Keypress { kc_S, mf_command + mf_control },
		Event { "edit name", "" },		Click { 1, 120, -145, _window, _bottomLeft },
		Event { "show files", "" },		Click { 1, 175, 45, _window, _topLeft },
		Event { "difference", "" },		Click { 1, 170, -25, _window, _bottomCenter },
		Event { "list", "" },			Click { 1, 10, -200, _window, _bottomLeft },
		Event { "filename", "" },		Click { 0, 400, 85, _window, _topLeft },
		Event { "path", "" },			Click { 0, -30, 85, _window, _topRight },
		Event { "next panel", "" },		Keypress { kc_tab, mf_control },
		Event { "tab", "" },			Keypress { kc_tab, 0 },
		Event { "next row", "" },		Click { 0, 0, 18, _cursor },
		Event { "previous row", "" },	Click { 0, 0, -18, _cursor },
		Event { "row one", "" },		Click { 0, _rowx, _trow+0*_rsp, _window, _topLeft },
		Event { "row two", "" },		Click { 0, _rowx, _trow+1*_rsp, _window, _topLeft },
		Event { "row three ", "" },		Click { 0, _rowx, _trow+2*_rsp, _window, _topLeft },
		Event { "row four", "" },		Click { 0, _rowx, _trow+3*_rsp, _window, _topLeft },
		Event { "row five", "" },		Click { 0, _rowx, _trow+4*_rsp, _window, _topLeft },
		Event { "row six", "" },		Click { 0, _rowx, _trow+5*_rsp, _window, _topLeft },
		Event { "row seven", "" },		Click { 0, _rowx, _trow+6*_rsp, _window, _topLeft },
		Event { "row eight", "" },		Click { 0, _rowx, _trow+7*_rsp, _window, _topLeft },
		Event { "row nine", "" },		Click { 0, _rowx, _trow+8*_rsp, _window, _topLeft },
		Event { "row ten", "" },		Click { 0, _rowx, _trow+9*_rsp, _window, _topLeft },
		Event { "row eleven", "" },		Click { 0, _rowx, _trow+10*_rsp, _window, _topLeft },
		Event { "row twelve", "" },		Click { 0, _rowx, _trow+11*_rsp, _window, _topLeft },
		Event { "row thirteen", "" },	Click { 0, _rowx, _trow+12*_rsp, _window, _topLeft },
		Event { "row fourteen", "" },	Click { 0, _rowx, _trow+13*_rsp, _window, _topLeft },
		Event { "row fifteen", "" },	Click { 0, _rowx, _trow+14*_rsp, _window, _topLeft },
		Event { "row sixteen", "" },	Click { 0, _rowx, _trow+15*_rsp, _window, _topLeft },
		Event { "row seventeen", "" },	Click { 0, _rowx, _trow+16*_rsp, _window, _topLeft },
		Event { "row eighteen", "" },	Click { 0, _rowx, _trow+17*_rsp, _window, _topLeft },
		Event { "row nineteen", "" },	Click { 0, _rowx, _trow+18*_rsp, _window, _topLeft },
		Event { "row twenty", "" },		Click { 0, _rowx, _trow+19*_rsp, _window, _topLeft },
		Event { "row twenty one", "" },		Click { 0, _rowx, _trow+20*_rsp, _window, _topLeft },
		Event { "row twenty two", "" },		Click { 0, _rowx, _trow+21*_rsp, _window, _topLeft },
		Event { "row twenty three", "" },	Click { 0, _rowx, _trow+22*_rsp, _window, _topLeft },
		Event { "row twenty four", "" },	Click { 0, _rowx, _trow+23*_rsp, _window, _topLeft },
		Event { "row twenty five", "" },	Click { 0, _rowx, _trow+24*_rsp, _window, _topLeft },
	} }
} };

#pragma mark Terminal
resource restype_Slate (resid_XCTerminal, "terminal support") { {
	Slate { "Terminal",	{
		_SlateGlobals_,
		_TerminalItems_,
		ExitEvent { "quit", "" },	Keypress { kc_Q, mf_command },
		Event { "okay", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
	} }
} };

#pragma mark Validate
#define _BBClickScriptsMenu	Click { 1, 628, 11, _screen, _topLeft }
resource restype_Slate (resid_BBValidate, "html validation support") { {
	Slate { "ValidateHTML",	{
		_SlateGlobals_,
		ExitEvent { "close", "" },	Sequence{}, Keypress { kc_W, mf_command }, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		ExitEvent { "exit", "" },	NilAction{},
		ExitEvent { "quit", "" },	Keypress { kc_Q, mf_command },
		Event { "okay", "" },		Sequence{}, _return, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		_CommandSlate_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "technical", "" },	 Sequence{}, _BBClickScriptsMenu, _down, TypeText { "ValidateHTML" }, _right, TypeText { "CheckSyntaxAll" }, _return, ResSubslate { resid_BBContinueCheckAll }, endSequence{},
	} }
} };

resource restype_Slate (resid_BBContinueCheckAll, "resid_BBContinueCheckAll") { {
	Slate { "Continue",	{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		NilAction{},
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "continue", "" },	Sequence{}, _return, _BBClickScriptsMenu, _down, TypeText { "ValidateHTML" }, _right, TypeText { "CheckLinksAll" }, _return, endSequence{},
	} }
} };

#pragma mark 4 === Standard Menus
#pragma mark File Menu
#define	_clickFilename			Click { 1, fname_h, fname_v, _window, _topCenter }
#define	_clickFilter			Click { 1, flt_h, flt_v, _window, _topCenter }

#define _FileDialogStandards_	\
	_SlateGlobals_,				\
	ExitEvent { "exit", "" },		NilAction{},                                            	\
	ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },                     	\
	ExitEvent { "okay", "" },		_return,                                                	\
	Event { "go to folder", "" },	Sequence{}, Keypress { kc_G, mf_command }, ResSubslate { resid_GoToFolder }, endSequence{},		\
	Event { "history", "" },		Sequence{}, _clickFilter, _tabBack, _tabBack, _tabBack, endSequence{},		\
	Event { "view", "" },			Sequence{}, _clickFilter, _tabBack, _tabBack, endSequence{},	\
	Event { "location", "" },		Sequence{}, _clickFilter, _tabBack, endSequence{},	    	\
	Event { "filter", "" },			_clickFilter,												\
	Event { "devices", "" },		Sequence{}, _clickFilter, _tab, endSequence{},		\
	Event { "navigate", "" },		Sequence{}, _clickFilter, _tab, _tab, endSequence{},		\
	_DoJumpSubslate_,																			\
	_JumpNorthSubslate_,                                                                   		\
	_JumpDownSubslate_,                                                                    		\
	_DirectionKeys_,                                                               				\
	_WhitespaceKeys_,                                                                      		\
	_CommandSlate_,                                                                        		\
	_LetterKeys_,                                                                          		\
	_IMouseSlate_,																				\
	_TypeXcodeSlate_

#define _FileOpenStandards_	\
	Event { "destination", "" },	Sequence{}, _clickFilter, _tab, _tab, _tab, endSequence{},	\
	Event { "folders", "" },		Sequence{}, _clickFilter, _tab, _tab, _tab,  _tab, endSequence{},	\
	_DoSelectSubslate_,																			\
	_FileDialogStandards_

#define _FileSaveStandards_		\
	Event { "filename", "" },			_clickFilename,		\
	Event { "new folder", "" },			Sequence{}, _clickFilter, _tab, _tab, _tab, _tab, _tab, endSequence{},		\
	Event { "group", "" },				Sequence{}, _clickFilter, _tab, _tab, _tab, endSequence{},	\
	Event { "template groups", "" },	Click { 1, -270, 530, _window, _topCenter },				\
	Event { "target 1", "" },			Click { 1, tg_h, tg_t+0*tg_s, _window, _topCenter },		\
	Event { "target 2", "" },			Click { 1, tg_h, tg_t+1*tg_s, _window, _topCenter },		\
	Event { "target 3", "" },			Click { 1, tg_h, tg_t+2*tg_s, _window, _topCenter },		\
	Event { "target 4", "" },			Click { 1, tg_h, tg_t+3*tg_s, _window, _topCenter },		\
	Event { "target 5", "" },			Click { 1, tg_h, tg_t+4*tg_s, _window, _topCenter },		\
	_FileDialogStandards_

resource restype_Slate (resid_FileMenu, "File") { {
	Slate { "File", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },				Keypress { kc_escape, 0 },
		Event { "New File", "" },				Sequence{},
			Keypress { kc_N, mf_command }, ResSubslate { resid_NewFile }, endSequence{},
        Event { "New Project", "" },			Sequence{},
			Keypress { kc_N, mf_command + mf_shift }, ResSubslate { resid_NewFile }, endSequence{},
        Event { "New Workspace", "" },			Sequence{},
			Keypress { kc_N, mf_command + mf_control }, ResSubslate { resid_NewFile }, endSequence{},
		Event { "Open File", "" },				Sequence{},
			Keypress { kc_O, mf_command }, ResSubslate { resid_OpenFile }, endSequence{},
		ExitEvent { "new group", "" },			Keypress { kc_N, mf_command + mf_option },
		ExitEvent { "new tab", "" },			_newTab,
		ExitEvent { "close window", "" },		Keypress { kc_W, mf_command + mf_shift },
		ExitEvent { "close tab", "" },			_closeTab,
		ExitEvent { "close document", "" },		Keypress { kc_W, mf_command + mf_control },
		ExitEvent { "close workspace", "" },	Keypress { kc_W, mf_command + mf_option },
		ExitEvent { "Save All", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "Save As", "" },				Sequence{}, Keypress { kc_S, mf_command + mf_shift }, ResSubslate { resid_FileSave }, endSequence{},
		ExitEvent { "Open External", "" },		Sequence{}, TypeText { "Open with External Editor" }, _return, endSequence{},
		Event { "BBEdit", "" },					Sequence{}, TypeText { "Open with External Editor" }, _return, Launch { MainApps_"BBEdit.app", 0 }, ResSubslate { resid_BBEdit_External }, endSequence{},
		Event { "AppleScript", "" },				Sequence{}, TypeText { "Open with External Editor" }, _return, Launch { Apps_"Utilities/AppleScript Editor.app", resid_ScriptEditor }, endSequence{},
		Event { "add files", "" },				Sequence{}, Keypress { kc_A, mf_command + mf_option }, ResSubslate { resid_AddFiles }, endSequence{},
		Event { "Source Control", "'Source Control' menu" }, Sequence{},
			TypeText { "Source Control" }, _right, ResSubslate { resid_SourceControl }, endSequence{},
	} }
} };

#define	fname_h	0		// filename field, from _window _topCenter
#define	fname_v	130
#define	flt_h	200		// filter field, from _window _topCenter
#define	flt_v	176
#define tg_h	10		// target rows, from _window _topCenter
#define	tg_t	386
#define	tg_s	19
resource restype_Slate (resid_NewFile, "New File") { {
	Slate { "New File", {
		_FileSaveStandards_,
	} }
} };

#define	flt_h	350		// filter field, from _window _topCenter
#define	flt_v	40
resource restype_Slate (resid_OpenFile, "Open File") { {
	Slate { "Open File", {
		_FileOpenStandards_,
	} }
} };

#define	flt_h	350		// filter field, from _window _topCenter
#define	flt_v	120
resource restype_Slate (resid_AddFiles, "Add Files") { {
	Slate { "Add Files", {
		Event { "targets", "" },	ResSubslate { resid_SelectTargets },
		_FileOpenStandards_,
	} }
} };

#pragma mark SourceControl
resource restype_Slate (resid_SourceControl, "Source Control") { {
	Slate { "scm", {
		_SlateGlobals_,
		ExitEvent { "select", "" },	_return,
		ExitEvent { "okay", "" },	NilAction{},
		ExitEvent { "cancel", "" },	Keypress { kc_escape, 0 },
		Event { "commit", "" },		Sequence{}, TypeText { "Commit" }, _return, ResSubslate { resid_Commit }, endSequence{},
		Event { "merge", "" },		TypeText { "Merge" },
		Event { "push", "" },		TypeText { "Push" },
		Event { "repositories", "" }, Sequence{}, TypeText { "Repositories" }, _return, ResSubslate { resid_Repositories }, endSequence{},
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

#define _headerHt	0
resource restype_Slate (resid_FileOpen, "Open File Dialog") { {
	Slate { "Open", {
		_FileOpenStandards_,
	} }
} };

#define _headerHt	60
resource restype_Slate (resid_FileSave, "Save File Dialog") { {
	Slate { "Save", {
		_FileSaveStandards_,
	} }
} };

#define _offset		-121
#define	_trow		454
#define _rsp		18
resource restype_Slate (resid_SelectTargets, "Select Targets") { {
	Slate { "Select Targets", {
		_SlateGlobals_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "target list", "" },	Click { 1, 138, 488, _pwindow, _topCenter },
		Event { "row one", "" },		Click { 1, _offset, _trow+0*_rsp, _pwindow, _topCenter },
		Event { "row two", "" },		Click { 1, _offset, _trow+1*_rsp, _pwindow, _topCenter },
		Event { "row three", "" },		Click { 1, _offset, _trow+2*_rsp, _pwindow, _topCenter },
		Event { "row four", "" },		Click { 1, _offset, _trow+3*_rsp, _pwindow, _topCenter },
		Event { "row five", "" },		Click { 1, _offset, _trow+4*_rsp, _pwindow, _topCenter },
		_IMouseSlate_,
		_TypeXcodeItems_,
	} }
} };

#pragma mark Edit Menu
resource restype_Slate (resid_EditMenu, "Edit") { {
	Slate { "Edit", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "copy", "" },		Keypress { kc_C, mf_command },
		ExitEvent { "paste", "" },		Keypress { kc_V, mf_command + mf_option + mf_shift },
	} }
} };

#pragma mark 5 === Navigate
// Navigation Panel
#define	nb_h	120
#define	nb_r1	140
#define	nb_rsp	16
#define	_NavPanelRows_	\
	Event { "one", "" },	Click { 0, nb_h, nb_r1 + 0 * nb_rsp, _pwindow, _topLeft },	\
	Event { "two", "" },	Click { 0, nb_h, nb_r1 + 1 * nb_rsp, _pwindow, _topLeft },	\
	Event { "three", "" },	Click { 0, nb_h, nb_r1 + 2 * nb_rsp, _pwindow, _topLeft },	\
	Event { "four", "" },	Click { 0, nb_h, nb_r1 + 3 * nb_rsp, _pwindow, _topLeft },	\
	Event { "five", "" },	Click { 0, nb_h, nb_r1 + 4 * nb_rsp, _pwindow, _topLeft },	\
	Event { "six", "" },	Click { 0, nb_h, nb_r1 + 5 * nb_rsp, _pwindow, _topLeft },	\
	Event { "seven", "" },	Click { 0, nb_h, nb_r1 + 6 * nb_rsp, _pwindow, _topLeft },	\
	Event { "eight", "" },	Click { 0, nb_h, nb_r1 + 7 * nb_rsp, _pwindow, _topLeft },	\
	Event { "nine", "" },	Click { 0, nb_h, nb_r1 + 8 * nb_rsp, _pwindow, _topLeft },	\
	Event { "ten", "" },	Click { 0, nb_h, nb_r1 + 9 * nb_rsp, _pwindow, _topLeft },	\
	Event { "eleven", "" },	Click { 0, nb_h, nb_r1 + 10 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twelve", "" },	Click { 0, nb_h, nb_r1 + 11 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirteen", "" },	Click { 0, nb_h, nb_r1 + 12 * nb_rsp, _pwindow, _topLeft },	\
	Event { "fourteen", "" },	Click { 0, nb_h, nb_r1 + 13 * nb_rsp, _pwindow, _topLeft },	\
	Event { "fifteen", "" },	Click { 0, nb_h, nb_r1 + 14 * nb_rsp, _pwindow, _topLeft },	\
	Event { "sixteen", "" },	Click { 0, nb_h, nb_r1 + 15 * nb_rsp, _pwindow, _topLeft },	\
	Event { "seventeen", "" },	Click { 0, nb_h, nb_r1 + 16 * nb_rsp, _pwindow, _topLeft },	\
	Event { "eighteen", "" },	Click { 0, nb_h, nb_r1 + 17 * nb_rsp, _pwindow, _topLeft },	\
	Event { "nineteen", "" },	Click { 0, nb_h, nb_r1 + 18 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty", "" },		Click { 0, nb_h, nb_r1 + 19 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty one", "" },	Click { 0, nb_h, nb_r1 + 20 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty two", "" },	Click { 0, nb_h, nb_r1 + 21 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty three", "" },	Click { 0, nb_h, nb_r1 + 22 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty four", "" },	Click { 0, nb_h, nb_r1 + 23 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty five", "" },	Click { 0, nb_h, nb_r1 + 24 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty six", "" },		Click { 0, nb_h, nb_r1 + 25 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty seven", "" },	Click { 0, nb_h, nb_r1 + 26 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty eight", "" },	Click { 0, nb_h, nb_r1 + 27 * nb_rsp, _pwindow, _topLeft },	\
	Event { "twenty nine", "" },	Click { 0, nb_h, nb_r1 + 28 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty", "" },			Click { 0, nb_h, nb_r1 + 29 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty one", "" },		Click { 0, nb_h, nb_r1 + 30 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty two", "" },		Click { 0, nb_h, nb_r1 + 31 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty three", "" },	Click { 0, nb_h, nb_r1 + 32 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty four", "" },	Click { 0, nb_h, nb_r1 + 33 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty five", "" },	Click { 0, nb_h, nb_r1 + 34 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty six", "" },		Click { 0, nb_h, nb_r1 + 35 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty seven", "" },	Click { 0, nb_h, nb_r1 + 36 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty eight", "" },	Click { 0, nb_h, nb_r1 + 37 * nb_rsp, _pwindow, _topLeft },	\
	Event { "thirty nine", "" },	Click { 0, nb_h, nb_r1 + 38 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty", "" },			Click { 0, nb_h, nb_r1 + 39 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty one", "" },		Click { 0, nb_h, nb_r1 + 40 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty two", "" },		Click { 0, nb_h, nb_r1 + 41 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty three", "" },	Click { 0, nb_h, nb_r1 + 42 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty four", "" },		Click { 0, nb_h, nb_r1 + 43 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty five", "" },		Click { 0, nb_h, nb_r1 + 44 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty six", "" },		Click { 0, nb_h, nb_r1 + 45 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty seven", "" },	Click { 0, nb_h, nb_r1 + 46 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty eight", "" },	Click { 0, nb_h, nb_r1 + 47 * nb_rsp, _pwindow, _topLeft },	\
	Event { "forty nine", "" },		Click { 0, nb_h, nb_r1 + 48 * nb_rsp, _pwindow, _topLeft },	\
	Event { "fifty", "" },			Click { 0, nb_h, nb_r1 + 49 * nb_rsp, _pwindow, _topLeft }

// Organizer NavPanel
#define	ov_h	120
#define	ov_r1	97
#define	ov_rsp	30
#define	_OrgPanelRows_	\
	Event { "row one", "" },	Click { 1, ov_h, ov_r1 + 0 * ov_rsp, _window, _topLeft },	\
	Event { "row two", "" },	Click { 1, ov_h, ov_r1 + 1 * ov_rsp, _window, _topLeft },	\
	Event { "row three", "" },	Click { 1, ov_h, ov_r1 + 2 * ov_rsp, _window, _topLeft },	\
	Event { "row four", "" },	Click { 1, ov_h, ov_r1 + 3 * ov_rsp, _window, _topLeft },	\
	Event { "row five", "" },	Click { 1, ov_h, nb_r1 + 4 * ov_rsp, _window, _topLeft },	\
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

#define	il_h	176
#define	il_r1	182
#define	il_rsp	30
#pragma mark Navigate
resource restype_Slate (resid_Navigate, "Navigate") { {
	Slate { "nav", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "open in", "" },	Keypress { kc_comma, mf_command + mf_option + mf_shift },
		ExitEvent { "focus", "" },		Keypress { kc_period, mf_command + mf_option },
		Event { "top row", "" },		_topRow,
		Event { "nav list", "" },		_navList,
		Event { "file", "" },			Keypress { kc_1, mf_command },
		Event { "symbol", "" },			Keypress { kc_2, mf_command },
		Event { "search", "" },			Keypress { kc_3, mf_command },
		Event { "issue", "" },			Keypress { kc_4, mf_command },
		Event { "debug", "" },			Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_Debug }, endSequence{},
		Event { "breakpoint", "" },		Keypress { kc_6, mf_command },
		Event { "log", "" },			Keypress { kc_7, mf_command },
		Event { "new group", "" },		Keypress { kc_N, mf_command + mf_option },
		Event { "pop issues", "" },		Click { 1, -24, 108, _window, _topRight },
		Event { "filter", "" },			ResSubslate { resid_NavFilter },
		Event { "select row", "" },		ResSubslate { resid_SelectRow },
		Event { "new tab", "" },		_newTab,
		Event { "close tab", "" },		_closeTab,
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "go panel", "" },		_goPanel,
		Event { "next panel", "" },		_nextPanel,
		Event { "previous panel", "" },	_previousPanel,
		Event { "skip ahead", "" },		_skipAhead,
		Event { "skip back", "" },		_skipBack,
		Event { "counterpart", "" },	_counterpart,
		Event { "next issue", "" },		_nextIssue,
		Event { "previous issue", "" },	_previousIssue,
		_JumpBar_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_CommandSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_TypeXcodeSlate_,
		_LetterKeys_,
		_NumberKeys_,
	} }
} };

#pragma mark NavFilter
resource restype_Slate (resid_NavFilter, "NavFilter") { {
	Slate { "filter", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		closeDocument_,
		ExitEvent { "recent", "" },			Click { 1, 45, -10, _pwindow, _bottomLeft },
		ExitEvent { "source control", "" },	Click { 1, 58, -10, _pwindow, _bottomLeft },
		ExitEvent { "unsaved", "" },		Click { 1, 71, -10, _pwindow, _bottomLeft },
		Event { "clear filter", "" },		Click { 1, 243, -10, _pwindow, _bottomLeft },
		Event {	"filter", "" },				Click { 1, 200, -10, _pwindow, _bottomLeft },
		ExitEvent { "last build", "" },		Click { 1, 12, -10, _pwindow, _bottomLeft },
	} }
} };

#pragma mark SelectRow
resource restype_Slate (resid_SelectRow, "SelectRow") { {
	Slate { "row", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		ExitEvent { "select", "" },		Click { 1, 0, 0, _cursor },
		closeDocument_,
		Event { "north", "" },			Click { 0, 0, -nb_rsp, _cursor },
		Event { "down", "" },			Click { 0, 0, nb_rsp, _cursor },
		Event { "adjust", "" },			Subslate { "adjust" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "north", "" },			Click { 0, 0, -2, _cursor },
			Event { "down", "" },			Click { 0, 0, 2, _cursor },
			endSubslate{},
		_NavPanelRows_,
	} }
} };

#pragma mark Panel
resource restype_Slate (resid_Panel, "Panel") { {
	Slate { "Panel", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },	NilAction{},
		Event { "select", "" },		_goPanel,
		Event { "navigate", "" },	ResSubslate { resid_Navigate },
		_DirectionKeys_,
		_ReturnKey_,
		_JumpBar_,
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
		Event { "top", "" },		Sequence{},	Keypress { kc_4, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "group", "" },		Sequence{},	Keypress { kc_5, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
		Event { "symbols", "" },	Sequence{},	Keypress { kc_6, mf_control }, ResSubslate { resid_jumpPopup }, endSequence{},
	} }
} };

resource restype_Slate (resid_jumpPopup, "") { {
    Slate { "jump", {
        _PopupStandards_,
    } }
} };

#pragma mark Utilities
resource restype_Slate (resid_Utilities, "Utility") { {
	Slate { "util", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },	Keypress { kc_0, mf_command + mf_option },
		Event { "show", "" },		Keypress { kc_0, mf_command + mf_option },
		Event { "hide", "" },		Keypress { kc_0, mf_command + mf_option },
		Event { "files", "" },		Sequence{}, Keypress { kc_1, mf_command + mf_option }, ResSubslate { resid_utilFile }, endSequence{},
		Event { "help", "" },		Keypress { kc_2, mf_command + mf_option },
		Event { "templates", "" },	Keypress { kc_1, mf_command + mf_option + mf_control },
		Event { "snippets", "" },	Keypress { kc_2, mf_command + mf_option + mf_control },
		Event { "objects", "" },	Keypress { kc_3, mf_command + mf_option + mf_control },
		Event { "media", "" },		Keypress { kc_4, mf_command + mf_option + mf_control },
		_IMouseSlate_,
	} }
} };

resource restype_Slate (resid_utilFile, "file util") { {
	Slate { "file", {
		_SlateGlobals_,
		_IMouseSlate_,
		_DirectionKeys_,
		_CloseSubslate_,
		Event { "top row", "" },			Click { 0, -140, 126, _window, _topRight },
		Event { "next", "" },				Click { 0, 0, 20, _cursor },
		Event { "previous", "" },			Click { 0, 0, -20, _cursor },
		Event { "click one", "" },			Click { 1, 0, 0, _cursor },
		Event { "nav list", "" },			_navList,
		Event { "discard changes", "" },	Click { 0, -77, 204, _window, _topRight },
		Event { "locate", "" },				Sequence{}, Click { 1, -20, 222, _window, _topRight }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate two", "" },			Sequence{}, Click { 1, -20, 236, _window, _topRight }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate three", "" },		Sequence{}, Click { 1, -20, 250, _window, _topRight }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate four", "" },		Sequence{}, Click { 1, -20, 264, _window, _topRight }, ResSubslate { resid_utilFileLocate }, endSequence{},
		Event { "locate five", "" },		Sequence{}, Click { 1, -20, 278, _window, _topRight }, ResSubslate { resid_utilFileLocate }, endSequence{},
	} }
} };

#define	flt_h	350		// filter field, from _window _topCenter
#define	flt_v	150
resource restype_Slate (resid_utilFileLocate, "locate file") { {
	Slate { "locate", {
		_FileOpenStandards_,
	} }
} };

#pragma mark Organizer
resource restype_Slate (resid_Organizer, "Organizer") { {
	Slate { "org", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _window, _topLeft },		Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
		_OrgPanelRows_,
		ExitEvent { "open",	"" },		Keypress { kc_return, 0 },
		Event { "devices", "" },		Click { 1, -128, 45, _window, _topCenter },	
		Event { "repositories", "" },	Sequence{}, Click { 1, -64, 45, _window, _topCenter },
			ResSubslate { resid_Repositories }, endSequence{},
		Event { "projects", "" },		Click { 1, 0, 45, _window, _topCenter },	
		Event { "archives", "" },		Click { 1, 64, 45, _window, _topCenter },	
		Event { "documentation", "" },	Sequence{}, Click { 1, 128, 45, _window, _topCenter }, ResSubslate { resid_Documentation }, endSequence{},
	} }
} };

#define replist_top	426
#define	replist_sp	83
#define	_rowSupport			replist_top+0*replist_sp
#define	_rowPunkin			replist_top+1*replist_sp
#define	_rowCarbon			replist_top+2*replist_sp
#define	_rowAccessor		replist_top+4*replist_sp-16

#pragma mark Repositories
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
			ExitEvent { "Working Copy", "" },	Click { 1, 0, 57, 	_cursor },
			Event { "Support", "" },			Click { 0, 25, _rowSupport, _window, _topLeft },
			Event { "Punkin", "" },				Click { 0, 25, _rowPunkin, _window, _topLeft }, 
			Event { "Carbon", "" },				Click { 0, 25, _rowCarbon, _window, _topLeft }, 
			Event { "Accessor", "" },			Click { 0, 25, _rowAccessor, _window, _topLeft }, 
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
		_CommandSlate_,
		_TypeXcodeSlate_,
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "Working Copy", "" },	TypeText { "Add Working" },
		Event { "Repository", "" },		TypeText { "Add Repository" },
		Event { "Clone", "" },			TypeText { "Checkout or Clone" },
		Event { "continue", "" },		_return,
		Event { "git path", "" },		Sequence{}, TypeText { "/Users/carolclark/Dev/gitrep/Main" }, _left, _left, _left, _left, endSequence{},			
		Event { "working path", "" },	TypeText { "/Users/carolclark/Dev/" },
		Event { "next", "" },			_return,
		Event { "finish", "" },			Sequence{}, _return, ResSubslate { resid_FileSave }, endSequence{},
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
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _window, _topLeft },		Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
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

/* todo */
#pragma mark Refactor
#define	_ahead		Keypress { kc_tab, mf_option }
#define _back		Keypress { kc_tab, mf_option + mf_shift }
#define _content	Click { 1, -200, -200, _pwindow, _bottomRight },	\
						_ahead, _ahead, _ahead, _ahead, _ahead, _ahead, _ahead, _ahead, _ahead
#define _rowleft	95
#define _rowtop		130
#define _rsp		18
resource restype_Slate (resid_Refactor, "Refactor") { {
	Slate { "Refactor", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		_TypeXcodeSlate_,
		_CommandSlate_,
		_IMouseSlate_,
		_WhitespaceKeys_,
		Event { "popup", "" },			Click { 1, 88, 36, _pwindow, _topLeft },
		Event { "rename members", "" },	Click { 1, 65, 60, _pwindow, _topLeft },
		Event { "rename files", "" },	Click { 1, 310, 60, _pwindow, _topLeft },
		Event { "move related", "" },	Click { 1, 65, 60, _pwindow, _topLeft },
		Event { "snapshot", "" },		Click { 1, -215, 88, _pwindow, _topRight },
		Event { "help", "" },			Sequence{},
			Click { 1, -165, 88, _pwindow, _topRight },
			Wait { 60 }, _content, _ahead, _ahead, 
			ResSubslate { resid_RefactorHelp },
			endSequence{},
		Event { "preview", "" },		Click { 1, -55, 88, _pwindow, _topRight },
		Event { "apply", "" },			Click { 1, -55, 88, _pwindow, _topRight },
		Event { "difference", "" },		Click { 1, 0, -30, _pwindow, _bottomCenter },
		Event { "edit", "" },			Click { 1, -36, -161, _pwindow, _bottomRight },
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		Event { "row one", "" },		Click { 1, _rowleft, _rowtop+0*_rsp, _pwindow, _topLeft },
		Event { "row two", "" },		Click { 1, _rowleft, _rowtop+1*_rsp, _pwindow, _topLeft },
		Event { "row three", "" },		Click { 1, _rowleft, _rowtop+2*_rsp, _pwindow, _topLeft },
		Event { "row four", "" },		Click { 1, _rowleft, _rowtop+3*_rsp, _pwindow, _topLeft },
		Event { "row five", "" },		Click { 1, _rowleft, _rowtop+4*_rsp, _pwindow, _topLeft },
		Event { "row six", "" },		Click { 1, _rowleft, _rowtop+5*_rsp, _pwindow, _topLeft },
		Event { "row seven", "" },		Click { 1, _rowleft, _rowtop+6*_rsp, _pwindow, _topLeft },
		Event { "row eight", "" },		Click { 1, _rowleft, _rowtop+7*_rsp, _pwindow, _topLeft },
		Event { "row nine", "" },		Click { 1, _rowleft, _rowtop+8*_rsp, _pwindow, _topLeft },
		Event { "row ten", "" },		Click { 1, _rowleft, _rowtop+9*_rsp, _pwindow, _topLeft },
		Event { "row eleven", "" },		Click { 1, _rowleft, _rowtop+10*_rsp, _pwindow, _topLeft },
		Event { "row twelve", "" },		Click { 1, _rowleft, _rowtop+11*_rsp, _pwindow, _topLeft },
	} }
} };

resource restype_Slate (resid_RefactorHelp, "Refactoring Help") { {
	Slate { "Help", {
		_SlateGlobals_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "okay", "" },		NilAction{},
		_IMouseSlate_,
		Event { "content", "" },		Sequence{}, _content, _ahead, _ahead, endSequence{},
		Event { "ahead", "" },			_ahead,
		Event { "back", "" },			_back,
		Event { "enter", "" },			Keypress { kc_enter, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
	} }
} };

#pragma mark Scripts
resource restype_Slate (resid_Scripts, "Scripts") { {
	Slate { "Scripts", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 }, 
		_IMouseSlate_,
		_DirectionKeys_,
		_CommandSlate_,
		Event { "go marker", "" },			Sequence{}, TypeText { "goMarker" }, _return, ResSubslate { resid_bbeSelectMarker }, endSequence{},
		Event { "view in browser", "" },	Sequence{}, TypeText { "viewCdoc" }, _return, endSequence{},
		Event { "view C doc", "" },			Sequence{}, TypeText { "viewCdoc" }, _return, endSequence{},
		Event { "view Doxygen", "" },		Sequence{}, TypeText { "viewDoxygen" }, _return, endSequence{},
	} }
} };

resource restype_Slate (resid_bbeSelectMarker, "BBEdit SelectMarker") { {
	Slate { "select", {
		_SlateGlobals_,
		_IMouseSlate_,
		_DirectionKeys_,
		_PageUpKey_,
		_PageDownKey_,
		_CommandSlate_,
		_NumberKeys_,
		_ReturnKey_,
		Event { "go line", "" },	Keypress { kc_J, mf_command },
		ExitEvent { "exit", "" },	NilAction{},
		Event { "go back", "" },	Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "okay", "" },		Sequence{}, Keypress { kc_left, mf_command }, Keypress { kc_right, mf_command + mf_shift }, Wait { 10 }, Keypress { kc_E, mf_command }, Keypress { kc_W, mf_command }, Launch { DevApps_"XCode.app", resid_Xcode }, Keypress { kc_G, mf_command }, endSequence{},
	} }
} };

#pragma mark 6 === Editors

#pragma mark Standard Editor
resource restype_Slate (resid_edStandard, "edStandard") { {
	Slate { "stdEdit", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_CommandSlate_,
		closeDocument_,
		Event { "nav list", ""},		_navList,
		Event { "jump top", "" },		Keypress { kc_up, mf_option },
		Event { "select row", "" },		ResSubslate { resid_SelectRow },
	} }
} };

#pragma mark Assistant Editor
resource restype_Slate (resid_edAssistant, "edAssistant") { {
	Slate { "asst", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "standard", "" },	Keypress { kc_return, mf_command }, 
		_IMouseSlate_,
		_DirectionKeys_,
		_CommandSlate_,
		closeDocument_,
		Event { "filter", "" },			ResSubslate { resid_navFilter },
		Event { "compare", "" },		Click { 1, -100, -20, _window, _bottomRight },
		Event { "annotate", "" },		Click { 1, -73, -20, _window, _bottomRight },
		Event { "revisions", "" },		Click { 1, -46, -20, _window, _bottomRight },
		Event { "edit left", "" },		Click { 1, 660, 540, _window, _topLeft },
		Event { "edit right", "" },		Click { 1, -350, 540, _window, _topRight },
		Event { "nav list", ""},		_navList,
		Event { "top row", "" },		_topRow,
		Event { "nav list", ""},		_navList,
		Event { "top", "" },			Sequence{}, Click { 1, 660, 540, _window, _topLeft }, Keypress { kc_up, mf_command }, endSequence{},	
		Event { "select row", "" },		ResSubslate { resid_SelectRow },
	} }
} };

#pragma mark Version Editor
resource restype_Slate (resid_edVersion, "edVersion") { {
	Slate { "vers", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "standard", "" },	Keypress { kc_return, mf_command }, 
		_IMouseSlate_,
		_DirectionKeys_,
		_CommandSlate_,
		closeDocument_,
		_NumberKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "filter", "" },			ResSubslate { resid_navFilter },
		Event { "compare", "" },		Click { 1, -100, -20, _window, _bottomRight },
		Event { "annotate", "" },		Click { 1, -73, -20, _window, _bottomRight },
		Event { "revisions", "" },		Click { 1, -46, -20, _window, _bottomRight },
		Event { "edit left", "" },		Click { 1, 660, 540, _window, _topLeft },
		Event { "edit right", "" },		Click { 1, -350, 540, _window, _topRight },
		Event { "nav list", ""},		_navList,
		Event { "top row", "" },		_topRow,
		Event { "top", "" },			Sequence{}, Click { 1, 660, 540, _window, _topLeft }, Keypress { kc_up, mf_command }, endSequence{},	
		Event { "end", "" },			Sequence{}, Click { 1, 660, 540, _window, _topLeft }, Keypress { kc_down, mf_command }, _up, _up, _up, _up, endSequence{},	
		Event { "difference", "" },		Click { 1, 125, 125, _window, _topCenter },
		Event { "down again", "" },		_down,
		Event { "commit", "" },			Sequence{}, Keypress { kc_C, mf_command + mf_option }, ResSubslate { resid_Commit }, endSequence{},
		Event { "new tab", "" },		Keypress { kc_T, mf_command },
//??		Event { "merge", "" },			TypeText { "merge" },
		Event { "select row", "" },		ResSubslate { resid_SelectRow },
		_TypeXcodeSlate_,
	} }
} };

#define _targetList		Click { 2, 14, -73, _pwindow, _bottomLeft }
#pragma mark Project
resource restype_Slate (resid_edProject, "Project") { {
	Slate { "stdProj", {
		ExitEvent { "okay", "" },		_showHideNavigator,
		ExitEvent { "exit", "" },		NilAction{},
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "add target", "" },		Sequence{}, Click { 1, 86, -36, _pwindow, _bottomLeft }, ResSubslate { resid_projAddTarget }, endSequence{},
		Event { "add build phase", "" },	Sequence{}, Click { 1, -72, -36, _pwindow, _bottomRight }, ResSubslate { resid_projAddPhase }, endSequence{},
		Event { "modernize", "" },		Click { 1, 0, -36, _pwindow, _bottomCenter },
		Event { "target list", "" },	ResSubslate { resid_projTargetList },
		Event { "info", "" },			Click { 1, -80, 134, _pwindow, _topCenter },
		Event { "build settings", "" },	Click { 1, -5, 134, _pwindow, _topCenter },
		Event { "build phases", "" },	Click { 1, 115, 134, _pwindow, _topCenter },
		Event { "build rules", "" },	Click { 1, 250, 134, _pwindow, _topCenter },
		Event { "open run script", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, ResSubslate { resid_phaseRunScript }, endSequence{},
		Event { "open dependencies", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open compile sources", "" },	Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Files", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Headers", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Resources", "" },	Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Link", "" },				Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "delete phase", "" },	Click { 0, 1620, 0, _cursor },
		Event { "phase one", "" },		Click { 0, il_h+8, il_r1 + 0 * il_rsp, _pwindow, _topLeft },
		Event { "phase two", "" },		Click { 0, il_h+8, il_r1 + 1 * il_rsp, _pwindow, _topLeft },
		Event { "phase three", "" },	Click { 0, il_h+8, il_r1 + 2 * il_rsp, _pwindow, _topLeft },
		Event { "phase four", "" },		Click { 0, il_h+8, il_r1 + 3 * il_rsp, _pwindow, _topLeft },
		Event { "phase five", "" },		Click { 0, il_h+8, il_r1 + 4 * il_rsp, _pwindow, _topLeft },
		Event { "phase six", "" },		Click { 0, il_h+8, il_r1 + 5 * il_rsp, _pwindow, _topLeft },
		Event { "phase seven", "" },	Click { 0, il_h+8, il_r1 + 6 * il_rsp, _pwindow, _topLeft },
		Event { "phase eight", "" },	Click { 0, il_h+8, il_r1 + 7 * il_rsp, _pwindow, _topLeft },
		Event { "phase nine", "" },		Click { 0, il_h+8, il_r1 + 8 * il_rsp, _pwindow, _topLeft },
		Event { "phase ten", "" },		Click { 0, il_h+8, il_r1 + 9 * il_rsp, _pwindow, _topLeft },
		Event { "phase eleven", "" },	Click { 0, il_h+8, il_r1 + 10 * il_rsp, _pwindow, _topLeft },
		Event { "phase twelve", "" },	Click { 0, il_h+8, il_r1 + 11 * il_rsp, _pwindow, _topLeft },
		_SlateGlobals_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_CommandSlate_,
		_TypeXcodeSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
	} }
} };

#pragma mark TargetList
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
		_CommandSlate_,			\
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

#pragma mark Log
resource restype_Slate (resid_edLog, "Log") { {
	Slate { "stdLog", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "expand", "" },			Sequence{}, ClickMenu { "Editor", }, _down, TypeText { "Expand Selected Transcripts" }, _return, endSequence{},
		Event { "collapse", "" },		Sequence{}, ClickMenu { "Editor", }, _down, TypeText { "Collapse Selected Transcripts" }, _return, endSequence{},
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "top row", "" },		_topRow,
		focus_,
		_XcodeStandards_,
		_IMouseSlate_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
	} }	
} };

#pragma mark Issues
resource restype_Slate (resid_edIssues, "Issues") { {
	Slate { "stdIssues", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		Event { "by file", "" },		Click { 1, 35, 132, _window, _topLeft },
		Event { "by type", "" },		Click { 1, 92, 132, _window, _topLeft },
		Event { "nav list", "" },		_navList,
		_EndKey_,
		Event { "top row", "" },		_topRow,
		Event { "bottom row", "" },		_bottomRow,
		Event { "select row", "" },		ResSubslate { resid_SelectRow },
		_XcodeStandards_,
		_IMouseSlate_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
	} }	
} };

#pragma mark Search
#define _hideFindBar			Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Hide Find Bar" }, _return, endSequence{}
resource restype_Slate (resid_Search, "Search") { {
	Slate { "Search", {
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeXcodeSlate_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "hide find bar", "" },			_hideFindBar,
		Event { "multiple", "" },				Sequence{}, Keypress { kc_3, mf_command }, ResSubslate { resid_edSearch }, endSequence{},
		Event { "find", "" },					Sequence{}, Keypress { kc_F, mf_command }, ResSubslate { resid_FindReplace }, endSequence{},
		Event { "replace", "" },				Sequence{}, Keypress { kc_F, mf_command + mf_option }, ResSubslate { resid_FindReplace }, endSequence{},
		Event { "find again", "" },				Keypress { kc_G, mf_command },
		Event { "find previous", "" },			Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },					Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace" }, _return, endSequence{},
		Event { "change again", "" },			Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace and Find Again" }, _return, endSequence{},
		ExitEvent { "current mark", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "id='hmark_Current'" }, _return, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Hide Find Bar" }, _return, _left, endSequence{},
	} }
} };

#pragma mark Single File
#define _clickOptionsButton		Click { 1, -281, 132, _window, _topRight }
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

#pragma mark FindOptions
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

#pragma mark Search Multiple
#define _clickOptionsButton		Click { 1, 90, 132, _window, _topLeft }
resource restype_Slate (resid_edSearch, "Search Multiple") { {
	Slate { "edSearch", {
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeXcodeSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_CommandSlate_,
		_IMouseSlate_,
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "find again", "" },				Keypress { kc_G, mf_command },
		Event { "find previous", "" },			Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },					Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace" }, _return, endSequence{},
		Event { "change again", "" },			Sequence{}, ClickMenu { "Edit" }, _down, TypeText { "Find" }, _right, Wait { 10 }, TypeText { "Replace and Find Again" }, _return, endSequence{},
		focus_,
		focusBack_,
		Event { "find", "" },					Sequence{}, Click { 1, 25, 130, _window, _topLeft }, Keypress { kc_F, 0 }, _return, endSequence{},
		Event { "replace", "" },				Sequence{}, Click { 1, 25, 130, _window, _topLeft }, Keypress { kc_R, 0 }, _return, endSequence{},
		Event { "options", "" },				Sequence{}, _clickOptionsButton, _down, _return, ResSubslate { resid_edFindOptions }, endSequence{},
		Event { "search field", "" },			Sequence{}, Click { 1, 143, 130, _window, _topLeft }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "replace field", "" },			Sequence{}, Click { 1, 150, 152, _window, _topLeft }, ResSubslate { resid_TypeXcodeSlate }, endSequence{},
		Event { "preview", "" },				Click { 1, 33, 175, _window, _topLeft },
		Event { "replace", "" },				Click { 1, 135, 175, _window, _topLeft },
		Event { "replace all", "" },			Click { 0, 210, 175, _window, _topLeft },
	} }
} };

#pragma mark edFindOptions
resource restype_Slate (resid_edFindOptions, "edFind Options") { {
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

#pragma mark -
#pragma mark Doxygen
resource restype_Slate (resid_Doxygen, "Doxygen") { {
	Slate { "Doxygen", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "exit", "" },					NilAction{},
		ExitEvent { "cancel", "" },					NilAction{},
		
		Event { "block", "" },						Sequence{}, TypeText { "/*!" }, _tab, Keypress { kc_return, 0 }, 
			TypeText { "*/" }, _return, _left, Keypress { kc_left, mf_command }, Keypress { kc_left, 0 }, endSequence{},
		Event { "comment", "" },					Sequence{}, TypeText { "/*!  */" }, _return, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "trailing", "trailing comment" }, Sequence{}, TypeText { "/*!< \\brief" }, _tab,
			TypeText { " */" }, _left, _left, _left, endSequence{},
		ExitEvent { "brief", "" },					Sequence{}, TypeText { "//!  " }, _return, _left, endSequence{},
		ExitEvent { "details", "" },				Sequence{}, TypeText { "\\details" }, _tab, endSequence{},
		ExitEvent { "parameter", "" },				Sequence{}, TypeText { "\\param" }, _tab, _tab,
				TypeText { "<#paramName#>" }, _tab, TypeText { "<#description#>" }, _previous, _previous, endSequence{},
		ExitEvent { "result", "" },					Sequence{}, TypeText { "\\result" }, _tab, _tab, endSequence{},
		ExitEvent { "file", "" },					Sequence{}, TypeText { "\\file" }, _tab, _tab, 
				TypeText { "<#filename#>" }, _tab, TypeText { "<#description#>" }, endSequence{},
		ExitEvent { "internal", "" },				Sequence{}, TypeText { "\\internal" }, _tab, endSequence{},
		ExitEvent { "attention", "" },				Sequence{}, TypeText { "\\attention" }, _tab, endSequence{},
		ExitEvent { "bug", "" },					Sequence{}, TypeText { "\\bug" }, _tab, _tab, endSequence{},
		ExitEvent { "deprecated", "" },				Sequence{}, TypeText { "\\deprecated" }, _tab, endSequence{},
		ExitEvent { "exception", "" },				Sequence{}, TypeText { "\\exception" }, _tab, endSequence{},
		ExitEvent { "invariant", "" },				Sequence{}, TypeText { "\\invariant" }, _tab, endSequence{},
		ExitEvent { "note", "" },					Sequence{}, TypeText { "\\note" }, _tab, _tab, endSequence{},
		ExitEvent { "to do", "" },					Sequence{}, TypeText { "\\todo" }, _tab, _tab, endSequence{},
		ExitEvent { "paragraph", "" },				Sequence{}, TypeText { "\\par" }, _tab,
				TypeText { "<#title#>" }, _previous, endSequence{},
		ExitEvent { "postconditions", "" },			Sequence{}, TypeText { "\\post" }, _tab, endSequence{},
		ExitEvent { "preconditions", "" },			Sequence{}, TypeText { "\\pre" }, _tab, endSequence{},
		ExitEvent { "see also", "" },				Sequence{}, TypeText { "\\sa" }, _tab, endSequence{},
		ExitEvent { "since", "" },					Sequence{}, TypeText { "\\since" }, _tab, _tab,
				TypeText { "<#version#>" }, _previous, endSequence{},
		ExitEvent { "test", "" },					Sequence{}, TypeText { "\\test" }, _tab, endSequence{},
		ExitEvent { "throw", "" },					Sequence{}, TypeText { "\\throw" }, _tab, _tab,
				TypeText { "<#exceptionObject#>" }, _tab, TypeText { "<#because#>" }, _previous, _previous, endSequence{},
		ExitEvent { "copydoc", "" },					Sequence{}, TypeText { "\\copydoc" }, _tab,
				TypeText { "<#class#>::<#member#>\\n" }, _previous, _previous, endSequence{},
		ExitEvent { "markup", "" },					Sequence{}, TypeText { "\\htmlonly" }, _return, 
				TypeText { "\\endhtmlonly" }, _up, endSequence{},
		ExitEvent { "list item", "" },				Sequence{}, TypeText { "\\li" }, _tab, _tab, endSequence{},

		ExitEvent { "group", "" },					Sequence{}, TypeText { "#pragma mark" }, _tab, TypeText	{ "<#groupName#>" },
				_return, TypeText { "/*! \\name" }, _tab, _tab,
				TypeText { "<#groupName#>" }, _return, TypeText { "*/" }, _return,
				TypeText { "//@{" }, _return, TypeText { "//@}" }, _return, Keypress { kc_up, mf_shift }, endSequence{},
		ExitEvent { "mainpage", "" },				Sequence{}, TypeText { "\\mainpage" }, _tab,
				TypeText { "<#optTitle#>" }, _tab, _previous, endSequence{},
		ExitEvent { "page", "" },					Sequence{}, TypeText { "\\page" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},

		ExitEvent { "anchor", "" },					Sequence{}, TypeText { "\\anchor" }, _tab,
				TypeText { "<#name#>" }, _tab, _previous, endSequence{},
		ExitEvent { "reflink", "" },				Sequence{}, TypeText { "\\ref" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "subpage", "" },				Sequence{}, TypeText { "\\subpage" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "section", "" },				Sequence{}, TypeText { "\\section" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "subsection", "" },				Sequence{}, TypeText { "\\subsection" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "subsubsection", "" },			Sequence{}, TypeText { "\\subsubsection" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		ExitEvent { "page paragraph", "" },			Sequence{}, TypeText { "\\paragraph" }, _tab, 
				TypeText { "<#name#>" }, _tab, TypeText { "<#title#>" }, _previous, _previous, endSequence{},
		
		ExitEvent { "less than", "" },				TypeText { "&lt;" },
		ExitEvent { "greater than", "" },			TypeText { "&gt;" },
		ExitEvent { "ampersand", "" },				TypeText { "&amp;" },
	} }
} };

#pragma mark 7 === DesignMenu
resource restype_Slate (resid_DesignMenu, "Design") { {
	Slate { "Design", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Roll Up", "" },			Sequence{}, TypeText { "Roll Up" }, _return, endSequence{},
		ExitEvent { "Roll Down", "" },			Sequence{}, TypeText { "Roll Down" }, _return, endSequence{},
		ExitEvent { "Collapse", "" },			Sequence{}, TypeText { "Collapse" }, _return, endSequence{},
		ExitEvent { "Expand", "" },				Sequence{}, TypeText { "Expand" }, _return, endSequence{},
	} }
} };

/* xckbbug	Event { "capitalize", "" },		_capitalize,	\
	Event { "lowercase", "" },		_lowercase,		\	*/
resource restype_Slate (resid_TypeDesign, "Type for Design") { {
	Slate { "TypeDesign", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "Special", "" },		ResSubslate { resid_TypeSpecialXcodeSlate },
		Event { "select word", "" },	_selword,
		Event { "select line", "" },	_selline,
		Event { "capitalize", "" },		_capitalize,
		Event { "lower case", "" },		_lowercase,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_TypeSlateItems_
	} }
} };

#define	_DataModelMenu_		ClickMenu { "Design" }, _down, TypeText { "Data Model" }, _right

#define	topRow_		83
#define	rowHt_		17

/* xckbbug	Event { "capitalize", "" },		_capitalize,	\
	Event { "lowercase", "" },		_lowercase,		\	*/
resource restype_Slate (resid_DataModel, "DataModel") { {
	Slate { "DataModel", {
		_SlateGlobals_,
		_CloseSubslate_,
		_CommandSlate_,
		_TypeXcodeSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "editor", "" },		Keypress { kc_E, mf_command + mf_shift },
		Event { "page top", "" },	Keypress { kc_home, 0 },
		Event { "page end", "" },	Keypress { kc_end, 0 },
		Event { "page north", "" },	Keypress { kc_pageup, 0 },
		Event { "page down", "" },	Keypress { kc_pagedown, 0 },
		Event { "select word", "" },	_selword,
		Event { "select line", "" },	_selline,
		Event { "capitalize", "" },		_capitalize,
		Event { "lower case", "" },		_lowercase,
		closeDocument_,
		_JumpBar_,
		Event { "Design Menu", "" }, Sequence{}, ClickMenu { "Design" }, _down, ResSubslate { resid_DesignMenu }, endSequence{},
		Event { "Add", "" },		Subslate { "Add" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Entity", "" },			Sequence{}, _DataModelMenu_, TypeText { "Add Entity" }, _return, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "Property", "" },		Sequence{}, _DataModelMenu_, TypeText { "Add Attribute" }, _return, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "Relationship", "" },	Sequence{}, _DataModelMenu_, TypeText { "Add Relationship" }, _return, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "Fetched", "" },		Sequence{}, _DataModelMenu_, TypeText { "Add Fetched Property" }, _return, ResSubslate { resid_TypeDesign }, endSequence{},
		endSubslate{},
		Event { "Edit", "" },		Subslate { "Edit" },
			_SlateGlobals_,
			_CloseSubslate_,
			_TypeXcodeSlate_,
			_WhitespaceKeys_,
			_DirectionKeys_,
			Event { "name", "" },	Sequence{}, Click { 2, -115, 115, _pwindow, _topRight },	ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "class", "" },	Sequence{}, Click { 2, -115, 165, _pwindow, _topRight },	ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "parent", "" },		Click { 1, -145, 170, _pwindow, _topRight },
			Event { "abstract", "" },	Click { 1, -210, 195, _pwindow, _topRight },
			Event { "optional", "" },	Click { 1, -215, 140, _pwindow, _topRight },
			Event { "transient", "" },	Click { 1, -160, 140, _pwindow, _topRight },
			Event { "indexed", "" },	Click { 1, -80, 140, _pwindow, _topRight },
			Event { "destination", "" },	Click { 1, -120, 165, _pwindow, _topRight },
			Event { "inverse", "" },	Click { 1, -120, 185, _pwindow, _topRight },
			Event { "to many", "" },	Click { 1, -130, 210, _pwindow, _topRight },
			Event { "transformer", "" },	Sequence{}, Click { 1, -180, 214, _pwindow, _topRight }, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "minimum", "" },	Sequence{}, Click { 2, -170, 190, _pwindow, _topRight }, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "maximum", "" },	Sequence{}, Click { 2, -45, 215, _pwindow, _topRight }, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "default", "" },	Sequence{}, Click { 2, -45, 240, _pwindow, _topRight }, ResSubslate { resid_TypeDesign }, endSequence{},
			Event { "delete rule", "" },	Click { 1, -160, 260, _pwindow, _topRight },
		endSubslate{},
		Event { "Entity", "" },		Click { 0, 270, 90, _pwindow, _topLeft },
		Event { "Class", "" },		Click { 0, 270, 90, _pwindow, _topLeft },
		Event { "Property", "" },	Click { 0, 0, 90, _pwindow, _topCenter },
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
	} }
} };

#pragma mark Browser
	#define	_BrowseCdocResID_	resid_Browser
	#define _mainFrame_h		0
	#define _mainFrame_v		75
	#define _homeApp			DevApps_"Xcode.app"
_BrowseCdocSlate_

#pragma mark BrowseDoxygen
	#define	_BrowseDoxygenResID_	resid_BrowseDoxygen
	#define	_mainFrame_h			0
	#define	_mainFrame_v			75
	#define _homeApp				DevApps_"Xcode.app"
_BrowseDoxygenSlate_

#pragma mark Reference
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

resource restype_Slate (resid_refDocset, "Docset Home Button") { {
	Slate { "Set", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },				_return,
		ExitEvent { "cancel", "" },				Keypress { kc_escape, 0 },
		_WhitespaceKeys_,
		ExitEvent { "Core Library", "" },		Sequence{}, _down, _return, endSequence{},
		ExitEvent { "Developer Tools", "" },	Sequence{}, _down, _down, _return, endSequence{},
		ExitEvent { "Arbonne Prototype", "" },	Sequence{}, _down, _down, _down, _return, endSequence{},
		ExitEvent { "Arbonne Assistant", "" },	Sequence{}, _down, _down, _down, _down, _return, endSequence{},
		ExitEvent { "Koala", "" },				Sequence{}, _down, _down, _down, _down, _down, _return, endSequence{},
		ExitEvent { "Koala Try 1", "" },		Sequence{}, _down, _down, _down, _down, _down, _down, _return, endSequence{},
		ExitEvent { "My Library", "" },			Sequence{}, _down, _down, _down, _down, _down, _down, _down, _return, endSequence{},
	} }
} };

resource restype_Slate (resid_refBookmarks, "Bookmarks Button") { {
	Slate { "Bookmarks", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },			_return,
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		_WhitespaceKeys_,
		Event { "Add", "" },				_return,
		Event { "Manage", "" },				TypeText { "Manage Bookmarks" },
	} }
} };

/* todo */
#define results_top		88
#define results_left	33
#define results_sp		20
resource restype_Slate (resid_refSearch, "Reference Search") { {
	Slate { "Search", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },			NilAction{},
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		Event { "filter", "" },				Click { 2, -100, 40, _window, _topRight },
		Event { "clear filter", "" },		Click { 1, -20, 40, _window, _topRight },
		Event { "contains", "" },			Click { 1, 37, 66, _window, _topLeft },		
		Event { "prefix", "" },				Click { 1, 96, 66, _window, _topLeft },		
		Event { "exact", "" },				Click { 1, 147, 66, _window, _topLeft },		
		Event { "select set", "" },			Click { 1, 226, 66, _window, _topLeft },		
		Event { "select language", "" },	Click { 1, 341, 66, _window, _topLeft },		
		Event { "results", "" },			Sequence{},
			Click { 0, results_left, results_top+0*results_sp, _window, _topLeft },
			ResSubslate { resid_refSearchResults }, endSequence{},
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
	} }
} };

resource restype_Slate (resid_refSearchResults, "Results of Reference Search") { {
	Slate { "Results", {
		_SlateGlobals_,
		ExitEvent { "exit", "" },			NilAction{},
		ExitEvent { "okay", "" },			Click { 1, -20, 40, _window, _topRight },
		Event { "filter", "" },				Click { 2, -100, 40, _window, _topRight },
		Event { "select", "" },				Click { 1, 0, 0, _cursor },
		Event { "north", "" },				Click { 0, 0, -20, _cursor },
		Event { "down", "" },				Click { 0, 0, 20, _cursor },
		Event { "row one", "" },			Click { 0, results_left, results_top+1*results_sp, _window, _topLeft },
		Event { "row two", "" },			Click { 0, results_left, results_top+2*results_sp, _window, _topLeft },
		Event { "row three", "" },			Click { 0, results_left, results_top+3*results_sp, _window, _topLeft },
		Event { "row four", "" },			Click { 0, results_left, results_top+4*results_sp, _window, _topLeft },
		Event { "row five", "" },			Click { 0, results_left, results_top+5*results_sp, _window, _topLeft },
		Event { "row six", "" },			Click { 0, results_left, results_top+6*results_sp, _window, _topLeft },
		Event { "row seven", "" },			Click { 0, results_left, results_top+7*results_sp, _window, _topLeft },
		Event { "row eight", "" },			Click { 0, results_left, results_top+8*results_sp, _window, _topLeft },
		Event { "row nine", "" },			Click { 0, results_left, results_top+9*results_sp, _window, _topLeft },
		Event { "row ten", "" },			Click { 0, results_left, results_top+10*results_sp, _window, _topLeft },
		Event { "row eleven", "" },			Click { 0, results_left, results_top+11*results_sp, _window, _topLeft },
		Event { "row twelve", "" },			Click { 0, results_left, results_top+12*results_sp, _window, _topLeft },
		Event { "row thirteen", "" },		Click { 0, results_left, results_top+13*results_sp, _window, _topLeft },
		Event { "row fourteen", "" },		Click { 0, results_left, results_top+14*results_sp, _window, _topLeft },
		Event { "row fifteen", "" },		Click { 0, results_left, results_top+15*results_sp, _window, _topLeft },
		Event { "row sixteen", "" },		Click { 0, results_left, results_top+16*results_sp, _window, _topLeft },
		Event { "row seventeen", "" },		Click { 0, results_left, results_top+17*results_sp, _window, _topLeft },
		Event { "row eighteen", "" },		Click { 0, results_left, results_top+18*results_sp, _window, _topLeft },
		Event { "row nineteen", "" },		Click { 0, results_left, results_top+19*results_sp, _window, _topLeft },
		Event { "row twenty", "" },			Click { 0, results_left, results_top+20*results_sp, _window, _topLeft },
		Event { "row twenty one", "" },		Click { 0, results_left, results_top+21*results_sp, _window, _topLeft },
		Event { "row twenty two", "" },		Click { 0, results_left, results_top+22*results_sp, _window, _topLeft },
		Event { "row twenty three", "" },	Click { 0, results_left, results_top+23*results_sp, _window, _topLeft },
		Event { "row twenty four", "" },	Click { 0, results_left, results_top+24*results_sp, _window, _topLeft },
		Event { "row twenty five", "" },	Click { 0, results_left, results_top+25*results_sp, _window, _topLeft },
		Event { "row twenty six", "" },		Click { 0, results_left, results_top+26*results_sp, _window, _topLeft },
		Event { "row twenty seven", "" },	Click { 0, results_left, results_top+27*results_sp, _window, _topLeft },
		Event { "row twenty eight", "" },	Click { 0, results_left, results_top+28*results_sp, _window, _topLeft },
		Event { "row twenty nine", "" },	Click { 0, results_left, results_top+29*results_sp, _window, _topLeft },
		Event { "row thirty", "" },			Click { 0, results_left, results_top+30*results_sp, _window, _topLeft },
		Event { "row thirty one", "" },		Click { 0, results_left, results_top+31*results_sp, _window, _topLeft },
		Event { "row thirty two", "" },		Click { 0, results_left, results_top+32*results_sp, _window, _topLeft },
	} }
} };

#define	_mainFrame_h	0		// wrt center
#define	_mainFrame_v	105
#define	_splitter		250
#define	_toolbar_v		90
#define _bc_left		380
#define	_bc_sp			80
#define _mainlinks_h	_splitter+220
#define	_mainlinks_v	_toolbar_v+23
#define	_mainlinks_sp	16
resource restype_Slate (resid_Documentation, "Xcode Reference Documentation") { {
	Slate { "Docs",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_CommandSlate_,
		_IMouseSlate_,
		_TypeXcodeSlate_,
		_DoJumpSubslate_,
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "explore", "" },		Click { 1, 153, 93, _window, _topLeft },
		Event { "search", "" },			Sequence{}, Click { 1, 153, 123, _window, _topLeft },
			ResSubslate { resid_refSearch }, endSequence{},
		Event { "bookmarks", "" },		Click { 1, 153, 153, _window, _topLeft },
		Event { "go back", "" },		Click { 1, _splitter+43, _toolbar_v, _window, _topLeft },
		Event { "go forward", "" },		Click { 1, _splitter+66, _toolbar_v, _window, _topLeft },
		Event { "docset", "" },			Sequence{}, Click { 1, _splitter+150, _toolbar_v, _window, _topLeft }, ResSubslate { resid_refDocset }, endSequence{},
		Event { "breadcrumbs", "" },	Subslate { "breadcrumbs" },
			ExitEvent { "okay", "" },	Click { 1, 0, 0, _cursor },
			ExitEvent { "exit", "" },	NilAction{},
			Event { "one", "" },	Click { 0, _bc_left+0*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "two", "" },	Click { 0, _bc_left+1*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "three", "" },	Click { 0, _bc_left+2*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "four", "" },	Click { 0, _bc_left+3*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "five", "" },	Click { 0, _bc_left+4*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "six", "" },	Click { 0, _bc_left+5*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "seven", "" },	Click { 0, _bc_left+6*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "eight", "" },	Click { 0, _bc_left+7*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "nine", "" },	Click { 0, _bc_left+8*_bc_sp, _toolbar_v, _window, _topLeft },
			Event { "ten", "" },	Click { 0, _bc_left+9*_bc_sp, _toolbar_v, _window, _topLeft },
			endSubslate{},
		Event { "index frame", "" },	Click { 1, _splitter+14, -27, _window, _bottomLeft },
		Event { "main frame", "" },		Click { 1, -21, -40, _window, _bottomRight },
		Event { "next page", "" },		Click { 1, -60, -154, _window, _bottomRight },
		Event { "previous page", "" },	Click { 1, -120, -154, _window, _bottomRight },
		_OrgPanelRows_,
		Event { "main links", "" },				Subslate { "mainLinks" },
			_SlateGlobals_,
			ExitEvent { "okay", "" },			Click { 1, 0, 0, _cursor },
			ExitEvent { "cancel", "" },			NilAction{},
			Event { "north", "" },				Click { 0, 0, -10, _cursor },
			Event { "down", "" },				Click { 0, 0, 10, _cursor },
			Event { "left", "" },				Click { 0, -50, 0, _cursor },
			Event { "right", "" },				Click { 0, 50, 0, _cursor },
			Event { "row one", "" },			Click { 0, _mainlinks_h, _mainlinks_v+0*_mainlinks_sp, _window, _topLeft },
			Event { "row two", "" },			Click { 0, _mainlinks_h, _mainlinks_v+1*_mainlinks_sp, _window, _topLeft },
			Event { "row three", "" },			Click { 0, _mainlinks_h, _mainlinks_v+2*_mainlinks_sp, _window, _topLeft },
			Event { "row four", "" },			Click { 0, _mainlinks_h, _mainlinks_v+3*_mainlinks_sp, _window, _topLeft },
			Event { "row five", "" },			Click { 0, _mainlinks_h, _mainlinks_v+4*_mainlinks_sp, _window, _topLeft },
			Event { "row six", "" },			Click { 0, _mainlinks_h, _mainlinks_v+5*_mainlinks_sp, _window, _topLeft },
			Event { "row seven", "" },			Click { 0, _mainlinks_h, _mainlinks_v+6*_mainlinks_sp, _window, _topLeft },
			Event { "row eight", "" },			Click { 0, _mainlinks_h, _mainlinks_v+7*_mainlinks_sp, _window, _topLeft },
			Event { "row nine", "" },			Click { 0, _mainlinks_h, _mainlinks_v+8*_mainlinks_sp, _window, _topLeft },
			Event { "row ten", "" },			Click { 0, _mainlinks_h, _mainlinks_v+9*_mainlinks_sp, _window, _topLeft },
			Event { "row eleven", "" },			Click { 0, _mainlinks_h, _mainlinks_v+10*_mainlinks_sp, _window, _topLeft },
			Event { "row twelve", "" },			Click { 0, _mainlinks_h, _mainlinks_v+11*_mainlinks_sp, _window, _topLeft },
			Event { "row thirteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+12*_mainlinks_sp, _window, _topLeft },
			Event { "row fourteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+13*_mainlinks_sp, _window, _topLeft },
			Event { "row fifteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+14*_mainlinks_sp, _window, _topLeft },
			Event { "row sixteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+15*_mainlinks_sp, _window, _topLeft },
			Event { "row seventeen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+16*_mainlinks_sp, _window, _topLeft },
			Event { "row eighteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+17*_mainlinks_sp, _window, _topLeft },
			Event { "row nineteen", "" },		Click { 0, _mainlinks_h, _mainlinks_v+18*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty", "" },			Click { 0, _mainlinks_h, _mainlinks_v+19*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty one", "" },		Click { 0, _mainlinks_h, _mainlinks_v+20*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty two", "" },		Click { 0, _mainlinks_h, _mainlinks_v+21*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty three", "" },	Click { 0, _mainlinks_h, _mainlinks_v+22*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty four", "" },	Click { 0, _mainlinks_h, _mainlinks_v+23*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty five", "" },	Click { 0, _mainlinks_h, _mainlinks_v+24*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty six", "" },		Click { 0, _mainlinks_h, _mainlinks_v+25*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty seven", "" },	Click { 0, _mainlinks_h, _mainlinks_v+26*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty eight", "" },	Click { 0, _mainlinks_h, _mainlinks_v+27*_mainlinks_sp, _window, _topLeft },
			Event { "row twenty nine", "" },	Click { 0, _mainlinks_h, _mainlinks_v+28*_mainlinks_sp, _window, _topLeft },
			Event { "row thirty", "" },			Click { 0, _mainlinks_h, _mainlinks_v+29*_mainlinks_sp, _window, _topLeft },
			Event { "row thirty one", "" },		Click { 0, _mainlinks_h, _mainlinks_v+30*_mainlinks_sp, _window, _topLeft },
			Event { "row thirty two", "" },		Click { 0, _mainlinks_h, _mainlinks_v+31*_mainlinks_sp, _window, _topLeft },
			Event { "row thirty three", "" },	Click { 0, _mainlinks_h, _mainlinks_v+32*_mainlinks_sp, _window, _topLeft },
			Event { "row thirty four", "" },	Click { 0, _mainlinks_h, _mainlinks_v+33*_mainlinks_sp, _window, _topLeft },
			Event { "row thirty five", "" },	Click { 0, _mainlinks_h, _mainlinks_v+34*_mainlinks_sp, _window, _topLeft },
			endSubslate{},
	} }
} };

#pragma mark 8 ===

#define _rtop	142
#define _rsp	18
#define	_targetPopup	Click { 1, 125, 40, _window, _topLeft }
#pragma mark Target
resource restype_Slate (resid_Target, "Target") { {
	Slate { "Target",	{
		_SlateGlobals_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeXcodeSlate_,
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },	
		Event { "test", "" },			Keypress { kc_U, mf_command },
		Event { "analyze", "" },		Keypress { kc_B, mf_command + mf_shift },
		Event { "build", "" },			Keypress { kc_B, mf_command },
		Event { "run", "" },			Sequence{}, Keypress { kc_R, mf_command }, ResSubslate { resid_RunTarget },endSequence{},
		Event { "debug", "" },			ResSubslate { resid_Debug },
		Event { "clean", "" },			Keypress { kc_K, mf_command + mf_shift },
		Event { "click back", "" },		Click { 1, -500, 40, _window, _topRight },
		Event { "scheme", "" },			Sequence{}, _targetPopup, ResSubslate { resid_TargetScheme }, endSequence{},
		Event { "pop up", "" },			_targetPopup,
		Event { "go next", "" },		_goNext,
		Event { "go previous", "" },	_goPrevious,
		Event { "Xcode", "" },			Sequence{}, _targetPopup, TypeText { "Xcode" }, _down, _return, endSequence{},
		Event { "Setup", "" },			Sequence{}, _targetPopup, TypeText { "CCDev_Setup" }, _down, _return, endSequence{},
		Event { "C C Dev", "" },		Sequence{}, _targetPopup, TypeText { "CCDev" }, _down, _return, endSequence{},
		Event { "Accessor", "" },		Sequence{}, _targetPopup, TypeText { "Accessor" }, _down, _return, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, _targetPopup, TypeText { "Doxygen" }, _down, _return, endSequence{},
		Event { "C doc", "" },			Sequence{}, _targetPopup, TypeText { "Cdoc" }, _down, _return, endSequence{},
	} }
} };

resource restype_Slate (resid_RunTarget, "") { {
	Slate { "RunTarget",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "quit", "" },		Keypress { kc_Q, mf_command },
		_WhitespaceKeys_,
		Event { "type", "" },			ResSubslate { resid_TypeSlate },
	} }
} };

resource restype_Slate (resid_TargetScheme, "") { {
	Slate { "TargetScheme",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },	Keypress { kc_escape, 0 },
		ExitEvent { "okay", "" },	Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },	NilAction{},
		ExitEvent { "edit", "" },	Sequence{}, TypeText { "Edit Scheme" }, _down, _return, endSequence{},
		Event { "manage", "" },		Sequence{}, TypeText { "Manage Schemes" }, _down, _return, endSequence{},
		Event { "shared", "" },		Click { 1, 284, 0, _cursor },
		Event { "show", "" },		Click { 1, -284, 0, _cursor },
		Event { "Xcode", "" },			Sequence{}, TypeText { "Xcode" }, _down, _return, endSequence{},
		Event { "Setup", "" },			Sequence{}, TypeText { "CCDev_Setup" }, _down, _return, endSequence{},
		Event { "C C Dev", "" },		Sequence{}, TypeText { "CCDev" }, _down, _return, endSequence{},
		Event { "Accessor", "" },		Sequence{}, TypeText { "Accessor" }, _down, _return, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, TypeText { "Doxygen" }, _down, _return, endSequence{},
		Event { "C doc", "" },			Sequence{}, TypeText { "Cdoc" }, _down, _return, endSequence{},
		Event { "row one", "" },	Click { 0, 0, 150+(1*_rsp), _window, _topCenter },
		Event { "row two", "" },	Click { 0, 0, 150+(2*_rsp), _window, _topCenter },
		Event { "row three", "" },	Click { 0, 0, 150+(3*_rsp), _window, _topCenter },
		Event { "row four", "" },	Click { 0, 0, 150+(4*_rsp), _window, _topCenter },
		Event { "row five", "" },	Click { 0, 0, 150+(5*_rsp), _window, _topCenter },
		Event { "row six", "" },	Click { 0, 0, 150+(6*_rsp), _window, _topCenter },
		Event { "row seven", "" },	Click { 0, 0, 150+(7*_rsp), _window, _topCenter },
		Event { "row eight", "" },	Click { 0, 0, 150+(8*_rsp), _window, _topCenter },
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
			Click { 1, splitter_x+105, 75, _pwindow, _topLeft }, _down, _return,
			endSequence{},
		Event { "check copyright", "" },		Sequence{},
			Keypress { kc_F, mf_command }, TypeText { "C & C Software" }, Keypress { kc_return, 0 }, _left, _left,
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
			TypeText { "Workspace-r54" },
			endSequence{},
		Event { "two", "temp" },				Sequence{},
			TypeText { "Users/Shared/Cdoc" },
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

#pragma mark 9 === Xcode

#define	topRow_		83
#define	rowHt_		17

resource restype_Slate (resid_Xcode, "Xcode Slate") { {
	Slate { "Xcode",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeXcodeSlate_,
		_XcodeStandards_,
		Event { "window", "" },			Subslate { "window" },
			_WindowItems_,
			endSubslate{},
		Event { "Browser", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},
		Event { "Doxygen", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_BrowseDoxygen }, endSequence{},
		Event { "focus", "" },			Keypress { kc_period, mf_command + mf_option },
		Event { "focus next", "" },		Keypress { kc_period, mf_command + mf_option },
		Event { "focus back", "" },		Keypress { kc_period, mf_command + mf_option + mf_shift },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "target", "" },			ResSubslate { resid_Target },
		Event { "nav list", "" },		_navList,
		Event { "navigate", "" },		ResSubslate { resid_Navigate },
		Event { "top row", "" },		_topRow,
		Event { "filter", "" },			ResSubslate { resid_NavFilter },
		Event { "standard", "" },			Keypress { kc_return, mf_command },
		Event { "standard edit", "" },		Sequence{}, Keypress { kc_return, mf_command }, ResSubslate { resid_edStandard }, endSequence{},
		Event { "standard project", "" },	Sequence{}, Keypress { kc_return, mf_command }, _showHideNavigator, ResSubslate { resid_edProject }, endSequence{},
		Event { "standard issues", "" },	Sequence{}, Keypress { kc_return, mf_command }, Keypress { kc_4, mf_command }, ResSubslate { resid_edIssues }, endSequence{},	
		Event { "standard log", "" },		Sequence{}, Keypress { kc_return, mf_command }, Keypress { kc_7, mf_command }, ResSubslate { resid_edLog }, _topRow, endSequence{},	
		Event { "assistant", "" },			Sequence{}, Keypress { kc_return, mf_command + mf_option }, ResSubslate { resid_edAssistant }, endSequence{},
		Event { "version", "" },			Sequence{}, Keypress { kc_return, mf_command + mf_option + mf_shift }, ResSubslate { resid_edVersion }, endSequence{},
		Event { "utility", "" },		ResSubslate { resid_Utilities },
		Event { "Organizer", "" },		Sequence{}, Keypress { kc_2, mf_command + mf_shift },
			ResSubslate { resid_Organizer }, endSequence{},
		Event { "Repositories", "" },	ResSubslate { resid_Repositories },
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "hide find bar", "" },	_hideFindBar,
		Event { "go next", "tab" },		_goNext,
		Event { "go previous", "tab" },	_goPrevious,
		Event { "panel", "" },			ResSubslate { resid_Panel },
		_JumpBar_,
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _pwindow, _topLeft }, Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
		Event { "reveal", "" },			Keypress { kc_L, mf_command },
		Event { "context menu", "" },	ClickMod { 1, 0, 0, _cursor, mf_control },
		Event { "Terminal", "" },		Sequence{}, ResSubslate { resid_XCTerminal }, Launch { Apps_"Utilities/Terminal.app", 0 }, endSequence{},
		Event { "Validate", "" },		Sequence{}, ResSubslate { resid_BBValidate }, Launch { Apps_"BBEdit.app", 0 }, endSequence{},
		Event { "Menu", "access menus" },
			Subslate { "Menu" },
				_SlateGlobals_,
				_CloseSubslate_,
				Event { "File", "'File' menu" }, Sequence{}, _clickFile, _down, ResSubslate { resid_FileMenu }, endSequence{},
				Event { "Edit", "'Edit' menu" }, Sequence{},
					ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
				ExitEvent { "Edit", "" }, ClickMenu { "Edit" },
				ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
				ExitEvent { "Find", "'Find' menu" }, ClickMenu { "Find" },
				Event { "Design", "'Design' menu" }, Sequence{},
					ClickMenu { "Design" }, _down, ResSubslate { resid_DesignMenu }, endSequence{},
				ExitEvent { "Build", "'Build' menu" }, ClickMenu { "Build" },
				ExitEvent { "Subversion", "'Version' menu" }, ClickMenu { "SCM" },
				ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
				endSubslate{},
		Event { "File", "'File' menu" }, Sequence{}, _clickFile, _down, ResSubslate { resid_FileMenu }, endSequence{},
		Event { "Source Control", "'Source Control' menu" }, Sequence{}, ClickMenu { "File" }, _down, TypeText { "Source Control" }, _right, ResSubslate { resid_SourceControl }, endSequence{},
		Event { "Edit Menu", "'Edit' menu" }, Sequence{},
			ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
		Event { "Script", "" },			Sequence{}, _scriptsMenu, ResSubslate { resid_Scripts }, endSequence{}, 
		Event { "Accessor", "" },		Sequence{}, Keypress { kc_S, mf_command + mf_option }, Launch { Dev_"AccessorC9/AccessorC9.xcworkspace", 0 }, ResSubslate { resid_Accessor }, endSequence{},
		Event { "Refactor", "" },		Sequence{},
			ClickMenu { "Edit" }, _down, TypeText { "Refactor" }, _return, ResSubslate { resid_Refactor }, endSequence{},
		Event { "Data Model", "" },		ResSubslate { resid_DataModel },
		Event { "Workspace", "" },		ResSubslate { resid_Workspace },
		Event { "Search", "" },			ResSubslate { resid_Search },
		Event { "Debug", "" },			ResSubslate { resid_Debug },
		Event { "save files", "" },		Keypress { kc_S, mf_command + mf_option },
		Event { "Modelling", "" },		Sequence{},
			Keypress { kc_tab, mf_command },
			ResSubslate { resid_UMLetSubslate },
			endSequence{},
		Event { "Snapshots", "" },	Sequence{},
			ClickMenu { "File" }, _down, TypeText { "Snapshots" }, _return, ResSubslate { resid_Snapshots },
			endSequence{},
		Event { "run slate", "" },			ResSubslate { resid_RunSlate },
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
*/

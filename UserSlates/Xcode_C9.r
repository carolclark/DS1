// =================================================================================
//	Xcode_C9.r					©2006-11 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define _pwindow		window, "1"

#pragma mark 0 === Top
#define splitter_x		255
#define	_previous		Keypress { kc_slash, mf_control + mf_shift },

/* resid_ */
#define resid_Browser				resid_Xcode+1
#define resid_TypeSpecialXcodeSlate	resid_Xcode+2
#define resid_TypeXcodeSlate		resid_Xcode+3
#define	resid_InsertElement			resid_Xcode+4
#define	resid_InsertStyle			resid_Xcode+5
#define	resid_InsertTag				resid_Xcode+6
#define resid_Dictate				resid_Xcode+7
#define resid_Workspace				resid_Xcode+8
#define resid_Find					resid_Xcode+9
#define resid_FindMultiple			resid_Xcode+10
	#define resid_SearchIn				resid_FindMultiple+1
#define resid_RunSlate				resid_Xcode+12
#define resid_Debug					resid_Xcode+13
#define resid_Snapshots				resid_Xcode+14
#define resid_Identifier			resid_Xcode+16

#define resid_JumpBar				resid_Xcode+30
	#define resid_jumpPopup				resid_JumpBar+1

#define resid_FileMenu				resid_Xcode+40
	#define resid_NewFile				resid_FileMenu+1
	#define resid_AddFiles				resid_FileMenu+2
	#define resid_SourceControl			resid_FileMenu+3

#define resid_firstFileDialog		resid_Xcode+50
	#define resid_FileDlgRepos			resid_firstFileDialog+0
	#define resid_FileDlgStd			resid_firstFileDialog+1

#define resid_SelectTargets			resid_Xcode+60	

#define resid_EditMenu				resid_Xcode+70

#define resid_ProjectMenu			resid_Xcode+80

#define resid_DesignMenu			resid_Xcode+90
	#define	resid_TypeDesign			resid_DesignMenu+1
	#define resid_DataModel				resid_DesignMenu+2

#define resid_Navigate				resid_Xcode+300
	#define resid_navFiles				resid_Navigate+10
		#define resid_navProject			resid_navFiles+1
			#define resid_navAddTarget			resid_navProject+1
			#define resid_navAddPhase			resid_navProject+2
	#define resid_navSymbol				resid_Navigate+20
	#define resid_navSearch				resid_Navigate+30
	#define resid_navIssue				resid_Navigate+40
	#define resid_navDebug				resid_Navigate+50
	#define resid_navBreakpoint			resid_Navigate+60
	#define resid_navLog				resid_Navigate+70

	#define resid_firstOpenPhase		resid_Navigate+80
		#define resid_phaseRunScript		resid_firstOpenPhase+1

#define resid_Organizer				resid_Xcode+400
	#define resid_Repositories			resid_Organizer+10
		#define resid_AddRepository			resid_Repositories+1
		#define resid_Update				resid_Repositories+2
		#define resid_Commit				resid_Repositories+3
		#define resid_SwitchBranch			resid_Repositories+4

#define resid_Editor				resid_Xcode+450
	#define resid_edStandard			resid_Editor+00
	#define resid_edAssistant			resid_Editor+10
	#define resid_edVersion				resid_Editor+20

#define resid_Refactor				resid_Xcode+500
	#define resid_RefactorHelp			resid_Refactor+15

#define	resid_GHTest				resid_Xcode+550

#define resid_Doxygen				resid_Xcode+600
	#define resid_BrowseDoxygen			resid_Doxygen+1

#define resid_Macro					resid_Xcode+700

/* todo */
#define resid_Documentation				resid_Xcode+800
	#define resid_refDocset					resid_Documentation+1
	#define resid_refBookmarks				resid_Documentation+2
	#define resid_refSearch					resid_Documentation+10
		#define resid_refSearchResults			resid_refSearch+1

#define resid_TargetPopup			resid_Xcode+910

#define closeDocument_	\
	Event { "close document", "" },	Keypress { kc_W, mf_command + mf_control },

#define	_next		Keypress { kc_slash, mf_control }
#define	_previous	Keypress { kc_slash, mf_control + mf_shift }
#define clickFile_	Click { 1, 126, 10, _screen, _topLeft }
#define navList_	Click { 1, 30, -30, _window, _bottomLeft }
#define targetPopup_								\
	Event { "target", "" },			Sequence{},		\
		Click { 1, 125, 40, _pwindow, _topLeft },		\
		ResSubslate { resid_TargetPopup },				\
		endSequence{}

#define goToReference_							\
		Event { "go to reference", "" },	Sequence{},					\
			Keypress { kc_slash, mf_command + mf_option + mf_control },	\
			ResSubslate { resid_Documentation },							\
			endSequence{}

#define	_showHideNavigator	Keypress { kc_0, mf_command }
#define nextPanel_		Event { "next panel", "" },		Keypress { kc_tab, mf_control }
#define previousPanel_	Event { "previous panel", "" },	Keypress { kc_tab, mf_control + mf_shift }

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
		ExitEvent { "mark spot", "" },				TypeText { "<##>" },
		ExitEvent { "where", "" },					TypeText { "_WHERE_" },
		ExitEvent { "test actual", "" },			TypeText { "@\"actual: %@ (%@)\", <#arg#>, _WHERE_);" };
		ExitEvent { "resource id", "" },			TypeText { "resid_" },
		ExitEvent { "in use development", "" },		TypeText { "in-use development" },
		ExitEvent { "end event", "" },				Sequence{},
			_quote, TypeText { ", " }, _quote, _quote, Keypress { kc_space, 0 }, Keypress { kc_closebracket, mf_shift }, 
			Keypress { kc_comma, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "web extension", "" },			TypeText { ".html" },		
		ExitEvent { "Xcode selection", "" },		TypeText { "%%%{PBXSelection}%%%" },
		ExitEvent { "empty", "" },					TypeText { "&lt;empty&gt;" },
		ExitEvent { "string", "" },					Sequence{}, TypeText { "@\"\"" }, Keypress { kc_left, 0 }, endSequence{},
		ExitEvent { "format", "" },					TypeText { "@\"%@\"" },
		ExitEvent { "next name", "" },				Sequence{},
			Keypress { kc_right, 0 }, Keypress { kc_down, mf_shift + mf_command }, Keypress { kc_9, mf_command }, Keypress { kc_J, mf_command },
			endSequence{},
		ExitEvent { "life cycle", "" },				TypeText { "Life Cycle" },
		ExitEvent { "less than", "" },				TypeText { "&lt;" },
		ExitEvent { "greater than", "" },			TypeText { "&gt;" },
		ExitEvent { "goal table", "" },				Sequence{},
			TypeText { "<div class=" }, _quote, TypeText { "tableholder" }, _quote,
			TypeText { "><table class=" }, _quote, TypeText { "goaltabl" }, _quote, 
			TypeText { " border=" }, _quote, TypeText { "0" }, _quote,
			TypeText { " cellspacing=" }, _quote, TypeText { "0" }, _quote,
			TypeText { " cellpadding=" },  _quote, TypeText { "5" }, _quote,
			TypeText { "><caption><#caption#></caption><tr><th>Topic</th> <th>Goal</th> <th>Expansion</th> <th>When</th></tr>" },
			_return, TypeText { "</table></div>" }, _return,
			Keypress { kc_slash, mf_control }, endSequence{},
		ExitEvent { "Use Case", "" },				Subslate { "Use Case" },
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
	Event { "go back", "" },		Keypress { kc_left, mf_shift + mf_command + mf_option },	\
	Event { "step back", "" },		Keypress { kc_left, mf_command + mf_option },				\
	Event { "go forward", "" },		Keypress { kc_right, mf_shift + mf_command + mf_option },	\
	Event { "step forward", "" },	Keypress { kc_right, mf_command + mf_option },				\
	_JumpBar_,		\
	closeDocument_,	\
	Event { "page top", "" },	Keypress { kc_home, 0 },	\
	Event { "page end", "" },	Keypress { kc_end, 0 },	\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	Event { "next field", "" },	Keypress { kc_slash, mf_control },	\
	Event { "previous field", "" },	Keypress { kc_slash, mf_control + mf_shift },	\
	Event { "goto line", "" },	Keypress { kc_L, mf_command },	\
	Event { "select word", "" },	Keypress { kc_O, mf_control },	\
	Event { "select line", "" },	Keypress { kc_M, mf_control },	\
	Event { "capitalize", "" },	Keypress { kc_C, mf_control + mf_shift },	\
	Event { "lowercase", "" },	Keypress { kc_L, mf_control + mf_shift },	\
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
	Event { "choose previous", "" }, Subslate { "prev" },		\
		Event { "one", "" }, _down,	\
		Event { "two", "" }, Sequence{}, _up, _up, endSequence{},	\
		Event { "three", "" }, Sequence{}, _up, _up, _up, endSequence{},	\
		Event { "four", "" }, Sequence{}, _up, _up, _up, _up , endSequence{},	\
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

resource restype_Slate (resid_Identifier, "") { {
	Slate { "Identifier", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Dev Support", "" },	TypeText { "DS" },
		ExitEvent { "Carbon 9", "" },		TypeText { "C9" },
		ExitEvent { "Penguin", "" },		TypeText { "PN" },
		ExitEvent { "MyLibrary", "" },		TypeText { "ML" },
		ExitEvent { "Cocoa", "" },			TypeText { "NS" },
		ExitEvent { "Prototype", "" },		TypeText { "AP" },
		ExitEvent { "FileMaker", "" },		TypeText { "FM" },
	} }
} };

#pragma mark Dictate
resource restype_Slate (resid_Dictate, "Dictate") { {
	Slate { "Dictate",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			NilAction{},
		ExitEvent { "go back", "" },		Launch { DevApps_"XCode.app", 0 },
		ExitEvent { "cut back", "" },		Sequence{}, Keypress { kc_A, mf_command }, Keypress { kc_X, mf_command }, 
			Launch { DevApps_"XCode.app", 0 }, endSequence{},
		Event { "microphone off", "and hide recognition window" },	_CloseRecognitionWindow_,
		Event { "microphone on", "" },
			Sequence{}, Click { 1, -230, 74, _screen, _topRight }, ResSubslate { resid_DictateSlate },
			endSequence{},
		Event { "recognition window", "" },	_CloseRecognitionWindow_,
		Event { "go to sleep", "" },		NilAction{},
	} }
} };

#define _cutNextLine	Keypress { kc_right, mf_command }, Keypress { kc_right, 0 },	\
	Keypress { kc_right, mf_command + mf_shift }, Keypress { kc_X, mf_command }
resource restype_Slate (resid_TypeXcodeSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "dictate", "" },		Sequence{},
			Launch { MainApps_"Dragon Dictate.app", 0 }, ResSubslate { resid_Dictate }, endSequence{},
		Event { "Identifier", "" },		ResSubslate { resid_Identifier },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		_JumpBar_,
		Event { "hard return", "" },	Keypress { kc_return, mf_control },
		Event { "breakpoints", "" },	Click { 1, -100, 75, _pwindow, _topRight },
		Event { "counterpart", "" },	Click { 1, -27, 75, _pwindow, _topRight },
		Event { "includes", "" },		Click { 1, -50, 75, _pwindow, _topRight },
		Event { "Edit Menu", "'Edit' menu" }, ResSubslate { resid_EditMenu },
		Event { "cut next line", "" },	Sequence{}, _cutNextLine, endSequence{},
		Event { "exec line", "" },		Sequence{},
			Keypress { kc_right, mf_command },
			Keypress { kc_left, mf_command + mf_shift },
			Keypress { kc_R, mf_control },
			endSequence{},
		Event { "Insert Element", "" },		ResSubslate { resid_InsertElement },
		Event { "Element", "" },		ResSubslate { resid_InsertElement },
		Event { "Add Style", "" },			ResSubslate { resid_InsertStyle },
		Event { "Insert Tag", "" },			ResSubslate { resid_InsertTag },
		Event { "hide bubbles", "" },		Keypress { kc_H, mf_shift + mf_option + mf_command },
		Event { "select exec", "click the Active Executable popup" }, Click { 1, 315, 40, _pwindow, _topLeft },
		Event { "error icon", "click the error/warning icon" }, Click { 1, -32, -11, _pwindow, _bottomRight },
		Event { "mark cells", "" },	Subslate { "mark cells" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "bullet", "" },			Sequence{}, TypeText { "&bull;" }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "disabled", "" },		Sequence{}, TypeText { "<span class='gray'>&bull;</span>" }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "minus sign", "" },		Sequence{}, Keypress { kc_minus, 0 }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "not applicable", "" },	Sequence{}, TypeText { "n/a" }, Keypress { kc_slash, mf_control }, endSequence{},
			Event { "question", "" },		Sequence{}, Keypress { kc_slash, mf_shift }, Keypress { kc_slash, mf_control }, endSequence{},
			endSubslate{},
		Event { "show selection", "" },		Keypress { kc_J, mf_command },
		Event { "go to definition", "" },	Keypress { kc_D, mf_command + mf_shift },
		goToReference_,
		Event { "save files", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialXcodeSlate },
		Event { "Doxygen", "" },			ResSubslate { resid_Doxygen },
		_TypeXcodeItems_
	} }
} };

#pragma mark 8 === HTML
#pragma mark InsertElement
resource restype_Slate (resid_InsertElement, "") { {
	Slate { "Element",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_ElementItems_,
	} }
} };

#pragma mark Styles
resource restype_Slate (resid_InsertStyle, "css Styles") { {
	Slate { "Style",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_StyleItems_,
	} }
} };

resource restype_Slate (resid_InsertTag, "Markup Menu") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		_TagItems_,
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
		ExitEvent { "Carbon", "" },			Launch { Dev_"Accessor_C9/Accessor_C9.xcodeproj", 0 },
		ExitEvent { "Punkin", "" },			Launch { Dev_"Punkin/Punkin.xcworkspace", 0 },
		ExitEvent { "Support", "" },		Launch { Dev_"Support/Support.xcworkspace", 0 },
		ExitEvent { "old Support", "" },	Launch { Dev_"Support_svn/Support_svn.xcworkspace", 0 },
		ExitEvent { "Dev Support", "" },	Launch { Dev_"DevSupport/DevSupport.xcodeproj", 0 },
	} }
} };

#pragma mark 2 === Test and Debug
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
resource restype_Slate (resid_Debug, "Xcode Debugging") { {
	Slate { "Debug",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "panel", "" },			Keypress { kc_Y, mf_command + mf_shift },
		Event { "over", "" },			Keypress { kc_U, mf_command },
		Event { "in", "" },				Keypress { kc_I, mf_command },
		Event { "finish", "step out" },	Keypress { kc_P, mf_command },
/* todo */
		Event { "continue", "" },		Keypress { kc_P, mf_command + mf_option },
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "stack", "" },			Click { 1, 110, 107, _pwindow, _topLeft },
		Event { "variables", "" },		Click { 1, -110, 107, _pwindow, _topRight },
		Event { "breakpoints", "" },	Click { 1, -90, 50, _pwindow, _topRight },
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DirectionKeys_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		_TypeXcodeSlate_,
		_CommandSlate_
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
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_control },
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
#define _toprow	120
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
		Event { "row one", "" },		Click { 0, _rowx, _toprow+0*_rsp, _window, _topLeft },
		Event { "row two", "" },		Click { 0, _rowx, _toprow+1*_rsp, _window, _topLeft },
		Event { "row three ", "" },		Click { 0, _rowx, _toprow+2*_rsp, _window, _topLeft },
		Event { "row four", "" },		Click { 0, _rowx, _toprow+3*_rsp, _window, _topLeft },
		Event { "row five", "" },		Click { 0, _rowx, _toprow+4*_rsp, _window, _topLeft },
		Event { "row six", "" },		Click { 0, _rowx, _toprow+5*_rsp, _window, _topLeft },
		Event { "row seven", "" },		Click { 0, _rowx, _toprow+6*_rsp, _window, _topLeft },
		Event { "row eight", "" },		Click { 0, _rowx, _toprow+7*_rsp, _window, _topLeft },
		Event { "row nine", "" },		Click { 0, _rowx, _toprow+8*_rsp, _window, _topLeft },
		Event { "row ten", "" },		Click { 0, _rowx, _toprow+9*_rsp, _window, _topLeft },
		Event { "row eleven", "" },		Click { 0, _rowx, _toprow+10*_rsp, _window, _topLeft },
		Event { "row twelve", "" },		Click { 0, _rowx, _toprow+11*_rsp, _window, _topLeft },
		Event { "row thirteen", "" },	Click { 0, _rowx, _toprow+12*_rsp, _window, _topLeft },
		Event { "row fourteen", "" },	Click { 0, _rowx, _toprow+13*_rsp, _window, _topLeft },
		Event { "row fifteen", "" },	Click { 0, _rowx, _toprow+14*_rsp, _window, _topLeft },
		Event { "row sixteen", "" },	Click { 0, _rowx, _toprow+15*_rsp, _window, _topLeft },
		Event { "row seventeen", "" },	Click { 0, _rowx, _toprow+16*_rsp, _window, _topLeft },
		Event { "row eighteen", "" },	Click { 0, _rowx, _toprow+17*_rsp, _window, _topLeft },
		Event { "row nineteen", "" },	Click { 0, _rowx, _toprow+18*_rsp, _window, _topLeft },
		Event { "row twenty", "" },		Click { 0, _rowx, _toprow+19*_rsp, _window, _topLeft },
		Event { "row twenty one", "" },		Click { 0, _rowx, _toprow+20*_rsp, _window, _topLeft },
		Event { "row twenty two", "" },		Click { 0, _rowx, _toprow+21*_rsp, _window, _topLeft },
		Event { "row twenty three", "" },	Click { 0, _rowx, _toprow+22*_rsp, _window, _topLeft },
		Event { "row twenty four", "" },	Click { 0, _rowx, _toprow+23*_rsp, _window, _topLeft },
		Event { "row twenty five", "" },	Click { 0, _rowx, _toprow+24*_rsp, _window, _topLeft },
	} }
} };

#pragma mark 4 === Standard Menus
#pragma mark File Menu
#define _FileDialogStandards_	\
	_SlateGlobals_,				\
	Event { "go to folder", "" },	ResSubslate { resid_GoToFolder },                        \
	ExitEvent { "exit", "" },		NilAction{},                                                \
	ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },                       \
	ExitEvent { "okay", "" },		_return,                                                    \
	Event { "location", "" },		Click { 1, 0, 115, _pwindow, _topCenter },      \
	Event { "filter", "" },			Click { 1, 200, 115, _pwindow, _topCenter },      \
	Event { "navigate", "" },		Sequence{}, Click { 1, 200, 115, _pwindow, _topCenter }, _tab, _tab, endSequence{},      \
	Event { "go back", "" },		Click { 1, -246, 115, _pwindow, _topCenter },         \
	Event { "go forward", "" },		Click { 1, -220, 115, _pwindow, _topCenter },      \
	Event { "icons", "" },			Keypress { kc_1, mf_command },					\
	Event { "list", "" },			Keypress { kc_2, mf_command },					\
	Event { "panel", "" },			Keypress { kc_3, mf_command },					\
	Event { "new folder", "" },		Click { 1, -200, 585, _pwindow, _topCenter },      \
	_DirectionKeys_,                                                                       \
	_CommandSlate_,                                                                        \
	_WhitespaceKeys_,                                                                      \
	_JumpNorthSubslate_,                                                                   \
	_JumpDownSubslate_,                                                                    \
	_LetterKeys_,                                                                          \
	_IMouseSlate_,																		\
	_DoSelectSubslate_,																	\
	_TypeXcodeSlate_

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
		ExitEvent { "new group", "" },			Keypress { kc_N, mf_command + mf_option },
		ExitEvent { "new tab", "" },			Keypress { kc_T, mf_command },
		ExitEvent { "close window", "" },		Keypress { kc_W, mf_command + mf_shift },
		ExitEvent { "close tab", "" },			Keypress { kc_W, mf_command },
		ExitEvent { "close document", "" },		Keypress { kc_W, mf_command + mf_control },
		ExitEvent { "close workspace", "" },	Keypress { kc_W, mf_command + mf_option },
		ExitEvent { "Save All", "" },			Keypress { kc_S, mf_command + mf_option },
		ExitEvent { "Open External", "" },		Sequence{}, TypeText { "Open with External Editor" }, _return, endSequence{},
		Event { "Open AppleScript", "" },		Sequence{}, TypeText { "Open with External Editor" }, _return, Launch { Apps_"Utilities/AppleScript Editor.app", resid_ScriptEditor }, endSequence{},
		Event { "add files", "" },				Sequence{}, Keypress { kc_A, mf_command + mf_option }, ResSubslate { resid_AddFiles }, endSequence{},
		Event { "Source Control", "'Source Control' menu" }, Sequence{},
			TypeText { "Source Control" }, _right, ResSubslate { resid_SourceControl }, endSequence{},
	} }
} };

#define _fnewFilter		Click { 1, 200, 176, _window, _topCenter }
#define tg_h	-72
#define	tg_t	386
#define	tg_s	19
#define _FileNewStandards_		\
	_SlateGlobals_,		\
	ExitEvent { "exit", "" },	NilAction{},		\
	ExitEvent { "cancel", "" },	Keypress { kc_period, mf_command },		\
	ExitEvent { "okay", "" },	Keypress { kc_return, 0 },		\
	Event { "tab", "" },		_tab,		\
	Event { "tab back", "" },	Keypress { kc_tab, mf_shift },		\
	_DoJumpSubslate_,		\
	_JumpDownSubslate_,		\
	_JumpNorthSubslate_,		\
	_DirectionKeys_,		\
	_LetterKeys_,		\
	_CommandSlate_,		\
	_IMouseSlate_,		\
	_TypeXcodeSlate_,		\
	Event { "next", "" },		_return,		\
	Event { "previous", "" },	Click { 1, 205, 75, _window, _topCenter },		\
	Event { "filename", "" },	Click { 1, 0, 130, _window, _topCenter },		\
	Event { "location", "" },	Click { 1, 0, 180, _window, _topCenter },		\
	Event { "filter", "" },		_fnewFilter,		\
	Event { "navigate", "" },	Sequence{}, _fnewFilter, _tab, _tab, endSequence{},		\
	Event { "group", "" },		Click { 1, 0, 355, _window, _topCenter },		\
	Event { "target 1", "" },	Click { 1, tg_h, tg_t+0*tg_s, _window, _topCenter },		\
	Event { "target 2", "" },	Click { 1, tg_h, tg_t+1*tg_s, _window, _topCenter },		\
	Event { "target 3", "" },	Click { 1, tg_h, tg_t+2*tg_s, _window, _topCenter },		\
	Event { "target 4", "" },	Click { 1, tg_h, tg_t+3*tg_s, _window, _topCenter },		\
	Event { "target 5", "" },	Click { 1, tg_h, tg_t+4*tg_s, _window, _topCenter },		\
	Event { "new folder", "" },	Click { 1, -194, 517, _window, _topCenter }

resource restype_Slate (resid_NewFile, "New File") { {
	Slate { "New File", {
		_FileNewStandards_,
	} }
} };

/* todo */
#define _offsetleft	-152
#define	_toprow		276
#define _rsp		18
#define _headerHt 	0
resource restype_Slate (resid_AddFiles, "Add Files") { {
	Slate { "Add Files", {
		Event { "targets", "" },	ResSubslate { resid_SelectTargets },
		_FileDialogStandards_,
	} }
} };

#pragma mark SourceControl
resource restype_Slate (resid_SourceControl, "Source Control") { {
	Slate { "SourceControl", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },	Keypress { kc_escape, 0 },
		Event { "commit", "" },		Sequence{}, Keypress { kc_C, mf_command + mf_option }, ResSubslate { resid_Commit }, endSequence{},
		Event { "merge", "" },		TypeText { "merge" },
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
		nextPanel_,
		previousPanel_,
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

/* todo */
#define _headerHt	0
resource restype_Slate (resid_FileDlgStd, "File dlgStd") { {
	Slate { "File dlgStd", {
		_FileDialogStandards_,
	} }
} };

#define _headerHt	80
resource restype_Slate (resid_FileDlgRepos, "File dlgRepos") { {
	Slate { "File dlgRepos", {
		_FileDialogStandards_,
	} }
} };

#define _offset		-121
#define	_toprow		454
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
		Event { "row one", "" },		Click { 1, _offset, _toprow+0*_rsp, _pwindow, _topCenter },
		Event { "row two", "" },		Click { 1, _offset, _toprow+1*_rsp, _pwindow, _topCenter },
		Event { "row three", "" },		Click { 1, _offset, _toprow+2*_rsp, _pwindow, _topCenter },
		Event { "row four", "" },		Click { 1, _offset, _toprow+3*_rsp, _pwindow, _topCenter },
		Event { "row five", "" },		Click { 1, _offset, _toprow+4*_rsp, _pwindow, _topCenter },
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
#define	nb_r1	138
#define	nb_rsp	30
#define	_NavPanelRows_	\
	Event { "row one", "" },	Click { 1, nb_h, nb_r1 + 0 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row two", "" },	Click { 1, nb_h, nb_r1 + 1 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row three", "" },	Click { 1, nb_h, nb_r1 + 2 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row four", "" },	Click { 1, nb_h, nb_r1 + 3 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row five", "" },	Click { 1, nb_h, nb_r1 + 4 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row six", "" },	Click { 1, nb_h, nb_r1 + 5 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row seven", "" },	Click { 1, nb_h, nb_r1 + 6 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row eight", "" },	Click { 1, nb_h, nb_r1 + 7 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row nine", "" },	Click { 1, nb_h, nb_r1 + 8 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row ten", "" },	Click { 1, nb_h, nb_r1 + 9 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row eleven", "" },	Click { 1, nb_h, nb_r1 + 10 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twelve", "" },	Click { 1, nb_h, nb_r1 + 11 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row thirteen", "" },	Click { 1, nb_h, nb_r1 + 12 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row fourteen", "" },	Click { 1, nb_h, nb_r1 + 13 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row fifteen", "" },	Click { 1, nb_h, nb_r1 + 14 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row sixteen", "" },	Click { 1, nb_h, nb_r1 + 15 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row seventeen", "" },	Click { 1, nb_h, nb_r1 + 16 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row eighteen", "" },	Click { 1, nb_h, nb_r1 + 17 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row nineteen", "" },	Click { 1, nb_h, nb_r1 + 18 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty", "" },		Click { 1, nb_h, nb_r1 + 19 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty one", "" },	Click { 1, nb_h, nb_r1 + 20 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty two", "" },	Click { 1, nb_h, nb_r1 + 21 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty three", "" },	Click { 1, nb_h, nb_r1 + 22 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty four", "" },	Click { 1, nb_h, nb_r1 + 23 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty five", "" },	Click { 1, nb_h, nb_r1 + 24 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty six", "" },		Click { 1, nb_h, nb_r1 + 25 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty seven", "" },	Click { 1, nb_h, nb_r1 + 26 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty eight", "" },	Click { 1, nb_h, nb_r1 + 27 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row twenty nine", "" },	Click { 1, nb_h, nb_r1 + 28 * nb_rsp, _pwindow, _topLeft },	\
	Event { "row thirty", "" },			Click { 1, nb_h, nb_r1 + 29 * nb_rsp, _pwindow, _topLeft }

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

#pragma mark Navigate
resource restype_Slate (resid_Navigate, "Navigate") { {
	Slate { "nav", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		Event { "fix window", "" },	Sequence{}, Click { 0, 85, 10, _pwindow, _topLeft },		Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
		Event { "files", "" },	Sequence{}, Keypress { kc_1, mf_command },
			ResSubslate { resid_navFiles }, endSequence{},
		Event { "symbol", "" },		Keypress { kc_2, mf_command },
		Event { "search", "" },		Keypress { kc_3, mf_command },
		Event { "issue", "" },		Sequence{}, Keypress { kc_4, mf_command },
			ResSubslate { resid_navIssue }, endSequence{},
		Event { "debug", "" },		Keypress { kc_5, mf_command },
		Event { "breakpoint", "" },	Keypress { kc_6, mf_command },
		Event { "log", "" },		Keypress { kc_7, mf_command },
	} }
} };

#define	il_h	184
#define	il_r1	182
#define	il_rsp	30
#pragma mark Project
resource restype_Slate (resid_navFiles, "navFiles") { {
	Slate { "Files", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		closeDocument_,
		Event { "recent", "" },			Click { 1, 45, -10, _pwindow, _bottomLeft },
		Event { "source control", "" },	Click { 1, 58, -10, _pwindow, _bottomLeft },
		Event { "unsaved", "" },		Click { 1, 71, -10, _pwindow, _bottomLeft },
		Event { "clear filter", "" },	Click { 1, 243, -10, _pwindow, _bottomLeft },
		Event {	"filter", "" },			Click { 1, 200, -10, _pwindow, _bottomLeft },
		Event { "project", "" },		Sequence{}, _showHideNavigator, ResSubslate { resid_navProject }, endSequence{},
		_LetterKeys_,
		_NumberKeys_,
		_NavPanelRows_,
	} }
} };

#pragma mark Project
resource restype_Slate (resid_navProject, "Project") { {
	Slate { "proj", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_CommandSlate_,
		_TypeXcodeSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "add target", "" },		Sequence{}, Click { 1, 86, -36, _pwindow, _bottomLeft }, ResSubslate { resid_navAddTarget }, endSequence{},
		Event { "add build phase", "" },	Sequence{}, Click { 1, -72, -36, _pwindow, _bottomRight }, ResSubslate { resid_navAddPhase }, endSequence{},
		Event { "modernize", "" },		Click { 1, 0, -36, _pwindow, _bottomCenter },
		Event { "target list", "" },	Click { 1, 14, -73, _pwindow, _bottomLeft },
		Event { "info", "" },			Click { 1, -80, 134, _pwindow, _topCenter },
		Event { "build settings", "" },	Click { 1, -5, 134, _pwindow, _topCenter },
		Event { "build phases", "" },	Click { 1, 110, 134, _pwindow, _topCenter },
		Event { "build rules", "" },	Click { 1, 250, 134, _pwindow, _topCenter },
		Event { "open run script", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, ResSubslate { resid_phaseRunScript }, endSequence{},
		Event { "open dependencies", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open compile sources", "" },	Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Files", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Headers", "" },		Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Copy Resources", "" },	Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "open Link	", "" },			Sequence{}, Click { 1, 0, 0, _cursor }, endSequence{},
		Event { "delete phase", "" },	Click { 0, 1630, 0, _cursor },
		Event { "phase one", "" },		Click { 0, il_h, il_r1 + 0 * il_rsp, _pwindow, _topLeft },
		Event { "phase two", "" },		Click { 0, il_h, il_r1 + 1 * il_rsp, _pwindow, _topLeft },
		Event { "phase three", "" },	Click { 0, il_h, il_r1 + 2 * il_rsp, _pwindow, _topLeft },
		Event { "phase four", "" },		Click { 0, il_h, il_r1 + 3 * il_rsp, _pwindow, _topLeft },
		Event { "phase five", "" },		Click { 0, il_h, il_r1 + 4 * il_rsp, _pwindow, _topLeft },
		Event { "phase six", "" },		Click { 0, il_h, il_r1 + 5 * il_rsp, _pwindow, _topLeft },
		Event { "phase seven", "" },	Click { 0, il_h, il_r1 + 6 * il_rsp, _pwindow, _topLeft },
		Event { "phase eight", "" },	Click { 0, il_h, il_r1 + 7 * il_rsp, _pwindow, _topLeft },
		Event { "phase nine", "" },		Click { 0, il_h, il_r1 + 8 * il_rsp, _pwindow, _topLeft },
		Event { "phase ten", "" },		Click { 0, il_h, il_r1 + 9 * il_rsp, _pwindow, _topLeft },
		Event { "phase eleven", "" },	Click { 0, il_h, il_r1 + 10 * il_rsp, _pwindow, _topLeft },
		Event { "phase twelve", "" },	Click { 0, il_h, il_r1 + 11 * il_rsp, _pwindow, _topLeft },
	} }
} };

resource restype_Slate (resid_navAddTarget, "AddTarget") { {
	Slate { "addTarget", {
		_FileNewStandards_,
	} }
} };

resource restype_Slate (resid_navAddPhase, "AddPhase") { {
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

#define _PhaseStandards_	\
		_SlateGlobals_,		\
		_CloseSubslate_,		\
		_IMouseSlate_,		\
		_DirectionKeys_,		\
		_WhitespaceKeys_,		\
		_CommandSlate_,		\
		_TypeXcodeSlate_,		\
		_JumpDownSubslate_,		\
		_JumpNorthSubslate_,		\
		_DoJumpSubslate_

resource restype_Slate (resid_phaseRunScript, "resid_phaseRunScript") { {
	Slate { "phScript", {
		_PhaseStandards_,
		Event { "edit name", "" },		Click { 2, 40, 0, _cursor },
	} }
} };

#pragma mark Issues
resource restype_Slate (resid_navIssue, "navIssue") { {
	Slate { "Issue", {
		_SlateGlobals_,
		_XcodeStandards_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "expand", "" },			Sequence{}, ClickMenu { "Editor", }, _down, TypeText { "Expand Selected Transcripts" }, _return, endSequence{},
		Event { "collapse", "" },		Sequence{}, ClickMenu { "Editor", }, _down, TypeText { "Collapse Selected Transcripts" }, _return, endSequence{},
		Event { "target list", "" },	Click { 1, 333, 149, _pwindow, _topLeft },
		Event { "info", "" },			Click { 1, -85, 130, _pwindow, _topCenter },
		Event { "build settings", "" },	Click { 1, -10, 130, _pwindow, _topCenter },
		Event { "build phases", "" },	Click { 1, 103, 130, _pwindow, _topCenter },
		Event { "build rules", "" },	Click { 1, 214, 130, _pwindow, _topCenter },
		Event { "item one", "" },		Click { 1, il_h, il_r1 + 0 * il_rsp, _pwindow, _topLeft },
		Event { "item two", "" },		Click { 1, il_h, il_r1 + 1 * il_rsp, _pwindow, _topLeft },
		Event { "item three", "" },		Click { 1, il_h, il_r1 + 2 * il_rsp, _pwindow, _topLeft },
		Event { "item four", "" },		Click { 1, il_h, il_r1 + 3 * il_rsp, _pwindow, _topLeft },
		Event { "item five", "" },		Click { 1, il_h, il_r1 + 4 * il_rsp, _pwindow, _topLeft },
		Event { "item six", "" },		Click { 1, il_h, il_r1 + 5 * il_rsp, _pwindow, _topLeft },
		Event { "item seven", "" },		Click { 1, il_h, il_r1 + 6 * il_rsp, _pwindow, _topLeft },
		Event { "item eight", "" },		Click { 1, il_h, il_r1 + 7 * il_rsp, _pwindow, _topLeft },
		Event { "item nine", "" },		Click { 1, il_h, il_r1 + 8 * il_rsp, _pwindow, _topLeft },
		Event { "item ten", "" },		Click { 1, il_h, il_r1 + 9 * il_rsp, _pwindow, _topLeft },
		Event { "item eleven", "" },	Click { 1, il_h, il_r1 + 10 * il_rsp, _pwindow, _topLeft },
		Event { "item twelve", "" },	Click { 1, il_h, il_r1 + 11 * il_rsp, _pwindow, _topLeft },
		_NavPanelRows_,
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

#pragma mark Repositories
resource restype_Slate (resid_Repositories, "Repositories") { {
	Slate { "rep", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_TypeXcodeSlate_,
		Event { "cancel", "" },			Keypress { kc_period, mf_command },
		Event { "select", "" },			Subslate { "select repository" },
			_SlateGlobals_,
			ExitEvent { "okay", "" },			NilAction{},
			ExitEvent { "Support", "" },		TypeText { "Support" },
			ExitEvent { "Punkin", "" },			TypeText { "Punkin" },
			ExitEvent { "Carbon", "" },			TypeText { "Accessor_C9" },
			ExitEvent { "Dev Support", "" },	TypeText { "Dev Support" },
			ExitEvent { "old Support", "" },	TypeText { "Support_svn" },
			ExitEvent { "Web Gen", "" },		TypeText { "Web Gen" },
			endSubslate{},
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _window, _topLeft },		Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
		Event { "content", "" },		Click { 1, 0, 90, _window, _topCenter },
		Event { "pull", "" },			Sequence{}, Click { 1, 214, -33, _window, _bottomLeft },
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
		Event { "Working Copy", "" },	TypeText { "Add Working" },
		Event { "Repository", "" },		TypeText { "Add Repository" },
		Event { "Clone", "" },			TypeText { "Checkout or Clone" },
		Event { "continue", "" },		_return,
		Event { "git path", "" },		Sequence{}, TypeText { "/Users/carolclark/Dev/gitrep/Main" }, _left, _left, _left, _left, endSequence{},			
		Event { "working path", "" },	TypeText { "/Users/carolclark/Dev/" },
		Event { "next", "" },			_return,
		Event { "finish", "" },			Sequence{}, _return, ResSubslate { resid_FileDlgStd }, endSequence{},
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

#pragma mark 6 === Editors

#pragma mark Editor
resource restype_Slate (resid_Editor, "Editor") { {
	Slate { "ed", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _pwindow, _topLeft },		Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
		Event { "standard", "" },	Keypress { kc_return, mf_command },
		Event { "assistant", "" },	Keypress { kc_return, mf_command + mf_option },
		Event { "version", "" },	Sequence{}, Keypress { kc_return, mf_command + mf_option + mf_shift }, ResSubslate { resid_edVersion }, endSequence{},
	} }
} };

#pragma mark Version Editor
resource restype_Slate (resid_edVersion, "edVersion") { {
	Slate { "vers", {
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		_DirectionKeys_,
		closeDocument_,
		Event { "compare", "" },		Click { 1, -100, -20, _window, _bottomRight },
		Event { "annotate", "" },		Click { 1, -73, -20, _window, _bottomRight },
		Event { "revisions", "" },		Click { 1, -46, -20, _window, _bottomRight },
		Event { "edit left", "" },		Click { 1, 660, 540, _window, _topLeft },
		Event { "edit right", "" },		Click { 1, -350, 540, _window, _centerRight },
		Event { "nav list", ""},		navList_,
		Event { "difference", "" },		Click { 1, 125, 125, _window, _topCenter },
		Event { "down again", "" },		_down,
		Event { "commit", "" },			Sequence{}, Keypress { kc_C, mf_command + mf_option }, ResSubslate { resid_Commit }, endSequence{},
		Event { "merge", "" },			TypeText { "merge" },
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
		
		ExitEvent { "brief", "" },					Sequence{}, TypeText { "\\brief" }, _tab, _tab, endSequence{},
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

#pragma mark ProjectMenu
resource restype_Slate (resid_ProjectMenu, "Project") { {
	Slate { "Project", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Add to Project", "" },				Sequence{}, TypeText { "Add to Project" }, _return, ResSubslate { resid_AddFiles }, endSequence{},
		ExitEvent { "New Build Phase", "" },		Sequence{}, TypeText { "New Build Phase" }, _right, endSequence{},
		ExitEvent { "Edit Executable", "" },		Sequence{}, TypeText { "Edit Active Executable" }, _return, endSequence{},
		ExitEvent { "New Custom Executable", "" },	Sequence{}, TypeText { "New Custom Executable" }, _return, endSequence{},
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

resource restype_Slate (resid_TypeDesign, "Type for Design") { {
	Slate { "TypeDesign", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "Special", "" },		ResSubslate { resid_TypeSpecialXcodeSlate },
		Event { "go back", "" },		Keypress { kc_left, mf_shift + mf_command + mf_option },
		Event { "step back", "" },		Keypress { kc_left, mf_command + mf_option },
		Event { "go forward", "" },		Keypress { kc_right, mf_shift + mf_command + mf_option },
		Event { "step forward", "" },	Keypress { kc_right, mf_command + mf_option },
		Event { "select word", "" },	Keypress { kc_O, mf_control },
		Event { "select line", "" },	Keypress { kc_M, mf_control },
		Event { "capitalize", "" },		Keypress { kc_C, mf_control + mf_shift },
		Event { "lowercase", "" },		Keypress { kc_L, mf_control + mf_shift },
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_TypeSlateItems_
	} }
} };

#define	_DataModelMenu_		ClickMenu { "Design" }, _down, TypeText { "Data Model" }, _right

#define	topRow_		83
#define	rowHt_		17

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
		Event { "go back", "" },		Keypress { kc_left, mf_shift + mf_command + mf_option },
		Event { "step back", "" },		Keypress { kc_left, mf_command + mf_option },
		Event { "go forward", "" },		Keypress { kc_right, mf_shift + mf_command + mf_option },
		Event { "step forward", "" },	Keypress { kc_right, mf_command + mf_option },
		Event { "select word", "" },	Keypress { kc_O, mf_control },
		Event { "select line", "" },	Keypress { kc_M, mf_control },
		Event { "capitalize", "" },		Keypress { kc_C, mf_control + mf_shift },
		Event { "lowercase", "" },		Keypress { kc_L, mf_control + mf_shift },
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

/* to do */
#pragma mark BrowseDoxygen
#define	_BrowseDoxygenResID_	resid_BrowseDoxygen
#define	_mainFrame_h			0
#define	_mainFrame_v			55
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

#pragma mark TargetPopup
resource restype_Slate (resid_TargetPopup, "Target Popup") { {
	Slate { "TargetPopup",	{
		_SlateGlobals_,
		_LetterKeys_,
		_DirectionKeys_,
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "return", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },	
		ExitEvent { "build", "" },		Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_B, mf_command }, endSequence{},
		ExitEvent { "analyze", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_A, mf_command + mf_shift }, endSequence{},
		ExitEvent { "run", "" },		Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_R, mf_command }, endSequence{},
		ExitEvent { "debug", "" },		Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_Y, mf_command + mf_option }, endSequence{},
		ExitEvent { "clean", "" },		Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_K, mf_command + mf_shift }, endSequence{},
		Event { "Xcode", "" },					TypeText { "Xcode" },
		Event { "Documentation", "" },			TypeText { "Documentation" },
		Event { "Doxygen", "" },				TypeText { "Doxygen" },
		Event { "All Tests", "" },				TypeText { "AllTests" },
		Event { "Koala", "" },					TypeText { "KoalaUnitTests" },
		Event { "Koala framework", "" },		TypeText { "Koala" },
		Event { "My Library", "" },				TypeText { "MyLibrary" },
		Event { "Prototype application", "" },	TypeText { "Prototype" },
		Event { "Prototype", "" },				TypeText { "PrototypeTest" },
		Event { "Prototype Extended", "" },		TypeText { "ProtoExtTest" },
		Event { "Prototype Doxygen", "" },		TypeText { "ProtoDoxygen" },
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
		nextPanel_,
		previousPanel_,
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
		Event { "focus", "" },			Keypress { kc_period, mf_command + mf_option },
		Event { "focus next", "" },		Keypress { kc_period, mf_command + mf_option },
		Event { "focus previous", "" },	Keypress { kc_period, mf_command + mf_option + mf_shift },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		targetPopup_,
		Event { "nav list", "" },		navList_,
		Event { "show files", "" },		Sequence{}, Keypress { kc_1, mf_command }, navList_, ResSubslate { resid_navFiles }, endSequence{},
		Event { "show symbols", "" },	Keypress { kc_2, mf_command },
		Event { "show search", "" },	Keypress { kc_3, mf_command },
		Event { "show issues", "" },	Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_navIssue }, endSequence{},
		Event { "show debug", "" },		Keypress { kc_5, mf_command },
		Event { "show breakpoints", "" }, Keypress { kc_6, mf_command },
		Event { "show logs", "" },		Keypress { kc_7, mf_command },
		Event { "standard", "" },		Keypress { kc_return, mf_command },
		Event { "assistant", "" },		Keypress { kc_return, mf_command + mf_option },
		Event { "version", "" },		Sequence{}, Keypress { kc_return, mf_command + mf_option + mf_shift }, ResSubslate { resid_edVersion }, endSequence{},
		Event { "Organizer", "" },		Sequence{}, Keypress { kc_2, mf_command + mf_shift },
			ResSubslate { resid_Organizer }, endSequence{},
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "hide banner", "" },	Keypress { kc_G, mf_command + mf_control + mf_option },
		Event { "go next", "tab" },		Keypress { kc_closebracket, mf_command + mf_shift },
		Event { "go previous", "tab" },	Keypress { kc_bracket, mf_command + mf_shift },
		Event { "go back", "" },		Keypress { kc_left, mf_shift + mf_command + mf_option },
		Event { "step back", "" },		Keypress { kc_left, mf_command + mf_option },
		Event { "go forward", "" },		Keypress { kc_right, mf_shift + mf_command + mf_option },
		Event { "step forward", "" },	Keypress { kc_right, mf_command + mf_option },
		Event { "next panel", "" },		Keypress { kc_period, mf_command + mf_option },
		Event { "previous panel", "" },	Keypress { kc_period, mf_command + mf_option + mf_shift },
		Event { "next button", "" },	Keypress { kc_tab, mf_control },
		Event { "previous button", "" }, Keypress { kc_tab, mf_control + mf_shift },
		_JumpBar_,
		Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, _pwindow, _topLeft },		Click { -1, 280, 10, _screen, _topLeft }, endSequence{},	
		Event { "reveal", "" },			Keypress { kc_L, mf_command },
		Event { "context menu", "" },	ClickMod { 1, 0, 0, _cursor, mf_control },
		Event { "Menu", "access menus" },
			Subslate { "Menu" },
				_SlateGlobals_,
				_CloseSubslate_,
				Event { "File", "'File' menu" }, Sequence{}, clickFile_, _down, ResSubslate { resid_FileMenu }, endSequence{},
				Event { "Edit", "'Edit' menu" }, Sequence{},
					ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
				ExitEvent { "Edit", "" }, ClickMenu { "Edit" },
				ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
				ExitEvent { "Find", "'Find' menu" }, ClickMenu { "Find" },
				Event { "Project", "'Project' menu" }, Sequence{},
					ClickMenu { "Project" }, _down, ResSubslate { resid_ProjectMenu }, endSequence{},
				Event { "Design", "'Design' menu" }, Sequence{},
					ClickMenu { "Design" }, _down, ResSubslate { resid_DesignMenu }, endSequence{},
				ExitEvent { "Build", "'Build' menu" }, ClickMenu { "Build" },
				ExitEvent { "Subversion", "'Version' menu" }, ClickMenu { "SCM" },
				ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
				endSubslate{},
		Event { "File", "'File' menu" }, Sequence{}, clickFile_, _down, ResSubslate { resid_FileMenu }, endSequence{},
		Event { "Source Control", "'Source Control' menu" }, Sequence{}, ClickMenu { "File" }, _down, TypeText { "Source Control" }, _right, ResSubslate { resid_SourceControl }, endSequence{},
		Event { "Edit Menu", "'Edit' menu" }, Sequence{},
			ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
		Event { "run slate", "" },				ResSubslate { resid_RunSlate },
		Event { "Refactor", "" },				Sequence{},
			ClickMenu { "Edit" }, _down, TypeText { "Refactor" }, _return, ResSubslate { resid_Refactor }, endSequence{},
		Event { "Data Model", "" },				ResSubslate { resid_DataModel },
		Event { "Workspace", "" },				ResSubslate { resid_Workspace },
		Event { "Search", "Xcode 'Find' menu" },
			Subslate { "Search" },
				_SlateGlobals_,
				_CloseSubslate_,
				_TypeXcodeSlate_,
				_SlateGlobals_,
				_DirectionKeys_,
				Event { "page north", "" },			Keypress { kc_pageup, 0 },
				Event { "page down", "" },			Keypress { kc_pagedown, 0 },
				Event { "options", "" },	Keypress { kc_G, mf_command + mf_option + mf_control },
				Event { "return", "" },					Keypress { kc_return, 0 },
				Event { "select word", "" },			Keypress { kc_O, mf_control },
				Event { "enter find string", "" },		Keypress { kc_E, mf_command },
				Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_control },
				Event { "find again", "" },				Keypress { kc_G, mf_command },
				Event { "find previous", "" },			Keypress { kc_G, mf_command + mf_control },
				Event { "change", "" },					Keypress { kc_H, mf_command },
				Event { "change again", "" },			Keypress { kc_H, mf_command + mf_shift },
				Event { "find", "find in single file" },
					Sequence{},
						Keypress { kc_F, mf_command},
						ResSubslate { resid_Find },
						endSequence{},
				Event { "multiple", "find in multiple files" },
					Sequence{},
						Keypress { kc_F, mf_command + mf_shift },
						ResSubslate { resid_FindMultiple },
						endSequence{},
				Event { "hide banner", "" },	Keypress { kc_G, mf_command + mf_control + mf_option },
				Event { "next panel", "" },		Keypress { kc_tab, mf_control },
				Event { "previous panel", "" },	Keypress { kc_tab, mf_control + mf_shift },
				Event { "row one", "" },	Click { 1, 385, topRow_ + 0 * rowHt_, _pwindow, _topLeft },
				Event { "row two", "" },	Click { 1, 385, topRow_ + 1 * rowHt_, _pwindow, _topLeft },
				Event { "row three", "" },	Click { 1, 385, topRow_ + 2 * rowHt_, _pwindow, _topLeft },
				Event { "row four", "" },	Click { 1, 385, topRow_ + 3 * rowHt_, _pwindow, _topLeft },
				Event { "row five", "" },	Click { 1, 385, topRow_ + 4 * rowHt_, _pwindow, _topLeft },
				Event { "row six", "" },	Click { 1, 385, topRow_ + 5 * rowHt_, _pwindow, _topLeft },
				Event { "row seven", "" },	Click { 1, 385, topRow_ + 6 * rowHt_, _pwindow, _topLeft },
				Event { "row eight", "" },	Click { 1, 385, topRow_ + 7 * rowHt_, _pwindow, _topLeft },
				Event { "row nine", "" },	Click { 1, 385, topRow_ + 8 * rowHt_, _pwindow, _topLeft },
				Event { "row ten", "" },	Click { 1, 385, topRow_ + 9 * rowHt_, _pwindow, _topLeft },
				Event { "row eleven", "" },	Click { 1, 385, topRow_ + 10 * rowHt_, _pwindow, _topLeft },
				Event { "row twelve", "" },	Click { 1, 385, topRow_ + 11 * rowHt_, _pwindow, _topLeft },
				_DoSelectSubslate_,
				_DoJumpSubslate_,
				_JumpDownSubslate_,
				_JumpNorthSubslate_,
				_JumpLeftSubslate_,
				_JumpRightSubslate_,
				_CommandSlate_,
				endSubslate{},
		Event { "Debug", "control a target being debugged" },	ResSubslate { resid_Debug },
		Event { "save files", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "Modelling", "" },			Sequence{},
			Keypress { kc_tab, mf_command },
			ResSubslate { resid_UMLetSubslate },
			endSequence{},
		Event { "Accessor", "" },			Subslate { "Accessor" },
			_SlateGlobals_,
			Event { "build", "" },			Keypress { kc_B, mf_command },
			ExitEvent { "cancel", "" },		NilAction{},
			Event { "run original", "" },	Launch { HomeApps_"Accessor_C9.app", 0 },
			Event { "quit", "" },			Keypress { kc_Q, mf_command },
			endSubslate{},
		Event { "Doxygen", "" },	ResSubslate { resid_Doxygen },
		Event { "Snapshots", "" },	Sequence{},
			ClickMenu { "File" }, _down, TypeText { "Snapshots" }, _return, ResSubslate { resid_Snapshots },
			endSequence{},
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


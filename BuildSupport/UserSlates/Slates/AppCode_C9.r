// =================================================================================
//	AppCode_C9.r				(c)2014 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "Developer_C9.h"

#pragma mark === Markers ===
// 1 Menus; 2 Tools; 8 Typing; 9 AppCode

#pragma mark 0 ===
// #defined in CommonSlates_C9.h
//	#define resid_XCAppCode				resid_AppCode+1

#define resid_TypeAppCodeSlate			resid_AppCode+10
#define resid_TypeSpecialAppCodeSlate	resid_AppCode+11

#define resid_Menus                     resid_AppCode+100
    #define resid_FileMenu                  resid_Menus+5
	#define resid_GoTo						resid_Menus+10

#define resid_ToolView					resid_AppCode+150

#define resid_Refactor					resid_AppCode+200

#pragma mark 1 === Menus
// inside: 1 ToolView
#pragma mark FileMenu
resource restype_Slate (resid_FileMenu, "") { {
	Slate { "FileMenu",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "open", "" },		Keypress { kc_O, mf_command },
	} }
} };

#pragma mark GoTo
resource restype_Slate (resid_GoTo, "") { {
	Slate { "GoTo",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "declaration", "" },	Keypress { kc_B, mf_control },
		ExitEvent { "definition", "" },		Keypress { kc_B, mf_control + mf_option },
		ExitEvent { "type", "" },			Keypress { kc_B, mf_control + mf_shift },
		ExitEvent { "super", "" },			Keypress { kc_U, mf_command },
		ExitEvent { "related", "" },		Keypress { kc_up, mf_control + mf_command },
	} }
} };

#pragma mark 2 === Tools
#define	_toolWindowsMenu	ClickMenu { "View" }, TypeText { "Tool Windows" }, _right

resource restype_Slate (resid_ToolView, "") { {
	Slate { "Tool",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "close panel", "" },		Keypress { kc_escape, mf_shift },
		Event { "Project", "" },			Keypress { kc_1, mf_command },
		Event { "Symbols", "" },			Keypress { kc_2, mf_command },
		Event { "Find", "" },				Keypress { kc_3, mf_command },
		Event { "Messages", "" },			Keypress { kc_4, mf_command },
		Event { "Debug", "" },				Keypress { kc_5, mf_command },
		Event { "To Do", "" },				Keypress { kc_6, mf_command },
		Event { "Favorites", "" },			Keypress { kc_7, mf_command },
		Event { "Hierarchy", "" },			Keypress { kc_8, mf_command },
		Event { "Changes", "" },			Keypress { kc_9, mf_command },
		Event { "Events", "" },				Keypress { kc_0, mf_command },
		Event { "Documentation", "" },		Sequence{}, _toolWindowsMenu, TypeText { "Documentation" }, _return, endSequence{},
		Event { "Inspection", "" },			Sequence{}, _toolWindowsMenu, TypeText { "Inspection" }, _return, endSequence{},
		Event { "Run", "" },				Sequence{}, _toolWindowsMenu, TypeText { "Run" }, _return, endSequence{},
		Event { "Version Control", "" },	Sequence{}, _toolWindowsMenu, TypeText { " " }, _return, endSequence{},
	} }
} };

#pragma mark Refactor
resource restype_Slate (resid_Refactor, "") { {
	Slate { "Refactor",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "this", "" },			Keypress { kc_T, mf_control },
		ExitEvent { "rename", "" },			Keypress { kc_fn6, mf_shift },
	} }
} };

#pragma mark 8 === Typing
#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialAppCodeSlate, "Type Special AppCode Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },	TypeText { "something" },
	} }
} };

#pragma mark Type
#define _TypeAppCodeItems_	\
	_TypeDevItems_,			\
	Event { "edit", "" },		Click { 1, -15, 110, _window, _topRight },	\
	Event { "contents", "" },	Keypress { kc_6, mf_control },		\
	Event { "generate", "" },	Keypress { kc_N, mf_command },		\
	Event { "look up", "" },	Keypress { kc_fn1, 0 },				\
	Event { "go to line", "" },	Keypress { kc_L, mf_command }

resource restype_Slate (resid_TypeAppCodeSlate, "Type Slate") { {
	Slate { "Type",	{
	_TypeDevSlateItems_,
	_TypeAppCodeItems_,
	} }
} };

#pragma mark 9 === AppCode
#pragma mark _TypeAppCodeSlate_
#define _TypeAppCodeSlate_ 		\
	Event { "Type", "" },	ResSubslate { resid_TypeAppCodeSlate }

#define	_AppCodeItems_			\
		_SlateGlobals_,			\
		_DefaultBase_,			\
		_TypeAppCodeSlate_,		\
		_JumpDownSubslate_,		\
		_JumpNorthSubslate_,	\
		_DoJumpSubslate_,		\
		_DoSelectSubslate_,		\
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },	\
		Event { "page north", "" },		Keypress { kc_pageup, 0 },		\
		Event { "page top", "" },		Keypress { kc_home, 0 },		\
		Event { "page end", "" },		Keypress { kc_end, 0 },			\
		Event { "Tool View", "" },		ResSubslate { resid_ToolView },	\
		Event { "open class", "" },		Keypress { kc_O, mf_command },	\
		Event { "usages", "" },			Keypress { kc_fn7, mf_option },	\
		Event { "define", "" },			Keypress { kc_space, mf_option },	\
		Event { "go back", "" },		Keypress { kc_left, mf_command + mf_option },	\
		Event { "go forward", "" },		Keypress { kc_right, mf_command + mf_option },	\
		Event { "go next", "" },		Keypress { kc_closebracket, mf_command + mf_shift },	\
		Event { "go previous", "" },	Keypress { kc_bracket, mf_command + mf_shift },	\
		Event { "accept", "" },			Keypress { kc_enter, mf_option },	\
		Event { "GoTo", "" },			ResSubslate { resid_GoTo },		\
		Event { "Refactor", "" },		ResSubslate { resid_Refactor },	\
		Event { "Menu", "" },			Subslate { "Menu" },	\
			_SlateGlobals_,		\
			_CloseSubslate_,	\
			ExitEvent { "Application", "" }, ClickMenu { "AppCode" },		\
			Event { "File", "" }, Sequence{}, ClickMenu { "File" }, ResSubslate { resid_FileMenu }, endSequence{},	\
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },		\
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },	\
			endSubslate{}

resource restype_Slate (resid_AppCode, "AppCode Slate") { {
	Slate { "AppCode",	{
		_SlateGlobals_,
		_DefaultBase_,
		_AppCodeItems_
	} }
} };

resource restype_Slate (resid_XCAppCode, "XcodeAppCode Slate") { {
	Slate { "AppCode",	{
		_SlateGlobals_,
		_DefaultBase_,
		_AppCodeItems_,
		ExitEvent { "close", "" },	Sequence{}, Keypress { kc_Q, mf_command }, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		ExitEvent { "go back", "" }, Sequence{}, Keypress { kc_S, mf_command + mf_option }, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		Event { "okay", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
	} }
} };

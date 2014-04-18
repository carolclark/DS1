// =================================================================================
//	Dash_C9.r					(c)2009-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark 0 === Top

//#define resid_Dash						37000
//#define resid_XcodeDash					resid_Dash+1

#define resid_TypeSpecialDashSlate	resid_Dash+10
#define resid_TypeDashSlate			resid_Dash+11

#define	resid_DashSnippet			resid_Dash+20

#define resid_DashWindow			resid_Dash+30

#define	resid_BrowseDoxygen			resid_Dash+80

#define	resid_Search				resid_Dash+100

#define _TypeDashItems_	\
	Event { "focus", "" },		Keypress { kc_tab, 0 },			\
	Event { "focus back", "" },	Keypress { kc_tab, mf_shift },	\
	Event { "page top", "" },	Keypress { kc_home, 0 },		\
	Event { "page end", "" },	Keypress { kc_end, 0 },			\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },		\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	_DoJumpSubslate_,		\
	_DoSelectSubslate_,		\
	_JumpLeftSubslate_,		\
	_JumpRightSubslate_,	\
	_JumpDownSubslate_,		\
	_JumpNorthSubslate_,	\
	_TypeSlateItems_

#define _TypeDashSlate_ 		\
	Event { "Type", "" },	ResSubslate { resid_TypeDashSlate }
	
#pragma mark 1 === TypeSpecial
resource restype_Slate (resid_TypeSpecialDashSlate, "Type Special Dash Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		endSubslate{},
	} }
} };

#pragma mark Window
resource restype_Slate (resid_DashWindow, "") { {
	Slate { "Window",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Standard", "" },	Click { 1, 170, 135, _window, _topLeft },
		ExitEvent { "Heads Up", "" },	Click { 1, 230, 135, _window, _topLeft },
	} }
} };

#pragma mark 8 === Type
resource restype_Slate (resid_TypeDashSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Special", "" },	ResSubslate { resid_TypeSpecialDashSlate },
		_TypeDashItems_
	} }
} };

#pragma mark Search
resource restype_Slate (resid_Search, "") { {
	Slate { "Search",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "mac os", "" },			TypeText { "osx:" },
		Event { "ios", "" },			TypeText { "ios:" },
		Event { "accessor", "" },		TypeText { "acc:" },
		Event { "punkin", "" },			TypeText { "pun:" },
		Event { "main page", "" },		TypeText { "main page" },
		Event { "methods", "" },		Keypress { kc_down, mf_option },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		_TypeDashSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
	} }
} };

#pragma mark BrowseDoxygen
	#define	_BrowseDoxygenResID_	resid_BrowseDoxygen
	#define	_mainFrame_h			247
	#define	_mainFrame_v			69
	#define _homeApp				Apps_"Dash.app"
_BrowseDoxygenSlate_

#pragma mark 9 === Dash
#define	_DashSlateItems_		\
		_SlateGlobals_,			\
		_CommandSlate_,		\
		_IMouseSlate_,		\
		Event { "click one", "single click" },	\
			IMouse { im_Click, 1 },	\
		Event { "click two", "double click" },	\
			IMouse { im_Click, 2 },	\
		_FullAccessSlate_,	\
		_MenuBarSlate_,		\
		_DockWindowSlate_,	\
		_TypeDashSlate_,	\
		_WhitespaceKeys_,	\
		_DirectionKeys_,	\
		_LetterKeys_,		\
		Event { "search", "" },		Sequence{}, Keypress { kc_L, mf_command }, ResSubslate { resid_Search }, endSequence{},	\
		Event { "doxygen", "" },	ResSubslate { resid_BrowseDoxygen }, 	\
		Event { "focus", "" },		Keypress { kc_tab, 0 },				\
		Event { "focus back", "" },	Keypress { kc_tab, mf_shift },		\
		Event { "Window", "" },		Sequence{}, Keypress { kc_comma, mf_command }, Wait { 40 }, Click { 1, 265, 45, _window, _topLeft }, ResSubslate { resid_DashWindow }, endSequence{},		\
		Event { "new snippet", "" },	Sequence{}, Keypress { kc_N, mf_option }, ResSubslate { resid_DashSnippet },  endSequence{},	\
		Event { "next", "" },		Keypress { kc_down, mf_option },	\
		Event { "previous", "" },	Keypress { kc_up, mf_option },		\
		_DoJumpSubslate_,		\
		_JumpDownSubslate_,		\
		_JumpNorthSubslate_

resource restype_Slate (resid_Dash, "Dash Slate") { {
	Slate { "Dash",	{
		_DashSlateItems_,
		_LaunchSlate_,	
	} }
} };

resource restype_Slate (resid_XcodeDash, "Xcode Dash Slate") { {
	Slate { "Dash",	{
		ExitEvent { "okay", "" },	Launch { DevApps_"XCode.app", 0 },
		_DashSlateItems_
	} }
} };

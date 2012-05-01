// =================================================================================
//	Safari.r					©2005-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#pragma mark 0 ===
#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_Scripts					resid_Safari+1
#define resid_TypeSafariSlate			resid_Safari+2
#define resid_TypeSpecialSafariSlate	resid_Safari+3
#define resid_Bookmarks					resid_Safari+4
	#define resid_EditBookmarks				resid_Safari+5

#define resid_DocBrowser				resid_Safari+20
	#define resid_BrowseDoxygen				resid_DocBrowser+1
#define resid_Login						resid_Safari+30
#define resid_Discover					resid_Safari+35
#define resid_AirTran					resid_Safari+36
#define resid_XcodeJavadoc				resid_Safari+100
#define resid_Javadoc						resid_XcodeJavadoc+1
#define resid_ScanLinks					resid_Safari+120
#define resid_Buttons						resid_Safari+121
#define resid_Links							resid_Safari+122
#define resid_Layout					resid_Safari+300
	#define resid_loLeftIndex				resid_Layout+1
	#define resid_loAppleResults			resid_Layout+2
	#define resid_loAppleTopics				resid_Layout+3
	#define resid_loDocumentList			resid_Layout+4
	#define resid_loAppleContent			resid_Layout+5
#define resid_Arbonne					resid_Safari+400
	#define resid_arbHome					resid_Arbonne+10
	#define resid_arbShop					resid_Arbonne+20
		#define resid_arbShopIndex				resid_arbShop+1
		#define resid_arbShopSpecials			resid_arbShop+2
	#define resid_arbWebStats				resid_Arbonne+30
		#define resid_arbwsVolume				resid_arbWebStats+1
		#define resid_arbwsOrders				resid_arbWebStats+2
#define resid_Facebook					resid_Safari+700
#define resid_YahooHome					resid_Safari+720
#define resid_SafariOnline				resid_Safari+740
#define resid_gmail						resid_Safari+760
#define resid_TestAddress				resid_Safari+890
#define resid_Puzzles					resid_Safari+990		// resid not used
	#define resid_TypePuzzles				resid_Puzzles+1
	#define resid_sudokuTimes				resid_Puzzles+2
	#define resid_sudokuPost				resid_Puzzles+3
	#define resid_sudokuThink				resid_Puzzles+4
	#define resid_sudokuDaily				resid_Puzzles+5
		#define resid_sudokuDailyYear			resid_sudokuDaily+1
		#define resid_sudokuDailyTable			resid_sudokuDaily+2
		#define resid_sudokuDailyClean			resid_sudokuDaily+3

#pragma mark Scripts
resource restype_Slate (resid_Scripts, "") { {
	Slate { "Scripts",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Fix Window Height", "" }, Sequence{},
			TypeText { "FixWindowHeight" }, Keypress { kc_return, 0 },
			endSequence{},
		ExitEvent { "Fix Window Width", "" }, Sequence{},
			TypeText { "FixWindowWidth" }, Keypress { kc_return, 0 },
			endSequence{},
		ExitEvent { "Move Window to Right", "" }, Sequence{},
			TypeText { "MoveWindowToRight" }, Keypress { kc_return, 0 },
			endSequence{},
	} }
} };

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialSafariSlate, "Type Special Safari Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "Mach O",	"type 'Mach-O'" },
			TypeText { "Mach-O" },
		ExitEvent { "open namespace",	"type 'NAMESPACE_AccessLib'" },
			TypeText { "NAMESPACE_AccessLib" },
		ExitEvent { "close namespace",	"type 'NAMESPACE_END'" },
			TypeText { "NAMESPACE_END" },
		ExitEvent { "extend",	"type '_AL.'" },
			TypeText { "_AL." },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeSafariSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_JumpLeftSubslate_,
		_JumpRightSubslate_,
		_DoSelectSubslate_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialSafariSlate },
		Event { "functions", "click the Functions menu" },
			Click { 1, 60, 35, window, "1", _topLeft },
		Event { "file drawer", "click in the file drawer" },
			Click { 1, 820, 400, _screen, _topLeft },
	} }
} };

#define _TypeSafariSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeSafariSlate }

#define _clickAddress	Click { 1, 0, 35, _window, _topCenter }
#pragma mark _SafariStandards_
#define _SafariStandards_	\
		_SlateGlobals_,		\
		_StarterBase_,		\
		_WindowSlate_,		\
		_TypeSafariSlate_,	\
		Event { "address", "" },	_clickAddress,		\
		Event { "copy address", "" },	Sequence{},	\
			_clickAddress, Keypress { kc_A, mf_command }, Keypress { kc_C, mf_command },	\
			endSequence{},	\
		Event { "copy", "" },		Keypress { kc_C, mf_command },	\
		Event { "paste", "" },		Keypress { kc_V, mf_command },	\
		Event { "inhouse link", "" },	Sequence{},	\
			Click { 1, 0, 35, _window, _topCenter }, Keypress { kc_right, mf_command }, Keypress { kc_left, mf_shift + mf_option },	\
			Keypress { kc_left, mf_shift + mf_option },	Keypress { kc_left, mf_shift + mf_option },Keypress { kc_left, mf_shift + mf_option }, \
			Keypress { kc_C, mf_command },	\
			endSequence{},	\
		Event { "main frame", "" },	Click { 1, 0, 0, window, "1", _centerCenter },	\
		Event { "left edge", "" },	Click { 1, 3, 350, window, "1", _topLeft },	\
		Event { "go back", "", },	Keypress { kc_bracket, mf_command },			\
		Event { "go forward", "", },Keypress { kc_closeBracket, mf_command },		\
		Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
		Event { "page north", "" },	Keypress { kc_pageup, 0 },		\
		Event { "page top", "" },	Keypress { kc_home, 0 },		\
		Event { "page end", "" },	Keypress { kc_end, 0 }

#pragma mark Browser
	#define	_BrowseCdocResID_	resid_DocBrowser
	#define _mainFrame_h		0
	#define _mainFrame_v		75
	#define _homeApp			Apps_"Safari.app"
_BrowseCdocSlate_

#pragma mark BrowseDoxygen
	#define	_BrowseDoxygenResID_	resid_BrowseDoxygen
	#define	_mainFrame_h			0
	#define	_mainFrame_v			75
	#define _homeApp				Apps_"Safari.app"
_BrowseDoxygenSlate_	

resource restype_Slate (resid_Links, "scan among links") { {
	Slate { "links", {
		_SlateGlobals_,
		ExitEvent { "enter", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "okay", "" },		NilAction{},
		Event { "tab", "" },			Keypress { kc_tab, mf_option },
		Event { "back", "" },			Keypress { kc_tab, mf_shift + mf_option },
	} }
} };

resource restype_Slate (resid_Buttons, "scan among buttons") { {
	Slate { "buttons", {
		_SlateGlobals_,
		ExitEvent { "enter", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "okay", "" },		NilAction{},
		Event { "tab", "" },			Keypress { kc_tab, 0 },
		Event { "back", "" },			Keypress { kc_tab, mf_shift },
	} }
} };

#pragma mark Scan Links
resource restype_Slate (resid_ScanLinks, "scan among buttons and links") { {
	Slate { "scan", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		CloseSubslate{},
		ExitEvent { "go", "" },			Keypress { kc_enter, 0 },
		Event { "tab", "" },			Keypress { kc_tab, 0 },
		Event { "back", "" },			Keypress { kc_tab, mf_shift },
		Event { "jump", "" },			Subslate { "jump" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "enter", "" },	Keypress { kc_enter, 0 },
			Event { "tab", "" },		Sequence{},
				Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },
				endSequence{},
			Event { "back", "" },		Sequence{},
				Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },
				endSequence{},
			endSubslate{},
		Event { "links", "" },			Subslate { "links" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "enter", "" },	Keypress { kc_enter, 0 },
			Event { "tab", "" },		Keypress { kc_tab, mf_option },
			Event { "back", "" },		Keypress { kc_tab, mf_shift + mf_option },
			Event { "jump", "" },		Subslate { "jump" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "enter", "" },	Keypress { kc_enter, 0 },
				Event { "tab", "" },		Sequence{},
					Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },
					endSequence{},
				Event { "back", "" },		Sequence{},
					Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },
					endSequence{},
				endSubslate{},
			endSubslate{}
	} }
} };

#pragma mark 1 === Bookmarks

resource restype_Slate (resid_Bookmarks, "Bookmarks") { {
	Slate { "Bookmarks",	{
		_SafariStandards_,
		ExitEvent { "okay", "" },				_return,
		ExitEvent { "cancel", "" },				Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },				NilAction{},
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_LetterKeys_,
		Event { "Edit", "" },			Sequence{}, Keypress { kc_B, mf_command+ mf_option },
			ResSubslate { resid_EditBookmarks }, endSequence{},
	} }
} };

resource restype_Slate (resid_EditBookmarks, "Edit Bookmarks") { {
	Slate { "Edit",	{
		_SafariStandards_,
		ExitEvent { "okay", "" },		_return,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "next window", "" },	Keypress { kc_accent, mf_command },
		Event { "Browser", "" },		ResSubslate { resid_DocBrowser },
		Event { "show", "" },			Keypress { kc_B, mf_command + mf_option },
		Event { "add bookmark", "" },	Keypress { kc_D, mf_command },
		Event { "open folder", "" },	Keypress { kc_right, mf_command },
		Event { "close folder", "" },	Keypress { kc_left, mf_command },
		Event { "add folder", "" },		Click { 1, 202, -27, _window, _bottomLeft },
		Event { "move to folder", "" },	ClickMod { 1, 202, -27, _window, _bottomLeft, mf_option },
		Event { "row 1", "" },			Click { 1, 0, 380, _window, _topCenter },
		Event { "cancel", "" },			Keypress { kc_period, mf_command },
	} }
} };

#pragma mark 2 Apple
#pragma mark LeftIndex
#define LINDX_left	45
#define LINDX_top	80
#define LINDX_csp	0
#define LINDX_rsp	28
#define LINDX_dv	12
#define LINDX_dh	24

resource restype_Slate (resid_loLeftIndex, "LeftIndex") { {
	Slate { "LeftIndex",	{
		_SafariStandards_,
		_CloseSubslate_,
		ExitEvent { "select", "" },		Sequence{},
			IMouse { im_Click, 1 },
			Click { 1, 0, 0, window, "1", _center },
			endSequence{},
		Event { "click one", ""	},		IMouse { im_Click, 1 },
		Event { "north", "" },			Click { 0, 0, -LINDX_dv, _cursor },
		Event { "down", "" },			Click { 0, 0, LINDX_dv, _cursor },
		Event { "left", "" },			Click { 0, -LINDX_dh, 0, _cursor },
		Event { "right", "" },			Click { 0, LINDX_dh, 0, _cursor },
		Event { "one", "" },			Click { 0, LINDX_left, LINDX_top + 0 * LINDX_rsp, window, "1", _topLeft },
		Event { "two", "" },			Click { 0, LINDX_left, LINDX_top + 1 * LINDX_rsp, window, "1", _topLeft },
		Event { "three", "" },			Click { 0, LINDX_left, LINDX_top + 2 * LINDX_rsp, window, "1", _topLeft },
		Event { "four", "" },			Click { 0, LINDX_left, LINDX_top + 3 * LINDX_rsp, window, "1", _topLeft },
		Event { "five", "" },			Click { 0, LINDX_left, LINDX_top + 4 * LINDX_rsp, window, "1", _topLeft },
		Event { "six", "" },			Click { 0, LINDX_left, LINDX_top + 5 * LINDX_rsp, window, "1", _topLeft },
		Event { "seven", "" },			Click { 0, LINDX_left, LINDX_top + 6 * LINDX_rsp, window, "1", _topLeft },
		Event { "eight", "" },			Click { 0, LINDX_left, LINDX_top + 7 * LINDX_rsp, window, "1", _topLeft },
		Event { "nine", "" },			Click { 0, LINDX_left, LINDX_top + 8 * LINDX_rsp, window, "1", _topLeft },
		Event { "ten", "" },			Click { 0, LINDX_left, LINDX_top + 9 * LINDX_rsp, window, "1", _topLeft },
		Event { "eleven", "" },			Click { 0, LINDX_left, LINDX_top + 10 * LINDX_rsp, window, "1", _topLeft },
		Event { "twelve", "" },			Click { 0, LINDX_left, LINDX_top + 11 * LINDX_rsp, window, "1", _topLeft },
		Event { "thirteen", "" },		Click { 0, LINDX_left, LINDX_top + 12 * LINDX_rsp, window, "1", _topLeft },
		Event { "fourteen", "" },		Click { 0, LINDX_left, LINDX_top + 13 * LINDX_rsp, window, "1", _topLeft },
		Event { "fifteen", "" },		Click { 0, LINDX_left, LINDX_top + 14 * LINDX_rsp, window, "1", _topLeft },
		Event { "sixteen", "" },		Click { 0, LINDX_left, LINDX_top + 15 * LINDX_rsp, window, "1", _topLeft },
		Event { "seventeen", "" },		Click { 0, LINDX_left, LINDX_top + 16 * LINDX_rsp, window, "1", _topLeft },
		Event { "eighteen", "" },		Click { 0, LINDX_left, LINDX_top + 17 * LINDX_rsp, window, "1", _topLeft },
		Event { "nineteen", "" },		Click { 0, LINDX_left, LINDX_top + 18 * LINDX_rsp, window, "1", _topLeft },
		Event { "twenty", "" },			Click { 0, LINDX_left, LINDX_top + 19 * LINDX_rsp, window, "1", _topLeft },
	} }
} };

#pragma mark AppleTopics
#define TOPC_left	130
#define TOPC_top	80
#define TOPC_csp	160
#define TOPC_rsp	36
#define TOPC_dv		12
#define TOPC_dh		24

resource restype_Slate (resid_loAppleTopics, "AppleTopics Layout") { {
	Slate { "AppleTopics",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "click one", ""	},		IMouse { im_Click, 1 },
		Event { "north", "" },			Click { 0, 0, -TOPC_dv, _cursor },
		Event { "down", "" },			Click { 0, 0, TOPC_dv, _cursor },
		Event { "left", "" },			Click { 0, -TOPC_dh, 0, _cursor },
		Event { "right", "" },			Click { 0, TOPC_dh, 0, _cursor },
		Event { "left", "" },			Click { 0, -12, 0, _cursor },
		Event { "right", "" },			Click { 0, 12, 0, _cursor },
		Event { "alpha", "" },			Click { 0, TOPC_left + 0 * TOPC_csp, TOPC_top, window, "1", _topLeft },
		Event { "bravo", "" },			Click { 0, TOPC_left + 1 * TOPC_csp, TOPC_top, window, "1", _topLeft },
		Event { "charlie", "" },		Click { 0, TOPC_left + 2 * TOPC_csp, TOPC_top, window, "1", _topLeft },
		Event { "one", "" },			Click { 0, 0, 1 * TOPC_rsp, _cursor },
		Event { "two", "" },			Click { 0, 0, 2 * TOPC_rsp, _cursor },
		Event { "three", "" },			Click { 0, 0, 3 * TOPC_rsp, _cursor },
		Event { "four", "" },			Click { 0, 0, 4 * TOPC_rsp, _cursor },
		Event { "five", "" },			Click { 0, 0, 5 * TOPC_rsp, _cursor },
		Event { "six", "" },			Click { 0, 0, 6 * TOPC_rsp, _cursor },
		Event { "seven", "" },			Click { 0, 0, 7 * TOPC_rsp, _cursor },
		Event { "eight", "" },			Click { 0, 0, 8 * TOPC_rsp, _cursor },
		Event { "nine", "" },			Click { 0, 0, 9 * TOPC_rsp, _cursor },
		Event { "ten", "" },			Click { 0, 0, 10 * TOPC_rsp, _cursor },
		Event { "eleven", "" },			Click { 0, 0, 11 * TOPC_rsp, _cursor },
		Event { "twelve", "" },			Click { 0, 0, 12 * TOPC_rsp, _cursor },
		Event { "thirteen", "" },		Click { 0, 0, 13 * TOPC_rsp, _cursor },
		Event { "fourteen", "" },		Click { 0, 0, 14 * TOPC_rsp, _cursor },
		Event { "fifteen", "" },		Click { 0, 0, 15 * TOPC_rsp, _cursor },
		Event { "sixteen", "" },		Click { 0, 0, 16 * TOPC_rsp, _cursor },
		Event { "seventeen", "" },		Click { 0, 0, 17 * TOPC_rsp, _cursor },
		Event { "eighteen", "" },		Click { 0, 0, 18 * TOPC_rsp, _cursor },
		Event { "nineteen", "" },		Click { 0, 0, 19 * TOPC_rsp, _cursor },
		Event { "twenty", "" },			Click { 0, 0, 20 * TOPC_rsp, _cursor },
		ExitEvent { "select", "" },		IMouse { im_Click, 1 },
	} }
} };

#pragma mark AppleContent
resource restype_Slate (resid_loAppleContent, "AppleContent Layout") { {
	Slate { "AppleContent",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "next page", "" },				Click { 0, -56, 224, window, "1", _topRight },
		Event { "previous page", "" },			Click { 0, -116, 224, window, "1", _topRight },
		Event { "advanced search", "" },		Click { 0, -150, 150, window, "1", _topRight },
		Event { "north", "" },					Click { 0, 0, -12, _cursor },
		Event { "down", "" },					Click { 0, 0, 12, _cursor },
		Event { "left", "" },					Click { 0, -40, 0, _cursor },
		Event { "right", "" },					Click { 0, 40, 0, _cursor },
		Event { "click one", "" },				IMouse { im_Click, 1 },
		Event { "index", "" },					ResSubslate { resid_loLeftIndex },
		Event { "parent", "go up to parent" },	Subslate { "parent" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "one", "" },					Click { 0, 240, 200, window, "1", _topLeft },
			Event { "two", "" },					Click { 0, 330, 200, window, "1", _topLeft },
			Event { "three", "" },					Click { 0, 420, 200, window, "1", _topLeft },
			Event { "four", "" },					Click { 0, 510, 200, window, "1", _topLeft },
			Event { "five", "" },					Click { 0, 600, 200, window, "1", _topLeft },
			Event { "six", "" },					Click { 0, 690, 200, window, "1", _topLeft },
			Event { "seven", "" },					Click { 0, 780, 200, window, "1", _topLeft },
			Event { "eight", "" },					Click { 0, 870, 200, window, "1", _topLeft },
			Event { "north", "" },					Click { 0, 0, -12, _cursor },
			Event { "down", "" },					Click { 0, 0, 12, _cursor },
			Event { "left", "" },					Click { 0, -40, 0, _cursor },
			Event { "right", "" },					Click { 0, 40, 0, _cursor },
			ExitEvent { "select", "" },				IMouse { im_Click, 1 },
			endSubslate{},
	} }
} };

#pragma mark DocumentList
#define DLIST_left	340
#define DLIST_top	80
#define DLIST_csp	0
#define DLIST_rsp	28
#define DLIST_dv	12
#define DLIST_dh	24

resource restype_Slate (resid_loDocumentList, "DocumentList Layout") { {
	Slate { "DocumentList",	{
		_SafariStandards_,
		_CloseSubslate_,
		ExitEvent { "select", "" },		IMouse { im_Click, 1 },
		Event { "click one", ""	},		IMouse { im_Click, 1 },
		Event { "sort by title", "" },	Click { 0, 225, 560, window, "1", _topLeft },
		Event { "sort by name", "" },	Click { 0, 575, 560, window, "1", _topLeft },
		Event { "north", "" },			Click { 0, 0, -DLIST_dv, _cursor },
		Event { "down", "" },			Click { 0, 0, DLIST_dv, _cursor },
		Event { "left", "" },			Click { 0, -DLIST_dh, 0, _cursor },
		Event { "right", "" },			Click { 0, DLIST_dh, 0, _cursor },
		Event { "one", "" },			Click { 0, DLIST_left, DLIST_top + 0 * DLIST_rsp, window, "1", _topLeft },
		Event { "two", "" },			Click { 0, DLIST_left, DLIST_top + 1 * DLIST_rsp, window, "1", _topLeft },
		Event { "three", "" },			Click { 0, DLIST_left, DLIST_top + 2 * DLIST_rsp, window, "1", _topLeft },
		Event { "four", "" },			Click { 0, DLIST_left, DLIST_top + 3 * DLIST_rsp, window, "1", _topLeft },
		Event { "five", "" },			Click { 0, DLIST_left, DLIST_top + 4 * DLIST_rsp, window, "1", _topLeft },
		Event { "six", "" },			Click { 0, DLIST_left, DLIST_top + 5 * DLIST_rsp, window, "1", _topLeft },
		Event { "seven", "" },			Click { 0, DLIST_left, DLIST_top + 6 * DLIST_rsp, window, "1", _topLeft },
		Event { "eight", "" },			Click { 0, DLIST_left, DLIST_top + 7 * DLIST_rsp, window, "1", _topLeft },
		Event { "nine", "" },			Click { 0, DLIST_left, DLIST_top + 8 * DLIST_rsp, window, "1", _topLeft },
		Event { "ten", "" },			Click { 0, DLIST_left, DLIST_top + 9 * DLIST_rsp, window, "1", _topLeft },
		Event { "eleven", "" },			Click { 0, DLIST_left, DLIST_top + 10 * DLIST_rsp, window, "1", _topLeft },
		Event { "twelve", "" },			Click { 0, DLIST_left, DLIST_top + 11 * DLIST_rsp, window, "1", _topLeft },
		Event { "thirteen", "" },		Click { 0, DLIST_left, DLIST_top + 12 * DLIST_rsp, window, "1", _topLeft },
		Event { "fourteen", "" },		Click { 0, DLIST_left, DLIST_top + 13 * DLIST_rsp, window, "1", _topLeft },
		Event { "fifteen", "" },		Click { 0, DLIST_left, DLIST_top + 14 * DLIST_rsp, window, "1", _topLeft },
		Event { "sixteen", "" },		Click { 0, DLIST_left, DLIST_top + 15 * DLIST_rsp, window, "1", _topLeft },
		Event { "seventeen", "" },		Click { 0, DLIST_left, DLIST_top + 16 * DLIST_rsp, window, "1", _topLeft },
		Event { "eighteen", "" },		Click { 0, DLIST_left, DLIST_top + 17 * DLIST_rsp, window, "1", _topLeft },
		Event { "nineteen", "" },		Click { 0, DLIST_left, DLIST_top + 18 * DLIST_rsp, window, "1", _topLeft },
		Event { "twenty", "" },			Click { 0, DLIST_left, DLIST_top + 19 * DLIST_rsp, window, "1", _topLeft },
	} }
} };

#pragma mark AppleSearch Results
#define APPRES_left	220
#define APPRES_top	80
#define APPRES_csp	0
#define APPRES_rsp	36
#define APPRES_dv	12
#define APPRES_dh	24

resource restype_Slate (resid_loAppleResults, "AppleResults Layout") { {
	Slate { "AppleResults",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "advanced search", "" },Click { 0, 380, 332, window, "1", _topLeft },
		Event { "display", "" },		Click { 0, 630, 360, window, "1", _topLeft },
		Event { "previous", "" },		Click { 0, 700, 524, window, "1", _topLeft },
		Event { "next", "" },			Click { 0, 750, 524, window, "1", _topLeft },
		Event { "click one", ""	},		IMouse { im_Click, 1 },
		Event { "north", "" },			Click { 0, 0, -APPRES_dv, _cursor },
		Event { "down", "" },			Click { 0, 0, APPRES_dv, _cursor },
		Event { "left", "" },			Click { 0, -APPRES_dh, 0, _cursor },
		Event { "right", "" },			Click { 0, APPRES_dh, 0, _cursor },
		Event { "one", "" },			Click { 0, APPRES_left, APPRES_top + 0 * APPRES_rsp, window, "1", _topLeft },
		Event { "two", "" },			Click { 0, APPRES_left, APPRES_top + 1 * APPRES_rsp, window, "1", _topLeft },
		Event { "three", "" },			Click { 0, APPRES_left, APPRES_top + 2 * APPRES_rsp, window, "1", _topLeft },
		Event { "four", "" },			Click { 0, APPRES_left, APPRES_top + 3 * APPRES_rsp, window, "1", _topLeft },
		Event { "five", "" },			Click { 0, APPRES_left, APPRES_top + 4 * APPRES_rsp, window, "1", _topLeft },
		Event { "six", "" },			Click { 0, APPRES_left, APPRES_top + 5 * APPRES_rsp, window, "1", _topLeft },
		Event { "seven", "" },			Click { 0, APPRES_left, APPRES_top + 6 * APPRES_rsp, window, "1", _topLeft },
		Event { "eight", "" },			Click { 0, APPRES_left, APPRES_top + 7 * APPRES_rsp, window, "1", _topLeft },
		Event { "nine", "" },			Click { 0, APPRES_left, APPRES_top + 8 * APPRES_rsp, window, "1", _topLeft },
		Event { "ten", "" },			Click { 0, APPRES_left, APPRES_top + 9 * APPRES_rsp, window, "1", _topLeft },
		Event { "eleven", "" },			Click { 0, APPRES_left, APPRES_top + 10 * APPRES_rsp, window, "1", _topLeft },
		Event { "twelve", "" },			Click { 0, APPRES_left, APPRES_top + 11 * APPRES_rsp, window, "1", _topLeft },
		Event { "thirteen", "" },		Click { 0, APPRES_left, APPRES_top + 12 * APPRES_rsp, window, "1", _topLeft },
		Event { "fourteen", "" },		Click { 0, APPRES_left, APPRES_top + 13 * APPRES_rsp, window, "1", _topLeft },
		Event { "fifteen", "" },		Click { 0, APPRES_left, APPRES_top + 14 * APPRES_rsp, window, "1", _topLeft },
		Event { "sixteen", "" },		Click { 0, APPRES_left, APPRES_top + 15 * APPRES_rsp, window, "1", _topLeft },
	} }
} };

#pragma mark Layout Index
resource restype_Slate (resid_Layout, "Layouts") { {
	Slate { "lo",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Topics", "Apple Topics" },				ResSubslate { resid_loAppleTopics },
		ExitEvent { "Results", "Apple Search Results" },	ResSubslate { resid_loAppleResults },
		ExitEvent { "Content", "AppleContent" },			ResSubslate { resid_loAppleContent },
		ExitEvent { "Document List", "Document List" },		ResSubslate { resid_loDocumentList },
	} }
} };

#pragma mark 3 Arbonne
resource restype_Slate (resid_Arbonne, "Arbonne Slate") { {
	Slate { "Arbonne",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Window", "" },		ClickMenu { "Window" },
			endSubslate{},
		Event { "identify", "" },			Sequence{},
			TypeText { "15375149" },
			Keypress { kc_tab, 0 },
			KeyDelay { kc_A, mf_command, 2 },
			TypeText { "8104" },
			Keypress { kc_enter, 0 },
			endSequence{},
		Event { "Home", "" },				Sequence{},
			ResSubslate { resid_arbHome },
			Click { 0, 390, 390, window, "1", _topLeft },
			endSequence{},
		Event { "Shopping", "" },			ResSubslate { resid_arbShop },
		Event { "Web Stats", "" },			Sequence{},
			ResSubslate { resid_arbWebStats }, Click { 0, 230, 125, _window, _topCenter }, endSequence{},
		Event { "Browser", "" },			ResSubslate { resid_DocBrowser },
	 } }
} };

#pragma mark Home
resource restype_Slate (resid_arbHome, "Arbonne Home Slate") { {
	Slate { "Home",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "click one", "" },			IMouse { im_Click, 1 },
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Window", "" },		ClickMenu { "Window" },
			endSubslate{},
		Event { "Browser", "" },			ResSubslate { resid_DocBrowser },
	 } }
} };

#pragma mark Shop
resource restype_Slate (resid_arbShop, "Arbonne Shopping") { {
	Slate { "Shop",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Window", "" },		ClickMenu { "Window" },
			endSubslate{},
		Event { "Browser", "" },			ResSubslate { resid_DocBrowser },
		Event { "Quick Form", "" },			Click { 1, -57, 215, _window, _topCenter },
		Event { "Autoship", "" },			Click { 1, 7, 215, _window, _topCenter },
		Event { "Product Catalog", "" },	Click { 1, -350, 290, _window, _topCenter },
		Event { "Business Aids", "" },		Click { 1, -290, 290, _window, _topCenter },
		Event { "The Place", "" },			Click { 1, -230, 290, _window, _topCenter },
		Event { "View Cart", "" },			Click { 1, 210, 115, _window, _topCenter },
		Event { "index", "" },				Sequence{},
			Click { 0, -360, 320, _window, _topCenter },
			ResSubslate { resid_arbShopIndex },
			endSequence{},
		Event { "show all", "" },			Sequence{}, Click { 1, 305, 300, _window, _topCenter },
			TypeText { "All" }, Keypress { kc_return, 0 }, endSequence{},
	 } }
} };

resource restype_Slate (resid_arbShopIndex, "Arbonne Shopping") { {
	Slate { "index",	{
		_SafariStandards_,
		_SlateGlobals_,
		Event { "one", "" },		Click { 0, 0, 10, _cursor },
		Event { "two", "" },		Click { 0, 0, 20, _cursor },
		Event { "three", "" },		Click { 0, 0, 30, _cursor },
		Event { "four", "" },		Click { 0, 0, 40, _cursor },
		Event { "five", "" },		Click { 0, 0, 50, _cursor },
		Event { "six", "" },		Click { 0, 0, 60, _cursor },
		Event { "seven", "" },		Click { 0, 0, 70, _cursor },
		Event { "eight", "" },		Click { 0, 0, 80, _cursor },
		Event { "nine", "" },		Click { 0, 0, 90, _cursor },
		Event { "ten", "" },		Click { 0, 0, 100, _cursor },
		Event { "eleven", "" },		Click { 0, 0, 110, _cursor },
		Event { "twelve", "" },		Click { 0, 0, 120, _cursor },
		Event { "thirteen", "" },	Click { 0, 0, 130, _cursor },
		Event { "fourteen", "" },	Click { 0, 0, 140, _cursor },
		Event { "fifteen", "" },	Click { 0, 0, 150, _cursor },
		Event { "sixteen", "" },	Click { 0, 0, 160, _cursor },
		Event { "seventeen", "" },	Click { 0, 0, 170, _cursor },
		Event { "eighteen", "" },	Click { 0, 0, 180, _cursor },
		Event { "nineteen", "" },	Click { 0, 0, 190, _cursor },
		Event { "twenty", "" },		Click { 0, 0, 200, _cursor },
		ExitEvent { "exit", "" },	NilAction{},
		ExitEvent { "okay", "" },	Click { 1, 0, 0, _cursor },
	 } }
} };

/* what did this do?*/
#pragma mark Shop_Specials
resource restype_Slate (resid_arbShopSpecials, "Arbonne Specials") { {
	Slate { "specials",	{
		_SafariStandards_,
		_SlateGlobals_,
		Event { "bonus", "" },			Click { 0, 255, 225, window, "1", _topLeft },
		Event { "monthly", "" },		Click { 0, 255, 266, window, "1", _topLeft },
		Event { "starter", "" },		Click { 0, 255, 307, window, "1", _topLeft },
		Event { "bronzer", "" },		Click { 0, 255, 348, window, "1", _topLeft },
		Event { "tote", "" },			Click { 0, 255, 389, window, "1", _topLeft },
		Event { "travel set", "" },		Click { 0, 255, 430, window, "1", _topLeft },
		Event { "host gift", "" },		Click { 0, 255, 471, window, "1", _topLeft },
		Event { "special products", "" },	Click { 0, 255, 512, window, "1", _topLeft },
		Event { "continue", "" },		Click { 0, 330, 555, window, "1", _topLeft },
		Event { "update", "" },			Click { 0, 455, 555, window, "1", _topLeft },
		Event { "complete", "" },		Click { 0, 590, 555, window, "1", _topLeft },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "okay", "" },		Sequence{},
			Click { 1, 0, 0, _cursor },
			Click { 0, 475, 315, window, "1", _topLeft },
			endSequence{},
	 } }
} };

#pragma mark WebStats
resource restype_Slate (resid_arbWebStats, "Arbonne WebStats Slate") { {
	Slate { "WebStats",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "Browser", "" },			ResSubslate { resid_DocBrowser },
		Event { "Home", "" },				Click { 1, 85, 400, window, "1", _topRight },
		Event { "Orders", "" },				Sequence{},
			Click { 1, 85, 435, window, "1", _topLeft },
			ResSubslate { resid_arbwsOrders },
			endSequence{},
		Event { "Volume", "" },				Sequence{},
			Click { 1, 85, 485, window, "1", _topLeft },
			ResSubslate { resid_arbwsVolume },
			endSequence{},
		Event { "Clients", "" },			Click { 1, 85, 515, window, "1", _topLeft },
		Event { "Points", "" },				Click { 1, 85, 545, window, "1", _topLeft },
		Event { "Reports", "" },			Click { 1, 85, 575, window, "1", _topLeft },
		Event { "Commissions", "" },		Click { 1, 85, 605, window, "1", _topLeft },
		Event { "Profile", "" },			Click { 1, 85, 635, window, "1", _topLeft },
		Event { "Help", "" },				Click { 1, 85, 665, window, "1", _topLeft },
	 } }
} };

resource restype_Slate (resid_arbwsVolume, "Arbonne WebStats Volume") { {
	Slate { "Volume",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "period", "" },		Click { 2, 255, 500, window, "1", _topLeft },
		Event { "search", "" },		Click { 1, 510, 500, window, "1", _topLeft },
		Event { "current", "" },	Click { 1, 290, 560, window, "1", _topLeft },
		Event { "history", "" },	Click { 1, 330, 560, window, "1", _topLeft },
		Event { "roster", "" },		Click { 1, 370, 560, window, "1", _topLeft },
		Event { "item", "" },		Click { 0, 25, 80, window, "1", _topLeft },
		Event { "rest ???", "" },	NilAction{},
		Event { "name", "" },		Click { 0, 327, 80, window, "1", _topLeft },
		Event { "volume", "" },		Click { 0, 455, 80, window, "1", _topLeft },
		Event { "one", "" },		Click { 1, 0, 20, _cursor },
		Event { "two", "" },		Click { 1, 0, 40, _cursor },
		Event { "three", "" },		Click { 1, 0, 60, _cursor },
		Event { "four", "" },		Click { 1, 0, 80, _cursor },
		Event { "five", "" },		Click { 1, 0, 100, _cursor },
		Event { "six", "" },		Click { 1, 0, 120, _cursor },
		Event { "seven", "" },		Click { 1, 0, 140, _cursor },
		Event { "eight", "" },		Click { 1, 0, 160, _cursor },
		Event { "nine", "" },		Click { 1, 0, 180, _cursor },
		Event { "ten", "" },		Click { 1, 0, 200, _cursor },
		Event { "eleven", "" },		Click { 1, 0, 220, _cursor },
		Event { "twelve", "" },		Click { 1, 0, 240, _cursor },
		Event { "thirteen", "" },	Click { 1, 0, 260, _cursor },
		Event { "fourteen", "" },	Click { 1, 0, 280, _cursor },
		Event { "fifteen", "" },	Click { 1, 0, 300, _cursor },
		Event { "sixteen", "" },	Click { 1, 0, 320, _cursor },
		Event { "seventeen", "" },	Click { 1, 0, 340, _cursor },
		Event { "eighteen", "" },	Click { 1, 0, 360, _cursor },
		Event { "nineteen", "" },	Click { 1, 0, 380, _cursor },
		Event { "twenty", "" },		Click { 1, 0, 400, _cursor },
	 } }
} };

resource restype_Slate (resid_arbwsOrders, "Arbonne WebStats Orders") { {
	Slate { "Orders",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "transaction", "" },	Click { 0, 300, 550, window, "1", _topLeft },
	 } }
} };

#pragma mark 7 YahooHome
resource restype_Slate (resid_YahooHome, "") { {
	Slate { "YahooHome",	{
		_SafariStandards_,
		_CloseSubslate_,
//		Event { "buttons", "" },		ResSubslate { resid_Buttons },
//		Event { "links", "" },			ResSubslate { resid_Links },
//		Event { "scan", "" },			ResSubslate { resid_ScanLinks },
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_ScanAheadSubslate_,
		_ScanBackSubslate_,
		Event { "panel", "" },		Subslate { "panel" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "quick links", "" },	Click { 1, 50, 185, _window, _topLeft },
			Event { "General", "" },		Click { 1, 135, 185, _window, _topLeft },
			Event { "News", "" },			Click { 1, 200, 185, _window, _topLeft },
			Event { "Sports", "" },			Click { 1, 260, 185, _window, _topLeft },
			Event { "Entertainment", "" },	Click { 1, 340, 185, _window, _topLeft },
			Event { "more widgets", "" },	Click { 1, 470, 185, _window, _topLeft },
			endSubslate{},
	} }
} };

#define tabv_	263
#define tabl_	718
#define tabsp_	102
#pragma mark SafariOnline
resource restype_Slate (resid_SafariOnline, "") { {
	Slate { "Online",	{
		_SafariStandards_,
		_CloseSubslate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_ScanAheadSubslate_,
		_ScanBackSubslate_,
		Event { "my Safari", "" },		Click { 1, 150, 145, _window, _topLeft },
		Event { "search", "" },			Click { 1, 105, 180, _window, _topLeft },
		Event { "results", "" },		Click { 1, -200, 295, _window, _topCenter },
		Event { "categories", "" },		Click { 1, -100, 147, _window, _topRight },
		Event { "Favorites", "" },		Click { 1, tabl_+0*tabsp_, tabv_, _window, _topRight },
		Event { "Notes", "" },			Click { 1, tabl_+1*tabsp_, tabv_, _window, _topRight },
		Event { "Bookmarks", "" },		Click { 1, tabl_+2*tabsp_, tabv_, _window, _topRight },
		Event { "Downloads", "" },		Click { 1, tabl_+3*tabsp_, tabv_, _window, _topRight },
		Event { "Recent Views", "" },	Click { 1, tabl_+4*tabsp_, tabv_, _window, _topRight },
		Event { "Recent Searches", "" },Click { 1, tabl_+5*tabsp_, tabv_, _window, _topRight },
		Event { "return to results", "" },Click { 1, 300, 235, _window, _topRight },
	} }
} };

#pragma mark gmail
resource restype_Slate (resid_gmail, "") { {
	Slate { "gmail",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "login", "" },			Sequence{}, TypeText { "caroljimclark@gmail.com" }, _tab, TypeText { "cc686868" }, endSequence{},
	} }
} };

resource restype_Slate (resid_Facebook, "") { {
	Slate { "Facebook",	{
		_SafariStandards_,
		Event { "buttons", "" },		ResSubslate { resid_Buttons },
		Event { "links", "" },			ResSubslate { resid_Links },
		Event { "scan", "" },			ResSubslate { resid_ScanLinks },
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "search box", "" },		Click { 1, -149, 87, _window, _topRight },
		Event { "home", "" },			Click { 1, 147, 88, _window, _topLeft },
		Event { "inbox", "" },			Click { 1, 317, 88, _window, _topLeft },
		Event { "requests", "" },		Click { 1, -292, 164, _window, _topRight },
	} }
} };

#pragma mark 8 Miscellaneous

#pragma mark Login
resource restype_Slate (resid_Login, "Login Slate") { {
	Slate { "Login",	{
		_SafariStandards_,
		_CloseSubslate_,
		ExitEvent { "Dot Mac", "" },	Sequence{},
			TypeText { "carollclark" },
			Keypress { kc_tab, 0 },
			TypeText { "cc686868" },
			Keypress { kc_enter, 0 },
			endSequence{},
		ExitEvent { "Musical Heritage", "" },	Sequence{},
			TypeText { "carolclark@cox.net" },
			Keypress { kc_tab, 0 },
			TypeText { "6868" },
			Keypress { kc_enter, 0 },
			endSequence{},
		ExitEvent { "Arbonne", "" },	Sequence{},
			TypeText { "15375149" },
			Keypress { kc_tab, 0 },
			TypeText { "8104" },
			Keypress { kc_enter, 0 },
			endSequence{},
		ExitEvent { "Library", "" },	Sequence{},
			TypeText { "23278007349223" },
			Keypress { kc_tab, 0 },
			TypeText { "2747" },
			Keypress { kc_enter, 0 },
			endSequence{},
		ExitEvent { "Punkin", "" },		TypeText { "4YZHqz5pq1" },
		Event { "Discover", "" },		ResSubslate { resid_Discover },
		Event { "AirTran", "" },		ResSubslate { resid_AirTran },
	 } }
} };

resource restype_Slate (resid_Discover, "Discover Slate") { {
	Slate { "Discover",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "name", "" },		TypeText { "Carol L Clark" },
		Event { "number", "" },		TypeText { "6011499463079978" },
		Event { "month", "" },		TypeText { "07" },
		Event { "long year", "" },	TypeText { "2016" },
		Event { "year", "" },		TypeText { "16" },
		Event { "zip", "" },		TypeText { "67220" },
		Event { "security", "" },	TypeText { "983" },
		Event { "tab", "" },		Keypress { kc_tab, 0 },
	 } }
} };

resource restype_Slate (resid_AirTran, "AirTran Slate") { {
	Slate { "AirTran",	{
		_SafariStandards_,
		_CloseSubslate_,
		Event { "name", "" },		TypeText { "Carol Lynne Clark" },
		Event { "number", "" },		TypeText { "4327470004698976" },
		Event { "month", "" },		TypeText { "04" },
		Event { "long year", "" },	TypeText { "2013" },
		Event { "year", "" },		TypeText { "13" },
		Event { "zip", "" },		TypeText { "67220" },
		Event { "security", "" },	TypeText { "686" },
		Event { "tab", "" },		Keypress { kc_tab, 0 },
	 } }
} };

#pragma mark Puzzles	
#define _SudokuBase_		\
		_SlateGlobals_,		\
		_DirectionKeys_,	\
		_IMouseSlate_,		\
		_ReturnKey_,		\
		_WindowSlate_,		\
		_CloseSubslate_,	\
		ExitEvent { "close window", "" },	Keypress { kc_W, mf_command },		\
		Event { "fix window", "" },		Sequence{},			\
			Click { 0, 85, 10, window, "1", _topLeft },		\
			Click { -1, 480, 29, _screen, _topLeft },		\
			endSequence{},			\
		Event { "jump left", "left <n> times" },	Subslate { "<n>" },	\
			_SlateGlobals_,		\
			_CloseSubslate_,	\
			_GoLeftItems_,		\
			endSubslate{},		\
		Event { "jump right", "right <n> times" },	Subslate { "<n>" },	\
			_SlateGlobals_,		\
			_CloseSubslate_,	\
			_GoRightItems_,		\
			endSubslate{},		\
		_JumpDownSubslate_,                                           \
		_JumpNorthSubslate_,                                          \
		_DeleteKey_,                                                  \
		_FDeleteKey_,                                                 \
		Event { "one",		"1" },	Keypress { kc_kp1, 0 },                \
		Event { "two",		"2" },	Keypress { kc_kp2, 0 },                \
		Event { "three",	"3" },	Keypress { kc_kp3, 0 },               \
		Event { "four",		"4" },	Keypress { kc_kp4, 0 },               \
		Event { "five",		"5" },	Keypress { kc_kp5, 0 },               \
		Event { "six",		"6" },	Keypress { kc_kp6, 0 },                \
		Event { "seven",	"7" },	Keypress { kc_kp7, 0 },               \
		Event { "eight",	"8" },	Keypress { kc_kp8, 0 },               \
		Event { "nine",		"9" },	Keypress { kc_kp9, 0 },               \
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },      \
		Event { "page north", "" },		Keypress { kc_pageup, 0 },       \
		Event { "page top", "" },		Keypress { kc_home, 0 },           \
		Event { "page end", "" },		Keypress { kc_end, 0 }

#define _pzlTop		524
resource restype_Slate (resid_sudokuTimes, "") { {
	Slate { "Times", {
		Event { "main frame", "" },		Click { 1, 10, -40, window, "1", _bottomLeft },
		Event { "undo", "" },			Click { 1, 455,	_pzlTop+173, window, "1", _topLeft },
		Event { "pencil", "" },			Click { 1, 455,	_pzlTop+191, window, "1", _topLeft },
		Event { "check", "" },			Click { 1, 455,	_pzlTop+213, window, "1", _topLeft },
		Event { "notes", "" },			Click { 1, 455,	_pzlTop+278, window, "1", _topLeft },
		Event { "clue", "" },			Click { 1, 455,	_pzlTop+300, window, "1", _topLeft },
		Event { "capital",		"shift key" },	Keypress { 0, mf_shift },
		Event { "lock shift",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },
		Event { "position puzzle", "" },	Sequence{}, Click { 1, 400, 400, window, "1", _topLeft }, KeyDelay { kc_down, 0, 20 }, KeyDelay { kc_down, 0, 20 }, KeyDelay { kc_down, 0, 20 }, endSequence{},
		Event { "lock option",	"lock or unlock option key" },	Keypress { 0, mf_control + mf_toggle },
		_SudokuBase_,
	} }
} };

resource restype_Slate (resid_sudokuPost, "") { {
	Slate { "Post", {
		Event { "main frame", "" },		Click { 1, 300, 500, window, "1", _topLeft },
		Event { "capital",		"shift key" },	Keypress { 0, mf_shift },
		Event { "lock shift",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },
		_SudokuBase_,
	} }
} };

resource restype_Slate (resid_sudokuThink, "") { {
	Slate { "Think", {
		_SudokuBase_,
	} }
} };

#define _clickAndReturnStart_	Sequence{}, Click { 1 
#define _clickAndReturnEnd_		_window, _topLeft }, Click { 1, 400, 650, _window, _topLeft },	\	 endSequence{}
#define _prev					Keypress { kc_tab, mf_option + mf_shift }
#define _url_					"http://www.dailysudoku.com/sudoku/archive/20"
#define _indexStart_			Sequence{}, Keypress { kc_W, mf_command }, \
									OpenURL { "http://www.dailysudoku.com/sudoku/archive/20"
resource restype_Slate (resid_sudokuDailyClean, "") { {
	Slate { "Clean", {
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		NilAction{},
		ExitEvent { "clean", "" },		_clickAndReturnStart_, 738, 540, _clickAndReturnEnd_,
	} }
} };

resource restype_Slate (resid_sudokuDaily, "") { {
	Slate { "Daily", {
		_WhitespaceKeys_,
		Event { "archives", "" },		Click { 1, 70, 260, _window, _topLeft },
		Event { "draw puzzle", "" },	Click { 1, 70, 320, _window, _topLeft },
		Event { "puzzle", "" },			Click { 1, 400, 650, _window, _topLeft },
		Event { "development", "" },	_clickAndReturnStart_, 355, 382, _clickAndReturnEnd_,
		Event { "show sweep", "" },			_clickAndReturnStart_, 688, 540, _clickAndReturnEnd_,
		Event { "clean", "" },			ResSubslate { resid_sudokuDailyClean },
		Event { "evaluate", "" },		_clickAndReturnStart_, 688, 564, _clickAndReturnEnd_,
		Event { "show clue", "" },		Click { 1, 738, 564, _window, _topLeft },
		Event { "save puzzle", "" },	_clickAndReturnStart_, 688, 613, _clickAndReturnEnd_,
		Event { "load puzzle", "" },	_clickAndReturnStart_, 738, 613, _clickAndReturnEnd_,
		Event { "set advance", "" },	_clickAndReturnStart_, 656, 636, _clickAndReturnEnd_,
		Event { "automatic", "" },		_clickAndReturnStart_, 656, 677, _clickAndReturnEnd_,
		Event { "online", "" },			Click { 1, 700, 647, _window, _topLeft },
		Event { "main frame", "" },		Click { 1, -100, -100, _window, _bottomRight },
		Event { "index", "" },			Subslate { "year" },
			_SlateGlobals_,
			ExitEvent { "cancel", "" },		NilAction{},
			ExitEvent { "five", "" },		Subslate { "month"},
				_SlateGlobals_,
				ExitEvent { "cancel", "" },		NilAction{},
				ExitEvent { "January", "" },	_indexStart_"05/01/index.html" }, endSequence{},
				ExitEvent { "February", "" },	_indexStart_"05/02/index.html" }, endSequence{},
				ExitEvent { "March", "" },		_indexStart_"05/03/index.html" }, endSequence{},
				ExitEvent { "April", "" },		_indexStart_"05/04/index.html" }, endSequence{},
				ExitEvent { "May", "" },		_indexStart_"05/05/index.html" }, endSequence{},
				ExitEvent { "June", "" },		_indexStart_"05/06/index.html" }, endSequence{},
				ExitEvent { "July", "" },		_indexStart_"05/07/index.html" }, endSequence{},
				ExitEvent { "August", "" },		_indexStart_"05/08/index.html" }, endSequence{},
				ExitEvent { "September", "" },	_indexStart_"05/09/index.html" }, endSequence{},
				ExitEvent { "October", "" },	_indexStart_"05/10/index.html" }, endSequence{},
				ExitEvent { "November", "" },	_indexStart_"05/11/index.html" }, endSequence{},
				ExitEvent { "December", "" },	_indexStart_"05/12/index.html" }, endSequence{},
				endSubslate{},
			ExitEvent { "six", "" },		Subslate { "month"},
				_SlateGlobals_,
				ExitEvent { "cancel", "" },		NilAction{},
				ExitEvent { "January", "" },	_indexStart_"06/01/index.html" }, endSequence{},
				ExitEvent { "February", "" },	_indexStart_"06/02/index.html" }, endSequence{},
				ExitEvent { "March", "" },		_indexStart_"06/03/index.html" }, endSequence{},
				ExitEvent { "April", "" },		_indexStart_"06/04/index.html" }, endSequence{},
				ExitEvent { "May", "" },		_indexStart_"06/05/index.html" }, endSequence{},
				ExitEvent { "June", "" },		_indexStart_"06/06/index.html" }, endSequence{},
				ExitEvent { "July", "" },		_indexStart_"06/07/index.html" }, endSequence{},
				ExitEvent { "August", "" },		_indexStart_"06/08/index.html" }, endSequence{},
				ExitEvent { "September", "" },	_indexStart_"06/09/index.html" }, endSequence{},
				ExitEvent { "October", "" },	_indexStart_"06/10/index.html" }, endSequence{},
				ExitEvent { "November", "" },	_indexStart_"06/11/index.html" }, endSequence{},
				ExitEvent { "December", "" },	_indexStart_"06/12/index.html" }, endSequence{},
				endSubslate{},
			ExitEvent { "seven", "" },		Subslate { "month"},
				_SlateGlobals_,
				ExitEvent { "cancel", "" },		NilAction{},
				ExitEvent { "January", "" },	_indexStart_"07/01/index.html" }, endSequence{},
				ExitEvent { "February", "" },	_indexStart_"07/02/index.html" }, endSequence{},
				ExitEvent { "March", "" },		_indexStart_"07/03/index.html" }, endSequence{},
				ExitEvent { "April", "" },		_indexStart_"07/04/index.html" }, endSequence{},
				ExitEvent { "May", "" },		_indexStart_"07/05/index.html" }, endSequence{},
				ExitEvent { "June", "" },		_indexStart_"07/06/index.html" }, endSequence{},
				ExitEvent { "July", "" },		_indexStart_"07/07/index.html" }, endSequence{},
				ExitEvent { "August", "" },		_indexStart_"07/08/index.html" }, endSequence{},
				ExitEvent { "September", "" },	_indexStart_"07/09/index.html" }, endSequence{},
				ExitEvent { "October", "" },	_indexStart_"07/10/index.html" }, endSequence{},
				ExitEvent { "November", "" },	_indexStart_"07/11/index.html" }, endSequence{},
				ExitEvent { "December", "" },	_indexStart_"07/12/index.html" }, endSequence{},
				endSubslate{},
			ExitEvent { "eight", "" },		Subslate { "month"},
				_SlateGlobals_,
				ExitEvent { "cancel", "" },		NilAction{},
				ExitEvent { "January", "" },	_indexStart_"08/01/index.html" }, endSequence{},
				ExitEvent { "February", "" },	_indexStart_"08/02/index.html" }, endSequence{},
				ExitEvent { "March", "" },		_indexStart_"08/03/index.html" }, endSequence{},
				ExitEvent { "April", "" },		_indexStart_"08/04/index.html" }, endSequence{},
				ExitEvent { "May", "" },		_indexStart_"08/05/index.html" }, endSequence{},
				ExitEvent { "June", "" },		_indexStart_"08/06/index.html" }, endSequence{},
				ExitEvent { "July", "" },		_indexStart_"08/07/index.html" }, endSequence{},
				ExitEvent { "August", "" },		_indexStart_"08/08/index.html" }, endSequence{},
				ExitEvent { "September", "" },	_indexStart_"08/09/index.html" }, endSequence{},
				ExitEvent { "October", "" },	_indexStart_"08/10/index.html" }, endSequence{},
				ExitEvent { "November", "" },	_indexStart_"08/11/index.html" }, endSequence{},
				ExitEvent { "December", "" },	_indexStart_"08/12/index.html" }, endSequence{},
				endSubslate{},
			ExitEvent { "nine", "" },		Subslate { "month"},
				_SlateGlobals_,
				ExitEvent { "cancel", "" },		NilAction{},
				ExitEvent { "January", "" },	_indexStart_"09/01/index.html" }, endSequence{},
				ExitEvent { "February", "" },	_indexStart_"09/02/index.html" }, endSequence{},
				ExitEvent { "March", "" },		_indexStart_"09/03/index.html" }, endSequence{},
				ExitEvent { "April", "" },		_indexStart_"09/04/index.html" }, endSequence{},
				ExitEvent { "May", "" },		_indexStart_"09/05/index.html" }, endSequence{},
				ExitEvent { "June", "" },		_indexStart_"09/06/index.html" }, endSequence{},
				ExitEvent { "July", "" },		_indexStart_"09/07/index.html" }, endSequence{},
				ExitEvent { "August", "" },		_indexStart_"09/08/index.html" }, endSequence{},
				ExitEvent { "September", "" },	_indexStart_"09/09/index.html" }, endSequence{},
				ExitEvent { "October", "" },	_indexStart_"09/10/index.html" }, endSequence{},
				ExitEvent { "November", "" },	_indexStart_"09/11/index.html" }, endSequence{},
				ExitEvent { "December", "" },	_indexStart_"09/12/index.html" }, endSequence{},
				endSubslate{},
			ExitEvent { "ten", "" },		Subslate { "month"},
				_SlateGlobals_,
				ExitEvent { "cancel", "" },		NilAction{},
				ExitEvent { "January", "" },	_indexStart_"10/01/index.html" }, endSequence{},
				ExitEvent { "February", "" },	_indexStart_"10/02/index.html" }, endSequence{},
				ExitEvent { "March", "" },		_indexStart_"10/03/index.html" }, endSequence{},
				ExitEvent { "April", "" },		_indexStart_"10/04/index.html" }, endSequence{},
				ExitEvent { "May", "" },		_indexStart_"10/05/index.html" }, endSequence{},
				ExitEvent { "June", "" },		_indexStart_"10/06/index.html" }, endSequence{},
				ExitEvent { "July", "" },		_indexStart_"10/07/index.html" }, endSequence{},
				ExitEvent { "August", "" },		_indexStart_"10/08/index.html" }, endSequence{},
				ExitEvent { "September", "" },	_indexStart_"10/09/index.html" }, endSequence{},
				ExitEvent { "October", "" },	_indexStart_"10/10/index.html" }, endSequence{},
				ExitEvent { "November", "" },	_indexStart_"10/11/index.html" }, endSequence{},
				ExitEvent { "December", "" },	_indexStart_"10/12/index.html" }, endSequence{},
				endSubslate{},
			endSubslate{},
		Event { "lock option",	"lock or unlock option key" },	Keypress { 0, mf_option + mf_toggle },
		_SudokuBase_,
	} }
} };

resource restype_Slate (resid_sudokuDailyYear, "") { {
	Slate { "Year", {
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		NilAction{},
		_ReturnKey_,
		Event { "select month", "" },	Sequence{},
			Click { 1, -70, -70, _window, _bottomRight }, _prev, _prev, _prev, _prev, _prev,
			endSequence{},
		Event { "one", "" },	Sequence{}, _prev, endSequence{},
		Event { "two", "" },	Sequence{}, _prev, _prev, endSequence{},
		Event { "three", "" },	Sequence{}, _prev, _prev, _prev, endSequence{},
		Event { "four", "" },	Sequence{}, _prev, _prev, _prev, _prev, endSequence{},
		Event { "five", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, endSequence{},
		Event { "six", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, _prev, endSequence{},
		Event { "seven", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, _prev, _prev, endSequence{},
		Event { "eight", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, endSequence{},
		Event { "nine", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, endSequence{},
		Event { "ten", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, endSequence{},
		Event { "eleven", "" },	Sequence{}, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, _prev, endSequence{},
		_SudokuBase_,
	} }
} };

#pragma mark TypePuzzles
resource restype_Slate (resid_TypePuzzles, "") { {
	Slate { "Type", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "jump right", "option-right <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			endSubslate{},
		Event { "jump left", "option-left <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			endSubslate{},
		Event { "jump down", "down <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			endSubslate{},
		Event { "jump north", "up <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			endSubslate{},
		_DirectionKeys_,
		_ReturnKey_,
		_TabKey_,
		_SpaceKey_,
		_EnterKey_,
		_DeleteKey_,
		_FDeleteKey_,
		Event { "one",		"1" },	Keypress { kc_kp1, 0 },
		Event { "two",		"2" },	Keypress { kc_kp2, 0 },
		Event { "three",	"3" },	Keypress { kc_kp3, 0 },
		Event { "four",		"4" },	Keypress { kc_kp4, 0 },
		Event { "five",		"5" },	Keypress { kc_kp5, 0 },
		Event { "six",		"6" },	Keypress { kc_kp6, 0 },
		Event { "seven",	"7" },	Keypress { kc_kp7, 0 },
		Event { "eight",	"8" },	Keypress { kc_kp8, 0 },
		Event { "nine",		"9" },	Keypress { kc_kp9, 0 },
		Event { "capital",		"shift key" },	Keypress { 0, mf_shift },
		Event { "lock shift",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },
		Event { "period",			"." },	Keypress { kc_period, 0 },
		Event { "stroke",			"/" },	Keypress { kc_slash, 0 },
	} }
} };

resource restype_Slate (resid_TestAddress, "") { {
	Slate { "test", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "local host", "" },			Sequence{}, _clickAddress, Keypress { kc_A, mf_command }, TypeText { "http://localhost" }, _return, endSequence{},
		Event { "local host carol", "" },	Sequence{}, _clickAddress, Keypress { kc_A, mf_command }, TypeText { "http://localhost/~carolclark" }, _return, endSequence{},
		Event { "IP Address", "" },			Sequence{}, _clickAddress, Keypress { kc_A, mf_command }, TypeText { "http://192.168.0.104" }, _return, endSequence{},
		Event { "IP Address carol", "" },	Sequence{}, _clickAddress, Keypress { kc_A, mf_command }, TypeText { "http://192.168.0.104/~carolclark" }, _return, endSequence{},
		Event { "empty cache", "" },		Keypress { kc_E, mf_command + mf_option },
		Event { "go back", "", },			Keypress { kc_bracket, mf_command },
		Event { "go forward", "", },		Keypress { kc_closeBracket, mf_command },
		_fixWindow,
		_IMouseSlate_,
		_WhitespaceKeys_,
	} }
} };

#pragma mark 9 Safari
resource restype_Slate (resid_Safari, "Safari Slate") { {
	Slate { "Safari",	{
		_SafariStandards_,
		_LaunchSlate_,
		_SlatesSlate_,
		_fixWindow,
		Event { "buttons", "" },			ResSubslate { resid_Buttons },
		Event { "links", "" },				ResSubslate { resid_Links },
		Event { "link content", "" },		ResSubslate { resid_LinkContentSlate },
		Event { "search", "" },				Subslate { "search" },
			_SlateGlobals_,
			ExitEvent { "recent", "" },				Click { 1, -247, 32, _window, _topRight },
			ExitEvent { "clear", "" },				Click { 1, -19, 32, _window, _topRight },
			ExitEvent { "field", "" },				Click { 1, -65, 32, _window, _topRight },
			endSubslate{},
		Event { "bookmarks", "" },			Sequence{}, ClickMenu { "Bookmarks" },
			ResSubslate { resid_Bookmarks }, endSequence{},
		Event { "go site", "" },			Subslate { "site" },
			_SafariStandards_,
			_CloseSubslate_,
			Event { "fix window", "" },		Sequence{}, Click { 0, 85, 10, window, "1", _topLeft },
				Click { -1, 480, 29, _screen, _topLeft }, endSequence{},
			Event { "close window", "" },	Keypress { kc_W, mf_command },
			Event { "yahoo home", "" },		Sequence{}, 
				OpenURL { "http://my.yahoo.com/" }, ResSubslate { resid_YahooHome }, endSequence{},
			Event { "local home", "" },	Sequence{}, 
				OpenURL { "file:///Users/carolclark/CCDev/Sites/Personal/index.html" }, endSequence{},
			Event { "online home", "" },	Sequence{}, 
				OpenURL { "http://web.me.com/carollclark/index.html" }, endSequence{},
			Event { "C and C", "" },	Sequence{}, 
				OpenURL { "http://www.candcsoft.com" }, endSequence{},
			Event { "Punkin", "" },	Sequence{}, 
				OpenURL { "file:///Volumes/carollclark/PrivateSites/Punkin_index.html" }, ResSubslate { resid_DocBrowser },endSequence{},
			Event { "development online", "" },	Sequence{}, 
				OpenURL { "file:///Volumes/carollclark/PrivateSites/index.html" }, ResSubslate { resid_DocBrowser }, endSequence{},
			Event { "my development", "" },	Sequence{}, 
				OpenURL { "file:///Users/carolclark/CCDev/Sites/TechnicalDocs/Support/Development.html" }, ResSubslate { resid_DocBrowser }, endSequence{},
			Event { "Safari books", "" },			Sequence{}, OpenURL { "http://my.safaribooksonline.com" }, ResSubslate { resid_SafariOnline }, endSequence{},
			Event { "gmail", "" },		Sequence{}, OpenURL { "https://mail.google.com/mail/?shva=1" }, ResSubslate { resid_gmail }, endSequence{},
			Event { "Facebook", "" },		Sequence{}, 
				OpenURL { "http://www.facebook.com/" }, ResSubslate { resid_Facebook }, endSequence{},
			Event { "Arbonne", "" },		Sequence{},
				OpenURL { "https://arbonne.com/ic/index.asp" }, ResSubslate { resid_Arbonne }, endSequence{},
			Event { "Sudoku Times", "" },		Sequence{}, 
				OpenURL { "http://www.nytimes.com/ref/crosswords/sudoku/hard.html" }, ResSubslate { resid_sudokuTimes }, 
				endSequence{},
			Event { "Sudoku Post", "" },		Sequence{}, 
				OpenURL { "http://www.uclick.com/client/wpc/wpdoc/" }, ResSubslate { resid_sudokuPost }, 
				endSequence{},
			Event { "Sudoku Daily", "" },		Sequence{}, 
				OpenURL { "http://www.dailysudoku.com/sudoku/archive/index.html" }, ResSubslate { resid_sudokuDaily }, 
				endSequence{},
			Event { "Sudoku Think", "" },		Sequence{}, 
				OpenURL { "http://thinks.com/daily-sudoku/archive.htm" }, ResSubslate { resid_sudokuThink }, 
				endSequence{},
			endSubslate{},
		Event { "current site", "" },		Subslate { "site" },
			_SafariStandards_,
			_CloseSubslate_,
			Event { "YahooHome", "" },		ResSubslate { resid_YahooHome },
			Event { "Facebook", "" },		ResSubslate { resid_Facebook },
			Event { "Arbonne", "" },		ResSubslate { resid_Arbonne },
			Event { "Safari Books", "" },	ResSubslate { resid_SafariOnline },
			Event { "gmail", "" },			ResSubslate { resid_gmail },
			Event { "Sudoku Times", "" },	ResSubslate { resid_sudokuTimes },
			Event { "Sudoku Daily", "" },	ResSubslate { resid_sudokuDaily },
			endSubslate{},
		Event { "scan", "" },				ResSubslate { resid_ScanLinks },
		Event { "Scripts", "" },			Sequence{},
			_OpenScriptsMenu_, TypeText { "Safari" }, Keypress { kc_right, 0 },
			ResSubslate { resid_Scripts },
			endSequence{},
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Window", "" },		ClickMenu { "Window" },
			endSubslate{},
		Event { "test address", "" },		ResSubslate { resid_TestAddress },
		Event { "Documentation", "" },		Click { 1, 65, 65, window, "1", _topLeft },
		Event { "Javadoc", "" },			ResSubslate { resid_Javadoc },
		Event { "Login", "" },				ResSubslate { resid_Login },
		Event { "Discover", "" },			ResSubslate { resid_Discover },
		Event { "AirTran", "" },			ResSubslate { resid_AirTran },
		Event { "Layout", "" },				ResSubslate { resid_Layout },
		Event { "Browser", "" },			ResSubslate { resid_DocBrowser },
	 } }
} };

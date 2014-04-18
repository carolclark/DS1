// =================================================================================
//	Pages_C9.r					(c)2014 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1 Type; 2 View; 9 Pages

#define resid_TypePagesSlate			resid_Pages+1
#define resid_TypeSpecialPagesSlate		resid_Pages+2

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialPagesSlate, "Type Special Pages Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something", "type 'something'" },	TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypePagesSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_JumpDownSubslate_,       \
		_JumpNorthSubslate_,      \
		_DoJumpSubslate_,         \
		_DoSelectSubslate_,			\
		Event { "Special", "" },	ResSubslate { resid_TypeSpecialPagesSlate },	\
		_TypeSlateItems_			\
	} }
} };

#pragma mark _TypePagesSlate_
#define _TypePagesSlate_ 		Event { "Type", "" },	ResSubslate { resid_TypePagesSlate }

#pragma mark 9 === Pages
resource restype_Slate (resid_Pages, "Pages Slate") { {
	Slate { "Pages",	{
		_SlateGlobals_,
		Event { "convert", "convert to 09 format" },	Sequence{}, Keypress { kc_S, mf_command }, Wait { 2 }, _return, Wait { 2 }, Keypress { kc_W, mf_command }, endSequence{},
		_DefaultBase_,
		_TypePagesSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "Menu", "access menus" },		Subslate { "Menu" },
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Application", "" }, ClickMenu { "Pages" },
		ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
		ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
		ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
		endSubslate{},
	} }
} };

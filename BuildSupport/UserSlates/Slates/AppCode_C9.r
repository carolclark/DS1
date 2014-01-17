// =================================================================================
//	AppCode_C9.r				©2014 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "Developer_C9.h"

#pragma mark === Markers ===
//

#define resid_TypeAppCodeSlate			resid_AppCode+1
#define resid_TypeSpecialAppCodeSlate	resid_AppCode+2

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
resource restype_Slate (resid_TypeAppCodeSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_JumpDownSubslate_,       \
		_JumpNorthSubslate_,      \
		_DoJumpSubslate_,         \
		_DoSelectSubslate_,			\
		Event { "Special", "" },	ResSubslate { resid_TypeSpecialAppCodeSlate },	\
		_TypeSlateItems_			\
	} }
} };

#pragma mark _TypeAppCodeSlate_
#define _TypeAppCodeSlate_ 		\
	Event { "Type", "" },	ResSubslate { resid_TypeAppCodeSlate }

#pragma mark AppCode
resource restype_Slate (resid_AppCode, "AppCode Slate") { {
	Slate { "AppCode",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeAppCodeSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "fix window", "" },		Sequence{},
			Click { 0, 85, 10, window, "1", _topLeft },
			Click { -1, 280, 29, _screen, _topLeft },
			endSequence{},
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "AppCode" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
	} }
} };

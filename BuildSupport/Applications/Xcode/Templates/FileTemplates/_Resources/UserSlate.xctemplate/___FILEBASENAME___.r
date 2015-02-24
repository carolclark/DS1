// =================================================================================
//	___FILENAME___		Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1 ; 8 Typing; 9 ___FILEBASENAME___

// Typing
#define resid_Type___FILEBASENAME___		___FILEBASENAME___+900
	#define resid_TypeSpecial___FILEBASENAME___		resid_Type___FILEBASENAME___+1

// #defines
#define _Type___FILEBASENAME____		Event { "Type", "" },	ResSubslate { resid_Type___FILEBASENAME___ }

#pragma mark 8 === Type
resource restype_Slate (resid_Type___FILEBASENAME___, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_JumpDownSubslate_,       \
		_JumpNorthSubslate_,      \
		_DoJumpSubslate_,         \
		_DoSelectSubslate_,			\
		Event { "Special", "" },	ResSubslate { resid_TypeSpecial___FILEBASENAME___ },	\
		_TypeSlateItems_			\
	} }
} };

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecial___FILEBASENAME___, "Type Special ___FILEBASENAME___") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },	TypeText { "something" },
	} }
} };

#pragma mark 9 === ___FILEBASENAME___
resource restype_Slate (resid____FILEBASENAME___, "___FILEBASENAME___ Slate") { {
	Slate { "___FILEBASENAME___",	{
		_SlateGlobals_,
		_DefaultBase_,
		_Type___FILEBASENAME____,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "Menu", "" },				Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "___FILEBASENAME___" },
			ExitEvent { "File", "" }, ClickMenu { "File" },
			ExitEvent { "Edit", "" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "" }, ClickMenu { "Window" },
			endSubslate{},
	} }
} };

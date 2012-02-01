// =================================================================================
//	Numbers_C9.r				©2008-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeNumbersSlate			resid_Numbers+1
#define resid_TypeSpecialNumbersSlate	resid_Numbers+2

#define resid_Arbonne	resid_Numbers+100

#pragma mark #define

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialNumbersSlate, "Type Special Numbers Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeNumbersSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialNumbersSlate },
	} }
} };

#pragma mark _TypeNumbersSlate_
#define _TypeNumbersSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeNumbersSlate }

#pragma mark Arbonne
resource restype_Slate (resid_Arbonne, "") { {
	Slate { "Arbonne",	{
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

#pragma mark Numbers
resource restype_Slate (resid_Numbers, "Numbers Slate") { {
	Slate { "Numbers",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeNumbersSlate_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "Arbonne", "" },			ResSubslate { resid_Arbonne },
		Event { "Window", "" },				ResSubslate { resid_WindowSlate },
		Event { "fix window", "" },			Sequence{},
			Click { 0, -4, -4, window, "1", _bottomRight },
			Click { -1, 0, -60, _cursor },
			endSequence{},
		Event { "page down", "" },			Keypress { kc_pagedown, 0 },
		Event { "page north", "" },			Keypress { kc_pageup, 0 },
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" },	ClickMenu { "Numbers" },
			ExitEvent { "File", "" }, 			ClickMenu { "File" },
			ExitEvent { "Edit", "" }, 			ClickMenu { "Edit" },
			ExitEvent { "Insert", "" }, 		ClickMenu { "Insert" },
			ExitEvent { "Table", "" }, 			ClickMenu { "Table" },
			ExitEvent { "Arrange", "" }, 		ClickMenu { "Arrange" },
			ExitEvent { "View", "" }, 			ClickMenu { "View" },
			ExitEvent { "Window", "" }, 		ClickMenu { "Window" },
			endSubslate{},
	 } }
} };

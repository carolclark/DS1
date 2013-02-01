// =================================================================================
//	Finder.r					�2006-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeFinderSlate			resid_Finder+1
#define resid_TypeSpecialFinderSlate	resid_Finder+2

#define resid_FinderWindow				resid_Finder+100
	#define resid_WindowMenu				resid_FinderWindow+1

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialFinderSlate, "Type Special Finder Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeFinderSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialFinderSlate },
	} }
} };

#pragma mark _TypeFinderSlate_
#define _TypeFinderSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeFinderSlate }

#pragma mark FinderWindow
resource restype_Slate (resid_FinderWindow, "") { {
	Slate { "window",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_WindowItems_,
		Event { "menu", "" },		Sequence{}, ClickMenu { "Window" }, ResSubslate { resid_WindowMenu }, endSequence{},
	} }
} };


#pragma mark WindowMenu
resource restype_Slate (resid_WindowMenu, "") { {
	Slate { "WindowMenu",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "select", "" },		_return,
		_LetterKeys_,
		_DirectionKeys_,
	} }
} };

#pragma mark Finder
resource restype_Slate (resid_Finder, "Finder Slate") { {
	Slate { "Finder",	{
		_SlateGlobals_,
		_DefaultBase_,
		Event { "window", "" },			ResSubslate { resid_FinderWindow },
		_TypeFinderSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		Event { "Menu", "" },			Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "'Finder' menu" }, ClickMenu { "Finder" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
		Event { "close window", "" },	Keypress { kc_W, mf_command },
		Event { "go to folder", "" },	ResSubslate { resid_GoToFolder },
	 } }
} };


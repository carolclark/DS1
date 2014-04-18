// =================================================================================
//	TextEdit_C9.r				(c)2010-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeTextEditSlate			resid_TextEdit+1
#define resid_TypeSpecialTextEditSlate		resid_TextEdit+2

#define	resid_NotesSlate				resid_TextEdit+100

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialTextEditSlate, "Type Special TextEdit Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },	TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeTextEditSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_JumpDownSubslate_,       \
		_JumpNorthSubslate_,      \
		_DoJumpSubslate_,         \
		_DoSelectSubslate_,			\
		Event { "Special", "type predefined text shortcuts" },	ResSubslate { resid_TypeSpecialTextEditSlate },	\
		_TypeSlateItems_			\
	} }
} };

#pragma mark _TypeTextEditSlate_
#define _TypeTextEditSlate_ 		\
	Event { "Type", "simulate keypresses" },	ResSubslate { resid_TypeTextEditSlate }

#pragma mark Notes
resource restype_Slate (resid_NotesSlate, "") { {
	Slate { "Notes",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "alpha", "" },				Launch { Docs_"Dictation/NotesA.rtf", 0 },
		ExitEvent { "bravo", "" },				Launch { Docs_"Dictation/NotesB.rtf", 0 },
	} }
} };

#pragma mark TextEdit
resource restype_Slate (resid_TextEdit, "TextEdit Slate") { {
	Slate { "TextEdit",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeTextEditSlate_,
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
		Event { "Notes", "" },			ResSubslate { resid_NotesSlate },
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "TextEdit" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
	} }
} };

// =================================================================================
//	SystemPrefs_C9.r			©2009-10 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"


#pragma mark 0 === Top

/* resid_ */
#define resid_TypeSpecialPrefsSlate	resid_SystemPrefs+1
#define resid_TypeSystemPrefsSlate	resid_SystemPrefs+2

#define resid_ViewMenu				resid_SystemPrefs+100
		#define resid_viewSpeech			resid_ViewMenu+1

#pragma mark 1 === TypeSpecial
resource restype_Slate (resid_TypeSpecialPrefsSlate, "Type Special SystemPrefs Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		endSubslate{},
	} }
} };

#define _TypeSystemPrefsItems_	\
	Event { "page top", "" },	Keypress { kc_home, 0 },	\
	Event { "page end", "" },	Keypress { kc_end, 0 },	\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	_DoJumpSubslate_,		\
	_DoSelectSubslate_,		\
	_JumpLeftSubslate_,		\
	_JumpRightSubslate_,	\
	_JumpDownSubslate_,		\
	_JumpNorthSubslate_,	\
	_TypeSlateItems_

#define _TypeSystemPrefsSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeSystemPrefsSlate }

#pragma mark 4 === View Menu
resource restype_Slate (resid_ViewMenu, "View") { {
	Slate { "View", {
		_SlateGlobals_,
		_CloseSubslate_,
		_LetterKeys_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "Show All", "" },		Sequence{}, TypeText { "Show All" }, _return, endSequence{},
		Event { "Speech", "" },				Sequence{}, TypeText { "Speech" }, _return,
			ResSubslate { resid_viewSpeech }, endSequence{},
	} }
} };

resource restype_Slate (resid_viewSpeech, "Speech") { {
	Slate { "Speech", {
		_SlateGlobals_,
		_CloseSubslate_,
		_LetterKeys_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		Event { "calibrate", "" },		Click { 1, 500, 200, _window, _topLeft },
	} }
} };

#pragma mark 8 === Type
resource restype_Slate (resid_TypeSystemPrefsSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialPrefsSlate },
		_TypeSystemPrefsItems_
	} }
} };

#pragma mark 9 === SystemPrefs

resource restype_Slate (resid_SystemPrefs, "SystemPrefs Slate") { {
	Slate { "SystemPrefs",	{
		_SlateGlobals_,
		_DefaultBase_,
		_WindowSlate_,
		_TypeSystemPrefsSlate_,
		Event { "close", "" },		Keypress { kc_W, mf_command },
		Event { "page top", "" },	Keypress { kc_home, 0 },
		Event { "page end", "" },	Keypress { kc_end, 0 },
		Event { "page north", "" },	Keypress { kc_pageup, 0 },
		Event { "page down", "" },	Keypress { kc_pagedown, 0 },
		Event { "terminate", "" },		Keypress { kc_period, mf_command },
		Event { "Menu", "access menus" },
			Subslate { "Menu" },
				_SlateGlobals_,
				_CloseSubslate_,
				Event { "View", "'View' menu" }, Sequence{},
					ClickMenu { "View" }, _down, ResSubslate { resid_ViewMenu }, endSequence{},
				ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
				endSubslate{},
		Event { "View", "" },	Sequence{},
			ClickMenu { "View" }, _down, ResSubslate { resid_ViewMenu }, endSequence{},
		} }
} };

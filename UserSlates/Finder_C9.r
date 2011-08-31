// =================================================================================
//	Finder.r						©2006 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeFinderSlate			resid_Finder+1
#define resid_TypeSpecialFinderSlate	resid_Finder+2
//#define resid_StartAtSlate				resid_Finder+3

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
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialFinderSlate },
	} }
} };

#pragma mark _TypeFinderSlate_
#define _TypeFinderSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeFinderSlate }

//#pragma mark StartAt
//resource restype_Slate (resid_StartAtSlate, "Start At Slate") { {
//	Slate { "StartAt",	{
//		_SlateGlobals_,
//		_CloseSubslate_,
//		ExitEvent { "mac", "" },		Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "/Mac/" },					Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "auxiliary", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "/Aux/" },					Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "external", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "/Ext/" },					Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "desktop", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "~/Desktop" },				Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "home", "" },			Keypress { kc_H, mf_command + mf_shift },
//		ExitEvent { "applications", "" },	Keypress { kc_A, mf_command + mf_shift },
//		ExitEvent { "utilities", "" },		Keypress { kc_U, mf_command + mf_shift },
//		ExitEvent { "documents", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "~/Documents" },				Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "my development", "" }, Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "~/Dev/" },					Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "Arbonne", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "~/Arbonne/" },				Keypress { kc_return, 0 }, endSequence{},
//		ExitEvent { "Developer", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
//			TypeText { "/Mac/Developer/" },			Keypress { kc_return, 0 }, endSequence{},
//	} }
//} };
//
#pragma mark Finder
resource restype_Slate (resid_Finder, "Finder Slate") { {
	Slate { "Finder",	{
		_SlateGlobals_,
		_DefaultBase_,
		_WindowSlate_,
		_TypeFinderSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "'Finder' menu" }, ClickMenu { "Finder" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
		Event { "close window", "" },			Keypress { kc_W, mf_command },
		Event { "go to folder", "" },			ResSubslate { resid_GoToFolder },

		//		Event { "Start at", "" },				ResSubslate { resid_StartAtSlate },
	 } }
} };


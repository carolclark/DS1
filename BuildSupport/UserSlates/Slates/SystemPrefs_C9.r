// =================================================================================
//	SystemPrefs_C9.r			(c)2009-10 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"


#pragma mark 0 === Top

/* resid_ */
#define resid_TypeSpecialPrefsSlate	resid_SystemPrefs+1
#define resid_TypeSystemPrefsSlate	resid_SystemPrefs+2

#define resid_Views					resid_SystemPrefs+100
	#define resid_viewSpeech			resid_Views+0
	#define resid_viewStartupDisk		resid_Views+1

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
	
#define _showAll	Sequence{}, Click { 1, 110, 40, _window, _topLeft }, Keypress { kc_escape, 0 }, endSequence{}

#define _ViewStandards_		\
		_SlateGlobals_,		\
		ExitEvent { "okay", "" },		_showAll,	\
		ExitEvent { "show all", "" },	_showAll,	\
		_WhitespaceKeys_,	\
		_DirectionKeys_,	\
		_IMouseSlate_,		\
		Event { "cancel", "" },			Keypress { kc_period, mf_command }

resource restype_Slate (resid_viewSpeech, "Speech") { {
	Slate { "Speech", {
		_ViewStandards_,
		Event { "calibrate", "" },		Click { 1, 500, 200, _window, _topLeft },
	} }
} };

#pragma mark Startup
resource restype_Slate (resid_viewStartupDisk, "") { {
	Slate { "StartupDisk",	{
		_ViewStandards_,
		Event { "Lion", "" },			Click { 1, 330, 130, _window, _topLeft },
		Event { "Mac", "" },			Click { 1, 80, 130, _window, _topLeft },
		Event { "restart", "" },		Click { 1, -100, 225, _window, _topRight },
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
		_WhitespaceKeys_,
		_DirectionKeys_,
		Event { "quit", "" },				Keypress { kc_Q, mf_command },
		Event { "close", "" },				Keypress { kc_W, mf_command },
		Event { "Menu", "" },				Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "View", "" },			ClickMenu { "View" },
			ExitEvent { "Window", "" }, 		ClickMenu { "Window" },
			endSubslate{},
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "Show All", "" },		_showAll,
		Event { "Desktop", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Desktop & Screen Saver" }, _return, endSequence{},
		Event { "Dock", "" },				Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Dock" }, _return, endSequence{},
		Event { "Mission Control", "" },	Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Mission Control" }, _return, endSequence{},
		Event { "Displays", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Displays" }, _return, endSequence{},
		Event { "Energy Saver", "" },		Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Energy Saver" }, _return, endSequence{},
		Event { "Keyboard", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Keyboard" }, _return, endSequence{},
		Event { "Mouse Panel", "" },		Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Mouse" }, _return, endSequence{},
		Event { "Print & Fax", "" },		Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Print & Fax" }, _return, endSequence{},
		Event { "Sound", "" },				Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Sound" }, _return, endSequence{},	
		Event { "Mobile Me", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "MobileMe" }, _return, endSequence{},
		Event { "Sharing", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Sharing" }, _return, endSequence{},
		Event { "Accounts", "" },			Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Users & Groups" }, _return, endSequence{},
		Event { "Date & Time", "" },		Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Date & Time" }, _return, endSequence{},
		Event { "Software Update", "" },	Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Software Update" }, _return, endSequence{},
		Event { "Speech", "" },				Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Speech" }, _return, ResSubslate { resid_viewSpeech }, endSequence{},
		Event { "Startup Disk", "" },		Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Startup Disk" }, _return, ResSubslate { resid_viewStartupDisk }, endSequence{},
		Event { "Time Machine", "" },		Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Time Machine" }, _return, endSequence{},
		Event { "Universal Access", "" },	Sequence{}, Keypress { kc_F, mf_command }, TypeText { "Universal Access" }, endSequence{},
	} }
} };

// =================================================================================
//	SystemPrefs_C9.r			(c)2009-10 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"


#pragma mark 0 === Top

/* resid_ */
//#define resid_XCSystemPrefs		resid_SystemPrefs+1
#define resid_TypeSpecialPrefsSlate	resid_SystemPrefs+10
#define resid_TypeSystemPrefsSlate	resid_SystemPrefs+20
#define resid_Unlock				resid_SystemPrefs+30

#define resid_Views					resid_SystemPrefs+100
	#define resid_viewSecurity			resid_Views+0
	#define resid_viewSpeech			resid_Views+1
	#define resid_viewStartupDisk		resid_Views+2

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
		ExitEvent { "exit", "" },		NilAction{},		\
		Event { "cancel", "" },			Keypress { kc_period, mf_command },		\
		ExitEvent { "show all", "" },	_showAll,	\
		_WhitespaceKeys_,	\
		_DirectionKeys_,	\
		_IMouseSlate_,		\
		Event { "cancel", "" },			Keypress { kc_period, mf_command }

#pragma mark Unlock
resource restype_Slate (resid_Unlock, "") { {
	Slate { "Unlock",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "next", "" },				Keypress { kc_tab, 0 },
		Event { "back", "" },				Keypress { kc_tab, mf_shift },
		Event { "switch", "" },				Keypress { kc_space, 0 },
		ExitEvent { "authenticate", "" },	Sequence{}, TypeText { "6868" }, _return, endSequence{},
	} }
} };

resource restype_Slate (resid_viewSecurity, "Speech") { {
	Slate { "Privacy", {
		_ViewStandards_,
		Event { "Unlock", "" },		ResSubslate { resid_Unlock },
	} }
} };

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
#define _SEARCH_WAIT_	5
#define _SystemPrefsItems_		\
		_SlateGlobals_,		\
		_DefaultBase_,		\
		_WindowSlate_,		\
		_TypeSystemPrefsSlate_,		\
		_WhitespaceKeys_,		\
		_DirectionKeys_,		\
		Event { "close", "" },				Keypress { kc_W, mf_command },		\
		Event { "cancel", "" },				Keypress { kc_escape, 0 },		\
		Event { "Menu", "" },				Subslate { "Menu" },		\
			_SlateGlobals_,		\
			_CloseSubslate_,		\
			ExitEvent { "View", "" },			ClickMenu { "View" },		\
			ExitEvent { "Window", "" }, 		ClickMenu { "Window" },		\
			endSubslate{},		\
		Event { "Show All", "" },			_showAll,		\
		Event { "Unlock", "" },				ResSubslate { resid_Unlock },		\
		Event { "okay", "" },				_return,		\
		Event { "find", "" },				Keypress { kc_F, mf_command },		\
		Event { "Desktop", "" },			Sequence{}, TypeText { "Desktop & Screen Saver" }, _return, endSequence{},		\
		Event { "Dock", "" },				Sequence{}, TypeText { "Dock" }, _return, endSequence{},		\
		Event { "Mission Control", "" },	Sequence{}, TypeText { "Mission Control" }, _return, endSequence{},		\
		Event { "Security & Privacy", "" },	Sequence{}, TypeText { "Security & Privacy" }, Wait { _SEARCH_WAIT_ }, _return, ResSubslate { resid_viewSecurity }, endSequence{},		\
		Event { "Displays", "" },			Sequence{}, TypeText { "Displays" }, _return, endSequence{},		\
		Event { "Energy Saver", "" },		Sequence{}, TypeText { "Energy Saver" }, _return, endSequence{},		\
		Event { "Keyboard", "" },			Sequence{}, TypeText { "Keyboard" }, _return, endSequence{},		\
		Event { "Mouse Panel", "" },		Sequence{}, TypeText { "Mouse" }, _return, endSequence{},		\
		Event { "Printers & Scanners", "" }, Sequence{}, TypeText { "Printers & Scanners" }, _return, endSequence{},		\
		Event { "Sound", "" },				Sequence{}, TypeText { "Sound" }, _return, endSequence{},			\
		Event { "iCloud", "" },				Sequence{}, TypeText { "iCloud" }, _return, endSequence{},		\
		Event { "Sharing", "" },			Sequence{}, TypeText { "Sharing" }, _return, endSequence{},		\
		Event { "Accounts", "" },			Sequence{}, TypeText { "Users & Groups" }, _return, endSequence{},		\
		Event { "Date & Time", "" },		Sequence{}, TypeText { "Date & Time" }, _return, endSequence{},		\
		Event { "Dectation & Speech", "" },	Sequence{}, TypeText { "Dictation & Speech" }, Wait { _SEARCH_WAIT_ }, _return, ResSubslate { resid_viewSpeech }, endSequence{},		\
		Event { "Startup Disk", "" },		Sequence{}, TypeText { "Startup Disk" }, Wait { _SEARCH_WAIT_ }, _return, ResSubslate { resid_viewStartupDisk }, endSequence{},		\
		Event { "Time Machine", "" },		Sequence{}, TypeText { "Time Machine" }, _return, endSequence{},		\
		Event { "Accessibility", "" },		Sequence{}, TypeText { "Accessibility" }, _return, endSequence{}

resource restype_Slate (resid_SystemPrefs, "SystemPrefs Slate") { {
	Slate { "SystemPrefs",	{
		_SlateGlobals_,
		_SystemPrefsItems_
	 } }
} };

resource restype_Slate (resid_XCSystemPrefs, "XcodeSystemPrefs Slate") { {
	Slate { "XCSystemPrefs",	{
		_SlateGlobals_,
		_SystemPrefsItems_,
		ExitEvent { "quit", "" },	Sequence{}, Keypress { kc_Q, mf_command }, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		ExitEvent { "exit", "" },	NilAction{},
		Event { "go back", "" },	Launch { DevApps_"XCode.app", resid_Xcode },
	 } }
} };

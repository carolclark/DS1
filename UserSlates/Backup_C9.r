// =================================================================================
//	Backup_C9.r						©2007 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeBackupSlate			resid_Backup+1
#define resid_TypeSpecialBackupSlate	resid_Backup+2

#define resid_ItemSheet					resid_Backup+100

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialBackupSlate, "Type Special Backup Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeBackupSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialBackupSlate },
	} }
} };

#pragma mark _TypeBackupSlate_
#define _TypeBackupSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeBackupSlate }

#pragma mark Item Sheet
resource restype_Slate (resid_ItemSheet, "Choose Items Sheet") { {
	Slate { "Items",	{
		_SlateGlobals_,
		Event { "exit", "close this subslate" },	CloseSubslate {},
		Event { "page down", "" },	Keypress { kc_pagedown, 0 },
		Event { "page north", "" },	Keypress { kc_pageup, 0 },
		Event { "click one", "" },	IMouse { im_Click, 1 },
		Event { "click two", "" },	IMouse { im_Click, 2 },
		_DirectionKeys_,
		ExitEvent { "cancel", "" },	Keypress { kc_period, mf_command },
		ExitEvent { "done", "" },	Click { 0, -60, -150, window, "1", _bottomRight },
	} }
} };

#pragma mark Backup
resource restype_Slate (resid_Backup, "Backup Slate") { {
	Slate { "Backup",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeBackupSlate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "Item Sheet", "" },		ResSubslate { resid_ItemSheet },
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "'iCal' menu" }, ClickMenu { "iCal" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
	 } }
} };


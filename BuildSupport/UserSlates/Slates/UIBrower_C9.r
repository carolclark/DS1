// =================================================================================
//	UIBrowser_C9.r					(c)2009 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeUIBrowserSlate			resid_UIBrowser+1
#define resid_TypeSpecialUIBrowserSlate		resid_UIBrowser+2

#define resid_AppleScript			resid_UIBrowser+100

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialUIBrowserSlate, "Type Special UIBrowser Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" }, TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeUIBrowserSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" }, ResSubslate { resid_TypeSpecialUIBrowserSlate },
	} }
} };

#pragma mark _TypeUIBrowserSlate_
#define _TypeUIBrowserSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
	ResSubslate { resid_TypeUIBrowserSlate }

#pragma mark AppleScript
resource restype_Slate (resid_AppleScript, "") { {
	Slate { "Script",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "click", "" },		TypeText { "Click Selected Element" },
		ExitEvent { "select", "" },		TypeText { "Select Selected Element" },
		ExitEvent { "perform", "" },	TypeText { "Perform Selected Action" },
	} }
} };

#pragma mark UIBrowser
resource restype_Slate (resid_UIBrowser, "UIBrowser Slate") { {
	Slate { "UIBrowser",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeUIBrowserSlate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "UI Browser" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "View", "" }, ClickMenu { "View" },
			ExitEvent { "Mailbox", "" }, ClickMenu { "Mailbox" },
			ExitEvent { "Message", "" }, ClickMenu { "Message" },
			ExitEvent { "Format", "" }, ClickMenu { "Format" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
		Event { "Actions", "" },		Keypress { kc_1, mf_command },
		Event { "Attributes", "" },		Keypress { kc_2, mf_command },
		Event { "Keystrokes", "" },		Keypress { kc_3, mf_command },
		Event { "Notifications", "" },	Keypress { kc_4, mf_command },
		Event { "Drawer", "" },			Click { 1, 200, 324, window, "1", _topLeft },
		Event { "Screen Reader", "" },	
			UIScript { "perform action \"AXPress\" of button \"Switch to Screen Reader\" of window 1", "" },
		Event { "AppleScript", "" },	Sequence{},
			UIScript { "perform action \"AXShowMenu\" of menu button \"AppleScript\" of window 1", "" },
			ResSubslate { resid_AppleScript }, endSequence{},
	} }
} };

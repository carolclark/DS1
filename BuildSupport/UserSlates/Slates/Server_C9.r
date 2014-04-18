// =================================================================================
//	Server_C9.r					(c)2014 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1 Type; 2 View; 9 Server

#define resid_TypeServerSlate			resid_Server+1
#define resid_TypeSpecialServerSlate	resid_Server+2
#define resid_ViewMenu					resid_Server+100
	#define resid_ViewXcode					resid_ViewMenu+1

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialServerSlate, "Type Special Server Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something", "type 'something'" },	TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeServerSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_JumpDownSubslate_,       \
		_JumpNorthSubslate_,      \
		_DoJumpSubslate_,         \
		_DoSelectSubslate_,			\
		Event { "Special", "" },	ResSubslate { resid_TypeSpecialServerSlate },	\
		_TypeSlateItems_			\
	} }
} };

#pragma mark _TypeServerSlate_
#define _TypeServerSlate_ 		Event { "Type", "" },	ResSubslate { resid_TypeServerSlate }

#pragma mark 2 === View Menu
resource restype_Slate (resid_ViewMenu, "") { {
	Slate { "View",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			_return,
		ExitEvent { "cancel", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "exit", "" },			NilAction{},
		ExitEvent { "My Mac", "" },			Sequence{}, TypeText { "Carol Clark" }, _return, endSequence{},
		ExitEvent { "Alerts", "" },			Sequence{}, TypeText { "Alerts" }, _return, endSequence{},
		ExitEvent { "Certificates", "" },	Sequence{}, TypeText { "Certificates" }, _return, endSequence{},
		ExitEvent { "Logs", "" },			Sequence{}, TypeText { "Logs" }, _return, endSequence{},
		ExitEvent { "Users", "" },			Sequence{}, TypeText { "Users" }, _return, endSequence{},
		ExitEvent { "Groups", "" },			Sequence{}, TypeText { "Groups" }, _return, endSequence{},
		Event { "Xcode", "" },				Sequence{}, TypeText { "Xcode" }, _return, ResSubslate { resid_ViewXcode }, endSequence{},
	} }
} };

#pragma mark ViewXcode
resource restype_Slate (resid_ViewXcode, "") { {
	Slate { "ViewXcode",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "go back", "" },			Launch { Apps_"Server.app", 0 },
		Event { "close window", "" },		Keypress { kc_W, mf_command },
		Event { "Settings", "" },			Click { 1, 366, 123, _window, _topLeft },
			Event { "view bots", "" },			Click { 1, 336, -30, _window, _bottomLeft },
		Event { "Repositories", "" },		Click { 1, 646, 123, _window, _topLeft },
	} }
} };

#pragma mark 9 === Server
resource restype_Slate (resid_Server, "Server Slate") { {
	Slate { "Server",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeServerSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "View", "" },		Sequence{}, ClickMenu { "View" }, ResSubslate { resid_ViewMenu }, endSequence{},
			ExitEvent { "Application", "" }, ClickMenu { "Server" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
	} }
} };

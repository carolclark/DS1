// =================================================================================
//	ScriptEditor_C9.r			(c)2009-10 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"


#pragma mark 0 === Top

/* resid_ */
#define resid_TypeSpecialScriptEditorSlate	resid_ScriptEditor+2
#define resid_TypeScriptEditorSlate		resid_ScriptEditor+3
#define resid_Find					resid_ScriptEditor+6
#define resid_Symbols				resid_ScriptEditor+30

#define resid_FileMenu				resid_ScriptEditor+40
#define resid_EditMenu				resid_ScriptEditor+50
#define resid_ScriptMenu			resid_ScriptEditor+200
#define resid_ViewMenu				resid_ScriptEditor+200

#define resid_Macro					resid_ScriptEditor+400

#pragma mark 1 === TypeSpecial
resource restype_Slate (resid_TypeSpecialScriptEditorSlate, "Type Special ScriptEditor Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		endSubslate{},
	} }
} };

#define _TypeScriptEditorItems_	\
	Event { "complete", "" },	Keypress { kc_escape, 0 },	\
	Event { "finish", "" },		Keypress { kc_escape, 0 },	\
	Event { "add space", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_space, 0 }, endSequence{},	\
	Event { "add comma", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_comma, 0 }, endSequence{},	\
	_Symbols_,																	\
	Event { "page top", "" },	Keypress { kc_home, 0 },	\
	Event { "page end", "" },	Keypress { kc_end, 0 },	\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	Event { "choose two", "" }, _down,	\
	Event { "choose three", "" }, Sequence{}, _down, _down, endSequence{},	\
	Event { "choose four", "" }, Sequence{}, _down, _down, _down, endSequence{},	\
	Event { "choose five", "" }, Sequence{}, _down, _down, _down, _down, endSequence{},	\
	Event { "choose six", "" }, Sequence{}, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose seven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose eight", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose nine", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose ten", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose eleven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose twelve", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose thirteen", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	_DoJumpSubslate_,		\
	_DoSelectSubslate_,		\
	Event { "jump right", "option-right <n> times" },	Subslate { "<n>" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		ExitEvent { "one", "" },		Sequence{},	\
			Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "two", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "three", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "four", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "five", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "six", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "seven", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "eight", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "nine", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		ExitEvent { "ten", "" },		Sequence{},	\
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
			endSequence{},	\
		endSubslate{},	\
	Event { "jump left", "option-left <n> times" },	Subslate { "<n>" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		ExitEvent { "one", "" },		Sequence{},	\
			Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "two", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "three", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "four", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "five", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "six", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "seven", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "eight", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "nine", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		ExitEvent { "ten", "" },		Sequence{},	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			endSequence{},	\
		endSubslate{},	\
	_JumpDownSubslate_,	\
	_JumpNorthSubslate_,	\
	_TypeSlateItems_

#define _TypeScriptEditorSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeScriptEditorSlate }

#pragma mark Popups
#define _PopupStandards_	\
		_SlateGlobals_,		\
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },                                                    \
		ExitEvent { "return", "" },		Keypress { kc_return, 0 },                                                  \
		ExitEvent { "cancel", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, endSequence{},      \
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, endSequence{},       \
		ExitEvent { "exit", "" },		CloseSubslate{},															\
		Event { "page top", "" },		Keypress { kc_home, 0 },													\
		Event { "page end", "" },		Keypress { kc_end, 0 },                                                       \
		_JumpDownSubslate_,                                                                                      \
		_JumpNorthSubslate_,                                                                                     \
		_DoJumpSubslate_,                                                                                        \
		_DirectionKeys_,                                                                                         \
		_LetterKeys_,                                                                                            \
		_NumberKeys_

#define _Symbols_	\
	Event { "symbols", "" },	Sequence{},	Keypress { kc_2, mf_control }, ResSubslate { resid_Symbols }, endSequence{}

resource restype_Slate (resid_Symbols, "") { {
	Slate { "Symbols", {
		_PopupStandards_,
	} }
} };

#pragma mark 3 === Find
resource restype_Slate (resid_Find, "Find") { {
	Slate { "Find", {
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeScriptEditorSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
		Event { "click one", "" },			Click { 1, 0, 0, _cursor },
		Event { "find string", "" },		Click { 1, 250, 43, _window, _topLeft },
		Event { "replace string", "" },		Click { 1, 250, 73, _window, _topLeft },
		Event { "select find", "" },		Click { 1, -162, 43, _window, _topRight },
		Event { "select replace", "" },		Click { 1, -162, 73, _window, _topRight },
		Event { "replace all scope", "" },	Click { 1, 115, 148, _window, _topLeft },
		Event { "ignore case", "" },		Click { 1, 245, 127, _window, _topLeft },
		Event { "wrap around", "" },		Click { 1, 245, 148, _window, _topLeft },
		Event { "textual", "" },			Click { 1, 407, 127, _window, _topLeft },
		Event { "contains", "" },			Click { 1, 407, 148, _window, _topLeft },
		Event { "replace all", "" },		Click { 0, -65, -30, _window, _bottomRight },
	} }
} };

#pragma mark 4 === Standard Menus
#pragma mark File Menu
resource restype_Slate (resid_FileMenu, "File") { {
	Slate { "File", {
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

#pragma mark Edit Menu
resource restype_Slate (resid_EditMenu, "Edit") { {
	Slate { "Edit", {
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

resource restype_Slate (resid_ScriptMenu, "Script") { {
	Slate { "Script", {
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

#pragma mark 8 === Type
#define _cutNextLine	Keypress { kc_right, mf_command }, Keypress { kc_right, 0 },	\
	Keypress { kc_right, mf_command + mf_shift }, Keypress { kc_X, mf_command }
resource restype_Slate (resid_TypeScriptEditorSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		_Symbols_,
		Event { "cut next line", "" },	Sequence{}, _cutNextLine, endSequence{},
		Event { "save files", "" },			Keypress { kc_S, mf_command + mf_option },
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialScriptEditorSlate },
		_TypeScriptEditorItems_
	} }
} };

#define jump_right_ Keypress { kc_right, mf_option }

#pragma mark Macro
resource restype_Slate (resid_Macro, "") { {
	Slate { "Macro",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		_CommandSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		Event { "one", "temp" },				Sequence{},
			TypeText { "Developer/Documentation/InHouse" },
			endSequence{},
		Event { "two", "temp" },				Sequence{},
			TypeText { "Users/Shared/Cdoc" },
			endSequence{},
		Event { "three", "temp" },				Sequence{},
			Keypress { kc_C, mf_command }, _right, Keypress { kc_comma, 0 }, _return,
			Keypress { kc_V, mf_command + mf_option + mf_shift }, _up, Keypress { kc_M, mf_command }, _left,
			Keypress { kc_G, mf_command }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
		_left, Keypress { kc_O, mf_control }, TypeText { "YES" },
			endSequence{},
		Event { "four", "temp" },				Sequence{},
			_right, _down, _down,
			endSequence{},
		Event { "five", "temp" },				Sequence{},
			Keypress { kc_M, mf_command }, _right, _down,
			endSequence{},
		Event { "six", "temp" },				Sequence{},
			Keypress { kc_left, mf_command }, _down, _down, _down, _down,
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, _right, Keypress { kc_O, mf_control },		
			endSequence{},
	} }
} };

#pragma mark 9 === ScriptEditor

#define	topRow_		83
#define	rowHt_		17

resource restype_Slate (resid_ScriptEditor, "ScriptEditor Slate") { {
	Slate { "ScriptEditor",	{
		_SlateGlobals_,
		_DefaultBase_,
		_WindowSlate_,
		_TypeScriptEditorSlate_,
		Event { "Macro", "" },		ResSubslate { resid_Macro },
		Event { "page top", "" },	Keypress { kc_home, 0 },
		Event { "page end", "" },	Keypress { kc_end, 0 },
		Event { "page north", "" },	Keypress { kc_pageup, 0 },
		Event { "page down", "" },	Keypress { kc_pagedown, 0 },
		Event { "record", "" },		Keypress { kc_R, mf_command + mf_shift },
		Event { "terminate", "" },	Keypress { kc_period, mf_command },
		Event { "activate", "" },	Launch { Apps_"Utilities/AppleScript Editor.app", 0 },
		_Symbols_,
		Event { "Menu", "access menus" },
			Subslate { "Menu" },
				_SlateGlobals_,
				_CloseSubslate_,
				Event { "File", "'File' menu" }, Sequence{},
					ClickMenu { "File" }, _down, ResSubslate { resid_FileMenu }, endSequence{},
			   Event { "Edit", "'Edit' menu" }, Sequence{},
					ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
				ExitEvent { "Edit", "" }, ClickMenu { "Edit" },
				ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
				ExitEvent { "Find", "'Find' menu" }, ClickMenu { "Find" },
				Event { "Script", "'Script' menu" }, Sequence{},
					ClickMenu { "Script" }, _down, ResSubslate { resid_ScriptMenu }, endSequence{},
				Event { "View", "'View' menu" }, Sequence{},
					ClickMenu { "View" }, _down, ResSubslate { resid_ViewMenu }, endSequence{},
				ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
				endSubslate{},
		Event { "File Menu", "'File' menu" }, Sequence{},
			ClickMenu { "File" }, _down, ResSubslate { resid_FileMenu }, endSequence{},
		Event { "Edit Menu", "'Edit' menu" }, Sequence{},
			ClickMenu { "Edit" }, _down, ResSubslate { resid_EditMenu }, endSequence{},
		Event { "Script Menu", "'Script' menu" }, Sequence{},
			ClickMenu { "Script" }, _down, ResSubslate { resid_ScriptMenu }, endSequence{},
		Event { "View Menu", "" },	Sequence{},
			ClickMenu { "View" }, _down, ResSubslate { resid_ViewMenu }, endSequence{},
		Event { "Search", "ScriptEditor 'Find' menu" },
			Subslate { "Search" },
				_SlateGlobals_,
				_CloseSubslate_,
				_TypeScriptEditorSlate_,
				_SlateGlobals_,
				_DirectionKeys_,
				Event { "enter find string", "" },		Keypress { kc_E, mf_command },
				Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_control },
				Event { "find again", "" },				Keypress { kc_G, mf_command },
				Event { "change", "" },					Keypress { kc_H, mf_command },
				Event { "change again", "" },			Keypress { kc_H, mf_command + mf_shift },
				Event { "find", "find in single file" },
					Sequence{},
						Keypress { kc_F, mf_command},
						ResSubslate { resid_Find },
						endSequence{},
				_CommandSlate_,
					endSubslate{},
		} }
} };

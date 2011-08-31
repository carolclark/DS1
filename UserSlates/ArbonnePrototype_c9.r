
// =================================================================================
//	ArbonnePrototype_C9.r		©2008-09 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

//resid_
#define resid_TypeProtoSlate			resid_ArbProto+1
#define resid_TypeSpecialProtoSlate		resid_ArbProto+2

#define resid_Application				resid_ArbProto+100
#define resid_File						resid_ArbProto+110
#define resid_Edit						resid_ArbProto+120
#define resid_Format					resid_ArbProto+130
#define resid_View						resid_ArbProto+140
#define resid_Window					resid_ArbProto+150
#define resid_Developer					resid_ArbProto+160
#define resid_Help						resid_ArbProto+170

#define resid_Filter					resid_ArbProto+800
#define resid_Sort						resid_ArbProto+810

#pragma mark Macros
#define _rowh		110
#define _rowv		163
#define _rsp		17
#define _btnv		315
#define _addRecord	\
	Sequence{},	Click { 1, -80, _btnv, _window, _topRight }, Click { 1, -80, _btnv+25, _window, _topRight }, endSequence{}

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialProtoSlate, "Type Special Proto Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "Carol", "" },				Sequence{}, TypeText { "Carol" }, _tab, TypeText { "Clark" }, endSequence{},
		ExitEvent { "Jim", "" },				Sequence{}, TypeText { "Jim" }, _tab, TypeText { "Clark" }, endSequence{},
		ExitEvent { "Laura", "" },				Sequence{}, TypeText { "Laura" }, _tab, TypeText { "Martinez" }, endSequence{},
		ExitEvent { "C J", "" },				Sequence{}, TypeText { "C J" }, _tab, TypeText { "Martinez" }, endSequence{},
		ExitEvent { "Scott", "" },				Sequence{}, TypeText { "Scott" }, _tab, TypeText { "Clark" }, endSequence{},
		ExitEvent { "Gina", "" },				Sequence{}, TypeText { "Gina" }, _tab, TypeText { "Clark" }, endSequence{},
		ExitEvent { "Dad", "" },				Sequence{}, TypeText { "Henry" }, _tab, TypeText { "Kennedy" }, endSequence{},
		ExitEvent { "Jean", "" },				Sequence{}, TypeText { "Jean" }, _tab, TypeText { "Schlatter" }, endSequence{},
		ExitEvent { "Bill", "" },				Sequence{}, TypeText { "Bill" }, _tab, TypeText { "Kennedy" }, endSequence{},
		ExitEvent { "Pam", "" },				Sequence{}, TypeText { "Pam" }, _tab, TypeText { "Kennedy" }, endSequence{},
		ExitEvent { "Business", "" },			TypeText { "Carol's Business" },
		ExitEvent { "Consultant Stamp", "" },	Sequence{}, TypeText { "Carol Clark" }, Keypress { kc_return, mf_option },
			TypeText { "Arbonne Independent Consultant" }, Keypress { kc_return, mf_option },
			TypeText { "683-2747  carolclark@cox.net" }, endSequence{},
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeProtoSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "add record", "" },		_addRecord,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialProtoSlate },
	} }
} };

#pragma mark _TypeProtoSlate_
#define _TypeProtoSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeProtoSlate }

#pragma mark 2 === Menus
#pragma mark Application
resource restype_Slate (resid_Application, "") { {
	Slate { "Application",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "About", "" },			Sequence{}, TypeText { "About" }, _return, endSequence{},
		ExitEvent { "Hide", "" },			Sequence{}, TypeText { "Hide" }, _return, endSequence{},
		ExitEvent { "Hide Others", "" },	Sequence{}, TypeText { "Hide Others" }, _return, endSequence{},
		ExitEvent { "Show All", "" },		Sequence{}, TypeText { "Show All" }, _return, endSequence{},
	} }
} };

#pragma mark File
resource restype_Slate (resid_File, "") { {
	Slate { "File",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "New", "" },			Sequence{}, TypeText { "New" }, _return, endSequence{},
		ExitEvent { "Open", "" },			Sequence{}, TypeText { "Open..." }, _return, endSequence{},
		ExitEvent { "Open Recent", "" },	Sequence{}, TypeText { "Open Recent" }, _right, endSequence{},
		ExitEvent { "Close", "" },			Sequence{}, TypeText { "Close" }, _return, endSequence{},
		ExitEvent { "Save", "" },			Sequence{}, TypeText { "Save" }, _return, endSequence{},
		ExitEvent { "Save As", "" },		Sequence{}, TypeText { "Save As" }, _return, endSequence{},
		ExitEvent { "Revert", "" },			Sequence{}, TypeText { "Revert" }, _return, endSequence{},
		ExitEvent { "Import", "" },			Sequence{}, TypeText { "Import" }, _return, endSequence{},
		ExitEvent { "Page Setup", "" },		Sequence{}, TypeText { "Page Setup" }, _return, endSequence{},
		ExitEvent { "Print", "" },			Sequence{}, TypeText { "Print" }, _return, endSequence{},
	} }
} };

#pragma mark Edit
resource restype_Slate (resid_Edit, "") { {
	Slate { "Edit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Undo", "" },				Keypress { kc_Z, mf_command },
		Event { "Redo", "" },				Keypress { kc_Z, mf_command + mf_shift },
		ExitEvent { "Cut", "" },			Sequence{}, TypeText { "Cut" }, _return, endSequence{},
		ExitEvent { "Copy", "" },			Sequence{}, TypeText { "Copy" }, _return, endSequence{},
		ExitEvent { "Paste", "" },			Sequence{}, TypeText { "Paste" }, _return, endSequence{},
		ExitEvent { "Delete", "" },			Sequence{}, TypeText { "Delete" }, _return, endSequence{},
		ExitEvent { "Select All", "" },		Sequence{}, TypeText { "Select All" }, _return, endSequence{},
		ExitEvent { "Find", "" },			Sequence{}, TypeText { "Find" }, _right, endSequence{},
		ExitEvent { "Spelling", "" },		Sequence{}, TypeText { "Spelling and Grammar" }, _right, endSequence{},
		ExitEvent { "Substitutions", "" },	Sequence{}, TypeText { "Substitutions" }, _right, endSequence{},
		ExitEvent { "Speech", "" },			Sequence{}, TypeText { "Speech" }, _right, endSequence{},
		ExitEvent { "Characters", "" },		Sequence{}, TypeText { "Special Characters" }, _return, endSequence{},
	} }
} };

#pragma mark Format
resource restype_Slate (resid_Format, "") { {
	Slate { "Format",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Font", "" },			Sequence{}, TypeText { "Font" }, _right, endSequence{},
		ExitEvent { "Text", "" },			Sequence{}, TypeText { "Text" }, _right, endSequence{},
	} }
} };

#pragma mark View
resource restype_Slate (resid_View, "") { {
	Slate { "View",	{
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

#pragma mark Window
resource restype_Slate (resid_Window, "") { {
	Slate { "Window",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Minimize", "" },		Sequence{}, TypeText { "Minimize" }, _return, endSequence{},
		ExitEvent { "Zoom", "" },			Sequence{}, TypeText { "Zoom" }, _return, endSequence{},
		ExitEvent { "Bring to Front", "" },	Sequence{}, TypeText { "Bring All to Front" }, _return, endSequence{},
		ExitEvent { "select", "" },			Sequence{}, _down, _down, _down, _down, endSequence{},
	} }
} };

#pragma mark Developer
resource restype_Slate (resid_Developer, "") { {
	Slate { "Developer",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "throw exception", "" },	Sequence{}, TypeText { "Throw Exception" }, _return, endSequence{},
		ExitEvent { "present error", "" },		Sequence{}, TypeText { "Present Error" }, _return, endSequence{},
	} }
} };

#pragma mark Help
resource restype_Slate (resid_Help, "") { {
	Slate { "Help",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Prototype", "" },		Sequence{}, _down, TypeText { "ArbonnePrototype" }, _return, endSequence{},
	} }
} };

#pragma mark 3 ===
#pragma mark Filter
resource restype_Slate (resid_Filter, "") { {
	Slate { "Filter",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "field", "" },		Click { 1, 408, _rowv-37, _window, _topLeft },
		Event { "string", "" },		Sequence{}, Click { 1, 440, _rowv-37, _window, _topLeft }, ResSubslate { resid_TypeProtoSlate }, endSequence{},
		Event { "clear", "" },		Sequence{}, Click { 1, -66, _rowv-37, _window, _topRight }, Keypress { kc_delete, 0 }, endSequence{},
		_TypeProtoSlate_,
	} }
} };

#pragma mark Sort
resource restype_Slate (resid_Sort, "") { {
	Slate { "Sort",	{
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };


#pragma mark Proto
resource restype_Slate (resid_ArbProto, "Proto Slate") { {
	Slate { "Proto",	{
		_SlateGlobals_,
		Event { "go back", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
		Event { "quit back", "" },		Sequence{}, Keypress { kc_Q, mf_command }, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		_DefaultBase_,
		_TypeProtoSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "Sort", "" },			ResSubslate { resid_Sort },
		Event { "Filter", "" },			ResSubslate { resid_Filter },
		Event { "add record", "" },		_addRecord,
		Event { "Remove", "" },			Click { 1, -170, _btnv, _window, _topRight },
		Event { "Fetch", "" },			Click { 1, -260, _btnv, _window, _topRight },
		_WindowSlate_,
		Event { "Menu", "" },			Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Application", "" }, Sequence{}, ClickMenu { "ArbonnePrototype" }, ResSubslate { resid_Application }, endSequence{},
			Event { "File", "" },		Sequence{}, ClickMenu { "File" }, ResSubslate { resid_File }, endSequence{},
			Event { "Edit", "" },		Sequence{}, ClickMenu { "Edit" }, ResSubslate { resid_Edit }, endSequence{},
			Event { "Format", "" },		Sequence{}, ClickMenu { "Format" }, ResSubslate { resid_Format }, endSequence{},
			Event { "View", "" },		Sequence{}, ClickMenu { "View" }, ResSubslate { resid_View }, endSequence{},
			Event { "Window", "" },		Sequence{}, ClickMenu { "Window" }, ResSubslate { resid_Window }, endSequence{},
			Event { "Developer", "" },	Sequence{}, ClickMenu { "Developer" }, ResSubslate { resid_Developer }, endSequence{},
			Event { "Help", "" },		Sequence{}, ClickMenu { "Help" }, ResSubslate { resid_Help }, endSequence{},
			_TypeProtoSlate_,
			_CommandSlate_,
			_JumpDownSubslate_,
			_JumpNorthSubslate_,
			_DirectionKeys_,
			_WhitespaceKeys_,
			_LetterKeys_,
			endSubslate{},
		Event { "dialog", "" },			Click { 1, 965, 365, _screen, _topLeft },
		Event { "row one", "" },		Click { 1, _rowh, _rowv+0*_rsp, _window, _topLeft },
		Event { "row two", "" },		Click { 1, _rowh, _rowv+1*_rsp, _window, _topLeft },
		Event { "row three", "" },		Click { 1, _rowh, _rowv+2*_rsp, _window, _topLeft },
		Event { "row four", "" },		Click { 1, _rowh, _rowv+3*_rsp, _window, _topLeft },
		Event { "row five", "" },		Click { 1, _rowh, _rowv+4*_rsp, _window, _topLeft },
		Event { "row six", "" },		Click { 1, _rowh, _rowv+5*_rsp, _window, _topLeft },
		Event { "row seven", "" },		Click { 1, _rowh, _rowv+6*_rsp, _window, _topLeft },
		Event { "row eight", "" },		Click { 1, _rowh, _rowv+7*_rsp, _window, _topLeft },
		Event { "row nine", "" },		Click { 1, _rowh, _rowv+8*_rsp, _window, _topLeft },
		Event { "row ten", "" },		Click { 1, _rowh, _rowv+9*_rsp, _window, _topLeft },
		Event { "row eleven", "" },		Click { 1, _rowh, _rowv+10*_rsp, _window, _topLeft },
		Event { "row twelve", "" },		Click { 1, _rowh, _rowv+11*_rsp, _window, _topLeft },
	} }
} };

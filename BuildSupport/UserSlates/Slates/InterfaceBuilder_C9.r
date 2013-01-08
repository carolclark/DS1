// =================================================================================
//	InterfaceBuilder_C9.r		�2006-09 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

// resid_
#define resid_TypeIBSlate				resid_InterfaceBuilder+1
#define resid_TypeSpecialIBSlate		resid_InterfaceBuilder+2

#define resid_Macro						resid_InterfaceBuilder+40

#define resid_FileMenu					resid_InterfaceBuilder+50
	#define resid_FileSave					resid_FileMenu+1

#define resid_Document					resid_InterfaceBuilder+100
	#define resid_docIcons					resid_Document+10
	#define resid_docOutline				resid_Document+20
	#define resid_docBrowser				resid_Document+30

#define resid_Library					resid_InterfaceBuilder+200

#define resid_Attributes				resid_InterfaceBuilder+400

#define resid_Effects					resid_InterfaceBuilder+450

#define resid_Size						resid_InterfaceBuilder+500

#define resid_Bindings					resid_InterfaceBuilder+550

#define resid_Connections				resid_InterfaceBuilder+600

#define resid_Identity					resid_InterfaceBuilder+650

#define resid_CoreData					resid_InterfaceBuilder+900

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialIBSlate, "Type Special IB Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeIBSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_JumpLeftSubslate_,
		_JumpRightSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialIBSlate },
		Event { "Macro", "" },		ResSubslate { resid_Macro },
	} }
} };

#pragma mark _TypeIBSlate_
#define _TypeIBSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeIBSlate }

#pragma mark Macro
resource restype_Slate (resid_Macro, "") { {
	Slate { "Macro",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "cell small", "size popup is already active" },		Sequence{},
			_right, _down, Keypress { kc_3, mf_command }, Keypress { kc_space, 0 }, TypeText { "small" }, _return,
			Keypress { kc_W, mf_command }, _up, _left, _down, endSequence{},
	} }
} };

#pragma mark 2 === Menus

#pragma mark File
resource restype_Slate (resid_FileMenu, "File Menu") { {
	Slate { "File",		{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Save As", "" },	Sequence{}, TypeText { "Save As" }, Keypress { kc_return, 0 }, 
			ResSubslate { resid_FileSave }, endSequence{},
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_LetterKeys_
	} }
} };

#define _rowh	-182
#define _row1v	160
#define _rsp	20
resource restype_Slate (resid_FileSave, "File Save") { {
	Slate { "Save",		{
		_SlateGlobals_,
		ExitEvent { "exit", "" },	NilAction{},
		ExitEvent { "okay", "" },	Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },	Keypress { kc_period, mf_command },
		Event { "row one", "" },	Click { 1, _rowh, _row1v+0*_rsp, _window, _topCenter },
		Event { "row two", "" },	Click { 1, _rowh, _row1v+1*_rsp, _window, _topCenter },
		Event { "row three", "" },	Click { 1, _rowh, _row1v+2*_rsp, _window, _topCenter },
		_TypeIBSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_IMouseSlate_
	} }
} };

#pragma mark 5 === Windows

#pragma mark Document
resource restype_Slate (resid_Document, "Document") { {
	Slate { "Doc",		{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "icons", "" },		Click { 1, 22, 36, window, "1", _topLeft },
		Event { "outline", "" },	Sequence{}, Click { 1, 51, 36, _window, _topLeft }, ResSubslate { resid_docOutline }, endSequence{},
		Event { "browser", "" },	Click { 1, 80, 36, window, "1", _topLeft },
		Event { "info", "" },		Click { 1, 120, 36, window, "1", _topLeft },
		Event { "search", "" },		Sequence{}, 
			Click { 1, -60, 36, window, "1", _topRight }, ResSubslate { resid_TypeIBSlate }, endSequence{},
		Event { "clear search field", "" },	Click { 1, -18, 38, _window, _topRight },
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_CommandSlate_,
		_DirectionKeys_
	} }
} };

#define _tr		90
#define _rsp	18
resource restype_Slate (resid_docOutline, "Outline") { {
	Slate { "Outline",		{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "row one", "" },		Click { 1, 180, _tr+0*_rsp, _window, _topLeft },
		Event { "row two", "" },		Click { 1, 180, _tr+1*_rsp, _window, _topLeft },
		Event { "row three", "" },		Click { 1, 180, _tr+2*_rsp, _window, _topLeft },
		Event { "row four", "" },		Click { 1, 180, _tr+3*_rsp, _window, _topLeft },
		Event { "row five", "" },		Click { 1, 180, _tr+4*_rsp, _window, _topLeft },
		Event { "row six", "" },		Click { 1, 180, _tr+5*_rsp, _window, _topLeft },
		Event { "row seven", "" },		Click { 1, 180, _tr+6*_rsp, _window, _topLeft },
		Event { "row eight", "" },		Click { 1, 180, _tr+7*_rsp, _window, _topLeft },
		Event { "row nine", "" },		Click { 1, 180, _tr+8*_rsp, _window, _topLeft },
		Event { "row ten", "" },		Click { 1, 180, _tr+9*_rsp, _window, _topLeft },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		_IMouseSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DirectionKeys_
	} }
} };

#pragma mark Library
resource restype_Slate (resid_Library, "Library") { {
	Slate { "Library",		{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "Objects", "" },		Click { 1, -23, 35, _window, _topCenter },
		Event { "Media", "" },			Click { 1, 23, 35, _window, _topCenter },
		Event { "Outline", "" },		Click { 1, 0, 65, _window, _topCenter },
		Event { "Palette", "" },		Click { 1, 1530, 720, _screen, _topLeft },
		Event { "Filter", "" },			Click { 1, 165, -25, _window, _bottomCenter },
		Event { "Actions", "" },		Sequence{}, 
			Click { 1, 40, -20, _window, _bottomLeft }, ResSubslate { resid_TypeIBSlate }, endSequence{},
		_IMouseSlate_,
		Event { "click one", "" },		IMouse { im_Click, 1 },
		Event { "click two", "" },		IMouse { im_Click, 2 },
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_FullAccessSlate_,
		_MenuBarSlate_,
		_DockWindowSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeIBSlate_
	} }
} };

#pragma mark 6 === Info Panels

#pragma mark Attributes
resource restype_Slate (resid_Attributes, "Attributes") { {
	Slate { "Attributes",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_EnterKey_,
		_CommandSlate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_TypeIBSlate_,
	} }
} };

#pragma mark Effects
resource restype_Slate (resid_Effects, "Effects") { {
	Slate { "Effects",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_EnterKey_,
		_CommandSlate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_TypeIBSlate_,
	} }
} };

#pragma mark Size
resource restype_Slate (resid_Size, "Size") { {
	Slate { "Size",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "strut top", "" },		Click { 1, 74, 267, _window, _topLeft },
		Event { "strut bottom", "" },	Click { 1, 74, 325, _window, _topLeft },
		Event { "strut left", "" },		Click { 1, 44, 298, _window, _topLeft },
		Event { "strut right", "" },	Click { 1, 104, 298, _window, _topLeft },
		Event { "horizontal", "" },		Click { 1, 65, 297, _window, _topLeft },
		Event { "vertical", "" },		Click { 1, 74, 287, _window, _topLeft },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_EnterKey_,
		_CommandSlate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_TypeIBSlate_,
	} }
} };

#pragma mark Bindings
resource restype_Slate (resid_Bindings, "Bindings") { {
	Slate { "Bindings",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_EnterKey_,
		_CommandSlate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_TypeIBSlate_,
	} }
} };

#define _stepSize	16
#pragma mark Connections
resource restype_Slate (resid_Connections, "Connections") { {
	Slate { "Connections",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "mouse", "" },			Subslate { "IMouse" },
			_IMouseItems_,
			Event { "home", "" },			Click { 0, 25, 68, _window, _topLeft },
			Event { "alpha", "" },			Click { 0, 119, 0, _cursor },
			Event { "bravo", "" },			Click { 0, 234, 0, _cursor },
			endSubslate{},
		_DirectionKeys_,
		_WhitespaceKeys_,
		_EnterKey_,
		_CommandSlate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_TypeIBSlate_,
	} }
} };

#pragma mark Identity
resource restype_Slate (resid_Identity, "Identity") { {
	Slate { "Identity",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_EnterKey_,
		_CommandSlate_,
		_TabAheadSubslate_,
		_TabBackSubslate_,
		_TypeIBSlate_,
	} }
} };


#pragma mark 8 === Dialogs

#pragma mark Core Data
resource restype_Slate (resid_CoreData, "Core Data") { {
	Slate { "Core Data", {
		_SlateGlobals_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "cancel", "" },		Click { 1, -215, 40, _screen, _center },
		ExitEvent { "finish", "" },		Click { 1, 165, 40, _screen, _center },
		Event { "previous", "" },		Click { 1, 65, 40, _screen, _center },
		Event { "next", "" },			Click { 1, 165, 40, _screen, _center },
		Event { "popup", "" },			Click { 1, -180, -235, _screen, _center },
		Event { "flag one", "" },		Click { 1, -180, -195, _screen, _center },
		Event { "flag two", "" },		Click { 1, -180, -175, _screen, _center },
		Event { "flag three", "" },		Click { 1, -180, -155, _screen, _center },
		Event { "row one", "" },		Click { 1, -216, -219, _screen, _center },
		Event { "toggle", "" },			Sequence{}, Keypress { kc_space, 0 }, Keypress { kc_down, 0 }, endSequence{},
		_IMouseSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DirectionKeys_,
		_WhitespaceKeys_
	} }
} };

#pragma mark 9 === InterfaceBuilder

resource restype_Slate (resid_InterfaceBuilder, "InterfaceBuilder Slate") { {
	Slate { "IB",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeIBSlate_,
		_WindowSlate_,
		_IMouseSlate_,
		Event { "shift click", "" },	ClickMod { 1, 0, 0, _cursor, mf_shift },
		Event { "jump north", "" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "exit", "" },	NilAction{},
			Event { "one", "" },		Sequence{},
				Keypress { kc_up, 0 },
				endSequence{},
			Event { "two", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "three", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "four", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "five", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "six", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "seven", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "eight", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "nine", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "ten", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "twenty", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "forty", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			Event { "eighty", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			endSubslate{},
		Event { "jump down", "" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "exit", "" },	NilAction{},
			Event { "one", "" },		Sequence{},
				Keypress { kc_down, 0 },
				endSequence{},
			Event { "two", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "three", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "four", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "five", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "six", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "seven", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "eight", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "nine", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "ten", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "twenty", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "forty", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			Event { "eighty", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			endSubslate{},
		Event { "jump right", "" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "exit", "" },	NilAction{},
			Event { "one", "" },		Sequence{},
				Keypress { kc_right, 0 },
				endSequence{},
			Event { "two", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "three", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "four", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "five", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "six", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "seven", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "eight", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "nine", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "ten", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "twenty", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "forty", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			Event { "eighty", "" },		Sequence{},
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 }, Keypress { kc_right, 0 },
				endSequence{},
			endSubslate{},
		Event { "jump left", "" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "exit", "" },	NilAction{},
			Event { "one", "" },		Sequence{},
				Keypress { kc_left, 0 },
				endSequence{},
			Event { "two", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "three", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "four", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "five", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "six", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "seven", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "eight", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "nine", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "ten", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "twenty", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "forty", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			Event { "eighty", "" },		Sequence{},
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 },
				endSequence{},
			endSubslate{},
		Event { "Menu", "" },			Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "Interface Builder" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			Event { "File", "" }, Sequence{},
				ClickMenu { "File" }, _down, ResSubslate { resid_FileMenu }, endSequence{},
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Font", "'Font' menu" }, ClickMenu { "Font" },
			ExitEvent { "Layout", "'Layout' menu" }, ClickMenu { "Layout" },
			ExitEvent { "Tools", "'Tools' menu" }, ClickMenu { "Tools" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
		Event { "Macro", "" },				ResSubslate { resid_Macro },
		Event { "go document", "" },		Keypress { kc_up, mf_command + mf_option },
		Event { "go object", "" },			Keypress { kc_down, mf_command + mf_option },
		Event { "go next object", "" },		Keypress { kc_right, mf_command + mf_control },
		Event { "go previous object", "" },	Keypress { kc_left, mf_command + mf_control },
		Event { "fetch object", "" },		Click { -2, 1400, 760, _screen, _topLeft },
		Event { "Document", "" },		Sequence{}, Keypress { kc_0, mf_command }, ResSubslate { resid_Document }, endSequence{},
		Event { "Library", "" },		Sequence{}, Keypress { kc_L, mf_command + mf_shift }, ResSubslate { resid_Library }, endSequence{},
		Event { "open info", "" },		Keypress { kc_I, mf_command + mf_shift },
		Event { "Attributes", "" },		Sequence{}, Keypress { kc_1, mf_command }, ResSubslate { resid_Attributes }, endSequence{},
		Event { "Effects", "" },		Sequence{}, Keypress { kc_2, mf_command }, ResSubslate { resid_Effects }, endSequence{},
		Event { "Size", "" },			Sequence{}, Keypress { kc_3, mf_command }, ResSubslate { resid_Size }, endSequence{},
		Event { "Bindings", "" },		Sequence{}, Keypress { kc_4, mf_command }, ResSubslate { resid_Bindings }, endSequence{},
		Event { "Connections", "" },	Sequence{}, Keypress { kc_5, mf_command }, ResSubslate { resid_Connections }, endSequence{},
		Event { "Identity", "" },		Sequence{}, Keypress { kc_6, mf_command }, ResSubslate { resid_Identity }, endSequence{},
		Event { "Dialog", "" },			Subslate { "Dialog" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Core Data", "" },		ResSubslate { resid_CoreData },
			endSubslate{},
		_DirectionKeys_,
		_WhitespaceKeys_
	} }
} };

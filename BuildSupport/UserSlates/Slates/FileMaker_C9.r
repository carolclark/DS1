// =================================================================================
//	FileMaker_C9.r				©2005-07 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeFileMakerSlate		resid_FileMaker+1
#define resid_TypeSpecialFileMakerSlate	resid_FileMaker+2
#define resid_TypeTyperSlate			resid_FileMaker+3

#define resid_RecordSlate				resid_FileMaker+10
#define resid_PortalSlate				resid_FileMaker+15
#define resid_FileSlate					resid_FileMaker+20
#define resid_ViewSlate					resid_FileMaker+25
	#define resid_ViewLayout				resid_ViewSlate+1
#define resid_PaletteSlate				resid_FileMaker+30
#define resid_CalculationSlate			resid_FileMaker+35
#define resid_CalcItems						resid_CalculationSlate+1
#define resid_DialogSlate				resid_FileMaker+40

#define resid_DebugSlate				resid_FileMaker+45
#define resid_ExternalsSlate			resid_FileMaker+50
#define resid_DesignReportSlate			resid_FileMaker+55

#define resid_LayoutSlate				resid_FileMaker+100
#define resid_ObjectInfo					resid_LayoutSlate+1
#define resid_LayoutTools					resid_LayoutSlate+2
#define resid_LayoutSetup					resid_LayoutSlate+3
#define resid_FieldSetup					resid_LayoutSlate+4
#define resid_NewLayout						resid_LayoutSlate+5

#define resid_DefineFieldsSlate			resid_FileMaker+200
#define resid_DefFieldsOptionsSlate			resid_DefineFieldsSlate+1
#define resid_DefineTablesSlate				resid_DefineFieldsSlate+2
#define resid_DefineRelationshipsSlate		resid_DefineFieldsSlate+3

#define resid_ScriptListSlate			resid_FileMaker+300
#define resid_ScriptEditSlate				resid_ScriptListSlate+1
#define resid_AttachScriptSlate				resid_ScriptListSlate+2
#define resid_ScriptOptionsSlate			resid_ScriptListSlate+3
#define resid_SetScriptSlate				resid_ScriptListSlate+4
#define resid_SetVariableSlate				resid_ScriptListSlate+5
#define resid_NewWindowSlate				resid_ScriptListSlate+6
#define resid_MoveWindowSlate				resid_ScriptListSlate+7
#define resid_FindRequestsSlate				resid_ScriptListSlate+8
#define resid_SortSlate						resid_ScriptListSlate+9

#define resid_CustomMenusSlate			resid_FileMaker+400
#define	resid_CustomMenusSubslate			resid_CustomMenusSlate+1
#define	resid_MenuSetsSubslate				resid_CustomMenusSlate+51

#define resid_FunctionsListSlate		resid_FileMaker+500
#define resid_FunctionsEditSlate			resid_FunctionsListSlate+1

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialFileMakerSlate, "Type Special FileMaker Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "Mach O",	"type 'Mach-O'" },	TypeText { "Mach-O" },
		ExitEvent { "Wichita", "" },				Sequence{},
			TypeText { "Wichita" },	Keypress { kc_Tab, 0 }, TypeText { "KS" }, Keypress { kc_Tab, 0 }, TypeText { "672" },
			endSequence{},
		ExitEvent { "script parameter", "" },		TypeText { "Get (ScriptParameter)" },
		ExitEvent { "script result", "" },			TypeText { "Get (ScriptResult)" },
		ExitEvent { "getval", "" },					Sequence{},
			TypeText { "getval (\"\", \"\")" },
			Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, 
			endSequence{},
		ExitEvent { "setval", "" },					Sequence{},
			TypeText { "setval (\"\", \"\")" },
			Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, 
			endSequence{},
		ExitEvent { "message parameter", "" },		Sequence{},
			TypeText { "setval (\"message\", \"\")" },
			Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, 
			endSequence{},
		ExitEvent { "view parameter", "" },		Sequence{},
			TypeText { "setval (\"message\", \"view\") &" }, Keypress { kc_return, 0 },
			TypeText { "setval (\"target\", \"\")" },
			Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, 
			endSequence{},
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeFileMakerSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialFileMakerSlate },
	} }
} };

resource restype_Slate (resid_TypeTyperSlate, "FileMaker Typer Slate") { {
	Slate { "Typer",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },	NilAction{},
		ExitEvent { "okay", "" },	Launch { Apps_"FileMaker Pro 9 Advanced/FileMaker Pro Advanced.app", 0 },
		Event { "Special", "" },	ResSubslate { resid_TypeSpecialFileMakerSlate },
	} }
} };

#define _TypeFileMakerSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeFileMakerSlate }

#define _goTyper_		\
	Event { "go Typer", "" },		Sequence{},	\
		Launch { DevApps_"XCode.app", 0 },	\
		ResSubslate { resid_TypeTyperSlate },	\
		endSequence{}

#pragma mark Calculation
resource restype_Slate (resid_CalculationSlate, "Calculation Slate") { {
	Slate { "Calc",	{
		_SlateGlobals_,
		_CommandSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		_TypeFileMakerSlate_,
		_goTyper_,
		ExitEvent { "okay", "" },			Keypress { kc_enter, 0 },
		ExitEvent { "cancel", "" },			Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },			NilAction{},
		Event { "Tables", "" },				Click { 1, -210, -250, _screen, _center },
		Event { "field list", "" },			Sequence{},
			Click { 0, -286, -238, _screen, _center },
			ResSubslate { resid_CalcItems },
			endSequence{},
		Event { "View", "" },				Click { 1, 150, -250, _screen, _center },
		Event { "function list", "" },		Sequence{},
			Click { 0, 95, -238, _screen, _center },
			ResSubslate { resid_CalcItems },
			endSequence{},
	} }
} };

resource restype_Slate (resid_CalcItems, "") { {
	Slate { "items",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "item one", "" },		Sequence{},
			Click { 0, 0, 18, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item two", "" },		Sequence{},
			Click { 0, 0, 36, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item three", "" },		Sequence{},
			Click { 0, 0, 54, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item four", "" },		Sequence{},
			Click { 0, 0, 72, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item five", "" },		Sequence{},
			Click { 0, 0, 90, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item six", "" },		Sequence{},
			Click { 0, 0, 108, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item seven", "" },		Sequence{},
			Click { 0, 0, 126, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item eight", "" },		Sequence{},
			Click { 0, 0, 144, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item nine", "" },		Sequence{},
			Click { 0, 0, 162, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
		ExitEvent { "item ten", "" },		Sequence{},
			Click { 0, 0, 180, _cursor },
			Click { 2, 0, 0, _cursor },
			endSequence{},
	} }
} };

#define _CalculationSlate_	 		\
	Event { "Calculation", "access the Calculation window" },	\
		ResSubslate { resid_CalculationSlate }

#pragma mark Dialog
resource restype_Slate (resid_DialogSlate, "Dialog Slate") { {
	Slate { "Dialog",	{
		_SlateGlobals_,
		_TypeFileMakerSlate_,
		ExitEvent { "okay", "" },			Keypress { kc_enter, 0 },
		ExitEvent { "cancel", "" },			Click { 1, 45, -85, _screen, _center },
		ExitEvent { "cancel two", "" },		Click { 1, 45, -47, _screen, _center },
		ExitEvent { "select", "select the highlighted control" }, KeyDelay { kc_space, 0, 10 },
		ExitEvent { "exit", "" },			NilAction{},
	} }
} };

#define _DialogSlate_	 		\
	Event { "Dialog", "access the Dialog window" },	\
		ResSubslate { resid_DialogSlate }

#pragma mark _FileMakerStandards_
#define _FileMakerStandards_	\
		_SlateGlobals_,			\
		_StarterBase_,			\
		_TypeFileMakerSlate_,	\
		_goTyper_,				\
		_CalculationSlate_,		\
		_DialogSlate_

#pragma mark Record
resource restype_Slate (resid_RecordSlate, "Record Slate") { {
	Slate { "Record",	{
		_SlateGlobals_,
		_TypeFileMakerSlate_,
		_CommandSlate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		ExitEvent { "okay", "" },		NilAction{},
		Event { "next", "" },			Keypress { kc_down, mf_command },
		Event { "previous", "" },		Keypress { kc_up, mf_command },
		Event { "last", "" },			Keypress { kc_down, mf_command + mf_shift },
		Event { "first", "" },			Keypress { kc_up, mf_command + mf_shift },
		Event { "select", "" },			Keypress { kc_J, mf_command + mf_shift },
		Event { "Portal", "" },			ResSubslate { resid_PortalSlate },
	} }
} };

#pragma mark Portal
resource restype_Slate (resid_PortalSlate, "Portal Slate") { {
	Slate { "Portal",	{
		_SlateGlobals_,
		_TypeFileMakerSlate_,
		_CommandSlate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		ExitEvent { "okay", "" },		NilAction{},
		Event { "next", "" },			Keypress { kc_down, mf_command + mf_shift + mf_option },
		Event { "previous", "" },		Keypress { kc_up, mf_command + mf_shift + mf_option },
		Event { "first", "" },			Keypress { kc_down, mf_command + mf_option },
		Event { "last", "" },			Keypress { kc_up, mf_command + mf_option },
		Event { "edit", "" },			Keypress { kc_E, mf_command + mf_shift + mf_option },
		Event { "new", "" },			Keypress { kc_N, mf_command + mf_shift + mf_option },
		Event { "delete", "" },			Keypress { kc_D, mf_command + mf_shift + mf_option },
		Event { "show", "" },			Keypress { kc_Z, mf_command + mf_shift + mf_option },
		Event { "enter", "" },			Keypress { kc_enter, 0 },
	} }
} };

#pragma mark View
resource restype_Slate (resid_ViewSlate, "View Slate") { {
	Slate { "View",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		Event { "Layouts", "" },		Sequence{},
			Click { 1, 345, 10, _screen, _topLeft }, TypeText { "Go to Layout" }, Keypress { kc_right, 0 },
			ResSubslate { resid_ViewLayout },
			endSequence{},
		ExitEvent { "Form", "" },		Keypress { kc_F, mf_command + mf_shift + mf_option },
		ExitEvent { "List", "" },		Keypress { kc_L, mf_command + mf_shift + mf_option },
		ExitEvent { "Home", "" },		Keypress { kc_H, mf_command + mf_shift + mf_option },
		ExitEvent { "Developer", "" },	Keypress { kc_X, mf_command + mf_shift + mf_option },
		ExitEvent { "Palette", "" },	Keypress { kc_T, mf_command + mf_shift + mf_option },
		ExitEvent { "Planner", "" },	Keypress { kc_P, mf_command + mf_shift + mf_option },
		ExitEvent { "Objectives", "" },	Keypress { kc_G, mf_command + mf_shift + mf_option },
		ExitEvent { "Contacts", "" },	Keypress { kc_C, mf_command + mf_shift + mf_option },
		ExitEvent { "People", "" },		Keypress { kc_Y, mf_command + mf_shift + mf_option },
		ExitEvent { "Mail Merge", "" },	Keypress { kc_M, mf_command + mf_shift + mf_option },
		ExitEvent { "Activity", "" },	Keypress { kc_A, mf_command + mf_shift + mf_option },
		ExitEvent { "Events", "" },		Keypress { kc_V, mf_command + mf_shift + mf_option },
		ExitEvent { "Tasks", "" },		Keypress { kc_K, mf_command + mf_shift + mf_option },
		ExitEvent { "Sales", "" },		Keypress { kc_S, mf_command + mf_shift + mf_option },
		ExitEvent { "Orders", "" },		Keypress { kc_O, mf_command + mf_shift + mf_option },
		ExitEvent { "Purchases", "" },	Keypress { kc_U, mf_command + mf_shift + mf_option },
		ExitEvent { "Catalog", "" },	Keypress { kc_J, mf_command + mf_shift + mf_option },
		ExitEvent { "Accounting", "" },	Keypress { kc_I, mf_command + mf_shift + mf_option },
		ExitEvent { "Help", "" },		Keypress { kc_slash, mf_command + mf_shift + mf_option },
	} }
} };

#pragma mark ViewLayout
	resource restype_Slate (resid_ViewLayout, "View Layout") { {
	Slate { "Layout",	{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },	NilAction{},
		ExitEvent { "okay", "" },	Keypress { kc_return, 0 },
		Event { "People", "" },		TypeText { "People" },
		Event { "Home", "" },		TypeText { "Home" },
		Event { "Events", "" },		TypeText { "Events" },
		Event { "Tasks", "" },		TypeText { "Tasks" },
		Event { "Orders", "" },		TypeText { "Orders" },
		Event { "Purchases", "" },	TypeText { "Purchases" },
		Event { "Catalog", "" },	TypeText { "Catalog" },
		Event { "Accounting", "" },	TypeText { "Accounts" },
		Event { "Out", "" },		TypeText { "Out" },
		_JumpDownSubslate_,
		_JumpNorthSubslate_
	} }
} };

#pragma mark Palette
	resource restype_Slate (resid_PaletteSlate, "Palette Slate") { {
	Slate { "Palette",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "Home", "" },		Keypress { kc_H, mf_command + mf_shift + mf_option },
		ExitEvent { "Developer", "" },	Keypress { kc_X, mf_command + mf_shift + mf_option },
		ExitEvent { "Original", "" },	Keypress { kc_0, mf_command + mf_shift + mf_option },
		ExitEvent { "Headers", "" },	Keypress { kc_W, mf_command + mf_shift + mf_option },
		ExitEvent { "Palette", "" },	Keypress { kc_T, mf_command + mf_shift + mf_option },
		ExitEvent { "Planner", "" },	Keypress { kc_P, mf_command + mf_shift + mf_option },
		ExitEvent { "Objectives", "" },	Keypress { kc_G, mf_command + mf_shift + mf_option },
		ExitEvent { "Contacts", "" },	Keypress { kc_C, mf_command + mf_shift + mf_option },
		ExitEvent { "People", "" },		Keypress { kc_Y, mf_command + mf_shift + mf_option },
		ExitEvent { "Mail Merge", "" },	Keypress { kc_M, mf_command + mf_shift + mf_option },
		ExitEvent { "Activity", "" },	Keypress { kc_A, mf_command + mf_shift + mf_option },
		ExitEvent { "Events", "" },		Keypress { kc_V, mf_command + mf_shift + mf_option },
		ExitEvent { "Tasks", "" },		Keypress { kc_K, mf_command + mf_shift + mf_option },
		ExitEvent { "Sales", "" },		Keypress { kc_S, mf_command + mf_shift + mf_option },
		ExitEvent { "Orders", "" },		Keypress { kc_O, mf_command + mf_shift + mf_option },
		ExitEvent { "Purchases", "" },	Keypress { kc_U, mf_command + mf_shift + mf_option },
		ExitEvent { "Catalog", "" },	Keypress { kc_J, mf_command + mf_shift + mf_option },
		ExitEvent { "Accounting", "" },	Keypress { kc_I, mf_command + mf_shift + mf_option },
		ExitEvent { "Help", "" },		Keypress { kc_slash, mf_command + mf_shift + mf_option },
	} }
} };

#pragma mark File
resource restype_Slate (resid_FileSlate, "File Slate") { {
	Slate { "File",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			NilAction{},
		ExitEvent { "manage", "" },			Sequence{},
			Click { 1, 260, 10, _screen, _topLeft },
			TypeText { "Manage" },
			Keypress { kc_right, 0 },
			endSequence{},
		ExitEvent { "Anchor Window", "" },	Keypress { kc_A, mf_command + mf_shift + mf_option },
		ExitEvent { "Script Temp One", "" },Keypress { kc_1, mf_command + mf_shift + mf_option },
		ExitEvent { "Script Temp Two", "" },Keypress { kc_2, mf_command + mf_shift + mf_option },
	} }
} };

#pragma mark Debug
resource restype_Slate (resid_DebugSlate, "Debug Slate") { {
	Slate { "Debug",	{
		_SlateGlobals_,
		_TypeFileMakerSlate_,
		_CommandSlate_,
		_IMouseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "okay", "" },		NilAction{},
		Event { "step", "" },			Keypress { kc_fn5, 0 },
		Event { "in to", "" },			Keypress { kc_fn6, 0 },
		Event { "out of", "" },			Keypress { kc_fn7, 0 },
		Event { "run script", "" },		Keypress { kc_fn8, mf_option },
		Event { "abort", "" },			Keypress { kc_fn8, mf_command },
		Event { "set next step", "" },	Keypress { kc_fn5, mf_command + mf_shift },
		Event { "set breakpoint", "" },		Keypress { kc_fn9, 0 },
		Event { "clear breakpoints", "" },	Keypress { kc_fn9, mf_command + mf_shift },
		Event { "edit script", "" },		Keypress { kc_fn10, mf_command },
		Event { "pause on error", "" },	Sequence{},
			Keypress { kc_fn2, mf_control }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, Keypress { kc_left, 0 }, 
			Keypress { kc_down, 0 }, TypeText { "Debugging Controls" }, Keypress { kc_right, 0 },
 			TypeText { "Pause on error" }, Click { 0, 885, 275, _screen, _topLeft },
			endSequence{},
	} }
} };

#pragma mark Externals
resource restype_Slate (resid_ExternalsSlate, "Externals Slate") { {
	Slate { "Externals",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Click { 1, 215, 65, _screen, _center },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "new", "" },		Click { 1, -230, 65, _screen, _center },
		Event { "edit", "" },		Click { 1, -140, 65, _screen, _center },
		Event { "add file", "" },		Click { 1, 230, -175, _screen, _center },
		Event { "item one", "" },		Sequence{},
			Click { 0, -240, -155, _screen, _center },
			Click { 1, -240, -155, _screen, _center },
			endSequence{},
		Event { "item two", "" },		Sequence{},
			Click { 0, -240, -137, _screen, _center },
			Click { 1, -240, -137, _screen, _center },
			endSequence{},
		Event { "item three", "" },		Sequence{},
			Click { 0, -240, -119, _screen, _center },
			Click { 1, -240, -119, _screen, _center },
			endSequence{},
		Event { "item four", "" },		Sequence{},
			Click { 0, -240, -101, _screen, _center },
			Click { 1, -240, -101, _screen, _center },
			endSequence{},
		Event { "item five", "" },		Sequence{},
			Click { 0, -240, -83, _screen, _center },
			Click { 1, -240, -83, _screen, _center },
			endSequence{},
		Event { "item six", "" },		Sequence{},
			Click { 0, -240, -65, _screen, _center },
			Click { 1, -240, -65, _screen, _center },
			endSequence{},
		Event { "item seven", "" },		Sequence{},
			Click { 0, -240, -47, _screen, _center },
			Click { 1, -240, -47, _screen, _center },
			endSequence{},
		Event { "item eight", "" },		Sequence{},
			Click { 0, -240, -29, _screen, _center },
			Click { 1, -240, -29, _screen, _center },
			endSequence{},
		Event { "item nine", "" },		Sequence{},
			Click { 0, -240, -11, _screen, _center },
			Click { 1, -240, -11, _screen, _center },
			endSequence{},
		Event { "item ten", "" },		Sequence{},
			Click { 0, -240, 7, _screen, _center },
			Click { 1, -240, 7, _screen, _center },
			endSequence{},
	} }
} };

#pragma mark DesignReport
resource restype_Slate (resid_DesignReportSlate, "DesignReport Slate") { {
	Slate { "DesignReport",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "okay", "" },		NilAction{},
		Event { "create", "" },			Keypress { kc_return, 0 },
		Event { "yes all", "" },		Click { 0, 65, -75, _screen, _center },
	} }
} };

#pragma mark ScriptEditor

#define _ScriptStepGroups_		\
		Event { "control", "" },		TypeText { "control" },			\
		Event { "navigation", "" },		TypeText { "navigation" },		\
		Event { "editing", "" },		TypeText { "editing" },			\
		Event { "fields", "" },			TypeText { "fields" },			\
		Event { "records", "" },		TypeText { "records" },			\
		Event { "found sets", "" },		TypeText { "found sets" },		\
		Event { "windows", "" },		TypeText { "windows" },			\
		Event { "files", "" },			TypeText { "files" },			\
		Event { "accounts", "" },		TypeText { "accounts" },		\
		Event { "spelling", "" },		TypeText { "spelling" },		\
		Event { "open menu item", "" },	TypeText { "open menu item" },	\
		Event { "miscellaneous", "" },	TypeText { "miscellaneous" }

resource restype_Slate (resid_ScriptListSlate, "Script List Slate") { {
	Slate { "scrList",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "group list", "" },		Click { 1, -125, -150, _screen, _center },
		Event { "menu", "" },			Click { 1, -210, 175, _screen, _center },
		Event { "delete", "" },			Keypress { kc_delete, 0 },
		Event { "duplicate", "" },		Keypress { kc_D, mf_command },
		Event { "print", "" },			Click { 1, 25, 205, _screen, _center },
		Event { "import", "" },			Click { 1, 55, 205, _screen, _center },
		Event { "perform", "" },		Click { 1, 85, 205, _screen, _center },
		Event { "new group", "" },		Sequence {},
			Click { 1, -160, 205, _screen, _center },
			TypeText { "New Group" },
			endSequence{},
		Event { "new separator", "" },		Sequence {},
			Click { 1, -160, 205, _screen, _center },
			TypeText { "New Separator" },
			endSequence{},
		Event { "new script", "" },			Sequence {},
			Click { 1, -160, 205, _screen, _center },
			TypeText { "New Script" },
			ResSubslate { resid_ScriptEditSlate },
			endSequence{},
		Event { "edit script", "" },			Sequence {},
			Click { 1, -120, 205, _screen, _center },
			ResSubslate { resid_ScriptEditSlate },
			endSequence{},
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "item one", "" },		Sequence{},
			Click { 0, -180, -120, _screen, _center },
			Click { 1, -180, -120, _screen, _center },
			endSequence{},
		Event { "item two", "" },		Sequence{},
			Click { 0, -180, -105, _screen, _center },
			Click { 1, -180, -105, _screen, _center },
			endSequence{},
		Event { "item three", "" },		Sequence{},
			Click { 0, -180, -90, _screen, _center },
			Click { 1, -180, -90, _screen, _center },
			endSequence{},
		Event { "item four", "" },		Sequence{},
			Click { 0, -180, -75, _screen, _center },
			Click { 1, -180, -75, _screen, _center },
			endSequence{},
		Event { "item five", "" },		Sequence{},
			Click { 0, -180, -60, _screen, _center },
			Click { 1, -180, -60, _screen, _center },
			endSequence{},
		Event { "item six", "" },		Sequence{},
			Click { 0, -180, -45, _screen, _center },
			Click { 1, -180, -45, _screen, _center },
			endSequence{},
		Event { "item seven", "" },		Sequence{},
			Click { 0, -180, -30, _screen, _center },
			Click { 1, -180, -30, _screen, _center },
			endSequence{},
		Event { "item eight", "" },		Sequence{},
			Click { 0, -180, -15, _screen, _center },
			Click { 1, -180, -15, _screen, _center },
			endSequence{},
		Event { "item nine", "" },		Sequence{},
			Click { 0, -180, 0, _screen, _center },
			Click { 1, -180, 0, _screen, _center },
			endSequence{},
		Event { "item ten", "" },		Sequence{},
			Click { 0, -180, 15, _screen, _center },
			Click { 1, -180, 15, _screen, _center },
			endSequence{},
		Event { "item eleven", "" },	Sequence{},
			Click { 0, -180, 30, _screen, _center },
			Click { 1, -180, 30, _screen, _center },
			endSequence{},
		Event { "item twelve", "" },	Sequence{},
			Click { 0, -180, 45, _screen, _center },
			Click { 1, -180, 45, _screen, _center },
			endSequence{},
		Event { "item thirteen", "" },	Sequence{},
			Click { 0, -180, 60, _screen, _center },
			Click { 1, -180, 60, _screen, _center },
			endSequence{},
		Event { "item fourteen", "" },	Sequence{},
			Click { 0, -180, 75, _screen, _center },
			Click { 1, -180, 75, _screen, _center },
			endSequence{},
		Event { "item fifteen", "" },	Sequence{},
			Click { 0, -180, 90, _screen, _center },
			Click { 1, -180, 90, _screen, _center },
			endSequence{},
		Event { "item sixteen", "" },	Sequence{},
			Click { 0, -180, 105, _screen, _center },
			Click { 1, -180, 105, _screen, _center },
			endSequence{},
		Event { "item seventeen", "" },	Sequence{},
			Click { 0, -180, 120, _screen, _center },
			Click { 1, -180, 120, _screen, _center },
			endSequence{},
		Event { "item eighteen", "" },	Sequence{},
			Click { 0, -180, 135, _screen, _center },
			Click { 1, -180, 135, _screen, _center },
			endSequence{},
		Event { "item nineteen", "" },	Sequence{},
			Click { 0, -180, 150, _screen, _center },
			Click { 1, -180, 150, _screen, _center },
			endSequence{},
		Event { "item twenty", "" },	Sequence{},
			Click { 0, -180, 165, _screen, _center },
			Click { 1, -180, 165, _screen, _center },
			endSequence{},
		Event { "item twentyone", "" },	Sequence{},
			Click { 0, -180, 180, _screen, _center },
			Click { 1, -180, 180, _screen, _center },
			endSequence{},
	} }
} };

#pragma mark -ScriptEdit
resource restype_Slate (resid_ScriptEditSlate, "Script Edit Slate") { {
	Slate { "scrEdit",	{
		_FileMakerStandards_,
		ExitEvent { "okay", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page home", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "view by", "" },		Click { 1, -260, -270, _screen, _center },
		Event { "duplicate", "" },		Click { 1, -10, 101, _screen, _center },
		Event { "perform", "" },		Click { 1, 77, 200, _screen, _center },
		Event { "disable", "" },		Click { 1, 76, 101, _screen, _center },
		Event { "copy", "" },			Click { 1, 227, 101, _screen, _center },
		Event { "paste", "" },			Click { 1, 323, 101, _screen, _center },
		Event { "specify", "" },		Sequence{},
			Click { 1, 290, 48, _screen, _center },
			ResSubslate { resid_ScriptOptionsSlate },
			endSequence{},
		Event { "specify other", "" },	Sequence{},
			Click { 1, 290, 20, _screen, _center },
			ResSubslate { resid_ScriptOptionsSlate },
			endSequence{},
		Event { "left checkbox", "" },	Click { 1, -130, 50, _screen, _center },
		Event { "options", "" },		ResSubslate { resid_ScriptOptionsSlate },
		_ScriptStepGroups_,
		Event { "item one", "" },		Sequence{},
			Click { 0, -343, -242, _screen, _center },
			Click { 1, -343, -242, _screen, _center },
			endSequence{},
		Event { "item two", "" },		Sequence{},
			Click { 0, -343, -227, _screen, _center },
			Click { 1, -343, -227, _screen, _center },
			endSequence{},
		Event { "item three", "" },		Sequence{},
			Click { 0, -343, -212, _screen, _center },
			Click { 1, -343, -212, _screen, _center },
			endSequence{},
		Event { "item four", "" },		Sequence{},
			Click { 0, -343, -197, _screen, _center },
			Click { 1, -343, -197, _screen, _center },
			endSequence{},
		Event { "item five", "" },		Sequence{},
			Click { 0, -343, -182, _screen, _center },
			Click { 1, -343, -182, _screen, _center },
			endSequence{},
		Event { "item six", "" },		Sequence{},
			Click { 0, -343, -167, _screen, _center },
			Click { 1, -343, -167, _screen, _center },
			endSequence{},
		Event { "item seven", "" },		Sequence{},
			Click { 0, -343, -152, _screen, _center },
			Click { 1, -343, -152, _screen, _center },
			endSequence{},
		Event { "item eight", "" },		Sequence{},
			Click { 0, -343, -137, _screen, _center },
			Click { 1, -343, -137, _screen, _center },
			endSequence{},
		Event { "item nine", "" },		Sequence{},
			Click { 0, -343, -122, _screen, _center },
			Click { 1, -343, -122, _screen, _center },
			endSequence{},
		Event { "item ten", "" },		Sequence{},
			Click { 0, -343, -107, _screen, _center },
			Click { 1, -343, -107, _screen, _center },
			endSequence{},
		Event { "item eleven", "" },	Sequence{},
			Click { 0, -343, -92, _screen, _center },
			Click { 1, -343, -92, _screen, _center },
			endSequence{},
		Event { "item twelve", "" },	Sequence{},
			Click { 0, -343, -77, _screen, _center },
			Click { 1, -343, -77, _screen, _center },
			endSequence{},
		Event { "item thirteen", "" },	Sequence{},
			Click { 0, -343, -62, _screen, _center },
			Click { 1, -343, -62, _screen, _center },
			endSequence{},
		Event { "item fourteen", "" },	Sequence{},
			Click { 0, -343, -47, _screen, _center },
			Click { 1, -343, -47, _screen, _center },
			endSequence{},
		Event { "item fifteen", "" },	Sequence{},
			Click { 0, -343, -32, _screen, _center },
			Click { 1, -343, -32, _screen, _center },
			endSequence{},
		Event { "item sixteen", "" },	Sequence{},
			Click { 0, -343, -17, _screen, _center },
			Click { 1, -343, -17, _screen, _center },
			endSequence{},
		Event { "item seventeen", "" },	Sequence{},
			Click { 0, -343, -2, _screen, _center },
			Click { 1, -343, -2, _screen, _center },
			endSequence{},
		Event { "item eighteen", "" },	Sequence{},
			Click { 0, -343, 13, _screen, _center },
			Click { 1, -343, 13, _screen, _center },
			endSequence{},
		Event { "item nineteen", "" },	Sequence{},
			Click { 0, -343, 28, _screen, _center },
			Click { 1, -343, 28, _screen, _center },
			endSequence{},
		Event { "item twenty", "" },	Sequence{},
			Click { 0, -343, 43, _screen, _center },
			Click { 1, -343, 43, _screen, _center },
			endSequence{},
		Event { "item twentyone", "" },	Sequence{},
			Click { 0, -343, 58, _screen, _center },
			Click { 1, -343, 58, _screen, _center },
			endSequence{},
		Event { "item twentytwo", "" },	Sequence{},
			Click { 0, -343, 73, _screen, _center },
			Click { 1, -343, 73, _screen, _center },
			endSequence{},
		Event { "item twentythree", "" },	Sequence{},
			Click { 0, -343, 88, _screen, _center },
			Click { 1, -343, 88, _screen, _center },
			endSequence{},
		Event { "item twentyfour", "" },	Sequence{},
			Click { 0, -343, 103, _screen, _center },
			Click { 1, -343, 103, _screen, _center },
			endSequence{},
		Event { "step one", "" },		Sequence{},
			Click { 0, -90, -242, _screen, _center },
			Click { 1, -90, -242, _screen, _center },
			endSequence{},
		Event { "step two", "" },		Sequence{},
			Click { 0, -90, -227, _screen, _center },
			Click { 1, -90, -227, _screen, _center },
			endSequence{},
		Event { "step three", "" },		Sequence{},
			Click { 0, -90, -212, _screen, _center },
			Click { 1, -90, -212, _screen, _center },
			endSequence{},
		Event { "step four", "" },		Sequence{},
			Click { 0, -90, -197, _screen, _center },
			Click { 1, -90, -197, _screen, _center },
			endSequence{},
		Event { "step five", "" },		Sequence{},
			Click { 0, -90, -182, _screen, _center },
			Click { 1, -90, -182, _screen, _center },
			endSequence{},
		Event { "step six", "" },		Sequence{},
			Click { 0, -90, -167, _screen, _center },
			Click { 1, -90, -167, _screen, _center },
			endSequence{},
		Event { "step seven", "" },		Sequence{},
			Click { 0, -90, -152, _screen, _center },
			Click { 1, -90, -152, _screen, _center },
			endSequence{},
		Event { "step eight", "" },		Sequence{},
			Click { 0, -90, -137, _screen, _center },
			Click { 1, -90, -137, _screen, _center },
			endSequence{},
		Event { "step nine", "" },		Sequence{},
			Click { 0, -90, -122, _screen, _center },
			Click { 1, -90, -122, _screen, _center },
			endSequence{},
		Event { "step ten", "" },		Sequence{},
			Click { 0, -90, -107, _screen, _center },
			Click { 1, -90, -107, _screen, _center },
			endSequence{},
		Event { "step eleven", "" },	Sequence{},
			Click { 0, -90, -92, _screen, _center },
			Click { 1, -90, -92, _screen, _center },
			endSequence{},
		Event { "step twelve", "" },	Sequence{},
			Click { 0, -90, -77, _screen, _center },
			Click { 1, -90, -77, _screen, _center },
			endSequence{},
		Event { "step thirteen", "" },	Sequence{},
			Click { 0, -90, -62, _screen, _center },
			Click { 1, -90, -62, _screen, _center },
			endSequence{},
	} }
} };

#define _left	-250
#define _top	-200
#define	_dv		15

#pragma mark --AttachScript
resource restype_Slate (resid_AttachScriptSlate, "Menu Step Slate") { {
	Slate { "step",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "specify", "" },		Click { 1, 190, -105, _screen, _center },
		Event { "specify other", "" },	Click { 1, 190, -123, _screen, _center },
		Event { "table", "" },			Click { 1, 0, -225, _screen, _center },
		Event { "set script", "" },		ResSubslate { resid_SetScriptSlate },
		Event { "set variable", "" },	ResSubslate { resid_SetVariableSlate },
		Event { "new window", "" },		ResSubslate { resid_NewWindowSlate },
		Event { "move window", "" },	ResSubslate { resid_MoveWindowSlate },
		_ScriptStepGroups_,
		Event { "item one", "" },		Click { 1, _left, _top + 0*_dv, _screen, _center },
		Event { "item two", "" },		Click { 1, _left, _top + 1*_dv, _screen, _center },
		Event { "item three", "" },		Click { 1, _left, _top + 2*_dv, _screen, _center },
		Event { "item four", "" },		Click { 1, _left, _top + 3*_dv, _screen, _center },
		Event { "item five", "" },		Click { 1, _left, _top + 4*_dv, _screen, _center },
		Event { "item six", "" },		Click { 1, _left, _top + 5*_dv, _screen, _center },
		Event { "item seven", "" },		Click { 1, _left, _top + 6*_dv, _screen, _center },
		Event { "item eight", "" },		Click { 1, _left, _top + 7*_dv, _screen, _center },
		Event { "item nine", "" },		Click { 1, _left, _top + 8*_dv, _screen, _center },
		Event { "item ten", "" },		Click { 1, _left, _top + 9*_dv, _screen, _center },
		Event { "item eleven", "" },	Click { 1, _left, _top + 10*_dv, _screen, _center },
		Event { "item twelve", "" },	Click { 1, _left, _top + 11*_dv, _screen, _center },
		Event { "item thirteen", "" },	Click { 1, _left, _top + 12*_dv, _screen, _center },
		Event { "item fourteen", "" },	Click { 1, _left, _top + 13*_dv, _screen, _center },
		Event { "item fifteen", "" },	Click { 1, _left, _top + 14*_dv, _screen, _center },
		Event { "item sixteen", "" },	Click { 1, _left, _top + 15*_dv, _screen, _center },
		Event { "item seventeen", "" },	Click { 1, _left, _top + 16*_dv, _screen, _center },
		Event { "item eighteen", "" },	Click { 1, _left, _top + 17*_dv, _screen, _center },
		Event { "item nineeen", "" },	Click { 1, _left, _top + 18*_dv, _screen, _center },
		Event { "item twenty", "" },	Click { 1, _left, _top + 19*_dv, _screen, _center },
		} }
} };

#pragma mark --ScriptOptions
resource restype_Slate (resid_ScriptOptionsSlate, "Script Options Slate") { {
	Slate { "opt",	{
		_FileMakerStandards_,
		_CloseSubslate_,
		ExitEvent { "field table", "" },	Click { 1, -87, -223, _screen, _center },
		Event { "select window", "" },		Subslate { "selWindow" },
			_FileMakerStandards_,
			_CalculationSlate_,
			ExitEvent { "exit", "" },			CloseSubslate{},
			ExitEvent { "okay", "" },			Keypress { kc_return, 0 },
			Event { "current window", "" },		Click { 1, -205, -130, _screen, _center },
			Event { "window name", "" },		Click { 1, -205, -100, _screen, _center },
			Event { "current file only", "" },	Click { 1, -190, -75, _screen, _center },
			Event { "specify", "" },			Click { 1, 175, -105, _screen, _center },
			endSubslate{},
		Event { "set script", "" },			ResSubslate { resid_SetScriptSlate },
		Event { "set variable", "" },		ResSubslate { resid_SetVariableSlate },
		Event { "new window", "" },			ResSubslate { resid_NewWindowSlate },
		Event { "move window", "" },		ResSubslate { resid_MoveWindowSlate },
		Event { "find requests", "" },		ResSubslate { resid_FindRequestsSlate },
		Event { "sort", "" },				ResSubslate { resid_SortSlate },
	} }
} };


#pragma mark --SetScript
resource restype_Slate (resid_SetScriptSlate, "Set Script Slate") { {
	Slate { "script",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "parameter", "" },		Click { 1, 115, 45, _screen, _center },
		Event { "file", "" },			Click { 1, -10, -215, _screen, _center },
		Event { "group", "" },			Click { 1, -75, -180, _screen, _center },
		_CalculationSlate_,
		} }
} };

#pragma mark --NewWindow
resource restype_Slate (resid_NewWindowSlate, "New Window Slate") { {
	Slate { "newW",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "name", "" },			Click { 1, 175, -150, _screen, _center },
		Event { "window height", "" },			Click { 1, 175, -115, _screen, _center },
		Event { "window width", "" },			Click { 1, 175, -80, _screen, _center },
		Event { "window top", "" },		Click { 1, 175, -50, _screen, _center },
		Event { "window left", "" },	Click { 1, 175, -15, _screen, _center },
		_CalculationSlate_,
		} }
} };

#pragma mark --MoveWindow
resource restype_Slate (resid_MoveWindowSlate, "Move Window Slate") { {
	Slate { "moveW",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "name", "" },			Click { 1, 175, -150, _screen, _center },
		Event { "window height", "" },			Click { 1, 175, -75, _screen, _center },
		Event { "window width", "" },			Click { 1, 175, -40, _screen, _center },
		Event { "window top", "" },		Click { 1, 175, -10, _screen, _center },
		Event { "window left", "" },	Click { 1, 175, 25, _screen, _center },
		_CalculationSlate_,
		} }
} };

#pragma mark --SetVariable
resource restype_Slate (resid_SetVariableSlate, "Set Variable Slate") { {
	Slate { "variable",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "specify", "" },		Click { 1, 145, -110, _screen, _center },
		_CalculationSlate_,
		} }
} };

#pragma mark --FindRequests
resource restype_Slate (resid_FindRequestsSlate, "Find Requests Slate") { {
	Slate { "requests",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Click { 1, 265, 35, _screen, _center },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "action", "" },		Click { 1, -190, -225, _screen, _center },
		} }
} };

#define _dv 16

#pragma mark --Sort
resource restype_Slate (resid_SortSlate, "Sort Slate") { {
	Slate { "sort",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "move", "" },			Click { 1, 0, -185, _screen, _center },
		Event { "clear", "" },			Click { 1, 0, -185, _screen, _center },
		Event { "ascending", "" },		Click { 1, -160, -70, _screen, _center },
		Event { "descending", "" },		Click { 1, -160, -50, _screen, _center },
		Event { "custom", "" },			Click { 1, -160, -30, _screen, _center },
		Event { "value list", "" },		Click { 1, 100, -30, _screen, _center },
		Event { "table", "" },			Click { 1, -120, -255, _screen, _center },
		Event { "fields", "" },			Click { 0, -215, -250, _screen, _center },
		Event { "order", "" },			Click { 0, 65, -250, _screen, _center },
		Event { "item one", "" },		Click { 1, 0, 1*_dv, _cursor },
		Event { "item two", "" },		Click { 1, 0, 2*_dv, _cursor },
		Event { "item three", "" },		Click { 1, 0, 3*_dv, _cursor },
		Event { "item four", "" },		Click { 1, 0, 4*_dv, _cursor },
		Event { "item five", "" },		Click { 1, 0, 5*_dv, _cursor },
		Event { "item six", "" },		Click { 1, 0, 6*_dv, _cursor },
		Event { "item seven", "" },		Click { 1, 0, 7*_dv, _cursor },
		Event { "item eight", "" },		Click { 1, 0, 8*_dv, _cursor },
		Event { "item nine", "" },		Click { 1, 0, 9*_dv, _cursor },
		} }
} };

#pragma mark Layout
resource restype_Slate (resid_LayoutSlate, "") { {
	Slate { "Layout",	{
		_FileMakerStandards_,
		ExitEvent { "okay", "" },		Keypress { kc_B, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "click one", "" },		Click { 12, 0, 0, _cursor },
		Event { "click two", "" },		Click { 2, 0, 0, _cursor },
		Event { "object info", "" },	ResSubslate { resid_ObjectInfo },
		Event { "tool", "" },			ResSubslate { resid_LayoutTools },
		Event { "layout setup", "" },	ResSubslate { resid_LayoutSetup },
		Event { "field setup", "" },	ResSubslate { resid_FieldSetup },
		Event { "new layout", "" },		Sequence{}, Keypress { kc_N, mf_command }, ResSubslate { resid_NewLayout }, endSequence{},
		Event { "Format", "" },			Subslate { "Format" },
			ExitEvent { "Painter", "" },	Sequence{},
				Click { 1, 470, 10, _screen, _topLeft },
				TypeText { "Format Painter" },
				Keypress { kc_return, 0 },
				endSequence{},
			endSubslate{},
		Event { "button setup", "" },	ResSubslate { resid_AttachScriptSlate },
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "File", "" },		Click { 1, 260, 10, _screen, _topLeft },
			ExitEvent { "Insert", "" },		Click { 1, 405, 10, _screen, _topLeft },
			ExitEvent { "Format", "" },		Click { 1, 470, 10, _screen, _topLeft },
			ExitEvent { "Layout", "" },		Click { 1, 537, 10, _screen, _topLeft },
			ExitEvent { "Arrange", "" },	Click { 1, 605, 10, _screen, _topLeft },
			ExitEvent { "Window", "" },		Sequence{},
				Keypress { kc_fn2, mf_control },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				endSequence{},
			ExitEvent { "Tools", "" },		Sequence{},
				Keypress { kc_fn2, mf_control },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				endSequence{},
			ExitEvent { "Scripts", "" },	Sequence{},
				Keypress { kc_fn2, mf_control },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				endSequence{},
			endSubslate{},
	} }
} };

resource restype_Slate (resid_ObjectInfo, "") { {
	Slate { "info",	{
		_FileMakerStandards_,
		_CloseSubslate_,
		Event { "name", "" },			Click { 2, -120, -235, _screen, _bottomRight },
		Event { "left", "" },			Click { 1, -120, -213, _screen, _bottomRight },
		Event { "top", "" },			Click { 1, -120, -199, _screen, _bottomRight },
		Event { "right", "" },			Click { 1, -120, -187, _screen, _bottomRight },
		Event { "bottom", "" },			Click { 1, -120, -171, _screen, _bottomRight },
		Event { "width", "" },			Click { 1, -120, -150, _screen, _bottomRight },
		Event { "height", "" },			Click { 1, -120, -136, _screen, _bottomRight },
	} }
} };

resource restype_Slate (resid_LayoutTools, "") { {
	Slate { "Tool",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "arrow", "" },		Click { 1, 12, 285, _screen, _topLeft },
		ExitEvent { "text", "" },		Click { 1, 32, 285, _screen, _topLeft },
	} }
} };

resource restype_Slate (resid_LayoutSetup, "") { {
	Slate { "setup",	{
		_FileMakerStandards_,
		_CloseSubslate_,
		Event { "general", "" },		Click { 1, -66, -225, _screen, _center },
		Event { "views", "" },			Click { 1, 0, -225, _screen, _center },
		Event { "printing", "" },		Click { 1, 66, -225, _screen, _center },
		Event { "show records", "" },	Click { 1, 50, -100, _screen, _center },
		Event { "menu set", "" },		Click { 1, 23, -23, _screen, _center },
	} }
} };

resource restype_Slate (resid_FieldSetup, "") { {
	Slate { "field",	{
		_FileMakerStandards_,
		ExitEvent { "okay", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "table", "" },			Click { 1, 200, -185, _screen, _center },
	} }
} };

resource restype_Slate (resid_NewLayout, "") { {
	Slate { "new",	{
		_FileMakerStandards_,
		ExitEvent { "okay", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "move", "" },			Click { 0, 0, -40, _screen, _center },
	} }
} };

#pragma mark DefineFields
resource restype_Slate (resid_DefineFieldsSlate, "") { {
	Slate { "Fields",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Click { 1, 305, 265, _screen, _center },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "select table", "" },	Click { 1, -215, -170, _screen, _center },
		Event { "view by", "" },		Click { 1, 233, -170, _screen, _center },
		Event { "tables", "" },			Sequence{},
			Click { 1, -80, -200, _screen, _center },
			ResSubslate { resid_DefineTablesSlate },
			endSequence{},
		Event { "fields", "" },			Click { 1, -15, -200, _screen, _center },
		Event { "relationships", "" },	Sequence{},
			Click { 1, 65, -200, _screen, _center },
			ResSubslate { resid_DefineRelationshipsSlate },
			endSequence{},
		Event { "create", "" },			Click { 1, -195, 220, _screen, _center },
		Event { "change", "" },			Click { 1, -95, 220, _screen, _center },
		Event { "duplicate", "" },		Click { 1, -15, 220, _screen, _center },
		Event { "delete", "" },			Click { 1, 80, 220, _screen, _center },
		Event { "print", "" },			Click { 1, -300, 265, _screen, _center },
		Event { "field type", "" },		Click { 1, 145, 155, _screen, _center },
		Event { "options", "" },		Sequence {},
			Click { 1, 275, 155, _screen, _center },
			ResSubslate { resid_DefFieldsOptionsSlate },
			endSequence{},
	} }
} };

#pragma mark -DefineFieldsOptions
resource restype_Slate (resid_DefFieldsOptionsSlate, "Fields Options Slate") { {
	Slate { "options",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "auto enter", "" },		Click { 1, -110, -280, _screen, _center },
			Event { "creation", "" },				Click { 1, -180, -215, _screen, _center },
			Event { "modification", "" },			Click { 1, -180, -190, _screen, _center },
			Event { "serial number", "" },			Click { 1, -180, -160, _screen, _center },
			Event { "value", "" },					Click { 1, -180, -80, _screen, _center },
			Event { "data", "" },					Click { 1, -180, -55, _screen, _center },
			Event { "calculated value", "" },		Click { 1, -180, 15, _screen, _center },
			Event { "lookup", "" },					Click { 1, -180, 65, _screen, _center },
			Event { "prohibit modification", "" },	Click { 1, -195, 100, _screen, _center },
		Event { "validation", "" },		Click { 1, -20, -280, _screen, _center },
			Event { "allow override", "" },			Click { 1, -180, -190, _screen, _center },
			Event { "not empty", "" },				Click { 1, -180, -110, _screen, _center },
			Event { "unique", "" },					Click { 1, -60, -110, _screen, _center },
			Event { "existing", "" },				Click { 1, 55, -110, _screen, _center },
			Event { "value list", "" },				Click { 1, 50, -85, _screen, _center },
		Event { "storage", "" },		Click { 1, 55, -280, _screen, _center },
			Event { "global", "" },		Click { 1, -180, -175, _screen, _center },
	} }
} };

#pragma mark -DefineTables
resource restype_Slate (resid_DefineTablesSlate, "Define Tables Slate") { {
	Slate { "tables",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "create", "" },			Click { 1, -60, -45, _screen, _center },
		Event { "change", "" },			Click { 1, -37, -45, _screen, _center },
		Event { "delete", "" },			Click { 1, 135, -45, _screen, _center },
		Event { "import", "" },			Click { 1, 135, -75, _screen, _center },
		Event { "print", "" },			Click { 1, -440, 120, _screen, _center },
	} }
} };

#pragma mark -DefineRelationships
resource restype_Slate (resid_DefineRelationshipsSlate, "Define Relationships Slate") { {
	Slate { "relationships",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "add", "" },			Click { 1, -445, 78, _screen, _center },
		Event { "pointer", "" },		Click { 1, -127, 78, _screen, _center },
		Event { "magnify", "" },		Click { 1, -90, 78, _screen, _center },
		Event { "adjust to fit", "" },	Click { 1, -45, 78, _screen, _center },
		Event { "print", "" },			Click { 1, -440, 120, _screen, _center },
	} }
} };

#pragma mark CustomMenus
resource restype_Slate (resid_CustomMenusSlate, "Custom Menus Slate") { {
	Slate { "Menus",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Click { 1, 315, 135, _screen, _center },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "menus", "" },			Click { 1, -35, -270, _screen, _center },
		Event { "sets", "" },			Click { 1, 55, -270, _screen, _center },
		Event { "view by", "" },		Click { 1, 235, -205, _screen, _center },
		Event { "create", "" },			Click { 1, -295, 85, _screen, _center },
		Event { "edit", "" },			Click { 1, -205, 85, _screen, _center },
		Event { "duplicate", "" },		Click { 1, -110, 85, _screen, _center },
		Event { "delete", "" },			Click { 1, -20, 85, _screen, _center },
		Event { "default set", "" },	Click { 1, -75, -440, _screen, _center },
		Event { "empty menu", "" },		Click { 1, -221, -188, _screen, _center },
		Event { "return", "" },			Keypress { kc_return, 0 },
		Event { "Custom Menus", "" },	ResSubslate { resid_CustomMenusSubslate },
		Event { "Menu Sets", "" },		ResSubslate { resid_MenuSetsSubslate },
	} }
} };

#pragma mark -Menus
resource restype_Slate (resid_CustomMenusSubslate, "Custom Menus Subslate") { {
	Slate { "menus",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "start empty", "" },	Click { 1, -220, -190, _screen, _center },
		Event { "add command", "" },	Click { 1, -330, 170, _screen, _center },
			Event { "no command assigned", "" },	Click { 1, -290, -230, _screen, _center },
		Event { "add submenu", "" },	Click { 1, -220, 170, _screen, _center },
		Event { "add separator", "" },	Click { 1, -125, 170, _screen, _center },
		Event { "the command", "" },	Click { 1, 320, -90, _screen, _center },
		Event { "title", "" },			Click { 1, 320, 15, _screen, _center },
		Event { "shortcut", "" },		Click { 1, -60, 40, _screen, _center },
		Event { "script step", "" },	Sequence{},
			Click { 1, 145, 70, _screen, _center },
			ResSubslate { resid_AttachScriptSlate },
			endSequence{},
		Event { "script", "" },			Sequence{},
			Click { 1, 320, 70, _screen, _center },
			ResSubslate { resid_SetScriptSlate },
			endSequence{},
	} }
} };

#pragma mark -Sets
resource restype_Slate (resid_MenuSetsSubslate, "Menu Sets Subslate") { {
	Slate { "menu sets",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "move", "" },			Click { 1, -20, -105, _screen, _center },
	} }
} };

#pragma mark Functions
resource restype_Slate (resid_FunctionsListSlate, "Functions List Slate") { {
	Slate { "Functions List",	{
		_FileMakerStandards_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		Click { 1, 235, 45, _screen, _center },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "View", "" },			Click { 1, 150, -250, _screen, _center },
		Event { "parameters", "" },		Click { 1, -365, -155, _screen, _center },
		Event { "functions", "" },		Sequence{},
			Click { 0, -25, -220, _screen, _center },
			ResSubslate { resid_CalcItems },
			endSequence{},
		Event { "new", "" },			Sequence {},
			Click { 1, -230, 45, _screen, _center },
			ResSubslate { resid_FunctionsEditSlate },
			endSequence{},
		Event { "edit", "" },			Sequence {},
			Click { 1, -145, 45, _screen, _center },
			ResSubslate { resid_FunctionsEditSlate },
			endSequence{},
		Event { "duplicate", "" },		Click { 1, -55, 45, _screen, _center },
		Event { "delete", "" },			Keypress { kc_delete, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "item one", "" },		Sequence{},
			Click { 0, -240, -155, _screen, _center },
			Click { 1, -240, -155, _screen, _center },
			endSequence{},
		Event { "item two", "" },		Sequence{},
			Click { 0, -240, -137, _screen, _center },
			Click { 1, -240, -137, _screen, _center },
			endSequence{},
		Event { "item three", "" },		Sequence{},
			Click { 0, -240, -119, _screen, _center },
			Click { 1, -240, -119, _screen, _center },
			endSequence{},
		Event { "item four", "" },		Sequence{},
			Click { 0, -240, -101, _screen, _center },
			Click { 1, -240, -101, _screen, _center },
			endSequence{},
		Event { "item five", "" },		Sequence{},
			Click { 0, -240, -83, _screen, _center },
			Click { 1, -240, -83, _screen, _center },
			endSequence{},
		Event { "item six", "" },		Sequence{},
			Click { 0, -240, -65, _screen, _center },
			Click { 1, -240, -65, _screen, _center },
			endSequence{},
		Event { "item seven", "" },		Sequence{},
			Click { 0, -240, -47, _screen, _center },
			Click { 1, -240, -47, _screen, _center },
			endSequence{},
		Event { "item eight", "" },		Sequence{},
			Click { 0, -240, -29, _screen, _center },
			Click { 1, -240, -29, _screen, _center },
			endSequence{},
		Event { "item nine", "" },		Sequence{},
			Click { 0, -240, -11, _screen, _center },
			Click { 1, -240, -11, _screen, _center },
			endSequence{},
		Event { "item ten", "" },		Sequence{},
			Click { 0, -240, 7, _screen, _center },
			Click { 1, -240, 7, _screen, _center },
			endSequence{},
	} }
} };

#pragma mark -FunctionEdit
resource restype_Slate (resid_FunctionsEditSlate, "Functions Edit Slate") { {
	Slate { "fnEdit",	{
		_FileMakerStandards_,
		ExitEvent { "okay", "" },		Keypress { kc_enter, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page home", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
	} }
} };

#pragma mark FileMaker
resource restype_Slate (resid_FileMaker, "FileMaker Slate") { {
	Slate { "FileMaker",	{
		_FileMakerStandards_,
		_LaunchSlate_,
		_SlatesSlate_,
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "View", "" },		Click { 1, 325, 10, _screen, _topLeft },
			ExitEvent { "Layouts", "" },	Click { 1, 535, 10, _screen, _topLeft },
			ExitEvent { "Window", "" },		Sequence{},
				Keypress { kc_fn2, mf_control },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_down, 0 },
				endSequence{},
			Event { "Tools", "" },		Sequence{},
				Keypress { kc_fn2, mf_control },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "Scripts", "" },	Sequence{},
				Keypress { kc_fn2, mf_control },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_left, 0 },
				Keypress { kc_down, 0 },
				endSequence{},
			endSubslate{},
		Event { "Define Fields", "" },	ResSubslate { resid_DefineFieldsSlate },
		Event { "Custom Menus", "" },	ResSubslate { resid_CustomMenusSlate },
		Event { "Script List", "" },	ResSubslate { resid_ScriptListSlate },
		Event { "Script Editor", "" },	ResSubslate { resid_ScriptEditSlate },
		Event { "Functions List", "" },	ResSubslate { resid_FunctionsListSlate },
		Event { "Functions Editor", "" }, ResSubslate { resid_FunctionsEditSlate },

		Event { "Developer", "" },	Subslate { "Dev" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Debug", "", },			ResSubslate { resid_DebugSlate },
			Event { "Debug Windows", "", },	Sequence{},
				_OpenScriptsMenu_, TypeText { "FileMaker" }, Keypress { kc_right, 0 },
				TypeText { "Debug" }, Keypress { kc_return, 0 },
				endSequence{},
			Event { "Design Report", "", },	Sequence{},
				_OpenScriptsMenu_, TypeText { "FileMaker" }, Keypress { kc_right, 0 },
				TypeText { "DesignReport" }, Keypress { kc_return, 0 },
				ResSubslate { resid_DesignReportSlate },
				endSequence{},
			Event { "Database", "" },		Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "Database" }, Keypress { kc_return, 0 },
				ResSubslate { resid_DefineFieldsSlate },
				endSequence{},
			Event { "Accounts", "" },		Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "Accounts" }, Keypress { kc_return, 0 },
				endSequence{},
			Event { "Value Lists", "" },	Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "Value Lists" }, Keypress { kc_return, 0 },
				endSequence{},
			Event { "Script Editor", "" },		Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "Scripts" }, Keypress { kc_return, 0 },
				ResSubslate { resid_ScriptListSlate },
				endSequence{},
			Event { "External", "" },		Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "External" }, Keypress { kc_return, 0 },
				ResSubslate { resid_ExternalsSlate },
				endSequence{},
			Event { "Functions", "" },		Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "Custom Functions" }, Keypress { kc_return, 0 },
				ResSubslate { resid_FunctionsListSlate },
				endSequence{},
			Event { "Menus", "" },			Sequence{},
				Click { 1, 260, 10, _screen, _topLeft }, TypeText { "Manage" },	Keypress { kc_right, 0 },
				TypeText { "Custom Menus" }, Keypress { kc_return, 0 },
				ResSubslate { resid_CustomMenusSlate },
				endSequence{},
			endSubslate{},
		Event { "Record", "" },			ResSubslate { resid_RecordSlate },
		Event { "Portal", "" },			ResSubslate { resid_PortalSlate },
		Event { "File", "" },			ResSubslate { resid_FileSlate },
		Event { "View", "" },			ResSubslate { resid_ViewSlate },
		Event { "Palette", "" },		Sequence{},
			KeyDelay { kc_T, mf_command + mf_shift + mf_option,	10 },
			ResSubslate { resid_PaletteSlate },
			endSequence{},
		Event { "Sort", "" },			ResSubslate { resid_SortSlate },
		Event { "Layout", "" },			Sequence{},
			KeyDelay { kc_B, mf_command + mf_shift + mf_option,	10 },
			Keypress { kc_L, mf_command },
			ResSubslate { resid_LayoutSlate },
			endSequence{},
	 } }
} };

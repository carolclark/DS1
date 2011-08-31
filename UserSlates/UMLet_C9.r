// =================================================================================
//	UMLet_C9.r			©2006-08 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

//#define resid_LaunchUMLet				resid_UMLet+1		defined in CommonSlates_C9.h
//#define resid_UMLetSubslate			resid_UMLet+2
#define resid_TypeUMLetSlate			resid_UMLet+3
#define resid_TypeSpecialUMLetSlate		resid_UMLet+4
#define resid_IMouseUMLetSlate			resid_UMLet+5

#define	resid_FileMenu					resid_UMLet+10

#define	resid_EditMenu					resid_UMLet+20

#define	resid_PaletteMenu				resid_UMLet+30

#define	resid_FileOpenWindow			resid_UMLet+40
	#define	resid_FileSaveWindow			resid_FileOpenWindow+1

#define palette_left_	880

#pragma mark resid_LaunchUMLet
// dock is activated when this Slate is called
resource restype_Slate (resid_LaunchUMLet, "Launch UMLet Slate") { {
	Slate { "UMLet",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "focus",	"move focus to the dock" },
			Keypress { kc_fn3, mf_control },
		Event { "next group", "move focus to the next table or group of controls" },
			Keypress { kc_tab, mf_control },
		Event { "previous group", "move focus to the previous table or group of controls" },
			Keypress { kc_tab, mf_control + mf_shift },
		Event { "show",	"show or hide the dock window" },
			Keypress { kc_D, mf_command + mf_option },
		Event { "hide",	"show or hide the dock window" },
			Keypress { kc_D, mf_command + mf_option },
		Event { "tab back",	"shift-tab" },
			Keypress { kc_tab, mf_shift },
		_DirectionKeys_,
		_TabKey_,
		Event { "tab back",	"shift-tab" },
			Keypress { kc_tab, mf_shift },
		ExitEvent { "cancel", "cancel dock selection" },
			Keypress { kc_escape, 0 },
		Event { "select", "select the highlighted control" },	Sequence{},
			SwitchSlate { resid_UMLet },
			KeyDelay { kc_space, 0, 10 },
		endSequence{},
		Event { "open", "launch new UMLet process" },
			Launch { Apps_"UMLet/UMLet.jar", resid_UMLet },
	} }
} };

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialUMLetSlate, "Type Special UMLet Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "document header",	"" },	Sequence{},
			TypeText { "// " },
			Keypress { kc_return, 0 },
			TypeText { "fontsize=13" },
			Keypress { kc_return, 0 },
			Keypress { kc_up, 0 }, Keypress { kc_left, 0 },
			endSequence{},
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeUMLetSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialUMLetSlate },
	} }
} };

#pragma mark _TypeUMLetSlate_
#define _TypeUMLetSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeUMLetSlate }

#pragma mark IMouse
#define _stepSize	10
resource restype_Slate (resid_IMouseUMLetSlate, "") { {
	Slate { "IMouse",	{
		Event { "home", "" },			Click { 0, 43, 105, _screen, _topLeft },
		Event { "twenty", "set step size" }, IMouse { im_StepSize, 20 * _stepSize },
		_IMouseItems_
	} }
} };

// palette_left_: 885
#pragma mark Palette
resource restype_Slate (resid_PaletteMenu, "") { {
	Slate { "Palette",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "entity", "" },			Click { 2, palette_left_ + 60, 120, _screen, _topLeft },
		ExitEvent { "line", "" },			Click { 2, palette_left_ + 55, 150, _screen, _topLeft },
		ExitEvent { "interface", "" },		Click { 2, palette_left_ + 155, 120, _screen, _topLeft },
		ExitEvent { "text", "" },			Click { 2, palette_left_ + 225, 100, _screen, _topLeft },
		ExitEvent { "relation", "" },		Click { 2, palette_left_ + 235, 155, _screen, _topLeft },
		ExitEvent { "note", "" },			Click { 2, palette_left_ + 75, 220, _screen, _topLeft },
		ExitEvent { "package", "" },		Click { 2, palette_left_ + 195, 220, _screen, _topLeft },
		ExitEvent { "line", "" },			Click { 2, palette_left_ + 55, 160, _screen, _topLeft },
		ExitEvent { "vertical bar", "" },	Click { 2, palette_left_ + 27, 310, _screen, _topLeft },
		ExitEvent { "horizontal bar", "" },	Click { 2, palette_left_ + 75, 287, _screen, _topLeft },
		ExitEvent { "state", "" },			Click { 2, palette_left_ + 85, 325, _screen, _topLeft },
		ExitEvent { "decision", "" },		Click { 2, palette_left_ + 155, 320, _screen, _topLeft },
		ExitEvent { "send", "" },			Click { 2, palette_left_ + 235, 290, _screen, _topLeft },
		ExitEvent { "receive", "" },		Click { 2, palette_left_ + 235, 330, _screen, _topLeft },
		ExitEvent { "time signal", "" },	Click { 2, palette_left_ + 235, 380, _screen, _topLeft },
		ExitEvent { "initial", "" },		Click { 2, palette_left_ + 70, 360, _screen, _topLeft },
		ExitEvent { "final", "" },			Click { 2, palette_left_ + 85, 360, _screen, _topLeft },
		ExitEvent { "deletion", "" },		Click { 2, palette_left_ + 175, 360, _screen, _topLeft },
		ExitEvent { "interaction", "" },	Click { 2, palette_left_ + 85, 410, _screen, _topLeft },
		ExitEvent { "activation", "" },		Click { 2, palette_left_ + 170, 395, _screen, _topLeft },
		ExitEvent { "component", "" },		Click { 2, palette_left_ + 355, 305, _screen, _topLeft },
		ExitEvent { "database", "" },		Click { 2, palette_left_ + 355, 385, _screen, _topLeft },
		ExitEvent { "artifact", "" },		Click { 2, palette_left_ + 355, 430, _screen, _topLeft },
		ExitEvent { "node", "" },			Click { 2, palette_left_ + 355, 480, _screen, _topLeft },
		ExitEvent { "system", "" },			Click { 2, palette_left_ + 35, 485, _screen, _topLeft },
	} }
} };

#pragma mark FileMenu
resource restype_Slate (resid_FileMenu, "") { {
	Slate { "File",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "new", "" },		Keypress { kc_N, mf_command },
		Event { "open", "" },			Sequence{}, ResSubslate { resid_FileOpenWindow }, Keypress { kc_O, mf_command }, endSequence{},
		Event { "save", "" },			Keypress { kc_S, mf_command },
		Event { "save jpeg", "" },		Sequence{},
			ResSubslate { resid_FileSaveWindow }, Click { 1, 30, 60, _screen, _topLeft }, _down, _down, _down, _down, _down, 
			endSequence{},
		Event { "save as", "" },		Sequence{},
			ResSubslate { resid_FileSaveWindow }, Click { 1, 30, 60, _screen, _topLeft }, _down, _down, _down, _down, 
			endSequence{},
	} }
} };

#pragma mark EditMenu
resource restype_Slate (resid_EditMenu, "") { {
	Slate { "Edit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "undo", "" },			Keypress { kc_Z, mf_command },
		Event { "redo", "" },			Keypress { kc_Y, mf_command },
		ExitEvent { "delete", "" },		Keypress { kc_fdelete, 0 },
		ExitEvent { "group", "" },		Keypress { kc_G, mf_command },
		ExitEvent { "ungroup", "" },	Keypress { kc_U, mf_command },
		ExitEvent { "find", "" },		Keypress { kc_slash, 0 },
		ExitEvent { "copy", "" },		Keypress { kc_C, mf_command },
	} }
} };

#pragma mark FileOpenWindow
resource restype_Slate (resid_FileOpenWindow, "") { {
	Slate { "FileOpen",	{
		_SlateGlobals_,
		_TypeUMLetSlate_,
		_CommandSlate_,
		_ReturnKey_,
		_DirectionKeys_,
		_PageUpKey_,
		_PageDownKey_,
		_HomeKey_,
		_EndKey_,
		ExitEvent { "open", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Click { 1, 775, 650, _screen, _topLeft },
		ExitEvent { "exit", "" },		CloseSubslate{},
		Event { "path", "" },			Click { 1, 630, 310, _screen, _topLeft },
		Event { "select", "" },			Keypress { kc_return, 0 },
		Event { "row one", "" },		Click { 2, 416, 354, _screen, _topLeft },
		Event { "row two", "" },		Click { 2, 416, 370, _screen, _topLeft },
		Event { "row three", "" },		Click { 2, 416, 386, _screen, _topLeft },
		Event { "row four", "" },		Click { 2, 416, 402, _screen, _topLeft },
		Event { "row five", "" },		Click { 2, 416, 418, _screen, _topLeft },
		Event { "row six", "" },		Click { 2, 416, 434, _screen, _topLeft },
		Event { "row seven", "" },		Click { 2, 416, 450, _screen, _topLeft },
		Event { "row eight", "" },		Click { 2, 416, 466, _screen, _topLeft },
		Event { "row nine", "" },		Click { 2, 416, 482, _screen, _topLeft },
		Event { "row ten", "" },		Click { 2, 416, 498, _screen, _topLeft },
		Event { "row eleven", "" },		Click { 2, 416, 514, _screen, _topLeft },
		Event { "row twelve", "" },		Click { 2, 416, 530, _screen, _topLeft },
		Event { "row thirteen", "" },	Click { 2, 416, 546, _screen, _topLeft },
		Event { "row fourteen", "" },	Click { 2, 416, 562, _screen, _topLeft },
	} }
} };

#pragma mark FileSaveWindow
resource restype_Slate (resid_FileSaveWindow, "") { {
	Slate { "FileSave",	{
		_SlateGlobals_,
		_TypeUMLetSlate_,
		_CommandSlate_,
		_ReturnKey_,
		_DirectionKeys_,
		_PageUpKey_,
		_PageDownKey_,
		_HomeKey_,
		_EndKey_,
		ExitEvent { "save", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Click { 1, 775, 650, _screen, _topLeft },
		ExitEvent { "exit", "" },		CloseSubslate{},
		Event { "select", "" },			Keypress { kc_return, 0 },
		Event { "popup", "" },			Click { 1, 610, 350, _screen, _topLeft },
		Event { "row one", "" },		Click { 2, 416, 402, _screen, _topLeft },
		Event { "row two", "" },		Click { 2, 416, 418, _screen, _topLeft },
		Event { "row three", "" },		Click { 2, 416, 434, _screen, _topLeft },
		Event { "row four", "" },		Click { 2, 416, 450, _screen, _topLeft },
		Event { "row five", "" },		Click { 2, 416, 466, _screen, _topLeft },
		Event { "row six", "" },		Click { 2, 416, 482, _screen, _topLeft },
		Event { "row seven", "" },		Click { 2, 416, 498, _screen, _topLeft },
		Event { "row eight", "" },		Click { 2, 416, 514, _screen, _topLeft },
		Event { "row nine", "" },		Click { 2, 416, 530, _screen, _topLeft },
		Event { "row ten", "" },		Click { 2, 416, 546, _screen, _topLeft },
		Event { "row eleven", "" },		Click { 2, 416, 562, _screen, _topLeft },
	} }
} };

#pragma mark UMLet

#define _UMLetSlateItems_		\
		_SlateGlobals_,                                                                            \
		_CommandSlate_,                                                                            \
		Event { "click one", "" },	IMouse { im_Click, 1 },                                         \
		Event { "click two", "" },	IMouse { im_Click, 2 },                                         \
		_DockWindowSlate_,                                                                         \
		_DirectionKeys_,                                                                           \
		_WhitespaceKeys_,                                                                          \
		_TypeUMLetSlate_,                                                                          \
		Event { "mouse", "" },			ResSubslate { resid_IMouseUMLetSlate },                     \
		Event { "properties", "" },		Click { 1, palette_left_ + 15, 673, _screen, _topLeft },      \
		Event { "filename", "" },		Click { 2, palette_left_ + 40, 680, _screen, _topLeft },        \
		Event { "Palette", "" },		ResSubslate { resid_PaletteMenu },                               \
		Event { "File", "" },			ResSubslate { resid_FileMenu },                                    \
		Event { "Edit", "" },			ResSubslate { resid_EditMenu },                                    \
		Event { "Help", "" },			Click { 1, 30, 120, _screen, _topLeft }

resource restype_Slate (resid_UMLetSubslate, "UMLet Subslate") { {
	Slate { "UMLet",	{
		_UMLetSlateItems_,
		ExitEvent { "okay", "" },		Launch { DevApps_"XCode.app", 0 },
		ExitEvent { "exit", "" },		CloseSubslate{},
	 } }
} };

resource restype_Slate (resid_UMLet, "UMLet Slate") { {
	Slate { "UMLet",	{
		_LaunchSlate_,
		Event { "fix window", "" },		Sequence{},
			Click { 0, 1140, 770, _screen, _topLeft },		/* larger window size */
			Click { -1, 1320, 885, _screen, _topLeft },
			Click { 0, 963, 480, _screen, _topLeft },		/* enlarge palette panel */
			Click { -1, palette_left_, 480, _screen, _topLeft },
			Click { 0, 1076, 590, _screen, _topLeft },
			Click { -1, 1076, 626, _screen, _topLeft },
			endSequence{},
		_UMLetSlateItems_,
	 } }
} };

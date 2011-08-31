// =================================================================================
//	Automator_C9.r					©2010 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeAutomatorSlate			resid_Automator+1
#define resid_TypeSpecialAutomatorSlate		resid_Automator+2

#define	resid_ActionSlate					resid_Automator+500
	#define	resid_AppleScript					resid_Automator+550
	#define	resid_AskForText					resid_Automator+560
	#define	resid_EmptyView						resid_Automator+600
	#define	resid_GetSpecifiedText				resid_Automator+640
	#define	resid_Workflow						resid_Automator+700
	#define	resid_XcodeInputArray						resid_Automator+800

#define _wfleft	361
#define _wftop	100
#define _wfrsp	40

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialAutomatorSlate, "Type Special Automator Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },	TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeAutomatorSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "next panel", "" },		Keypress { kc_tab, mf_control },
		Event { "previous panel", "" },	Keypress { kc_tab, mf_control + mf_shift },
		Event { "Special", "type predefined text shortcuts" },	ResSubslate { resid_TypeSpecialAutomatorSlate },
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		_TypeSlateItems_,
	} }
} };

#pragma mark _TypeAutomatorSlate_
#define _TypeAutomatorSlate_ 		\
	Event { "Type", "simulate keypresses" },	ResSubslate { resid_TypeAutomatorSlate }

#pragma mark Action
resource restype_Slate (resid_ActionSlate, "") { {
	Slate { "Action",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "AppleScript", "" },		ResSubslate { resid_AppleScript },
		ExitEvent { "Ask For Text", "" },		ResSubslate { resid_AskForText },
		ExitEvent { "Empty View", "" },			ResSubslate { resid_EmptyView },
		ExitEvent { "Get Specified Text", "" },	ResSubslate { resid_GetSpecifiedText },
		ExitEvent { "Workflow", "" },			ResSubslate { resid_Workflow },
		ExitEvent { "XcodeInputArray", "" },	ResSubslate { resid_XcodeInputArray },
		Event { "disclose", "" },				Click { 1, 0, 0, _cursor },
		Event { "row one", "" },				Click { 0, _wfleft, _wftop+0*_wfrsp, _window, _topLeft },
		Event { "row two", "" },				Click { 0, _wfleft, _wftop+1*_wfrsp, _window, _topLeft },
		Event { "row three", "" },				Click { 0, _wfleft, _wftop+2*_wfrsp, _window, _topLeft },
		Event { "row four", "" },				Click { 0, _wfleft, _wftop+3*_wfrsp, _window, _topLeft },
		Event { "row five", "" },				Click { 0, _wfleft, _wftop+4*_wfrsp, _window, _topLeft },
		Event { "row six", "" },				Click { 0, _wfleft, _wftop+5*_wfrsp, _window, _topLeft },
		Event { "row seven", "" },				Click { 0, _wfleft, _wftop+6*_wfrsp, _window, _topLeft },
		Event { "row eight", "" },				Click { 0, _wfleft, _wftop+7*_wfrsp, _window, _topLeft },
		Event { "row nine", "" },				Click { 0, _wfleft, _wftop+8*_wfrsp, _window, _topLeft },
		Event { "row ten", "" },				Click { 0, _wfleft, _wftop+9*_wfrsp, _window, _topLeft },
		Event { "row eleven", "" },				Click { 0, _wfleft, _wftop+10*_wfrsp, _window, _topLeft },
		Event { "row twelve", "" },				Click { 0, _wfleft, _wftop+11*_wfrsp, _window, _topLeft },
		Event { "row thirteen", "" },			Click { 0, _wfleft, _wftop+12*_wfrsp, _window, _topLeft },
		Event { "row fourteen", "" },			Click { 0, _wfleft, _wftop+13*_wfrsp, _window, _topLeft },
		Event { "row fifteen", "" },			Click { 0, _wfleft, _wftop+14*_wfrsp, _window, _topLeft },
		Event { "row sixteen", "" },			Click { 0, _wfleft, _wftop+15*_wfrsp, _window, _topLeft },
		Event { "row seventeen", "" },			Click { 0, _wfleft, _wftop+16*_wfrsp, _window, _topLeft },
		Event { "row eighteen", "" },			Click { 0, _wfleft, _wftop+17*_wfrsp, _window, _topLeft },
		Event { "row nineteen", "" },			Click { 0, _wfleft, _wftop+18*_wfrsp, _window, _topLeft },
		Event { "row twenty", "" },				Click { 0, _wfleft, _wftop+19*_wfrsp, _window, _topLeft },

	} }
} };

#define _ActionStandards_		\
	_SlateGlobals_,                                                                           \
	_CloseSubslate_,                                                                         \
	_IMouseSlate_,                                                                           \
	_CommandSlate_,                                                                          \
	_TypeAutomatorSlate_,                                                                    \
	Event { "disclose", "" },			Click { 1, 0, 0, _cursor },							\
	Event { "results", "" },			Click { 1, 40, _split+12, _cursor },                          \
	Event { "options", "" },			Click { 1, 100, _split+12, _cursor },                         \
	Event { "description", "" },		Click { 1, 160, _split+12, _cursor },                      \
	Event { "icons", "" },				Click { 1, 10, _split+20, _cursor },                           \
	Event { "list", "" },				Click { 1, 35, _split+20, _cursor },                            \
	Event { "text", "" },				Click { 1, 60, _split+20, _cursor },                            \
	Event { "show when run", "" },		Click { 1, 1, _split+20, _cursor },                      \
	Event { "show selected only", "" },	Click { 1, 21, _split+68, _cursor },                 \
	Event { "tab ahead", "" },			Keypress { kc_tab, 0 },                                     \
	Event { "tab back", "" },			Keypress { kc_tab, mf_shift },                               \
	Event { "space", "" },				Keypress { kc_space, 0 },                                      \
	Event { "show log", "" },			Keypress { kc_L, mf_command + mf_option },                   \
	Event { "show variables", "" },		Click { 1, _wfleft+10, -10, _window, _bottomLeft },

#pragma mark AppleScript
#define	_split	259
resource restype_Slate (resid_AppleScript, "") { {
	Slate { "AppleScript",	{
		_ActionStandards_,
		Event { "script", "" },				Click { 1, 4, 66, _cursor },
	} }
} };

#pragma mark AskForText
#define	_split	128
resource restype_Slate (resid_AskForText, "") { {
	Slate { "AskForText",	{
		_ActionStandards_,
		Event { "require", "" },		Click { 1, 3, 81, _cursor },
		Event { "cancel button", "" },	Click { 1, 105, -165, _cursor },
		Event { "okay button", "" },	Click { 1, 105, -65, _cursor },
	} }
} };

#pragma mark EmptyView
#define	_split	14
resource restype_Slate (resid_EmptyView, "") { {
	Slate { "Empty View",	{
		_ActionStandards_,
		Event { "nothing", "" },	NilAction{},
	} }
} };

#pragma mark GetSpecifiedText
#define	_split	114
resource restype_Slate (resid_GetSpecifiedText, "") { {
	Slate { "GetSpecifiedText",	{
		_ActionStandards_,
		Event { "nothing", "" },	NilAction{},
	} }
} };

#pragma mark Workflow
#define	_split	94
resource restype_Slate (resid_Workflow, "") { {
	Slate { "Workflow",	{
		_ActionStandards_,
		Event { "workflow", "" },			Click { 1, 87, 30, _cursor },
		Event { "open", "" },				Click { 1, 300, 30, _cursor },
		Event { "wait", "" },				Click { 1, 112, 50, _cursor },
		Event { "return", "" },				Click { 1, 112, 76, _cursor },
	} }
} };

#pragma mark XcodeInputArray
#define	_split	100
resource restype_Slate (resid_XcodeInputArray, "") { {
	Slate { "Xcode Input Array",	{
		_ActionStandards_,
		Event { "nothing", "" },	NilAction{},
	} }
} };

#pragma mark Automator
resource restype_Slate (resid_Automator, "Automator Slate") { {
	Slate { "Automator",	{
		Event { "go back", "" },		Launch { DevApps_"Xcode.app", resid_Xcode },
		Event { "quit back", "" },		Sequence{}, Keypress { kc_Q, mf_command }, Launch { DevApps_"Xcode.app", resid_Xcode }, endSequence{},
		_SlateGlobals_,
		_DefaultBase_,
		_TypeAutomatorSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		Event { "open existing", "" },	Click { 1, -200, 455, _window, _topCenter },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "library", "" },		Click { 1, 40, 40, _window, _topLeft },
		Event { "media", "" },			Click { 1, 95, 40, _window, _topLeft },
		Event { "action list", "" },	Click { 1, 40, 92, _window, _topLeft },
		Event { "variable list", "" },	Click { 1, 120, 92, _window, _topLeft },
		Event { "search", "" },			Click { 1, 200, 92, _window, _topLeft },
		Event { "clear search", "" },	Click { 1, 320, 92, _window, _topLeft },
		Event { "categories", "" },		Click { 1, 50, 115, _window, _topLeft },
		Event { "workflow", "" },		Click { 1, -280, 100, _window, _topRight },
		Event { "fix window", "" },		Sequence{},
			Click { 0, 85, 10, window, "1", _topLeft },
			Click { -1, 280, 10, _screen, _topLeft },
			endSequence{},
		Event { "Action", "" },			ResSubslate { resid_ActionSlate },
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "Automator" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
	} }
} };

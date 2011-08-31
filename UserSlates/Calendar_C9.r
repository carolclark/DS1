// =================================================================================
//	Calendar.r					©2005-11 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeCalendarSlate			resid_Calendar+1
#define resid_TypeSpecialCalendarSlate	resid_Calendar+2
#define resid_Browser					resid_Calendar+3
#define resid_CalendarPanelSlate		resid_Calendar+4
#define resid_SortTodosSlate			resid_Calendar+5

#define resid_EditEventSlate			resid_Calendar+50
	#define resid_EventPriority				resid_EditEventSlate+1

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialCalendarSlate, "Type Special Calendar Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "link prefix,",	"prefix for inhouse link to link Events" },
			TypeText { "file:///Users/carolclark/CCDev/Sites/TehnicalDocs/" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeCalendarSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialCalendarSlate },
	} }
} };

#pragma mark _TypeCalendarSlate_
#define _TypeCalendarSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeCalendarSlate }

#pragma mark resid_EditEventSlate
resource restype_Slate (resid_EditEventSlate, "Edit Event Slate") { {
	Slate { "Event",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_IMouseSlate_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "close", "" },		Click { 1, -60, -37, _window, _bottomRight },
		Event { "type", "" },			ResSubslate { resid_TypeCalendarSlate },
		Event { "completed", "" },		Click { 1, 100, 74, _window, _topLeft },
		Event { "priority", "" },		Sequence{},
			Click { 1, 107, 102, _window, _topLeft }, ResSubslate { resid_EventPriority }, endSequence{},
		Event { "calendar", "" },		Click { 1, 120, 174, _window, _topLeft },
		Event { "set link", "" },		Click { 1, 90, 200, _window, _topLeft },
		Event { "set note", "" },		Click { 1, 90, 214, _window, _topLeft },
		Event { "link", "" },			Sequence{}, Click { 1, 90, 200, _window, _topLeft },
			Keypress { kc_A, mf_command }, Keypress { kc_C, mf_command },
			Launch { Apps_"Safari.app", 0 }, Wait { 10 }, Click { 1, 0, 35, _window, _topCenter },
			Keypress { kc_A, mf_command }, Keypress { kc_V, mf_command }, _return, endSequence{},
		Event { "browser", "" },		Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},
	} }
} };

#pragma mark resid_EventPriority
resource restype_Slate (resid_EventPriority, "Event Priority") { {
	Slate { "Priority",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_IMouseSlate_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "okay", "" },		_return,
		ExitEvent { "none", "" },		Sequence{}, TypeText { "None" }, _return, endSequence{},
		ExitEvent { "low", "" },		Sequence{}, TypeText { "Low" }, _return, endSequence{},
		ExitEvent { "medium", "" },		Sequence{}, TypeText { "Medium" }, _return, endSequence{},
		ExitEvent { "high", "" },		Sequence{}, TypeText { "High" }, _return, endSequence{},
	} }
} };

#pragma mark Browser
#define	_BrowseCdocResID_	resid_Browser
#define _mainFrame_h		0
#define _mainFrame_v		75
#define _homeApp			Apps_"iCal.app"
_BrowseCdocSlate_

#pragma mark resid_CalendarPanelSlate
resource restype_Slate (resid_CalendarPanelSlate, "Panel Slate") { {
	Slate { "Panel",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Calendar", "click in Calendar panel" }, Click { 1, 20, 70, _window, _topLeft },
		ExitEvent { "to do", "click in ToDo panel" }, Click { 1, -125, 80, _window, _topRight },
	} }
} };

#pragma mark resid_SortTodosSlate
resource restype_Slate (resid_SortTodosSlate, "Sort Slate") { {
	Slate { "Sort",	{
		_SlateGlobals_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		ExitEvent { "okay", "" },			Keypress { kc_escape, 0 },
		ExitEvent { "by Due Date", "" },	Sequence{}, TypeText { "Sort by Due Date" }, _return, endSequence{},
		ExitEvent { "by Priority", "" },	Sequence{}, TypeText { "Sort by Priority" }, _return, endSequence{},
		ExitEvent { "by Calendar", "" },	Sequence{}, TypeText { "Sort by Calendar" }, _return, endSequence{},
	} }
} };

#pragma mark Calendar
resource restype_Slate (resid_Calendar, "Calendar Slate") { {
	Slate { "Calendar",	{
		_SlateGlobals_,
		_DefaultBase_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_TypeCalendarSlate_,
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "'iCal' menu" }, ClickMenu { "iCal" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Calendar", "'Calendar' menu" }, ClickMenu { "Calendar" },
			ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
		Event { "Panel", "" },		ResSubslate { resid_CalendarPanelSlate },
		Event { "Sort", "" },		Sequence{},
			Click { 1, -40, 60, _window, _topRight }, 
			ResSubslate { resid_SortTodosSlate },
			endSequence{},
		Event { "Event", "edit an event" },		Sequence{},
			Keypress { kc_E, mf_command },
			ResSubslate { resid_EditEventSlate },
			endSequence{},
	 } }
} };


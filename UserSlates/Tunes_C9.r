// =================================================================================
//	Tunes.r						©2005-07 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeTunesSlate			resid_Tunes+1
#define resid_TypeSpecialTunesSlate		resid_Tunes+2
#define resid_TunesSourceSlate			resid_Tunes+3
#define resid_TunesTunesSlate			resid_Tunes+4

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialTunesSlate, "Type Special Tunes Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeTunesSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialTunesSlate },
	} }
} };

#pragma mark _TypeTunesSlate_
#define _TypeTunesSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeTunesSlate }

#pragma mark Source Panel
resource restype_Slate (resid_TunesSourceSlate, "Source Slate") { {
	Slate { "Source",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Disclose", "" },		Click { 0, 8, 83, window, "1", _topLeft },
		Event { "Name", "" },			Click { 0, 90, 83, window, "1", _topLeft },
		ExitEvent { "item one",	"" },		Click { 1, 0, 18, _cursor },
		ExitEvent { "item two",	"" },		Click { 1, 0, 36, _cursor },
		ExitEvent { "item three",	"" },	Click { 1, 0, 54, _cursor },
		ExitEvent { "item four", "" },		Click { 1, 0, 72, _cursor },
		ExitEvent { "item five", "" },		Click { 1, 0, 90, _cursor },
		ExitEvent { "item six", "" },		Click { 1, 0, 108, _cursor },
		ExitEvent { "item seven", "" },		Click { 1, 0, 126, _cursor },
		ExitEvent { "item eight", "" },		Click { 1, 0, 144, _cursor },
		ExitEvent { "item nine", "" },		Click { 1, 0, 162, _cursor },
		ExitEvent { "item ten", "" },		Click { 1, 0, 180, _cursor },
		ExitEvent { "item eleven", "" },	Click { 1, 0, 198, _cursor },
		ExitEvent { "item twelve", "" },	Click { 1, 0, 216, _cursor },
		ExitEvent { "item thirteen", "" },	Click { 1, 0, 234, _cursor },
		ExitEvent { "item fourteen", "" },	Click { 1, 0, 252, _cursor },
		ExitEvent { "item fifteen", "" },	Click { 1, 0, 270, _cursor },
		ExitEvent { "item sixteen", "" },	Click { 1, 0, 288, _cursor },
		ExitEvent { "item seventeen", "" },	Click { 1, 0, 306, _cursor },
		ExitEvent { "item eighteen", "" },	Click { 1, 0, 324, _cursor },
		ExitEvent { "item nineteen", "" },	Click { 1, 0, 342, _cursor },
		ExitEvent { "item twenty", "" },	Click { 1, 0, 360, _cursor },
		ExitEvent { "item twenty one", "" },	Click { 1, 0, 378, _cursor },
		ExitEvent { "item twenty two", "" },	Click { 1, 0, 396, _cursor },
		ExitEvent { "item twenty three", "" },	Click { 1, 0, 414, _cursor },
		ExitEvent { "item twenty four", "" },	Click { 1, 0, 432, _cursor },
	} }
} };

#pragma mark Tunes Panel
resource restype_Slate (resid_TunesTunesSlate, "Tunes Slate") { {
	Slate { "Tunes",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Checkbox", "" },	Click { 0, 342, 83, window, "1", _topLeft },
		Event { "Name", "" },		Click { 0, 374, 83, window, "1", _topLeft },
		Event { "Download", "" },	Click { 0, -27, 83, window, "1", _topRight },
		ExitEvent { "item one",	"" },		Click { 1, 0, 17, _cursor },
		ExitEvent { "item two",	"" },		Click { 1, 0, 34, _cursor },
		ExitEvent { "item three",	"" },	Click { 1, 0, 51, _cursor },
		ExitEvent { "item four", "" },		Click { 1, 0, 68, _cursor },
		ExitEvent { "item five", "" },		Click { 1, 0, 85, _cursor },
		ExitEvent { "item six", "" },		Click { 1, 0, 102, _cursor },
		ExitEvent { "item seven", "" },		Click { 1, 0, 119, _cursor },
		ExitEvent { "item eight", "" },		Click { 1, 0, 136, _cursor },
		ExitEvent { "item nine", "" },		Click { 1, 0, 153, _cursor },
		ExitEvent { "item ten", "" },		Click { 1, 0, 170, _cursor },
		ExitEvent { "item eleven", "" },	Click { 1, 0, 187, _cursor },
		ExitEvent { "item twelve", "" },	Click { 1, 0, 204, _cursor },
		ExitEvent { "item thirteen", "" },	Click { 1, 0, 221, _cursor },
		ExitEvent { "item fourteen", "" },	Click { 1, 0, 238, _cursor },
		ExitEvent { "item fifteen", "" },	Click { 1, 0, 255, _cursor },
		ExitEvent { "item sixteen", "" },	Click { 1, 0, 272, _cursor },
		ExitEvent { "item seventeen", "" },	Click { 1, 0, 289, _cursor },
		ExitEvent { "item eighteen", "" },	Click { 1, 0, 306, _cursor },
		ExitEvent { "item nineteen", "" },	Click { 1, 0, 323, _cursor },
		ExitEvent { "item twenty", "" },	Click { 1, 0, 340, _cursor },
		ExitEvent { "item twenty one", "" },	Click { 1, 0, 357, _cursor },
		ExitEvent { "item twenty two", "" },	Click { 1, 0, 374, _cursor },
		ExitEvent { "item twenty three", "" },	Click { 1, 0, 391, _cursor },
		ExitEvent { "item twenty four", "" },	Click { 1, 0, 408, _cursor },
		ExitEvent { "item twenty five", "" },	Click { 1, 0, 425, _cursor },
	} }
} };

#pragma mark Tunes
resource restype_Slate (resid_Tunes, "iTunes Slate") { {
	Slate { "Tunes",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeTunesSlate_,
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "'iCal' menu" }, ClickMenu { "iCal" },
			ExitEvent { "File", "'File' menu" }, ClickMenu { "File" },
			ExitEvent { "Edit", "'Edit' menu" }, ClickMenu { "Edit" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			endSubslate{},
		Event { "Press Play", "" },	Click { 0, 81, 45, window, "1", _topLeft },
		Event { "Volume", "" },		Click { 0, 191, 45, window, "1", _topLeft },
		Event { "Shuffle", "" },	Click { 0, 73, -16, window, "1", _bottomLeft },
		Event { "Visual", "" },		Click { 0, -80, -16, window, "1", _bottomRight },
		Event { "Source", "" },		ResSubslate { resid_TunesSourceSlate },
		Event { "Tunes", "" },		ResSubslate { resid_TunesTunesSlate },
	 } }
} };


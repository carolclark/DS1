// =================================================================================
//	Numbers_C9.r				©2008-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeNumbersSlate			resid_Numbers+1
#define resid_TypeSpecialNumbersSlate	resid_Numbers+2

#define resid_Formula		resid_Numbers+100
	#define resid_fmColumn		resid_Formula+1
	#define resid_fmColumnSub	resid_Formula+2
#define resid_Macro			resid_Numbers+400
#define resid_Arbonne		resid_Numbers+500

#pragma mark #define
#define _split_h		148
#define	_formula_v		100

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialNumbersSlate, "Type Special Numbers Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeNumbersSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialNumbersSlate },
	} }
} };

#pragma mark _TypeNumbersSlate_
#define _TypeNumbersSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeNumbersSlate }

#pragma mark Formula
#define _form_sp	10
resource restype_Slate (resid_Formula, "") { {
	Slate { "Formula",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeNumbersSlate_,
		Event { "click one", "" },			Click { 1, 0, 0, _cursor },
		Event { "click two", "" },			Click { 2, 0, 0, _cursor },
		Event { "click three", "" },		Click { 3, 0, 0, _cursor },
		Event { "column", "" },				ResSubslate { resid_fmColumn },
	} }
} };

#pragma mark fmColumn
resource restype_Slate (resid_fmColumn, "") { {
	Slate { "col",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "click one", "" },		Click { 1, 0, 0, _cursor },
		ExitEvent { "click two", "" },		Click { 2, 0, 0, _cursor },
		ExitEvent { "click three", "" },	Click { 3, 0, 0, _cursor },
		Event { "zero", "" },				Sequence{}, Click { 0, _split_h+_form_sp*00, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "one", "" },				Sequence{}, Click { 0, _split_h+_form_sp*10, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "two", "" },				Sequence{}, Click { 0, _split_h+_form_sp*20, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "three", "" },				Sequence{}, Click { 0, _split_h+_form_sp*30, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "four", "" },				Sequence{}, Click { 0, _split_h+_form_sp*40, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "five", "" },				Sequence{}, Click { 0, _split_h+_form_sp*50, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "six", "" },				Sequence{}, Click { 0, _split_h+_form_sp*60, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "seven", "" },				Sequence{}, Click { 0, _split_h+_form_sp*70, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "eight", "" },				Sequence{}, Click { 0, _split_h+_form_sp*80, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
		Event { "nine", "" },				Sequence{}, Click { 0, _split_h+_form_sp*90, _formula_v, _window, _topLeft }, ResSubslate { resid_fmColumnSub }, endSequence{},
	} }
} };

#pragma mark fmColumnSub
resource restype_Slate (resid_fmColumnSub, "") { {
	Slate { "sub",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "zero", "" },			Click { 0, _form_sp*0, 0, _cursor },
		ExitEvent { "one", "" },			Click { 0, _form_sp*1, 0, _cursor },
		ExitEvent { "two", "" },			Click { 0, _form_sp*2, 0, _cursor },
		ExitEvent { "three", "" },			Click { 0, _form_sp*3, 0, _cursor },
		ExitEvent { "four", "" },			Click { 0, _form_sp*4, 0, _cursor },
		ExitEvent { "five", "" },			Click { 0, _form_sp*5, 0, _cursor },
		ExitEvent { "six", "" },			Click { 0, _form_sp*6, 0, _cursor },
		ExitEvent { "seven", "" },			Click { 0, _form_sp*7, 0, _cursor },
		ExitEvent { "eight", "" },			Click { 0, _form_sp*8, 0, _cursor },
		ExitEvent { "nine", "" },			Click { 0, _form_sp*9, 0, _cursor },
	} }
} };

#pragma mark Macro
resource restype_Slate (resid_Macro, "") { {
	Slate { "Macro",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		_CommandSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoSelectSubslate_,
		Event { "copy next", "" }, 		Sequence{}, _return, Keypress { kc_V, mf_command }, Click { 1, 0, 0, _cursor }, Keypress { kc_delete, 0 }, endSequence{},
		Event { "type", "" },			_TypeNumbersSlate_,
	} }
} };

#pragma mark Arbonne
resource restype_Slate (resid_Arbonne, "") { {
	Slate { "Arbonne",	{
		_SlateGlobals_,
		_CloseSubslate_,
	} }
} };

#pragma mark Numbers
resource restype_Slate (resid_Numbers, "Numbers Slate") { {
	Slate { "Numbers",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeNumbersSlate_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "formula", "" },			Sequence{}, Click { 0, _split_h, _formula_v, _window, _topLeft }, ResSubslate { resid_Formula }, endSequence{},
		Event { "Arbonne", "" },			ResSubslate { resid_Arbonne },
		Event { "Window", "" },				ResSubslate { resid_WindowSlate },
		Event { "fix window", "" },			Sequence{},
			Click { 0, -4, -4, window, "1", _bottomRight },
			Click { -1, 0, -60, _cursor },
			endSequence{},
		Event { "page down", "" },			Keypress { kc_pagedown, 0 },
		Event { "page north", "" },			Keypress { kc_pageup, 0 },
		Event { "Macro", "" },				ResSubslate { resid_Macro },
		Event { "copy", "" },				Keypress { kc_C, mf_command },
		Event { "paste", "" },				Keypress { kc_V, mf_command },
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" },	ClickMenu { "Numbers" },
			ExitEvent { "File", "" }, 			ClickMenu { "File" },
			ExitEvent { "Edit", "" }, 			ClickMenu { "Edit" },
			ExitEvent { "Insert", "" }, 		ClickMenu { "Insert" },
			ExitEvent { "Table", "" }, 			ClickMenu { "Table" },
			ExitEvent { "Arrange", "" }, 		ClickMenu { "Arrange" },
			ExitEvent { "View", "" }, 			ClickMenu { "View" },
			ExitEvent { "Window", "" }, 		ClickMenu { "Window" },
			endSubslate{},
	 } }
} };

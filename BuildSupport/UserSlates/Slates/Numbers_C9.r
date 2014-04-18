// =================================================================================
//	Numbers_C9.r				(c)2008-12 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypeNumbersSlate			resid_Numbers+1
#define resid_TypeSpecialNumbersSlate	resid_Numbers+2

#define resid_Functions			resid_Numbers+20
	#define resid_BrowseFunctions	resid_Functions+1

#define resid_Menus				resid_Numbers+100
	#define resid_EditMenu			resid_Menus+0
	#define resid_InsertMenu		resid_Menus+1
	#define resid_TableMenu			resid_Menus+2
	#define resid_ViewMenu			resid_Menus+3

#define resid_Formula			resid_Numbers+200
	#define resid_fmColumn			resid_Formula+1
	#define resid_fmColumnSub		resid_Formula+2

#define resid_Inspector			resid_Numbers+300
#define resid_Reorganize		resid_Numbers+320

#define resid_Macro				resid_Numbers+400
#define resid_Arbonne			resid_Numbers+500

#pragma mark #define
#define _split_h		148
#define	_formula_v		100

// function browser: browse, search
#define	_fnb_top		64
#define	_fnb_h			20
#define	_fnb_rsp		14
#define _fns_h			-100
#define	_fns_v			40

#define	_insert_row		Keypress { kc_up, mf_option },
#define	_add_row		Keypress { kc_down, mf_option },
#define	_insert_column	Keypress { kc_left, mf_option },
#define	_add_column		Keypress { kc_right, mf_option },

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialNumbersSlate, "Type Special Numbers Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "false",	"" },		TypeText { "false" },
		ExitEvent { "true", "" },			TypeText { "true" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeNumbersSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" }, ResSubslate { resid_TypeSpecialNumbersSlate },
		Event { "Insert Function", "" },	Sequence{}, ClickMenu { "View" }, TypeText { "Show Function Browser" }, _return, Click { 1, -100, 40, _window, _topRight }, ResSubslate { resid_Functions }, endSequence{},
		Event { "accept", "" },				Keypress { kc_enter, 0 },
		Event { "cancel", "" },				Keypress { kc_escape, 0 },
		Event { "tab back", "" },			Keypress { kc_tab, mf_shift },
		_DoSelectSubslate_,
		Event { "colon", "" },				Keypress { kc_semicolon, mf_shift },
		Event { "formula", "" },			Click { 1, 0, 100, _window, _topCenter },
		Event { "go left", "" },			Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		_left,
			ExitEvent { "two", "" },		Sequence{}, _left, _left, endSequence{},
			ExitEvent { "three", "" },		Sequence{}, _left, _left, _left, endSequence{},
			ExitEvent { "four", "" },		Sequence{}, _left, _left, _left, _left, endSequence{},
			ExitEvent { "five", "" },		Sequence{}, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "six", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "seven", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "eight", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "nine", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "ten", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "eleven", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
			ExitEvent { "twelve", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
			endSubslate{},
		Event { "go right", "" },			Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		_right,
			ExitEvent { "two", "" },		Sequence{}, _right, _right, endSequence{},
			ExitEvent { "three", "" },		Sequence{}, _right, _right, _right, endSequence{},
			ExitEvent { "four", "" },		Sequence{}, _right, _right, _right, _right, endSequence{},
			ExitEvent { "five", "" },		Sequence{}, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "six", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "seven", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "eight", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "nine", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "ten", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "eleven", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},
			ExitEvent { "twelve", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},
			endSubslate{},
	} }
} };

#pragma mark _TypeNumbersSlate_
#define _TypeNumbersSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeNumbersSlate }

#pragma mark Function
resource restype_Slate (resid_Functions, "") { {
	Slate { "function",	{
		_SlateGlobals_,
		ExitEvent { "insert", "" },			Sequence{}, Click { 1, -75, -28, _window, _bottomRight }, Click { 1, 12, 8, _window, _topLeft }, endSequence{},
		ExitEvent { "close", "" },		Click { 1, 12, 8, _window, _topLeft },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "clear search", "" },	Click { 1, -22, 41, _window, _topRight },
		Event { "browse", "" },			Sequence{}, Click { 1, _fnb_h, _fnb_top+0*_fnb_rsp, _window, _topLeft }, ResSubslate { resid_BrowseFunctions }, endSequence{},
		Event { "v lookup", "" },		TypeText { "vlookup" },
		Event { "true", "" },			TypeText { "true" },
		Event { "false", "" },			TypeText { "false" },
		Event { "and", "" },			TypeText { "and" },
		Event { "or", "" },				TypeText { "or" },
		Event { "not", "" },			TypeText { "not" },
		Event { "if", "" },				TypeText { "if" },
		Event { "is blank", "" },		TypeText { "isblank" },
		Event { "is error", "" },		TypeText { "isblank" },
		Event { "is even", "" },		TypeText { "iseven" },
		Event { "is odd", "" },			TypeText { "isodd" },
		Event { "concatenate", "" },	TypeText { "concatenate" },
	} }
} };

resource restype_Slate (resid_BrowseFunctions, "") { {
	Slate { "browse",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Click { 1, _fns_h, _fns_v, _window, _topRight },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		_LetterKeys_,
		_DirectionKeys_,
		Event { "all", "" },			Click { 1, _fnb_h, _fnb_top+0*_fnb_rsp, _window, _topLeft },
		Event { "recent", "" },			Click { 1, _fnb_h, _fnb_top+1*_fnb_rsp, _window, _topLeft },
		Event { "date time", "" },		Click { 1, _fnb_h, _fnb_top+3*_fnb_rsp, _window, _topLeft },
		Event { "logical", "" },		Click { 1, _fnb_h, _fnb_top+7*_fnb_rsp, _window, _topLeft },
		Event { "numeric", "" },		Click { 1, _fnb_h, _fnb_top+8*_fnb_rsp, _window, _topLeft },
		Event { "reference", "" },		Click { 1, _fnb_h, _fnb_top+9*_fnb_rsp, _window, _topLeft },
		Event { "text", "" },			Click { 1, _fnb_h, _fnb_top+11*_fnb_rsp, _window, _topLeft },
	} }
} };

#pragma mark === Menus

#pragma mark EditMenu
resource restype_Slate (resid_EditMenu, "") { {
	Slate { "Edit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Paste Values", "" },	TypeText { "Paste Values" }, _return, endSequence{},
	} }
} };

#pragma mark Insert
resource restype_Slate (resid_InsertMenu, "") { {
	Slate { "Insert",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Sheet", "" },			Sequence{}, TypeText { "Sheet" }, _return, endSequence{},
		ExitEvent { "Table", "" },			Sequence{}, TypeText { "Table" }, _right, endSequence{},
		ExitEvent { "Fill", "" },			Sequence{}, TypeText { "Fill" }, _right, endSequence{},
		ExitEvent { "Comment", "" },		Sequence{}, TypeText { "Comment" }, _return, endSequence{},
	} }
} };

#pragma mark Table
resource restype_Slate (resid_TableMenu, "") { {
	Slate { "Table",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Add Row Above", "" },				Sequence{}, TypeText { "Add Row Above" }, _return, endSequence{},
		ExitEvent { "Add Row Below", "" },				Sequence{}, TypeText { "Add Row Below" }, _return, endSequence{},
		ExitEvent { "Add Header Column Before", "" },	Sequence{}, TypeText { "Add Header Column Before" }, _return, endSequence{},
		ExitEvent { "Add Column After", "" },			Sequence{}, TypeText { "Add Column After" }, _return, endSequence{},
		ExitEvent { "Delete Row", "" },					TypeText { "Delete Row" },
		ExitEvent { "Delete Column", "" },				TypeText { "Delete Column" },
		ExitEvent { "Header Rows", "" },				Sequence{}, TypeText { "Header Rows" }, _right, endSequence{},
		ExitEvent { "Header Columns", "" },				Sequence{}, TypeText { "Header Columns" }, _right, endSequence{},
		ExitEvent { "Freeze Rows", "" },				Sequence{}, TypeText { "Freeze Header Rows" }, _right, endSequence{},
		ExitEvent { "Freeze Columns", "" },				Sequence{}, TypeText { "Freeze Header Columns" }, _right, endSequence{},
	} }
} };

#pragma mark View
resource restype_Slate (resid_ViewMenu, "") { {
	Slate { "View",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Inspector", "" },			Sequence{}, Keypress { kc_I, mf_command + mf_option }, _return, endSequence{},
		ExitEvent { "New Inspector", "" },		Sequence{}, TypeText { "New Inspector" }, _return, endSequence{},
		ExitEvent { "Functions", "" },			Sequence{}, TypeText { "Show Function Browser" }, _return, endSequence{},
	} }
} };

/*
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
*/

#pragma mark Inspector
resource restype_Slate (resid_Inspector, "") { {
	Slate { "Inspector",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Keypress { kc_I, mf_command + mf_option },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "activate", "" },		Sequence{}, Click { 1, 123, 56, _window, _topLeft }, Keypress { kc_tab, mf_shift }, ResSubslate { resid_TypeNumbersSlate },  endSequence{},
		_TypeNumbersSlate_,
		_IMouseSlate_,
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "click two", "" },		Click { 2, 0, 0, _cursor },
		Event { "merge cells", "" },	Click { 1, 135, 135, _window, _topLeft },
	} }
} };

#pragma mark Reorganize
#define	_sort_row1		69
#define	_match_row1		208
#define	_cat_row1		293
#define	_reorg_rsp		26
#define	_reorg_colsp	128
#define	_reorg_col1		88
resource restype_Slate (resid_Reorganize, "") { {
	Slate { "Reorganize",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Click { 1, 11, 7, _window, _topLeft },
		ExitEvent { "exit", "" },		NilAction{},
		_TypeNumbersSlate_,
		_IMouseSlate_,
		Event { "click one", "" },		Click { 1, 0, 0, _cursor },
		Event { "click two", "" },		Click { 2, 0, 0, _cursor },
		Event { "match", "" },			Click { 1, 80, 185, _window, _topLeft },
		Event { "sort", "" },			Click { 0, _reorg_col1, _sort_row1, _window, _topLeft },
		Event { "match", "" },			Click { 0, _reorg_col1, _match_row1, _window, _topLeft },
		Event { "category", "" },		Click { 0, _reorg_col1, _cat_row1, _window, _topLeft },
		Event { "row next", "" },		Click { 0, 0, _reorg_rsp, _cursor },
		Event { "column", "" },			Click { 1, 0*_reorg_colsp, 0, _cursor },
		Event { "button", "" },			Click { 1, 1*_reorg_colsp, 0, _cursor },
		Event { "field", "" },			Click { 1, 2*_reorg_colsp, 0, _cursor },
		Event { "add row", "" },		Click { 1, 3*_reorg_colsp, 0, _cursor },
		Event { "delete	row", "" },		Click { 1, 3*_reorg_colsp-24, 0, _cursor },
		Event { "sort now", "" },		Click { 1, -46, 107, _window, _topRight },
		Event { "reset", "" },			Click { 1, -46, 139, _window, _topRight },
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
		_WhitespaceKeys_,
		_DirectionKeys_,
		_CommandSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoSelectSubslate_,
		_TypeNumbersSlate_,
		_IMouseSlate_,
		_PageKeys_,
		Event { "copy", "" },			Keypress { kc_C, mf_command },
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "paste values", "" },	Sequence{}, ClickMenu { "Edit" }, TypeText { "Paste Values" }, endSequence{},
		Event { "append row", "" },		Sequence{}, Keypress { kc_pagedown, 0 }, Wait { 20 }, Click { 1, 190, -22, _window, _bottomLeft }, Click { 1, 160, -22, _window, _bottomLeft }, Keypress { kc_down, mf_option }, endSequence{},
		Event { "print sheet", "" },	Sequence{}, Keypress { kc_P, mf_command }, Click { 1, 0, 132, _window, _topCenter }, TypeText { "plain paper, fast draft, black and white" }, _return, Keypress { kc_1, 0 }, 	_tab, _tab, _space, _down, _return, Keypress { kc_1, 0 }, Wait { 10 }, _return, endSequence{},
		Event { "Sheet", "" },			Subslate { "Sheet" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Make Invoice", "" },	Click { 1, 80, 135, _window, _topLeft },
			ExitEvent { "Items Ordered", "" },	Click { 1, 80, 317, _window, _topLeft },
			ExitEvent { "Invoices", "" },		Click { 1, 80, 371, _window, _topLeft },
			ExitEvent { "View Invoice", "" },	Click { 1, 80, 420, _window, _topLeft },
			ExitEvent { "People", "" },			Click { 1, 80, 584, _window, _topLeft },
			ExitEvent { "Products", "" },		Click { 1, 80, 636, _window, _topLeft },
			endSubslate{},
		Event { "Table", "" },			Subslate { "Table" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Invoice Input", "" },		Click { 1, 330, 160, _window, _topLeft },
			ExitEvent { "Order Input", "" },		Click { 1, 220, 362, _window, _topLeft },
			ExitEvent { "Invoice Lines", "" },		Sequence{}, Click { 1, 480, 362, _window, _topLeft }, Click { 1, 450, 362, _window, _topLeft }, endSequence{},
			ExitEvent { "Invoice Data", "" },		Sequence{}, Click { 1, 190, 662, _window, _topLeft }, Click { 1, 160, 658, _window, _topLeft }, endSequence{},
			ExitEvent { "Notes", "" },				Click { 1, 300, 135, _window, _topLeft },
			ExitEvent { "Shopping", "" },			Click { 1, 890, 732, _window, _topLeft },
			ExitEvent { "Items Ordered", "" },		Sequence{}, Click { 1, 190, 166, _window, _topLeft }, Click { 1, 160, 183, _window, _topLeft }, endSequence{},
			ExitEvent { "Invoices", "" },			Sequence{}, Click { 1, 190, 166, _window, _topLeft }, Click { 1, 160, 164, _window, _topLeft }, endSequence{},
			ExitEvent { "Invoice Info", "" },		Click { 1, 896, 153, _window, _topLeft },
			endSubslate{},
		Event { "insert rows", "" },	Subslate { "insert rows" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },	Sequence{}, _insert_row, endSequence{},
			ExitEvent { "two", "" },	Sequence{}, _insert_row, _insert_row, endSequence{},
			ExitEvent { "three", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "four", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "five", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "six", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "seven", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "eight", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "nine", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "ten", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "eleven", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			ExitEvent { "twelve", "" },	Sequence{}, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, _insert_row, endSequence{},
			endSubslate{},
	} }
} };

#pragma mark Numbers
resource restype_Slate (resid_Numbers, "Numbers Slate") { {
	Slate { "Numbers",	{
		_SlateGlobals_,
		Event { "convert", "convert to 09 format" },	Sequence{}, Keypress { kc_S, mf_command }, Wait { 10 }, _return, Wait { 2 }, Keypress { kc_W, mf_command }, endSequence{},
		_DefaultBase_,
		_TypeNumbersSlate_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "Arbonne", "" },			ResSubslate { resid_Arbonne },
		Event { "Window", "" },				ResSubslate { resid_WindowSlate },
		Event { "fix window", "" },			Sequence{}, Click { 0, -4, -4, window, "1", _bottomRight }, Click { -1, 0, -60, _cursor }, endSequence{},
		Event { "page down", "" },			Keypress { kc_pagedown, 0 },
		Event { "page north", "" },			Keypress { kc_pageup, 0 },
		Event { "Inspector", "" },			Sequence{}, Keypress { kc_I, mf_command + mf_option }, ResSubslate { resid_Inspector }, endSequence{},
		Event { "Reorganize", "" },			Sequence{}, Click { 1, 275, 40, _window, _topLeft }, ResSubslate { resid_Reorganize }, endSequence{},
		Event { "show colors", "" },		Keypress { kc_C, mf_command + mf_shift },
		Event { "Macro", "" },				ResSubslate { resid_Macro },
		Event { "copy", "" },				Keypress { kc_C, mf_command },
		Event { "paste", "" },				Keypress { kc_V, mf_command },
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "select", "" },			_return,
			ExitEvent { "Application", "" },	ClickMenu { "Numbers" },
			ExitEvent { "File", "" }, 			ClickMenu { "File" },
			Event { "Edit", "" }, 				Sequence{}, ClickMenu { "Edit" }, ResSubslate { resid_EditMenu },endSequence{},
			Event { "Insert", "" }, 			Sequence{}, ClickMenu { "Insert" }, ResSubslate { resid_InsertMenu }, endSequence{},
			Event { "Table", "" }, 				Sequence{}, ClickMenu { "Table" }, ResSubslate { resid_TableMenu }, endSequence{},
			ExitEvent { "Arrange", "" }, 		ClickMenu { "Arrange" },
			Event { "View", "" }, 				Sequence{}, ClickMenu { "View" }, ResSubslate { resid_ViewMenu }, endSequence{},
			ExitEvent { "Window", "" }, 		ClickMenu { "Window" },
			endSubslate{},
	 } }
} };

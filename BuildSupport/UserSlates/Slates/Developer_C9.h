// =================================================================================
//	Developer_C9.h				(c) 2013-14 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "CommonSlates_C9.h"

#pragma mark === Markers ===
// 1

/* resid_ */
#define resid_TypeSpecialDevSlate	resid_Developer+0
#define resid_Copyright				resid_Developer+1
#define resid_Package				resid_Developer+2
#define resid_ChooseUp				resid_Developer+3

/* Text and Snippets */
#define	resid_InsertTag				resid_Developer+100
#define	resid_InsertStyle			resid_Developer+120
#define	resid_Markup				resid_Developer+140
	#define resid_TargetType			resid_Markup+1
	#define resid_ucLevel				resid_Markup+2
	#define resid_ucActor				resid_Markup+3
#define	resid_UserSlate				resid_Developer+160
#define resid_Doxygen				resid_Developer+180
#define resid_Cocoa					resid_Developer+200
	#define resid_XCTAssert				resid_Cocoa+1
#define resid_Python				resid_Developer+220
#define resid_Unix					resid_Developer+240

#define	_nextField			Keypress { kc_slash, mf_control }
#define	_previousField		Keypress { kc_slash, mf_control + mf_shift }
#define _indent				Keypress { kc_closebracket, mf_command }
#define _indentBack			Keypress { kc_bracket, mf_command }
#define _cutNextLine		Keypress { kc_right, mf_command }, Keypress { kc_right, 0 }, Keypress { kc_right, mf_command + mf_shift }, Keypress { kc_X, mf_command }, Keypress { kc_delete, 0 }
#define jump_right_ 		Keypress { kc_right, mf_option }
#define _insertTab			Keypress { kc_tab, mf_option }

#pragma mark Use Cases
#define _uc1		Keypress { kc_tab, 0 }, TypeText { "<p><b>" }
#define _uc2		TypeText { ": </b><" }, Keypress { kc_3, mf_shift }
#define _uc3		Keypress { kc_3, mf_shift }, TypeText { "></p>" }, Keypress { kc_slash, mf_control + mf_shift }
#define _UseCaseItems_	\
			ExitEvent { "scope", "" },		Sequence{}, _uc1, TypeText { "Scope" }, _uc2, TypeText { "scope" }, _uc3, endSequence{},	\
			ExitEvent { "Actor", "" },		Sequence{}, _uc1, TypeText { "Primary Actor" }, _uc2, TypeText { "Primary Actor" }, _uc3, endSequence{},	\
			ExitEvent { "Context", "" },	Sequence{}, _uc1, TypeText { "Context of Use" }, _uc2, TypeText { "Context" }, _uc3, endSequence{},	\
			ExitEvent { "Interests", "" },	Sequence{}, _uc1, TypeText { "Stakeholders and Interests" }, _uc2, TypeText { "Stakeholders: Interest" }, _uc3, endSequence{},	\
			ExitEvent { "Precondition", "" },	Sequence{}, _uc1, TypeText { "Precondition" }, _uc2, TypeText { "Precondition" }, _uc3, endSequence{},	\
			ExitEvent { "Minimal", "" },	Sequence{}, _uc1, TypeText { "Minimal Guarantee" }, _uc2, TypeText { "Minimal" }, _uc3, endSequence{},	\
			ExitEvent { "Success", "" },	Sequence{}, _uc1, TypeText { "Success Guarantee" }, _uc2, TypeText { "Success" }, _uc3, endSequence{},	\
			ExitEvent { "Trigger", "" },	Sequence{}, _uc1, TypeText { "Trigger" }, _uc2, TypeText { "Trigger" }, _uc3, endSequence{},	\
			ExitEvent { "Scenario", "" },	Sequence{}, _uc1, TypeText { "Main Success Scenario" },	TypeText { ": </b><ol>" }, _return, _tab, Keypress { kc_comma, mf_shift }, Keypress { kc_3, mf_shift },	TypeText { "Scenario" }, Keypress { kc_3, mf_shift }, Keypress { kc_period, mf_shift }, _return, _tab, TypeText { "</ol>" }, Keypress { kc_slash, mf_control + mf_shift }, endSequence{},	\
			ExitEvent { "Extensions", "" },	Sequence{}, _uc1, TypeText { "Extensions" }, _uc2, TypeText { "Extensions" }, _uc3, endSequence{},	\
			ExitEvent { "Variations", "" },	Sequence{}, _uc1, TypeText { "Technology &amp; Data Variations" }, _uc2, TypeText { "Variations" }, _uc3, endSequence{},	\
			ExitEvent { "Related", "" },	Sequence{}, _uc1, TypeText { "Related Information" }, _uc2, TypeText { "Related" }, _uc3, endSequence{},	\
			ExitEvent { "Diagram", "" },	Sequence{}, _uc1, TypeText { "Diagram" }, _uc2, TypeText { "link to diagram" }, _uc3, endSequence{}

#define _TypeDevItems_	\
	Event { "add space", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_space, 0 }, endSequence{},	\
	Event { "add comma", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_comma, 0 }, endSequence{},	\
	Event { "list item", "" },	Sequence{}, TypeText { "<li><#item#></li>" }, _previousField, endSequence{},	\
	Event { "page top", "" },	Keypress { kc_home, 0 },	\
	Event { "page bottom", "" },	Keypress { kc_end, 0 },	\
	Event { "page north", "" },	Keypress { kc_pageup, 0 },	\
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	Event { "next field", "" },	Keypress { kc_slash, mf_control },	\
	Event { "previous field", "" },	Keypress { kc_slash, mf_control + mf_shift },	\
	Event { "copy", "" },			Keypress { kc_C, mf_command },	\
	Event { "undo", "" },			Keypress { kc_Z, mf_command },	\
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
	Event { "jump left", "option-left <n> times" },			ResSubslate { resid_WordLeft },	\
	Event { "jump right", "option-right <n> times" },		ResSubslate { resid_WordRight },	\
	_JumpDownSubslate_,	\
	_JumpNorthSubslate_,	\
	_TypeSlateItems_

#define _DevMacroItems_	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		_DirectionKeys_,	\
		_CommandSlate_,	\
		_JumpDownSubslate_,	\
		_JumpNorthSubslate_,	\
		_DoSelectSubslate_,	\
		ExitEvent { "add marker", "from start of named header line" },		Sequence{},	\
			_return, _up,	\
			jump_right_, jump_right_, jump_right_, jump_right_, jump_right_, jump_right_, jump_right_, jump_right_,	\
			Keypress { kc_left, mf_shift + mf_option },	Keypress { kc_C, mf_command }, _up,	\
			TypeText { "<!-- marker " }, Keypress { kc_quote, mf_shift }, Keypress { kc_V, mf_command },	\
			Keypress { kc_quote, mf_shift }, TypeText { " -->" },	\
			endSequence{},	\
		ExitEvent { "find topic lists", "" },	Sequence{}, Keypress { kc_F, mf_command }, TypeText { "@topicList" }, endSequence{},	\
		ExitEvent { "blurb", "" },	Sequence{}, _left, _left, TypeText { " class='blurb'" }, Keypress { kc_slash, mf_control }, endSequence{},	\
		ExitEvent { "combine lines", "" },	Sequence{}, Keypress { kc_right, mf_command }, Keypress { kc_right, mf_option },	\
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_delete, 0 },	\
			Keypress { kc_delete, 0 }, Keypress { kc_space, 0 }, endSequence{},	\
		Event { "make list item", "" },			Sequence{}, _cutNextLine, _delete, _return, TypeText { "<li></li>" },	\
			_left, _left, _left, _left, _left, Keypress { kc_V, mf_command }, endSequence{},	\
		Event { "indent items", "" },		Sequence{},	\
			Keypress { kc_closebracket, mf_command }, Keypress { kc_left, mf_shift },	\
			Keypress { kc_X, mf_command }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
			TypeText { "<ul>" }, Keypress { kc_return, mf_option },	\
			Keypress { kc_V, mf_command + mf_option + mf_shift }, _delete, _return, _delete,	\
			TypeText { "</ul>" }, endSequence{}

#define _DoxygenItems_		\
		_SlateGlobals_,		\		\
		_CloseSubslate_,		\		\
		ExitEvent { "exit", "" },					NilAction{},		\
		ExitEvent { "cancel", "" },					NilAction{},		\
		Event { "block", "" },						Sequence{}, TypeText { "/*!" }, _insertTab, Keypress { kc_return, 0 }, TypeText { "*/" }, _return, _left, Keypress { kc_left, mf_command }, Keypress { kc_left, 0 }, endSequence{},		\
		Event { "comment", "" },					Sequence{}, TypeText { "/*!  */" }, _left, _left, _left, endSequence{},		\
		ExitEvent { "trailing", "trailing comment" }, Sequence{}, TypeText { "/*!< \\brief" }, _insertTab, TypeText { " */" }, _left, _left, _left, endSequence{},		\
		ExitEvent { "brief", "" },					Sequence{}, TypeText { "\\brief" }, _insertTab, _insertTab, endSequence{},		\
		ExitEvent { "category", "" },				Sequence{}, TypeText { "\\category <#className#>(<#categoryName#>" }, _insertTab, _previousField, _previousField, endSequence{},		\
		ExitEvent { "details", "" },				Sequence{}, TypeText { "\\details" }, _insertTab, endSequence{},		\
		ExitEvent { "parameter", "" },				Sequence{}, TypeText { "\\param" }, _insertTab, _insertTab, TypeText { "<#paramName#>" }, _insertTab, TypeText { "<#description#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "result", "" },					Sequence{}, TypeText { "\\result" }, _insertTab, _insertTab, endSequence{},		\
		ExitEvent { "file", "" },					Sequence{}, TypeText { "\\file" }, _insertTab, _insertTab, TypeText { "<#filename#>" }, _insertTab, TypeText { "<#description#>" }, endSequence{},		\
		ExitEvent { "internal", "" },				Sequence{}, TypeText { "\\internal" }, _insertTab, endSequence{},		\
		ExitEvent { "attention", "" },				Sequence{}, TypeText { "\\attention" }, _insertTab, endSequence{},		\
		ExitEvent { "bug", "" },					Sequence{}, TypeText { "\\bug" }, _insertTab, _insertTab, endSequence{},		\
		ExitEvent { "deprecated", "" },				Sequence{}, TypeText { "\\deprecated" }, _insertTab, endSequence{},		\
		ExitEvent { "exception", "" },				Sequence{}, TypeText { "\\exception" }, _insertTab, endSequence{},		\
		ExitEvent { "invariant", "" },				Sequence{}, TypeText { "\\invariant" }, _insertTab, endSequence{},		\
		ExitEvent { "note", "" },					Sequence{}, TypeText { "\\note" }, _insertTab, _insertTab, endSequence{},		\
		ExitEvent { "to do", "" },					Sequence{}, TypeText { "\\todo" }, _insertTab, _insertTab, endSequence{},		\
		ExitEvent { "paragraph", "" },				Sequence{}, TypeText { "\\par" }, _insertTab, TypeText { "<#title#>" }, _previousField, endSequence{},		\
		ExitEvent { "postconditions", "" },			Sequence{}, TypeText { "\\post" }, _insertTab, endSequence{},		\
		ExitEvent { "preconditions", "" },			Sequence{}, TypeText { "\\pre" }, _insertTab, endSequence{},		\
		ExitEvent { "see also", "" },				Sequence{}, TypeText { "\\sa" }, _insertTab, endSequence{},		\
		ExitEvent { "since", "" },					Sequence{}, TypeText { "\\since" }, _insertTab, _insertTab, TypeText { "<#version#>" }, _previousField, endSequence{},		\
		ExitEvent { "test", "" },					Sequence{}, TypeText { "\\test" }, _insertTab, endSequence{},		\
		ExitEvent { "throw", "" },					Sequence{}, TypeText { "\\throw" }, _insertTab, _insertTab, TypeText { "<#exceptionObject#>" }, _insertTab, TypeText { "<#because#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "copydoc", "" },				Sequence{}, TypeText { "\\copydoc" }, _insertTab, TypeText { "<#class#>::<#member#>\\n" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "markup", "" },					Sequence{}, TypeText { "\\htmlonly" }, _return, TypeText { "\\endhtmlonly" }, _up, endSequence{},		\
		ExitEvent { "list item", "" },				Sequence{}, TypeText { "\\li" }, _insertTab, _insertTab, endSequence{},		\
		ExitEvent { "group", "" },					Sequence{}, TypeText { "#pragma mark" }, _insertTab, TypeText	{ "<#groupName#>" }, _return, TypeText { "/*! \\name" }, _insertTab, _insertTab, TypeText { "<#groupName#>" }, _return, TypeText { "*/" }, _return, TypeText { "//@{" }, _return, TypeText { "//@}" }, _return, Keypress { kc_up, mf_shift }, endSequence{},		\
		ExitEvent { "mainpage", "" },				Sequence{}, TypeText { "\\mainpage" }, _insertTab, TypeText { "<#optTitle#>" }, _insertTab, _previousField, endSequence{},		\
		ExitEvent { "page", "" },					Sequence{}, TypeText { "\\page" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "anchor", "" },					Sequence{}, TypeText { "\\anchor" }, _insertTab, TypeText { "<#name#>" }, _insertTab, _previousField, endSequence{},		\
		ExitEvent { "reflink", "" },				Sequence{}, TypeText { "\\ref" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "subpage", "" },				Sequence{}, TypeText { "\\subpage" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "section", "" },				Sequence{}, TypeText { "\\section" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "subsection", "" },				Sequence{}, TypeText { "\\subsection" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "subsubsection", "" },			Sequence{}, TypeText { "\\subsubsection" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "page paragraph", "" },			Sequence{}, TypeText { "\\paragraph" }, _insertTab, TypeText { "<#name#>" }, _insertTab, TypeText { "<#title#>" }, _previousField, _previousField, endSequence{},		\
		ExitEvent { "less than", "" },				TypeText { "&lt;" },		\
		ExitEvent { "greater than", "" },			TypeText { "&gt;" },		\
		ExitEvent { "ampersand", "" },				TypeText { "&amp;" }

#define _TypeDevSlateItems_	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		Event { "cut next line", "" },			Sequence{}, _cutNextLine, endSequence{},	\
		Event { "set clipboard", "" },			Sequence{}, Keypress { kc_right, mf_command }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_X, mf_command }, endSequence{},	\
		Event { "indent", "" },					_indent,	\
		Event { "indent back", "" },			_indentBack,	\
		Event { "repository", "" },				Subslate { "repo" },	\
			_SlateGlobals_,		\
			_CloseSubslate_,	\
			ExitEvent { "Support", "" },			TypeText { "Support" },		\
			ExitEvent { "Accessor", "" },			TypeText { "Accessor" },	\
			ExitEvent { "Punkin", "" },				TypeText { "Punkin" },		\
			endSubslate{},		\
		Event { "Special", "" },				ResSubslate { resid_TypeSpecialDevSlate }, \
		Event { "Copyright", "" },				ResSubslate { resid_Copyright },	\
		Event { "Package", "" },				ResSubslate { resid_Package },	\
		Event { "Insert Tag", "" },				ResSubslate { resid_InsertTag },	\
		Event { "Add Style", "" },				ResSubslate { resid_InsertStyle },	\
		Event { "Insert Element", "" },			ResSubslate { resid_Markup },	\
		Event { "Insert Markup", "" },			ResSubslate { resid_Markup },	\
		Event { "Cocoa", "" },					ResSubslate { resid_Cocoa },		\
		Event { "Doxygen", "" },				ResSubslate { resid_Doxygen },		\
		Event { "User", "" },					ResSubslate { resid_UserSlate },	\
		Event { "Python", "" },					ResSubslate { resid_Python },		\
		Event { "Unix", "" },					ResSubslate { resid_Unix }

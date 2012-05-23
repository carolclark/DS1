// =================================================================================
//	Preview_C9.r					©2008 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_TypePreviewSlate			resid_Preview+1
#define resid_TypeSpecialPreviewSlate	resid_Preview+2

#pragma mark #define
#define _Contents	Event { "contents", "" },	Click { 1, -10, -30, _window, _bottomRight }

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialPreviewSlate, "Type Special Preview Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypePreviewSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialPreviewSlate },
	} }
} };

#pragma mark _TypePreviewSlate_
#define _TypePreviewSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypePreviewSlate }

#pragma mark Preview
// annotate toolbar left, spacing
#define _atl	14
#define _atsp	33
	
resource restype_Slate (resid_Preview, "Preview Slate") { {
	Slate { "Preview",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypePreviewSlate_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		Event { "document", "" },			Subslate { "Document" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "close", "" },				Keypress { kc_W, mf_command },
			ExitEvent { "Transition Guide", "" },	Launch { Reference_"xcode4transitionguide.pdf", 0 },
			ExitEvent { "BBEdit", "" },				Launch { MainApps_"BBEdit.app/Contents/Resources/BBEdit User Manual.pdf", 0 },
			ExitEvent { "Doxygen", "" },			Launch { Reference_"doxygen_manual-1.6.3.pdf", 0 },
			ExitEvent { "Dictate", "" },			Launch { Reference_"Dragon Dictate User Manual.pdf", 0 },
			ExitEvent { "Error Handling", "" },		Launch { Reference_"ErrorHandlingCocoa.pdf", 0 }, 
			endSubslate{},
		Event { "Window", "" },			ResSubslate { resid_WindowSlate },
		Event { "fix window", "" },		Sequence{}, Click { 0, -4, -4, _window, _bottomRight }, Wait { 10 }, Click { -1, 0, -70, _cursor }, endSequence{},
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		_Contents,
		Event { "filter", "" },			Subslate { "Filter" },
			_SlateGlobals_,
			_CloseSubslate_,
			_DirectionKeys_,
			Event { "field", "" },			Sequence{}, Click { 2, -30, 35, _window, _topRight },
				ResSubslate { resid_TypePreviewSlate }, endSequence{},
			_Contents,
			Event { "clear filter", "" },	Click { 1, -10, 35, _window, _topRight },
			Event { "hide banner", "" },	Click { 1, -35, 80, _window, _topRight },
			Event { "next", "" },			Click { 1, -80, 83, _window, _topRight },
			Event { "previous", "" },		Click { 1, -100, 83, _window, _topRight },
			Event { "search rank", "" },	Click { 1, 115, 80, _window, _topLeft },
			Event { "page order", "" },		Click { 1, 215, 80, _window, _topLeft },
			endSubslate{},
		Event { "annotate", "" },			Subslate { "annotate" },
			_SlateGlobals_,
			ExitEvent { "exit", "" },		NilAction{},
			Event { "show fonts", "" },		Keypress { kc_T, mf_command },
			Event { "show inspector", "" },	Keypress { kc_I, mf_command },
			Event { "color", "" },			Keypress { kc_C, mf_command + mf_option },
			Event { "Move tool", "" },		Keypress { kc_1, mf_command },
			Event { "Text tool", "" },		Keypress { kc_2, mf_command },
			Event { "Select tool", "" },	Keypress { kc_3, mf_command },
			Event { "arrow", "" },			Keypress { kc_A, mf_command + mf_control },
			Event { "oval", "" },			Keypress { kc_O, mf_command + mf_control },
			Event { "rectangle", "" },		Keypress { kc_R, mf_command + mf_control },
			Event { "text", "" },			Keypress { kc_T, mf_command + mf_control },
			Event { "note two", "" },			Keypress { kc_N, mf_command + mf_control },
			Event { "link", "" },			Keypress { kc_L, mf_command + mf_control },
			Event { "highlight", "" },		Keypress { kc_H, mf_command + mf_control },
			Event { "strikethru", "" },		Keypress { kc_S, mf_command + mf_control },
			Event { "underline", "" },		Keypress { kc_U, mf_command + mf_control },
			endSubslate{},
		Event { "Bookmarks", "" },			Subslate { "bookmarks" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "add", "" },		Keypress { kc_D, mf_command },
			endSubslate{},
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" }, ClickMenu { "Preview" },
			ExitEvent { "File", "" }, 		ClickMenu { "File" },
			ExitEvent { "Edit", "" }, 		ClickMenu { "Edit" },
			ExitEvent { "Window", "" }, 	ClickMenu { "Window" },
			ExitEvent { "View", "" }, 		ClickMenu { "View" },
			ExitEvent { "Go", "" }, 		ClickMenu { "Go" },
			ExitEvent { "Tools", "" }, 		ClickMenu { "Tools" },
			ExitEvent { "Bookmarks", "" }, 	ClickMenu { "Bookmarks" },
			endSubslate{},
	 } }
} };


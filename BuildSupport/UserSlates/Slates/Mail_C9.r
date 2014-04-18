// =================================================================================
//	Mail_C9.r					(c)2008-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark 0 === Index
// 1 Typing; 2 Menus; 3 Attachments; 4 Mailboxes; 7 Preferences; (8 Miscellaneous); 9 Mail

#define resid_TypeMailSlate				resid_Mail+1
#define resid_TypeSpecialMailSlate		resid_Mail+2

#define	resid_Menus						resid_Mail+100	
	#define resid_menuMailbox				resid_Menus+0

#define resid_Attachments				resid_Mail+200
	#define resid_QuickLook					resid_Attachments+1

#define resid_Mailbox					resid_Mail+300
#define resid_Sort						resid_Mail+350
#define resid_MoveTo					resid_Mail+400
#define resid_Browser					resid_Mail+500

#define resid_Preferences				resid_Mail+600
	#define resid_prefsRules				resid_Preferences+1

#pragma mark 1 === Typing
#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialMailSlate, "Type Special Mail Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark Type
resource restype_Slate (resid_TypeMailSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialMailSlate },
	} }
} };

#pragma mark _TypeMailSlate_
#define _TypeMailSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeMailSlate }

#pragma mark 2 === Menus
#pragma mark resid_menuMailbox
resource restype_Slate (resid_menuMailbox, "") { {
	Slate { "Mailbox",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "new mailbox", "" },		Sequence{}, ClickMenu { "Mailbox" }, _down, TypeText { "New Mailbox" }, _return, ResSubslate { resid_TypeMailSlate }, endSequence{},
		Event { "rename mailbox", "" },		Sequence{}, ClickMenu { "Mailbox" }, _down, TypeText { "Rename Mailbox" }, _return, endSequence{},
		Event { "delete mailbox", "" },		Sequence{}, ClickMenu { "Mailbox" }, _down, TypeText { "Delete Mailbox" }, _return, endSequence{},
		Event { "archive mailbox", "" },	Sequence{}, ClickMenu { "Mailbox" }, _down, TypeText { "Archive Mailbox" }, _return, endSequence{},
		_DirectionKeys_,
	} }
} };

#pragma mark 3 === Attachments
#pragma mark Attachments
resource restype_Slate (resid_Attachments, "") { {
	Slate { "Attachments",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "show", "" },			UIScript { 
		"perform action \"AXPress\" of UI element 1 of group 1 of scroll area 2 of splitter group 2 of splitter group 1 of window 1", "" }, 
		Event { "save", "" },			UIScript {
		"perform action \"AXPress\" of pop up button \"Save\" of group 1 of scroll area 2 of splitter group 2 of splitter group 2 of window 1", "" },
		Event { "quick look", "" },		Sequence{}, Keypress { kc_Y, mf_command }, ResSubslate { resid_QuickLook }, endSequence{},
	} }
} };

#pragma mark QuickLook
resource restype_Slate (resid_QuickLook, "") { {
	Slate { "QuickLook",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "open", "" },			Click { 1, -135, 15, _window, _topRight },
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "next", "" },			Click { 1, -6, -24, _window, _bottomCenter },
		Event { "previous", "" },		Click { 1, -98, -24, _window, _bottomCenter },
		Event { "play", "" },			Click { 1, -58, -24, _window, _bottomCenter },
	} }
} };

#pragma mark 4 === Mailboxes	
#pragma mark Mailbox
#define _lsp		20
	// _base: v for row On My Mac
#define _base		360
resource restype_Slate (resid_Mailbox, "Choose Mailbox") { {
	Slate { "Mailbox",	{
		_SlateGlobals_,
		Event { "okay", "close this subslate" },	CloseSubslate {},
		Event { "click one", "" },			IMouse { im_Click, 1 },
		Event { "click two", "" },			IMouse { im_Click, 2 },
		Event { "activity", "" },			Click { 1, 47, -9, _window, _bottomLeft },
		ExitEvent { "Inbox", "" },			Keypress { kc_1, mf_command },
		ExitEvent { "Sent", "" },			Keypress { kc_4, mf_command },
		ExitEvent { "Trash", "" },			Keypress { kc_5, mf_command },
		ExitEvent { "Junk", "" },			Keypress { kc_6, mf_command },
		ExitEvent { "Apple News", "" },		Click { 1, 70, 223, _window, _topLeft },
		ExitEvent { "Google News", "" },	Click { 1, 70, 243, _window, _topLeft },
		ExitEvent { "Filed", "" },			Click { 1, 70, _base+0*_lsp, _window, _topLeft },
		ExitEvent { "Advertising", "" },	Click { 1, 70, _base+1*_lsp, _window, _topLeft },
		ExitEvent { "Apple", "" },			Click { 1, 70, _base+2*_lsp, _window, _topLeft },
		ExitEvent { "Arbonne", "" },		Click { 1, 70, _base+3*_lsp, _window, _topLeft },
		ExitEvent { "C and C", "" },		Click { 1, 70, _base+4*_lsp, _window, _topLeft },
		ExitEvent { "Church", "" },			Click { 1, 70, _base+5*_lsp, _window, _topLeft },
		ExitEvent { "Clubs", "" },			Click { 1, 70, _base+6*_lsp, _window, _topLeft },
		ExitEvent { "Cox", "" },			Click { 1, 70, _base+7*_lsp, _window, _topLeft },
		ExitEvent { "Family", "" },			Click { 1, 70, _base+8*_lsp, _window, _topLeft },
		ExitEvent { "Linked In", "" },		Click { 1, 70, _base+9*_lsp, _window, _topLeft },
		ExitEvent { "Humor", "" },			Click { 1, 70, _base+10*_lsp, _window, _topLeft },
		ExitEvent { "Netflix", "" },		Click { 1, 70, _base+11*_lsp, _window, _topLeft },
		ExitEvent { "News Feeds", "" },		Click { 1, 70, _base+12*_lsp, _window, _topLeft },
		ExitEvent { "Punkin", "" },			Click { 1, 70, _base+13*_lsp, _window, _topLeft },
		ExitEvent { "Receipts", "" },		Click { 1, 70, _base+14*_lsp, _window, _topLeft },
		ExitEvent { "Technical", "" },		Click { 1, 70, _base+15*_lsp, _window, _topLeft },
		ExitEvent { "Accessibility", "" },	Click { 1, 70, _base+16*_lsp, _window, _topLeft },
		ExitEvent { "Cocoa", "" },			Click { 1, 70, _base+17*_lsp, _window, _topLeft },
		ExitEvent { "Saved", "" },			Click { 1, 70, _base+18*_lsp, _window, _topLeft },
		ExitEvent { "Xcode", "" },			Click { 1, 70, _base+19*_lsp, _window, _topLeft },
	} }
} };

#pragma mark Sort
resource restype_Slate (resid_Sort, "") { {
	Slate { "Sort",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Attachments", "" },	_return,
		ExitEvent { "Date", "" },			Sequence{}, TypeText { "Date" }, _return, endSequence{},
		ExitEvent { "From", "" },			Sequence{}, TypeText { "From" }, _return, endSequence{},
		ExitEvent { "Flags", "" },			Sequence{}, TypeText { "Flags" }, _return, endSequence{},
		ExitEvent { "Mailbox", "" },		Sequence{}, TypeText { "Mailbox" }, _return, endSequence{},
		ExitEvent { "Size", "" },			Sequence{}, TypeText { "Size" }, _return, endSequence{},
		ExitEvent { "Subject", "" },		Sequence{}, TypeText { "Subject" }, _return, endSequence{},
		ExitEvent { "To", "" },				Sequence{}, TypeText { "To" }, _return, endSequence{},
		ExitEvent { "Unread", "" },			Sequence{}, TypeText { "Unread" }, _return, endSequence{},
		ExitEvent { "Ascending", "" },		Sequence{}, TypeText { "Ascending" }, _return, endSequence{},
		ExitEvent { "Descending", "" },		Sequence{}, TypeText { "Descending" }, _return, endSequence{},
	} }
} };

#pragma mark MoveTo
// line spacing = 20
resource restype_Slate (resid_MoveTo, "Move to Mailbox") { {
	Slate { "MoveTo",	{
		_SlateGlobals_,
		Event { "cancel", "" },					CloseSubslate {},
		ExitEvent { "okay", "" },				Keypress { kc_return, 0 },
		ExitEvent { "again", "" },				Keypress { kc_T, mf_command + mf_option },
		ExitEvent { "Trash", "" },				Sequence{}, TypeText { "Trash" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Junk", "" },				Keypress { kc_J, mf_command + mf_option },
		ExitEvent { "Advertising", "" },		Sequence{}, TypeText { "Advertising" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Apple", "" },				Sequence{}, TypeText { "Apple" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Arbonne", "" },			Sequence{}, TypeText { "Arbonne" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "C and C", "" },			Sequence{}, TypeText { "C & C Software" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Church", "" },				Sequence{}, TypeText { "Church" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Clubs", "" },				Sequence{}, TypeText { "Clubs" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Cox", "" },				Sequence{}, TypeText { "Cox" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Family", "" },				Sequence{}, TypeText { "Family" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Linked In", "" },			Sequence{}, TypeText { "LinkedIn" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Humor", "" },				Sequence{}, TypeText { "Humor" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Netflix", "" },			Sequence{}, TypeText { "Netflix" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "News Feeds", "" },			Sequence{}, TypeText { "News Feeds" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Punkin", "" },				Sequence{}, TypeText { "Punkin" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Receipts", "" },			Sequence{}, TypeText { "Receipts" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Technical", "" },			Sequence{}, TypeText { "Technical" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Accessibility", "" },		Sequence{}, TypeText { "Accessibility" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Cocoa", "" },				Sequence{}, TypeText { "Cocoa" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Saved", "" },				Sequence{}, TypeText { "Saved" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Xcode", "" },				Sequence{}, TypeText { "XcodeUsers" }, Keypress { kc_return, 0 }, endSequence{},
	} }
} };

#pragma mark Browser
	#define	_BrowseCdocResID_	resid_Browser
	#define _mainFrame_h		0
	#define _mainFrame_v		75
	#define _homeApp			Apps_"Mail.app"
_BrowseCdocSlate_

#pragma mark 7 === Preferences
#define btnTop		104
#define btnVsp		32
#define btnH		-70
#define	_PreferencesStandards_	\
		_SlateGlobals_,		\
		_FullAccessSlate_,	\
		_IMouseSlate_,		\
		_JumpLeftSubslate_,	\
		_JumpRightSubslate_,	\
		_WhitespaceKeys_,	\
		_DirectionKeys_	

#pragma mark Preferences
resource restype_Slate (resid_Preferences, "") { {
	Slate { "prefs",	{
		_PreferencesStandards_,
		_CloseSubslate_,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "Rules", "" },			Sequence{}, ResSubslate { resid_prefsRules }, Click { 1, -36, 50, _window, _topRight }, endSequence{},
	} }
} };

#pragma mark Rules
resource restype_Slate (resid_prefsRules, "") { {
	Slate { "Rules",	{
		_PreferencesStandards_,
		ExitEvent { "okay", "" },		_return,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "add rule", "" },		Click { 1, btnH, btnTop + 0 * btnVsp, _window, _topRight },
		Event { "edit", "" },			Click { 1, btnH, btnTop + 1 * btnVsp, _window, _topRight },
		Event { "duplicate", "" },		Click { 1, btnH, btnTop + 2 * btnVsp, _window, _topRight },
		Event { "remove", "" },			Click { 1, btnH, btnTop + 3 * btnVsp, _window, _topRight },
		Event { "add condition", "" },	Click { 1, -36, 170, _window, _topRight },
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_DirectionKeys_,
		_LetterKeys_
	} }
} };

#pragma mark 9 === Mail
#pragma mark Mail
#define ROW_H		307
#define ROW_TOP		94
#define ROW_SP		17
resource restype_Slate (resid_Mail, "Mail Slate") { {
	Slate { "Mail",	{
		_SlateGlobals_,
		_DefaultBase_,
		_TypeMailSlate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		_fixWindow,
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },
		Event { "page north", "" },		Keypress { kc_pageup, 0 },
		Event { "page top", "" },		Keypress { kc_home, 0 },
		Event { "page end", "" },		Keypress { kc_end, 0 },
		Event { "main frame", "" },		Click { 1, -20, -20, _window, _bottomRight },
		Event { "forward", "" },		Keypress { kc_tab, mf_option },
		Event { "back", "" },			Keypress { kc_tab, mf_option + mf_shift },
		Event { "filter", "" },			Click { 1, -50, 35, _window, _topRight },
		Event { "boxes", "" },			Sequence{}, Click { 1, -50, 35, _window, _topRight }, Keypress { kc_tab, 0 }, endSequence{},
		Event { "list", "" },			Sequence{}, Click { 1, -50, 35, _window, _topRight }, _tab, _tab, endSequence{},
		Event { "Mailbox", "" },		ResSubslate { resid_Mailbox },
		Event { "Sort", "" },			Sequence{}, ClickMenu { "View" }, _down, TypeText { "Sort by" }, _right, ResSubslate { resid_Sort }, endSequence{},
		Event { "Attachment", "" },		ResSubslate { resid_Attachments },
		Event { "MoveTo", "" },			Sequence{},
			ClickMenu { "Message" }, TypeText { "Move To" }, Keypress { kc_right, 0 },
			ResSubslate { resid_MoveTo },
			endSequence{},
		Event { "move again", "" },		Sequence{},
			ClickMenu { "Message" }, Keypress { kc_T, mf_command + mf_option },
			endSequence{},
		Event { "signature", "" },		Click { 1, -80, 205, _window, _topRight },
		Event { "browser", "google news" },		Sequence{}, Click { 1, -35, -20, _window, _bottomRight }, Keypress { kc_tab, mf_option + mf_shift }, _return, ResSubslate { resid_Browser }, endSequence{},
		Event { "Preferences", "" },	Sequence{}, Keypress { kc_comma, mf_command }, ResSubslate { resid_Preferences },  endSequence{},
		Event { "Menu", "access menus" },		Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Application", "" },	ClickMenu { "Mail" },
			ExitEvent { "File", "" }, 			ClickMenu { "File" },
			ExitEvent { "Edit", "" }, 			ClickMenu { "Edit" },
			ExitEvent { "View", "" }, 			ClickMenu { "View" },
			Event { "Mailbox", "" },	 		Sequence{}, CloseSubslate{}, ClickMenu { "Mailbox" }, ResSubslate { resid_menuMailbox }, endSequence{},
			ExitEvent { "Message", "" },	 	ClickMenu { "Message" },
			ExitEvent { "Format", "" }, 		ClickMenu { "Format" },
			ExitEvent { "Window", "" },			ClickMenu { "Window" },
			endSubslate{},
		Event { "row one", "" },		Click { 1, ROW_H, ROW_TOP+0*ROW_SP, _window, _topLeft },
		Event { "row two", "" },		Click { 1, ROW_H, ROW_TOP+1*ROW_SP, _window, _topLeft },
		Event { "row three", "" },		Click { 1, ROW_H, ROW_TOP+2*ROW_SP, _window, _topLeft },
		Event { "row four", "" },		Click { 1, ROW_H, ROW_TOP+3*ROW_SP, _window, _topLeft },
		Event { "row five", "" },		Click { 1, ROW_H, ROW_TOP+4*ROW_SP, _window, _topLeft },
		Event { "row six", "" },		Click { 1, ROW_H, ROW_TOP+5*ROW_SP, _window, _topLeft },
		Event { "row seven", "" },		Click { 1, ROW_H, ROW_TOP+6*ROW_SP, _window, _topLeft },
		Event { "row eight", "" },		Click { 1, ROW_H, ROW_TOP+7*ROW_SP, _window, _topLeft },
		Event { "row nine", "" },		Click { 1, ROW_H, ROW_TOP+8*ROW_SP, _window, _topLeft },
		Event { "row ten", "" },		Click { 1, ROW_H, ROW_TOP+9*ROW_SP, _window, _topLeft },
		Event { "row eleven", "" },		Click { 1, ROW_H, ROW_TOP+10*ROW_SP, _window, _topLeft },
		Event { "row twelve", "" },		Click { 1, ROW_H, ROW_TOP+11*ROW_SP, _window, _topLeft },
	} }
} };

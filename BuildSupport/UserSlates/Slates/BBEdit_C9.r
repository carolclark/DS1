// =================================================================================
//	BBEdit.r					(c)2005-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "Developer_C9.h"

#pragma mark === Markers ===
// 1 Windows; 3 Menus; 5 Documentation; 8 Type; 9 BBEdit

#pragma mark 0 ===
// #defined in CommonSlates_C9.h
//	#define resid_XCBBEdit					resid_BBEdit+1
	
// resid_
#pragma mark # Windows
#define resid_DocWindow					resid_BBEdit+10
	#define resid_Drawer					resid_DocWindow+1
	#define	resid_DrawerActions				resid_DocWindow+2

#define resid_Project					resid_BBEdit+20
	#define resid_ProjectActions			resid_Project+2
	#define resid_ProjectContents			resid_Project+1

#pragma mark # Menus
#define resid_FileMenu					resid_BBEdit+100
	#define resid_FileOpenDialog			resid_FileMenu+1
	#define resid_FileSaveDialog			resid_FileMenu+2
	#define resid_FileTemplate				resid_FileMenu+3

#define resid_EditMenu					resid_BBEdit+200
	#define	resid_Search					resid_EditMenu+1
	#define resid_Find						resid_EditMenu+2
	#define resid_FindMultiple				resid_EditMenu+3
	#define resid_SearchBrowser				resid_EditMenu+4
	#define resid_SearchPattern				resid_EditMenu+5
	#define resid_SelectCompare				resid_EditMenu+6
	#define resid_Clipboard					resid_EditMenu+7

#define resid_WindowBBEdit				resid_BBEdit+230

#define resid_Preferences				resid_BBEdit+250
	#define resid_prefsMenus				resid_Preferences+1

#pragma mark # Documentation
#define resid_Browser					resid_BBEdit+400

#define resid_Markup					resid_BBEdit+450
	#define resid_MakeTag					resid_Markup+1
	#define resid_EditTag					resid_Markup+2
	#define resid_teAnchor					resid_Markup+3
	#define resid_teList					resid_Markup+4

	#define resid_ValidateMarkup			resid_Markup+40
		#define resid_ContinueCheckTechnical	resid_Markup+41

#pragma mark # Scripting
#define resid_Script					resid_BBEdit+500
#define resid_Action					resid_BBEdit+550
	#define resid_Output					resid_Action+1
#define resid_Shell						resid_BBEdit+600
	#define resid_shellLs					resid_Shell+2

#pragma mark # Type
#define resid_TypeBBEditSlate			resid_BBEdit+800
	#define resid_Markers					resid_TypeBBEditSlate+1
	#define resid_Symbol					resid_TypeBBEditSlate+2
	#define resid_Doxygen					resid_TypeBBEditSlate+3
	#define resid_Macro						resid_TypeBBEditSlate+4
	#define resid_Placeholder				resid_TypeBBEditSlate+5
	#define resid_Document					resid_TypeBBEditSlate+6

#pragma mark #defines
#define _TypeBBEditSlate_ 	Event { "Type", "" },	ResSubslate { resid_TypeBBEditSlate }

#define _nextField		Keypress { kc_accent, mf_control }
#define _previousField	Keypress { kc_accent, mf_control + mf_shift }
#define _clickScriptsMenu	Click { 1, 628, 11, _screen, _topLeft }
#define _clickSvnMenu	Click { 1, 575, 11, _screen, _topLeft }
#define _NextPanel	Event { "next panel", "" },	Keypress { kc_tab, mf_control }
#define _PreviousPanel	Event { "previous panel", "" },	Keypress { kc_tab, mf_control + mf_shift }
#define _capitalize		Keypress { kc_C, mf_command + mf_shift + mf_option }
#define _lowercase		Keypress { kc_C, mf_command + mf_shift + mf_option }
#define	_selword		Sequence{}, Keypress { kc_right, 0 }, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, endSequence{}
#define	_selline		Keypress { kc_L, mf_command }

#define _BBEditStandards_		\
	_SlateGlobals_,                                                                                             \
	Event { "goto line", "" },			Keypress { kc_J, mf_command },                                          \
	Event { "File menu", "" },			ResSubslate { resid_FileMenu },							\
	Event { "go previous", "" },		Keypress { kc_bracket, mf_command + mf_option },		\
	Event { "go next", "" },			Keypress { kc_closebracket, mf_command + mf_option },	\
	Event { "next window", "" },		Keypress { kc_accent, mf_command },						\
	_DoJumpSubslate_,                                                                           \
	_DoSelectSubslate_,                                                                         \
	_JumpDownSubslate_,                                                                         \
	_JumpNorthSubslate_,                                                                        \
	_JumpLeftSubslate_,                                                                         \
	_JumpRightSubslate_

// _headerHt_	60 for fileSave, 0 for fileOpen
#define _FileDialogStandards_	\
	_SlateGlobals_,				\
	Event { "go to folder", "" },	ResSubslate { resid_GoToFolder },                        \
	ExitEvent { "exit", "" },		NilAction{},                                                \
	ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },                       \
	ExitEvent { "okay", "" },		_return,                                                    \
	Event { "location", "" },		Click { 1, 0, _headerHt_+40, _window, _topCenter },      \
	Event { "filter", "" },			Click { 1, 200, _headerHt_+40, _window, _topCenter },      \
	Event { "navigate", "" },		Sequence{}, Click { 1, 200, _headerHt_+40, _window, _topCenter },      \
		_tab, _tab, endSequence{},                                                            \
	Event { "go previous", "" },		Click { 1, -246, _headerHt_+44, _window, _topCenter },         \
	Event { "go forward", "" },		Click { 1, -220, _headerHt_+44, _window, _topCenter },      \
	Event { "icons", "" },			Keypress { kc_1, mf_command },					\
	Event { "list", "" },			Keypress { kc_2, mf_command },					\
	Event { "panel", "" },			Keypress { kc_3, mf_command },					\
	_DirectionKeys_,                                                                       \
	_CommandSlate_,                                                                        \
	_WhitespaceKeys_,                                                                      \
	_JumpNorthSubslate_,                                                                   \
	_JumpDownSubslate_,                                                                    \
	_IMouseSlate_,																		\
	_TypeBBEditSlate_

#define	_cutNextLine	_down, Keypress { kc_L, mf_command }, Keypress { kc_X, mf_command }

#pragma mark 1 === Windows

#define _DocumentWindowStandards_			\
	_SlateGlobals_,                                                                         \
	_CloseSubslate_,                                                                        \
	_DirectionKeys_,                                                                        \
	_WhitespaceKeys_,                                                                       \
	_TypeBBEditSlate_,                                                                      \
	_IMouseSlate_,                                                                          \
	Event { "click one", "" },		Click { 1, 0, 0, _cursor },                             \
	Event { "close document", "" },	Keypress { kc_W, mf_command },                          \
	Event { "options", "" },		Click { 1, dtools_x+85, 35, _window, _topLeft },        \
	Event { "File Path", "" },		Click { 1, dtools_x+212, 53, _window, _topLeft },       \
	Event { "Document", "" },		Keypress { kc_F, mf_option + mf_control },              \
	Event { "Markers", "" },		Keypress { kc_M, mf_option + mf_control },              \
	Event { "go previous", "" },		Keypress { kc_bracket, mf_command + mf_option },        \
	Event { "go forward", "" },		Keypress { kc_closebracket, mf_command + mf_option }

// main document toolbar
#define	dtools_x	263
#pragma mark DocWindow
resource restype_Slate (resid_DocWindow, "DocWindow") { {
	Slate { "Doc Window",	{
		ExitEvent { "Update", "" },		Keypress { kc_U, mf_command + mf_control },
		_DocumentWindowStandards_,
	} }
} };

#pragma mark Drawer
resource restype_Slate (resid_Drawer, "Drawer") { {
	Slate { "Drawer",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "select", "" },		_return,
		Event { "Actions", "" },		Sequence{}, Click { 1, 22, 43, _window, _topRight },
			ResSubslate { resid_DrawerActions }, endSequence{},
		Event { "Show", "" },			Click { 1, -20, 43, _window, _topRight },
		Event { "Hide", "" },			Click { 1, -20, 43, _window, _topRight },
		Event { "list", "" },			Click { 1, 15, -40, _window, _bottomRight },
		_LetterKeys_,
		_DirectionKeys_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
	} }
} };

resource restype_Slate (resid_DrawerActions, "Actions") { {
	Slate { "Actions",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Close Others", "" },	Sequence{}, TypeText { "Close Others" }, _return, endSequence{},
		ExitEvent { "Close", "" },			Sequence{}, TypeText { "Close" }, _return, endSequence{},	
		ExitEvent { "Save", "" },			Sequence{}, TypeText { "Save" }, _return, endSequence{},	
		ExitEvent { "New Window", "" },	Sequence{}, TypeText { "Move to New Window" }, _return, endSequence{},	
		ExitEvent { "Additional Window", "" },	Sequence{}, TypeText { "Open in Additional Window" }, _return, endSequence{},	
		_LetterKeys_,
		_DirectionKeys_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
	} }
} };

#pragma mark Project
// main document toolbar
#define	dtools_x	263
// project panel
#define _row1_v		47
#define _row1_h		35
#define _rsp		18
#define _csp		18	
#define _offset		24
#define _splitter_h	263

resource restype_Slate (resid_Project, "Project") { {
	Slate { "Project",		{
		_DocumentWindowStandards_,
		_CloseSubslate_,
		ExitEvent { "select", "" },		Click { 1, 0, 0, _cursor },
		ExitEvent { "open", "" },		Click { 2, 0, 0, _cursor },
		ExitEvent { "Support", "" },	Launch { Dev_"Support/SupportDocs.bbprojectd", 0 },
		ExitEvent { "Punkin", "" },		Launch { Dev_"Punkin/PunkinDocs.bbprojectd", 0 },
		ExitEvent { "Accessor", "" },	Launch { Dev_"Accessor/AccessorDocs.bbprojectd", 0 },
		Event { "close", "" },			Keypress { kc_W, mf_command + mf_shift },
		Event { "close top", "" },		Keypress { kc_W, mf_command },
		Event { "Actions", "" },		Sequence{}, Click { 1, 43, -11, _window, _bottomLeft }, _up, ResSubslate { resid_ProjectActions }, endSequence{},
		Event { "Subversion", "" },		Click { 1, 75, -9, _window, _bottomLeft },
		Event { "Contents", "" },		ResSubslate { resid_ProjectContents },
		Event { "row one", "" },		Click { 0, _row1_h, _row1_v+0*_rsp, _window, _topLeft },
		Event { "row two", "" },		Click { 0, _row1_h, _row1_v+1*_rsp, _window, _topLeft },
		Event { "row three ", "" },		Click { 0, _row1_h, _row1_v+2*_rsp, _window, _topLeft },
		Event { "row four", "" },		Click { 0, _row1_h, _row1_v+3*_rsp, _window, _topLeft },
		Event { "row five", "" },		Click { 0, _row1_h, _row1_v+4*_rsp, _window, _topLeft },
		Event { "row six", "" },		Click { 0, _row1_h, _row1_v+5*_rsp, _window, _topLeft },
		Event { "row seven", "" },		Click { 0, _row1_h, _row1_v+6*_rsp, _window, _topLeft },
		Event { "row eight", "" },		Click { 0, _row1_h, _row1_v+7*_rsp, _window, _topLeft },
		Event { "row nine", "" },		Click { 0, _row1_h, _row1_v+8*_rsp, _window, _topLeft },
		Event { "row ten", "" },		Click { 0, _row1_h, _row1_v+9*_rsp, _window, _topLeft },
		Event { "row eleven", "" },		Click { 0, _row1_h, _row1_v+10*_rsp, _window, _topLeft },
		Event { "row twelve", "" },		Click { 0, _row1_h, _row1_v+11*_rsp, _window, _topLeft },
		Event { "row thirteen", "" },	Click { 0, _row1_h, _row1_v+12*_rsp, _window, _topLeft },
		Event { "row fourteen", "" },	Click { 0, _row1_h, _row1_v+13*_rsp, _window, _topLeft },
		Event { "row fifteen", "" },	Click { 0, _row1_h, _row1_v+14*_rsp, _window, _topLeft },
		Event { "row sixteen", "" },	Click { 0, _row1_h, _row1_v+15*_rsp, _window, _topLeft },
		Event { "row seventeen", "" },	Click { 0, _row1_h, _row1_v+16*_rsp, _window, _topLeft },
		Event { "row eighteen", "" },	Click { 0, _row1_h, _row1_v+17*_rsp, _window, _topLeft },
		Event { "row nineteen", "" },	Click { 0, _row1_h, _row1_v+18*_rsp, _window, _topLeft },
		Event { "row twenty", "" },		Click { 0, _row1_h, _row1_v+19*_rsp, _window, _topLeft },
		Event { "row twenty one", "" },		Click { 0, _row1_h, _row1_v+20*_rsp, _window, _topLeft },
		Event { "row twenty two", "" },		Click { 0, _row1_h, _row1_v+21*_rsp, _window, _topLeft },
		Event { "row twenty three", "" },	Click { 0, _row1_h, _row1_v+22*_rsp, _window, _topLeft },
		Event { "row twenty four", "" },	Click { 0, _row1_h, _row1_v+23*_rsp, _window, _topLeft },
		Event { "row twenty five", "" },	Click { 0, _row1_h, _row1_v+24*_rsp, _window, _topLeft },
	} },
} };

#pragma mark ProjectActions
resource restype_Slate (resid_ProjectActions, "") { {
	Slate { "ProjectActions",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Add Items", "" },		Sequence{}, TypeText { "Add Items" }, _return, ResSubslate { resid_FileOpenDialog }, endSequence{},
		Event { "Add Collection", "" },	Sequence{}, TypeText { "Add Collection" }, _return, ResSubslate { resid_TypeBBEditSlate }, endSequence{},
		Event { "Rename", "" },			Sequence{}, TypeText { "Rename" }, _return, ResSubslate { resid_TypeBBEditSlate }, endSequence{},
		Event { "Remove", "" },			TypeText { "Remove" },
	} }
} };


#pragma mark Project Contents
resource restype_Slate (resid_ProjectContents, "Project Contents") { {
	Slate { "Contents",		{
		_SlateGlobals_,
		_CloseSubslate_,
		_IMouseSlate_,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "okay", "" },		Click { 1, 0, 0, _cursor },
		Event { "select", "" },			Click { 1, 0, 0, _cursor },
		Event { "escape", "" },			Keypress { kc_escape, 0 },
		Event { "home", "" },			Click { 0, _row1_h, _row1_v, _window, _topLeft },
		Event { "page top", "" },		Click { 1, _splitter_h-8, _row1_v+18, _window, _topLeft },
		Event { "open", "" },			Click { 1, -_offset, 0, _cursor },
		Event { "close", "" },			Click { 1, -_offset, 0, _cursor },
		Event { "north", "" },			Click { 0, 0, -_rsp, _cursor },
		Event { "down", "" },			Click { 0, 0, _rsp, _cursor },
		Event { "left", "" },			Click { 0, -_csp, 0, _cursor },
		Event { "right", "" },			Click { 0, _csp, 0, _cursor },
		Event { "do jump", "" },		Subslate { "do jump" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "down", "" },		Subslate { "down" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "one", "" },		Click { 0, 0, 1*_rsp, _cursor },
				ExitEvent { "two", "" },		Click { 0, 0, 2*_rsp, _cursor },
				ExitEvent { "three", "" },		Click { 0, 0, 3*_rsp, _cursor },
				ExitEvent { "four", "" },		Click { 0, 0, 4*_rsp, _cursor },
				ExitEvent { "five", "" },		Click { 0, 0, 5*_rsp, _cursor },
				ExitEvent { "six", "" },		Click { 0, 0, 6*_rsp, _cursor },
				ExitEvent { "seven", "" },		Click { 0, 0, 7*_rsp, _cursor },
				ExitEvent { "eight", "" },		Click { 0, 0, 8*_rsp, _cursor },
				ExitEvent { "nine", "" },		Click { 0, 0, 9*_rsp, _cursor },
				ExitEvent { "ten", "" },		Click { 0, 0, 10*_rsp, _cursor },
				ExitEvent { "twenty", "" },		Click { 0, 0, 20*_rsp, _cursor },
				ExitEvent { "forty", "" },		Click { 0, 0, 40*_rsp, _cursor },
				endSubslate{},
			Event { "north" , "" },			Subslate { "north" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "one", "" },		Click { 0, 0, -1*_rsp, _cursor },
				ExitEvent { "two", "" },		Click { 0, 0, -2*_rsp, _cursor },
				ExitEvent { "three", "" },		Click { 0, 0, -3*_rsp, _cursor },
				ExitEvent { "four", "" },		Click { 0, 0, -4*_rsp, _cursor },
				ExitEvent { "five", "" },		Click { 0, 0, -5*_rsp, _cursor },
				ExitEvent { "six", "" },		Click { 0, 0, -6*_rsp, _cursor },
				ExitEvent { "seven", "" },		Click { 0, 0, -7*_rsp, _cursor },
				ExitEvent { "eight", "" },		Click { 0, 0, -8*_rsp, _cursor },
				ExitEvent { "nine", "" },		Click { 0, 0, -9*_rsp, _cursor },
				ExitEvent { "ten", "" },		Click { 0, 0, -10*_rsp, _cursor },
				ExitEvent { "twenty", "" },		Click { 0, 0, -20*_rsp, _cursor },
				ExitEvent { "forty", "" },		Click { 0, 0, -40*_rsp, _cursor },
				endSubslate{},
			Event { "left", "" },			Click { 0, -_csp, 0, _cursor },
			Event { "right", "" },			Click { 0, _csp, 0, _cursor },
			endSubslate{},	
	} },
} };

#pragma mark 3 === Menus
#pragma mark -- File Menu
resource restype_Slate (resid_FileMenu, "File Menu") { {
	Slate { "File",		{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "New", "" },			Subslate { "New" },
			_SlateGlobals_,
			ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
			ExitEvent { "exit", "" },		NilAction{},
			ExitEvent { "okay", "" },		_return,
			Event { "Text", "" },			Keypress { kc_N, mf_command },
			Event { "Template", "" },		Sequence{}, Keypress { kc_N, mf_command + mf_control }, ResSubslate { resid_FileTemplate }, endSequence{},
			Event { "Window", "" },			Keypress { kc_N, mf_command + mf_shift },
			Event { "Project", "" },		Sequence{}, Keypress { kc_N, mf_command + mf_option + mf_shift }, ResSubslate { resid_FileSaveDialog }, endSequence{},
			Event { "Browser", "" },		Keypress { kc_N, mf_command + mf_option },
		endSubslate{},
		Event { "open", "" },				Sequence{}, Keypress { kc_O, mf_command }, ResSubslate { resid_FileOpenDialog },  endSequence{},
		ExitEvent { "open recent", "" },	Sequence{}, ClickMenu { "File" }, _down, TypeText { "Open Recent" }, _right, endSequence{},
		ExitEvent { "Revert", "" },			Keypress { kc_U, mf_command },
		Event { "Save", "" },				Sequence{}, Keypress { kc_S, mf_command }, ResSubslate { resid_FileSaveDialog }, endSequence{},
		ExitEvent { "Save Copy", "" },		Keypress { kc_S, mf_command + mf_option + mf_shift },
		ExitEvent { "Save All", "" },		Keypress { kc_S, mf_command + mf_option },
		ExitEvent { "Close Document", "" },	Keypress { kc_W, mf_command },
		ExitEvent { "Close Window", "" },	Keypress { kc_W, mf_command + mf_shift },
	} },
} };

#pragma mark File Dialogs
#define _headerHt_	0
resource restype_Slate (resid_FileOpenDialog, "File Open") { {
	Slate { "FileOpen",		{
		_FileDialogStandards_,
	} },
} };

#define _headerHt_ 	60
resource restype_Slate (resid_FileSaveDialog, "File Save") { {
	Slate { "FileSave",		{
		_FileDialogStandards_,
		Event { "paste", "" },			Keypress { kc_V, mf_command },
		Event { "markup", "" },			TypeText { ".html" },
		Event { "history", "" },		TypeText { "_hist" },
		Event { "versions", "" },		TypeText { "_vers" },
		Event { "new folder", "" },		Click { 1, -200, 375, _window, _topCenter },
	} },
} };

#pragma mark File > New > Markup
resource restype_Slate (resid_FileTemplate, "File > New > Markup") { {
	Slate { "File Template",			{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "okay", "" },		_return,
		Event { "template", "" },		Click { 1, 0, -57, _window, _bottomCenter },
		Event { "markup", "" },			TypeText { ".html" },
		Event { "history", "" },		TypeText { "_hist" },
		Event { "versions", "" },		TypeText { "_vers" },
		_DirectionKeys_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_JumpNorthSubslate_,
		_JumpDownSubslate_,
		_IMouseSlate_,
		_TypeBBEditSlate_,
	} },
} };

#pragma mark -- Edit
#pragma mark Find
#define _SearchStandards_		\
		_SlateGlobals_,			\
		_CloseSubslate_,		\
		ExitEvent { "close", "" },			Keypress { kc_period, mf_command },			\
		ExitEvent { "exit", "" },			NilAction{},			\
		Event { "cancel", "" },				Keypress { kc_period, mf_command },			\
		Event { "search for", "" },			Click { 1, 0, 60, _window, _topCenter },	\
		Event { "replace", "" },			Click { 1, 0, 125, _window, _topCenter },		\
		_TypeBBEditSlate_,		\
		_CommandSlate_,			\
		_IMouseSlate_,			\
		Event { "case sensitive", "" },	Click { 1, 85, _MatchingRow, _window, _topLeft },	\
		Event { "entire word", "" },	Click { 1, 195, _MatchingRow, _window, _topLeft },	\
		Event { "use grep", "" },		Click { 1, 290, _MatchingRow, _window, _topLeft },	\
		Event { "recent patterns", "" },	Sequence{},                           \
			Click { 1, 0-_PatternFromRight, 50, _window, _topRight },      \
			ResSubslate { resid_SearchPattern }, endSequence{},          \
		Event { "saved patterns", "" },			Sequence{},                            \
			Click { 1, 0-_PatternFromRight, 75, _window, _topRight },      \
			ResSubslate { resid_SearchPattern }, endSequence{}

#pragma mark Search
resource restype_Slate (resid_Search, "Search") { {
	Slate { "Search", {
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeBBEditSlate_,
		_DirectionKeys_,
		ExitEvent { "close", "" },				Keypress { kc_W, mf_command },
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_option },
		Event { "find again", "" },				Keypress { kc_G, mf_command },
		Event { "find previous", "" },			Keypress { kc_G, mf_command + mf_shift },
		Event { "change", "" },					Keypress { kc_equal, mf_command },
		Event { "change again", "" },			Keypress { kc_equal, mf_command + mf_shift},
		Event { "next panel", "" },				Keypress { kc_tab, mf_control },
		Event { "save", "" },					Keypress { kc_S, mf_command },
		Event { "find", "find" },				Sequence{}, Keypress { kc_F, mf_command },
			ResSubslate { resid_Find }, endSequence{},
		Event { "multiple", "" },				Sequence{},
			Keypress { kc_f, mf_command + mf_shift }, ResSubslate { resid_FindMultiple },
			endSequence{},
		Event { "compare", "" },				Sequence{}, ClickMenu { "Search" },
			Keypress { kc_down, 0 },
			TypeText { "Find Differences" }, Keypress { kc_return, 0 },
			ResSubslate { resid_SelectCompare }, endSequence{},
		Event { "compare disk", "" },	Sequence{}, ClickMenu { "Search" }, Keypress { kc_down, 0 }, TypeText { "Compare Against Disk File" }, Keypress { kc_return, 0 }, endSequence{},
		Event { "compare front", "" },	Sequence{}, ClickMenu { "Search" }, Keypress { kc_down, 0 }, TypeText { "Compare Two Front Documents" }, Keypress { kc_return, 0 }, endSequence{},
	} }
} };

#pragma mark Find
#define _MatchingRow		155
#define _PatternFromRight	150
resource restype_Slate (resid_Find, "Find") { {
	Slate { "Find", {
		_SearchStandards_,
		_SlateGlobals_,
		Event { "selection only", "" },		Click { 1, 85, _MatchingRow+20, _window, _topLeft },
		Event { "wrap around", "" },		Click { 1, 245, _MatchingRow+20, _window, _topLeft },
		ExitEvent { "Find", "" },			Click { 1, 580, 50, _window, _topLeft },
		ExitEvent { "Previous", "" },		Click { 1, 580, 77, _window, _topLeft },
		ExitEvent { "Find All", "" },		Click { 1, 580, 95, _window, _topLeft },
		ExitEvent { "Change", "" },			Click { 1, 580, 128, _window, _topLeft },
		ExitEvent { "Change All", "" },		Click { 0, 580, 150, _window, _topLeft },
		ExitEvent { "Change Again", "" },	Click { 1, 580, 177, _window, _topLeft },
	} }
} };

#pragma mark FindMultiple
#define _MatchingRow		230
#define _PatternFromRight	128
resource restype_Slate (resid_FindMultiple, "Multiple") { {
	Slate { "Multiple", {
		_SearchStandards_,
		Event { "Find All", "" },		Sequence{}, Click { 1, -64, 46, _window, _topRight },
			ResSubslate { resid_SearchBrowser }, endSequence{},
		Event { "Change All", "" },		Sequence{}, Click { 0, -64, 70, _window, _topRight },
			ResSubslate { resid_SearchBrowser }, endSequence{},
		Event { "search in", "" },		Sequence{}, Click { 1, 0, 25, _window, _centerCenter },
			ResSubslate { resid_TypeBBEditSlate }, endSequence{},
		Event { "other", "" },			Sequence{}, Click { 1, -65, -40, _window, _centerRight },
			ResSubslate { resid_FileOpenDialog }, endSequence{},
		Event { "options", "" },		Click { 1, -65, -5, _window, _centerRight },
		Event { "save set", "" },		Click { 1, -65, 20, _window, _centerRight },
	} }
} };

#pragma mark SearchBrowser
resource restype_Slate (resid_SearchBrowser, "Browser") { {
	Slate { "Browser", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
		_DirectionKeys_,
		_WhitespaceKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_DoJumpSubslate_,
		_NextPanel,
		_PreviousPanel,
		Event { "find again", "" },			Keypress { kc_G, mf_command },
		Event { "change", "" },				Keypress { kc_equal, mf_command },
		Event { "change again", "" },		Keypress { kc_equal, mf_command + mf_shift},
		_TypeBBEditSlate_,
	} }
} };

#pragma mark SearchPattern
resource restype_Slate (resid_SearchPattern, "Pattern") { {
	Slate { "Pattern", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		_return,
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		_DirectionKeys_,
		_DoJumpSubslate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
	} }
} };

#pragma mark Select Compare
resource restype_Slate (resid_SelectCompare, "SelectCompare") { {
	Slate { "Select Compare", {
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "okay", "" },		_return,
		ExitEvent { "exit", "" },		NilAction{},
		_TypeBBEditSlate_,
		_CommandSlate_,
		_IMouseSlate_,
		Event { "Files", "" },			Click { 1, 120, 45, _window, _topLeft },
		Event { "Folders", "" },		Click { 1, 290, 45, _window, _topLeft },
		Event { "New Other", "" },		Sequence{}, Click { 1, -65, 110, _window, _topRight },
			ResSubslate { resid_FileOpenDialog }, endSequence{},
		Event { "Old Other", "" },		Sequence{}, Click { 1, -65, 195, _window, _topRight },
			ResSubslate { resid_FileOpenDialog }, endSequence{},
		Event { "Compare", "" },		Keypress { kc_return, 0 },
	} }
} };

#pragma mark Clipboard
resource restype_Slate (resid_Clipboard, "Clipboard") { {
	Slate { "Clipboard",		{
		_SlateGlobals_,
		ExitEvent { "okay", "" },	NilAction{},
		ExitEvent { "close", "" },	Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },	NilAction{},
		Event { "show", "" },		Sequence{}, ClickMenu { "Edit" }, TypeText { "Show Clipboard" },
			_return, endSequence{},
		Event { "previous", "" },	Keypress { kc_bracket, mf_control },
		Event { "next", "" },		Keypress { kc_closebracket, mf_control },
		Event { "paste", "" },		Keypress { kc_V, mf_command },
	} },
} };

#pragma mark -- Window
resource restype_Slate (resid_WindowBBEdit, "BBEdit Window Slate") { {
	Slate { "Window",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_WindowItems_,
		ExitEvent { "drawer", "" },			Click { 1, -20, 45, _window, _topRight },
		ExitEvent { "save default", "" },	Sequence{}, ClickMenu { "Window" },
			TypeText { "Save Default Window" },	_return, endSequence{},
	} }
} };

#pragma mark -- Preferences
#define _SelectPrefsList_	Click { 1, 20, -20, _window, _bottomLeft }
resource restype_Slate (resid_Preferences, "Preferences") { {
	Slate { "Preferences",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "close", "" },	Keypress { kc_W, mf_command },
		_IMouseSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_LetterKeys_,
		Event { "select", "" },		_SelectPrefsList_,
		Event { "menus", "" },		Sequence{}, TypeText { "Menus" }, _tab,
			ResSubslate { resid_prefsMenus }, endSequence{},
	} }
} };

#pragma mark prefsMenus
resource restype_Slate (resid_prefsMenus, "Menus") { {
	Slate { "MenuKeys",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },	_SelectPrefsList_,
		_IMouseSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_LetterKeys_,
		Event { "set", "" },			Click { 1, -80, 115, _window, _topRight },
		Event { "clear", "" },			Click { 1, -80, 150, _window, _topRight },
		Event { "allow repeat", "" },	Click { 1, 215, 410, _window, _topLeft },
		ExitEvent { "save", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
	} }
} };

#pragma mark 5 === Documentation
#pragma mark Browser
	#define	_BrowseCdocResID_	resid_Browser
	#define _mainFrame_h		0
	#define _mainFrame_v		75
	#define _homeApp			MainApps_"BBEdit.app"
_BrowseCdocSlate_

#pragma mark Markup
resource restype_Slate (resid_Markup, "Markup Menu") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		Event { "Make Tag", "" },			Sequence{},
			ResSubslate { resid_MakeTag },
			Keypress { kc_M, mf_command },
			endSequence{},
		Event { "Edit Tag", "" },			Sequence{},
			ResSubslate { resid_EditTag },
			Keypress { kc_M, mf_command + mf_option },
			endSequence{},
		Event { "List Dialog", "" },		Sequence{}, Keypress { kc_L, mf_command + mf_control },
			ResSubslate { resid_teList }, endSequence{},
	} }
} };

#pragma mark MakeTag
resource restype_Slate (resid_MakeTag, "Make Tag") { {
	Slate { "Tag",	{
		_SlateGlobals_,
		_LetterKeys_,
		ExitEvent { "cancel", "" },			Keypress { kc_period, mf_command },
		ExitEvent { "insert", "" },			Keypress { kc_return, 0 },
	} }
} };

#pragma mark EditTag
resource restype_Slate (resid_EditTag, "Edit Tag") { {
	Slate { "EditTag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "anchor", "" },			ResSubslate { resid_teAnchor },
		ExitEvent { "List", "" },			ResSubslate { resid_teList },
	} }
} };

#pragma mark Anchor
resource restype_Slate (resid_teAnchor, "Anchor Dialog") { {
	Slate { "Anchor",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeBBEditSlate_,
		Event { "File", "" },				Sequence{},
			ResSubslate { resid_TypeBBEditSlate },
			Click { 1, 127, 113, _window, _topLeft },
			endSequence{},
		ExitEvent { "cancel", "" },			Keypress { kc_period, mf_command },
		ExitEvent { "apply", "" },			Keypress { kc_return, 0 },
	} }
} };

#pragma mark List
resource restype_Slate (resid_teList, "List Dialog") { {
	Slate { "List",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeBBEditSlate_,
		Event { "File", "" },				Sequence{},
			ResSubslate { resid_TypeBBEditSlate },
			Click { 1, 127, 113, _window, _topLeft },
			endSequence{},
		ExitEvent { "cancel", "" },			Keypress { kc_period, mf_command },
		ExitEvent { "apply", "" },			Keypress { kc_return, 0 },
	} }
} };

#pragma mark Validate Markup
#define _techSite_	"~/Library/CCDev/Sites/TechnicalDocs/"
resource restype_Slate (resid_ValidateMarkup, "Validate Markup") { {
	Slate { "Validate",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },	_return,
		ExitEvent { "close", "" },	Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },	NilAction{},
		_CommandSlate_,
		_IMouseSlate_,
		_TypeBBEditSlate_,
		_WhitespaceKeys_,
		_DirectionKeys_,
		_NextPanel,
		_PreviousPanel,
		Event { "technical", "" },	 Sequence{}, _clickScriptsMenu, _down, TypeText { "CheckSyntax" }, _return,
			ResSubslate { resid_ContinueCheckTechnical }, endSequence{},
	} }
} };

resource restype_Slate (resid_ContinueCheckTechnical, "continue check links") { {
	Slate { "continue",	{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		_return,
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "continue", "" },	Sequence{}, _return, _clickScriptsMenu, _down, TypeText { "CheckLinks" }, _return, endSequence{},
	} }
} };

#pragma mark 7 === Scripting
#pragma mark Script
resource restype_Slate (resid_Script, "script menu") { {
	Slate { "Script",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },					Keypress { kc_escape, 0 },
		ExitEvent { "set markers", "" },			Sequence{}, TypeText { "SetMarkers" }, _return, endSequence{},
	} }
} };

#pragma mark Action
resource restype_Slate (resid_Action, "scripts and other actions") { {
	Slate { "Action",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },	Keypress { kc_escape, 0 },
		Event { "run", "" },		Sequence{}, ClickMenu { "Window" }, _right, _down, TypeText { "Run" }, _return, ResSubslate { resid_Output }, endSequence{},
	} }
} };

#pragma mark Output
resource restype_Slate (resid_Output, "") { {		// not a Subslate (what did that mean?)
	Slate { "Output",	{
		_SlateGlobals_,
		Event { "okay", "" },			Sequence{}, Launch { MainApps_"BBEdit.app", resid_BBEdit }, Keypress { kc_accent, mf_command }, endSequence{},
		Event { "close", "" },			Sequence{}, Launch { MainApps_"BBEdit.app", resid_BBEdit }, Keypress { kc_W, mf_command }, endSequence{},
		Event { "exit", "" },			Launch { MainApps_"BBEdit.app", resid_BBEdit },
		Event { "clear window", "" },	Sequence{}, Keypress { kc_A, mf_command }, Keypress { kc_delete, 0 }, endSequence{},
		Event { "undo", "" },			Keypress { kc_Z, mf_command },
	} }
} };

#pragma mark -- Shell
resource restype_Slate (resid_Shell, "Shell Worksheet") { {
	Slate { "Shell",	{
		_CloseSubslate_,
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
		_BBEditStandards_,
		Event { "execute", "" },			Keypress { kc_return, mf_command },
		Event { "next field", "" },			Keypress { kc_accent, mf_control },
		Event { "previous field", "" },		Keypress { kc_accent, mf_control + mf_shift },
		Event { "select word", "" },		Sequence{}, Keypress { kc_left, mf_option },
			Keypress { kc_right, mf_option + mf_shift }, endSequence{},
		Event { "select line", "" },		Keypress { kc_L, mf_command },
		Event { "clipboard", "" },			ResSubslate { resid_Clipboard },
		Event { "status line", "use status line to provide file argument" },	Sequence{},
			Keypress { kc_left, mf_command }, _right, _right, _right, _right, Keypress { kc_left, mf_command + mf_shift }, _delete, endSequence{},
		Event { "set directory", "" },		TypeText { "cd  " },
		Event { "project", "" },			Subslate { "project" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },		TypeText { "${DEV}/Support" },
			ExitEvent { "Punkin", "" },			TypeText { "${DEV}/Punkin" },
			ExitEvent { "Accessor", "" },		TypeText { "${DEV}/Accessor" },
			endSubslate{},
		Event { "list", "" },				Sequence{}, TypeText { "ls  " }, ResSubslate { resid_shellLs }, endSequence{},
		Event { "directory", "" },			TypeText { "pwd" },
		Event { "pop out", "" },			TypeText { "cd ../" },
		Event { "BBEdit", "" },				TypeText { "bbedit " },
		Event { "change permissions", "" },	TypeText { "chmod " },
		Event { "make executable", "" },	TypeText { "chmod a+x " },
		Event { "iWeb directory", "" },		TypeText { "a+rx " },
		Event { "iWeb file", "" },			TypeText { "a-x,a+r " },
		Event { "undo", "" },				Keypress { kc_Z, mf_command },
		_TypeSlateItems_,
		_CommandSlate_,
	} }
} };

resource restype_Slate (resid_shellLs, "ls") { {
	Slate { "ls",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "okay", "" },			NilAction{},
		ExitEvent { "execute", "" },		Keypress { kc_return, mf_command },
		Event { "undo", "" },				Keypress { kc_Z, mf_command },
		Event { "all", "" },				TypeText { "-a " },
		Event { "long", "" },				TypeText { "-l " },
		Event { "recursive", "" },			TypeText { "-R " },
		_TypeBBEditSlate_,
		_CommandSlate_,
	} }
} };

#pragma mark 8 === Type
#pragma mark Popups
#define _Markers_	\
	Event { "markers", "" },		Sequence{},	Keypress { kc_M, mf_option + mf_control }, 		\
		ResSubslate { resid_Markers }, endSequence{}

#define _Symbol_	\
	Event { "symbol", "" },		Sequence{},	Click { 1, 30, 75, _window, _topCenter }, 		\
		ResSubslate { resid_Symbol }, endSequence{}

#define _PopupStandards_	\
		_SlateGlobals_,		\
		ExitEvent { "okay", "" },		NilAction{}, 								\
		ExitEvent { "go", "" },			Keypress { kc_return, 0 },                             	\
		ExitEvent { "cancel", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, \
			endSequence{},     																	\
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_escape, 0 }, CloseSubslate{}, \
			endSequence{},       																\
		ExitEvent { "exit", "" },		CloseSubslate{},										\
		Event { "page top", "" },		Keypress { kc_home, 0 },								\
		Event { "page end", "" },		Keypress { kc_end, 0 },                                 \
		Event { "page north", "" },		Keypress { kc_pageup, 0 },                              \
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },                            \
		_JumpDownSubslate_,                     \
		_JumpNorthSubslate_,                    \
		_DoJumpSubslate_,                       \
		_DirectionKeys_,                        \
		_LetterKeys_,                           \
		_NumberKeys_

resource restype_Slate (resid_Markers, "") { {
	Slate { "Markers", {
		_PopupStandards_,
	} }
} };

resource restype_Slate (resid_Symbol, "") { {
	Slate { "Symbol", {
		_PopupStandards_,
	} }
} };

#define _insertTab	Keypress { kc_tab, 0 }
#pragma mark Doxygen
resource restype_Slate (resid_Doxygen, "Doxygen") { {
	Slate { "Doxygen", {
		_DoxygenItems_
	} }
} };

#pragma mark Macro
resource restype_Slate (resid_Macro, "") { {
	Slate { "Macro",	{
		Event { "one", "temp" },				Sequence{},
			TypeText { "_insert_row, " },
			endSequence{},
		Event { "two", "temp" },				Sequence{},
			Keypress { kc_left, mf_command }, TypeText { "//" }, Keypress { kc_left, mf_command }, _down,
			endSequence{},
		Event { "three", "temp" },				Sequence{},
			Keypress { kc_C, mf_command }, _right, Keypress { kc_comma, 0 }, _return,
			Keypress { kc_V, mf_command + mf_option + mf_shift }, _up, Keypress { kc_M, mf_command }, _left,
			Keypress { kc_G, mf_command }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
			_left, Keypress { kc_O, mf_control }, TypeText { "YES" },
			endSequence{},
		Event { "four", "temp" },				Sequence{},
			_right, _down, _down,
			endSequence{},
		Event { "five", "temp" },				Sequence{},
			Keypress { kc_M, mf_command }, _right, _down,
			endSequence{},
		Event { "six", "temp" },				Sequence{},
			Keypress { kc_left, mf_command }, _down, _down, _down, _down,
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, _right, Keypress { kc_O, mf_control },
			endSequence{},
		_DevMacroItems_,
	} }
} };

#pragma mark Placeholder
resource restype_Slate (resid_Placeholder, "BBEdit Placeholders") { {
	Slate { "Placeholder",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "base name", "" },		TypeText { "#BASENAME#" },
		ExitEvent { "user name", "" },		TypeText { "#USERNAME#" },
		ExitEvent { "date time", "" },		Sequence{}, TypeText { "#DATETIME <##>#" },
			Keypress { kc_accent, mf_control + mf_shift }, endSequence{},
	} }
} };

resource restype_Slate (resid_Document, "") { {
	Slate { "Document", {
		_PopupStandards_,
		ExitEvent { "Support", "" },	Subslate { "Support" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "support", "" },	Sequence{}, TypeText { "Support.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "Support_hist" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "Support_vers" }, _return, endSequence{},
			ExitEvent { "development", "" },Sequence{}, TypeText { "Development.html" }, _return, endSequence{},
			ExitEvent { "top history", "" },	Sequence{}, TypeText { "Development_hist" }, _return, endSequence{},
			ExitEvent { "git", "" },	Sequence{}, TypeText { "Git.html" }, _return, endSequence{},
			ExitEvent { "Cdoc", "" },	Sequence{}, TypeText { "Cdoc" }, _return, endSequence{},
			ExitEvent { "tools", "" },	Sequence{}, TypeText { "Tools" }, _return, endSequence{},
			ExitEvent { "subversion config", "" },	Sequence{}, TypeText { "subversion_config" }, _return, endSequence{},
			ExitEvent { "apache errors", "" },	Sequence{}, TypeText { "/opt/local/apache2/logs/error_log" }, _return, endSequence{},
			ExitEvent { "apache access", "" },	Sequence{}, TypeText { "/opt/local/apache2/logs/access_log" }, _return, endSequence{},
			ExitEvent { "apache config", "" },	Sequence{}, TypeText { "/opt/local/apache2/conf/httpd.conf" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "old Support", "" },	Subslate { "old Support" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "support", "" },	Sequence{}, TypeText { "Support.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "Support_hist" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "Support_vers" }, _return, endSequence{},
			ExitEvent { "development", "" },Sequence{}, TypeText { "Development.html" }, _return, endSequence{},
			ExitEvent { "top history", "" },	Sequence{}, TypeText { "Development_hist" }, _return, endSequence{},
			ExitEvent { "tools	", "" },	Sequence{}, TypeText { "Tools" }, _return, endSequence{},
			ExitEvent { "subversion config", "" },	Sequence{}, TypeText { "subversion_config" }, _return, endSequence{},
			ExitEvent { "apache errors", "" },	Sequence{}, TypeText { "/opt/local/apache2/logs/error_log" }, _return, endSequence{},
			ExitEvent { "apache access", "" },	Sequence{}, TypeText { "/opt/local/apache2/logs/access_log" }, _return, endSequence{},
			ExitEvent { "apache config", "" },	Sequence{}, TypeText { "/opt/local/apache2/conf/httpd.conf" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Punkin", "" },	Subslate { "Punkin" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Punkin", "" },	Sequence{}, TypeText { "Punkin.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "Punkin_hist" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "Punkin_vers" }, _return, endSequence{},
			ExitEvent { "Agenda", "" },	Sequence{}, TypeText { "Agenda" }, _return, endSequence{},
			ExitEvent { "User Interface", "" },	Sequence{}, TypeText { "UserInterface" }, _return, endSequence{},
			ExitEvent { "glossary", "" },	Sequence{}, TypeText { "Punkin_gloss" }, _return, endSequence{},
			ExitEvent { "Expenses", "" },	Sequence{}, TypeText { "PunkinExpenses" }, _return, endSequence{},
			ExitEvent { "Technology", "" },	Sequence{}, TypeText { "Technology" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Web Gen", "" },	Subslate { "WebGen" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Web Gen", "" },	Sequence{}, TypeText { "WebGen.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "WebGen_hist" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "WebGen_vers" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Personal", "" },	Subslate { "Personal" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Site", "" },	Sequence{}, TypeText { "PersonalSite.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "PersonalSite_vers" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "DevSupport", "" },	Subslate { "DevSupport" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "history", "" },	Sequence{}, TypeText { "DevSupport_hist" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "DevSupport_vers" }, _return, endSequence{},
			ExitEvent { "development", "" },Sequence{}, TypeText { "Development.html" }, _return, endSequence{},
			ExitEvent { "top history", "" },	Sequence{}, TypeText { "Development_hist" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Carbon", "" },		Subslate { "Carbon" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "history", "" },	Sequence{}, TypeText { "Accessor_C9_hist" }, _return, endSequence{},
			ExitEvent { "BBEdit", "" },	Sequence{}, TypeText { "BBEdit" }, _return, endSequence{},
			ExitEvent { "Terminal", "" },	Sequence{}, TypeText { "Terminal" }, _return, endSequence{},
			ExitEvent { "Xcode", "" },	Sequence{}, TypeText { "Xcode" }, _return, endSequence{},
			ExitEvent { "Mail", "" },	Sequence{}, TypeText { "Mail" }, _return, endSequence{},
			endSubslate{},
	} }
} };

#define _closeDocument				Keypress { kc_W, mf_command }
#define _TypeBBEditItems_	\
	Event { "goto line", "" },		Keypress { kc_J, mf_command },	\
	Event { "select word", "" },	_selword,		\
	Event { "select line", "" },	_selline,		\
	Event { "capitalize", "" },		_capitalize,	\
	Event { "lower case", "" },		_lowercase,		\
	Event { "balance", "" },		Keypress { kc_M, 0 },	\
	Event { "paste", "" },			Keypress { kc_V, mf_command + mf_option + mf_shift },	\
	Event { "clipboard", "" },		ResSubslate { resid_Clipboard },		\
	Event { "Clipping", "" },		Keypress { kc_C, mf_command + mf_option + mf_control },		\
	Event { "Markup", "" },			ResSubslate { resid_Markup },	\
	_TypeDevItems_

#pragma mark TypeBBEdit
resource restype_Slate (resid_TypeBBEditSlate, "Type Slate") { {
	Slate { "Type",	{
		_TypeDevSlateItems_,
		Event { "Doxygen", "" },				ResSubslate { resid_Doxygen },
		Event { "Macro", "" },					ResSubslate { resid_Macro },
		Event { "Placeholder", "" },			ResSubslate { resid_Placeholder },
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "save files", "" },				Keypress { kc_S, mf_command + mf_option },
		Event { "show selection", "" },			Keypress { kc_D, mf_command + mf_option + mf_shift },
		_NextPanel,
		_PreviousPanel,
		Event { "document", "" },		Sequence{},	Keypress { kc_F, mf_option + mf_control }, ResSubslate { resid_Document }, endSequence{},
		Event { "symbol", "" },			Sequence{},	Click { 1, 30, 75, _window, _topCenter }, ResSubslate { resid_Symbol }, endSequence{},
		_TypeBBEditItems_,
	} }
} };

#pragma mark 9 === BBEdit
#define	_BBEditItems_			\
		_TypeBBEditSlate_,		\
		Event { "save files", "" },			Keypress { kc_S, mf_command + mf_option },		\
		Event { "Menu", "access menus" },	Subslate { "Menu" },	\
			_SlateGlobals_,		\
			_CloseSubslate_,	\
			Event { "File", "" }, 	Sequence{}, ClickMenu { "File" }, ResSubslate { resid_FileMenu }, endSequence{},	\
			ExitEvent { "Text", "" }, ClickMenu { "Text" },			\
			ExitEvent { "View", "" }, ClickMenu { "View" },			\
			ExitEvent { "Search", "" }, ClickMenu { "Search" },		\
			ExitEvent { "Tools", "" }, ClickMenu { "Tools" },		\
			ExitEvent { "Markup", "" }, ClickMenu { "Markup" },		\
			ExitEvent { "Window", "" }, ClickMenu { "Window" },		\
			ExitEvent { "Help", "" }, ClickMenu { "Help" },			\
			endSubslate{},		\
		_NextPanel,				\
		_PreviousPanel,			\
		_Markers_,				\
		_Symbol_,				\
		Event { "Contents", "" },	ResSubslate { resid_ProjectContents },	\
		Event { "Project", "" },	ResSubslate { resid_Project },		\
		Event { "Browser", "" },	Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},		\
		Event { "Validate", "" },	ResSubslate { resid_ValidateMarkup },		\
		Event { "Search", "" },		ResSubslate { resid_Search },		\
		Event { "Doc Window", "" },	ResSubslate { resid_DocWindow },	\
		Event { "Script", "" },		Sequence{}, _clickScriptsMenu, _down, ResSubslate { resid_Script }, endSequence{},		\
		Event { "Action", "" },			ResSubslate { resid_Action }


resource restype_Slate (resid_BBEdit, "BBEdit Slate") { {
	Slate { "BBEdit",	{
		_SlateGlobals_,
		_DefaultBase_,
		_BBEditItems_
	} }
} };

resource restype_Slate (resid_XCBBEdit, "XcodeBBEdit Slate") { {
	Slate { "BBEdit",	{
		_SlateGlobals_,
		_DefaultBase_,
		_BBEditItems_,
		ExitEvent { "close", "" },	Keypress { kc_Q, mf_command },
		ExitEvent { "save back", "" }, Sequence{}, Keypress { kc_S, mf_command + mf_option }, Launch { DevApps_"XCode.app", resid_Xcode }, endSequence{},
		Event { "okay", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
	} }
} };

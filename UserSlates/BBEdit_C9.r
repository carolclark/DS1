// =================================================================================
//	BBEdit.r					�2005-11 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark 0 ===
// #defined in CommonSlates_C9.h
//	#define resid_BBEdit_External			resid_BBEdit+1
	
// resid_
#define resid_WindowBBEdit				resid_BBEdit+10

#define resid_Browser					resid_BBEdit+12

#define resid_TypeBBEditSlate			resid_BBEdit+20
	#define resid_TypeSpecialBBEdit			resid_TypeBBEditSlate+1
	#define resid_Dictate					resid_TypeBBEditSlate+2
	#define resid_Macro						resid_TypeBBEditSlate+3
	#define resid_Snippet					resid_TypeBBEditSlate+4
	#define resid_Placeholder				resid_TypeBBEditSlate+5

	#define resid_Document					resid_TypeBBEditSlate+10
	#define resid_Markers					resid_TypeBBEditSlate+11
	#define resid_Symbol					resid_TypeBBEditSlate+12
	#define resid_GoFile					resid_TypeBBEditSlate+13

#define resid_Shell						resid_BBEdit+40
	#define resid_shellSvn					resid_Shell+1
	#define resid_shellLs					resid_Shell+2

#define resid_Preferences				resid_BBEdit+50
	#define resid_prefsMenus				resid_Preferences+1

#define resid_Subversion				resid_BBEdit+60
	#define resid_Commit					resid_Subversion+1
	#define resid_DoCommit					resid_Subversion+2
	#define resid_svnStatus					resid_Subversion+3
	#define resid_svnSelect					resid_Subversion+4
	#define resid_Differences				resid_Subversion+5
	#define resid_SelectCompare				resid_Subversion+6

#define resid_DocWindow					resid_BBEdit+70
	#define resid_Drawer					resid_DocWindow+1
	#define	resid_DrawerActions				resid_DocWindow+2

#define resid_Project					resid_BBEdit+80
	#define resid_ProjectContents			resid_Project+1

#define resid_FileMenu					resid_BBEdit+200
	#define resid_FileOpenDialog			resid_FileMenu+1
	#define resid_FileSaveDialog			resid_FileMenu+2
	#define resid_FileNew					resid_FileMenu+3
	#define resid_FileTemplate				resid_FileMenu+4

#define resid_EditMenu					resid_BBEdit+300
	#define	resid_Search					resid_EditMenu+1
	#define resid_Find						resid_EditMenu+2
	#define resid_FindMultiple				resid_EditMenu+3
	#define resid_SearchBrowser				resid_EditMenu+4
	#define resid_SearchPattern				resid_EditMenu+5
	#define resid_Clipboard					resid_EditMenu+6


#define resid_Markup					resid_BBEdit+400
	#define resid_MakeTag					resid_Markup+1
	#define resid_EditTag					resid_Markup+2
	#define resid_teAnchor					resid_Markup+3
	#define resid_teList					resid_Markup+4

	#define resid_ValidateMarkup			resid_Markup+40
		#define resid_ContinueCheckAll			resid_ValidateMarkup+41
		#define resid_ContinueCheckProject		resid_ValidateMarkup+42

	#define resid_InsertElement				resid_Markup+50
	#define resid_InsertStyle				resid_Markup+51

#define resid_Script					resid_BBEdit+500
#define resid_Action					resid_BBEdit+550
	#define resid_Output					resid_Action+1

#define resid_BBTerminal				resid_BBEdit+570
/*
#define resid_Build						resid_Terminal+1
	#define resid_Archive					resid_Terminal+2
	#define resid_OldBuild					resid_Terminal+9
*/

//#define	resid_Dictate					resid_BBEdit+900
#define resid_MoviePlayer				resid_BBEdit+950

#pragma mark #define
#define _next		Keypress { kc_accent, mf_control }
#define _previous	Keypress { kc_accent, mf_control + mf_shift }	
#define _clickScriptsMenu	Click { 1, 628, 11, _screen, _topLeft }
#define _clickSvnMenu	Click { 1, 575, 11, _screen, _topLeft }
#define _NextPanel	Event { "next panel", "" },	Keypress { kc_tab, mf_control }
#define _PreviousPanel	Event { "previous panel", "" },	Keypress { kc_tab, mf_control + mf_shift }

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

#pragma mark Browser
	#define	_BrowseCdocResID_	resid_Browser
	#define _mainFrame_h		0
	#define _mainFrame_v		75
	#define _homeApp			MainApps_"BBEdit.app"
_BrowseCdocSlate_

#pragma mark Type =
#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialBBEdit, "Type Special BBEdit Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "define", "" },			TypeText { "#define" },
		ExitEvent { "resource id", "" },	TypeText { "resid_" },
		ExitEvent { "end event", "" },		Sequence{},
			_quote, TypeText { ", " }, _quote, _quote, Keypress { kc_space, 0 },
			Keypress { kc_closebracket, mf_shift }, Keypress { kc_comma, 0 }, 
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "in use development", "" },	TypeText
			{ "in-use development" },
		ExitEvent { "pragma mark", "" },	TypeText { "#pragma mark " },
		ExitEvent { "mark spot", "" },		TypeText { "<##>" },
	} }
} };


#pragma mark 1 === Dictate
#pragma mark Dictate
resource restype_Slate (resid_Dictate, "Dictate") { {
	Slate { "Dictate",	{
		_SlateGlobals_,
		ExitEvent { "okay", "" },			NilAction{},
		ExitEvent { "go back", "" },		Launch { MainApps_"BBEdit.app", 0 },
		ExitEvent { "cut back", "" },		Sequence{}, Keypress { kc_A, mf_command }, Keypress { kc_X, mf_command }, 
			Launch { MainApps_"BBEdit.app", 0 }, endSequence{},
		Event { "microphone off", "and hide recognition window" }, _CloseRecognitionWindow_,
		Event { "microphone on", "" },
			Sequence{}, Click { 1, -230, 74, _screen, _topRight }, ResSubslate { resid_DictateSlate },
			endSequence{},
		Event { "recognition window", "" },	_CloseRecognitionWindow_,
		Event { "new window", "" },			Keypress { kc_N, mf_command },
		Event { "go to sleep", "" },		NilAction{},
	} }
} };

#pragma mark Popups
#define _Document_	\
	Event { "document", "" },	Sequence{},	Keypress { kc_F, mf_option + mf_control },		\
		ResSubslate { resid_Document }, endSequence{},										\
	Event { "doc list", "" },	Sequence{},	Keypress { kc_F, mf_option + mf_control },		\
		ResSubslate { resid_Document }, endSequence{}

#define _GoFile_	\
	Event { "go file", "" },	Sequence{},	Keypress { kc_D, mf_command },		\
		ResSubslate { resid_GoFile }, endSequence{}

#define _Markers_	\
	Event { "markers", "" },		Sequence{},	Keypress { kc_M, mf_option + mf_control }, 		\
		ResSubslate { resid_Markers }, endSequence{}

#define _Symbol_	\
	Event { "symbol", "" },		Sequence{},	Click { 1, 30, 75, _window, _topCenter }, 		\
		ResSubslate { resid_Symbol }, endSequence{}

#define _PopupStandards_	\
		_SlateGlobals_,		\
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 }, 								\
		ExitEvent { "return", "" },		Keypress { kc_return, 0 },                             	\
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

#pragma mark 1 === Files and Documents
resource restype_Slate (resid_GoFile, "") { {
	Slate { "go File", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "return", "" },		_return,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "Support", "" },	Subslate { "Support" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "support", "" },	Sequence{}, TypeText { "~/Dev/Support/Cdoc/Support.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "~/Dev/Support/Cdoc/Support_hist.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "~/Dev/Support/Cdoc/Support_vers.html" }, _return, endSequence{},
			ExitEvent { "development", "" },Sequence{}, TypeText { "~/Dev/Support/Cdoc/Development.html" }, _return, endSequence{},
			ExitEvent { "top history", "" },	Sequence{}, TypeText { "~/Dev/Support/Cdoc/Development_hist.html" }, _return, endSequence{},
			ExitEvent { "Git", "" },		Sequence{}, TypeText { "~/Dev/Support/Cdoc/Git.html" }, _return, endSequence{},
			ExitEvent { "C doc", "" },		Sequence{}, TypeText { "~/Dev/Support/Cdoc/Cdoc.html" }, _return, endSequence{},
			ExitEvent { "Tools", "" },		Sequence{}, TypeText { "~/Dev/Support/Cdoc/Tools.html" }, _return, endSequence{},
			ExitEvent { "apache access", "" },		Sequence{}, TypeText { "/opt/local/apache2/logs/access_log" }, _return, endSequence{},
			ExitEvent { "apache errors", "" },		Sequence{}, TypeText { "/opt/local/apache2/logs/error_log" }, _return, endSequence{},
			ExitEvent { "apache config", "" },		Sequence{}, TypeText { "/opt/local/apache2/conf/httpd.conf" }, _return, endSequence{},
			ExitEvent { "Glossary", "" },	Sequence{}, TypeText { "~/Dev/Support/Cdoc/Support_gloss.html" }, _return, endSequence{},
			ExitEvent { "subversion config", "" },	Sequence{}, TypeText { "~/Dev/Support/CCDev/Environment/subversion_config.txt" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "old Support", "" },	Subslate { "old Support" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "support", "" },	Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Support.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Support_hist.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Support_vers.html" }, _return, endSequence{},
			ExitEvent { "development", "" },Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Development.html" }, _return, endSequence{},
			ExitEvent { "top history", "" },	Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Development_hist.html" }, _return, endSequence{},
			ExitEvent { "C doc", "" },		Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Cdoc.html" }, _return, endSequence{},
			ExitEvent { "Tools", "" },		Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Tools.html" }, _return, endSequence{},
			ExitEvent { "apache access", "" },		Sequence{}, TypeText { "/opt/local/apache2/logs/access_log" }, _return, endSequence{},
			ExitEvent { "apache errors", "" },		Sequence{}, TypeText { "/opt/local/apache2/logs/error_log" }, _return, endSequence{},
			ExitEvent { "apache config", "" },		Sequence{}, TypeText { "/opt/local/apache2/conf/httpd.conf" }, _return, endSequence{},
			ExitEvent { "Glossary", "" },	Sequence{}, TypeText { "~/Dev/Support_svn/Cdoc/Support_gloss.html" }, _return, endSequence{},
			ExitEvent { "subversion config", "" },	Sequence{}, TypeText { "~/Dev/Support_svn/CCDev/Environment/subversion_config.txt" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Punkin", "" },	Subslate { "Punkin" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Punkin", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/Punkin.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/Punkin_hist.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/Punkin_vers.html" }, _return, endSequence{},
			ExitEvent { "Agenda", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/Agenda.html" }, _return, endSequence{},
			ExitEvent { "User Interface", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/UserInterface.html" }, _return, endSequence{},
			ExitEvent { "Glossary", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/Punkin_gloss.html" }, _return, endSequence{},
			ExitEvent { "Expenses", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/PunkinExpenses.html" }, _return, endSequence{},
			ExitEvent { "Technology", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/Technology.html" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Web Gen", "" },	Subslate { "WebGen" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Web Gen", "" },	Sequence{}, TypeText { "~/Dev/WebGen/Cdoc/WebGen.html" }, _return, endSequence{},
			ExitEvent { "history", "" },	Sequence{}, TypeText { "~/Dev/WebGen/Cdoc/WebGen_hist.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "~/Dev/WebGen/Cdoc/WebGen_vers.html" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Personal", "" },	Subslate { "Personal" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Site", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/PersonalSite.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "~/Dev/Punkin/Cdoc/PersonalSite_vers.html" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "DevSupport", "" },	Subslate { "DevSupport" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "history", "" },	Sequence{}, TypeText { "~/Dev/DevSupport/cdocsrc/Tech/DevSupport_hist_s.html" }, _return, endSequence{},
			ExitEvent { "versions", "" },	Sequence{}, TypeText { "~/Dev/DevSupport/cdocsrc/Tech/DevSupport_vers_s.html" }, _return, endSequence{},
			ExitEvent { "development", "" },Sequence{}, TypeText { "~/Dev/DevSupport/cdocsrc/Tech/Development_s.html" }, _return, endSequence{},
			ExitEvent { "top history", "" },	Sequence{}, TypeText { "~/Dev/DevSupport/cdocsrc/Tech/Development_hist	" }, _return, endSequence{},
			endSubslate{},
		ExitEvent { "Carbon", "" },		Subslate { "Carbon" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "history", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/cdocsrc/Tech/Accessor_C9_hist_s.html" }, _return, endSequence{},
			ExitEvent { "BBEdit", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/Accessor_C9/UserSlates/BBEdit_C9.r" }, _return, endSequence{},
			ExitEvent { "Xcode", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/Accessor_C9/UserSlates/Xcode_C9.r" }, _return, endSequence{},
			ExitEvent { "Terminal", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/Accessor_C9/UserSlates/Terminal_C9.r" }, _return, endSequence{},
			ExitEvent { "Mail", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/Accessor_C9/UserSlates/Mail_C9.r" }, _return, endSequence{},
			ExitEvent { "Common Slates", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/Accessor_C9/UserSlates/CommonSlates_C9.r" }, _return, endSequence{},
			ExitEvent { "Common interface", "" },	Sequence{}, TypeText { "~/Dev/Accessor_C9/Accessor_C9/UserSlates/CommonSlates_C9.h" }, _return, endSequence{},
			endSubslate{},
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

#pragma mark Type
#define	_completionItems				\
	Event { "choose two", "" }, _down,	\
	Event { "choose three", "" }, Sequence{}, _down, _down, endSequence{},			\
	Event { "choose four", "" }, Sequence{}, _down, _down, _down, endSequence{},	\
	Event { "choose five", "" }, Sequence{}, _down, _down, _down, _down, endSequence{},			\
	Event { "choose six", "" }, Sequence{}, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose seven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, endSequence{},			\
	Event { "choose eight", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose nine", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},			\
	Event { "choose ten", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose eleven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},			\
	Event { "choose twelve", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},	\
	Event { "choose thirteen", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{}

resource restype_Slate (resid_TypeBBEditSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DoJumpSubslate_,
		_DoSelectSubslate_,
		_JumpDownSubslate_,
		_JumpNorthSubslate_,
		_JumpLeftSubslate_,
		_JumpRightSubslate_,
		Event { "dictate", "" },		Sequence{},
			Launch { MainApps_"Dragon Dictate.app", 0 }, ResSubslate { resid_Dictate }, endSequence{},
		Event { "clipboard", "" },		ResSubslate { resid_Clipboard },
		Event { "Clipping", "" },		Keypress { kc_C, mf_command + mf_option + mf_control },
		Event { "Placeholder", "" },	ResSubslate { resid_Placeholder },
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialBBEdit },
		Event { "undo", "" },			Keypress { kc_Z, mf_command },
		Event { "insert tag", "" },		ResSubslate { resid_Markup }, 
		Event { "element", "" },		ResSubslate { resid_InsertElement }, 
		Event { "insert element", "" },	ResSubslate { resid_InsertElement }, 
		Event { "add style", "" },		ResSubslate { resid_InsertStyle }, 
		Event { "list item", "" },		Sequence{}, TypeText { "<li><#item#></li>" }, _previous, endSequence{},
		Event { "select word", "" },	Sequence{}, Keypress { kc_left, mf_option },
			Keypress { kc_right, mf_option + mf_shift }, endSequence{},
		Event { "select line", "" },	Keypress { kc_L, mf_command },
		Event { "select paragraph", "" },	Keypress { kc_L, mf_command + mf_option },
		_NextPanel,
		_PreviousPanel,
		Event { "next field", "" },		Keypress { kc_accent, mf_control },
		Event { "previous field", "" },	Keypress { kc_accent, mf_control + mf_shift },
		_Document_,
		_GoFile_,
		_Markers_,
		_Symbol_,
		Event { "go previous", "" },	Keypress { kc_bracket, mf_command + mf_option },
		Event { "go forward", "" },		Keypress { kc_closebracket, mf_command + mf_option },
		Event { "goto line", "" },		Keypress { kc_J, mf_command },
		Event { "scroll down", "" },	Keypress { kc_down, mf_control + mf_command + mf_option },
		Event { "scroll north", "" },	Keypress { kc_up, mf_control + mf_command + mf_option },
		Event { "next window", "" },	Keypress { kc_accent, mf_command },
		Event { "previous window", "" }, Keypress { kc_accent, mf_command + mf_shift },
		Event { "enter find string", "" },		Keypress { kc_E, mf_command },
		Event { "enter replace string", "" },	Keypress { kc_E, mf_command + mf_option },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "Snippet", "" },		ResSubslate { resid_Snippet },
		Event { "complete", "" },		Keypress { kc_fn5, 0 },
		Event { "add space", "" },		Sequence{}, Keypress { kc_return, 0 },
			Keypress { kc_space, 0 }, endSequence{},
		Event { "add comma", "" },		Sequence{}, Keypress { kc_return, 0 },
			Keypress { kc_comma, 0 }, endSequence{},
		Event { "add brace", "" },		Sequence{}, Keypress { kc_return, 0 },
			Keypress { kc_bracket, mf_shift }, endSequence{},
		_completionItems,
		_TypeSlateItems_,
	} }
} };

#pragma mark _TypeBBEditSlate_
#define _TypeBBEditSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeBBEditSlate }

#pragma mark 2 === Preferences
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

#pragma mark 3 === Subversion
#define subversionMenu_		Click { 1, 590, 10, _screen, _topLeft }
resource restype_Slate (resid_Subversion, "BBEdit Subversion Menu") { {
	Slate { "Subversion",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "exit", "" },		NilAction{},
		_WhitespaceKeys_,
		Event { "select", "" },			Sequence{}, 
			_space, ResSubslate { resid_svnSelect }, endSequence{},
		Event { "status", "" },			Sequence{}, Keypress { kc_S, mf_option + mf_control },
			ResSubslate { resid_svnStatus }, endSequence{},
		Event { "difference", "" },		Sequence{}, Keypress { kc_D, mf_option + mf_control },
			ResSubslate { resid_Differences }, endSequence{},
		Event { "commit", "" },			Sequence{},
			ResSubslate { resid_Commit }, Keypress { kc_C, mf_option + mf_control }, endSequence{},
		Event { "update", "" },			Sequence{}, subversionMenu_, TypeText { "Update Working Copy" },
			_return, endSequence{},
		Event { "history", "" },		Sequence{}, subversionMenu_, TypeText { "Show Revision History" },
			_return, endSequence{},
	} }
} };

#pragma mark Status
resource restype_Slate (resid_svnStatus, "Status") { {
	Slate { "Status", {
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		ExitEvent { "okay", "" },		NilAction{},
		_DirectionKeys_,
		_DoJumpSubslate_,
		_CommandSlate_,
		_IMouseSlate_,
		_TypeBBEditSlate_,
		Event { "return", "" },			_return,
		Event { "show", "" },			_return,
		Event { "select", "" },			Sequence{}, 
			_space, ResSubslate { resid_svnSelect }, endSequence{},
		Event { "compare", "" },		_return,
		Event { "commit", "" },			Sequence{},
			ResSubslate { resid_Commit }, Keypress { kc_C, mf_option + mf_control }, endSequence{},
		Event { "next panel", "" },		Keypress { kc_tab, mf_control },
		Event { "difference", "" },		Sequence{}, Keypress { kc_D, mf_option + mf_control },
			ResSubslate { resid_Differences }, endSequence{},
		Event { "save", "" },			Keypress { kc_S, mf_command },
		Event { "add to repository", "" },	Sequence{}, _clickSvnMenu,
			TypeText { "add" },	_return, endSequence{},
	} }
} };

#pragma mark SelectStatus
resource restype_Slate (resid_svnSelect, "Select") { {
	Slate { "Select", {
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "select", "" },		_return,
		_TypeProjectName_,
		Event { "okay", "" },			_return,
		Event { "return", "" },			_return,
		_DirectionKeys_,
		_CommandSlate_,
		_IMouseSlate_,
		_TypeBBEditSlate_,
	} }
} };

#pragma mark Differences
resource restype_Slate (resid_Differences, "Differences") { {
	Slate { "Diff", {
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
		ExitEvent { "okay", "" },		NilAction{},
		ExitEvent { "close", "" },		Keypress { kc_W, mf_command },
		Event { "return", "" },			_return,
		Event { "compare", "" },		_return,
		_DirectionKeys_,
		_CommandSlate_,
		_IMouseSlate_,
		_TypeBBEditSlate_,
		Event { "differences", "" },	Click { 1, -100, -245, _screen, _bottomCenter },
		Event { "fix window", "" },		Sequence{}, Click { 0, -5, -5, _window, _bottomRight },
			Click { -1, 0, -60, _cursor }, endSequence{},
		Event { "refresh", "" },		Click { 1, 0, 40, _window, _topCenter },
		Event { "apply left", "" },		Keypress { kc_left, mf_command },
		Event { "apply right", "" },	Keypress { kc_right, mf_command },
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
		Event { "Compare", "" },		Sequence{}, Keypress { kc_return, 0 },
			ResSubslate { resid_Differences }, endSequence{},
	} }
} };

#pragma mark Commit
resource restype_Slate (resid_Commit, "BBEdit Subversion Commit") { {
	Slate { "Commit",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		Event { "commit", "" },			Sequence{}, ResSubslate { resid_DoCommit },
			Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "cancel", "" },		Keypress { kc_period, mf_command },
	} }
} };

resource restype_Slate (resid_DoCommit, "complete Subversion Commit") { {
	Slate { "do",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeBBEditSlate_,
		Event { "clipboard", "" },			ResSubslate { resid_Clipboard },
		Event { "paste", "" },				Keypress { kc_V, mf_command },
		Event { "strike", "" },				Keypress { kc_delete, 0 },
		Event { "type", "" },				ResSubslate { resid_TypeBBEditSlate },
		ExitEvent { "commit", "" },			Click { 1, -40, 40, _window, _topRight },
		ExitEvent { "cancel", "" },			Click { 1, -120, 40, _window, _topRight },
	} }
} };

#pragma mark 4 === Shell
resource restype_Slate (resid_Shell, "Shell Worksheet") { {
	Slate { "Shell",	{
		_CloseSubslate_,
		ExitEvent { "close", "" },			Keypress { kc_W, mf_command },
		_BBEditStandards_,
		Event { "execute", "" },			Keypress { kc_return, mf_command },
		Event { "next field", "" },			Keypress { kc_accent, mf_control },
		Event { "previous field", "" },		Keypress { kc_accent, mf_control + mf_shift },
		Event { "Special", "" }, 			ResSubslate { resid_TypeSpecialBBEdit },
		Event { "element", "" },			ResSubslate { resid_InsertElement }, 
		Event { "insert element", "" },		ResSubslate { resid_InsertElement }, 
		Event { "select word", "" },		Sequence{}, Keypress { kc_left, mf_option },
			Keypress { kc_right, mf_option + mf_shift }, endSequence{},
		Event { "select line", "" },		Keypress { kc_L, mf_command },
		Event { "clipboard", "" },			ResSubslate { resid_Clipboard },
		Event { "status line", "use status line to provide file argument" },	Sequence{},
			Keypress { kc_left, mf_command }, _right, _right, _right, _right, Keypress { kc_left, mf_command + mf_shift }, _delete, endSequence{},
		Event { "subversion", "" },			Sequence{}, TypeText { "svn " }, ResSubslate { resid_shellSvn }, endSequence{},
		Event { "edit subversion", "" },	ResSubslate { resid_shellSvn },
		Event { "set directory", "" },		TypeText { "cd  " },
		Event { "project", "" },			Subslate { "project" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },		TypeText { "~/Dev/Support" },
			ExitEvent { "Punkin", "" },			TypeText { "~/Dev/Punkin" },
			ExitEvent { "WebGen", "" },			TypeText { "~/Dev/WebGen" },
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
		_completionItems,
		_TypeSlateItems_,
		_CommandSlate_,
	} }
} };

resource restype_Slate (resid_shellSvn, "svn") { {
	Slate { "svn",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "okay", "" },				NilAction{},
		ExitEvent { "execute", "" },			Keypress { kc_return, mf_command },
		Event { "next field", "" },				Keypress { kc_accent, mf_control },
		Event { "previous field", "" },			Keypress { kc_accent, mf_control + mf_shift },
		Event { "Special", "" }, 				ResSubslate { resid_TypeSpecialBBEdit },
		Event { "subversion", "" },				TypeText { "svn " },
		Event { "undo", "" },					Keypress { kc_Z, mf_command },
		Event { "status", "" },					TypeText { "status " },
		Event { "list", "" },					TypeText { "list " },
		Event { "remove", "" },					TypeText { "remove " },
		Event { "show branch", "" },			TypeText { "info | grep URL" },
		Event { "revert", "" },					TypeText { "revert " },
		Event { "add to repository", "" },		Sequence{}, _delete, _delete, _delete, _delete,
				TypeText { "/Users/carolclark/CCDev/bin/svnAddToRepository " },
				endSequence{},
		Event { "remove from repository", "" },	TypeText { "remove " },
		Event { "make directory", "" },			TypeText { "mkdir " },
		Event { "move or rename", "" },			TypeText { "move " },
		Event { "show updates", "" },			TypeText { "--show-updates" },
		Event { "recursive", "" },				TypeText { "--recursive " },
		Event { "nonrecursive", "" },			TypeText { "--non-recursive " },
		Event { "verbose", "" },				TypeText { "--verbose " },
		Event { "repository", "" },				TypeText { "file:///Users/carolclark/Dev/svnrep/" },
		Event { "trunk", "" },					TypeText { "/trunk " },
		Event { "property", "" },				Subslate { "prop" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "undo", "" },			Keypress { kc_Z, mf_command },
			Event { "get", "" },			TypeText { "propget " },
			Event { "set", "" },			TypeText { "propset " },
			Event { "set folder", "" },		Sequence{}, _delete, _delete, _delete, _delete,
				TypeText { "/Users/carolclark/CCDev/bin/svnSetFolderProps " },
				endSequence{},
			Event { "show all", "" },		Sequence{}, _delete, _delete, _delete, _delete,
				TypeText { "/Users/carolclark/CCDev/bin/svnShowProperties " },
				endSequence{},
			Event { "ignore", "" },			TypeText { "svn:ignore " },
			Event { "line ends", "" },		TypeText { "svn:eol-style " },
			Event { "native", "" },			TypeText { "native " },
			Event { "mime type", "" },		TypeText { "svn:mime-type " },
			Event { "markup", "" },			TypeText { "text/html " },
			Event { "XML", "" },			TypeText { "text/xml " },
			Event { "plain text", "" },		TypeText { "text/plain " },
			Event { "keywords", "" },		TypeText { "svn:keywords " },
			Event { "ID", "" },				TypeText { "Id " },
			Event { "executable", "" },		TypeText { "svn:executable " },
			Event { "on", "" },				TypeText { "* " },
			Event { "off", "" },			TypeText { "\"\" " },
			_TypeBBEditSlate_,
			endSubslate{},
		_TypeProjectName_,
		_TypeBBEditSlate_,
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

#pragma mark 5 === Document Windows

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
#define _row1_v		94
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
		ExitEvent { "Top", "" },			Launch { Dev_"Support/Top.bbprojectd", 0 },
		ExitEvent { "old Support", "" },	Launch { Dev_"Support_svn/Support_svn.bbprojectd", 0 },
		ExitEvent { "Support", "" },		Launch { Dev_"Support/Support.bbprojectd", 0 },
		ExitEvent { "Punkin", "" },			Launch { Dev_"Punkin/Punkin.bbprojectd", 0 },
		ExitEvent { "Web Gen", "" },		Launch { Dev_"WebGen/WebGen.bbprojectd", 0 },
		ExitEvent { "Dev Support", "" },	Launch { Dev_"DevSupport/DevSupport.bbprojectd", 0 },
		ExitEvent { "Carbon", "" },			Launch { Dev_"Accessor_C9/Accessor_C9.bbprojectd", 0 },
		ExitEvent { "Try 2", "" },			Launch { Dev_"Koala_Try2/Koala_Try2.bbprojectd", 0 },
		ExitEvent { "Try 1", "" },			Launch { Dev_"Koala_Try1/Koala_Try1.bbprojectd", 0 },
		ExitEvent { "My Library", "" },		Launch { Dev_"MyLibrary/MyLibrary.bbprojectd", 0 },
		ExitEvent { "Prototype", "" },		Launch { Dev_"ArbonneProto/ArbonneProto.bbprojectd", 0 },
		Event { "Drawer", "" },			ResSubslate { resid_Drawer },
		Event { "close", "" },			Keypress { kc_W, mf_command + mf_shift },
		Event { "close top", "" },		Keypress { kc_W, mf_command },
		Event { "open Xcode", "" },		Sequence{}, Click { 2, 0, 0, _cursor }, 
			Launch { "/Developer/Applications/XCode.app", resid_Xcode }, endSequence{},
		Event { "Add Items", "" },		Sequence{}, Click { 1, 22, 44, _window, _topLeft },
			ResSubslate { resid_FileOpenDialog }, endSequence{},
		Event { "Add Collection", "" },	Sequence{}, Click { 1, 70, 44, _window, _topLeft },
			ResSubslate { resid_TypeBBEditSlate }, endSequence{},
		Event { "Rename", "" },			Sequence{}, Click { 1, 118, 44, _window, _topLeft },
			ResSubslate { resid_TypeBBEditSlate }, endSequence{},
		Event { "Remove", "" },			Click { 0, 146, 44, _window, _topLeft },
		Event { "Actions", "" },		Click { 1, 43, -9, _window, _bottomLeft },
		Event { "Subversion", "" },		Click { 1, 75, -9, _window, _bottomLeft },
		Event { "Contents", "" },		ResSubslate { resid_ProjectContents },
		ExitEvent { "FileMaker", "" },		Launch { Dev_"ArbonneFM/ArbonneFM.bbprojectd", 0 },
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

#pragma mark 7 === Menus
#pragma mark File Menu
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
		ExitEvent { "Revert", "" },		Keypress { kc_U, mf_command },
		Event { "Save", "" },			Sequence{}, Keypress { kc_S, mf_command }, ResSubslate { resid_FileSaveDialog }, endSequence{},
		ExitEvent { "Save Copy", "" },	Keypress { kc_S, mf_command + mf_option + mf_shift },
		ExitEvent { "Save All", "" },	Keypress { kc_S, mf_command + mf_option },
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
		Event { "compare disk", "" },	Sequence{}, ClickMenu { "Search" },
			Keypress { kc_down, 0 },
			TypeText { "Compare Against Disk File" }, Keypress { kc_return, 0 }, 
			ResSubslate { resid_Differences }, endSequence{},
		Event { "compare front", "" },	Sequence{}, ClickMenu { "Search" },
			Keypress { kc_down, 0 },
			TypeText { "Compare Two Front Documents" }, Keypress { kc_return, 0 }, 
			ResSubslate { resid_Differences }, endSequence{},
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

#pragma mark Window
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

#pragma mark 8 === Markup
#pragma mark InsertElement
resource restype_Slate (resid_InsertElement, "") { {
	Slate { "Element",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "snippet", "" },				Sequence{},
			TypeText { "@snippet <#name#>; <#params...#>" }, _return, _up, _next, endSequence{},
		_ElementItems_,
	} }
} };

#pragma mark Styles
resource restype_Slate (resid_InsertStyle, "css Styles") { {
	Slate { "Style",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_StyleItems_,
	} }
} };

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
		_TagItems_,
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
#define _techSite_	"~/CCDev/Sites/TechnicalDocs/"
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
		Event { "project", "" },	 Sequence{}, _clickScriptsMenu, _down,
			TypeText { "ValidateHTML" }, _right, TypeText { "CheckSyntaxProject" }, _return,
			ResSubslate { resid_ContinueCheckProject }, endSequence{},
		Event { "all", "" },	 Sequence{}, _clickScriptsMenu, _down,
			TypeText { "ValidateHTML" }, _right, TypeText { "CheckSyntaxAll" }, _return,
			ResSubslate { resid_ContinueCheckAll }, endSequence{},
	} }
} };

resource restype_Slate (resid_ContinueCheckAll, "resid_ContinueCheckAll") { {
	Slate { "Continue",	{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		NilAction{},
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "continue", "" },	Sequence{}, _return, _clickScriptsMenu, _down,
			TypeText { "ValidateHTML" }, _right, TypeText { "CheckLinksAll" }, _return,
			endSequence{},
	} }
} };

resource restype_Slate (resid_ContinueCheckProject, "resid_ContinueCheckProject") { {
	Slate { "Continue",	{
		_SlateGlobals_,
		ExitEvent { "cancel", "" },		_return,
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "continue", "" },	Sequence{}, _return, _clickScriptsMenu, _down,
			TypeText { "ValidateHTML" }, _right, TypeText { "CheckLinksProject" }, _return,
			endSequence{},
	} }
} };

#pragma mark 9 ===
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

#pragma mark Action
resource restype_Slate (resid_Action, "scripts and other actions") { {
	Slate { "Action",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },	Keypress { kc_escape, 0 },
		Event { "run", "" },		Sequence{}, ClickMenu { "Window" }, _right, _down, TypeText { "Run" }, _return, ResSubslate { resid_Output }, endSequence{},
	} }
} };

#pragma mark Terminal
resource restype_Slate (resid_BBTerminal, "terminal support") { {
	Slate { "Terminal",	{
		_SlateGlobals_,
		_TerminalItems_,
		ExitEvent { "quit", "" },	Keypress { kc_Q, mf_command },
		Event { "okay", "" },		Launch { MainApps_"BBEdit.app", 0 },
	} }
} };

/*
#define goBack_		Event { "go back", "" },	Launch { MainApps_"BBEdit.app", resid_BBEdit }
#pragma mark Build
resource restype_Slate (resid_Build, "") { {
	Slate { "Build",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },	Keypress { kc_C, mf_control },
		Event { "execute", "" },	Keypress { kc_return, 0 },
		goBack_,
		Event { "Support", "" },	Sequence{}, TypeText { "Support" }, Keypress { kc_enter, 0 }, endSequence{}, 
		Event { "Punkin", "" },		Sequence{}, TypeText { "Punkin" }, Keypress { kc_enter, 0 }, endSequence{},	
		Event { "Web Gen", "" },	Sequence{}, TypeText { "WebGen" }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "one", "" },	Sequence{}, Keypress { kc_1, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "two", "" },	Sequence{}, Keypress { kc_2, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "three", "" },	Sequence{}, Keypress { kc_3, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "four", "" },	Sequence{}, Keypress { kc_4, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "five", "" },	Sequence{}, Keypress { kc_5, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "six", "" },	Sequence{}, Keypress { kc_6, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "seven", "" },	Sequence{}, Keypress { kc_7, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		ExitEvent { "eight", "" },	Sequence{}, Keypress { kc_8, 0 }, Keypress { kc_enter, 0 }, endSequence{},
	} }
} };

#pragma mark Archive
resource restype_Slate (resid_Archive, "") { {
	Slate { "Archive",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },	Keypress { kc_C, mf_control },
		ExitEvent { "execute", "" },	Keypress { kc_return, 0 },
		goBack_,
		Event { "project", "" },		TypeText { "project " },
		Event { "to retire", "" },		TypeText { "toRetire " },
		Event { "repositories", "" },	TypeText { "repositories " },
		_TypeProjectName_,
	} }
} };

#pragma mark Old Build
resource restype_Slate (resid_OldBuild, "") { {		// not a Subslate
	Slate { "Old Build",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "cancel", "" },		Keypress { kc_C, mf_control },
		Event { "build", "" },		Sequence{}, TypeText { "build.uia" }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "one", "" },		Sequence{}, Keypress { kc_1, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "two", "" },		Sequence{}, Keypress { kc_2, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "three", "" },		Sequence{}, Keypress { kc_3, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "four", "" },		Sequence{}, Keypress { kc_4, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "five", "" },		Sequence{}, Keypress { kc_5, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "six", "" },		Sequence{}, Keypress { kc_6, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "seven", "" },		Sequence{}, Keypress { kc_7, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "eight", "" },		Sequence{}, Keypress { kc_8, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "nine", "" },		Sequence{}, Keypress { kc_9, 0 }, Keypress { kc_enter, 0 }, endSequence{},
		Event { "ten", "" },		Sequence{}, Keypress { kc_1, 0 }, Keypress { kc_0, 0 }, Keypress { kc_enter, 0 }, endSequence{},
	} }
} };
*/

#pragma mark Output
resource restype_Slate (resid_Output, "") { {		// not a Subslate
	Slate { "Output",	{
		_SlateGlobals_,
		Event { "okay", "" },			Sequence{}, Launch { MainApps_"BBEdit.app", resid_BBEdit }, Keypress { kc_accent, mf_command }, endSequence{},
		Event { "close", "" },			Sequence{}, Launch { MainApps_"BBEdit.app", resid_BBEdit }, Keypress { kc_W, mf_command }, endSequence{},
		Event { "exit", "" },			Launch { MainApps_"BBEdit.app", resid_BBEdit },
		Event { "clear window", "" },	Sequence{}, Keypress { kc_A, mf_command }, Keypress { kc_delete, 0 }, endSequence{},
		Event { "undo", "" },			Keypress { kc_Z, mf_command },
	} }
} };

#pragma mark Script
resource restype_Slate (resid_Script, "script menu") { {
	Slate { "Script",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" },					Keypress { kc_escape, 0 },
		ExitEvent { "set markers", "" },			Sequence{}, TypeText { "SetMarkers" }, _return, endSequence{},
		ExitEvent { "open with Finder", "" },		Sequence{}, TypeText { "OpenWithFinder" }, _return, endSequence{},
		ExitEvent { "build dox", "" },				Sequence{}, TypeText { "BuildDocumentation" }, _return, endSequence{},
		ExitEvent { "build BBEdit", "" },			Sequence{}, TypeText { "BuildBBEdit" }, _return, endSequence{},
		ExitEvent { "Snippet", "" },				Sequence{}, TypeText { "Snippet" }, _return, endSequence{},
		ExitEvent { "View in Browser", "" },		Sequence{}, TypeText { "ViewInBrowser" }, _return, endSequence{},
	} }
} };

//#pragma mark Dictate
//resource restype_Slate (resid_Dictate, "Dictate") { {
//	Slate { "Dictate", {
//		_BBEditStandards_,
//		_MicrophoneOn_,
//		ExitEvent { "okay", "" },		NilAction{},
//		Event { "Safari", "" },			Sequence{},
//			Launch { MainApps_"Safari.app", 0 }, ResSubslate { resid_MoviePlayer }, endSequence{},
//		Event { "QuickTime", "" },		Sequence{},
//			Launch { MainApps_"QuickTime Player.app", 0 }, ResSubslate { resid_MoviePlayer }, endSequence{},
//		Event { "BBEdit", "" },			Launch { MainApps_"BBEdit.app", 0 },
//		_DirectionKeys_,
//		_WhitespaceKeys_,
//		_CommandSlate_,
//		_IMouseSlate_,
//		Event { "Type", "" },			ResSubslate { resid_TypeBBEditSlate },
//	} }
//} };

#pragma mark MoviePlayer
resource restype_Slate (resid_MoviePlayer, "MoviePlayer") { {
	Slate { "MoviePlayer", {
		_SlateGlobals_,
		ExitEvent { "exit player", "" },	NilAction{},
		Event { "pause movie", "" },		Keypress { kc_space, 0 },
		ExitEvent { "take notes", "" },		Launch { MainApps_"BBEdit.app", 0 },
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
		_NextPanel,
		_PreviousPanel,
		ExitEvent { "cut next line", "" },		Sequence{},
			_down, Keypress { kc_L, mf_command }, Keypress { kc_X, mf_command }, endSequence{},
		ExitEvent { "blurb", "" },	Sequence{}, _left, _left, TypeText { " class='blurb'" }, _previous, endSequence{},
		Event { "check copyright", "" },		Sequence{},
			Keypress { kc_F, mf_command }, TypeText { "C & C Software" }, Keypress { kc_return, 0 }, _left, _left,
			endSequence{},
		Event { "step tag", "" },				Sequence{},
			TypeText { "<a href=\"<##>_hist.html#" }, Keypress { kc_V, mf_command }, TypeText { "\">" }, Keypress { kc_V, mf_command }, 
			TypeText { "</a>" }, _previous, endSequence{},
		Event { "indent items", "" },		Sequence{},
			Keypress { kc_closebracket, mf_command }, Keypress { kc_left, mf_shift },
			Keypress { kc_X, mf_command }, _return, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
			TypeText { "<ul>" }, Keypress { kc_V, mf_command }, _delete, _return, _delete,
			TypeText { "</ul>" }, Keypress { kc_right, mf_command }, _right, endSequence{},
		Event { "one", "temp" },				Sequence{},
			TypeText { "Workspace-r54" },
			endSequence{},
		Event { "two", "temp" },				Sequence{},
			TypeText { "Users/Shared/Cdoc" },
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
	} }
} };

#pragma mark Snippet
resource restype_Slate (resid_Snippet, "") { {
	Slate { "Snippet",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeBBEditSlate_,
	} }
} };

//_BBEditBase_: shared by resid_BBEdit and resid_BBEdit_External
#define _BBEditBase_	\
		_SlateGlobals_,		\
		_DefaultBase_,		\
		_TypeBBEditSlate_,		\
		Event { "Drawer", "" },		ResSubslate { resid_Drawer },		\
		Event { "Project", "" },	ResSubslate { resid_Project },		\
		Event { "File menu", "" },	ResSubslate { resid_FileMenu },		\
		Event { "Browser", "" },	Sequence{}, Launch { Apps_"Safari.app", 0 }, ResSubslate { resid_Browser }, endSequence{},		\
		Event { "Validate", "" },	ResSubslate { resid_ValidateMarkup },		\
		Event { "Script", "" },		Sequence{}, _clickScriptsMenu, _down, ResSubslate { resid_Script }, endSequence{},		\
		Event { "Terminal", "" },	Sequence{}, ResSubslate { resid_BBTerminal }, Launch { Apps_"Utilities/Terminal.app", 0 }, endSequence{},		\
		Event { "Shell", "" }, 		Sequence{}, Launch { Dev_"DevSupport/BBEdit/Shell.worksheet", 0 }, ResSubslate { resid_Shell }, endSequence{},		\
		Event { "Search", "" },		ResSubslate { resid_Search }

#pragma mark BBEdit_External
resource restype_Slate (resid_BBEdit_External, "BBEdit from Xcode") { {
	Slate { "extBBEdit",	{
		_BBEditBase_,
		Event { "okay", "" },		Launch { DevApps_"XCode.app", resid_Xcode },
	 } }
} };

#pragma mark BBEdit
resource restype_Slate (resid_BBEdit, "BBEdit Slate") { {
	Slate { "BBEdit",	{
		_BBEditBase_,	
		Event { "close document", "" },	Keypress { kc_W, mf_command },
		Event { "Macro", "" },			ResSubslate { resid_Macro },
		Event { "Contents", "" },	ResSubslate { resid_ProjectContents },
		Event { "Doc Window", "" },	ResSubslate { resid_DocWindow },
		Event { "Menu", "access menus" },	Subslate { "Menu" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "File", "" }, 	Sequence{}, ClickMenu { "File" }, ResSubslate { resid_FileMenu }, endSequence{},
			ExitEvent { "Text", "'Text' menu" }, ClickMenu { "Text" },
			ExitEvent { "View", "'View' menu" }, ClickMenu { "View" },
			ExitEvent { "Search", "'Search' menu" }, ClickMenu { "Search" },
			ExitEvent { "Tools", "'Tools' menu" }, ClickMenu { "Tools" },
			ExitEvent { "Markup", "'Markup' menu" }, ClickMenu { "Markup" },
			ExitEvent { "Window", "'Window' menu" }, ClickMenu { "Window" },
			ExitEvent { "Version", "'Version' menu" }, ClickMenu { "CVS" },
			ExitEvent { "Help", "'Help' menu" }, ClickMenu { "Help" },
			endSubslate{},
		Event { "Window", "" },			ResSubslate { resid_WindowBBEdit },
		Event { "Preferences", "" },	Sequence{}, Keypress { kc_comma, mf_command }, ResSubslate { resid_Preferences }, endSequence{},
		Event { "Accessor", "" },			Subslate { "Accessor" },
			_SlateGlobals_,
			Event { "build", "" },			Sequence{}, _clickScriptsMenu, _down,
				TypeText { "BuildAccessor" }, _return, endSequence{},
			ExitEvent { "force exit", "" },		NilAction{},
			ExitEvent { "cancel", "for failed build" },	_return,
			Event { "run original", "" },	Sequence{}, _return, 
				Launch { HomeApps_"Accessor_C9.app", 0 }, endSequence{},
			Event { "quit", "" },			Keypress { kc_Q, mf_command },
			endSubslate{},
		Event { "Markup", "" },			ResSubslate { resid_Markup },
		Event { "Subversion", "switch to subslate 'Subversion'" },
			ResSubslate { resid_Subversion },
		Event { "Action", "" },			ResSubslate { resid_Action },
	 } }
} };

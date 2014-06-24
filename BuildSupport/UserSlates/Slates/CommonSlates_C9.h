// =================================================================================
//	CommonSlates_C9.h			(c)1997-2013 C & C Software, Inc. All rights reserved.
// =================================================================================

#pragma once

//#include "UserDefs_Clc_C9.h"
#include "Keyboard_AL.h"

#pragma mark folders

// set #defines for alternative builds in Accessor and/or Install Build Settings: Preprocessor Defines
#define mainvol_		"/Volumes/Mac"
#ifdef LAPTOP
#define mainvol_        "/Volumes/Macintosh HD"
#endif

#define bootvol_        mainvol_
#ifdef MAVERICKS
#define bootvol_        "/Volumes/Mavericks"
#endif

#define mainhome_       mainvol_"/Users/carolclark/"

#define Sys_		bootvol_"/System Folder/"
#define Apps_		bootvol_"/Applications/"
#define MainApps_	mainvol_"/Applications/"
#define DevApps_    MainApps_
#define JavaApps_	bootvol_"/JavaDeveloper/Applications/"
#define Home_		bootvol_"/Users/carolclark/"
#define HomeApps_	Home_"Applications/"
#define Docs_		mainhome_"/Documents/"
#define Dev_		mainhome_"/Dev/"
#define Reference_	mainhome_"/Reference/"
#define Databases_	mainhome_"/Databases/"
#define Utilities_	Apps_"Utilities/"

#pragma mark resid_
#define resid_DefaultSlate				1000
#define resid_ProcessSlate				1001
#define resid_SlatesSlate				1002
#define resid_LaunchSlate				1003
#define resid_TypeSlate					1004
#define resid_TypeSpecialDefaultSlate	1005	
#define resid_CommandSlate				1006
#define resid_FullAccessSlate			1007
#define resid_DockWindowSlate			1008
#define resid_MenuBarSlate				1009
#define resid_WindowSlate				1010
#define resid_WindowControlsSlate		1011
#define resid_DialogSlate				1012
#define resid_IMouseSlate				1013
#define resid_TestClicksSlate			1015
#define resid_TestTypeSlate				1016
#define resid_DragonSlate				1017
#define resid_DictateSlate				1018
#define	resid_GoToFolder				1019
#define resid_LinkContentSlate			1020
#define resid_Sleep						1021

#define resid_WordLeft					1030
#define resid_WordRight					1031

#define resid_DoScan					1050
	#define resid_ScanAhead					resid_DoScan+1
	#define resid_ScanBack					resid_DoScan+2	
	#define resid_DoTab						resid_DoScan+3
	#define resid_TabAhead					resid_DoScan+4
	#define resid_TabBack					resid_DoScan+5

#define resid_Finder					10000
#define resid_SystemPrefs				11000
	#define resid_XCSystemPrefs		resid_SystemPrefs+1
#define resid_AddressBook				12000
#define resid_Mail						13000
#define resid_Safari					14000
#define resid_Calendar					15000
#define resid_Tunes						16000
#define resid_Xcode						17000		// allocate 2000
#define resid_InterfaceBuilder			19000
#define resid_PackageMaker				20000
#define resid_Eclipse					21000
#define resid_BBEdit					22000
	#define resid_XCBBEdit			resid_BBEdit+1
#define resid_FileMaker					23000
#define resid_AppleWorks				24000
#define resid_Backup					25000
#define resid_Parallels					26000
#define resid_UMLet						27000
	#define resid_LaunchUMLet		resid_UMLet+1
	#define resid_UMLetSubslate		resid_UMLet+2
#define resid_Preview					28000
#define resid_Terminal					29000
	#define resid_XCTerminal		resid_Terminal+1
#define resid_UIBrowser					30000
#define resid_Automator					31000
#define resid_TextEdit					32000
#define resid_ScriptEditor				33000
#define resid_Dashcode					35000
#define resid_Numbers					36000
#define resid_Dash						37000
	#define resid_XcodeDash			resid_Dash+1
#define resid_GitHub					38000
#define resid_Developer					39000
#define resid_AppCode					40000
	#define resid_XCAppCode			resid_AppCode+1
#define resid_Server					41000
#define resid_Pages						42000
#define resid_ArbProto					50000

#define	resid_LaunchGamesSlate			55000
	#define resid_Solitaire		resid_LaunchGamesSlate + 100
		#define resid_solSpider		resid_Solitaire + 1
#define resid_Games						60000
#define resid_FortyThieves				resid_Games

#define _id_Safari_Bookmarks			resid_Safari+4

#define	_systemScriptsMenu		Script { "tell application \"System Events\" to tell process \"SystemUIServer\" to click menu bar item 1 of menu bar 1", "" }

#pragma mark 1 ===
#pragma mark 2 ===

#pragma mark _BrowserSlates_
#define	_BrowserStandards_		\
		_SlateGlobals_,         \
		_StarterBase_,          \
		_WindowSlate_,          \
		_TypeSlate_,            \
		_ScanAheadSubslate_,	\
		_ScanBackSubslate_,		\
		Event { "next", "" },			Keypress { kc_tab, mf_option },				\
		Event { "previous", "" },		Keypress { kc_tab, mf_option + mf_shift },	\
		Event { "home", "" },			Click { 1, 0, 85, _window, _topCenter },	\
		Event { "enter", "" },			Keypress { kc_enter, 0 },					\
		Event { "refresh", "" },		Keypress { kc_R, mf_command },				\
		Event { "address", "" },		Click { 1, 0, 35, _window, _topCenter },       \
		Event { "copy", "" },			Keypress { kc_C, mf_command },					\
		Event { "copy address", "" },	Sequence{},										\
			Click { 1, 0, 35, _window, _topCenter }, Keypress { kc_A, mf_command }, Keypress { kc_C, mf_command },														\
			endSequence{},															\
		Event { "copy local address", "" },	Sequence{},	Click { 1, 0, 35, _window, _topCenter }, Keypress { kc_A, mf_command }, _left, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, 0 }, Keypress { kc_right, mf_shift + mf_command }, Keypress { kc_C, mf_command }, _left, endSequence{},		\
		Event { "go back", "", },		Keypress { kc_bracket, mf_command },              \
		Event { "go forward", "", },	Keypress { kc_closeBracket, mf_command },       \
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },                     \
		Event { "page north", "" },		Keypress { kc_pageup, 0 },                      \
		Event { "page top", "" },		Keypress { kc_home, 0 },                          \
		Event { "page bottom", "" },	Keypress { kc_end, 0 },                           \
		Event { "link content", "" },	ResSubslate { resid_LinkContentSlate },			\
		Event { "fix window", "" },		Sequence{}, Click { 0, 80, 10, _window, _topLeft }, \
			Click { -1, 335, 30, _screen, _topLeft }, endSequence{}

// parameters: _BrowseCdocResID_; _mainFrame_h, _mainFrame_v; _homeApp
// InHouse Links Table variables
// ihl_top, ihl_left	spot to click for 0th item
// ihl_rsp, ihl_csp		row and column spacing
// ihl_offset 			horizontal offset to secondary spot for rows that are indented
#define	_BrowseCdocSlate_      \
	#define ihl_top		110    \
	#define ihl_left	86     \
	#define ihl_rsp		19     \
	#define ihl_csp		254    \
	#define ihl_offset	35     \
resource restype_Slate (_BrowseCdocResID_, "browse Cdoc documentation") { {				\
	Slate { "Browser", {		\
		_BrowserStandards_,		\
		ExitEvent { "okay", "" },		Launch { _homeApp, 0 }, \
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { _homeApp, 0 }, endSequence{},      					\
		Event { "exit", "" },			CloseSubslate{},		\
		Event { "parent", "" },			Click { 1, 20, 86, _window, _topLeft },        \
		Event { "history", "" },		Click { 1, 395, 86, _window, _topLeft },       \
		Event { "topics", "" },			Click { 1, -35, 86, _window, _topRight },      \
		Event { "contents", "" },		Click { 1, -35, 86, _window, _topRight },  \
		Event { "alpha one", "" },			Click { 1, ihl_left, ihl_top+1*ihl_rsp, _window, _topLeft },	\
		Event { "alpha two", "" },			Click { 1, ihl_left, ihl_top+2*ihl_rsp, _window, _topLeft },	\
		Event { "alpha three", "" },		Click { 1, ihl_left, ihl_top+3*ihl_rsp, _window, _topLeft },	\
		Event { "alpha four", "" },			Click { 1, ihl_left, ihl_top+4*ihl_rsp, _window, _topLeft },	\
		Event { "alpha five", "" },			Click { 1, ihl_left, ihl_top+5*ihl_rsp, _window, _topLeft },	\
		Event { "alpha six", "" },			Click { 1, ihl_left, ihl_top+6*ihl_rsp, _window, _topLeft },	\
		Event { "alpha seven", "" },		Click { 1, ihl_left, ihl_top+7*ihl_rsp, _window, _topLeft },	\
		Event { "alpha eight", "" },		Click { 1, ihl_left, ihl_top+8*ihl_rsp, _window, _topLeft },	\
		Event { "alpha nine", "" },			Click { 1, ihl_left, ihl_top+9*ihl_rsp, _window, _topLeft },	\
		Event { "alpha ten", "" },			Click { 1, ihl_left, ihl_top+10*ihl_rsp, _window, _topLeft },	\
		Event { "alpha eleven", "" },		Click { 1, ihl_left, ihl_top+11*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twelve", "" },		Click { 1, ihl_left, ihl_top+12*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirteen", "" },		Click { 1, ihl_left, ihl_top+13*ihl_rsp, _window, _topLeft },	\
		Event { "alpha fourteen", "" },		Click { 1, ihl_left, ihl_top+14*ihl_rsp, _window, _topLeft },	\
		Event { "alpha fifteen", "" },		Click { 1, ihl_left, ihl_top+15*ihl_rsp, _window, _topLeft },	\
		Event { "alpha sixteen", "" },		Click { 1, ihl_left, ihl_top+16*ihl_rsp, _window, _topLeft },	\
		Event { "alpha seventeen", "" },	Click { 1, ihl_left, ihl_top+17*ihl_rsp, _window, _topLeft },	\
		Event { "alpha eighteen", "" },		Click { 1, ihl_left, ihl_top+18*ihl_rsp, _window, _topLeft },	\
		Event { "alpha nineteen", "" },		Click { 1, ihl_left, ihl_top+19*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty", "" },		Click { 1, ihl_left, ihl_top+20*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty one", "" },	Click { 1, ihl_left, ihl_top+21*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty two", "" },	Click { 1, ihl_left, ihl_top+22*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty three", "" },	Click { 1, ihl_left, ihl_top+23*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty four", "" },	Click { 1, ihl_left, ihl_top+24*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty five", "" },	Click { 1, ihl_left, ihl_top+25*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty six", "" },	Click { 1, ihl_left, ihl_top+26*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty seven", "" },	Click { 1, ihl_left, ihl_top+27*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty eight", "" },	Click { 1, ihl_left, ihl_top+28*ihl_rsp, _window, _topLeft },	\
		Event { "alpha twenty nine", "" },	Click { 1, ihl_left, ihl_top+29*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty", "" },		Click { 1, ihl_left, ihl_top+30*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty one", "" },	Click { 1, ihl_left, ihl_top+31*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty two", "" },	Click { 1, ihl_left, ihl_top+32*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty three", "" },	Click { 1, ihl_left, ihl_top+33*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty four", "" },	Click { 1, ihl_left, ihl_top+34*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty five", "" },	Click { 1, ihl_left, ihl_top+35*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty six", "" },	Click { 1, ihl_left, ihl_top+36*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty seven", "" },	Click { 1, ihl_left, ihl_top+37*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty eight", "" },	Click { 1, ihl_left, ihl_top+38*ihl_rsp, _window, _topLeft },	\
		Event { "alpha thirty nine", "" },	Click { 1, ihl_left, ihl_top+39*ihl_rsp, _window, _topLeft },	\
		Event { "alpha forty", "" },		Click { 1, ihl_left, ihl_top+40*ihl_rsp, _window, _topLeft },	\
		Event { "alpha forty one", "" },	Click { 1, ihl_left, ihl_top+41*ihl_rsp, _window, _topLeft },	\
		Event { "alpha forty two", "" },	Click { 1, ihl_left, ihl_top+42*ihl_rsp, _window, _topLeft },	\
		Event { "alpha forty three", "" },	Click { 1, ihl_left, ihl_top+43*ihl_rsp, _window, _topLeft },	\
		Event { "alpha forty four", "" },	Click { 1, ihl_left, ihl_top+44*ihl_rsp, _window, _topLeft },	\
		Event { "alpha forty five", "" },	Click { 1, ihl_left, ihl_top+45*ihl_rsp, _window, _topLeft },	\
		Event { "bravo one", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+1*ihl_rsp, _window, _topLeft },	\
		Event { "bravo two", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+2*ihl_rsp, _window, _topLeft },	\
		Event { "bravo three", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+3*ihl_rsp, _window, _topLeft },	\
		Event { "bravo four", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+4*ihl_rsp, _window, _topLeft },	\
		Event { "bravo five", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+5*ihl_rsp, _window, _topLeft },	\
		Event { "bravo six", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+6*ihl_rsp, _window, _topLeft },	\
		Event { "bravo seven", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+7*ihl_rsp, _window, _topLeft },	\
		Event { "bravo eight", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+8*ihl_rsp, _window, _topLeft },	\
		Event { "bravo nine", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+9*ihl_rsp, _window, _topLeft },	\
		Event { "bravo ten", "" },			Click { 1, ihl_left + ihl_offset, ihl_top+10*ihl_rsp, _window, _topLeft },	\
		Event { "bravo eleven", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+11*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twelve", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+12*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirteen", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+13*ihl_rsp, _window, _topLeft },	\
		Event { "bravo fourteen", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+14*ihl_rsp, _window, _topLeft },	\
		Event { "bravo fifteen", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+15*ihl_rsp, _window, _topLeft },	\
		Event { "bravo sixteen", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+16*ihl_rsp, _window, _topLeft },	\
		Event { "bravo seventeen", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+17*ihl_rsp, _window, _topLeft },	\
		Event { "bravo eighteen", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+18*ihl_rsp, _window, _topLeft },	\
		Event { "bravo nineteen", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+19*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+20*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty one", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+21*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty two", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+22*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty three", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+23*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty four", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+24*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty five", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+25*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty six", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+26*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty seven", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+27*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty eight", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+28*ihl_rsp, _window, _topLeft },	\
		Event { "bravo twenty nine", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+29*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+30*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty one", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+31*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty two", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+32*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty three", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+33*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty four", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+34*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty five", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+35*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty six", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+36*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty seven", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+37*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty eight", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+38*ihl_rsp, _window, _topLeft },	\
		Event { "bravo thirty nine", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+39*ihl_rsp, _window, _topLeft },	\
		Event { "bravo forty", "" },		Click { 1, ihl_left + ihl_offset, ihl_top+40*ihl_rsp, _window, _topLeft },	\
		Event { "bravo forty one", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+41*ihl_rsp, _window, _topLeft },	\
		Event { "bravo forty two", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+42*ihl_rsp, _window, _topLeft },	\
		Event { "bravo forty three", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+43*ihl_rsp, _window, _topLeft },	\
		Event { "bravo forty four", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+44*ihl_rsp, _window, _topLeft },	\
		Event { "bravo forty five", "" },	Click { 1, ihl_left + ihl_offset, ihl_top+45*ihl_rsp, _window, _topLeft },	\
		Event { "charlie one", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+1*ihl_rsp, _window, _topLeft },	\
		Event { "charlie two", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+2*ihl_rsp, _window, _topLeft },	\
		Event { "charlie three", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+3*ihl_rsp, _window, _topLeft },	\
		Event { "charlie four", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+4*ihl_rsp, _window, _topLeft },	\
		Event { "charlie five", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+5*ihl_rsp, _window, _topLeft },	\
		Event { "charlie six", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+6*ihl_rsp, _window, _topLeft },	\
		Event { "charlie seven", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+7*ihl_rsp, _window, _topLeft },	\
		Event { "charlie eight", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+8*ihl_rsp, _window, _topLeft },	\
		Event { "charlie nine", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+9*ihl_rsp, _window, _topLeft },	\
		Event { "charlie ten", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+10*ihl_rsp, _window, _topLeft },	\
		Event { "charlie eleven", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+11*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twelve", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+12*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirteen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+13*ihl_rsp, _window, _topLeft },	\
		Event { "charlie fourteen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+14*ihl_rsp, _window, _topLeft },	\
		Event { "charlie fifteen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+15*ihl_rsp, _window, _topLeft },	\
		Event { "charlie sixteen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+16*ihl_rsp, _window, _topLeft },	\
		Event { "charlie seventeen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+17*ihl_rsp, _window, _topLeft },	\
		Event { "charlie eighteen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+18*ihl_rsp, _window, _topLeft },	\
		Event { "charlie nineteen", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+19*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+20*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty one", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+21*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty two", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+22*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty three", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+23*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty four", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+24*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty five", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+25*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty six", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+26*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty seven", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+27*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty eight", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+28*ihl_rsp, _window, _topLeft },	\
		Event { "charlie twenty nine", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+29*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+30*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty one", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+31*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty two", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+32*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty three", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+33*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty four", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+34*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty five", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+35*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty six", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+36*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty seven", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+37*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty eight", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+38*ihl_rsp, _window, _topLeft },	\
		Event { "charlie thirty nine", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+39*ihl_rsp, _window, _topLeft },	\
		Event { "charlie forty", "" },			Click { 1, ihl_left + ihl_csp, ihl_top+40*ihl_rsp, _window, _topLeft },	\
		Event { "charlie forty one", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+41*ihl_rsp, _window, _topLeft },	\
		Event { "charlie forty two", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+42*ihl_rsp, _window, _topLeft },	\
		Event { "charlie forty three", "" },	Click { 1, ihl_left + ihl_csp, ihl_top+43*ihl_rsp, _window, _topLeft },	\
		Event { "charlie forty four", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+44*ihl_rsp, _window, _topLeft },	\
		Event { "charlie forty five", "" },		Click { 1, ihl_left + ihl_csp, ihl_top+45*ihl_rsp, _window, _topLeft },	\
		Event { "david one", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+1*ihl_rsp, _window, _topLeft },	\
		Event { "david two", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+2*ihl_rsp, _window, _topLeft },	\
		Event { "david three", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+3*ihl_rsp, _window, _topLeft },	\
		Event { "david four", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+4*ihl_rsp, _window, _topLeft },	\
		Event { "david five", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+5*ihl_rsp, _window, _topLeft },	\
		Event { "david six", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+6*ihl_rsp, _window, _topLeft },	\
		Event { "david seven", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+7*ihl_rsp, _window, _topLeft },	\
		Event { "david eight", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+8*ihl_rsp, _window, _topLeft },	\
		Event { "david nine", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+9*ihl_rsp, _window, _topLeft },	\
		Event { "david ten", "" },			Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+10*ihl_rsp, _window, _topLeft },	\
		Event { "david eleven", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+11*ihl_rsp, _window, _topLeft },	\
		Event { "david twelve", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+12*ihl_rsp, _window, _topLeft },	\
		Event { "david thirteen", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+13*ihl_rsp, _window, _topLeft },	\
		Event { "david fourteen", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+14*ihl_rsp, _window, _topLeft },	\
		Event { "david fifteen", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+15*ihl_rsp, _window, _topLeft },	\
		Event { "david sixteen", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+16*ihl_rsp, _window, _topLeft },	\
		Event { "david seventeen", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+17*ihl_rsp, _window, _topLeft },	\
		Event { "david eighteen", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+18*ihl_rsp, _window, _topLeft },	\
		Event { "david nineteen", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+19*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+20*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty one", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+21*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty two", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+22*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty three", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+23*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty four", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+24*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty five", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+25*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty six", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+26*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty seven", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+27*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty eight", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+28*ihl_rsp, _window, _topLeft },	\
		Event { "david twenty nine", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+29*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+30*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty one", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+31*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty two", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+32*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty three", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+33*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty four", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+34*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty five", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+35*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty six", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+36*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty seven", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+37*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty eight", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+38*ihl_rsp, _window, _topLeft },	\
		Event { "david thirty nine", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+39*ihl_rsp, _window, _topLeft },	\
		Event { "david forty", "" },		Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+40*ihl_rsp, _window, _topLeft },	\
		Event { "david forty one", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+41*ihl_rsp, _window, _topLeft },	\
		Event { "david forty two", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+42*ihl_rsp, _window, _topLeft },	\
		Event { "david forty three", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+43*ihl_rsp, _window, _topLeft },	\
		Event { "david forty four", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+44*ihl_rsp, _window, _topLeft },	\
		Event { "david forty five", "" },	Click { 1, ihl_left + ihl_csp + ihl_offset, ihl_top+45*ihl_rsp, _window, _topLeft },	\
	} }     \
} };

#pragma mark _BrowseDoxygenSlate_
// parameters: _BrowseDoxygenResID_; _mainFrame_h, _mainFrame_v, _homeApp
#define _BrowseDoxygenSlate_                                                                               \
resource restype_Slate (_BrowseDoxygenResID_, "browse Doxygen documentation") { {        \
	Slate { "Doxygen", {        \
		_SlateGlobals_,         \
		_CloseSubslate_,		\
		_WindowSlate_,          \
		_TypeSlate_,            \
		_IMouseSlate_,			\
		Event { "select", "" },			Click { 1, 0, 0, _cursor },					\
		Event { "do scan", "" },		Sequence{}, Click { 1, -130, 145, _window, _topRight }, ResSubslate { resid_DoTab }, endSequence{},				\
		Event { "next", "" },			Keypress { kc_tab, mf_option },				\
		Event { "previous", "" },		Keypress { kc_tab, mf_option + mf_shift },	\
		Event { "home", "" },			Click { 1, 0, 85, _window, _topCenter },	\
		Event { "enter", "" },			Keypress { kc_enter, 0 },					\
		Event { "refresh", "" },		Keypress { kc_R, mf_command },				\
		Event { "address", "" },		Click { 1, 0, 35, _window, _topCenter },       \
		Event { "copy address", "" },	Sequence{},										\
			Click { 1, 0, 35, _window, _topCenter }, Keypress { kc_A, mf_command }, Keypress { kc_C, mf_command },														\
			endSequence{},															\
		Event { "go back", "", },		Keypress { kc_bracket, mf_command },              \
		Event { "go forward", "", },	Keypress { kc_closeBracket, mf_command },       \
		Event { "page down", "" },		Keypress { kc_pagedown, 0 },                     \
		Event { "page north", "" },		Keypress { kc_pageup, 0 },                      \
		Event { "page top", "" },		Keypress { kc_home, 0 },                          \
		Event { "page end", "" },		Keypress { kc_end, 0 },                           \
		Event { "link content", "" },	ResSubslate { resid_LinkContentSlate },			\
		Event { "fix window", "" },		Sequence{}, Click { 0, 80, 10, _window, _topLeft }, \
			Click { -1, 335, 30, _screen, _topLeft }, endSequence{},					\
		ExitEvent { "okay", "" },		Launch { _homeApp, 0 }, 				\
		ExitEvent { "close", "" },		Sequence{}, Keypress { kc_W, mf_command }, Launch { _homeApp, 0 }, endSequence{},    \
		Event { "search", "" },				Click { 1, -100, _mainFrame_v+70, _window, _topRight },	\
		Event { "main page", "" },			Click { 1, _mainFrame_h+50, _mainFrame_v+70, _window, _topLeft },           \
		Event { "related", "" },			Click { 1, _mainFrame_h+175, _mainFrame_v+70, _window, 	_topLeft },           \
		Event { "namespaces", "" },			Click { 1, _mainFrame_h+290, _mainFrame_v+70, _window, _topLeft },            \
		Event { "classes Accessor", "" },			Click { 1, _mainFrame_h+410, _mainFrame_v+70, _window, _topLeft },            \
		Event { "classes", "" },			Click { 1, _mainFrame_h+290, _mainFrame_v+70, _window, _topLeft },            \
			Event { "class list", "" },			Click { 1, _mainFrame_h+50, _mainFrame_v+110, _window, _topLeft },          \
			Event { "class index", "" },		Click { 1, _mainFrame_h+140, _mainFrame_v+110, _window, _topLeft },       \
			Event { "class members", "" },		Click { 1, _mainFrame_h+250, _mainFrame_v+110, _window, _topLeft },       \
			Event { "members index", "" },		Subslate { "index" },			\
				_SlateGlobals_,				\
				_CloseSubslate_,			\
				Event { "all", "" },				Click { 1, _mainFrame_h+25, _mainFrame_v+145, _window, _topLeft },                \
				Event { "functions", "" },			Click { 1, _mainFrame_h+100, _mainFrame_v+145, _window, _topLeft },           \
				Event { "variables", "" },			Click { 1, _mainFrame_h+185, _mainFrame_v+145, _window, _topLeft },          \
				Event { "properties", "" },			Click { 1, _mainFrame_h+230, _mainFrame_v+145, _window, _topLeft },         \
				endSubslate{},				\
		Event { "methods", "" },			Click { 1, -223, 210, _window, _topRight },		\
		Event { "properties", "" },			Click { 1, -150, 210, _window, _topRight },		\
		Event { "members", "" },			Click { 1, -73, 210, _window, _topRight },		\
		Event { "files Accessor", "" },				Click { 1, _mainFrame_h+490, _mainFrame_v+70, _window, _topLeft },             \
		Event { "files", "" },				Click { 1, _mainFrame_h+370, _mainFrame_v+70, _window, _topLeft },             \
			Event { "file list", "" },			Click { 1, _mainFrame_h+65, _mainFrame_v+110, _window, _topLeft },           \
			Event { "file members", "" },		Click { 1, _mainFrame_h+144, _mainFrame_v+110, _window, _topLeft },        \
		Event { "typedefs", "" },			Click { 1, _mainFrame_h+236, _mainFrame_v+74, _window, _topLeft },       \
		Event { "enumerations", "" },		Click { 1, _mainFrame_h+312, _mainFrame_v+74, _window, _topLeft },       \
		Event { "enumerator", "" },			Click { 1, _mainFrame_h+389, _mainFrame_v+74, _window, _topLeft },       \
		Event { "defines", "" },			Click { 1, _mainFrame_h+462, _mainFrame_v+74, _window, _topLeft },       \
		Event { "related pages", "" },		Click { 1, _mainFrame_h+135, _mainFrame_v+23, _window, _topLeft },		\
		Event { "class hierarchy", "" },	Click { 1, _mainFrame_h+144, _mainFrame_v+49, _window, _topLeft },      \
		Event { "test list", "" },			Click { 1, 70, 270, _window, _topLeft },	\
		Event { "down", "" },				Click { 0, 0, 22, _cursor },       \
		Event { "north", "" },				Click { 0, 0, -22, _cursor },       \
		Event { "left", "" },				Click { 0, -40, 0, _cursor },       \
		Event { "right", "" },				Click { 0, 40, 0, _cursor },       \
		Event { "row zero", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+198, _window, _topLeft },       \
		Event { "row one", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+225, _window, _topLeft },       \
		Event { "row two", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+247, _window, _topLeft },       \
		Event { "row three", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+270, _window, _topLeft },       \
		Event { "row four", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+293, _window, _topLeft },       \
		Event { "row five", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+316, _window, _topLeft },       \
		Event { "row six", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+339, _window, _topLeft },       \
		Event { "row seven", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+362, _window, _topLeft },       \
		Event { "row eight", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+395, _window, _topLeft },       \
		Event { "row nine", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+418, _window, _topLeft },       \
		Event { "row ten", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+442, _window, _topLeft },       \
		Event { "row eleven", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+466, _window, _topLeft },       \
		Event { "row twelve", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+490, _window, _topLeft },       \
		Event { "row thirteen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+514, _window, _topLeft },       \
		Event { "row fourteen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+538, _window, _topLeft },       \
		Event { "row fifteen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+562, _window, _topLeft },       \
		Event { "row sixteen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+586, _window, _topLeft },       \
		Event { "row seventeen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+610, _window, _topLeft },       \
		Event { "row eighteen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+634, _window, _topLeft },       \
		Event { "row nineteen", "" },		Click { 0, _mainFrame_h+60, _mainFrame_v+658, _window, _topLeft },       \
		Event { "row twenty", "" },			Click { 0, _mainFrame_h+60, _mainFrame_v+682, _window, _topLeft },       \
	} }                		\
} };

#pragma mark Macros
#define _window		window, "1"
#define _return		Keypress { kc_return, 0 }
#define _up			Keypress { kc_up, 0 }
#define _down		Keypress { kc_down, 0 }
#define _left		Keypress { kc_left, 0 }
#define _right		Keypress { kc_right, 0 }
#define _tab		Keypress { kc_tab, 0 }
#define _tabBack	Keypress { kc_tab, mf_shift }
#define _space		Keypress { kc_space, 0 }
#define _delete		Keypress { kc_delete, 0 }
#define _quote		Keypress { kc_quote, mf_shift }

#define	_ClickOne_	Event { "click one", "" },		Click { 1, 0, 0, _cursor }
#define	_ClickTwo_	Event { "click two", "" },		Click { 2, 0, 0, _cursor }
#define	_PageKeys_	Event { "page top", "" },		Keypress { kc_home, 0 },		\
					Event { "page end", "" },		Keypress { kc_end, 0 },			\
					Event { "page north", "" },		Keypress { kc_pageup, 0 },		\
					Event { "page down", "" },		Keypress { kc_pagedown, 0 }

#define _fixWindow	\
		Event { "fix window", "" },		Sequence{},			\
			Click { 0, 85, 10, _window, _topLeft },		\
			Click { -1, 335, 29, _screen, _topLeft },		\
			endSequence{}

#define _OpenScriptsMenu_	Click { 1, -279, 15, _screen, _topRight }, KeyDelay { kc_down, 0, 10 }

#pragma mark _Slates
#define _LaunchSlate_		\
	Event { "Launch", "launch applications" },	\
		ResSubslate { resid_LaunchSlate },		\
	Event { "Process", "launch applications" },	\
		ResSubslate { resid_LaunchSlate }

#define _SlatesSlate_		\
	Event { "Slate", "switch to another Slate" },	\
		ResSubslate { resid_SlatesSlate }

#define _TypeSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeSlate }

#define _TypeSpecialDefaultSlate_	\
	Event { "Special", "type predefined text shortcuts" },	\
		ResSubslate { resid_TypeSpecialDefaultSlate }

#define _CommandSlate_ 		\
	Event { "Command", "press a command-key combination" },	\
		ResSubslate { resid_CommandSlate }

#define _DockWindowSlate_ 	\
	Event { "Dock panel", "access the Dock panel" },	\
		Sequence{},	\
			ResSubslate { resid_DockWindowSlate },	\
			Keypress { kc_fn3, mf_control },	\
		endSequence{}

#define _FullAccessSlate_ 	\
	Event { "Full Access", "switch to Subslate 'Access'" },	\
		ResSubslate { resid_FullAccessSlate }

#define _WindowSlate_	\
	Event { "Window", "control windows" },	\
		ResSubslate { resid_WindowSlate }

#define _WindowControlsSlate_ 	\
	Event { "Controls", "access controls of front window" },	\
		ResSubslate { resid_WindowControlsSlate }

#define _DialogSlate_ 	\
	Event { "Dialog", "access the controls of a displayed dialog" },	\
		ResSubslate { resid_DialogSlate }

#define _MenuBarSlate_ 	\
	Event { "Menu Bar", "access the Menu Bar" },	\
		Sequence{},									\
			ResSubslate { resid_MenuBarSlate },		\
			Keypress { kc_fn2, mf_control },		\
		endSequence{}

#define _IMouseSlate_ 	\
	Event { "Mouse", "simulate mouse actions" },	\
		ResSubslate { resid_IMouseSlate }

#define	_CloseSubslate_	\
	Event { "okay", "close this subslate" },	\
		CloseSubslate { }

#pragma mark _FunctionKeys_
#define _FunctionKeys_		\
	Event { "function one",			"fn_1" },	Keypress { kc_fn1, 0 },	\
	Event { "function two",			"fn_2" },	Keypress { kc_fn2, 0 },	\
	Event { "function three",		"fn_3" },	Keypress { kc_fn3, 0 },	\
	Event { "function four",		"fn_4" },	Keypress { kc_fn4, 0 },	\
	Event { "function five",		"fn_5" },	Keypress { kc_fn5, 0 },	\
	Event { "function six",			"fn_6" },	Keypress { kc_fn6, 0 },	\
	Event { "function seven",		"fn_7" },	Keypress { kc_fn7, 0 },	\
	Event { "function eight",		"fn_8" },	Keypress { kc_fn8, 0 },	\
	Event { "function nine",		"fn_9" },	Keypress { kc_fn9, 0 },	\
	Event { "function ten",			"fn_10" },	Keypress { kc_fn10, 0 },	\
	Event { "function eleven",		"fn_11" },	Keypress { kc_fn11, 0 },	\
	Event { "function twelve",		"fn_12" },	Keypress { kc_fn12, 0 },	\
	Event { "function thirteen",	"fn_13" },	Keypress { kc_fn13, 0 },	\
	Event { "function fourteen",	"fn_14" },	Keypress { kc_fn14, 0 },	\
	Event { "function fifteen",		"fn_15" },	Keypress { kc_fn15, 0 },	\
	Event { "function sixteen",		"fn_16" },	Keypress { kc_fn16, 0 }

#pragma mark _LetterKeys_
#define _LetterKeys_		\
	Event { "halfa",	"a" },	Keypress { kc_A, 0 },		\
	Event { "alfa",		"a" },	Keypress { kc_A, 0 },		\
	Event { "bravo",	"b" },	Keypress { kc_B, 0 },		\
	Event { "charlie",	"c" },	Keypress { kc_C, 0 },		\
	Event { "david",	"d" },	Keypress { kc_D, 0 },		\
	Event { "elwood",	"e" },	Keypress { kc_E, 0 },		\
	Event { "fiddle",	"f" },	Keypress { kc_F, 0 },		\
	Event { "golf",		"g" },	Keypress { kc_G, 0 },		\
	Event { "hotel",	"h" },	Keypress { kc_H, 0 },		\
	Event { "india",	"i" },	Keypress { kc_I, 0 },		\
	Event { "juliet",	"j" },	Keypress { kc_J, 0 },		\
	Event { "kilo",		"k" },	Keypress { kc_K, 0 },		\
	Event { "leema",	"l" },	Keypress { kc_L, 0 },		\
	Event { "michael",	"m" },	Keypress { kc_M, 0 },		\
	Event { "november",	"n" },	Keypress { kc_N, 0 },		\
	Event { "oscar",	"o" },	Keypress { kc_O, 0 },		\
	Event { "papa",		"p" },	Keypress { kc_P, 0 },		\
	Event { "quiver",	"q" },	Keypress { kc_Q, 0 },		\
	Event { "romeo",	"r" },	Keypress { kc_R, 0 },		\
	Event { "sierra",	"s" },	Keypress { kc_S, 0 },		\
	Event { "tango",	"t" },	Keypress { kc_T, 0 },		\
	Event { "uniform",	"u" },	Keypress { kc_U, 0 },		\
	Event { "victor",	"v" },	Keypress { kc_V, 0 },		\
	Event { "wiggle",	"w" },	Keypress { kc_W, 0 },		\
	Event { "whiskey",	"w" },	Keypress { kc_W, 0 },		\
	Event { "hexpert",	"x" },	Keypress { kc_X, 0 },		\
	Event { "yankee",	"y" },	Keypress { kc_Y, 0 },		\
	Event { "zulu",		"z" },	Keypress { kc_Z, 0 }

#pragma mark _NumberKeys_
#define _NumberKeys_		\
	Event { "one",		"1" },	Keypress { kc_1, 0 },		\
	Event { "two",		"2" },	Keypress { kc_2, 0 },		\
	Event { "three",	"3" },	Keypress { kc_3, 0 },		\
	Event { "four",		"4" },	Keypress { kc_4, 0 },		\
	Event { "five",		"5" },	Keypress { kc_5, 0 },		\
	Event { "six",		"6" },	Keypress { kc_6, 0 },		\
	Event { "seven",	"7" },	Keypress { kc_7, 0 },		\
	Event { "eight",	"8" },	Keypress { kc_8, 0 },		\
	Event { "nine",		"9" },	Keypress { kc_9, 0 },		\
	Event { "zero",		"0" },	Keypress { kc_0, 0 }

#pragma mark _DirectionKeys_
#define _DirectionKeys_		\
	Event { "left",		"left arrow" },	Keypress { kc_left, 0 },	\
	Event { "right",	"right arrow" },	Keypress { kc_right, 0 },	\
	Event { "north",	"up arrow" },	Keypress { kc_up, 0 },	\
	Event { "down",		"down arrow" },	Keypress { kc_down, 0 }
				
#pragma mark _ModifierKeys_
#define _ModifierKeys_		\
	Event { "command",		"command key" },	Keypress { 0, mf_command },	\
	Event { "shift",		"shift key" },	Keypress { 0, mf_shift },		\
	Event { "capital",		"shift key" },	Keypress { 0, mf_shift },		\
	Event { "capslock",		"capslock key" },	Keypress { 0, mf_capslock },	\
	Event { "option",		"option key" },	Keypress { 0, mf_option },		\
	Event { "control",		"control key" },	Keypress { 0, mf_control },	\
	Event { "shiftlock",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },	\
	Event { "lock shift",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },	\
	Event { "lock command",	"lock or unlock command key" },	Keypress { 0, mf_command + mf_toggle },	\
	Event { "lock option",	"lock or unlock option key" },	Keypress { 0, mf_option + mf_toggle },	\
	Event { "lock control",	"lock or unlock control key" },	Keypress { 0, mf_control + mf_toggle },	\

#pragma mark _WhitespaceKeys_
#define _ReturnKey_			\
		Event { "return",		"return key" },	Keypress { kc_return, 0 }
#define _TabKey_			\
		Event { "tab",			"tab key" },	Keypress { kc_tab, 0 }
#define _SpaceKey_			\
		Event { "space",		"space bar" },	Keypress { kc_space, 0 }

#define _WhitespaceKeys_	\
			_ReturnKey_,	\
			_TabKey_,		\
			_SpaceKey_
			
#pragma mark _SymbolKeys_
#define _SymbolKeys_		\
	Event { "tilde",			"`" },	Keypress { kc_accent, 0 },		\
	Event { "switch",			"`" },	Keypress { kc_accent, 0 },		\
	Event { "accent mark",		"`" },	Keypress { kc_accent, 0 },		\
	Event { "minus sign",		"-" },	Keypress { kc_minus, 0 },			\
	Event { "underscore",		"_" },	Keypress { kc_minus, mf_shift },	\
	Event { "equal sign",		"=" },	Keypress { kc_equal, 0 },			\
	Event { "bracket",			"[" },	Keypress { kc_bracket, 0 },		\
	Event { "close bracket",	"]" },	Keypress { kc_closebracket, 0 },	\
	Event { "backslash",		"\\" },	Keypress { kc_backslash, 0 },		\
	Event { "semicolon",		";" },	Keypress { kc_semicolon, 0 },		\
	Event { "quote mark",		"\'" },	Keypress { kc_quote, 0 },			\
	Event { "single quote",		"\'" },	Keypress { kc_quote, 0 },			\
	Event { "double quote",		"\'" },	Keypress { kc_quote, mf_shift },	\
	Event { "comma",			"," },	Keypress { kc_comma, 0 },			\
	Event { "period",			"." },	Keypress { kc_period, 0 },		\
	Event { "slash mark",		"/" },	Keypress { kc_slash, 0 },			\
	Event { "stroke",			"/" },	Keypress { kc_slash, 0 },			\
	Event { "asterisk", 		"*" },	Keypress { kc_8, mf_shift }

//	Event { "pipe",				"\\" },	Keypress { kc_backslash, 0 },		\
			
#pragma mark Special Keys
#define _EnterKey_			\
	Event { "enter",		"enter key" },	Keypress { kc_enter, 0 }
#define _DeleteKey_			\
	Event { "delete",		"delete key" },	Keypress { kc_delete, 0 },	\
	Event { "strike",		"delete key" },	Keypress { kc_delete, 0 }
#define _FDeleteKey_		\
	Event { "chomp",		"forward delete key" },	Keypress { kc_fdelete, 0 }
#define _EscapeKey_			\
	Event { "escape",		"escape key" },	Keypress { kc_escape, 0 }
#define _HelpKey_			\
	Event { "help",			"help key" },	Keypress { kc_help, 0 }
#define _HomeKey_			\
	Event { "page home",	"home key" },	Keypress { kc_home, 0 }
#define _EndKey_			\
	Event { "page end",		"end key" },	Keypress { kc_end, 0 }
#define _PageUpKey_			\
	Event { "page north",	"page up key" },	Keypress { kc_pageup, 0 }
#define _PageDownKey_		\
	Event { "page down",	"page down key" },	Keypress { kc_pagedown, 0 }

#pragma mark 5 === Repeating Subslates
#pragma mark _JumpDownSubslate_
#define _JumpDownSubslate_	\
	Event { "jump down", "down <n> times" },	Subslate { "<n>" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		ExitEvent { "one", "" },		Sequence{},	\
			Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "two", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "three", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "four", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "five", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "six", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "seven", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "eight", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "nine", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "ten", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "twenty", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "thirty", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		ExitEvent { "forty", "" },		Sequence{},	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
			endSequence{},	\
		endSubslate{}

#pragma mark HTML editing support
#define	_next		NilAction{}
#define	_previous	NilAction{}

#define _ElementItems_		\
		ExitEvent { "shebang", "" },				Sequence{},		\
			TypeText { "#! /bin/ksh" }, _return, _return, endSequence{},		\
		ExitEvent { "quote variable", "" },				Sequence{},		\
			TypeText { "\"${<##>}\"<##>" }, _previous, _previous, endSequence{},		\
		ExitEvent { "variable", "" },				Sequence{},		\
			TypeText { "${<##>}<##>" }, _previous, _previous, endSequence{},		\
		ExitEvent { "command", "" },				Sequence{},		\
			TypeText { "\"$(<##>)\"<##>" }, _previous, _previous, endSequence{},		\
		ExitEvent { "plain command", "" },				Sequence{},		\
			TypeText { "$(<##>)<##>" }, _previous, _previous, endSequence{},		\
		ExitEvent { "if block", "" },		Sequence{}, TypeText { "if [[ <##> ]] ; then" },		\
			_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },		\
			_previous, _previous, endSequence{},		\
		ExitEvent { "check status", "" },		Sequence{},		\
			TypeText { "if [[ \"${?}\" > 0 ]] ; then" },		\
			_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },		\
			_previous, _previous, endSequence{},		\
		ExitEvent { "where", "" },			TypeText { "$0#$LINENO: " },		\
		ExitEvent { "marker", "" },					Sequence{}, TypeText { "<!-- @marker \"<#marker#>\" -->" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "topic item", "" },				Sequence{},		\
			TypeText { "<!-- @topicItem \"<#title#>\" \"<#linkDestination#>\" \"<#indent0-3#>\" \"<#[description]#>\" -->" }, _up, _next, endSequence{},		\
		ExitEvent { "topic Group", "" },	Sequence{},		\
			TypeText { "<!-- @topicGroup \"<#title#>\" \"<#linenum#>\" -->" }, _previous, _previous, endSequence{},		\
		ExitEvent { "topic Separator", "" },	TypeText { "<!-- @topicSep -->" },		\
		ExitEvent { "goal", "" },		Sequence{}, TypeText { "<!-- @goal \"<#[actorOrTopic]#>\" \"<#goal#>\" \"<#[expansionLink]#>\" \"<#[priorityOrVersion]#>\" -->" }, _previous,  _previous, _previous, _previous, endSequence{},		\
		ExitEvent { "content heading", "" },		Sequence{},		\
			TypeText { "@contentHeading <#title#>; <#name#>; <#level#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "heading with name", "" },		Sequence{},		\
			TypeText { "@headingWithName <#title#>; <#name#>; <#level#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "heading with topics", "" },	Sequence{},		\
			TypeText { "@headingWithTopics <#title#>; <#name#>; <#level#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "version", "" },				Sequence{},		\
			TypeText { "@version <#title#>; <#pTag(pt)#>; <#vTag(0p1)#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "objective", "" },				Sequence{},		\
			TypeText { "@objective <#title#>; <#vtag#>; <#mtag#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "step", "" },		Sequence{},		\
			TypeText { "@step <#title#>; <#mtag#>; <#stag#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "bug or issue", "" },		Sequence{},		\
			TypeText { "@bugOrIssue <#title#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "link step", "" },		Sequence{},		\
			TypeText { "<a href=\"#PROJECTNAME#_hist.html#<#stepTag#>\">[<#stepTag#>]</a>" }, 	\
			Keypress { kc_U, mf_command + mf_control }, _previous, _previous, endSequence{},	\
		ExitEvent { "thread tag", "" },		Sequence{}, 		\
			TypeText { "<li id='<#ttag#>'><#title#> <span class='ttag'>[<#ttag#>]</span><ul>" }, _return,	\
			_delete, TypeText { "</ul></li>" }, _previous, _previous, _previous, endSequence{},		\
		ExitEvent { "current tag", "" },	Sequence{},	TypeText { "<li class='tlmark'>&lt;--</li>" }, _previous, endSequence{},		\
		ExitEvent { "date mark", "" },		Sequence{},		\
			TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previous, endSequence{},		\
		ExitEvent { "future note", "" },		Sequence{},		\
			TypeText { "@futureNote <#title#>; <#name#>" }, _return, _up, _next, endSequence{},		\
		ExitEvent { "app or tool", "" },		Sequence{},		\
			TypeText { "@appOrTool <#name#>" }, _return, endSequence{},		\
		ExitEvent { "assert equal", "" },	TypeText { "assertEquals \"$LINENO: <#message#>\" <#expected#> <#actual#>" },	\
		ExitEvent { "assert not equal", "" },	TypeText { "assertNotEquals \"$LINENO: <#message#>\" <#unexpected#> <#actual#>" },	\
		ExitEvent { "assert null", "" },	TypeText { "assertNull \"$LINENO: <#message#>\" <#value#>" },	\
		ExitEvent { "assert not null", "" },	TypeText { "assertNotNull \"$LINENO: <#message#>\" <#value#>" },	\
		ExitEvent { "assert true", "" },	TypeText { "assertTrue \"$LINENO: <#message#>\" <#condition#>" },	\
		ExitEvent { "assert false", "" },	TypeText { "assertFalse \"$LINENO: <#message#>\" <#condition#>" },	\
		ExitEvent { "assert failure", "" },	TypeText { "fail \"$LINENO: <#message#>\"" },	\
		ExitEvent { "pragma", "" }, TypeText { "#pragma mark " },		\
		ExitEvent { "unix selection", "" }, TypeText { "%%%{PBXSelection}%%%" },		\
		ExitEvent { "ampersand", "" }, TypeText { "&amp;" },		\
		ExitEvent { "less than", "" }, TypeText { "&lt;" },		\
		ExitEvent { "greater than", "" }, TypeText { "&gt;" },		\
		ExitEvent { "angle brackets", "" },	Sequence{}, TypeText { "&lt;&gt;<##> " }, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},		\
		ExitEvent { "hard space", "" }, TypeText { "&nbsp;" },		\
		ExitEvent { "arrow left", "" }, TypeText { "&larr;" },		\
		ExitEvent { "arrow right", "" }, TypeText { "&rarr;" },		\
		ExitEvent { "arrow up", "" }, TypeText { "&uarr;" },		\
		ExitEvent { "arrow down", "" }, TypeText { "&darr;" },		\
		ExitEvent { "check mark", "" }, TypeText { "&radic;" },		\
		ExitEvent { "bullet", "" }, TypeText { "&bull;" },		\
		ExitEvent { "diamond", "" }, TypeText { "&loz;" }

#pragma mark _JumpNorthSubslate_
#define	_JumpNorthSubslate_	\
	Event { "jump north", "up <n> times" },	Subslate { "<n>" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		ExitEvent { "one", "" },		Sequence{},	\
			Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "two", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "three", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "four", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "five", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "six", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "seven", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "eight", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "nine", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "ten", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "twenty", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "thirty", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		ExitEvent { "forty", "" },		Sequence{},	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
			endSequence{},	\
		endSubslate{}

#pragma mark _JumpRightSubslate_
#define	_JumpRightSubslate_	\
	Event { "jump right", "option-right <n> times" },	Subslate { "<n>" },                                                                                                               \
		_SlateGlobals_,                                                                                                                                                                    \
		_CloseSubslate_,                                                                                                                                                                   \
		ExitEvent { "one", "" },		Sequence{},                                                                                                                                              \
			Keypress { kc_right, mf_option },                                                                                                                                                 \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "two", "" },		Sequence{},                                                                                                                                              \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                                                                                               \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "three", "" },		Sequence{},                                                                                                                                            \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                                                             \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "four", "" },		Sequence{},                                                                                                                                             \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                           \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "five", "" },		Sequence{},                                                                                                                                             \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },         \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "six", "" },		Sequence{},                                                                                                                                              \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                                                                                                                              \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "seven", "" },		Sequence{},                                                                                                                                            \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                                                                                            \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "eight", "" },		Sequence{},                                                                                                                                            \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                                                          \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "nine", "" },		Sequence{},                                                                                                                                             \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },                                        \
			endSequence{},                                                                                                                                                                    \
		ExitEvent { "ten", "" },		Sequence{},                                                                                                                                              \
			Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },      \
			endSequence{},                                                                                                                                                                    \
		endSubslate{},

#pragma mark _JumpLeftSubslate_
#define	_JumpLeftSubslate_	\
	Event { "jump left", "option-left <n> times" },	Subslate { "<n>" },                                                                                                        \
		_SlateGlobals_,                                                                                                                                                          \
		ExitEvent { "one", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_left, mf_option },                                                                                                                                        \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "two", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                                                                                       \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "three", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                                                      \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "four", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                     \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "five", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },    \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "six", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                                                                                                                          \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "seven", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                                                                                         \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "eight", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                                                        \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "nine", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },                                       \
			endSequence{},                                                                                                                                                          \
		ExitEvent { "ten", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },      \
			endSequence{},                                                                                                                                                          \
		endSubslate{},

#pragma mark _TabAheadSubslate_
#define	_TabAheadSubslate_	\
	Event { "tab ahead", "tab <n> times" },	Subslate { "ta<n>" },                                                                                                 \
		_SlateGlobals_,																							\
		ExitEvent { "okay", "" },		NilAction{},																																	\
		Event { "one", "" },		Sequence{},                                      \
			Keypress { kc_tab, 0 },                                          \
			endSequence{},                                                                                                                                                          \
		Event { "two", "" },		Sequence{},                                                                                                                     \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                                                                                        \
			endSequence{},                                                                                                                                           \
		Event { "three", "" },		Sequence{},                                                                                                                   \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                                                       \
			endSequence{},                                                                                                                                           \
		Event { "four", "" },		Sequence{},                                                                                                                    \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                      \
			endSequence{},                                                                                                                                           \
		Event { "five", "" },		Sequence{},                                                                                                                    \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },    \
			endSequence{},                                                                                                                                           \
		Event { "six", "" },		Sequence{},                                                                                                                     \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                                                                                                                                          \
			endSequence{},                                                                                                                                           \
		Event { "seven", "" },		Sequence{},                                                                                                                   \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                                                                                                         \
			endSequence{},                                                                                                                                           \
		Event { "eight", "" },		Sequence{},                                                                                                                   \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                                                                        \
			endSequence{},                                                                                                                                           \
		Event { "nine", "" },		Sequence{},                                                                                                                    \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },                                       \
			endSequence{},                                                                                                                                           \
		Event { "ten", "" },		Sequence{},                                                                                                                     \
			Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 }, Keypress { kc_tab, 0 },      \
			endSequence{},                                                                                                                                           \
		endSubslate{},

#pragma mark _GoLeftItems_
#define	_GoLeftItems_	\
	ExitEvent { "one", "" },		Sequence{}, _left, endSequence{},	\
	ExitEvent { "two", "" },		Sequence{}, _left, _left, endSequence{},	\
	ExitEvent { "three", "" },		Sequence{},	_left, _left, _left, endSequence{},	\
	ExitEvent { "four", "" },		Sequence{},	_left, _left, _left, _left,	endSequence{},	\
	ExitEvent { "five", "" },		Sequence{},	_left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "six", "" },		Sequence{},	_left, _left, _left, _left, _left, _left, endSequence{}, \
	ExitEvent { "seven", "" },		Sequence{},	_left, _left, _left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "eight", "" },		Sequence{},	_left, _left, _left, _left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "nine", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "ten", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "twenty", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "thirty", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left,	 _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},	\
	ExitEvent { "forty", "" },		Sequence{}, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left,	 _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{}

#pragma mark _GoRightItems_
#define	_GoRightItems_	\
	ExitEvent { "one", "" },		Sequence{}, _right, endSequence{},	\
	ExitEvent { "two", "" },		Sequence{}, _right, _right, endSequence{},	\
	ExitEvent { "three", "" },		Sequence{},	_right, _right, _right, endSequence{},	\
	ExitEvent { "four", "" },		Sequence{},	_right, _right, _right, _right,	endSequence{},	\
	ExitEvent { "five", "" },		Sequence{},	_right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "six", "" },		Sequence{},	_right, _right, _right, _right, _right, _right, endSequence{}, \
	ExitEvent { "seven", "" },		Sequence{},	_right, _right, _right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "eight", "" },		Sequence{},	_right, _right, _right, _right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "nine", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "ten", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "twenty", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "thirty", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right,	 _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{},	\
	ExitEvent { "forty", "" },		Sequence{}, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right,	 _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, _right, endSequence{}

#pragma mark _TabBackSubslate_
#define	_TabBackSubslate_	\
	Event { "tab back", "shift-tab <n> times" },	Subslate { "tb<n>" },                                                                                         \
		_SlateGlobals_,																							\
		ExitEvent { "okay", "" },		NilAction{},																																	\
		Event { "one", "" },		Sequence{},                                                                                                                     \
			Keypress { kc_tab, mf_shift },                                                                                                                         \
			endSequence{},                                                                                                                                           \
		Event { "two", "" },		Sequence{},                                                                                                                     \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                                                                        \
			endSequence{},                                                                                                                                                          \
		Event { "three", "" },		Sequence{},  \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                                                                                             \
			endSequence{},                                                                 \
		Event { "four", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                     \
			endSequence{},                                                                                                                                                          \
		Event { "five", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },    \
			endSequence{},                                                                                                                                                          \
		Event { "six", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                                                                                                                          \
			endSequence{},                                                                                                                                                          \
		Event { "seven", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                                                                                         \
			endSequence{},                                                                                                                                                          \
		Event { "eight", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                                                        \
			endSequence{},                                                                                                                                                          \
		Event { "nine", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },                                       \
			endSequence{},                                                                                                                                                          \
		Event { "ten", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift }, Keypress { kc_tab, mf_shift },      \
			endSequence{},                                                                                                                                                          \
		endSubslate{},

#define		_ScanAheadItems_	\
		Event { "one", "" },		Sequence{}, Keypress { kc_tab, mf_option }, endSequence{},                                    \
		Event { "two", "" },		Sequence{}, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},                                    \
		Event { "three", "" },		Sequence{}, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},                                    \
		Event { "four", "" },		Sequence{}, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},    \
		Event { "five", "" },		Sequence{}, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},                                    \
		Event { "six", "" },		Sequence{}, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},                                    \
		Event { "seven", "" },		Sequence{},            \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },                                                                                                         \
			endSequence{},                                    \
		Event { "eight", "" },		Sequence{},            \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },                                                                        \
			endSequence{},                                    \
		Event { "nine", "" },		Sequence{},             \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },                                       \
			endSequence{},                                    \
		Event { "ten", "" },		Sequence{},              \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			endSequence{},                                    \
		Event { "twenty", "" },		Sequence{},              \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			endSequence{},                                    \
		Event { "thirty", "" },		Sequence{},              \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			endSequence{},                                    \
		Event { "forty", "" },		Sequence{},              \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			endSequence{},                                    \
		Event { "sixty", "" },		Sequence{},              \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			endSequence{},                                    \
		Event { "eighty", "" },		Sequence{},              \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option },      \
			endSequence{}

#define		_ScanBackItems_	\
		Event { "one", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option },                                                                                                                                        \
			endSequence{},                                                                                                                                                          \
		Event { "two", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                                                                                       \
			endSequence{},                                                                                                                                                          \
		Event { "three", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                                                      \
			endSequence{},                                                                                                                                                          \
		Event { "four", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                     \
			endSequence{},                                                                                                                                                          \
		Event { "five", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },    \
			endSequence{},                                                                                                                                                          \
		Event { "six", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                                                                                                                          \
			endSequence{},                                                                                                                                                          \
		Event { "seven", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                                                                                         \
			endSequence{},                                                                                                                                                          \
		Event { "eight", "" },		Sequence{},                                                                                                                                  \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                                                        \
			endSequence{},                                                                                                                                                          \
		Event { "nine", "" },		Sequence{},                                                                                                                                   \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },                                       \
			endSequence{},                                                                                                                                                          \
		Event { "ten", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			endSequence{},                                                                                                                                                          \
		Event { "twenty", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			endSequence{},                                                                                                                                                          \
		Event { "thirty", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			endSequence{},                                                                                                                                                          \
		Event { "forty", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			endSequence{},                                                                                                                                                          \
		Event { "sixty", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			endSequence{},                                                                                                                                                          \
		Event { "eighty", "" },		Sequence{},                                                                                                                                    \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option }, Keypress { kc_tab, mf_shift + mf_option },      \
			endSequence{}

#define		_TabAheadItems_	\
		Event { "one", "" },		Sequence{}, _tab, endSequence{},                                    \
		Event { "two", "" },		Sequence{}, _tab, _tab, endSequence{},                              \
		Event { "three", "" },		Sequence{}, _tab, _tab, _tab, endSequence{},                        \
		Event { "four", "" },		Sequence{}, _tab, _tab, _tab, _tab, endSequence{},    				\
		Event { "five", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, endSequence{},            \
		Event { "six", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},      \
		Event { "seven", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                                    \
		Event { "eight", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,	endSequence{},                              \
		Event { "nine", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                        \
		Event { "ten", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                  \
		Event { "twenty", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                     \
		Event { "thirty", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                                    \
		Event { "forty", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                                    \
		Event { "sixty", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{},                                    \
		Event { "eighty", "" },		Sequence{}, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab,      \
			_tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, _tab, endSequence{}

#define		_TabBackItems_	\
		Event { "one", "" },		Sequence{}, _tabBack, endSequence{},                                    \
		Event { "two", "" },		Sequence{}, _tabBack, _tabBack, endSequence{},                              \
		Event { "three", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, endSequence{},                        \
		Event { "four", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},    				\
		Event { "five", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},            \
		Event { "six", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},      \
		Event { "seven", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                                    \
		Event { "eight", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,	endSequence{},                              \
		Event { "nine", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                        \
		Event { "ten", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                  \
		Event { "twenty", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                     \
		Event { "thirty", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                                    \
		Event { "forty", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                                    \
		Event { "sixty", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{},                                    \
		Event { "eighty", "" },		Sequence{}, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack,      \
			_tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, _tabBack, endSequence{}

#pragma mark _ScanAheadSubslate_
#define	_ScanAheadSubslate_	\
	Event { "scan ahead", "scan <n> times" },	Subslate { "sa<n>" },	\
		_SlateGlobals_,												\
		ExitEvent { "okay", "" },	NilAction{},					\
		Event { "enter", "" },		Keypress { kc_enter, 0 },		\
		_WhitespaceKeys_,		\
		_CommandSlate_,			\
		_ScanAheadItems_,		\
		endSubslate{}

#pragma mark _ScanBackSubslate_
#define	_ScanBackSubslate_	\
	Event { "scan back", "scan back <n> times" },	Subslate { "sb<n>" },                                                                                                        \
		_SlateGlobals_,																							\
		ExitEvent { "okay", "" },		NilAction{},															\
		Event { "enter", "" },		Keypress { kc_enter, 0 },													\
		_WhitespaceKeys_,		\
		_CommandSlate_,			\
		endSubslate{},

#pragma mark _DoJumpSubslate_
#define _DoJumpSubslate_	\
	Event { "do jump", "" },	Subslate { "jump" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		Event { "right", "" },	Subslate { "right" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, \			endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, \
				endSequence{},	\
			endSubslate{},	\
		Event { "left", "" },	Subslate { "left" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, \
				endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
 				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, \
				endSequence{},	\
			endSubslate{},	\
		Event { "north", "" },	Subslate { "up" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },	\
				endSequence{},	\
			ExitEvent { "twenty", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, \
				endSequence{},	\
			ExitEvent { "forty", "" },		Sequence{},	\
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, \
					Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, \
				endSequence{},	\
			endSubslate{},	\
		Event { "down", "" },	Subslate { "down" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },	\
				endSequence{},	\
			ExitEvent { "twenty", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, \
				endSequence{},	\
			ExitEvent { "forty", "" },		Sequence{},	\
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, \
					Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, \
				endSequence{},	\
			endSubslate{},	\
		endSubslate{}

#pragma mark _DoSelectSubslate_
#define _DoSelectSubslate_	\
	Event { "do select", "" },	Subslate { "sel" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		Event { "right", "" },	Subslate { "right" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, \			endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, \
				endSequence{},	\
			endSubslate{},	\
		Event { "left", "" },	Subslate { "left" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, \
				endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, \
				endSequence{},	\
			endSubslate{},	\
		Event { "north", "" },	Subslate { "up" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },	\
				endSequence{},	\
			ExitEvent { "twenty", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, \
				endSequence{},	\
			ExitEvent { "forty", "" },		Sequence{},	\
				Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, \
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, \
				endSequence{},	\
			endSubslate{},	\
		Event { "down", "" },	Subslate { "down" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "two", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "three", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "four", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "five", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "six", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "seven", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "eight", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "nine", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "ten", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },	\
				endSequence{},	\
			ExitEvent { "twenty", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, \
				endSequence{},	\
			ExitEvent { "forty", "" },		Sequence{},	\
				Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, \
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, \
				endSequence{},	\
			endSubslate{},	\
		endSubslate{}

#pragma mark 7 === Item Groups
#define _MicrophoneOn_		Event { "microphone on", "" },	Sequence{}, Click { 1, -55, 55, _screen, _topRight }, ResSubslate { resid_DragonSlate }, endSequence{}
#define _CloseRecognitionWindow_	Click { 1, -420, -385, _screen, _bottomRight }

#define _Dictate_		Event { "dictate", "" },	Sequence{}, Keypress { kc_6, mf_command + mf_option + mf_control + mf_shift }, ResSubslate { resid_DictateSlate }, endSequence{}

#pragma mark _TypeSlateItems_
#define _TypeSlateItemsWithoutDictation_	\
	_DirectionKeys_,	\
	_ModifierKeys_,		\
	_WhitespaceKeys_,	\
	_EnterKey_,			\
	_DeleteKey_,		\
	_FDeleteKey_,		\
	_PageUpKey_,		\
	_PageDownKey_,		\
	_HomeKey_,			\
	_EndKey_,			\
	_SymbolKeys_,		\
	_LetterKeys_,		\
	_NumberKeys_,		\
	_FunctionKeys_,		\
	_DialogSlate_,		\
	_DoJumpSubslate_,	\
	Event { "clear modifiers", "clear all modifier flags" }, Command { cmd_ClearModifiers },	\
	Event { "escape", "escape" }, Keypress { kc_escape, 0 }

#define _TypeSlateItems_	\
	_TypeSlateItemsWithoutDictation_,	\
	_MicrophoneOn_,						\
	_Dictate_,						\
	Event { "close recognition window", "" },		_CloseRecognitionWindow_

#pragma mark _TypeSpecialBaseItems_
#define	_TypeSpecialBaseItems_	\
	ExitEvent { "my e mail",	"" },	TypeText { "carolclark@cox.net" },	\
	ExitEvent { "software", "" },		TypeText { "C & C Software" },		\
	ExitEvent { "Kids Corner", "" },	TypeText { "Kid's Corner" },		\
	ExitEvent { "version 3", "" },		TypeText { "4YZHqz5pq1" },			\
	ExitEvent { "IP address", "" },		TypeText { "192.168.0.104" },		\
	ExitEvent { "shebang", "" },		TypeText { "#! /bin/ksh" }

#pragma mark _CommandSlateItems_
#define _CommandSlateItems_	\
	Event { "shift",		"shift key" },	Keypress { 0, mf_shift },		\
	Event { "capital",		"shift key" },	Keypress { 0, mf_shift },		\
	Event { "capslock",		"capslock key" },	Keypress { 0, mf_capslock },	\
	Event { "option",		"option key" },	Keypress { 0, mf_option },		\
	Event { "control",		"control key" },	Keypress { 0, mf_control },	\
	Event { "shiftlock",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },	\
	Event { "lock shift",	"lock or unlock shift key" },	Keypress { 0, mf_shift + mf_toggle },	\
	Event { "lock option",	"lock or unlock option key" },	Keypress { 0, mf_option + mf_toggle },	\
	Event { "lock control",	"lock or unlock control key" },	Keypress { 0, mf_control + mf_toggle },	\
	ExitEvent { "return",		"command-return key" },	Keypress { kc_return, mf_command },	\
	ExitEvent { "tab",			"command-tab key" },	Keypress { kc_tab, mf_command },	\
	ExitEvent { "space",		"command-space bar" },	Keypress { kc_space, mf_command },	\
	ExitEvent { "left",			"command-left arrow" },	Keypress { kc_left, mf_command },	\
	ExitEvent { "right",		"command-right arrow" },	Keypress { kc_right, mf_command },	\
	ExitEvent { "north",		"command-up arrow" },	Keypress { kc_up, mf_command },		\
	ExitEvent { "down",			"command-down arrow" },	Keypress { kc_down, mf_command },	\
	ExitEvent { "enter",		"command-enter key" },	Keypress { kc_enter, mf_command },	\
	ExitEvent { "delete",		"command-delete key" },	Keypress { kc_delete, mf_command },	\
	ExitEvent { "strike",		"command-delete key" },	Keypress { kc_delete, mf_command },	\
	ExitEvent { "chomp",		"command-forward delete key" },	Keypress { kc_fdelete, mf_command },	\
	ExitEvent { "halfa",	"command-a" },	Keypress { kc_A, mf_command },		\
	ExitEvent { "alfa",		"command-a" },	Keypress { kc_A, mf_command },		\
	ExitEvent { "bravo",	"command-b" },	Keypress { kc_B, mf_command },		\
	ExitEvent { "charlie",	"command-c" },	Keypress { kc_C, mf_command },		\
	ExitEvent { "david",	"command-d" },	Keypress { kc_D, mf_command },		\
	ExitEvent { "elwood",	"command-e" },	Keypress { kc_E, mf_command },		\
	ExitEvent { "fiddle",	"command-f" },	Keypress { kc_F, mf_command },		\
	ExitEvent { "golf",		"command-g" },	Keypress { kc_G, mf_command },		\
	ExitEvent { "hotel",	"command-h" },	Keypress { kc_H, mf_command },		\
	ExitEvent { "india",	"command-i" },	Keypress { kc_I, mf_command },		\
	ExitEvent { "juliet",	"command-j" },	Keypress { kc_J, mf_command },		\
	ExitEvent { "kilo",		"command-k" },	Keypress { kc_K, mf_command },		\
	ExitEvent { "leema",	"command-l" },	Keypress { kc_L, mf_command },		\
	ExitEvent { "michael",	"command-m" },	Keypress { kc_M, mf_command },		\
	ExitEvent { "november",	"command-n" },	Keypress { kc_N, mf_command },		\
	ExitEvent { "oscar",	"command-o" },	Keypress { kc_O, mf_command },		\
	ExitEvent { "papa",		"command-p" },	Keypress { kc_P, mf_command },		\
	ExitEvent { "quiver",	"command-q" },	Keypress { kc_Q, mf_command },		\
	ExitEvent { "romeo",	"command-r" },	Keypress { kc_R, mf_command },		\
	ExitEvent { "sierra",	"command-s" },	Keypress { kc_S, mf_command },		\
	ExitEvent { "tango",	"command-t" },	Keypress { kc_T, mf_command },		\
	ExitEvent { "uniform",	"command-u" },	Keypress { kc_U, mf_command },		\
	ExitEvent { "victor",	"command-v" },	Keypress { kc_V, mf_command },		\
	ExitEvent { "wiggle",	"command-w" },	Keypress { kc_W, mf_command },		\
	ExitEvent { "whiskey",	"command-w" },	Keypress { kc_W, mf_command },		\
	ExitEvent { "hexpert",	"command-x" },	Keypress { kc_X, mf_command },		\
	ExitEvent { "yankee",	"command-y" },	Keypress { kc_Y, mf_command },		\
	ExitEvent { "zulu",		"command-z" },	Keypress { kc_Z, mf_command },		\
	ExitEvent { "one",		"command-1" },	Keypress { kc_1, mf_command },		\
	ExitEvent { "two",		"command-2" },	Keypress { kc_2, mf_command },		\
	ExitEvent { "three",	"command-3" },	Keypress { kc_3, mf_command },		\
	ExitEvent { "four",		"command-4" },	Keypress { kc_4, mf_command },		\
	ExitEvent { "five",		"command-5" },	Keypress { kc_5, mf_command },		\
	ExitEvent { "six",		"command-6" },	Keypress { kc_6, mf_command },		\
	ExitEvent { "seven",	"command-7" },	Keypress { kc_7, mf_command },		\
	ExitEvent { "eight",	"command-8" },	Keypress { kc_8, mf_command },		\
	ExitEvent { "nine",		"command-9" },	Keypress { kc_9, mf_command },		\
	ExitEvent { "zero",		"command-0" },	Keypress { kc_0, mf_command },		\
	ExitEvent { "tilde",			"command-`" },	Keypress { kc_accent, mf_command },		\
	ExitEvent { "switch",			"command-`" },	Keypress { kc_accent, mf_command },		\
	ExitEvent { "accent mark",		"command-`" },	Keypress { kc_accent, mf_command },		\
	ExitEvent { "minus sign",		"command--" },	Keypress { kc_minus, mf_command },			\
	ExitEvent { "equal sign",		"command-=" },	Keypress { kc_equal, mf_command },			\
	ExitEvent { "bracket",			"command-[" },	Keypress { kc_bracket, mf_command },		\
	ExitEvent { "close bracket",	"command-]" },	Keypress { kc_closebracket, mf_command },	\
	ExitEvent { "backslash",		"command-\\" },	Keypress { kc_backslash, mf_command },		\
	ExitEvent { "semicolon",		"command-;" },	Keypress { kc_semicolon, mf_command },		\
	ExitEvent { "quote mark",		"command-\'" },	Keypress { kc_quote, mf_command },			\
	ExitEvent { "comma",			"command-," },	Keypress { kc_comma, mf_command },			\
	ExitEvent { "period",			"command-." },	Keypress { kc_period, mf_command },		\
	ExitEvent { "slash mark",		"command-/" },	Keypress { kc_slash, mf_command },			\
	ExitEvent { "stroke",			"command-/" },	Keypress { kc_slash, mf_command },			\
	ExitEvent { "function one",			"command-fn_1" },	Keypress { kc_fn1, mf_command },	\
	ExitEvent { "function two",			"command-fn_2" },	Keypress { kc_fn2, mf_command },	\
	ExitEvent { "function three",		"command-fn_3" },	Keypress { kc_fn3, mf_command },	\
	ExitEvent { "function four",		"command-fn_4" },	Keypress { kc_fn4, mf_command },	\
	ExitEvent { "function five",		"command-fn_5" },	Keypress { kc_fn5, mf_command },	\
	ExitEvent { "function six",			"command-fn_6" },	Keypress { kc_fn6, mf_command },	\
	ExitEvent { "function seven",		"command-fn_7" },	Keypress { kc_fn7, mf_command },	\
	ExitEvent { "function eight",		"command-fn_8" },	Keypress { kc_fn8, mf_command },	\
	ExitEvent { "function nine",		"command-fn_9" },	Keypress { kc_fn9, mf_command },	\
	ExitEvent { "function ten",			"command-fn_10" },	Keypress { kc_fn10, mf_command },	\
	ExitEvent { "function eleven",		"command-fn_11" },	Keypress { kc_fn11, mf_command },	\
	ExitEvent { "function twelve",		"command-fn_12" },	Keypress { kc_fn12, mf_command },	\
	ExitEvent { "function thirteen",	"command-fn_13" },	Keypress { kc_fn13, mf_command },	\
	ExitEvent { "function fourteen",	"command-fn_14" },	Keypress { kc_fn14, mf_command },	\
	ExitEvent { "function fifteen",		"command-fn_15" },	Keypress { kc_fn15, mf_command }

#pragma mark _IMouseItems_
// for sections: 1/6 of screen
#define _section_x	280
#define _section_y	175
#define _IMouseItems_	\
	_SlateGlobals_,                                                                                \
	_CloseSubslate_,                                                                               \
	ExitEvent { "show position", "display information about the current cursor position" },	IMouse { im_Position, 0 },			\
	Event { "move", "move" },			IMouse { im_Move, 0 },                  \
	Event { "set mark", "" },			IMouse { im_MarkSet, 0 },				\
	Event { "drag to mark", "" },		IMouse { im_DragToMark, 0 },			\
	Event { "go to mark", "" },			IMouse { im_GoToMark, 0 },			\
	Event { "one", "set step size" },	IMouse { im_StepSize, 1 * _stepSize },                                            \
	Event { "two", "set step size" },	IMouse { im_StepSize, 2 * _stepSize },                                            \
	Event { "three", "set step size" },	IMouse { im_StepSize, 3 * _stepSize },                                          \
	Event { "four", "set step size" },	IMouse { im_StepSize, 4 * _stepSize },                                           \
	Event { "five", "set step size" },	IMouse { im_StepSize, 5 * _stepSize },                                           \
	Event { "six", "set step size" },	IMouse { im_StepSize, 6 * _stepSize },                                            \
	Event { "seven", "set step size" },	IMouse { im_StepSize, 7 * _stepSize },                                          \
	Event { "eight", "set step size" },	IMouse { im_StepSize, 8 * _stepSize },                                          \
	Event { "nine", "set step size" },	IMouse { im_StepSize, 9 * _stepSize },                                           \
	Event { "ten", "set step size" },	IMouse { im_StepSize, 10 * _stepSize },                                           \
	Event { "north", "move up" },		IMouse { im_Up, 0 },                                                                 \
	Event { "down", "move down" },		IMouse { im_Down, 0 },                                                              \
	Event { "left", "move to the left" },	IMouse { im_Left, 0 },                                                        \
	Event { "right", "move to the right" },	IMouse { im_Right, 0 },                                                     \
	Event { "click one", "single click" },	IMouse { im_Click, 1 },                                                      \
	Event { "click two", "double click" },	IMouse { im_Click, 2 },                                                      \
	Event { "click three", "triple click" },	IMouse { im_Click, 3 },                                                    \
	Event { "section", "" },	Subslate { "section" },                                                \
		_SlateGlobals_,                                                                                \
		_CloseSubslate_,                                                                               \
		ExitEvent { "one", "" },	Click { 0, 1 * _section_x, 1 * _section_y, _screen, _topLeft },		\
		ExitEvent { "two", "" },	Click { 0, 3 * _section_x, 1 * _section_y, _screen, _topLeft },		\
		ExitEvent { "three", "" },	Click { 0, 5 * _section_x, 1 * _section_y, _screen, _topLeft },		\
		ExitEvent { "four", "" },	Click { 0, 1 * _section_x, 3 * _section_y, _screen, _topLeft },		\
		ExitEvent { "five", "" },	Click { 0, 3 * _section_x, 3 * _section_y, _screen, _topLeft },		\
		ExitEvent { "six", "" },	Click { 0, 5 * _section_x, 3 * _section_y, _screen, _topLeft },		\
		ExitEvent { "seven", "" },	Click { 0, 1 * _section_x, 5 * _section_y, _screen, _topLeft },		\
		ExitEvent { "eight", "" },	Click { 0, 3 * _section_x, 5 * _section_y, _screen, _topLeft },		\
		ExitEvent { "nine", "" },	Click { 0, 5 * _section_x, 5 * _section_y, _screen, _topLeft },		\
		endSubslate{},		\
	Event { "adjust", "" },	Subslate { "adj" },	\
		_SlateGlobals_,	\
		_CloseSubslate_,	\
		Event { "right", "" },	Subslate { "right" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Click { 0, 1, 0, _cursor },				\
			ExitEvent { "two", "" },		Click { 0, 2, 0, _cursor },				\
			ExitEvent { "three", "" },		Click { 0, 3, 0, _cursor },				\
			ExitEvent { "four", "" },		Click { 0, 4, 0, _cursor },				\
			ExitEvent { "five", "" },		Click { 0, 5, 0, _cursor },				\
			ExitEvent { "six", "" },		Click { 0, 6, 0, _cursor },				\
			ExitEvent { "seven", "" },		Click { 0, 7, 0, _cursor },				\
			ExitEvent { "eight", "" },		Click { 0, 8, 0, _cursor },				\
			ExitEvent { "nine", "" },		Click { 0, 9, 0, _cursor },				\
			ExitEvent { "ten", "" },		Click { 0, 10, 0, _cursor },				\
			endSubslate{},	\
		Event { "left", "" },	Subslate { "left" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Click { 0, -1, 0, _cursor },				\
			ExitEvent { "two", "" },		Click { 0, -2, 0, _cursor },				\
			ExitEvent { "three", "" },		Click { 0, -3, 0, _cursor },				\
			ExitEvent { "four", "" },		Click { 0, -4, 0, _cursor },				\
			ExitEvent { "five", "" },		Click { 0, -5, 0, _cursor },				\
			ExitEvent { "six", "" },		Click { 0, -6, 0, _cursor },				\
			ExitEvent { "seven", "" },		Click { 0, -7, 0, _cursor },				\
			ExitEvent { "eight", "" },		Click { 0, -8, 0, _cursor },				\
			ExitEvent { "nine", "" },		Click { 0, -9, 0, _cursor },				\
			ExitEvent { "ten", "" },		Click { 0, -10, 0, _cursor },				\
			endSubslate{},	\
		Event { "north", "" },	Subslate { "up" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Click { 0, 0, -1, _cursor },				\
			ExitEvent { "two", "" },		Click { 0, 0, -2, _cursor },				\
			ExitEvent { "three", "" },		Click { 0, 0, -3, _cursor },				\
			ExitEvent { "four", "" },		Click { 0, 0, -4, _cursor },				\
			ExitEvent { "five", "" },		Click { 0, 0, -5, _cursor },				\
			ExitEvent { "six", "" },		Click { 0, 0, -6, _cursor },				\
			ExitEvent { "seven", "" },		Click { 0, 0, -7, _cursor },				\
			ExitEvent { "eight", "" },		Click { 0, 0, -8, _cursor },				\
			ExitEvent { "nine", "" },		Click { 0, 0, -9, _cursor },				\
			ExitEvent { "ten", "" },		Click { 0, 0, -10, _cursor },				\
			endSubslate{},	\
		Event { "down", "" },	Subslate { "down" },	\
			_SlateGlobals_,	\
			_CloseSubslate_,	\
			ExitEvent { "one", "" },		Click { 0, 0, 1, _cursor },				\
			ExitEvent { "two", "" },		Click { 0, 0, 2, _cursor },				\
			ExitEvent { "three", "" },		Click { 0, 0, 3, _cursor },				\
			ExitEvent { "four", "" },		Click { 0, 0, 4, _cursor },				\
			ExitEvent { "five", "" },		Click { 0, 0, 5, _cursor },				\
			ExitEvent { "six", "" },		Click { 0, 0, 6, _cursor },				\
			ExitEvent { "seven", "" },		Click { 0, 0, 7, _cursor },				\
			ExitEvent { "eight", "" },		Click { 0, 0, 8, _cursor },				\
			ExitEvent { "nine", "" },		Click { 0, 0, 9, _cursor },				\
			ExitEvent { "ten", "" },		Click { 0, 0, 10, _cursor },				\
			endSubslate{},	\
		endSubslate{},	\
	ExitEvent { "okay", "exit this Subslate" },	IMouse { im_Close, 0 }
// Event { "drag", "drag" },			IMouse { im_Drag, 0 },           code exists, but has never worked

#pragma mark _FullAccessItems_
#define _FullAccessItems_	\
	Event { "activate", "activate or deactivate full keyboard access" },	\
		Keypress { kc_fn1, mf_control },	\
	Event { "override", "temporarily override full keyboard access" },	\
		Keypress { kc_fn7, mf_control },	\
	Event { "controls", "toggle focus for any control within windows" },	\
		Keypress { kc_fn7, mf_control },	\
	Event { "menu bar", "move focus to the menu bar" },	\
		Keypress { kc_fn2, mf_control },	\
	Event { "dock window",	"move focus to the dock" },	\
		Keypress { kc_fn3, mf_control },	\
	Event { "window", "move focus to to active or next window" },	\
		Keypress { kc_fn4, mf_control },	\
	Event { "tools", "move focus to the toolbar" },	\
		Keypress { kc_fn5, mf_control },	\
	Event { "palette", "move focus to the first or next palette (utility window)" },	\
		Keypress { kc_fn6, mf_control },	\
	Event { "previous palette", "move focus to the previous palette (utility window)" },	\
		Keypress { kc_fn6, mf_control + mf_shift },	\
	Event { "next group", "move focus to the next table or group of controls" },	\
		Keypress { kc_tab, mf_control },	\
	Event { "previous group", "move focus to the previous table or group of controls" },	\
		Keypress { kc_tab, mf_control + mf_shift },	\
	Event { "next application", "move focus to the first or next open app's dock icon" },	\
		Keypress { kc_tab, mf_command },	\
	Event { "previous application", "move focus to the previous open app's dock icon" },	\
		Keypress { kc_tab, mf_command + mf_shift },	\
	Event { "tab back",	"shift-tab" },	\
		Keypress { kc_tab, mf_shift },	\
	Event { "cell left",	"move focus to another value or cell" },	\
		Keypress { kc_left, mf_control },	\
	Event { "cell right",	"move focus to another value or cell" },	\
		Keypress { kc_right, mf_control },	\
	Event { "cell north",	"move focus to another value or cell" },	\
		Keypress { kc_up, mf_control },	\
	Event { "cell down",	"move focus to another value or cell" },	\
		Keypress { kc_down, mf_control },	\
	Event { "next window", "move focus to the next open window in an application" },	\
		Keypress { kc_fn1, mf_control },	\
	Event { "previous window", "move focus to the previous open window in an application" },	\
		Keypress { kc_fn1, mf_control + mf_shift },	\
	Event { "select", "select the highlighted control" },	\
		KeyDelay { kc_space, 0, 10 },	\
	Event { "accept", "select the default button" },	\
		Keypress { kc_enter, 0 },	\
	Event { "cancel", "cancel a dialog or selection" },	\
		Keypress { kc_escape, 0 },	\
	_DirectionKeys_,	\
	_TabKey_,	\
	_TypeSlate_,	\
	_IMouseSlate_

#pragma mark _DialogItems_
#define _DialogItems_	\
	ExitEvent { "accept", "select the default button" },	\
		Keypress { kc_enter, 0 },	\
	ExitEvent { "cancel", "cancel a dialog or selection" },	\
		Keypress { kc_escape, 0 },	\
	Event { "tab back",	"shift-tab" },	\
		Keypress { kc_tab, mf_shift },	\
	Event { "select", "select the highlighted control" },	\
		KeyDelay { kc_space, 0, 10 },	\
	_DirectionKeys_,	\
	_TabKey_,	\
	_TypeSlate_,	\
	_IMouseSlate_

#pragma mark _WindowControlsItems_
#define _WindowControlsItems_	\
	_DialogItems_,	\
	Event { "focus", "focus on window controls" },	\
		Keypress { kc_fn7, mf_control },	\
	Event { "window", "move focus to to active or next window" },	\
		Keypress { kc_fn4, mf_control },	\
	Event { "tools", "move focus to the toolbar" },	\
		Keypress { kc_fn5, mf_control },	\
	Event { "palette", "move focus to the first or next palette (utility window)" },	\
		Keypress { kc_fn6, mf_control },	\
	Event { "previous palette", "move focus to the previous palette (utility window)" },	\
		Keypress { kc_fn6, mf_control + mf_shift },	\
	Event { "next group", "move focus to the next table or group of controls" },	\
		Keypress { kc_tab, mf_control },	\
	Event { "previous group", "move focus to the previous table or group of controls" },	\
		Keypress { kc_tab, mf_control + mf_shift },	\
	Event { "cell left",	"move focus to another value or cell" },	\
		Keypress { kc_left, mf_control },	\
	Event { "cell right",	"move focus to another value or cell" },	\
		Keypress { kc_right, mf_control },	\
	Event { "cell north",	"move focus to another value or cell" },	\
		Keypress { kc_up, mf_control },	\
	Event { "cell down",	"move focus to another value or cell" },	\
		Keypress { kc_down, mf_control },	\
	Event { "next window", "move focus to the next open window in an application" },	\
		Keypress { kc_fn1, mf_control },	\
	Event { "previous window", "move focus to the previous open window in an application" },	\
		Keypress { kc_fn1, mf_control + mf_shift }

#pragma mark _WindowItems_
#define	_WindowItems_	\
	_SlateGlobals_,			\
	_WindowControlsSlate_,	\
	_CloseSubslate_,		\
	Event { "next", "" },								Keypress { kc_accent, mf_command }, \
	Event { "previous", "" },							Keypress { kc_accent, mf_command + mf_shift }, \
	Event { "close", "click Close button" },		Click { 1, 15, 11, _window, _topLeft },	\
	Event { "minimize", "click Minimize button" },	Click { 1, 36, 11, _window, _topLeft },	\
	Event { "zoom", "click Zoom button" },			Click { 1, 58, 11, _window, _topLeft },	\
	ExitEvent { "list", "" },							ClickMenu { "Window" }, \
	ExitEvent { "move", "" },		Click { 0, 74, 11, _window, _topLeft },	\
	ExitEvent { "resize", "" },		Click { 0, -4, -4, _window, _bottomRight }, 	\
	ExitEvent { "path", "" },		ClickMod { 1, 0, 11, _window, _topCenter, mf_command },	\
	ExitEvent { "center", "" },		Click { 0, 0, 0, _window, _center },	\
	ExitEvent { "top left", "" },	Click { 0, 20, 100, _window, _topLeft }

#pragma mark _MenuBarItems_
#define _MenuBarItems_	\
	Event { "focus", "move focus to the menu bar" },	\
		Keypress { kc_fn2, mf_control },	\
	ExitEvent { "select", "select the highlighted item" },	\
		KeyDelay { kc_space, 0, 10 },	\
	_DirectionKeys_,	\
	_TabKey_,	\
	_LetterKeys_,	\
	ExitEvent { "cancel", "cancel menu selection" },	\
		Keypress { kc_escape, 0 }

#pragma mark _DockWindowItems_
#define _DockWindowItems_	\
	Event { "focus",	"move focus to the dock" },	\
		Keypress { kc_fn3, mf_control },	\
	Event { "next group", "move focus to the next table or group of controls" },	\
		Keypress { kc_tab, mf_control },	\
	Event { "previous group", "move focus to the previous table or group of controls" },	\
		Keypress { kc_tab, mf_control + mf_shift },	\
	Event { "show",	"show or hide the dock window" },	\
		Keypress { kc_D, mf_command + mf_option },	\
	Event { "hide",	"show or hide the dock window" },	\
		Keypress { kc_D, mf_command + mf_option },	\
	Event { "tab back",	"shift-tab" },	\
		Keypress { kc_tab, mf_shift },	\
	ExitEvent { "select", "select the highlighted control" },	\
		KeyDelay { kc_space, 0, 10 },	\
	_DirectionKeys_,	\
	_TabKey_,	\
	Event { "tab back",	"shift-tab" },	\
		Keypress { kc_tab, mf_shift },	\
	ExitEvent { "cancel", "cancel dock selection" },	\
		Keypress { kc_escape, 0 }

#pragma mark _TestClicksItems_
#define _TestClicksItems_	\
	Event { "move to Accessor", "move cursor to the Accessor window" },	\
		Click { 0, 950, 750, _screen, _topLeft },		\
	Event { "click Accessor", "click in the Accessor window" },	\
		Click { 1, 950, 750, _screen, _topLeft },		\
	Event { "click to right", "click 32 pixels to the right of the current cursor location" },	\
		Click { 1, 32, 0, _cursor },		\
	Event { "click diagonal", "click 32 pixels down and to the right of the current cursor location" },	\
		Click { 1, 32, 32, _cursor },		\
	Event { "drag diagonal", "drag to 32 pixels down and to the right of the current cursor location" },	\
		Click { -1, 32, 32, _cursor },	\
	Event { "click window", "click at (40, 40) in the front window" },	\
		Click { 1, 40, 40, _window, _topLeft }

#pragma mark _TestTypeItems_
#define _TestTypeItems_	\
	Event { "hello", "type 'Hello, World!'" }, TypeText { "Hello, World!" }

#pragma mark _DefaultBase_
#define _StarterBase_	\
	_CommandSlate_,		\
	_IMouseSlate_,		\
	Event { "click one", "single click" },	IMouse { im_Click, 1 },	\
	Event { "click two", "double click" },		IMouse { im_Click, 2 },	\
	_FullAccessSlate_,	\
	_MenuBarSlate_,		\
	_DockWindowSlate_,	\
	_DirectionKeys_,	\
	_ReturnKey_,		\
	_SpaceKey_

#define	_DefaultBase_	\
	_StarterBase_,		\
	_LaunchSlate_
/*	_SlatesSlate_,		\	*/
/*	_Dictate_				*/

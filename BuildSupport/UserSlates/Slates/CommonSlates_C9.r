// =================================================================================
//	CommonSlates_C9.r			(c)2004-13 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

resource restype_Slate (resid_Sleep, "sleep") { {
	Slate { "Sleep", {
		Event { "Show Slate", "display the contents of the current Slate" },
		Command { cmd_ShowSlate },
		Event { "Last Fault", "display information about the last incomplete operation" },
		Command { cmd_ShowLastFault },
		ExitEvent { "wake up", "" },	NilAction{},
	} }                                                                                                       
} };

#pragma mark DefaultSlate
#define _DEFAULT_NAME_	"Default"

resource restype_Slate (resid_DefaultSlate, "Accessor Default Slate") { {
	Slate { _DEFAULT_NAME_,	{
		_SlateGlobals_,
		_DefaultBase_,
		_ClickOne_,
		_ClickTwo_,
		_TypeSlate_,
		_WindowSlate_,
	} }
} };

#define _EclipsePerspectiveSlate_	resid_Eclipse+450

#pragma mark Launch
	resource restype_Slate (resid_LaunchSlate, "Launch Slate") { {
		Slate { "Launch",	{
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "throw error",	"for testing" }, Command { cmd_ThrowError },
			Event { "Nothing", "for testing" }, Launch { DevApps_"XCode.app", 1 },
			Event { "Finder", "launch Finder" },
				Launch { "Finder", resid_Finder },
			Event { "Accessor", "launch Accessor" },
				Launch { HomeApps_"Accessor.app", resid_DefaultSlate },
			Event { "System Prefs", "launch System Preferences" },
				Launch { Apps_"System Preferences.app", resid_SystemPrefs },
			Event { "Software Update", "launch Software Update" },
				Launch { "/System/Library/CoreServices/Software Update.app", resid_DefaultSlate },
			Event { "Safari", "launch Safari" }, Launch { Apps_"Safari.app", resid_Safari },
			Event { "Mail", "launch Mail" },
				Launch { Apps_"Mail.app", resid_Mail },
			Event { "Address Book", "launch Address Book" },
				Launch { Apps_"Address Book.app", resid_DefaultSlate },
			Event { "Calendar", "launch iCal" },
				Launch { Apps_"iCal.app", resid_Calendar },
			Event { "iTunes", "launch iTunes" }, Launch { Apps_"iTunes.app", resid_Tunes },
			Event { "iPhoto", "" },	Launch { Apps_"iPhoto.app", resid_DefaultSlate },
			Event { "iMovie", "" },	Launch { Apps_"iMovie.app", resid_DefaultSlate },
			Event { "iWeb", "" },	Launch { Apps_"iWeb.app", resid_DefaultSlate },
			Event { "TextEdit", "" }, Launch { Apps_"TextEdit.app", resid_TextEdit },
			Event { "Automator", "" }, Launch { Apps_"Automator.app", resid_Automator },
			Event { "Stickies", "launch Stickies" }, Launch { Apps_"Stickies.app", resid_DefaultSlate },
			Event { "Disk Utility", "" }, Launch { Utilities_"Disk Utility.app", resid_DefaultSlate },
			Event { "Preview", "launch Preview" }, Launch { Apps_"Preview.app", resid_Preview },
			Event { "Script Editor", "launch Script Editor" }, Launch { Apps_"Utilities/AppleScript Editor.app", resid_ScriptEditor },
			Event { "Games", "" },	ResSubslate { resid_LaunchGamesSlate },
			Event { "BBEdit", "launch BBEdit" }, Launch { MainApps_"BBEdit.app", resid_BBEdit },
			Event { "Interface", "launch PreFab¨ UI Browser" },
				Launch { MainApps_"UI Browser.app", resid_UIBrowser },
			Event { "Terminal", "launch Terminal" }, Launch { Apps_"Utilities/Terminal.app", resid_Terminal },
			Event { "Console", "launch Console" }, Launch { Apps_"Utilities/Console.app", resid_DefaultSlate },
			Event { "Cyberduck", "launch Cyberduck" }, Launch { Apps_"Cyberduck.app", resid_DefaultSlate },
			Event { "Activities", "" }, Launch { Apps_"Utilities/Activity Monitor.app", resid_DefaultSlate },
			Event { "AppleWorks", "launch AppleWorks" },
				Launch { MainApps_"AppleWorks 6/AppleWorks 6.app", resid_AppleWorks },
			Event { "FileMaker", "launch FileMaker" },
				Launch { MainApps_"FileMaker Pro 9 Advanced/FileMaker Pro Advanced.app", resid_FileMaker },
			Event { "Arbonne", "launch Arbonne" },
				Launch { Home_"Documents/Arbonne/Arbonne.numbers", resid_Numbers },			
			Event { "PaintCode", "" }, Launch { Apps_"PaintCode.app", resid_DefaultSlate },
			Event { "Xcode", "" }, Launch { DevApps_"Xcode.app", resid_Xcode },
			Event { "AppCode", "" }, Launch { Apps_"AppCode.app", resid_AppCode },
			Event { "Server", "" }, Launch { Apps_"Server.app", resid_Server },
			Event { "Dash", "" }, Launch { Apps_"Dash.app", resid_Dash },
			Event { "Instruments", "" }, Launch { DevApps_"Instruments.app", resid_DefaultSlate },
			Event { "Dashcode", "" }, Launch { DevApps_"Dashcode.app", resid_Dashcode },
			ExitEvent { "Inspector", "" },	Launch { DevApps_"Utilities/Accessibility Tools/Accessibility Inspector.app", 0 },
			Event { "Eclipse", "" }, Launch { JavaApps_"eclipse/Eclipse.app", resid_Eclipse },
			Event { "Moon Shadow", "" }, Launch { JavaApps_"eclipse/Eclipse.app", resid_Eclipse },
			Event { "Package Maker", "launch PackageMaker" },
				Launch { DevApps_"Utilities/PackageMaker.app", resid_DefaultSlate },
			Event { "Grab Image", "" },
				Launch { Apps_"Utilities/Grab.app", resid_DefaultSlate },
			Event { "Backup", "" },
				Launch { MainApps_"Backup.app", resid_Backup },
//			Event { "Pages", "" }, Launch { Apps_"Pages.app", resid_Pages },
			Event { "Pages", "" }, Launch { MainApps_"iWork '09/Pages.app", resid_Pages },
			Event { "Numbers", "" },	Launch { MainApps_"Numbers.app", resid_Numbers },
			Event { "Numbers 9", "" },	Launch { MainApps_"iWork '09/Numbers.app", resid_Numbers },
			Event { "Dictation", "" },	Launch { MainApps_"Dragon Dictate.app", resid_DefaultSlate },
			Event { "Windows", "launch Parallels" },
				Launch { Home_"Parallels/Microsoft Windows XP.pvm", resid_Parallels },
			Event { "Modelling", "launch UMLet" },		Sequence{},
				ResSubslate { resid_LaunchUMLet },
				Keypress { kc_fn3, mf_control },
				endSequence{},
			Event { "Prototype", "" },			Launch { Dev_"Arbonne/build/Debug/ArbonnePrototype.app", resid_ArbProto },
			Event { "Reference", "" },			Subslate { "Reference" },
				_SlateGlobals_,
				_CloseSubslate_,
				Event { "AppleScript", "" }, Launch { Home_"Reference/AppleScriptLanguageGuide.pdf", resid_Preview },
				Event { "Blocks", "" }, Launch { Home_"Reference/Blocks.pdf", resid_Preview },
				Event { "Cocoa Bindings", "" }, Launch { Home_"Reference/Cocoa8Bindings.pdf", resid_Preview },
				Event { "Cocoa Drawing Guide", "" }, Launch { Home_"Reference/CocoaDrawingGuide.pdf", resid_Preview },
				Event { "Core Animation Guide", "" }, Launch { Home_"Reference/CoreAnimation_guide.pdf", resid_Preview },
				Event { "Core Data", "" }, Launch { Home_"Reference/CoreData.pdf", resid_Preview },
				Event { "Core Data Snippets", "" }, Launch { Home_"Reference/CoreDataSnippets.pdf", resid_Preview },
				Event { "Error Handling", "" }, Launch { Home_"Reference/ErrorHandlingCocoa.pdf", resid_Preview },
				Event { "Exceptions", "" }, Launch { Home_"Reference/Exceptions.pdf", resid_Preview },
			Event { "File System", "" }, Launch { Home_"Reference/FileSystemProgrammingGuide.pdf", resid_Preview },	
				Event { "Git book", "" }, Launch { Home_"Reference/git-book.pdf", resid_Preview },
				Event { "Instruments User Guide", "" }, Launch { Home_"Reference/InstrumentsUserGuide.pdf", resid_Preview },
				Event { "Internationalization", "" }, Launch { Home_"Reference/Internationalization.pdf", resid_Preview },
				Event { "Introducing Blocks", "" }, Launch { Home_"Reference/Introducing Blocks and Grand Central Dispatch.pdf", resid_Preview },
				Event { "Key Value Coding", "" }, Launch { Home_"Reference/KeyValueCoding.pdf", resid_Preview },
				Event { "Key Value Observing", "" }, Launch { Home_"Reference/KeyValueObserving.pdf", resid_Preview },
				Event { "Loading Resources", "" }, Launch { Home_"Reference/LoadingResources.pdf", resid_Preview },
				Event { "Mac HIG", "" }, Launch { Home_"Reference/OSXHIGuidelines.pdf", resid_Preview },
				Event { "Mobile HIG", "" }, Launch { Home_"Reference/MobileHIG.pdf", resid_Preview },
				Event { "Objective C", "" }, Launch { Home_"Reference/ObjC.pdf", resid_Preview },
				Event { "Objective C Runtime", "" }, Launch { Home_"Reference/ObjCRuntimeGuide.pdf", resid_Preview },
				Event { "Predicates", "" }, Launch { Home_"Reference/Predicates.pdf", resid_Preview },
				Event { "Printing", "" }, Launch { Home_"Reference/Printing.pdf", resid_Preview },
				Event { "Recursive descent parser", "" }, Launch { Home_"Reference/Recursive descent parser.pdf", resid_Preview },
				Event { "shell unit", "" }, 	Launch { Home_"Reference/shunit2.html", resid_Safari},
				Event { "Sheets", "" }, Launch { Home_"Reference/Sheets.pdf", resid_Preview },
				Event { "Strings", "" }, Launch { Home_"Reference/Strings.pdf", resid_Preview },
				Event { "System Services", "" }, Launch { Home_"Reference/SysServices.pdf", resid_Preview },
				Event { "Table View", "" }, Launch { Home_"Reference/TableView.pdf", resid_Preview },
				Event { "Toolbars", "" }, Launch { Home_"Reference/Toolbars.pdf", resid_Preview },
				Event { "View Programming Guide", "" }, Launch { Home_"Reference/ViewProgrammingGuide.pdf", resid_Preview },
				Event { "Window Programming Guide", "" }, Launch { Home_"Reference/WindowProgrammingGuide.pdf", resid_Preview },

				Event { "Dictate User Manual", "" }, Launch { Home_"Reference/MacSpeech Dictate User Manual.pdf", resid_Preview },
				Event { "iWork Formulas", "" }, Launch { Home_"Reference/iWork_Formulas_and_Functions.pdf", resid_Preview },
				Event { "jquery", "" }, Launch { Home_"Reference/jquery-1.5.2.min.js.pdf", resid_Preview },
				Event { "Doxygen", "" }, Launch { Home_"Reference/doxygen_manual-1.8.2.pdf", resid_Preview },
				endSubslate{},
			Event { "Workspace", "" },			Subslate { "Workspace" },
				_SlateGlobals_,
				_CloseSubslate_,
				Event { "Support", "" },		Launch { Dev_"Support/Support.xcworkspace", resid_Xcode },
				Event { "Carbon", "" },			Launch { Dev_"AccessorC9/AccessorC9.xcworkspace", resid_Xcode },
				Event { "Punkin", "" },			Launch { Dev_"Punkin/Punkin.xcworkspace", resid_Xcode },
				Event { "Accessor", "" },		Launch { Dev_"Accessor/Accessor.xcworkspace", resid_Xcode },
				Event { "Support", "" },		Launch { Dev_"Support/Support.xcworkspace", resid_Xcode },
				Event { "old Support", "" },	Launch { Dev_"Support_svn/Support_svn.xcworkspace", resid_Xcode },
				Event { "Dev Support", "" },	Launch { Dev_"DevSupport/DevSupport.xcodeproj", resid_Xcode },
				endSubslate{},
		 } }
	} };

	resource restype_Slate (resid_SlatesSlate, "Slates Slate") { {
		Slate { "Slates",	{
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "Default", "switch to Default Slate" },
				SwitchSlate { resid_DefaultSlate },
			Event { "BBEdit", "" },		SwitchSlate { resid_BBEdit },
			Event { "FileMaker", "" },	SwitchSlate { resid_FileMaker },
		 } }
	} };

#pragma mark Type
resource restype_Slate (resid_TypeSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSlateItems_,
		_TypeSpecialDefaultSlate_
	} }
} };

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialDefaultSlate, "Type Special Default Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_
	} }
} };

#pragma mark Dictate
resource restype_Slate (resid_DragonSlate, "Dragon Dictate active") { {
	Slate { "Dragon", {
		ExitEvent { "Microphone Off", "and hide recognition window" },	_CloseRecognitionWindow_,
	} }
} };

resource restype_Slate (resid_DictateSlate, "Mac dictation active") { {
	Slate { "Dictate", {
		ExitEvent { "dictate off", "" },	NilAction{},
	} }
} };

#pragma mark WordLeft/Right
resource restype_Slate (resid_WordLeft, "") { {
	Slate { "WordLeft <n>",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "one", "" },		Sequence{}, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "two", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "three", "" },		Sequence{},	Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "four", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "five", "" },		Sequence{},	Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "six", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "seven", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "eight", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "nine", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
		ExitEvent { "ten", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, endSequence{},
	} }
} };

resource restype_Slate (resid_WordRight, "") { {
	Slate { "WordRight <n>",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "one", "" },		Sequence{}, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "two", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "three", "" },		Sequence{},	Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "four", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "five", "" },		Sequence{},	Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "six", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "seven", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "eight", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "nine", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "ten", "" },		Sequence{}, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
	} }
} };

#pragma mark doScan
resource restype_Slate (resid_DoScan, "") { {
	Slate { "doScan",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "select", "" },		Keypress { kc_enter, 0 },
		Event { "ahead", "" },		ResSubslate { resid_ScanAhead },
		Event { "back", "" },		ResSubslate { resid_ScanBack },
		_PageKeys_,
	} }
} };

resource restype_Slate (resid_ScanAhead, "") { {
	Slate { "ahead",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "select", "" },	Sequence{}, Keypress { kc_enter, 0 }, CloseSubslate{}, endSequence{},
		Event { "back", "" },		Sequence{}, CloseSubslate{}, ResSubslate { resid_ScanBack }, endSequence{},
		_PageKeys_,
		_ScanAheadItems_,
	} }
} };

resource restype_Slate (resid_ScanBack, "") { {
	Slate { "back",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "select", "" },	Sequence{}, Keypress { kc_enter, 0 }, CloseSubslate{}, endSequence{},
		Event { "ahead", "" },		Sequence{}, CloseSubslate{}, ResSubslate { resid_ScanAhead }, endSequence{},
		_PageKeys_,
		_ScanBackItems_,
	} }
} };

#pragma mark doTab
resource restype_Slate (resid_DoTab, "") { {
	Slate { "doTab",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "select", "" },		Keypress { kc_enter, 0 },
		Event { "ahead", "" },		ResSubslate { resid_TabAhead },
		Event { "back", "" },		ResSubslate { resid_TabBack },
	} }
} };

resource restype_Slate (resid_TabAhead, "") { {
	Slate { "ahead",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "select", "" },	Sequence{}, Keypress { kc_enter, 0 }, CloseSubslate{}, endSequence{},
		Event { "back", "" },		Sequence{}, CloseSubslate{}, ResSubslate { resid_TabBack }, endSequence{},
		_PageKeys_,
		_TabAheadItems_,
	} }
} };

resource restype_Slate (resid_TabBack, "") { {
	Slate { "back",	{
		_SlateGlobals_,
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "select", "" },	Sequence{}, Keypress { kc_enter, 0 }, CloseSubslate{}, endSequence{},
		Event { "ahead", "" },		Sequence{}, CloseSubslate{}, ResSubslate { resid_TabAhead }, endSequence{},
		_TabBackItems_,
	} }
} };

#define _csp	110
#pragma mark LinkContent
resource restype_Slate (resid_LinkContentSlate, "") { {
	Slate { "LinkContent",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "alpha", "" },			Click { 0, 30+0*_csp, 80, _window, _topLeft },
		Event { "bravo", "" },			Click { 0, 30+1*_csp, 80, _window, _topLeft },
		Event { "charlie", "" },		Click { 0, 30+2*_csp, 80, _window, _topLeft },
		Event { "david", "" },			Click { 0, 30+3*_csp, 80, _window, _topLeft },
		Event { "elwood", "" },			Click { 0, 30+4*_csp, 80, _window, _topLeft },
		Event { "fiddle", "" },			Click { 0, 30+5*_csp, 80, _window, _topLeft },
		Event { "golf", "" },			Click { 0, 30+6*_csp, 80, _window, _topLeft },
		Event { "hotel", "" },			Click { 0, 30+7*_csp, 80, _window, _topLeft },
		Event { "india", "" },			Click { 0, 30+8*_csp, 80, _window, _topLeft },
		Event { "juliet", "" },			Click { 0, 30+9*_csp, 80, _window, _topLeft },
		Event { "left", "" },			Click { 0, -30, 0, _cursor },
		Event { "right", "" },			Click { 0, 30, 0, _cursor },
		Event { "north", "" },			Click { 0, 0, -10, _cursor },
		Event { "down", "" },			Click { 0, 0, 10, _cursor },
		Event { "zero", "" },			Click { 1, 0, 0, _cursor },
		Event { "one", "" },			Click { 1, 0, 24, _cursor },
		Event { "two", "" },			Click { 1, 0, 48, _cursor },
		Event { "three", "" },			Click { 1, 0, 72, _cursor },
		Event { "four", "" },			Click { 1, 0, 96, _cursor },
		Event { "five", "" },			Click { 1, 0, 120, _cursor },
		Event { "six", "" },			Click { 1, 0, 144, _cursor },
		Event { "seven", "" },			Click { 1, 0, 168, _cursor },
		Event { "eight", "" },			Click { 1, 0, 192, _cursor },
		Event { "nine", "" },			Click { 1, 0, 216, _cursor },
		Event { "ten", "" },			Click { 1, 0, 240, _cursor },
		Event { "eleven", "" },			Click { 1, 0, 264, _cursor },
		Event { "twelve", "" },			Click { 1, 0, 288, _cursor },
		Event { "thirteen", "" },		Click { 1, 0, 312, _cursor },
		Event { "fourteen", "" },		Click { 1, 0, 336, _cursor },
		Event { "fifteen", "" },		Click { 1, 0, 360, _cursor },
		Event { "sixteen", "" },		Click { 1, 0, 384, _cursor },
		Event { "seventeen", "" },		Click { 1, 0, 408, _cursor },
		Event { "eighteen", "" },		Click { 1, 0, 432, _cursor },
		Event { "nineteen", "" },		Click { 1, 0, 456, _cursor },
		Event { "twenty", "" },			Click { 1, 0, 480, _cursor },
		Event { "go back", "", },		Keypress { kc_bracket, mf_command },
		Event { "go forward", "", },	Keypress { kc_closeBracket, mf_command },
	} }
} };

#pragma mark Command
resource restype_Slate (resid_CommandSlate, "Command Slate") { {
	Slate { "Command",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_CommandSlateItems_
	} }
} };

#pragma mark FullAccess
resource restype_Slate (resid_FullAccessSlate, "Full Access Slate") { {
	Slate { "Access",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_FullAccessItems_
	} }
} };

#pragma mark Window
resource restype_Slate (resid_WindowSlate, "Window Slate") { {
	Slate { "Window",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_WindowItems_
	} }
} };

#pragma mark . WindowControls
resource restype_Slate (resid_WindowControlsSlate, "Window Controls Slate") { {
	Slate { "Controls",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_WindowControlsItems_
	} }
} };

#pragma mark Dialog
resource restype_Slate (resid_DialogSlate, "Dialog Slate") { {
	Slate { "Dialog",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DialogItems_
	} }
} };

#pragma mark MenuBar
resource restype_Slate (resid_MenuBarSlate, "Menu Bar Slate") { {
	Slate { "MenuBar",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_MenuBarItems_
	} }
} };

#pragma mark DockWindow
resource restype_Slate (resid_DockWindowSlate, "Dock Window Slate") { {
	Slate { "Dock",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DockWindowItems_
	} }
} };

#pragma mark GoToFolder
resource restype_Slate (resid_GoToFolder, "GoToFolder") { {
	Slate { "GoToFolder",	{
		_SlateGlobals_,
		_DirectionKeys_,
		_TypeSlate_,
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "return", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		NilAction{},
		ExitEvent { "home", "" },			Keypress { kc_H, mf_command + mf_shift },
		ExitEvent { "applications", "" },	Keypress { kc_A, mf_command + mf_shift },
		ExitEvent { "utilities", "" },		Keypress { kc_U, mf_command + mf_shift },
		ExitEvent { "specify", "" },	Sequence{},
			Keypress { kc_G, mf_command + mf_shift }, ResSubslate { resid_TypeSlate }, endSequence{},
		ExitEvent { "frameworks", "" },	Sequence{},
			Keypress { kc_G, mf_command + mf_shift }, TypeText { "/Library/Frameworks" }, endSequence{},
		ExitEvent { "my development", "" },	Sequence{},
			Keypress { kc_G, mf_command + mf_shift }, TypeText { "~/Dev" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Developer", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { bootvol_"/Developer/" },			Keypress { kc_return, 0 }, endSequence{},
		Event { "in house docs", "" },	Sequence{}, Keypress { kc_G, mf_command + mf_shift },
			TypeText { "~/Library/CCDev/Sites/TechnicalDocs" }, _return, ResSubslate { resid_TypeSlate }, endSequence{},
		ExitEvent { "reference", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { "~/Reference" },				Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "mac", "" },		Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { bootvol_"/" },					Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "external", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { "/Ext/" },					Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "Shared", "" },		Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { bootvol_"/Users/Shared/" },		Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "desktop", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { "~/Desktop" },				Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "documents", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { "~/Documents" },				Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "my library", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { "~/Library" },				Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "system library", "" },	Sequence{},	Keypress { kc_G, mf_command + mf_shift },
			TypeText { "/Library" },				Keypress { kc_return, 0 }, endSequence{},
	} }
} };

#pragma mark IMouse
#define _stepSize	16
resource restype_Slate (resid_IMouseSlate, "IMouse Slate") { {
	Slate { "IMouse",	{
		_IMouseItems_
	} }
} };

// =================================================================================
//	Eclipse_C9.r					(c)2008 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#pragma mark 0 ===

#define resid_TypeEclipseSlate			resid_Eclipse+1
#define resid_TypeSpecialEclipseSlate	resid_Eclipse+2
#define resid_IMouseEclipseSlate		resid_Eclipse+3

#define resid_FileMenu					resid_Eclipse+100
	#define resid_FileNew					resid_FileMenu+10
		#define resid_NewJavaProject			resid_FileMenu+1
		#define resid_NewClass					resid_FileMenu+2
		#define resid_NewTest					resid_FileMenu+3
		#define resid_NewFile					resid_FileMenu+4

#define resid_NavigateSlate				resid_Eclipse+170

#define resid_RunMenu					resid_Eclipse+200
	#define resid_RunDialog					resid_RunMenu+1

#define resid_Debug						resid_Eclipse+250
	#define resid_DebugDialog					resid_Debug+1

#define resid_Search					resid_Eclipse+300

#define resid_HelpMenu					resid_Eclipse+380

#define resid_PerspectiveSlate			resid_Eclipse+400

// resid_PlanningPersp referenced from CommonSlates_C9.r
#define resid_PlanningPersp				resid_Eclipse+450
	#define resid_ScheduleSlate				resid_PlanningPersp+1
	#define resid_ChooseDateSlate			resid_PlanningPersp+2
	#define resid_LinkSlate					resid_PlanningPersp+3

#define resid_JavaPersp					resid_Eclipse+500

#define resid_SyncPersp					resid_Eclipse+530

#define resid_SelectViewSlate			resid_Eclipse+700
	#define resid_JavaViewsSlate			resid_SelectViewSlate+1

	#define resid_Ant_Java					resid_SelectViewSlate+10
	#define resid_Console_Java				resid_SelectViewSlate+20
	#define resid_Errors_Java				resid_SelectViewSlate+30
	#define resid_HierarchyView				resid_SelectViewSlate+40
	#define resid_JUnitView					resid_SelectViewSlate+50
	#define resid_NavigatorView				resid_SelectViewSlate+60
	#define resid_Outline_Java				resid_SelectViewSlate+70
	#define resid_PackagesView				resid_SelectViewSlate+80
	#define resid_Problems_Java				resid_SelectViewSlate+90
	#define resid_TaskList_Planning			resid_SelectViewSlate+100
		#define resid_TaskList_Java				resid_TaskList_Planning+1
	#define resid_Tasks_Java				resid_SelectViewSlate+110	

#define WINDOW_WIDTH		1190
#define WINDOW_HEIGHT		820

#define _stepSize	18

#pragma mark _EclipseStandards_
#define _EclipseStandards_			\
		_EnterKey_,				\
		Event { "escape", "" },		Keypress { kc_escape, 0 },				\
		Event { "go next", "" },	Keypress { kc_period, mf_command },		\
		Event { "go previous", "" }, Keypress { kc_period, mf_command },	\
		Event { "mouse", "" },		Sequence{}, IMouse { im_StepSize, _stepSize }, ResSubslate { resid_IMouseEclipseSlate }, endSequence{},	\
		Event { "popup", "" },		ClickMod { 1, 0, 0, _cursor, mf_control },	\
		Event { "document", "" },	Keypress { kc_E, mf_command + mf_shift }, \
		Event { "edit", "" },		Keypress { kc_fn12, mf_command },		\
		Event { "maximize", "" },	Keypress { kc_M, mf_command },			\
		Event { "minimize", "" },	Click { 1, WINDOW_WIDTH-44, 86, _screen, _topLeft },	\
		_HelpMenu_,				\
		_TypeEclipseSlate_,		\
		_SlateGlobals_,			\
		_CommandSlate_,			\
		Event { "click one", "" }, IMouse { im_Click, 1 },	\
		Event { "click two", "" }, IMouse { im_Click, 2 },	\
		Event { "zoom window", "" },	Click { 1, 57, 35, _screen, _topLeft },	\
		_FullAccessSlate_,	\
		_MenuBarSlate_,		\
		_DockWindowSlate_,	\
		_DirectionKeys_,	\
		_WhitespaceKeys_

#pragma mark _ViewStandards_
#define _ViewStandards_			\
		ExitEvent { "edit", "" },		Keypress { kc_fn12, mf_command },		\
		_CloseSubslate_,		\
		_EclipseStandards_
		
#pragma mark _PerspectiveStandards_
#define _PerspectiveStandards_	\
		Event { "Perspective", "" },	ResSubslate { resid_PerspectiveSlate },	\
		_LaunchSlate_,			\
		_EclipseStandards_

#pragma mark Menu/Slate Defs
#define _NavigateSlate_		\
		Event { "Navigate", "" },	ResSubslate { resid_NavigateSlate }
#define _RunSlate_			\
		Event { "Run", "" },		ResSubslate { resid_RunMenu }
#define _DebugSlate_		\
		Event { "Debug", "" },		ResSubslate { resid_Debug }
#define _SearchSlate_		\
		Event { "Search", "" },		ResSubslate { resid_Search }
#define _FileMenu_			\
		Event { "File menu", "" },	Sequence{}, ClickMenu { "File" }, ResSubslate { resid_FileMenu }, endSequence{}
#define _ApplicationMenu_	\
		Event { "Application menu", "" }, ClickMenu { "Eclipse" },
#define _EditMenu_			\
		Event { "Edit menu", "" }, ClickMenu { "Edit" }
#define _NavigateMenu_		\
		Event { "Navigate menu", "" }, ClickMenu { "Navigate" }
#define _SourceMenu_		\
		Event { "Source", "" }, ClickMenu { "Source" }
#define _RefactorMenu_		\
		Event { "Refactor", "" }, ClickMenu { "Refactor" }
#define _SearchMenu_		\
		Event { "Search", "" }, ClickMenu { "Search" }
#define _ProjectMenu_		\
		Event { "Project", "" }, ClickMenu { "Project" }
#define _RunMenu_			\
		Event { "Run Menu", "" }, ClickMenu { "Run" }
#define _WindowMenu_		\
		Event { "Window", "" }, ClickMenu { "Window" }
#define _HelpMenu_			\
		Event { "Help Menu", "" }, Sequence{}, ClickMenu { "Help" }, Keypress { kc_down, 0 }, ResSubslate { resid_HelpMenu }, endSequence{}

#pragma mark TypeSpecial
resource restype_Slate (resid_TypeSpecialEclipseSlate, "Type Special Eclipse Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "something",	"type 'something'" },
			TypeText { "something" },
	} }
} };

#pragma mark _TypeEclipseSlate_
#define _TypeEclipseSlate_ 		\
	Event { "Type", "simulate keypresses" },	\
		ResSubslate { resid_TypeEclipseSlate }

#define _DialogStandards_			\
		_SlateGlobals_,                                                     \
		_CloseSubslate_,                                                    \
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },          \
		Event { "mouse", "" },	ResSubslate { resid_IMouseEclipseSlate },	\
		_TypeEclipseSlate_,                                                 \
		_CommandSlate_,                                                     \
		Event { "click one", "single click" }, IMouse { im_Click, 1 },      \
		Event { "click two", "double click" }, IMouse { im_Click, 2 },      \
		_FullAccessSlate_,                                                  \
		_DirectionKeys_,                                                    \
		_WhitespaceKeys_

#pragma mark 1 ===
#pragma mark FileMenu
resource restype_Slate (resid_FileMenu, "File") { {
	Slate { "File", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "New", "" }, Sequence{}, TypeText { "New" }, Keypress { kc_return, 0 }, ResSubslate { resid_FileNew }, endSequence{},
	} }
} };

resource restype_Slate (resid_FileNew, "FileNew") { {
	Slate { "New", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "cancel", "" }, Keypress { kc_escape, 0 },
		Event { "Java Project", "" }, Sequence{},
			 ResSubslate { resid_NewJavaProject }, TypeText { "Java Project" }, Keypress { kc_return, 0 }, endSequence{},
		Event { "Class", "" }, Sequence{},
			ResSubslate { resid_NewClass }, TypeText { "Class" }, Keypress { kc_return, 0 }, endSequence{},
		Event { "Test Case", "" }, Sequence{},
			ResSubslate { resid_NewTest }, TypeText { "JUnit Test Case" }, Keypress { kc_return, 0 }, endSequence{},
		Event { "File", "" }, Sequence{},
			ResSubslate { resid_NewFile }, TypeText { "File" }, Keypress { kc_return, 0 }, endSequence{},
	} }
} };

/* calculate left edge of this panel (PLEFT(1190) = 313) */
#define PWIDTH		562
#define PLEFT		(WINDOW_WIDTH - PWIDTH) / 2
resource restype_Slate (resid_NewJavaProject, "NewJavaProject") { {
	Slate { "Java Project", {
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "finish", "" },		Click { 1, PLEFT+505, 750, _screen, _topLeft },
		Event { "back", "" },			Click { 1, PLEFT+220, 750, _screen, _topLeft },
		Event { "next", "" },			Click { 1, PLEFT+315, 750, _screen, _topLeft },
		Event { "working sets", "" },	Click { 1, PLEFT+40, 555, _screen, _topLeft },
		Event { "source", "" },			Click { 1, PLEFT+110, 140, _screen, _topLeft },
		Event { "projects", "" },		Click { 1, PLEFT+190, 140, _screen, _topLeft },
		Event { "libraries", "" },		Click { 1, PLEFT+270, 140, _screen, _topLeft },
		Event { "order", "" },			Click { 1, PLEFT+350, 140, _screen, _topLeft },
		_DialogStandards_
	} }
} };

/* calculate left edge of this panel (PLEFT(1190) = 329) */
#define PWIDTH		532
#define PLEFT		(WINDOW_WIDTH - PWIDTH) / 2
resource restype_Slate (resid_NewClass, "NewClass") { {
	Slate { "Class", {
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "finish", "" },		Click { 1, PLEFT+505, 670, _screen, _topLeft },
		Event { "source folder", "" },	Click { 1, PLEFT+153, 135, _screen, _topLeft },
		Event { "package", "" },		Click { 2, PLEFT+200, 170, _screen, _topLeft },
		Event { "main method", "" },	Click { 1, PLEFT+126, 496, _screen, _topLeft },
		_DialogStandards_
	} }
} };

/* calculate left edge of this panel (PLEFT(1190) = 333) */
#define PWIDTH		524
#define PLEFT		(WINDOW_WIDTH - PWIDTH) / 2
resource restype_Slate (resid_NewTest, "NewTest") { {
	Slate { "Test", {
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "finish", "" },		Keypress { kc_enter, 0 },
		Event { "next", "" },			Click { 1, PLEFT+272, 588, _screen, _topLeft },
		Event { "version four", "" },	Click { 1, PLEFT+129, 134, _screen, _topLeft },
		Event { "source folder", "" },	Click { 1, PLEFT+153, 160, _screen, _topLeft },
		Event { "package", "" },		Click { 2, PLEFT+200, 195, _screen, _topLeft },
		Event { "before", "" },			Click { 1, PLEFT+126, 337, _screen, _topLeft },
		Event { "after", "" },			Click { 1, PLEFT+239, 337, _screen, _topLeft },
		Event { "set up", "" },			Click { 1, PLEFT+126, 360, _screen, _topLeft },
		Event { "tear down", "" },		Click { 1, PLEFT+239, 360, _screen, _topLeft },
		_DialogStandards_
	} }
} };

/* calculate left edge of this panel (PLEFT(1190) = ?) */
#define PWIDTH		0
#define PLEFT		(WINDOW_WIDTH - PWIDTH) / 2
resource restype_Slate (resid_NewFile, "NewFile") { {
	Slate { "File", {
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "finish", "" },		Keypress { kc_return, 0 },
		_DialogStandards_
	} }
} };

#pragma mark NavigateSlate
resource restype_Slate (resid_NavigateSlate, "Navigate") { {
	Slate { "Navigate", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Menu", "" },				ClickMenu { "Navigate" }, 
		ExitEvent { "External Docs", "" },		Keypress { kc_fn2, mf_shift },
		ExitEvent { "Breadcrumb", "" },			Keypress { kc_B, mf_command + mf_option },
	} }
} };

#pragma mark RunMenu
resource restype_Slate (resid_RunMenu, "Run") { {
	Slate { "Run", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "test", "" }, Sequence{}, Keypress { kc_X, mf_option + mf_command }, Keypress { kc_T, 0 }, endSequence{},
		ExitEvent { "java", "" }, Sequence{}, Keypress { kc_X, mf_option + mf_command }, Keypress { kc_J, 0 }, endSequence{},
		ExitEvent { "applet", "" }, Sequence{}, Keypress { kc_X, mf_option + mf_command }, Keypress { kc_A, 0 }, endSequence{},
		ExitEvent { "server", "" }, Sequence{}, Keypress { kc_X, mf_option + mf_shift }, Keypress { kc_R, 0 }, endSequence{},
		ExitEvent { "build", "" }, Sequence{}, Keypress { kc_X, mf_option + mf_command }, Keypress { kc_Q, 0 }, endSequence{},
		ExitEvent { "history", "" }, Sequence{}, ClickMenu { "Run" }, TypeText { "Run History" }, Keypress { kc_right, 0 }, endSequence{},
		ExitEvent { "dialog", "" }, Sequence{}, ClickMenu { "Run" }, TypeText { "Open Run Dialog" }, Keypress { kc_return, 0 }, ResSubslate { resid_RunDialog }, endSequence{},
		ExitEvent { "breakpoint", "" },	Keypress{ kc_B, mf_command + mf_shift }, 
	} }
} };

resource restype_Slate (resid_RunDialog, "Run Dialog") { {
	Slate { "Dialog", {
		ExitEvent { "run", "" },		Click { 1, 850, 640, _screen, _topLeft },
		_DialogStandards_
	} }
} };

#pragma mark DebugMenu
resource restype_Slate (resid_Debug, "Debug") { {
	Slate { "Debug", {
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "java", "" }, Sequence{}, Keypress { kc_D, mf_command + mf_option + mf_control }, Keypress { kc_J, 0 }, endSequence{},
		Event { "buildfile", "" }, Sequence{}, Keypress { kc_D, mf_command + mf_option + mf_control }, Keypress { kc_Q, 0 }, endSequence{},
		Event { "server", "" }, Sequence{}, Keypress { kc_D, mf_option + mf_shift }, Keypress { kc_R, 0 }, endSequence{},
		Event { "history", "" }, Sequence{}, ClickMenu { "Run" }, TypeText { "Debug History" }, Keypress { kc_right, 0 }, endSequence{},
		Event { "dialog", "" }, Sequence{}, ClickMenu { "Run" }, TypeText { "Open Debug Dialog" }, Keypress { kc_return, 0 }, ResSubslate { resid_DebugDialog }, endSequence{},
		Event { "breakpoint", "" },	Keypress { kc_B, mf_command + mf_shift },
		Event { "over", "" },		Keypress { kc_fn5, 0 },
		Event { "into", "" },		Keypress { kc_fn6, 0 },
		Event { "return", "" },		Keypress { kc_fn7, 0 },
		Event { "resume", "" },		Keypress { kc_fn8, 0 },
	} }
} };

/* calculate left edge of this panel (PLEFT(1190) = 195) */
#define PWIDTH		800
#define PLEFT		(WINDOW_WIDTH - PWIDTH) / 2
resource restype_Slate (resid_DebugDialog, "Debug Dialog") { {
	Slate { "Dialog", {
		ExitEvent { "debug", "" },		Click { 1, PLEFT+658, 640, _screen, _topLeft },
		_DialogStandards_
	} }
} };

#pragma mark SearchSlate
resource restype_Slate (resid_Search, "Search") { {
	Slate { "Search", {
		_SlateGlobals_,
		_TypeEclipseSlate_,
		_CommandSlate_,
		_WhitespaceKeys_,
		Event { "escape", "" },		Keypress { kc_escape, 0 },
		Event { "mouse", "" },		ResSubslate { resid_IMouseEclipseSlate },
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		Event { "open", "" },			Keypress { kc_H, mf_control },
		Event { "go next", "" },		Keypress { kc_period, mf_command },
		Event { "go previous", "" },	Keypress { kc_period, mf_command + mf_shift },
	} }
} };

#pragma mark HelpMenu
resource restype_Slate (resid_HelpMenu, "Help") { {
	Slate { "Help", {
		_SlateGlobals_,
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		ExitEvent { "exit", "" },		NilAction{},
		ExitEvent { "welcome", "" },	Sequence{}, TypeText { "welcome" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "contents", "" },	Sequence{}, TypeText { "help contents" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "search", "" },		Sequence{}, TypeText { "search" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "close view", "" },	Sequence{}, Keypress { kc_escape, 0 },
			Click { 0, WINDOW_WIDTH-198, 90, _screen, _topLeft }, Click { 1, WINDOW_WIDTH-198, 90, _screen, _topLeft }, endSequence{},
		_TypeEclipseSlate_,
		_DirectionKeys_,
		_WhitespaceKeys_
	} }
} };

#pragma mark 4 === Views

#pragma mark SelectViewSlate
resource restype_Slate (resid_SelectViewSlate, "View") { {
	Slate { "View", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "edit", "" },		Keypress { kc_fn12, 0 },
		ExitEvent { "document", "" },	Keypress { kc_E, mf_command + mf_shift },
		ExitEvent { "packages", "" },	Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_P, 0 }, endSequence{},
		ExitEvent { "navigator", "" },	Sequence{}, Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_N, 0 }, endSequence{},
		ExitEvent { "hierarchy", "" },	Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_T, 0 }, endSequence{},
		ExitEvent { "outline", "" },	Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_O, 0 }, endSequence{},
		ExitEvent { "console", "" },	Sequence{}, Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_C, 0 }, endSequence{},
		ExitEvent { "tasks", "" },		Sequence{}, Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_T, 0 }, endSequence{},
		ExitEvent { "error log", "" },	Sequence{}, Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_L, 0 }, endSequence{},
		ExitEvent { "problems", "" },	Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_X, 0 }, endSequence{},
		ExitEvent { "task list", "" },	Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_K, 0 }, endSequence{},
		ExitEvent { "expressions", "" }, Sequence{}, Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_X, 0 }, endSequence{},
		ExitEvent { "ant", "" },		Sequence{}, Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_A, 0 }, endSequence{},
		ExitEvent { "other", "" },		Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_Q, 0 }, endSequence{},
	} }
} };

#define JAVA_RightPanel_LEFT	WINDOW_WIDTH-194
	// current: 990
#define JAVA_RightPanel_TOP		397

#define JAVA_BottomPanel_LEFT	264
#define JAVA_BottomPanel_TOP	WINDOW_HEIGHT-177
	// current: 641

#pragma mark -
#pragma mark AntView
// Ant_Java
resource restype_Slate (resid_Ant_Java, "Ant_Java") { {
	Slate { "Ant", {
		Event { "home", "" },		Click { 0, JAVA_RightPanel_LEFT+36, JAVA_RightPanel_TOP+20, _screen, _topLeft },
		ExitEvent { "run", "" },	Sequence{}, Keypress { kc_X, mf_option + mf_command }, Keypress { kc_Q, 0 }, endSequence{},
		_ViewStandards_
	} }
} };
#define _Ant_Java_	\
		Event { "Ant", "" },	Sequence{},                                  \
			Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_A, 0 }, \
			ResSubslate { resid_Ant_Java },                                 \
			endSequence{}

#pragma mark ConsoleView
// Console_Java
resource restype_Slate (resid_Console_Java, "Console_Java") { {
	Slate { "Console", {
		Event { "home", "" },		Click { 0, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+20, _screen, _topLeft },
		_ViewStandards_
	} }
} };
#define _Console_Java_	\
		Event { "console", "" },	Sequence{},                                  \
			Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_C, 0 },      \
			ResSubslate { resid_Console_Java },                                 \
			endSequence{}


#pragma mark ErrorsView
// Errors_Java
#define	ER_VLEFT	JAVA_RightPanel_LEFT
#define ER_VTOP		JAVA_BottomPanel_TOP
resource restype_Slate (resid_Errors_Java, "Errors_Java") { {
	Slate { "Errors", {
		Event { "home", "" },		Click { 0, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+20, _screen, _topLeft },
		_ViewStandards_
	} }
} };
#define _Errors_Java_	\
		Event { "Errors", "" },	Sequence{},                                \
			Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_L, 0 }, \
			ResSubslate { resid_Errors_Java },                             \
			endSequence{}

#pragma mark HierarchyView
// assumes narrow view at left
// All Perspectives
resource restype_Slate (resid_HierarchyView, "HierarchyView") { {
	Slate { "Hierarchy", {
		Event { "home", "" },		Click { 0, 63, 134, _screen, _topLeft },
		_ViewStandards_
	} }
} };

#define _HierarchyView_		\
	Event { "Hierarchy", "" },	Sequence{},                                 \
		Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_T, 0 },    \
		ResSubslate { resid_HierarchyView },								\
		endSequence{}

#pragma mark 5 -

#pragma mark JUnitView
// assumes narrow view at left
// All Perspectives
resource restype_Slate (resid_JUnitView, "JUnitView") { {
	Slate { "JUnit", {
		Event { "home", "" },				Click { 0, 59, 535, _screen, _topLeft },
		_ViewStandards_
	} }
} };

#define _JUnitView_		\
	Event { "Testing", "" },	Sequence{},                                 \
		Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_J, 0 },    \
		ResSubslate { resid_JUnitView },									\
		endSequence{}

#pragma mark NavigatorView
// assumes narrow view at left
// All Perspectives
resource restype_Slate (resid_NavigatorView, "NavigatorView") { {
	Slate { "Navigator", {
		Event { "home", "" },				Click { 0, 63, 134, _screen, _topLeft },
		Event { "link with editor", "" },	Click { 1, 197, 115, _screen, _topLeft },
		Event { "focus task", "" },			Click { 1, 225, 115, _screen, _topLeft },
		Event { "collapse all", "" },		Keypress { kc_kpdivide, mf_command + mf_shift },
		_ViewStandards_
	} }
} };

#define _NavigatorView_		\
	Event { "Navigator", "" },	Sequence{},                                 \
		Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_N, 0 },		\
		ResSubslate { resid_NavigatorView },									\
		endSequence{}

#pragma mark OutlineView
// Outline_Java
resource restype_Slate (resid_Outline_Java, "Outline_Java") { {
	Slate { "Outline", {
		Event { "home", "" },		Click { 0, JAVA_RightPanel_LEFT+36, JAVA_RightPanel_TOP+20, _screen, _topLeft },
		_ViewStandards_
	} }
} };
#define _Outline_Java_	\
		Event { "outline", "" },	Sequence{},                                 \
			Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_O, 0 },    \
			ResSubslate { resid_Outline_Java },                                 \
			endSequence{}

#pragma mark PackagesView
// assumes narrow view at left
// All Perspectives
resource restype_Slate (resid_PackagesView, "PackagesView") { {
	Slate { "Packages", {
		Event { "home", "" },				Click { 0, 63, 134, _screen, _topLeft },
		Event { "link with editor", "" },	Click { 1, 197, 115, _screen, _topLeft },
		Event { "focus task", "" },			Click { 1, 225, 115, _screen, _topLeft },
		Event { "collapse all", "" },		Keypress { kc_kpdivide, mf_command + mf_shift },
		_ViewStandards_
	} }
} };

#define _PackagesView_		\
	Event { "packages", "" },	Sequence{},                                 \
		Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_P, 0 },    \
		ResSubslate { resid_PackagesView },									\
		endSequence{}

#pragma mark ProblemsView
// Problems_Java
resource restype_Slate (resid_Problems_Java, "Problems_Java") { {
	Slate { "Problems", {
		Event { "home", "" },		Click { 0, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+40, _screen, _topLeft },
		Event { "row one", "" },	Click { 1, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+40, _screen, _topLeft },
		Event { "row two", "" },	Click { 1, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+58, _screen, _topLeft },
		Event { "row three", "" },	Click { 1, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+76, _screen, _topLeft },
		Event { "row four", "" },	Click { 1, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+94, _screen, _topLeft },
		Event { "row five", "" },	Click { 1, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+112, _screen, _topLeft },
		_ViewStandards_
	} }
} };
#define _Problems_Java_	\
		Event { "Problems", "" },	Sequence{},                                 \
			Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_X, 0 },	\
			ResSubslate { resid_Problems_Java },                                \
			endSequence{}

#pragma mark 6 -
#pragma mark TaskListView
// TL_PRES_X: horizontal screen position of Presentation icon 
#define _TaskListItems_		\
	Event { "home", "" },			Click { 0, TL_VLEFT+62, TL_VTOP+55, _screen, _topLeft },                      \
	Event { "row one", "" },		Click { 1, TL_VLEFT+62, TL_VTOP+55+0, _screen, _topLeft },                      \
	Event { "activate editor", "" }, Click { 1, TL_VLEFT-26, 120, _screen, _topLeft },	\
	Event { "activate", "" },		Keypress { kc_fn9, mf_command },					\
	Event { "show completed", "" },	Sequence{}, Keypress { kc_fn10, mf_command }, TypeText { "Show Completed Tasks" },	\
			Keypress { kc_return, 0 }, endSequence{},									\
	Event { "deactivate", "" },		Keypress { kc_fn9, mf_command + mf_shift },			\
	Event { "new task", "" },		Keypress { kc_6, mf_command },						\
	Event { "check off", "" },		Keypress { kc_C, mf_shift + mf_option },			\
	Event { "open", "" },			Keypress { kc_fn12, mf_command + mf_option },       \
	Event { "presentation", "" },	Click { 1, TL_PRES_X, TL_VTOP-14, _screen, _topLeft },     \
	Event { "workweek", "" },		Click { 1, TL_PRES_X+31, TL_VTOP-14, _screen, _topLeft },	\
	Event { "filter completed", "" },	Sequence{},		\
		Keypress { kc_fn10, mf_command }, TypeText { "Filter Completed Tasks" }, Keypress { kc_return, 0 }, endSequence{},	\
	ExitEvent { "enter", "" },		Keypress { kc_enter, 0 },							\
	_JumpNorthSubslate_,		\
	_JumpDownSubslate_,		\
	Event { "page top", "" },	Keypress { kc_home, 0 },           \
	Event { "page end", "" },	Keypress { kc_end, 0 },            \
	Event { "page north", "" },	Keypress { kc_pageup, 0 },       \
	Event { "page down", "" },	Keypress { kc_pagedown, 0 },	\
	_ViewStandards_

// Planning
#define TL_VLEFT	WINDOW_WIDTH-500
#define	TL_PRES_X	TL_VLEFT+405
#define TL_VTOP		104
resource restype_Slate (resid_TaskList_Planning, "TaskList_Planning") { {
	Slate { "TaskList", {
		_TaskListItems_
	} }
} };
#define _TaskList_Planning_	\
	Event { "task list", "" },	Sequence{},                                  \
		Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_K, 0 },       \
		ResSubslate { resid_TaskList_Planning },                                 \
		endSequence{}

#pragma mark TasksView
// Tasks_Java
resource restype_Slate (resid_Tasks_Java, "Tasks_Java") { {
	Slate { "Tasks", {
		Event { "home", "" },	Click { 0, JAVA_BottomPanel_LEFT+36, JAVA_BottomPanel_TOP+40, _screen, _topLeft },
		_ViewStandards_
	} }
} };
#define _Tasks_Java_	\
		Event { "Tasks", "" },	Sequence{},                                  \
			Keypress { kc_Q, mf_shift + mf_option }, Keypress { kc_T, 0 }, \
			ResSubslate { resid_Tasks_Java },                                 \
			endSequence{}

// Java
#define	TL_PRES_X	WINDOW_WIDTH-73
#define TL_VLEFT	JAVA_RightPanel_LEFT
#define TL_VTOP		126
resource restype_Slate (resid_TaskList_Java, "TaskList_Java") { {
	Slate { "TaskList", {
		_TaskListItems_
	} }
} };
#define _TaskList_Java_	\
		Event { "task list", "" },	Sequence{},                                  \
			Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_K, 0 },     \
			ResSubslate { resid_TaskList_Java },                                 \
			endSequence{}


#pragma mark 7 === Perspectives
#pragma mark PerspectiveSlate
resource restype_Slate (resid_PerspectiveSlate, "Perspective") { {
	Slate { "Persp", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "list", "" },		Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_L, 0 },
			SwitchSlate { resid_Eclipse }, endSequence{},
		Event { "Java", "" },			Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_J, 0 }, 
			SwitchSlate { resid_JavaPersp }, endSequence{},
		ExitEvent { "Enterprise", "" },	Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_E, 0 },
			SwitchSlate { resid_Eclipse }, endSequence{},
		Event { "Planning", "" },	Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_P, 0 }, 
			SwitchSlate { resid_PlanningPersp }, endSequence{},
		ExitEvent { "Browsing", "" },	Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_B, 0 },
			SwitchSlate { resid_Eclipse }, endSequence{},
		ExitEvent { "Debug", "" },		Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_D, 0 },
			SwitchSlate { resid_Eclipse }, endSequence{},
		ExitEvent { "Repository", "" },	Sequence{}, Keypress { kc_P, mf_control + mf_option }, Keypress { kc_R, 0 },
			SwitchSlate { resid_Eclipse }, endSequence{},
		Event { "Synchronize", "" },	Sequence{}, Keypress { kc_P, mf_command + mf_option }, Keypress { kc_S, 0 }, 
			SwitchSlate { resid_SyncPersp }, endSequence{},
	} }
} };

#pragma mark = Java
#define	TL_VLEFT	WINDOW_WIDTH-200
#pragma mark JavaPersp
resource restype_Slate (resid_JavaPersp, "Java") { {
	Slate { "Eclipse Java", {
		Event { "File menu", "" },	Sequence{}, ClickMenu { "File" }, ResSubslate { resid_FileMenu }, endSequence{},
		Event { "View", "" },		Subslate { "View" },
			_SlateGlobals_,
			_CloseSubslate_,
			_Ant_Java_,
			_Console_Java_,
			_Errors_Java_,
			_HierarchyView_,
			_JUnitView_,
			_NavigatorView_,
			_Outline_Java_,
			_PackagesView_,
			_Problems_Java_,
			_TaskList_Java_,
			_Tasks_Java_,
			endSubslate{},
		_NavigateSlate_,
		_RunSlate_,
		_DebugSlate_,
		_SearchSlate_,
		_FileMenu_,
		_NavigateMenu_,
		_SourceMenu_,
		_RefactorMenu_,
		_SearchMenu_,
		_ProjectMenu_,
		_RunMenu_,
		_WindowMenu_,
		_PerspectiveStandards_,
		Event { "other Views", "" },	ResSubslate { resid_JavaViewsSlate },
	} }
} };

#pragma mark JavaViewsSlate
resource restype_Slate (resid_JavaViewsSlate, "View") { {
	Slate { "View", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "edit", "" },		Keypress { kc_fn12, 0 },
		ExitEvent { "document", "" },	Keypress { kc_E, mf_command + mf_shift },
		ExitEvent { "other", "" },		Sequence{}, Keypress { kc_Q, mf_command + mf_option }, Keypress { kc_Q, 0 }, endSequence{},
	} }
} };

#pragma mark 8 = Planning
#define	MY_ELEFT	4
#pragma mark PlanningPersp
resource restype_Slate (resid_PlanningPersp, "Planning") { {
	Slate { "Eclipse Planning", {
		Event { "name", "" },			Click { 1, MY_ELEFT+134, 145, _screen, _topLeft },
		Event { "priority", "" },		Click { 1, MY_ELEFT+104, 175, _screen, _topLeft },
		Event { "status", "" },			Click { 1, MY_ELEFT+249, 175, _screen, _topLeft },
		Event { "notes", "" },			Click { 1, MY_ELEFT+128, 470, _screen, _topLeft },
		Event { "link", "" },			Sequence{},
			Click { 3, MY_ELEFT+368, 207, _screen, _topLeft },
			ResSubslate { resid_LinkSlate },
			endSequence{},
		Event { "schedule", "" },		Sequence{},
			Click { 1, MY_ELEFT+228, 270, _screen, _topLeft },
			ResSubslate { resid_ScheduleSlate },
			endSequence{},
		Event { "due date", "" },		Sequence{},
			Click { 1, MY_ELEFT+389, 270, _screen, _topLeft },
			ResSubslate { resid_ChooseDateSlate },
			endSequence{},
		Event { "estimate", "" },		Click { 2, MY_ELEFT+564, 270, _screen, _topLeft },
		_TaskList_Planning_,
		_SearchSlate_,
		_FileMenu_,
		_NavigateMenu_,
		_SearchMenu_,
		_WindowMenu_,
		_PerspectiveStandards_
	} }
} };

#pragma mark ScheduleSlate
resource restype_Slate ( resid_ScheduleSlate, "schedule" ) { {
	Slate { "schedule", {
		_SlateGlobals_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Keypress { kc_escape, 0 },
		Event { "today", "" },			Keypress { kc_down, 0 },
		Event { "Monday", "" },			TypeText { "Monday" },
		Event { "Tuesday", "" },		TypeText { "Tuesday" },
		Event { "Wednesday", "" },		TypeText { "Wednesday" },
		Event { "Thursday", "" },		TypeText { "Thursday" },
		Event { "Friday", "" },			TypeText { "Friday" },
		Event { "Saturday", "" },		TypeText { "Saturday" },
		Event { "Sunday", "" },			TypeText { "Sunday" },
		Event { "This Week", "" },		TypeText { "This Week" },
		Event { "Next Week", "" },		TypeText { "Next Week" },
		Event { "Two Weeks", "" },		TypeText { "Two Weeks" },
		Event { "Not Scheduled", "" },	TypeText { "Not Scheduled" },
		Event { "Choose Date", "" },	Sequence{},
			TypeText { "Choose Date" },
			ResSubslate { resid_ChooseDateSlate },
			endSequence{},
	} }
} };

#pragma mark ChooseDateSlate
resource restype_Slate ( resid_ChooseDateSlate, "choose date" ) { {
	Slate { "choose date", {
		_SlateGlobals_,
		_DirectionKeys_,
		_WhitespaceKeys_,
		ExitEvent { "okay", "" },		Keypress { kc_return, 0 },
		ExitEvent { "cancel", "" },		Click { 1, 555, 460, _screen, _topLeft },
		Event { "tab back", "" },		Keypress { kc_tab, mf_shift },
		Event { "next month", "" },		UIScript { "click button 6 of window \"Choose Date\"", "" },
		Event { "next year", "" },		UIScript { "click button 7 of window \"Choose Date\"", "" }, 
		Event { "previous month", "" },	UIScript { "click button 5 of window \"Choose Date\"", "" }, 
		Event { "previous year", "" },	UIScript { "click button 4 of window \"Choose Date\"", "" }, 
	} }
} };

#pragma mark LinkSlate
resource restype_Slate ( resid_LinkSlate, "link" ) { {
	Slate { "link", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "java dev", "" },	TypeText { "file:/Developer/Documentation/InHouse/Tech/JavaDev/JavaDev_hist.html" },
	} }
} };

#pragma mark = Synchronize
#define	SY_VLEFT	4
#define SY_VTOP		120
#pragma mark SyncPersp
resource restype_Slate (resid_SyncPersp, "Synchronize") { {
	Slate { "Eclipse Synch", {
		Event { "differences", "" },	Sequence{},
			ClickMod { 1, SY_VLEFT+12, SY_VTOP+20, _screen, _topLeft, mf_control },
			TypeText { "Synchronize" }, Keypress { kc_return, 0 }, endSequence{},
		Event { "commit", "" },	Sequence{},
			ClickMod { 1, SY_VLEFT+56, SY_VTOP+40, _screen, _topLeft, mf_control },
			TypeText { "Commit" }, Keypress { kc_return, 0 }, endSequence{},
		Event { "show list", "" },		Sequence{}, Keypress { kc_Q, mf_option + mf_command }, Keypress { kc_Y, 0 }, endSequence{},
		Event { "repository", "" },		Sequence{}, Keypress { kc_Q, mf_option + mf_shift }, Keypress { kc_R, 0 }, endSequence{},
		_SearchSlate_,
		_FileMenu_,
		_NavigateMenu_,
		_SearchMenu_,
		_WindowMenu_,
		_PerspectiveStandards_
	} }
} };

#pragma mark 9 ===
#pragma mark IMouse
resource restype_Slate (resid_IMouseEclipseSlate, "") { {
	Slate { "IMouse",	{
		Event { "escape", "" },		Keypress { kc_escape, 0 },
		_IMouseItems_
	} }
} };

/*
	Event { "go back", "" },	Keypress { kc_left, mf_command + mf_option },
	Event { "go forward", "" },	Keypress { kc_right, mf_command + mf_option },
	Event { "goto line", "" },	Keypress { kc_L, mf_command },
*/
#pragma mark Type
resource restype_Slate (resid_TypeEclipseSlate, "Type Slate") { {
	Slate { "Type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "fold", "" },		Keypress { kc_kpminus, mf_command },
		Event { "unfold", "" },		Keypress { kc_kpplus, mf_command },
		Event { "fold all", "" },	Keypress { kc_kpdivide, mf_command + mf_shift },
		Event { "unfold all", "" },	Keypress { kc_kptimes, mf_command },
		Event { "go next", "" },	Keypress { kc_period, mf_command },
		Event { "go previous", "" }, Keypress { kc_period, mf_command + mf_shift },
		Event { "complete", "" },	Keypress { kc_space, mf_control },
		Event { "cancel", "" },		Keypress { kc_escape, 0 },
		Event { "choose two", "" }, _down,
		Event { "choose three", "" }, Sequence{}, _down, _down, endSequence{},
		Event { "choose four", "" }, Sequence{}, _down, _down, _down, endSequence{},
		Event { "choose five", "" }, Sequence{}, _down, _down, _down, _down, endSequence{},
		Event { "choose six", "" }, Sequence{}, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose seven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose eight", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose nine", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose ten", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose eleven", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose twelve", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "choose thirteen", "" }, Sequence{}, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, _down, endSequence{},
		Event { "add space", "" },	Sequence{}, Keypress { kc_return, 0 }, Keypress { kc_space, 0 }, endSequence{},
		Event { "document", "" },	Keypress { kc_E, mf_command + mf_shift },
		Event { "recent files", "" }, ClickMenu { "File" }, 
		Event { "do select", "" },	Subslate { "sel" },
			_CloseSubslate_,
			Event { "right", "" },	Subslate { "right" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "one", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "two", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "three", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "four", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "five", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "six", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "seven", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "eight", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "nine", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },					endSequence{},
				ExitEvent { "ten", "" },		Sequence{},
					Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option }, Keypress { kc_right, mf_shift + mf_option },
					endSequence{},
				endSubslate{},
			Event { "left", "" },	Subslate { "left" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "one", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "two", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "three", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "four", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "five", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "six", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "seven", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "eight", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "nine", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				ExitEvent { "ten", "" },		Sequence{},
					Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option }, Keypress { kc_left, mf_shift + mf_option },
					endSequence{},
				endSubslate{},
			Event { "north", "" },	Subslate { "up" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "one", "" },		Sequence{},
					Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "two", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "three", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "four", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "five", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "six", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "seven", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "eight", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "nine", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "ten", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "twenty", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				ExitEvent { "forty", "" },		Sequence{},
					Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
						Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift }, Keypress { kc_up, mf_shift },
					endSequence{},
				endSubslate{},
			Event { "down", "" },	Subslate { "down" },
				_SlateGlobals_,
				_CloseSubslate_,
				ExitEvent { "one", "" },		Sequence{},
					Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "two", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "three", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "four", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "five", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "six", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "seven", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "eight", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "nine", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "ten", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "twenty", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				ExitEvent { "forty", "" },		Sequence{},
					Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
						Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift }, Keypress { kc_down, mf_shift },
					endSequence{},
				endSubslate{},
		endSubslate{},
		Event { "jump right", "option-right <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },
				endSequence{},
			endSubslate{},
		Event { "jump left", "option-left <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option },
				endSequence{},
			endSubslate{},
		Event { "jump down", "down <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "twenty", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "thirty", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			ExitEvent { "forty", "" },		Sequence{},
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 }, Keypress { kc_down, 0 },
				endSequence{},
			endSubslate{},
		Event { "jump north", "up <n> times" },	Subslate { "<n>" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "one", "" },		Sequence{},
				Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "two", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "three", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "four", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "five", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "six", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "seven", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "eight", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "nine", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "ten", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "twenty", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "thirty", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			ExitEvent { "forty", "" },		Sequence{},
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 }, Keypress { kc_up, 0 },
				endSequence{},
			endSubslate{},
		Event { "Special", "type predefined text shortcuts" },
			ResSubslate { resid_TypeSpecialEclipseSlate },
		Event { "page top", "" },	Keypress { kc_home, 0 },
		Event { "page end", "" },	Keypress { kc_end, 0 },
		Event { "page north", "" },	Keypress { kc_pageup, 0 },
		Event { "page down", "" },	Keypress { kc_pagedown, 0 },
		_TypeSlateItems_,
	} }
} };

#pragma mark Eclipse
resource restype_Slate (resid_Eclipse, "Eclipse Slate") { {
	Slate { "Eclipse",	{
		Event { "View", "" },		ResSubslate { resid_SelectViewSlate },
		_NavigateSlate_,
		_RunSlate_,
		_DebugSlate_,
		_SearchSlate_,
		_FileMenu_,
		_ApplicationMenu_,
		_NavigateMenu_,
		_SourceMenu_,
		_RefactorMenu_,
		_SearchMenu_,
		_ProjectMenu_,
		_RunMenu_,
		_WindowMenu_,
		_HelpMenu_,
		_PerspectiveStandards_
	 } }
} };

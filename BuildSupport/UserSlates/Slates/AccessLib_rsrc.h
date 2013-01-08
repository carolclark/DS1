// =================================================================================
//	AccessLib_rsrc.h			©2002-08 C & C Software, Inc. All rights reserved.
// =================================================================================

#pragma once

#define _NoSubObjects	int = 0

// Commands Supported by PowerPlant, as defined in PowerPlant.r:'Mcmd'
	#define cmd_Nothing			0
	#define msg_Nothing			0
	#define cmd_UseMenuItem		-1
	#define cmd_About			1
	#define cmd_New				2
	#define cmd_Open			3
	#define cmd_Close			4
	#define cmd_Save			5
	#define cmd_SaveAs			6
	#define cmd_SaveCopyAs		18
	#define cmd_Revert			7
	#define cmd_PageSetup		8
	#define cmd_Print			9
	#define cmd_PrintOne		17
	#define cmd_Quit			10
	#define cmd_Undo			11
	#define cmd_Cut				12
	#define cmd_Copy			13
	#define cmd_Paste			14
	#define cmd_Clear			15
	#define cmd_SelectAll		16
	#define cmd_ShowClipboard	19
	#define cmd_FontMenu		250
	#define cmd_SizeMenu		251
	#define cmd_StyleMenu		252
	#define cmd_FontLarger		301
	#define cmd_FontSmaller		302
	#define cmd_FontOther		303
	#define cmd_Plain			401
	#define cmd_Bold			402
	#define cmd_Italic			403
	#define cmd_Underline		404
	#define cmd_Outline			405
	#define cmd_Shadow			406
	#define cmd_Condense		407
	#define cmd_Extend			408
	#define cmd_JustifyDefault	411
	#define cmd_JustifyLeft		412
	#define cmd_JustifyCenter	413
	#define cmd_JustifyRight	414
	#define cmd_JustifyFull		415

#define cmd_UserInfo				1000
#define cmd_ChooseUser				1001
#define cmd_Tokenize				1100
#define cmd_ThrowError				1200
#define cmd_SystemEnv				1300
#define cmd_ClearModifiers			1400
#define cmd_ShowSlate				2000
#define cmd_ShowLastFault			2001

#define restype_ErrorInfo			'ErIn'
#define version_ErrorInfo			0x00000101

#define resid_AccessLibErrorInfo	128
#define resid_OSErrorInfo			129

#define dir_Subclass				1
#define dir_EndEmbed				2

#define restype_Slate				'Slat'
#define version_Slate				0x00000101
#define classid_TopSlate			'TSlt'

#define classid_SlateItem			'SItm'
#define tag_NoExit					0
#define tag_Exit					1
#define classid_SlateEvent			'SEvt'

#define stag_None					0
#define stag_Slate					100
#define stag_SlateEvent				101
#define stag_Subslate				102
#define stag_Sequence				103
#define stag_Action					104

#define classid_Action				'Actn'
#define classid_Command				'Comd'
#define classid_SwitchSlate			'SwSl'
#define classid_ResSubslate			'RSSl'
#define classid_CloseSubslate		'ClSl'
#define classid_Keypress			'Keyp'
#define classid_TypeText			'Type'
#define classid_IMouse				'IMse' 
#define classid_Click				'Clik'
#define classid_ClickMod			'CkMd'
#define classid_Launch				'Laun'
#define classid_Subslate			'SSlt'
#define classid_Sequence			'Sequ'
#define classid_Script				'Scpt'
#define classid_UIScript			'UISc'
#define classid_OpenURL				'OUrl'
#define classid_UIWindow			'UIWn'
#define classid_ClickMenu			'CMnu'
#define classid_Wait				'Wait'

#define classid_NameOrIndexSpec		'NoIS'
#define classid_ScreenSpot			'SSpt'

#define restype_Window				'Wind'
#define version_Window				0x00000101
#define classid_Window				'Wind'

#define restype_Panel				'Panl'
#define version_Panel				0x00000101
#define classid_Panel				'Panl'

#define classid_StaticText			'STxt'
#define classid_PushButton			'PBtn'

#define classid_PanelStyle			'Styl'

#define dir_WindowResID				11
#define dir_WindowPosition			12
#define dir_WindowRelative			13
#define dir_ObjectID				14

// Window Definition & Placement Constants
	// Window Type
	#define	wtype_none				0
	#define wtype_document			1
	#define wtype_modal				2
	#define wtype_floating			3

	// Window Relative
	#define wrel_none				0
	#define wrel_mainScreen			1
	#define wrel_parentWindow		2
	#define wrel_parentWindowScreen	3

	// Window Position
	#define wpos_none				0
	#define wpos_cascade			1
	#define wpos_alert				2
	#define wpos_topLeft			0x91
	#define wpos_topCenter			0x92
	#define wpos_topRight			0x94
	#define wpos_centerLeft			0xA1
	#define wpos_center				0xA2
	#define wpos_centerRight		0xA4
	#define wpos_bottomLeft			0xC1
	#define wpos_bottomCenter		0xC2
	#define wpos_bottomRight		0xC4
	#define wpos_centerCenter		wpos_center
	#define wpos_centered			wpos_center

// ScreenSpot Constants
	// RelativeTo
	#define wrt_screen				1
	#define wrt_window				2
	#define wrt_cursor				3
	// Position
	#define spos_top				1
	#define spos_bottom				2
	#define spos_vcenter			3
	#define spos_left				4
	#define spos_right				8
	#define spos_hcenter			0x0C

// Message Constants
	#define msg_okay				1000
	#define msg_cancel				1001

// Slate Standard Items
#define _SlateGlobals_	\
	Event { "Show Slate", "display the contents of the current Slate" },	\
		Command { cmd_ShowSlate },	\
	Event { "Last Fault", "display information about the last incomplete operation" },	\
		Command { cmd_ShowLastFault },	\
	Event { "goto sleep", "" },	ResSubslate { resid_Sleep }

#define _ComponentAppStandards_	\
	Event { "Apple About", "get information about the application currently running" },	\
		Command { cmd_About },	\
	Event { "File New", "open a new window" },	\
		Command { cmd_New },	\
	Event { "File Close", "close the currently active window" },	\
		Command { cmd_Close },	\
	Event { "File Quit", "quit this application" },	\
		Command { cmd_Quit }


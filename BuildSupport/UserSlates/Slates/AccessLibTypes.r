// =================================================================================
//	AccessLibTypes.r			©2002-08 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLib_rsrc.h"

#define	_noSubsAllowed	int = 0

#define	__dummy__		align byte

#ifndef _user_WindowSubs
	#define _user_WindowSubs			__dummy__
#endif

#ifndef _user_PanelSubs
	#define _user_PanelSubs				__dummy__
#endif

#ifndef _user_StaticTextSubs
	#define _user_StaticTextSubs		__dummy__
#endif

#ifndef _user_PushButtonSubs
	#define _user_PushButtonSubs		__dummy__
#endif

#ifndef _user_SlateSubs
	#define _user_SlateSubs				__dummy__
#endif

#ifndef _user_SlateItemSubs
	#define _user_SlateItemSubs			__dummy__
#endif

#define _GlobalDirectives						\
	case subclass:								\
		key longint = dir_Subclass;				\
		literal longint

#define _WindowHeader							\
	key literal longint = classid_Window;		\
	byte document	= wtype_document,			\
		modal		= wtype_modal,				\
		floating	= wtype_floating

#define _WindowData								\
	int = $$CountOf (WindowSubs);				\
	array WindowSubs {							\
		switch {									\
			_GlobalDirectives;						\
			_user_WindowSubs;						\
			case windowPosition:					\
				key longint = dir_WindowPosition;	\
				byte cascade	= wpos_cascade,		\
					alert 		= wpos_alert,		\
					topLeft		= wpos_topLeft,		\
					topCenter	= wpos_topCenter,	\
					topRight	= wpos_topRight,	\
					centerLeft	= wpos_centerLeft,	\
					center		= wpos_center,		\
					centerRight	= wpos_centerRight,	\
					bottomLeft	= wpos_bottomLeft,	\
					bottomCenter = wpos_bottomCenter,	\
					bottomRight = wpos_bottomRight,	\
					centerCenter = wpos_center,		\
					centered	= wpos_center;		\
				int;	int;	/* offset */		\
			case windowRelative:					\
				key longint = dir_WindowRelative;	\
				byte mainScreen	= wrel_mainScreen,	\
					frontWindow = wrel_parentWindow,	\
					frontWindowScreen = wrel_parentWindowScreen,	\
					screen		= wrel_mainScreen;	\
			};										\
	}

#define _PanelObjectDirectives					\
	_GlobalDirectives;							\
	case objectID:								\
		key longint = dir_ObjectID;				\
		literal longint

type restype_Window {
	longint = version_Window;
	int = $$CountOf(WindowItems);
	array WindowItems {
		switch {
			_GlobalDirectives;
			case Window:
				_WindowHeader;
				_WindowData;
		};
	};
};

type restype_Panel {
	longint = version_Panel;
	int = $$CountOf(PanelItems);
	array PanelItems {
		switch {
			_GlobalDirectives;
			case Panel:
				key literal longint = classid_Panel;
				int = $$CountOf(PanelSubs);
				array PanelSubs {
					switch {
						_GlobalDirectives;
						_user_PanelSubs;
						case windowResID:
							key longint = dir_WindowResID;
							int;
						case Window:
							_WindowHeader;
							_WindowData;
						case StaticText:
							key literal longint = classid_StaticText;
							cstring;		/* descriptor */
							int; int;		/* minimum width (chars, pixels) */
							int; int;		/* minimum height (chars, pixels) */
							int = $$CountOf (StaticTextSubs);
							array StaticTextSubs {
								switch {
									_GlobalDirectives;
									_user_StaticTextSubs;
									_PanelObjectDirectives;
								};
							};
						case PushButton:
							key literal longint = classid_PushButton;
							cstring;		/* descriptor */
							longint;		/* value message */
							int = $$CountOf (PushButtonSubs);
							array PushButtonSubs {
								switch {
									_GlobalDirectives;
									_user_PushButtonSubs;
									_PanelObjectDirectives;
								};
							};
					};
				};
		};
	};
};

#define _SpecifierString		\
			cstring;			\
			_noSubsAllowed

#define _ScreenSpot				\
	int;		/* click offset: h */			\
	int;		/* click offset: v */			\
	byte	screen	= wrt_Screen,				\
			window	= wrt_Window,				\
			cursor	= wrt_Cursor;				\
	_SpecifierString;	/* window */			\
	byte;		/* position */					\
	_noSubsAllowed

#define _topLeft		spos_top + spos_left
#define _topCenter		spos_top + spos_hcenter
#define _topRight		spos_top + spos_right
#define _centerLeft		spos_vcenter + spos_left
#define _centerCenter	spos_vcenter + spos_hcenter
#define _centerRight	spos_vcenter + spos_right
#define _bottomLeft		spos_bottom + spos_left
#define _bottomCenter	spos_bottom + spos_hcenter
#define _bottomRight	spos_bottom + spos_right
#define _center			_centerCenter

#define _screen			screen, "0"
#define _cursor			cursor, "0", _topLeft

#define _Action										\
	case NilAction:									\
		key literal longint = classid_Action;		\
		_noSubsAllowed;								\
	case Command:									\
		key literal longint = classid_Command;		\
		longint;	/* CommandID */					\
		_noSubsAllowed;								\
	case SwitchSlate:								\
		key literal longint = classid_SwitchSlate;	\
		int;		/* ResID */						\
		_noSubsAllowed;								\
	case ResSubslate:								\
		key literal longint = classid_ResSubslate;	\
		int;		/* ResID */						\
		_noSubsAllowed;								\
	case CloseSubslate:								\
		key literal longint = classid_CloseSubslate; \
		_noSubsAllowed;								\
	case Keypress:									\
		key literal longint = classid_Keypress;		\
		int;			/* KeyCode */				\
		byte;			/* Modifiers */				\
		longint = 0;	/* No Delay */				\
		_noSubsAllowed;								\
	case QuicKey:		/* alias */					\
		key literal longint = classid_Keypress;		\
		int;			/* KeyCode */				\
		byte;			/* Modifiers */				\
		longint = 0;	/* No Delay */				\
		_noSubsAllowed;								\
	case KeyDelay:									\
		key literal longint = classid_Keypress;		\
		int;			/* KeyCode */				\
		byte;			/* Modifiers */				\
		longint;		/* Delay Ticks*/			\
		_noSubsAllowed;								\
	case TypeText:									\
		key literal longint = classid_TypeText;		\
		cstring;		/* Text */					\
		_noSubsAllowed;								\
	case IMouse:									\
		key literal longint = classid_IMouse;		\
		byte;		/* Operation Code */			\
		byte;		/* Argument */					\
		_noSubsAllowed;								\
	case Click:										\
		key literal longint = classid_Click;		\
		byte;		/* click count */				\
		_ScreenSpot;								\
		_noSubsAllowed;								\
	case ClickMod:									\
		key literal longint = classid_ClickMod;		\
		byte;		/* click count */				\
		_ScreenSpot;								\
		byte;			/* Modifiers */				\
		_noSubsAllowed;								\
	case Launch:									\
		key literal longint = classid_Launch;		\
		cstring;	/* pathname */					\
		int;		/* Slate ResID */				\
		_noSubsAllowed;								\
	case Script:									\
		key literal longint = classid_Script;		\
		cstring;	/* script text */				\
		cstring;	/* target */					\
		_noSubsAllowed;								\
	case UIScript:									\
		key literal longint = classid_UIScript;		\
		cstring;	/* script text */				\
		cstring;	/* target */					\
		_noSubsAllowed;								\
	case OpenURL:									\
		key literal longint = classid_OpenURL;		\
		cstring;	/* URL */						\
		_noSubsAllowed;								\
	case UIWindow:									\
		key literal longint = classid_UIWindow;		\
		cstring;	/* script text */				\
		cstring;	/* target */					\
		_noSubsAllowed;								\
	case ClickMenu:									\
		key literal longint = classid_ClickMenu;	\
		cstring;	/* menu title */				\
		_noSubsAllowed;								\
	case Wait:										\
		key literal longint = classid_Wait;			\
		int;	/* tick count */					\
		_noSubsAllowed;								\
	case Subslate:									\
		key literal longint = classid_Subslate;		\
		cstring;	/* Slate name */				\
	case endSubslate:								\
		key literal longint = dir_EndEmbed;			\
		int = stag_Subslate;						\
	case Sequence:									\
		key literal longint = classid_Sequence;		\
	case endSequence:								\
		key literal longint = dir_EndEmbed;			\
		int = stag_Sequence;	

type restype_Slate {
	longint = version_Slate;
	int = $$CountOf(SlateItems);
	array SlateItems {
		switch {
			_GlobalDirectives;
			case Slate:
				key literal longint = classid_TopSlate;
				cstring;			// Slate name
				int = $$CountOf(SlateSubs);
				array SlateSubs {
					switch {
						_GlobalDirectives;
						_user_SlateSubs;
						case Event:
							key literal longint = classid_SlateEvent;
							byte = tag_NoExit;
							cstring;		/* trigger */
							cstring;		/* help text */
							_noSubsAllowed;
						case ExitEvent:
							key literal longint = classid_SlateEvent;
							byte = tag_Exit;
							cstring;		/* trigger */
							cstring;		/* help text */
							_noSubsAllowed;
						_Action;
					};
				};
		};
	};
};

type restype_ErrorInfo {
	longint;				// version
	int = $$CountOf(ErrorInfo);
	array ErrorInfo {
	longint;				// error code
DataLen:
		int = (DataEnd[$$ArrayIndex(ErrorInfo)] - DataLen[$$ArrayIndex(ErrorInfo)]) / 8;
		cstring;			// name of error code constant
		cstring;			// error string for error alert
		cstring;			// explanation for error alert
DataEnd:
		;
	};
};


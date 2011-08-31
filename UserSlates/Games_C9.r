// =================================================================================
//	Games.r						©2004-08 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

#define resid_Solitaire		resid_LaunchGamesSlate + 100		// used from CommonSlates_C9.r
	#define resid_solSpider		resid_Solitaire + 1				// used from CommonSlates_C9.r
	#define resid_solChoose		resid_Solitaire + 2
	#define resid_solLucy		resid_Solitaire + 3
#define resid_Yagol			resid_LaunchGamesSlate + 200
#define resid_GemDrop		resid_LaunchGamesSlate + 210
#define resid_BoXiCon		resid_LaunchGamesSlate + 220

#pragma mark LaunchGames
resource restype_Slate (resid_LaunchGamesSlate, "Launch Games Slate") { {
	Slate { "Games",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "Solitaire", "" },	Launch { Apps_"Games/sol.app", resid_Solitaire },
		Event { "Gem Drop", "" },	Launch { Apps_"Games/Super Gem Drop.app", resid_GemDrop },
		Event { "Boxes", "" },		Launch { Apps_"Games/MacBoXiKoN/BoXiKoN", resid_BoXiCon },
	 } }
} };	

#define	_SolitaireStandards_	\
	_SlateGlobals_,	\
	_IMouseSlate_,	\
	_CommandSlate_,	\
	_LaunchSlate_,	\
	_SlatesSlate_,	\
	_DirectionKeys_,	\
	Event { "Game", "" },			Subslate { "Game" },	\
		_SlateGlobals_,	\
		_IMouseSlate_,	\
		_CommandSlate_,	\
		_LaunchSlate_,	\
		_SlatesSlate_,	\
		_ReturnKey_,	\
		_CloseSubslate_,	\
		ExitEvent { "New", "" },		Sequence{},		\
			ClickMenu { "Game" },		\
			Keypress { kc_down, 0 },		\
			Keypress { kc_return, 0 },		\
			endSequence{},				\
		ExitEvent { "Number", "" },		Sequence{},		\
			ClickMenu { "Game" },		\
			Keypress { kc_down, 0 },		\
			Keypress { kc_down, 0 },		\
			Keypress { kc_down, 0 },		\
			Keypress { kc_return, 0 },		\
			endSequence{},				\
		Event { "Spider", "" },			ResSubslate { resid_solSpider },	\
		Event { "Lucy", "" },			ResSubslate { resid_solLucy },		\
		endSubslate{}

#pragma mark Solitaire
resource restype_Slate (resid_Solitaire, "Solitaire Slate") { {
	Slate { "Solitaire",	{
		_SolitaireStandards_,
		Event { "Choose Game", "" },	Sequence{},
			Keypress { kc_N, mf_command },
			Keypress { kc_space, 0 },
			ResSubslate { resid_solChoose },
			endSequence{},
	} }
} };

resource restype_Slate (resid_solChoose, "Solitaire Game") { {
	Slate { "Game",	{
		_SolitaireStandards_,
		_CloseSubslate_,
		Event { "Spider", "" },			Sequence{},
			TypeText { "Spider 4 Suit" },
			ResSubslate { resid_solSpider },
			endSequence{},
		Event { "Lucy", "" },			Sequence{},
			TypeText { "La Belle Lucie" },
			ResSubslate { resid_solLucy },
			endSequence{},
	} }
} };

#pragma mark Spider
#define _top	292
#define _left	70
#define _sph	60
#define _spv	15

//		_SolitaireStandards_,
resource restype_Slate (resid_solSpider, "Solitaire Spider") { {
	Slate { "Spider",	{
		_SlateGlobals_,
		_IMouseSlate_,
		_CommandSlate_,
		_LaunchSlate_,
		_SlatesSlate_,
		_DirectionKeys_,
		Event { "alpha", "" },		Click { 0, _left + 0*_sph, _top - _spv, _screen, _topLeft },
		Event { "bravo", "" },		Click { 0, _left + 1*_sph, _top - _spv, _screen, _topLeft },
		Event { "charlie", "" },	Click { 0, _left + 2*_sph, _top - _spv, _screen, _topLeft },
		Event { "david", "" },		Click { 0, _left + 3*_sph, _top - _spv, _screen, _topLeft },
		Event { "elwood", "" },		Click { 0, _left + 4*_sph, _top - _spv, _screen, _topLeft },
		Event { "fiddle", "" },		Click { 0, _left + 5*_sph, _top - _spv, _screen, _topLeft },
		Event { "golf", "" },		Click { 0, _left + 6*_sph, _top - _spv, _screen, _topLeft },
		Event { "hotel", "" },		Click { 0, _left + 7*_sph, _top - _spv, _screen, _topLeft },
		Event { "india", "" },		Click { 0, _left + 8*_sph, _top - _spv, _screen, _topLeft },
		Event { "juliet", "" },		Click { 0, _left + 9*_sph, _top - _spv, _screen, _topLeft },
		Event { "one", "" },		Click { 2, 0, 1*_spv, _cursor },
		Event { "two", "" },		Click { 2, 0, 2*_spv, _cursor },
		Event { "three", "" },		Click { 2, 0, 3*_spv, _cursor },
		Event { "four", "" },		Click { 2, 0, 4*_spv, _cursor },
		Event { "five", "" },		Click { 2, 0, 5*_spv, _cursor },
		Event { "six", "" },		Click { 2, 0, 6*_spv, _cursor },
		Event { "seven", "" },		Click { 2, 0, 7*_spv, _cursor },
		Event { "eight", "" },		Click { 2, 0, 8*_spv, _cursor },
		Event { "nine", "" },		Click { 2, 0, 9*_spv, _cursor },
		Event { "ten", "" },		Click { 2, 0, 10*_spv, _cursor },
		Event { "eleven", "" },		Click { 2, 0, 11*_spv, _cursor },
		Event { "twelve", "" },		Click { 2, 0, 12*_spv, _cursor },
		Event { "thirteen", "" },	Click { 2, 0, 13*_spv, _cursor },
		Event { "fourteen", "" },	Click { 2, 0, 14*_spv, _cursor },
		Event { "fifteen", "" },	Click { 2, 0, 15*_spv, _cursor },
		Event { "sixteen", "" },	Click { 2, 0, 16*_spv, _cursor },
		Event { "seventeen", "" },	Click { 2, 0, 17*_spv, _cursor },
		Event { "eighteen", "" },	Click { 2, 0, 18*_spv, _cursor },
		Event { "nineteen", "" },	Click { 2, 0, 19*_spv, _cursor },
		Event { "twenty", "" },		Click { 2, 0, 20*_spv, _cursor },
		Event { "twenty one", "" },	Click { 2, 0, 21*_spv, _cursor },
		Event { "twenty two", "" },	Click { 2, 0, 22*_spv, _cursor },
		Event { "twenty three", "" },	Click { 2, 0, 23*_spv, _cursor },
		Event { "twenty four", "" },	Click { 2, 0, 24*_spv, _cursor },
		Event { "twenty five", "" },	Click { 2, 0, 25*_spv, _cursor },
		Event { "undo", "" },		Keypress { kc_Z, mf_command },
		Event { "redo", "" },		Keypress { kc_Z, mf_command + mf_shift },
		Event { "return", "" },		Keypress { kc_return, 0 },
		Event { "flip", "" },		Click { 1, 85, 215, _screen, _topLeft },
	} }
} };

#pragma mark Lucy
resource restype_Slate (resid_solLucy, "Solitaire Lucy") { {
	Slate { "Lucy",	{
		_SolitaireStandards_,
		_CloseSubslate_,
	} }
} };

#pragma mark Yagol
#define _top	200
#define _left	160
#define _sph	32
#define _spv	32

resource restype_Slate (resid_Yagol, "Yagol Slate") { {
	Slate { "Yagol",	{
		_SlateGlobals_,
		_IMouseSlate_,
		_CommandSlate_,
		_LaunchSlate_,
		_SlatesSlate_,
		_DirectionKeys_,
		Event { "alpha", "" },		Click { 0, _left + 0*_sph, _top - _spv, _screen, _topLeft },
		Event { "bravo", "" },		Click { 0, _left + 1*_sph, _top - _spv, _screen, _topLeft },
		Event { "charlie", "" },	Click { 0, _left + 2*_sph, _top - _spv, _screen, _topLeft },
		Event { "david", "" },		Click { 0, _left + 3*_sph, _top - _spv, _screen, _topLeft },
		Event { "elwood", "" },		Click { 0, _left + 4*_sph, _top - _spv, _screen, _topLeft },
		Event { "fiddle", "" },		Click { 0, _left + 5*_sph, _top - _spv, _screen, _topLeft },
		Event { "golf", "" },		Click { 0, _left + 6*_sph, _top - _spv, _screen, _topLeft },
		Event { "hotel", "" },		Click { 0, _left + 7*_sph, _top - _spv, _screen, _topLeft },
		Event { "india", "" },		Click { 0, _left + 8*_sph, _top - _spv, _screen, _topLeft },
		Event { "one", "" },		Click { 1, 0, 1*_spv, _cursor },
		Event { "two", "" },		Click { 1, 0, 2*_spv, _cursor },
		Event { "three", "" },		Click { 1, 0, 3*_spv, _cursor },
		Event { "four", "" },		Click { 1, 0, 4*_spv, _cursor },
		Event { "five", "" },		Click { 1, 0, 5*_spv, _cursor },
		Event { "six", "" },		Click { 1, 0, 6*_spv, _cursor },
		Event { "seven", "" },		Click { 1, 0, 7*_spv, _cursor },
		Event { "eight", "" },		Click { 1, 0, 8*_spv, _cursor },
		Event { "nine", "" },		Click { 1, 0, 9*_spv, _cursor },
	} }
} };

#pragma mark Gem Drop
#define _top	745
#define _left	840
#define _sph	38
#define _spv	0

resource restype_Slate (resid_GemDrop, "GemDrop Slate") { {
	Slate { "GemDrop",	{
		_SlateGlobals_,
		_IMouseSlate_,
		_CommandSlate_,
		_LaunchSlate_,
		_SlatesSlate_,
		_DirectionKeys_,
		Event { "one", "" },		Click { 0, _left + 1*_sph, _top,  _screen, _topLeft },
		Event { "two", "" },		Click { 0, _left + 2*_sph, _top,  _screen, _topLeft },
		Event { "three", "" },		Click { 0, _left + 3*_sph, _top,  _screen, _topLeft },
		Event { "four", "" },		Click { 0, _left + 4*_sph, _top,  _screen, _topLeft },
		Event { "five", "" },		Click { 0, _left + 5*_sph, _top,  _screen, _topLeft },
		Event { "six", "" },		Click { 0, _left + 6*_sph, _top,  _screen, _topLeft },
		Event { "go faster", "" },	Subslate { "fast" },
			_CloseSubslate_,
			Event { "one", "" },		Sequence{},
				Click { 0, _left + 1*_sph, _top,  _screen, _topLeft },
				Click { 1, _left + 1*_sph, _top,  _screen, _topLeft },
				endSequence{},
			Event { "two", "" },		Sequence{},
				Click { 0, _left + 2*_sph, _top,  _screen, _topLeft },
				Click { 1, _left + 2*_sph, _top,  _screen, _topLeft },
				endSequence{},
			Event { "three", "" },		Sequence{},
				Click { 0, _left + 3*_sph, _top,  _screen, _topLeft },
				Click { 1, _left + 3*_sph, _top,  _screen, _topLeft },
				endSequence{},
			Event { "four", "" },		Sequence{},
				Click { 0, _left + 4*_sph, _top,  _screen, _topLeft },
				Click { 1, _left + 4*_sph, _top,  _screen, _topLeft },
				endSequence{},
			Event { "five", "" },		Sequence{},
				Click { 0, _left + 5*_sph, _top,  _screen, _topLeft },
				Click { 1, _left + 5*_sph, _top,  _screen, _topLeft },
				endSequence{},
			Event { "six", "" },		Sequence{},
				Click { 0, _left + 6*_sph, _top,  _screen, _topLeft },
				Click { 1, _left + 6*_sph, _top,  _screen, _topLeft },
				endSequence{},
			endSubslate{},
	} }
} };

#pragma mark BoXiCon
#define _top	60
#define _left	265
#define _sp		42
	
#define _wellh	295
#define _wellv	455
#define	_wellsp	70

resource restype_Slate (resid_BoXiCon, "BoXiCon Slate") { {
	Slate { "BoXiCon",	{
		_SlateGlobals_,
		_IMouseSlate_,
		_CommandSlate_,
		_LaunchSlate_,
		_SlatesSlate_,
		_DirectionKeys_,
		Event { "go", "" },				Click { 1, 0, 0, _cursor },
		Event { "play game", "" },		Sequence{},
			Click { 0, 300, 200, window, "1", _topLeft },
			Click { 1, 0, 0, _cursor },
			Click { 0, 300, 280, window, "1", _topLeft },
			endSequence{},
		Event { "high scores", "" },	Sequence{},
			Click { 0, 300, 250, window, "1", _topLeft },
			Click { 1, 0, 0, _cursor },
			Click { 0, 90, 465, window, "1", _topLeft },
			endSequence{},
		Event { "exit", "" },			Sequence{},
			Click { 0, 300, 430, window, "1", _topLeft },
			Click { 1, 0, 0, _cursor },
			endSequence{},
		Event { "end", "" },			Sequence{},
			Click { 0, 420, 445, window, "1", _topLeft },
			Click { 1, 0, 0, _cursor },
			endSequence{},
		Event { "undo", "" },			Keypress { kc_delete, 0 },
		Event { "left", "" },			Keypress { kc_left, 0 },
		Event { "right", "" },			Keypress { kc_right, 0 },
		Event { "return", "" },			Keypress { kc_return, 0 },
		Event { "up", "" },				Click { 0, 0, -_sp, _cursor },
		Event { "down", "" },			Click { 0, 0, _sp, _cursor },
		Event { "get one", "" },		Click { 1, _wellh + 0*_wellsp, _wellv, window, "1", _topLeft },
		Event { "get two", "" },		Click { 1, _wellh + 1*_wellsp, _wellv, window, "1", _topLeft },
		Event { "get three", "" },		Click { 1, _wellh + 2*_wellsp, _wellv, window, "1", _topLeft },
		Event { "get four", "" },		Click { 1, _wellh + 3*_wellsp, _wellv, window, "1", _topLeft },
		Event { "get five", "" },		Click { 1, _wellh + 4*_wellsp, _wellv, window, "1", _topLeft },
		Event { "halpha", "" },			Click { 0, _left + 0*_sp, _top, window, "1", _topLeft },
		Event { "bravo", "" },			Click { 0, _left + 1*_sp, _top, window, "1", _topLeft },
		Event { "charlie", "" },		Click { 0, _left + 2*_sp, _top, window, "1", _topLeft },
		Event { "david", "" },			Click { 0, _left + 3*_sp, _top, window, "1", _topLeft },
		Event { "elwood", "" },			Click { 0, _left + 4*_sp, _top, window, "1", _topLeft },
		Event { "fiddle", "" },			Click { 0, _left + 5*_sp, _top, window, "1", _topLeft },
		Event { "golf", "" },			Click { 0, _left + 6*_sp, _top, window, "1", _topLeft },
		Event { "hotel", "" },			Click { 0, _left + 7*_sp, _top, window, "1", _topLeft },
		Event { "india", "" },			Click { 0, _left + 8*_sp, _top, window, "1", _topLeft },
		Event { "one", "" },			Click { 0, 0, 0*_sp, _cursor },
		Event { "two", "" },			Click { 0, 0, 1*_sp, _cursor },
		Event { "three", "" },			Click { 0, 0, 2*_sp, _cursor },
		Event { "four", "" },			Click { 0, 0, 3*_sp, _cursor },
		Event { "five", "" },			Click { 0, 0, 4*_sp, _cursor },
		Event { "six", "" },			Click { 0, 0, 5*_sp, _cursor },
		Event { "seven", "" },			Click { 0, 0, 6*_sp, _cursor },
		Event { "eight", "" },			Click { 0, 0, 7*_sp, _cursor },
		Event { "nine", "" },			Click { 0, 0, 8*_sp, _cursor },
	} }
} };


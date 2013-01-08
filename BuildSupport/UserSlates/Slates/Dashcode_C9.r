// =================================================================================
//	Dashcode_C9.r					©2011 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"

//#define resid_CustomSlate			resid_Dashcode+1

#pragma mark Dashcode
resource restype_Slate (resid_Dashcode, "Dashcode Slate") { {
	Slate { "Dashcode",	{
		_SlateGlobals_,
		_DefaultBase_,
	 } }
} };

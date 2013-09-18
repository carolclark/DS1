// =================================================================================
//	Developer_C9.r					©2013 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "Developer_C9.h"

#pragma mark === Markers ===
// 1

#pragma mark Assert
resource restype_Slate (resid_Assert, "") { {
	Slate { "Assert",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "true", "" },			Sequence{}, TypeText { "STAssertTrue (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "fail", "" },			Sequence{}, TypeText { "STFail (<#msgFormat#>)" }, _previousField, endSequence{},
		ExitEvent { "equal objects", "" },	Sequence{}, TypeText { "STAssertEqualObjects (<#object_1#>, <#object_2#>, nil);" }, _previousField, _previousField, endSequence{},
		ExitEvent { "equal strings", "" },	Sequence{}, TypeText { "_AssertEqualStrings_(<#str1#>,<#str2#>)" }, _previousField, _previousField, endSequence{},
		ExitEvent { "equals", "" },			Sequence{}, TypeText { "STAssertEquals (<#value_1#>, <#value_2#>, nil);" }, _previousField, _previousField, endSequence{},
		ExitEvent { "equals with accuracy", "" }, Sequence{}, TypeText { "STAssertEqualsWithAccuracy (<#value_1#>, <#value_2#>, <#accuracy#>, nil);" }, _previousField, _previousField, _previousField, endSequence{},
		ExitEvent { "nil", "" },			Sequence{}, TypeText { "STAssertNil (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "not nil", "" },		Sequence{}, TypeText { "STAssertNotNil (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "true", "" },			Sequence{}, TypeText { "STAssertTrue (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "false", "" },			Sequence{}, TypeText { "STAssertFalse (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "throw", "" },			Sequence{}, TypeText { "STAssertThrows (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "no throw", "" },		Sequence{}, TypeText { "STAssertNoThrow (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "true no throw", "" },	Sequence{}, TypeText { "STAssertTrueNoThrow (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "false no throw", "" },	Sequence{}, TypeText { "STAssertFalseNoThrow (<#expression#>, nil);" }, _previousField, endSequence{},
		ExitEvent { "verify", "" },			TypeText { "STAssertTrue ([verifier verify], [verifier message]);" },
	} }
} };

#pragma mark 1 --- TypeSpecial
resource restype_Slate (resid_TypeSpecialDevSlate, "Type Special Developer Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "pragma mark", "" },				TypeText { "#pragma mark " },
		ExitEvent { "pragma unused", "" },				Sequence{}, TypeText { "#pragma unused()" }, _left, endSequence{},
		ExitEvent { "pragma heading", "" },				Sequence{}, TypeText { "#pragma mark <#digit#> === <#text#>" }, _previousField, _previousField, endSequence{},
		ExitEvent { "pragma subhead", "" },				Sequence{}, TypeText { "#pragma mark <#digit#> -- <#text#>" }, _previousField, _previousField, endSequence{},
		ExitEvent { "define", "" },						TypeText { "#define " },
		ExitEvent { "confidential", "" },				Sequence{}, TypeText { "//" }, Keypress { kc_tab, mf_option }, TypeText { "Confidential and Proprietary." }, _return, endSequence{},
		ExitEvent { "mark spot", "" },					TypeText { "<##>" },
		ExitEvent { "indent topic item", "" },			Sequence{}, Keypress { kc_left, mf_command }, Keypress { kc_tab, mf_option }, Keypress { kc_right, mf_command }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, Keypress { kc_fdelete, 0 }, Keypress { kc_1, 0 }, endSequence{},
		ExitEvent { "resource id", "" },				TypeText { "resid_" },
		ExitEvent { "in use development", "" },			TypeText { "in-use development" },
		ExitEvent { "web extension", "" },				TypeText { ".html" },
		ExitEvent { "korn extension", "" },				TypeText { ".ksh" },
		ExitEvent { "string literal", "" },				Sequence{}, TypeText { "@\"\"" }, Keypress { kc_left, 0 }, endSequence{},
		ExitEvent { "format", "" },						TypeText { "@\"%@\"" },
		ExitEvent { "localized", "" },					Sequence{}, TypeText { "NSLocalizedString(@\"<#string#>\", nil)<##>" }, _previousField, _previousField, endSequence{},
		ExitEvent { "not yet implemented", "" },		TypeText { "_NotYetImplemented_" },
		ExitEvent { "object", "" },						TypeText { "NSObject" },
		ExitEvent { "is equal to", "" },				TypeText { "isEqualTo" },
		ExitEvent { "string", "" },						TypeText { "NSString " },
		ExitEvent { "string with format", "" },			TypeText { "stringWithFormat" },
		ExitEvent { "is equal to string", "" },			TypeText { "isEqualToString" },
		ExitEvent { "integer", "" },					TypeText { "NSInteger " },
		ExitEvent { "error", "" },						TypeText { "NSError " },
		ExitEvent { "error with domain", "" },			TypeText { "errorWithDomain" },
		ExitEvent { "a ray", "" },						TypeText { "NSArray " },
		ExitEvent { "a ray with objects", "" },			TypeText { "arrayWithObjects" },
		ExitEvent { "dictionary", "" }, 				TypeText { "NSDictionary " },
		ExitEvent { "dictionary with objects", "" },	TypeText { "dictionaryWithObjects" },
		ExitEvent { "app delegate", "" },				TypeText { "[NSApp delegate]" },
		ExitEvent { "encoding", "" },					TypeText { "NSUTF8StringEncoding" },
		ExitEvent { "log standard", "" },				Sequence{}, TypeText { "NSLog(@\"%s#%d <##>\", __PRETTY_FUNCTION__, __LINE__, <##>);" }, _previousField, _previousField, endSequence{};
		ExitEvent { "log always", "" },					Sequence{}, TypeText { "_ALog_(@\"<#fmt#>\", <#args#>);" }, _previousField, _previousField, endSequence{},
		ExitEvent { "log debug", "" },					Sequence{}, TypeText { "_DLog_(@\"<#fmt#>\", <#args#>);" }, _previousField, _previousField, endSequence{},
		ExitEvent { "declare test", "" },				TypeText { "- (void)test" },
		Event { "error key", "" },		Subslate { "error key" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "localized description", "" },	TypeText { "NSLocalizedDescriptionKey" },
			Event { "reason", "" },					TypeText { "NSLocalizedFailureReasonErrorKey" },
			Event { "underlying error", "" },		TypeText { "NSUnderlyingErrorKey" },
			Event { "where", "" },					TypeText { "WhereErrorKey" },
			Event { "comma", "" },					Keypress { kc_comma, 0 },
			Event { "space", "" },					Keypress { kc_space, 0 },
			endSubslate{},
		ExitEvent { "Use Case", "" },		Subslate { "Use Case" },
			_SlateGlobals_,
			_CloseSubslate_,
			_UseCaseItems_,
			endSubslate{},
	} }
} };

#pragma mark Copyright
resource restype_Slate (resid_Copyright, "") { {
	Slate { "Copyright",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "code", "" },				Sequence{}, Keypress { kc_up, mf_command }, _down, _down, _down, _down, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "resource", "" },			Sequence{}, Keypress { kc_up, mf_command }, _down, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "markup", "" },				Sequence{}, Keypress { kc_down, mf_command }, _up, _up, _up, _up, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option },  Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
		ExitEvent { "shell", "" },				Sequence{}, Keypress { kc_up, mf_command }, _down, _down, _down, _down, _down, _down, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, Keypress { kc_right, mf_option }, endSequence{},
	} }
} };

#pragma mark ChooseUp
resource restype_Slate (resid_ChooseUp, "") { {
	Slate { "ChooseUp",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "one", "" }, 	_up,	\
		ExitEvent { "two", "" }, 	Sequence{}, _up, _up, endSequence{},	\
		ExitEvent { "three", "" },	Sequence{}, _up, _up, _up, endSequence{},	\
		ExitEvent { "four", "" }, 	Sequence{}, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "five", "" }, 	Sequence{}, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "six", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "seven", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "eight", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "nine", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "ten", "" }, 	Sequence{}, _up, _up, _up, _up, _up, _up,_up, _up, _up, _up, endSequence{},	\
		ExitEvent { "eleven", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "twelve", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
		ExitEvent { "thirteen", "" }, Sequence{}, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, _up, endSequence{},	\
	} }
} };

resource restype_Slate (resid_Package, "") { {
	Slate { "Package", {
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "Accessor", "" },		TypeText { "_AC" },
		ExitEvent { "Carbon", "" },			TypeText { "_C9" },
		ExitEvent { "Access Library", "" },	TypeText { "_AL" },
		ExitEvent { "Cocoa", "" },			TypeText { "NS" },
	} }
} };

#pragma mark 5 --- InsertSnippet
resource restype_Slate (resid_InsertSnippet, "") { {
	Slate { "snippet",	{
		_SlateGlobals_,
		ExitEvent { "exit", "" },						NilAction{},
		ExitEvent { "okay", "" },						_return,
		Event { "continue", "" },						_return,
		Event { "clipboard", "" },						Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, Keypress { kc_X, mf_command }, endSequence{},
		ExitEvent { "file header", "" },	 			TypeText { "fileHeader#" },
		ExitEvent { "window controller property", "" },	TypeText { "windowControllerProperty#" },
		ExitEvent { "dynamic property", "" },			TypeText { "dynamicProperty#" },
		ExitEvent { "accessor retain", "" },			TypeText { "accessorRetain#" },
		ExitEvent { "category accessors", "" },			TypeText { "categoryAccessors#" },
		ExitEvent { "relationship accessors", "" },		TypeText { "relationshipAccessors#" },
		ExitEvent { "file images sheet", "" },			TypeText { "fileImagesSheet#" },
		ExitEvent { "table view", "" },					TypeText { "tableView#" },
		ExitEvent { "init", "" },						TypeText { "init#" },
		ExitEvent { "constant", "" },					TypeText { "constant#" },
		Event { "property", "" },						TypeText { "property#" },
		Event { "attribute", "" },						Subslate { "attribute" },
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "read only", "" },						TypeText { "readonly, " },
			ExitEvent { "strong", "" },						TypeText { "strong" },
			ExitEvent { "weak", "" },						TypeText { "weak" },
			ExitEvent { "retain", "" },						TypeText { "retain" },
			ExitEvent { "assign", "" },						TypeText { "assign" },
			ExitEvent { "copy", "" },						TypeText { "copy" },
			endSubslate{},
		Event { "project", "" },						Subslate { "project" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "Support", "" },					TypeText { "Support" },
			ExitEvent { "Accessor", "" },					TypeText { "Accessor" },
			ExitEvent { "Punkin", "" },						TypeText { "Punkin" },
			endSubslate{},
		Event { "user slate", "" },						TypeText { "userSlate#" },
		ExitEvent { "heading with name", "" },			TypeText { "headingWithName#" },
		ExitEvent { "heading with topics", "" },		TypeText { "headingWithTopics#" },
		Event { "developer link", "" },					TypeText { "developerLink#" },
		ExitEvent { "developer item", "" },				TypeText { "developerItem#" },
		ExitEvent { "glossary item", "" },				TypeText { "glossaryItem#" },
		Event { "use case", "" },						Sequence{}, TypeText { "useCase#" }, ResSubslate { resid_ucActor }, endSequence{},
		Event { "use case link", "" },					Sequence{}, TypeText { "useCaseLink#" }, endSequence{},
		Event { "level", "" },							ResSubslate { resid_ucLevel },
	} }
} };

#pragma mark ucLevel
resource restype_Slate (resid_ucLevel, "") { {
	Slate { "goal level",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "high", "" },			Sequence{}, _previousField, _previousField, _previousField, _previousField, TypeText { "High Summary" }, endSequence{},
		ExitEvent { "summary", "" },		Sequence{}, _previousField, _previousField, _previousField, _previousField, TypeText { "Summary" }, endSequence{},
		ExitEvent { "user", "" },			Sequence{}, _previousField, _previousField, _previousField, _previousField, TypeText { "User Goal" }, endSequence{},
		ExitEvent { "function", "" },		Sequence{}, _previousField, _previousField, _previousField, _previousField, TypeText { "Subfunction" }, endSequence{},
		ExitEvent { "low", "" },			Sequence{}, _previousField, _previousField, _previousField, _previousField, TypeText { "Low" }, endSequence{},
	} }
} };

#pragma mark ucActor
resource restype_Slate (resid_ucActor, "") { {
	Slate { "ucActor",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "continue", "" },			_return,
		Event { "Product", "" },			TypeText { "Product" },
		Event { "Developer", "" },			TypeText { "Developer" },
		Event { "Activity", "" },			TypeText { "Activity" },
		Event { "Word", "" },				TypeText { "Word" },
		Event { "Picture", "" },			TypeText { "Picture" },
		Event { "Image", "" },				TypeText { "Image" },
		Event { "Layer", "" },				TypeText { "Layer" },
	} }
} };

#pragma mark 6 --- InsertElement
resource restype_Slate (resid_InsertElement, "") { {
	Slate { "Element",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "marker", "" },					Sequence{}, TypeText { "<!-- @marker \"p\" -->" }, _return, _up, _nextField, endSequence{},
		ExitEvent { "topic item", "" },				Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"<#linkDestination#>\" \"<#indent0-3#>\" \"<#[description]#>\" -->" }, _up, _nextField, endSequence{},
		ExitEvent { "topic Group", "" },	Sequence{},
			TypeText { "<!-- @topicGroup \"<#title#>\" \"<#linenum#>\" -->" }, _previousField, _previousField, endSequence{},
		ExitEvent { "topic Separator", "" },	TypeText { "<!-- @topicSep -->" },
		ExitEvent { "goal", "" },		Sequence{}, TypeText { "<tr> <td><#Project#></td> <td><#goal#></td> <td class='small'><#comments#></td> <td align=\"center\"><#priority#></td> </tr>" }, _previousField,  _previousField, _previousField, _previousField, endSequence{},
		ExitEvent { "heading with topics", "" },		Sequence{},
			TypeText { "<#=== -> topicList [1]#>" }, _indentBack, _return,
			TypeText { "<!-- @topicItem \"<#title#>\" \"#<#name#>\" \"0\" \"\" -->" }, _return,
			TypeText { "<!-- @marker \"<#title#>\" -->" }, _indentBack, _return,
			TypeText { "<h<#level#>><#title#></h<#level#>><##>" }, _indentBack, _return,
			TypeText { "<!-- @topicList \"<#title#>\" \"<#name#>\" -->" }, _indentBack, _return,
			TypeText { "<!-- @/topicList --><##>" }, _indentBack, _return,
			_indentBack, _nextField, endSequence{},
		ExitEvent { "bug or issue", "" },	Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"#BI_<#abbreviatedDate#>-01\" \"0\" \"[BI_<#abbreviatedDate#>-01]\" -->" }, _indent, _return,
			TypeText { "<h5 id='BI_<#abbreviatedDate#>-01'>__title__ [BI_<#abbreviatedDate#>-01] new</h5>" }, _return,
			endSequence{},
		ExitEvent { "current tag", "" },	Sequence{},	TypeText { "<li class='tlmark'>&lt;--</li>" }, _previousField, endSequence{},
		ExitEvent { "date mark", "" },		Sequence{},	TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previousField, endSequence{},
		ExitEvent { "date list", "" },		Sequence{}, TypeText { "<li class='tldate'>[<#date#>]</li>" }, _previousField, endSequence{},
		ExitEvent { "date paragraph", "" },	Sequence{}, TypeText { "<p class='tldate'>[<#date#>]</p>" }, _previousField, endSequence{},
		ExitEvent { "version marker", "" },	Sequence{}, TypeText { "<p class='tlversion'>[v<#version#> <#milestone#>]</p>" }, _previousField, _previousField, endSequence{},
		ExitEvent { "unix selection", "" }, TypeText { "%%%{PBXSelection}%%%" },
		ExitEvent { "ampersand", "" }, 		TypeText { "&amp;" },
		ExitEvent { "less than", "" }, 		TypeText { "&lt;" },
		ExitEvent { "greater than", "" }, 	TypeText { "&gt;" },
		ExitEvent { "angle brackets", "" },	Sequence{}, TypeText { "&lt;&gt;<##> " }, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "hard space", "" }, 	TypeText { "&nbsp;" },
		ExitEvent { "arrow left", "" }, 	TypeText { "&larr;" },
		ExitEvent { "arrow right", "" },	TypeText { "&rarr;" },
		ExitEvent { "arrow up", "" }, 		TypeText { "&uarr;" },
		ExitEvent { "arrow down", "" },		TypeText { "&darr;" },
		ExitEvent { "check mark", "" }, 	TypeText { "&radic;" },
		ExitEvent { "bullet", "" }, 		TypeText { "&bull;" },
		ExitEvent { "diamond", "" }, 		TypeText { "&loz;" },
	} }
} };

#pragma mark Styles
resource restype_Slate (resid_InsertStyle, "css Styles") { {
	Slate { "Style",	{
		_SlateGlobals_,
		ExitEvent { "not yet implemented", "" }, Sequence{}, TypeText { " class='nyi'" }, _right, endSequence{},
		ExitEvent { "not yet", "" }, Sequence{}, TypeText { " class='nyi'" }, _right, endSequence{},
		ExitEvent { "design question", "" }, Sequence{}, TypeText { " class='dq'" }, _right, endSequence{},
		ExitEvent { "deprecated", "" }, Sequence{}, TypeText { " class='depr'" }, _right, endSequence{},
		ExitEvent { "expand", "" }, Sequence{}, TypeText { " class='expand'" }, _right, endSequence{},
		ExitEvent { "code", "" }, Sequence{}, TypeText { " class='cod'" }, _right, endSequence{},
		ExitEvent { "emphasize", "" }, Sequence{}, TypeText { " class='em'" }, _right, endSequence{},
		ExitEvent { "italic", "" }, Sequence{}, TypeText { " class='ital'" }, _right, endSequence{},
		ExitEvent { "blurb", "" }, Sequence{}, TypeText { " class='blurb'" }, _right, endSequence{},
		ExitEvent { "small", "" }, Sequence{}, TypeText { " class='small'" }, _right, endSequence{},
		ExitEvent { "center", "" }, Sequence{}, TypeText { " class='center'" }, _right, endSequence{},
		ExitEvent { "mono", "" }, Sequence{}, TypeText { " class='mono'" }, _right, endSequence{},
		ExitEvent { "technical", "" }, Sequence{}, TypeText { " class='tech'" }, _right, endSequence{},
		ExitEvent { "remove", "" }, Sequence{}, TypeText { " class='remove'" }, _right, endSequence{},
		ExitEvent { "future", "" }, Sequence{}, TypeText { " class='future'" }, _right, endSequence{},
		ExitEvent { "subitems", "" }, Sequence{}, TypeText { " class='subitems'" }, _right, endSequence{},
		ExitEvent { "glossary", "" }, Sequence{}, TypeText { " class='glossary'" }, _right, endSequence{},
		ExitEvent { "pseudo link", "" }, Sequence{}, TypeText { " class='pslink'" }, _right, endSequence{},
		ExitEvent { "implement", "" }, Sequence{}, TypeText { " class='impl'" }, _right, endSequence{},
		ExitEvent { "done", "" }, Sequence{}, TypeText { " class='done'" }, _right, endSequence{},
		ExitEvent { "todo", "" }, Sequence{}, TypeText { " class='todo'" }, _right, endSequence{},
		ExitEvent { "target", "" },	Sequence{}, TypeText { " class='tltarget'" }, _right, endSequence{},
	} }
} };

resource restype_Slate (resid_InsertTag, "HTML tag") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_DirectionKeys_,
		ExitEvent { "comment", "" }, Sequence{}, TypeText { "<!--  -->" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "break", "" }, TypeText { "<br />" },
		ExitEvent { "boldface", "" }, Sequence{}, TypeText { "<b></b>" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "italic", "" }, Sequence{}, TypeText { "<i></i>" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "paragraph", "" }, Sequence{}, TypeText { "<p></p>" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "code", "" }, Sequence{}, TypeText { "<code></code>" }, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "emphasize", "" }, Sequence{}, TypeText { "<em></em>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "plain list", "" }, Sequence{}, TypeText { "<ul></ul>" }, _left, _left, _left, _left, _left, Keypress { kc_return, 0 }, Keypress { kc_return, 0 }, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "ordered list", "" }, Sequence{}, TypeText { "<ol></ol>" }, _left, _left, _left, _left, _left, Keypress { kc_return, 0 }, Keypress { kc_return, 0 }, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "list item", "" }, Sequence{}, TypeText { "<li></li>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "plain line", "" }, Sequence{}, TypeText { "<hr>" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "wide line", "" }, Sequence{}, TypeText { "<hr size=\"4\" noshade>" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "anchor", "" }, Sequence{}, TypeText { "<a></a>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "table row", "", },  Sequence{}, TypeText { "<tr> ￼</tr>" }, _previousField, endSequence{},
		ExitEvent { "table data", "", },  Sequence{}, TypeText { "<td>￼</td> " }, _previousField, endSequence{},
		ExitEvent { "centered data", "", },  Sequence{}, TypeText { "<td align='center'>￼</td> " }, _previousField, endSequence{},
		ExitEvent { "table column header", "", },  Sequence{}, TypeText { "<th></th> " }, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "dictionary list", "", },  Sequence{}, TypeText { "<dl></dl>" }, _left, _left, _left, _left, _left, _return, _return, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "dictionary item", "", },  Sequence{}, TypeText { "<dt>￼</dt><dd>￼</dd>" }, Keypress { kc_left, mf_command }, _previousField, endSequence{},
		ExitEvent { "style", "", },  Sequence{}, TypeText { "<style type=\"text/css\">" }, Keypress { kc_return, 0 }, TypeText { "</style>" }, Keypress { kc_return, 0 }, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "span", "", },  Sequence{}, TypeText { "<span></span>" }, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "division", "", },  Sequence{}, TypeText { "<div></div>" }, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "link", "" }, Sequence{}, TypeText { "<a href=\"￼\">￼</a>" }, _previousField, endSequence{},
		ExitEvent { "identifier", "" }, Sequence{}, _left, TypeText { " id=''" }, _left, endSequence{},
		ExitEvent { "glossary link", "" }, Sequence{}, TypeText { "<a class='glosslink' href=\"￼_gloss.html#def_￼\">￼</a>" }, _previousField, _previousField, _previousField, endSequence{},
		ExitEvent { "refactor link", "" }, Sequence{}, TypeText { "<a href=\"../Support/DevelopingProjects.html#￼\">￼</a>" }, _previousField, endSequence{},
		ExitEvent { "name", "" }, Sequence{}, TypeText { "<a name=''>￼</a>" }, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "monospace", "" }, Sequence{}, TypeText { "<p class='mono'></p>" }, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "block quote", "" }, Sequence{}, TypeText { "<blockquote></blockquote>" }, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "line tag", "" }, Sequence{}, TypeText { "<span class='linetag'></span>" }, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "header one", "" }, Sequence{}, TypeText { "<h1></h1>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "header two", "" }, Sequence{}, TypeText { "<h2></h2>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "header three", "" }, Sequence{}, TypeText { "<h3></h3>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "header four", "" }, Sequence{}, TypeText { "<h4></h4>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "header five", "" }, Sequence{}, TypeText { "<h5></h5>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "header six", "" }, Sequence{}, TypeText { "<h6></h6>" }, _left, _left, _left, _left, _left, endSequence{},
	} }
} };

#pragma mark 7 --- UserSlate
resource restype_Slate (resid_InsertSlateText, "Slate text") { {
	Slate { "UserSlate",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "define", "" },				Sequence{}, TypeText { "#define" }, Keypress { kc_tab, mf_option }, endSequence{},
		ExitEvent { "exit event", "" },			TypeText { "ExitEvent { \"" },
		ExitEvent { "event", "" },				TypeText { "Event { \"" },
		ExitEvent { "plain event", "" },		TypeText { "Event { \"" },
		ExitEvent { "end event", "" },			Sequence{}, TypeText { "\", \"\" }," }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, endSequence{},
		ExitEvent { "sequence", "" },			Sequence{}, TypeText { "Sequence{}, <##>endSequence{}," }, _previousField, endSequence{},
		ExitEvent { "subslate", "" },			Sequence{}, TypeText { "Subslate { \"<##>\" }," }, _return, _tab, TypeText { "_SlateGlobals_," }, _return, TypeText { "_CloseSubslate_," }, _return, TypeText { "<##>" }, _return, TypeText { "endSubslate{}," }, _previousField, _previousField, endSequence{},
		ExitEvent { "indent subslate", "" },	Sequence{}, _indent, _down, _indent, _indent, _down, _indent, _indent, _down, _indent, endSequence{},
		ExitEvent { "type text", "" },			Sequence{}, TypeText { "TypeText { \"<##>\" }," }, _previousField, endSequence{},
		ExitEvent { "resource subslate", "" },	Sequence{}, TypeText { "ResSubslate { <##> }, " }, _previousField, endSequence{},
		ExitEvent { "click menu", "" },			Sequence{}, TypeText { "ClickMenu { \"<##>\" }, " }, _previousField, endSequence{},
		ExitEvent { "launch", "" },				Sequence{}, TypeText { "Launch { \"<#path#>\", <#slate#> }, " }, _previousField, _previousField, endSequence{},
		ExitEvent { "script", "" },				Sequence{}, TypeText { "Script { \"<#script#>\", \"<#target#>\" }," }, _previousField, _previousField, endSequence{},
		ExitEvent { "interface script", "" },	Sequence{}, TypeText { "UIScript { \"<#script#>\", \"<#target#>\" }," }, _previousField, _previousField, endSequence{},
		ExitEvent { "wait", "" },				Sequence{}, TypeText { "Wait { <##> }, " }, _previousField, endSequence{},
		ExitEvent { "open site", "" },			Sequence{}, TypeText { "OpenURL { \"<##>\" }," }, _previousField, endSequence{},
		ExitEvent { "nil action", "" },			TypeText { "NilAction{}" },
		ExitEvent { "close subslate", "" },		TypeText { "CloseSubslate{}," },
		Event { "keypress", "" },				Sequence{}, TypeText { "Keypress { kc_<##>, <##> }," }, _previousField, _previousField, endSequence{},
			ExitEvent { "key return", "" },			TypeText { "return" },
			ExitEvent { "key space", "" },			TypeText { "space" },
			ExitEvent { "key enter", "" },			TypeText { "enter" },
			ExitEvent { "key delete", "" },			TypeText { "delete" },
			ExitEvent { "key forward delete", "" },	TypeText { "fdelete" },
			ExitEvent { "key tab", "" },			TypeText { "tab" },
			ExitEvent { "key escape", "" },			TypeText { "escape" },
			ExitEvent { "key left", "" },			TypeText { "left" },
			ExitEvent { "key right", "" },			TypeText { "right" },
			ExitEvent { "key up", "" },				TypeText { "up" },
			ExitEvent { "key down", "" },			TypeText { "down" },
			ExitEvent { "key comma", "" },			TypeText { "comma" },
			ExitEvent { "key period", "" },			TypeText { "period" },
			ExitEvent { "key backslash", "" },		TypeText { "backslash" },
			ExitEvent { "modify command", "" },		TypeText { "mf_command" },
			ExitEvent { "modify shift", "" },		TypeText { "mf_shift" },
			ExitEvent { "modify capslock", "" },	TypeText { "mf_capslock" },
			ExitEvent { "modify option", "" },		TypeText { "mf_option" },
			ExitEvent { "modify control", "" },		TypeText { "mf_control" },
		ExitEvent { "click", "" },				Sequence{}, TypeText { "Click { <#count#>, <#h#>, <#v#>, <#position#> }," }, _previousField, _previousField, _previousField, _previousField, endSequence{},
		ExitEvent { "click modified", "" },		Sequence{}, TypeText { "ClickMod { <#count#>, <#h#>, <#v#>, <#position#>, <#modifiers#> }," }, _previousField, _previousField, _previousField, _previousField, _previousField, endSequence{},
			Event { "window", "" },					Sequence{}, TypeText { "_window, <#corner#>" }, _previousField, endSequence{},
			Event { "screen", "" },					Sequence{}, TypeText { "_screen, <#corner#>" }, _previousField, endSequence{},
			ExitEvent { "cursor", "" },				TypeText { "_cursor" },
			ExitEvent { "top left", "" },			TypeText { "_topLeft" },
			ExitEvent { "top center", "" },			TypeText { "_topCenter" },
			ExitEvent { "top right", "" },			TypeText { "_topRight" },
			ExitEvent { "bottom right", "" },		TypeText { "_bottomRight" },
			ExitEvent { "bottom center", "" },		TypeText { "_bottomCenter" },
			ExitEvent { "bottom left", "" },		TypeText { "_bottomLeft" },
			ExitEvent { "center right", "" },		TypeText { "_centerRight" },
			ExitEvent { "center center", "" },		TypeText { "_centerCenter" },
			ExitEvent { "center left", "" },		TypeText { "_centerLeft" },
		ExitEvent { "slate", "" },				Sequence{},
			TypeText { "#define resid_<##>" }, Keypress { kc_tab, mf_option }, TypeText { "<#relative_resid#>+<##>" }, _return,
			TypeText { "Event { \"<##>\", \"\" }," }, Keypress { kc_tab, mf_option }, Keypress { kc_tab, mf_option }, TypeText { "ResSubslate { resid_<##> }," }, _return,
			Keypress { kc_3, mf_shift }, TypeText { "pragma mark <##>" }, _return,
			TypeText { "resource restype_Slate (resid_<##>, \"\") { {" }, _return,
			TypeText { "Slate { \"<##>\"," }, Keypress { kc_tab, mf_option }, TypeText { "{" }, _return,
			TypeText { "_SlateGlobals_," }, _return,
			TypeText { "_CloseSubslate_," }, _return,
			TypeText { "<##>" }, _return,
			TypeText { "} }" }, _return,
			TypeText { "} };" }, _return,
			_previousField, _previousField, _previousField, _previousField, _previousField, _previousField, _previousField, _previousField, _previousField,
			endSequence{},
		Event { "macro", "" },					Subslate { "macro" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "define", "" },				Sequence{}, TypeText { "#define" }, _tab, endSequence{},
			ExitEvent { "mark", "" },				Sequence{}, Keypress { kc_3, mf_shift }, TypeText { "pragma mark <##>" }, _return, _previousField, endSequence{},
			ExitEvent { "mark spot", "" },			TypeText { "<##>, " },
			ExitEvent { "return", "" },				TypeText { "_return, " },
			ExitEvent { "tab", "" },				TypeText { "_tab, " },
			ExitEvent { "next field", "" },			TypeText { "_nextField, " },
			ExitEvent { "previous field", "" },		TypeText { "_previousField, " },
			ExitEvent { "up", "" },					TypeText { "_up, " },
			ExitEvent { "down", "" },				TypeText { "_down, " },
			ExitEvent { "left", "" },				TypeText { "_left, " },
			ExitEvent { "right", "" },				TypeText { "_right, " },
			Event { "Slate Globals", "" },			Sequence{}, TypeText { "_SlateGlobals_," }, _return, endSequence{},
			Event { "Close Subslate", "" },			Sequence{}, TypeText { "_CloseSubslate_," }, _return, endSequence{},
			Event { "Jump Down Subslate", "" },		Sequence{}, TypeText { "_JumpDownSubslate_," }, _return, endSequence{},
			Event { "Jump North Subslate", "" },	Sequence{}, TypeText { "_JumpNorthSubslate_," }, _return, endSequence{},
			Event { "Jump Left Subslate", "" },		Sequence{}, TypeText { "_JumpLeftSubslate_," }, _return, endSequence{},
			Event { "Jump Right Subslate", "" },	Sequence{}, TypeText { "_JumpRightSubslate_," }, _return, endSequence{},
			Event { "Do Jump Subslate", "" },		Sequence{}, TypeText { "_DoJumpSubslate_," }, _return, endSequence{},
			Event { "Direction Keys", "" },			Sequence{}, TypeText { "_DirectionKeys_," }, _return, endSequence{},
			Event { "Letter Keys", "" },			Sequence{}, TypeText { "_LetterKeys_," }, _return, endSequence{},
			Event { "Number Keys", "" },			Sequence{}, TypeText { "_NumberKeys_," }, _return, endSequence{},
			Event { "Whitespace Keys", "" },		Sequence{}, TypeText { "_WhitespaceKeys_," }, _return, endSequence{},
			Event { "Page Keys", "" },				Sequence{}, TypeText { "_PageKeys_," }, _return, endSequence{},
			Event { "Click One", "" },				Sequence{}, TypeText { "_ClickOne_," }, _return, endSequence{},
			Event { "Mouse Slate", "" },			Sequence{}, TypeText { "_IMouseSlate_," }, _return, endSequence{},
			Event { "Full Access Slate", "" },		Sequence{}, TypeText { "_FullAccessSlate_," }, _return, endSequence{},
			Event { "Command Slate", "" },			Sequence{}, TypeText { "_CommandSlate_," }, _return, endSequence{},
			endSubslate{},
	} }
} };

#pragma mark Unix
#define _where_	"\"$0#$LINENO:\""
resource restype_Slate (resid_Unix, "") { {
	Slate { "Unix",	{
			_SlateGlobals_,
			_CloseSubslate_,
			Event { "clipboard", "" },					Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, Keypress { kc_X, mf_command }, endSequence{},
			ExitEvent { "shebang", "" },				Sequence{}, TypeText { "#! /bin/ksh" }, _return, _return, endSequence{},
			ExitEvent { "variable", "" },				Sequence{}, TypeText { "\"${<##>}\"<##>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "plain variable", "" },			Sequence{}, TypeText { "${<##>}<##>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "enclose variable", "" },		Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, Keypress { kc_X, mf_command }, TypeText { "\"${" }, Keypress { kc_V, mf_command }, TypeText { "}\"" },endSequence{},
			ExitEvent { "enclose plain variable", "" },	Sequence{}, Keypress { kc_left, mf_option }, Keypress { kc_right, mf_option + mf_shift }, Keypress { kc_X, mf_command }, TypeText { "${" }, Keypress { kc_V, mf_command }, TypeText { "}" },endSequence{},
			ExitEvent { "condition", "" },				Sequence{}, TypeText { "[[ <#condition#> ]] <*##>" }, _previousField, endSequence{},
			ExitEvent { "logical or", "" },				TypeText { "|| " },
			ExitEvent { "logical and", "" },			TypeText { "&& " },
			ExitEvent { "command", "" },				Sequence{},	TypeText { "\"$(<##>)\"<##>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "plain command", "" },			Sequence{},	TypeText { "$(<##>)<##>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "if block", "" },		Sequence{}, TypeText { "if [[ <##> ]] ; then" },
				_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },
				_previousField, _previousField, endSequence{},
			ExitEvent { "case block", "" },		Sequence{}, TypeText { "case \"${<#varname#>}\" in" },
				_return, _tab, TypeText { "<#item#> )" }, _return, _tab, TypeText { "<#block#>" }, _return,
				TypeText { ";;" }, 	_return, _delete, TypeText { "* )" }, _return, _delete, TypeText { "esac" },
				_previousField, _previousField, _previousField, endSequence{},
			ExitEvent { "check status", "" },		Sequence{},
				TypeText { "if [[ \"${?}\" > 0 ]] ; then" },
				_return, _tab, TypeText { "<##>" }, _return, _delete, TypeText { "fi" },
				_previousField, _previousField, endSequence{},
			ExitEvent { "where", "" },				TypeText { _where_ },
			ExitEvent { "error exit", "" },			Sequence{}, TypeText { "errorExit $?<##> "_where_" \"<#msg#>\"" }, _previousField, _previousField, endSequence{},
			ExitEvent { "error message", "" },		Sequence{}, TypeText { "errorMessage $<##> "_where_" \"<#msg#>\"" }, _previousField, _previousField, endSequence{},
			ExitEvent { "function", "" },			TypeText { "gFunction#" },
			ExitEvent { "test", "" },				TypeText { "unixTest#" },
			ExitEvent { "test function", "" },		TypeText { "unixTestFunction#" },
			ExitEvent { "assert equal", "" },		Sequence{}, TypeText { "assertEquals "_where_" <#expected#> <#actual#>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "assert not equal", "" },	Sequence{}, TypeText { "assertNotEquals "_where_" <#unexpected#> <#actual#>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "assert null", "" },		Sequence{}, TypeText { "assertNull "_where_" <#value#>" }, _previousField, endSequence{},
			ExitEvent { "assert not null", "" },	Sequence{}, TypeText { "assertNotNull "_where_" <#value#>" }, _previousField, endSequence{},
			ExitEvent { "assert true", "" },		Sequence{}, TypeText { "assertTrue "_where_" <#condition#>" }, _previousField, endSequence{},
			ExitEvent { "assert false", "" },		Sequence{}, TypeText { "assertFalse "_where_" <#condition#>" }, _previousField, endSequence{},
			ExitEvent { "assert failure", "" },		TypeText { "fail "_where_"" },
	} }
} };

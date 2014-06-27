// =================================================================================
//	Developer_C9.r				(c) 2013-14 C & C Software, Inc. All rights reserved.
// =================================================================================

#include "AccessLibTypes.r"
#include "CommonSlates_C9.h"
#include "Developer_C9.h"

#pragma mark === Markers ===
// 1 Type Special; Copyright; Package; ChooseUp; 3 HTML: Tag; Style; Element(Markup); 4 UserSlate; 5 Cocoa; 7 Python; 8 Unix

#pragma mark 1 === TypeSpecial
resource restype_Slate (resid_TypeSpecialDevSlate, "Type Special Developer Slate") { {
	Slate { "Special",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_TypeSpecialBaseItems_,
		ExitEvent { "mark", "" },						TypeText { "#pragma mark " },
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
		ExitEvent { "install target", "" },			Subslate { "installTarget" },
			_SlateGlobals_,
			_CloseSubslate_,
			ExitEvent { "build tool", "" },			TypeText { "${TARGET_NAME}/${TARGET_NAME}_install.ksh" },
			ExitEvent { "arguments", "" },				TypeText { "\"${SRCROOT}\" ${TARGET_NAME} $(ACTION)" },
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

#pragma mark Package
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

#pragma mark 3 === HTML
// inside: 1 Tag; 2 Style; 3 Element

#pragma mark 1 --- Tag
resource restype_Slate (resid_InsertTag, "HTML tag") { {
	Slate { "tag",	{
		_SlateGlobals_,
		_CloseSubslate_,
		_DirectionKeys_,
		ExitEvent { "comment", "" }, Sequence{}, TypeText { "<!--  -->" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "break", "" }, TypeText { "<br />" },
		ExitEvent { "boldface", "" }, Sequence{}, TypeText { "<b></b>" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "italic", "" }, Sequence{}, TypeText { "<i></i>" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "paragraph", "" }, Sequence{}, TypeText { "<p></p>" }, _left, _left, _left, _left, endSequence{},
		ExitEvent { "code", "" }, Sequence{}, TypeText { "<code></code>" }, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "emphasize", "" }, Sequence{}, TypeText { "<em></em>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "preformat", "" }, Sequence{}, TypeText { "<pre></pre>" }, _left, _left, _left, _left, _left, _left, Keypress { kc_return, 0 }, Keypress { kc_return, 0 }, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "plain list", "" }, Sequence{}, TypeText { "<ul></ul>" }, _left, _left, _left, _left, _left, Keypress { kc_return, 0 }, Keypress { kc_return, 0 }, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "ordered list", "" }, Sequence{}, TypeText { "<ol></ol>" }, _left, _left, _left, _left, _left, Keypress { kc_return, 0 }, Keypress { kc_return, 0 }, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "list item", "" }, Sequence{}, TypeText { "<li></li>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "plain line", "" }, Sequence{}, TypeText { "<hr>" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "wide line", "" }, Sequence{}, TypeText { "<hr size=\"4\" noshade>" }, Keypress { kc_return, 0 }, endSequence{},
		ExitEvent { "anchor", "" }, Sequence{}, TypeText { "<a></a>" }, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "table row", "", },  Sequence{}, TypeText { "<tr><#content#></tr>" }, _previousField, endSequence{},
		ExitEvent { "table data", "", },  Sequence{}, TypeText { "<td><#content#></td> " }, _previousField, endSequence{},
		ExitEvent { "centered data", "", },  Sequence{}, TypeText { "<td align='center'><#content#></td> " }, _previousField, endSequence{},
		ExitEvent { "table column header", "", },  Sequence{}, TypeText { "<th></th> " }, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "dictionary list", "", },  Sequence{}, TypeText { "<dl></dl>" }, _left, _left, _left, _left, _left, _return, _return, Keypress { kc_up, 0 }, Keypress { kc_tab, 0 }, endSequence{},
		ExitEvent { "dictionary item", "", },  Sequence{}, TypeText { "<dt><#title#></dt><dd><#content#></dd>" }, Keypress { kc_left, mf_command }, _previousField, endSequence{},
		ExitEvent { "style", "", },  Sequence{}, TypeText { "<style type=\"text/css\">" }, Keypress { kc_return, 0 }, TypeText { "</style>" }, Keypress { kc_return, 0 }, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "span", "", },  Sequence{}, TypeText { "<span></span>" }, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "division", "", },  Sequence{}, TypeText { "<div></div>" }, _left, _left, _left, _left, _left, _left, _left, endSequence{},
		ExitEvent { "link", "" }, Sequence{}, TypeText { "<a href=\"<#linkTo#>\"><#text#></a>" }, _previousField, endSequence{},
		ExitEvent { "identifier", "" }, Sequence{}, _left, TypeText { " id=''" }, _left, endSequence{},
		ExitEvent { "glossary link", "" }, Sequence{}, TypeText { "<a class='glosslink' href=\"<glossaryName#>_gloss.html#def_<#term#>\"><<#content#></a>" }, _previousField, _previousField, _previousField, endSequence{},
		ExitEvent { "refactor link", "" }, Sequence{}, TypeText { "<a href=\"../Support/XcodeDevelopment.html#<#linkName#>\"><#content#></a>" }, _previousField, endSequence{},
		ExitEvent { "name", "" }, Sequence{}, TypeText { "<a name=''><#text#></a>" }, _left, _left, _left, _left, _left, _left, _left, _left, _left, _left, endSequence{},
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

#pragma mark 2 --- Styles
resource restype_Slate (resid_InsertStyle, "css Styles") { {
	Slate { "Style",	{
		_SlateGlobals_,
		_CloseSubslate_,
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
		ExitEvent { "indent", "" },	Sequence{}, TypeText { " class='indent'" }, _right, endSequence{},
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

#pragma mark 3 --- Markup
resource restype_Slate (resid_Markup, "") { {
	Slate { "Markup",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "marker", "" },					Sequence{}, TypeText { "<!-- @marker \"p\" -->" }, _return, _up, _nextField, endSequence{},
		ExitEvent { "topic item", "" },				Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"<#linkDestination#>\" \"<#indent0-3#>\" \"<#[description]#>\" -->" }, _up, _nextField, endSequence{},
		ExitEvent { "topic Group", "" },	Sequence{},
			TypeText { "<!-- @topicGroup \"<#title#>\" \"<#linenum#>\" -->" }, _previousField, _previousField, endSequence{},
		ExitEvent { "topic Separator", "" },		TypeText { "<!-- @topicSep -->" },
		ExitEvent { "heading with name", "" },		TypeText { "headingWithName#" },
		ExitEvent { "heading with topics", "" },	TypeText { "headingWithTopics#" },
		ExitEvent { "heading for issue", "" },		TypeText { "headingForIssue#" },
		ExitEvent { "bug or issue", "" },	Sequence{},
			TypeText { "<!-- @topicItem \"<#title#>\" \"#BI_<#abbreviatedDate#>-01\" \"0\" \"[BI_<#abbreviatedDate#>-01]\" -->" }, _indent, _return,
			TypeText { "<h5 id='BI_<#abbreviatedDate#>-01'>__title__ [BI_<#abbreviatedDate#>-01] new</h5>" }, _return,
			endSequence{},
		ExitEvent { "current tag", "" },	Sequence{},	TypeText { "<span class='tlmark'>&lt;--</span>" }, _previousField, endSequence{},
		ExitEvent { "date mark", "" },		Sequence{},	TypeText { "<span class='tldate'>[<#date#>]</span>" }, _previousField, endSequence{},
		ExitEvent { "version marker", "" },	Sequence{}, TypeText { "<p class='tlversion'>[v<#version#> <#milestone#>]</p>" }, _previousField, _previousField, endSequence{},
		Event { "developer link", "" },					TypeText { "developerLink#" },
		ExitEvent { "developer item", "" },				TypeText { "developerItem#" },
		ExitEvent { "glossary item", "" },				TypeText { "glossaryItem#" },
		ExitEvent { "annotate code", "" },				TypeText { "annotateCode#" },
		Event { "document project", "" },				TypeText { "documentProject#" },
		Event { "document target", "" },				Sequence{}, TypeText { "documentTarget#" }, ResSubslate { resid_TargetType }, endSequence{},
		Event { "Tools item", "" },						TypeText { "toolsItem#" },
		Event { "use case", "" },						Sequence{}, TypeText { "useCase#" }, ResSubslate { resid_ucActor }, endSequence{},
		Event { "use case link", "" },					Sequence{}, TypeText { "useCaseLink#" }, endSequence{},
		Event { "use case level", "" },					ResSubslate { resid_ucLevel },
		ExitEvent { "ampersand", "" }, 		TypeText { "&amp;" },
		ExitEvent { "less than", "" }, 		TypeText { "&lt;" },
		ExitEvent { "greater than", "" }, 	TypeText { "&gt;" },
		ExitEvent { "angle brackets", "" },	Sequence{}, TypeText { "&lt;&gt;<##> " }, Keypress { kc_left, mf_option }, Keypress { kc_left, mf_option }, _left, endSequence{},
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

#pragma mark TargetType
resource restype_Slate (resid_TargetType, "") { {
	Slate { "target type",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "next field", "" },			_nextField,
		Event { "previous field", "" },		_previousField,
		_DirectionKeys_,
		ExitEvent { "Cocoa Test Bundle", "" },	TypeText { "<a href=\"XcodeDevelopment.html#AddCocoaTestBundleTarget\">Cocoa Test Bundle</a>" },
		Event { "Docs Project", "" },	TypeText { "<a href=\"XcodeDevelopment.html#AddDocsProject\">Docs Project</a>" },
		ExitEvent { "Cdoc", "" },		TypeText { "install technical documentation for repository projects" },
		ExitEvent { "Doxygen", "" },	TypeText { "compile and install Doxygen documentation" },
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

#pragma mark 5 === Cocoa
// inside: Cocoa; 1 XCTest; 2 Doxygen
resource restype_Slate (resid_Cocoa, "") { {
	Slate { "Cocoa",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "return", "" },						_return,
		Event { "continue", "" },						_return,
		Event { "clipboard", "" },						Sequence{}, Keypress { kc_right, mf_command }, Keypress { kc_left, mf_command + mf_shift }, Keypress { kc_X, mf_command }, endSequence{},
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
		Event { "Assert", "" },							ResSubslate { resid_XCTAssert },
	} }
} };

#pragma mark 1 --- XCTAssert
resource restype_Slate (resid_XCTAssert, "") { {
	Slate { "Assert",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "true", "" },			Sequence{}, TypeText { "XCTAssertTrue (<#expression#><#optMsg#>);" }, _previousField, endSequence{},
		ExitEvent { "fail", "" },			Sequence{}, TypeText { "XCTFail (<#msgFormat#>)" }, _previousField, endSequence{},
		ExitEvent { "equal objects", "" },	Sequence{}, TypeText { "XCTAssertEqualObjects (<#object_1#>, <#object_2#><#optMsg#>));" }, _previousField, _previousField, endSequence{},
		ExitEvent { "equals", "" },			Sequence{}, TypeText { "XCTAssertEquals (<#value_1#>, <#value_2#><#optMsg#>));" }, _previousField, _previousField, endSequence{},
		ExitEvent { "equals with accuracy", "" }, Sequence{}, TypeText { "XCTAssertEqualsWithAccuracy (<#value_1#>, <#value_2#>, <#accuracy#><#optMsg#>));" }, _previousField, _previousField, _previousField, endSequence{},
		ExitEvent { "nil", "" },			Sequence{}, TypeText { "XCTAssertNil (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "not nil", "" },		Sequence{}, TypeText { "XCTAssertNotNil (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "true", "" },			Sequence{}, TypeText { "XCTAssertTrue (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "false", "" },			Sequence{}, TypeText { "XCTAssertFalse (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "throw", "" },			Sequence{}, TypeText { "XCTAssertThrows (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "no throw", "" },		Sequence{}, TypeText { "XCTAssertNoThrow (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "true no throw", "" },	Sequence{}, TypeText { "XCTAssertTrueNoThrow (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "false no throw", "" },	Sequence{}, TypeText { "XCTAssertFalseNoThrow (<#expression#><#optMsg#>));" }, _previousField, endSequence{},
		ExitEvent { "verify", "" },			TypeText { "XCTAssertTrue ([verifier verify], [verifier message]);" },
	} }
} };

#pragma mark 2 --- Doxygen
resource restype_Slate (resid_Doxygen, "Doxygen") { {
	Slate { "Doxygen", {
		_DoxygenItems_
	} }
} };

#pragma mark 4 === UserSlate
resource restype_Slate (resid_UserSlate, "Slate text") { {
	Slate { "UserSlate",	{
		_SlateGlobals_,
		_CloseSubslate_,
		Event { "slate resource", "" },			TypeText { "userSlate#" },
		Event { "next field", "" },				_nextField,
		Event { "previous field", "" },			_previousField,
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
			ExitEvent { "key slash", "" },			TypeText { "slash" },
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

#pragma mark 7 === Python
resource restype_Slate (resid_Python, "") { {
	Slate { "Python",	{
		_SlateGlobals_,
		_CloseSubslate_,
		ExitEvent { "add breakpoint", "" },		Sequence{}, TypeText { "import pdb; pdb.set_trace()" }, _return, endSequence{},
		ExitEvent { "log debug", "" },			Sequence{}, TypeText { "logging.debug('')" }, _left, _left, endSequence{},
		ExitEvent { "log info", "" },			Sequence{}, TypeText { "logging.info('')" }, _left, _left, endSequence{},
		ExitEvent { "log warning", "" },		Sequence{}, TypeText { "logging.warning('')" }, _left, _left, endSequence{},
		ExitEvent { "log error", "" },			Sequence{}, TypeText { "logging.error('')" }, _left, _left, endSequence{},
		ExitEvent { "log critical", "" },		Sequence{}, TypeText { "logging.critical('')" }, _left, _left, endSequence{},
	} }
} };


#pragma mark 8 === Unix
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
			ExitEvent { "function", "" },			TypeText { "unixFunction#" },
			ExitEvent { "test", "" },				TypeText { "unixTest#" },
			ExitEvent { "test function", "" },		TypeText { "unixTestFunction#" },
			ExitEvent { "unix selection", "" }, 	TypeText { "%%%{PBXSelection}%%%" },
			ExitEvent { "assert equal", "" },		Sequence{}, TypeText { "assertEquals "_where_" <#expected#> <#actual#>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "assert not equal", "" },	Sequence{}, TypeText { "assertNotEquals "_where_" <#unexpected#> <#actual#>" }, _previousField, _previousField, endSequence{},
			ExitEvent { "assert null", "" },		Sequence{}, TypeText { "assertNull "_where_" <#value#>" }, _previousField, endSequence{},
			ExitEvent { "assert not null", "" },	Sequence{}, TypeText { "assertNotNull "_where_" <#value#>" }, _previousField, endSequence{},
			ExitEvent { "assert true", "" },		Sequence{}, TypeText { "assertTrue "_where_" <#condition#>" }, _previousField, endSequence{},
			ExitEvent { "assert false", "" },		Sequence{}, TypeText { "assertFalse "_where_" <#condition#>" }, _previousField, endSequence{},
			ExitEvent { "assert failure", "" },		TypeText { "fail "_where_"" },
	} }
} };

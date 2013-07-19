tell application "BBEdit"
	set fname to name of document 1
	set searchString to ""
	if (fname ends with "_s.html") then
		set searchString to "<!-- @marker \"([^\"]*)\" -->"
	else if (fname ends with ".html") then
		set searchString to "<!-- @marker \"([^\"]*)\" -->"
	else if (fname ends with ".worksheet") then
		set searchString to "^\\\"([^\\\"]*)\\\""
	else if (fname ends with ".r") then
		set searchString to "#pragma mark (.*)$"
	else if (fname ends with ".txt") then
		set searchString to "#pragma mark (.*)$"
	else if (fname ends with ".buildrules") then
		set searchString to "##[ \\t]*(.*)$"
	else if (fname ends with ".install") then
		set searchString to "#\\^[ \\t]*(.*)$"
	else if (fname ends with ".build") then
		set searchString to "#\\^[ \\t]*(.*)$"
	else if (fname ends with ".ksh") then
		set searchString to "#\\^[ \\t]*(.*)$"
	end if
	if (length of searchString > 0) then
		mark text 1 of document 1 options {searching for:searchString, using:"\\1", clearing existing:true}
	end if
end tell

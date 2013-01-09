--set input to "@bugOrIssue dummy"

on findEnclosed(start, finish, source)
	set begmark to offset of start in source
	set endmark to offset of finish in source
	return (characters (begmark + (length of start)) thru (endmark - 1) of source) as string
end findEnclosed

on replace(searchString, replaceString)
	tell application "BBEdit"
		replace searchString using replaceString searching in selection of text 1 of text document 1 options {search mode:literal, starting at top:false, wrap around:false, backwards:false, case sensitive:true, match words:false, extend selection:false}
	end tell
end replace

on splitName(nm)
	set len to length of nm
	set o to offset of "." in nm
	if (o > 0) then
		set extension to (characters (o + 1) thru len of nm) as string
		if (o > 1) then
			set base to (characters 1 thru (o - 1) of nm) as string
		else
			set base to ""
		end if
	else
		set base to nm
		set extension to ""
	end if
	return {base, extension}
end splitName

set savedDelimiters to AppleScript's text item delimiters
tell application "BBEdit" to activate
try
	-- select current line
	tell application "System Events"
		--		keystroke (ASCII character of 28) using {command down}
		--		keystroke (ASCII character of 29) using {command down, shift down}
	end tell
	
	-- parse selection as input
	tell application "BBEdit" to set input to selection of window 1 as string
	if (not ((count of paragraphs of input) = 2)) then
		error "syntax error: expected selection of one line of text with CR"
	end if
	if (not (character 1 of input = "@")) then
		error "syntax error: expected leading '@'"
	end if
	set stag to word 1 of input
	set paramstr to (characters ((length of stag) + 3) thru ((length of input) - 1)) of input as string
	
	-- fetch corresponding data from file Snippets.txt
	set snippetContents to read (POSIX file "/Users/carolclark/Dev/DevSupport/BBEdit/Scripts/Snippets.txt")
	set snippetText to findEnclosed("__" & stag, stag & "__", snippetContents)
	set snippet to ""
	repeat with par from 2 to (count of paragraphs of snippetText)
		set snippet to snippet & (paragraph par of snippetText)
		if (par < (count of paragraphs of snippetText)) then set snippet to snippet & return
	end repeat
	set varSpec to findEnclosed("<<", ">>", snippetText)
	
	-- make lists for variable names and input parameters
	set AppleScript's text item delimiters to {";"}
	set varList to every text item of varSpec
	set paramStart to every text item of paramstr
	set AppleScript's text item delimiters to savedDelimiters
	set paramList to {}
	repeat with param in paramStart
		set c to (first character of param) as string
		if (c = " ") then
			set param to (characters 2 thru (length of param) of param) as string
		end if
		set paramList to paramList & param
	end repeat
	
	if (stag = "snippet") then -- special treatment for snippet parameters
		set textParams to ""
		set slateParams to ""
		repeat with index from 2 to count of paramList
			set textParams to textParams & item index of paramList
			set slateParams to slateParams & "<#" & item index of paramList & "#>"
			if (index < (count of paramList)) then
				set textParams to textParams & ";"
				set slateParams to slateParams & ";"
			end if
		end repeat
		set paramList to {item 1 of paramList, textParams, slateParams}
	end if
	
	set projectname to ""
	tell application "BBEdit" to set pname to name of project document 1
	set split to splitName(pname)
	if ((item 2 of split) = "bbprojectd") and (length of item 1 of split > 0) then
		set projectname to item 1 of split
	else
		display dialog "Not a BBEdit project document."
		return
	end if
	
	tell application "BBEdit" to set selection of window 1 to snippet
	
	repeat with index from 1 to count of varList
		replace("__" & item index of varList & "__", item index of paramList)
	end repeat
	set shortdate to do shell script "date +%m/%d/20%y"
	set abbrevdate to do shell script "date +%y%m%d"
	set origpath to do shell script "pwd"
	set treeish to do shell script "cd /Users/carolclark/Dev/" & projectname & " ; git log -1 | grep commit | cut -c 8-14"
	do shell script "cd " & origpath
	
	replace("__SHORT_DATE__", shortdate)
	replace("__ABBREV_DATE__", abbrevdate)
	replace("__LASTCOMMIT_TREEISH__", treeish)
	if (stag = "snippet") then replace("__TEXT_PARAMS__", textParams)
on error emsg number enum
	display dialog {"Snippet: " & emsg & return & "num: " & enum}
	set AppleScript's text item delimiters to savedDelimiters
end try

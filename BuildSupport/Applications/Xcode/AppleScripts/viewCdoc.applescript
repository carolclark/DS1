tell application "Finder" to get container of (path to me)
set scriptpath to result as string

set frontWindow to run script file ((scriptpath & "frontWindow.scpt") as string)

set targetFile to "History_" & (workspaceName of frontWindow) & ".html" as text
set docname to (documentName of frontWindow) as text
if ((docname is not missing value) and (length of docname > 5)) then
	set ext to (characters -5 thru -1 of docname) as text
	if ext is ".html" then set targetFile to docname
end if
set targetPath to "Users:carolclark:Library:CCDev:Sites:TechnicalDocs:" & workspaceName of frontWindow & ":" & targetFile

tell application "Safari"
	open targetPath
	activate
end tell

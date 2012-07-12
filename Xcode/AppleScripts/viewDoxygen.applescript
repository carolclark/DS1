tell application "Finder" to get container of (path to me)
set scriptpath to result as string

set frontWindow to run script file ((scriptpath & "frontWindow.scpt") as string)

set targetPath to "Users:carolclark:CCDev:Sites:Doxygen:" & workspaceName of frontWindow & ":html:index.html"

tell application "Safari"
	open targetPath
	activate
end tell

property windowName : missing value
property workspaceName : missing value
property documentName : missing value
property XcodeDocument : missing value
property documentPath : missing value
set windowName to missing value
set workspaceName to missing value
set documentName to missing value
set XcodeDocument to missing value
set documentPath to missing value
tell application id "com.apple.dt.Xcode"
	set windowName to name of window 1
	set workspaceFilename to name of document of window 1
	set len to length of workspaceFilename
	set workspaceName to (characters 1 thru (len - 12)) of workspaceFilename as string
	if ((length of windowName) > (len + 7)) then
		set documentName to (characters (len + 4) thru (length of windowName)) of windowName as string
	end if
	repeat with adoc in text documents
		if ((name of adoc as string) is documentName) then
			set XcodeDocument to adoc
			set documentPath to path of XcodeDocument
			exit repeat
		end if
	end repeat
end tell
set frontWindow to {windowName:windowName, workspaceName:workspaceName, documentName:documentName, XcodeDocument:XcodeDocument, documentPath:documentPath}
return frontWindow

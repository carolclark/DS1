-- activate application "BBEdit"
validateHTML("~/Library/CCDev/Sites/TechnicalDocs/candcsoft_host/public_html", "Support", "Syntax")
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

on validateHTML(parent, fldr, checking)
	set itemName to "Folder " & checking & "…"
	set pth to parent
	if (fldr is not "") then set pth to pth & "/" & fldr
	tell application "System Events"
		tell process "BBEdit"
			click menu item itemName of menu 1 of menu item "Check" of menu 1 of menu bar item "Markup" of menu bar 1
			keystroke return
		end tell
	end tell
end validateHTML

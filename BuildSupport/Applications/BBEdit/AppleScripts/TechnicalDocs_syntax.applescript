activate application "BBEdit"
validateHTML("Links")
on validateHTML(checking)
	tell application "System Events"
		tell process "BBEdit"
			click menu item ("Folder " & checking & "É") of menu 1 of menu item "Check" of menu 1 of menu bar item "Markup" of menu bar 1
		end tell
		keystroke return
	end tell
end validateHTML

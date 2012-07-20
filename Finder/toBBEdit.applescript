on open filelist
	tell application "Finder"
		repeat with onefile in filelist
			set creator type of onefile to "R*ch"
		end repeat
	end tell
end open

on run
	choose file "Select one or more files to convert to BBEdit format:" with multiple selections allowed
	open (the result as list)
end run

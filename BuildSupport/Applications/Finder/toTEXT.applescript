on open filelist
	tell application "Finder"
		repeat with onefile in filelist
			set file type of onefile to "TEXT"
		end repeat
	end tell
end open

on run
	choose file with prompt "Select one or more files to convert to TEXT format:" with multiple selections allowed
	open (the result as list)
end run
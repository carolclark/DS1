validateHTML("~/CCDev/Sites/TechnicalDocs", "Accessor_C9", "Syntax")
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

on getCdocInfo() -- get Cdoc information for the current file of the current project
	set projectname to ""
	set basename to ""
	set cdocbasename to ""
	set extension to ""
	set isCdocSource to false
	tell application "BBEdit"
		-- set pname to name of project document 1
		set fname to name of document 1
		set upath to URL of document 1
	end tell
	set split to splitName(pname)
	if ((item 2 of split) = "bbprojectd") and (length of item 1 of split > 0) then
		set projectname to item 1 of split
		set split to splitName(fname)
		set extension to item 2 of split
		if (length of item 1 of split > 0) then
			set basename to item 1 of split
			if (extension = "html") then
				set isCdocSource to true
				set cdocbasename to basename
				if (length of basename > 2) then
					set ending to characters ((length of basename) - 1) thru (length of basename) of basename as string
					if (ending = "_s") then
						set cdocbasename to characters 1 thru ((length of basename) - 2) of basename as string
					end if
				end if
			end if
		end if
		set cdocfolder to ""
		set o to offset of "/Cdoc/" in upath
		if (o > 0) then
			set rel to (characters o thru ((length of upath) - (length of fname)) of upath) as string
			if ((length of rel) > 6) then
				set fldrname to (characters 7 thru ((length of rel) - 1) of rel) as string
				set cdocfolder to fldrname & ":"
			end if
		end if
	end if
	set info to {projectname:projectname, basename:basename, cdocbasename:cdocbasename, extension:extension, isCdocSource:isCdocSource, cdocfolder:cdocfolder}
	return info
end getCdocInfo

on validateHTML(parent, fldr, checking)
	set itemName to "Folder " & checking & "É"
	set pth to parent
	if (fldr is not "") then set pth to pth & "/" & fldr
	tell application "System Events"
		tell process "BBEdit"
			click menu item itemName of menu 1 of menu item "Check" of menu 1 of menu bar item "Markup" of menu bar 1
			if (checking = "Syntax") -- set folder on first pass
				keystroke "OG" using command down
				keystroke pth
				keystroke return
				keystroke return
			end if
			keystroke return
		end tell
	end tell
end validateHTML

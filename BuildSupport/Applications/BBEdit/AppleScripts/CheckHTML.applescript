global msg
global errcount
global warncount
global errmsg
global warnmsg
global doc
global havedoc

on run (argv)
	set site to item 1 of argv
	set fldr to item 2 of argv
	set filename to item 3 of argv
	--set site to "/Developer/Documentation/InHouse/Tech/Workspace/"
	--set fldr to ""
	--set filename to "Workspace_hist.html"

	set msg to ""
	set errcount to 0
	set warncount to 0
	set errmsg to ""
	set warnmsg to ""
	set havedoc to false

	-- checkHTML main
	set pathname to site & fldr & filename
	set osapath to unix2osa_path(pathname)
	set checking to "syntax"
	tell application "BBEdit"
		check syntax (pathname)
		set msglist to result
	end tell
	if ((length of msglist) > 0) then
		openDoc(osapath)
		processMsglist(msglist)
	end if
	if (errcount = 0) then
		set checking to "link"
		set msglist to {}
		tell application "BBEdit"
			check links (pathname)
			set msglist to result
		end tell
		if ((length of msglist) > 0) then
			openDoc(osapath)
			processMsglist(msglist)
		end if
	end if
	closedoc()
	if (errcount = 0) then
		if (warncount > 0) then set msg to "
File " & fldr & filename & ":" & warnmsg
	else
		set pl to "s"
		if errcount = 1 then
			set pl to ""
		end if
		set msg to (errcount as string) & " " & checking & " error" & pl & " found in " & fldr & filename & ":
" & errmsg
	end if
	return msg
end run

on openDoc(pth)
	if (not havedoc) then
		tell application "BBEdit"
			set doc to open file pth
			set havedoc to true
		end tell
	end if
end openDoc

on closedoc()
	if havedoc then
		tell application "BBEdit" to close window of doc
	end if
end closedoc

on unix2osa_path(unixname)
	set osaname to ""
	set i to 2
	repeat until (i > length of unixname)
		set ch to character i of unixname
		if ch = "/" then set ch to ":"
		set osaname to osaname & ch
		set i to i + 1
	end repeat
	return osaname as string
end unix2osa_path

on processMsglist(lst)
	tell application "BBEdit"
		set msgcount to count of lst
		if (msgcount > 0) then
			set mi to 1
			repeat until (mi > msgcount)
				set msgitem to item mi of lst
				set msgstring to message of msgitem
				set msgtype to "error"

				-- handle  "Remote URLnot checked" messages as warnings, not errors
				if (count of words of msgstring) > 3 then
					if (words 1 thru 4 of msgstring as string) = "RemoteURLnotchecked" then
						set msgstring to characters 25 thru (length of msgstring) of msgstring as string
						set msgtype to "warning"
					end if
				end if

				-- construct complete message text
				set msgstring to "
line " & result_line of msgitem & ": " & msgstring & "
      " & line (result_line of msgitem) of doc
				if msgtype = "error" then -- add markers for error location
					set msgstring to msgstring & "
      "
					set s1 to start_offset of msgitem
					set s2 to end_offset of msgitem
					set i to characterOffset of first character of line (result_line of msgitem) of doc
					set ch to " "
					repeat until (i > s2) or (i > characterOffset of last character of line (result_line of msgitem) of doc)
						if i = s1 then set ch to "-"
						set msgstring to msgstring & ch
						set i to i + 1
					end repeat
				end if

				-- add new item to global warning or error message
				if msgtype = "warning" then
					set warncount to warncount + 1
					set warnmsg to warnmsg & msgstring
				else
					set errcount to errcount + 1
					set errmsg to errmsg & msgstring
				end if
				set mi to mi + 1
			end repeat
		end if
	end tell
end processMsglist

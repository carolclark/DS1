-- activate application "Safari"
global origBounds
global newBounds
set origBounds to {0, 0, 100, 100}
set newBounds to {0, 0, 100, 100}
set target to name of (info for (path to frontmost application))
on calculateNewBounds()
	set maxy to 1000
	set top to item 2 of origBounds
	set height to ((item 4 of origBounds) - top)
	if height > maxy then set height to maxy
	if (top + height) > maxy then set top to (maxy - height)
	set item 2 of newBounds to top
	set item 4 of newBounds to (top + height)
	set item 1 of newBounds to item 1 of origBounds
	set item 3 of newBounds to item 3 of origBounds
end calculateNewBounds
if (target is "Safari.app") then
	tell application "Safari" to set origBounds to bounds of window 1
	calculateNewBounds()
	tell application "Safari" to set bounds of window 1 to newBounds
else
	display dialog ("FixWindow not yet implemented for " & target)
end if

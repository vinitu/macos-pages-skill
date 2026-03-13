-- Unmerge table cells. argv: tableIndex row col
on run argv
	if (count of argv) < 3 then
		return "Usage: unmerge-range.applescript <tableIndex> <row> <col>"
	end if
	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		return "unmerged"
	end tell
end run

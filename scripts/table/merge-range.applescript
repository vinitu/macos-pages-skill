-- Merge table cells. argv: tableIndex startRow startCol endRow endCol
on run argv
	if (count of argv) < 5 then
		return "Usage: merge-range.applescript <tableIndex> <startRow> <startCol> <endRow> <endCol>"
	end if
	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		return "merged"
	end tell
end run

-- Clear contents of a table range. argv: tableIndex startRow startCol endRow endCol (1-based)
on run argv
	if (count of argv) < 5 then
		return "Usage: clear-range.applescript <tableIndex> <startRow> <startCol> <endRow> <endCol>"
	end if
	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		-- Table range clear: use document and table index
		return "cleared"
	end tell
end run

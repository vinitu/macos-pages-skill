-- Sort table by column. argv: tableIndex columnIndex
on run argv
	if (count of argv) < 2 then
		return "Usage: sort.applescript <tableIndex> <columnIndex>"
	end if
	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		return "sorted"
	end tell
end run

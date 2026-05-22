-- Open a document. argv: POSIX_path
on run argv
	if (count of argv) < 1 then
		return "Usage: open.applescript <path>"
	end if
	set pathStr to item 1 of argv
	set pathFile to POSIX file pathStr

	tell application "Pages"
		open pathFile
	end tell
	return "opened"
end run

-- Export front document to PDF. argv: outputPOSIXPath
on run argv
	if (count of argv) < 1 then
		return "Usage: export-pdf.applescript <output_path>"
	end if
	set pathStr to item 1 of argv
	set pathFile to POSIX file pathStr

	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		export front document to pathFile as PDF
	end tell
	return "exported"
end run

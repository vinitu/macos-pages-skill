-- Create a new document. argv: [initialText]
on run argv
	tell application "Pages"
		set newDoc to make new document
		if (count of argv) ≥ 1 then
			set body text of newDoc to (item 1 of argv)
		end if
	end tell
	return "created"
end run

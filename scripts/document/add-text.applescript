-- Append text to front document. argv: text
on run argv
	if (count of argv) < 1 then
		return "Usage: add-text.applescript <text>"
	end if
	set textToAdd to item 1 of argv

	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		set d to front document
		set body text of d to (body text of d) & textToAdd
	end tell
	return "added"
end run

-- Get name of the front document, or empty string if none.
tell application "Pages"
	if (count of documents) is 0 then
		return ""
	end if
	return name of front document
end tell

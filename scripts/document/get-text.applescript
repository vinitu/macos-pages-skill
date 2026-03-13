-- Get body text of front document.
on run argv
	tell application "Pages"
		if (count of documents) is 0 then
			return ""
		end if
		return body text of front document
	end tell
end run

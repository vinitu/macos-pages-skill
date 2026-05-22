-- Get page count of front document.
on run argv
	tell application "Pages"
		if (count of documents) is 0 then
			return "0"
		end if
		return (count of pages of front document) as text
	end tell
end run

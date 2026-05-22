-- Set password on front document. argv: password
on run argv
	if (count of argv) < 1 then
		return "Usage: set-password.applescript <password>"
	end if
	set pwd to item 1 of argv

	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		set password of front document to pwd
	end tell
	return "set"
end run

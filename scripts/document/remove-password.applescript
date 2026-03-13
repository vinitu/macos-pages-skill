-- Remove password from front document. argv: currentPassword
on run argv
	if (count of argv) < 1 then
		return "Usage: remove-password.applescript <current_password>"
	end if
	set pwd to item 1 of argv

	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		set password of front document to ""
	end tell
	return "removed"
end run

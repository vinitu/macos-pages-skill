-- Save front document. argv: [path] (optional; if omitted saves in place)
on run argv
	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		if (count of argv) ≥ 1 then
			save front document in (POSIX file (item 1 of argv))
		else
			save front document
		end if
	end tell
	return "saved"
end run

-- Close front document. argv: save yes|no|ask
on run argv
	set saveOption to "ask"
	if (count of argv) ≥ 1 then set saveOption to item 1 of argv

	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		if saveOption is "yes" then
			close front document saving yes
		else if saveOption is "no" then
			close front document saving no
		else
			close front document saving ask
		end if
	end tell
	return "closed"
end run

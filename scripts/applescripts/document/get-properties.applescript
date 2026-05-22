-- Get document properties (name, path, modified, etc.).
on run argv
	tell application "Pages"
		if (count of documents) is 0 then
			return "No document open"
		end if
		set d to front document
		set output to "name: " & (name of d) & linefeed
		set output to output & "path: " & (path of d) & linefeed
		set output to output & "modified: " & (modified of d) & linefeed
		set output to output & "password protected: " & (password protected of d)
		return output
	end tell
end run

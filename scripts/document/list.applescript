-- List names of open documents. One per line.
on run argv
	tell application "Pages"
		set docs to every document
		set output to ""
		repeat with d in docs
			set output to output & (name of d) & linefeed
		end repeat
		return output
	end tell
end run

---
name: apple-pages
description: Create, read, edit, and export Apple Pages documents on macOS. Use for document creation, text formatting, table management, and exporting to PDF/Word/plain text. Triggers on queries about Pages, document editing, word processing, or creating formatted documents on Mac.
---

# Apple Pages Integration

Create, read, edit, and export Apple Pages documents using AppleScript (`osascript`) on macOS.

## Setup

### Prerequisites

- macOS with Pages.app installed (comes pre-installed or free from the App Store)
- Terminal with Automation permission for Pages.app

### Grant Permissions

Required macOS permissions (System Settings > Privacy & Security):

| Permission | Location | Required For |
|------------|----------|--------------|
| Automation | Privacy & Security > Automation | Controlling Pages.app via AppleScript |

The first time you run an `osascript` command targeting Pages, macOS will prompt you to allow automation access. Click "OK" to grant it.

## Commands

### Open a Document

```bash
osascript -e 'tell application "Pages" to open POSIX file "/path/to/document.pages"'
```

### Create a New Blank Document

```bash
osascript -e 'tell application "Pages" to make new document'
```

### Create a Document with Initial Text

```bash
osascript -e '
tell application "Pages"
  set newDoc to make new document
  tell body text of newDoc
    set every paragraph to "Hello, this is my document."
  end tell
end tell'
```

### Get Document Text

```bash
# Get all body text from the front document
osascript -e 'tell application "Pages" to return body text of front document'
```

### Get Document Name

```bash
osascript -e 'tell application "Pages" to return name of front document'
```

### Get Document Properties

```bash
osascript -e '
tell application "Pages"
  set doc to front document
  return {name of doc, modified of doc, file of doc}
end tell'
```

### Count Pages

```bash
osascript -e 'tell application "Pages" to return count of pages of front document'
```

### Add Text to a Document

```bash
# Append a paragraph at the end
osascript -e '
tell application "Pages"
  tell body text of front document
    set after last paragraph to "New paragraph added at the end." & return
  end tell
end tell'
```

### Set Paragraph Style (Headings, Body, etc.)

Pages uses named paragraph styles. Common built-in styles: "Title", "Subtitle", "Heading", "Heading 2", "Heading 3", "Body", "Caption".

```bash
# Set the first paragraph to Heading style
osascript -e '
tell application "Pages"
  tell body text of front document
    set paragraph style of paragraph 1 to paragraph style "Heading" of front document
  end tell
end tell'
```

### Set Text Formatting (Bold, Italic, Size, Font)

```bash
# Make the first paragraph bold and 18pt
osascript -e '
tell application "Pages"
  tell body text of front document
    set bold of paragraph 1 to true
    set size of paragraph 1 to 18
  end tell
end tell'

# Set font family
osascript -e '
tell application "Pages"
  tell body text of front document
    set font of paragraph 1 to "Helvetica Neue"
  end tell
end tell'
```

### Working with Tables

```bash
# Count tables in the document
osascript -e '
tell application "Pages"
  return count of tables of front document
end tell'

# Get cell value (row, column)
osascript -e '
tell application "Pages"
  tell table 1 of front document
    return value of cell 1 of row 1
  end tell
end tell'

# Set cell value
osascript -e '
tell application "Pages"
  tell table 1 of front document
    set value of cell 1 of row 1 to "Header"
    set value of cell 2 of row 1 to "Value"
    set value of cell 1 of row 2 to "Item A"
    set value of cell 2 of row 2 to "100"
  end tell
end tell'

# Get table dimensions
osascript -e '
tell application "Pages"
  tell table 1 of front document
    return {row count, column count}
  end tell
end tell'
```

### Export Documents

Pages supports exporting to multiple formats.

```bash
# Export as PDF
osascript -e '
tell application "Pages"
  export front document to POSIX file "/tmp/output.pdf" as PDF
end tell'

# Export as Microsoft Word (.docx)
osascript -e '
tell application "Pages"
  export front document to POSIX file "/tmp/output.docx" as Microsoft Word
end tell'

# Export as plain text
osascript -e '
tell application "Pages"
  export front document to POSIX file "/tmp/output.txt" as unformatted text
end tell'

# Export as EPUB
osascript -e '
tell application "Pages"
  export front document to POSIX file "/tmp/output.epub" as EPUB
end tell'
```

### Set Document Password

```bash
osascript -e '
tell application "Pages"
  set password of front document to "mypassword"
end tell'
```

### Print a Document

```bash
# Print with default settings
osascript -e '
tell application "Pages"
  print front document
end tell'

# Print without showing the dialog
osascript -e '
tell application "Pages"
  print front document with properties {showing print dialog:false}
end tell'
```

### Close a Document

```bash
# Close saving changes
osascript -e 'tell application "Pages" to close front document saving yes'

# Close without saving
osascript -e 'tell application "Pages" to close front document saving no'

# Close and ask user
osascript -e 'tell application "Pages" to close front document saving ask'
```

### Save a Document

```bash
# Save (existing file)
osascript -e 'tell application "Pages" to save front document'

# Save to a specific path
osascript -e '
tell application "Pages"
  save front document in POSIX file "/Users/Dmytro/Documents/my-doc.pages"
end tell'
```

### List Open Documents

```bash
osascript -e '
tell application "Pages"
  set docNames to {}
  repeat with d in documents
    set end of docNames to name of d
  end repeat
  return docNames
end tell'
```

## Best Practices

### File Paths
- Always use `POSIX file "/absolute/path"` when passing file paths to AppleScript
- Use absolute paths, not relative ones

### Document Lifecycle
1. Open or create a document
2. Make edits
3. Save or export
4. Close when done

### Performance
- For large documents, avoid reading the entire body text repeatedly
- When editing many cells in a table, batch operations where possible
- Pages.app must be running for AppleScript commands to work (it will launch automatically if not running)

### Safety
- Always save before closing if changes matter
- Use `saving ask` when unsure whether to keep changes
- Export a backup before making bulk edits

## Common Use Cases

### Create a Report

```bash
osascript -e '
tell application "Pages"
  set doc to make new document
  tell body text of doc
    set paragraph style of paragraph 1 to paragraph style "Title" of doc
    set every paragraph to "Monthly Report" & return & return
    set after last paragraph to "Summary" & return
    set paragraph style of paragraph 3 to paragraph style "Heading" of doc
    set after last paragraph to "This report covers the key metrics for the month." & return
  end tell
end tell'
```

### Extract Text for Processing

```bash
# Save document text to a file for further processing
osascript -e 'tell application "Pages" to return body text of front document' > /tmp/doc-text.txt
```

### Batch Export All Open Documents to PDF

```bash
osascript -e '
tell application "Pages"
  repeat with doc in documents
    set docName to name of doc
    set exportPath to "/tmp/" & docName & ".pdf"
    export doc to POSIX file exportPath as PDF
  end repeat
end tell'
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "not authorized" error | Grant Automation permission to terminal for Pages.app |
| Pages not responding | Quit and relaunch Pages.app, then retry |
| Export fails | Ensure the target directory exists and is writable |
| "Can't get document" error | Make sure a document is open in Pages |
| Style not found | Check exact style name with `paragraph styles of front document` |

## Technical Notes

- Uses AppleScript via `osascript` (no private APIs)
- Pages.app launches automatically when targeted by AppleScript
- All operations are performed through the Pages scripting dictionary
- Requires macOS with Pages.app (included with macOS or free from App Store)

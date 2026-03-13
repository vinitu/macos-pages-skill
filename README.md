# macOS Pages Skill

This repo stores a skill for Apple Pages.app integration on macOS via AppleScript.

## Installation

Install with `skills.sh`:

```bash
skills.sh add vinitu/macos-pages-skill
```

If you use the npm installer instead:

```bash
npx skills add vinitu/macos-pages-skill
```

## Scope

- Create new Pages documents and open existing ones.
- Read document text and properties.
- Add and format text (paragraphs, headings, bold, italic, fonts).
- Work with tables (read/write cells, get dimensions).
- Export documents to PDF, Word, plain text, and EPUB.
- Set document passwords, save, print, and close documents.

## Prerequisites

- macOS with Pages.app installed (included with macOS or free from the App Store)
- Automation permission granted to your terminal for Pages.app

## How To Use

```bash
# Create a new document
osascript -e 'tell application "Pages" to make new document'

# Get text from the front document
osascript -e 'tell application "Pages" to return body text of front document'

# Export as PDF
osascript -e '
tell application "Pages"
  export front document to POSIX file "/tmp/output.pdf" as PDF
end tell'

# Close saving changes
osascript -e 'tell application "Pages" to close front document saving yes'
```

For the full command set and examples, see `SKILL.md`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "not authorized" error | Grant Automation permission to terminal for Pages.app |
| Pages not responding | Quit and relaunch Pages.app, then retry |
| Export fails | Ensure the target directory exists and is writable |
| "Can't get document" error | Make sure a document is open in Pages |
| Style not found | Check exact style name with `paragraph styles of front document` |

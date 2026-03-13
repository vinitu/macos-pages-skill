# macOS Pages Skill

This repo stores a skill for Apple Pages.app integration on macOS via AppleScript.

## Installation

```bash
npx skills add vinitu/macos-pages-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-pages-skill
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

From the skill directory (or path where scripts are installed):

```bash
# Create new document
osascript scripts/document/create.applescript
# Get body text of front document
osascript scripts/document/get-text.applescript
# Export front document to PDF
osascript scripts/document/export-pdf.applescript "/tmp/output.pdf"
# Close front document (yes=save, no=discard, ask=prompt)
osascript scripts/document/close.applescript yes
```

For the full command set and examples, see `SKILL.md` and scripts under `scripts/`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "not authorized" error | Grant Automation permission to terminal for Pages.app |
| Pages not responding | Quit and relaunch Pages.app, then retry |
| Export fails | Ensure the target directory exists and is writable |
| "Can't get document" error | Make sure a document is open in Pages |
| Style not found | Check exact style name with `paragraph styles of front document` |

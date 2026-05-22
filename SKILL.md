---
name: macos-pages
description: Create, read, edit, and export Apple Pages documents on macOS. Use for document creation, text formatting, table management, and exporting to PDF/Word/plain text.
---

# macOS Pages

Use this skill when the task is about Apple Pages.app on macOS.

## Main Rule

Use only `scripts/commands`.
Do not call `scripts/applescripts` directly.

## Requirements

- macOS with Pages.app
- Automation permissions for the terminal.

## Public Interface

Run commands from `scripts/commands`:

- `scripts/commands/document/*`

## Commands

### Document

```bash
scripts/commands/document/add-text.sh
scripts/commands/document/close.sh
scripts/commands/document/count-pages.sh
scripts/commands/document/create.sh
scripts/commands/document/export-pdf.sh
scripts/commands/document/get-properties.sh
scripts/commands/document/get-text.sh
scripts/commands/document/list.sh
scripts/commands/document/name.sh
scripts/commands/document/open.sh
scripts/commands/document/remove-password.sh
scripts/commands/document/save.sh
scripts/commands/document/set-password.sh
```

## Safety Boundaries

- Document writes must be explicit.
- Internal AppleScript files are not public API.

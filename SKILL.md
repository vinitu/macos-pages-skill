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
- `scripts/commands/table/*`

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

### Table

```bash
scripts/commands/table/clear-range.sh
scripts/commands/table/merge-range.sh
scripts/commands/table/sort.sh
scripts/commands/table/unmerge-range.sh
```

## Output Rules

- Commands return JSON by default unless noted otherwise.
- `show.sh` opens the app and returns a small JSON envelope.
- `--json`, `--plain`, and `--format=plain|json` are not supported.

## JSON Contract

Document object:

- `name` (string)
- `body` (string)

Table cell object:

- `row` (integer, 0-based)
- `column` (integer, 0-based)
- `value` (string)

Scalar envelopes:

- `success/failure`: `{"success": true/false, "error": "..."}`

## Safety Boundaries

- Document writes must be explicit.
- Internal AppleScript files are not public API.

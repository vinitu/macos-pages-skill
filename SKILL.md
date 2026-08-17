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
- `jq` (used to wrap backend output in the JSON envelope).

## Public Interface

Run commands from `scripts/commands`:

- `scripts/commands/document/*`
- `scripts/commands/table/*`

## Output Rules

- Commands return JSON by default.
- Output shape: `{"success": true, "data": "..."}` for success, `{"success": false, "error": "..."}` for failure.
- `--json`, `--plain`, and `--format=plain|json` are not supported.
- Missing required arguments produce `{"success": false, "error": "missing <arg>"}` and exit non-zero.

## Commands

### Document

Read the front document name:

```bash
scripts/commands/document/name.sh
# {"success":true,"data":"My Document"}
```

List open document names:

```bash
scripts/commands/document/list.sh
# {"success":true,"data":"My Document\n"}
```

Read the body text of the front document:

```bash
scripts/commands/document/get-text.sh
# {"success":true,"data":"Hello World"}
```

Read document properties:

```bash
scripts/commands/document/get-properties.sh
# {"success":true,"data":"name: My Document\npath: ...\nmodified: ...\npassword protected: false"}
```

Get the page count of the front document:

```bash
scripts/commands/document/count-pages.sh
# {"success":true,"data":"3"}
```

Create a new document with optional initial text (approval required):

```bash
scripts/commands/document/create.sh "My Document"
# {"success":true,"data":"created"}
```

Append text to the front document (approval required):

```bash
scripts/commands/document/add-text.sh "Hello World"
# {"success":true,"data":"added"}
```

Open a document by POSIX path:

```bash
scripts/commands/document/open.sh "/path/to/My Document.pages"
# {"success":true,"data":"opened"}
```

Save the front document, optionally to a path (approval required):

```bash
scripts/commands/document/save.sh "/path/to/My Document.pages"
# {"success":true,"data":"saved"}
```

Export the front document to PDF (approval required):

```bash
scripts/commands/document/export-pdf.sh "/path/to/My Document.pdf"
# {"success":true,"data":"exported"}
```

Set a password on the front document (approval required):

```bash
scripts/commands/document/set-password.sh "secret"
# {"success":true,"data":"set"}
```

Remove the password from the front document (approval required):

```bash
scripts/commands/document/remove-password.sh "secret"
# {"success":true,"data":"removed"}
```

Close the front document with an optional save option (approval required):

```bash
scripts/commands/document/close.sh yes
# {"success":true,"data":"closed"}
```

### Table

Table backends operate on the front document and address tables by 1-based index.

Clear a cell range (approval required):

```bash
scripts/commands/table/clear-range.sh 1 2 2 4 4
# {"success":true,"data":"cleared"}
```

Merge a cell range (approval required):

```bash
scripts/commands/table/merge-range.sh 1 2 2 4 4
# {"success":true,"data":"merged"}
```

Unmerge a cell (approval required):

```bash
scripts/commands/table/unmerge-range.sh 1 2 2
# {"success":true,"data":"unmerged"}
```

Sort a table by column (approval required):

```bash
scripts/commands/table/sort.sh 1 2
# {"success":true,"data":"sorted"}
```

## JSON Contract

Document object:

- `name` (string)
- `body` (string)

Table cell object:

- `row` (integer, 0-based)
- `column` (integer, 0-based)
- `value` (string)

Scalar envelopes:

- success: `{"success": true, "data": "..."}`
- failure: `{"success": false, "error": "..."}`

## Safety Boundaries

- Document writes must be explicit and require user approval.
- Write commands (approval required): `create`, `add-text`, `save`, `set-password`, `remove-password`, `close`, `export-pdf`, and all table mutations (`clear-range`, `merge-range`, `unmerge-range`, `sort`).
- Read commands (`name`, `list`, `get-text`, `get-properties`, `count-pages`) are safe by default.
- Use the `CodexTest_` name prefix for any test documents and clean them up afterwards.
- Internal AppleScript files are not public API.
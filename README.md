# macOS Pages Skill

This repo stores an AI agent skill for Apple Pages.app on macOS.

The public interface is `scripts/commands`.
`scripts/applescripts` stores internal AppleScript backends and dictionary-aligned coverage.

## Installation

```bash
npx skills add vinitu/macos-pages-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-pages-skill
```

The installed global skill directory is usually `~/.agents/skills/macos-pages`.
`skills check` and `skills update` may refer to the upstream package name `macos-pages`.

| Workspace repo | Install dir | Package name |
|---|---|---|
| `macos-pages-skill/` | `~/.agents/skills/macos-pages` | `macos-pages` |

## Dependencies

- macOS with Pages.app
- Automation permission granted to your terminal app (System Settings → Privacy & Security → Automation)
- `jq` (used by `scripts/commands/_lib/common.sh` to wrap backend output in JSON)

## Public Interface

Run skill actions with:

```bash
scripts/commands/<entity>/<action>.sh [args...]
```

Output rules:

- Commands return JSON by default.
- Output shape: `{"success": true, "data": "..."}` for success, `{"success": false, "error": "..."}` for failure.
- `--json`, `--plain`, and `--format=plain|json` are not supported.
- Missing required arguments produce `{"success": false, "error": "missing <arg>"}` and exit non-zero.

## Backend Map

- `scripts/commands/document/*` → AppleScript in `scripts/applescripts/document/*`
- `scripts/commands/table/*` → AppleScript in `scripts/applescripts/table/*`

`scripts/applescripts` is internal. Do not call it directly from the skill instructions.

## Repo Layout

- `AGENTS.md` - repo rules for future agents.
- `SKILL.md` - the main skill workflow and command reference.
- `Makefile` - helper commands for dictionary dump, compile, and tests.
- `scripts/commands/` - public shell command interface.
- `scripts/applescripts/` - internal AppleScript backends in `<entity>/<action>.applescript` format.
- `tests/` - live integration checks (dictionary contract and smoke).

## Command Surface

Document:

- `scripts/commands/document/add-text.sh`
- `scripts/commands/document/close.sh`
- `scripts/commands/document/count-pages.sh`
- `scripts/commands/document/create.sh`
- `scripts/commands/document/export-pdf.sh`
- `scripts/commands/document/get-properties.sh`
- `scripts/commands/document/get-text.sh`
- `scripts/commands/document/list.sh`
- `scripts/commands/document/name.sh`
- `scripts/commands/document/open.sh`
- `scripts/commands/document/remove-password.sh`
- `scripts/commands/document/save.sh`
- `scripts/commands/document/set-password.sh`

Table:

- `scripts/commands/table/clear-range.sh`
- `scripts/commands/table/merge-range.sh`
- `scripts/commands/table/sort.sh`
- `scripts/commands/table/unmerge-range.sh`

## Examples

```bash
# Reads (safe by default)
scripts/commands/document/name.sh
scripts/commands/document/list.sh
scripts/commands/document/get-text.sh
scripts/commands/document/get-properties.sh
scripts/commands/document/count-pages.sh

# Open an existing document
scripts/commands/document/open.sh "/path/to/My Document.pages"

# Create and edit (approval required)
scripts/commands/document/create.sh "My Document"
scripts/commands/document/add-text.sh "Hello World"
scripts/commands/document/save.sh "/path/to/My Document.pages"

# Export (approval required)
scripts/commands/document/export-pdf.sh "/path/to/My Document.pdf"

# Password (approval required)
scripts/commands/document/set-password.sh "secret"
scripts/commands/document/remove-password.sh "secret"

# Close (approval required)
scripts/commands/document/close.sh yes

# Table mutations (approval required)
scripts/commands/table/clear-range.sh 1 2 2 4 4
scripts/commands/table/merge-range.sh 1 2 2 4 4
scripts/commands/table/unmerge-range.sh 1 2 2
scripts/commands/table/sort.sh 1 2
```

## Known Limits

- Table backends address tables by 1-based index in the front document and return plain status strings; richer table read/write (named tables, 0-based cell get/set) is not yet implemented.
- `export-pdf` exports the front document only; Word/plain-text export formats are not implemented.
- AppleScript backends return plain strings (not structured JSON); `run_backend` wraps them in the success envelope. Backend error conditions (e.g. "No document open") are currently returned as `data` strings rather than `success: false`.
- Tests skip automatically when Pages.app is not available (non-macOS CI).
- Use the `CodexTest_` name prefix for any test documents and clean them up afterwards.

## Validation

```bash
make compile
make test
```

`make test` runs live smoke checks against Pages.app and expects working Pages automation access.
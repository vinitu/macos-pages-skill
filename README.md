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

## Prerequisites

- macOS with Pages.app
- Automation permission granted to your terminal app

## Public Interface

Run skill actions with:

```bash
scripts/commands/<entity>/<action>.sh [args...]
```

## Backend Map

- `scripts/commands/document/*` → AppleScript in `scripts/applescripts/document/*`
- `scripts/commands/table/*` → AppleScript in `scripts/applescripts/table/*`

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

## Validation

```bash
make compile
make test
```

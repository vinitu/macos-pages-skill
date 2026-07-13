# Repo Guide

This repo stores a skill for macOS Pages.app integration.

## Public interface and internal backend

- `scripts/commands/` is the only public command surface. Run commands from the repo root with paths like `scripts/commands/<entity>/<action>.sh`.
- `scripts/applescripts/` is the internal backend. Do not call AppleScript files directly from skill instructions.
- Only commands listed in `SKILL.md` are public. Other scripts may exist for internal use or legacy cleanup.

## Goal

- Document AppleScript commands for Pages.app accurately.
- Prefer runnable examples over long prose.
- Never modify user documents without explicit approval.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-pages`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/applescripts/document/name.applescript`, `open.applescript`, `create.applescript`, `list.applescript`, `get-text.applescript`, `get-properties.applescript`, `count-pages.applescript`, `add-text.applescript`, `export-pdf.applescript`, `close.applescript`, `save.applescript`, `set-password.applescript`, `remove-password.applescript`.
- `scripts/applescripts/table/clear-range.applescript`, `merge-range.applescript`, `unmerge-range.applescript`, `sort.applescript`.
- `tests/dictionary_contract.sh`: contract test against Pages scripting dictionary.
- `tests/smoke_pages.sh`: smoke test for script layer (skips when Pages not available).
- `.github/workflows/ci-pr.yml`: PR validation, auto-merge, version bump, tag, and release flow.
- `.github/workflows/ci-main.yml`: main-branch validation, patch tag, and release flow.

## Validation

After making changes:
- run `make check` to ensure Pages is available;
- run `make test` to run dictionary contract and smoke tests;
- run `make compile` to compile all AppleScript files (syntax check);
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with Pages.app AppleScript.
- Never modify user documents without explicit approval.

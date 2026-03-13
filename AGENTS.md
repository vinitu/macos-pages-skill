# Repo Guide

This repo stores a skill for macOS Pages.app integration.

## Goal

- Document AppleScript commands for Pages.app accurately.
- Prefer runnable examples over long prose.
- Never modify user documents without explicit approval.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-pages`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/document/name.applescript`, `open.applescript`, `create.applescript`, `list.applescript`, `get-text.applescript`, `get-properties.applescript`, `count-pages.applescript`, `add-text.applescript`, `export-pdf.applescript`, `close.applescript`, `save.applescript`, `set-password.applescript`, `remove-password.applescript`.
- `scripts/table/clear-range.applescript`, `merge-range.applescript`, `unmerge-range.applescript`, `sort.applescript`.
- `tests/dictionary_contract.sh`: contract test against Pages scripting dictionary.
- `tests/smoke_pages.sh`: smoke test for script layer (skips when Pages not available).
- `.github/workflows/ci-pr.yml`, `ci-main.yml`: CI on PR and push to main.

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

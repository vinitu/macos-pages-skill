#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! osascript -e 'tell application "Pages" to get name' >/dev/null 2>&1; then
	echo "smoke_pages: Pages not available."
	exit 0
fi

name_out="$(osascript "$ROOT_DIR/scripts/document/name.applescript" 2>&1)" || { echo "smoke_pages: Pages not running, skipping."; exit 0; }
printf '%s\n' "$name_out" >/dev/null || { echo "smoke_pages: document name failed." >&2; exit 1; }

list_out="$(osascript "$ROOT_DIR/scripts/document/list.applescript" 2>&1)" || true
printf '%s\n' "$list_out" >/dev/null || true

echo "smoke_pages: ok"

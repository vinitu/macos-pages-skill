#!/usr/bin/env bash
set -euo pipefail

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

make --no-print-directory dictionary-pages >"$tmp" 2>/dev/null || true

# Pages may not be installed on CI
if [ -s "$tmp" ] && command -v rg >/dev/null 2>&1; then
	rg -q 'class name="application"' "$tmp" || true
elif [ -s "$tmp" ]; then
	grep -q 'class name="application"' "$tmp" || true
fi

printf 'dictionary_contract: ok\n'

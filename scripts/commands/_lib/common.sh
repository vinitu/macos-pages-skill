#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

JQ_BIN="${JQ_BIN:-}"
if [[ -z "$JQ_BIN" ]]; then
  if JQ_BIN="$(command -v jq 2>/dev/null)"; then
    :
  elif [[ -x "/opt/homebrew/bin/jq" ]]; then
    JQ_BIN="/opt/homebrew/bin/jq"
  else
    JQ_BIN=""
  fi
fi

json_fail() { local msg="$1"; printf '{"success":false,"error":"%s"}\n' "$msg"; exit 1; }
json_ok() { local payload="${1:-{}}"; printf '{"success":true,"data":%s}\n' "$payload"; }
require_arg() { local v="${1:-}" l="$2"; [[ -z "$v" ]] && json_fail "missing ${l}"; }

# Wrap a raw backend string in the success JSON envelope.
json_wrap() {
  local raw="${1:-}"
  [[ -n "$JQ_BIN" ]] || json_fail "jq required but not found"
  printf '%s' "$raw" | "$JQ_BIN" -R -s -c '{success:true,data:.}'
}

backend_script() { local e="$1" a="$2"; printf '%s/scripts/applescripts/%s/%s.applescript' "$ROOT_DIR" "$e" "$a"; }

run_backend() {
  local e="$1" a="$2"; shift 2
  local sp; sp="$(backend_script "$e" "$a")"
  [[ -f "$sp" ]] || json_fail "backend script not found: ${sp}"
  local out
  if ! out="$(osascript "$sp" "$@" 2>/dev/null)"; then
    json_fail "backend failed: ${a}"
  fi
  json_wrap "$out"
}
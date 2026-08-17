#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/add-text.sh "Hello World"
#   {"success":true,"data":"added"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <text>" >&2; }

main() {
  [[ $# -lt 1 ]] && { usage >&2; json_fail "missing text"; }
  run_backend document add-text "$@"
}

main "$@"
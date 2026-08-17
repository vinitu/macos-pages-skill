#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/table/sort.sh 1 2
#   {"success":true,"data":"sorted"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <tableIndex> <columnIndex>" >&2; }

main() {
  [[ $# -lt 2 ]] && { usage >&2; json_fail "missing table sort args"; }
  run_backend table sort "$@"
}

main "$@"
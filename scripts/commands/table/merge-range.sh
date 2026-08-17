#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/table/merge-range.sh 1 2 2 4 4
#   {"success":true,"data":"merged"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <tableIndex> <startRow> <startCol> <endRow> <endCol>" >&2; }

main() {
  [[ $# -lt 5 ]] && { usage >&2; json_fail "missing table range args"; }
  run_backend table merge-range "$@"
}

main "$@"
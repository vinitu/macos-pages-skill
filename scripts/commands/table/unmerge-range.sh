#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/table/unmerge-range.sh 1 2 2
#   {"success":true,"data":"unmerged"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <tableIndex> <row> <col>" >&2; }

main() {
  [[ $# -lt 3 ]] && { usage >&2; json_fail "missing table unmerge args"; }
  run_backend table unmerge-range "$@"
}

main "$@"
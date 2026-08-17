#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/open.sh "/path/to/My Document.pages"
#   {"success":true,"data":"opened"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <path>" >&2; }

main() {
  [[ $# -lt 1 ]] && { usage >&2; json_fail "missing path"; }
  run_backend document open "$@"
}

main "$@"
#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/export-pdf.sh "/path/to/My Document.pdf"
#   {"success":true,"data":"exported"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <output-path>" >&2; }

main() {
  [[ $# -lt 1 ]] && { usage >&2; json_fail "missing output-path"; }
  run_backend document export-pdf "$@"
}

main "$@"
#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/save.sh "/path/to/My Document.pages"
#   {"success":true,"data":"saved"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") [path]" >&2; }

main() {
  run_backend document save "$@"
}

main "$@"
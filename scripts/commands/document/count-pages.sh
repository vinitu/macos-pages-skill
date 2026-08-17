#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/count-pages.sh
#   {"success":true,"data":"3"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0")" >&2; }

main() {
  run_backend document count-pages "$@"
}

main "$@"
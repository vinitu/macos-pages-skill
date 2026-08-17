#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/get-text.sh
#   {"success":true,"data":"Hello World"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0")" >&2; }

main() {
  run_backend document get-text "$@"
}

main "$@"
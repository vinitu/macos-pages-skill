#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/close.sh yes
#   {"success":true,"data":"closed"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") [yes|no|ask]" >&2; }

main() {
  run_backend document close "$@"
}

main "$@"
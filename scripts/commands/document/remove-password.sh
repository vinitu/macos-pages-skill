#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/remove-password.sh "secret"
#   {"success":true,"data":"removed"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <current-password>" >&2; }

main() {
  [[ $# -lt 1 ]] && { usage >&2; json_fail "missing current-password"; }
  run_backend document remove-password "$@"
}

main "$@"
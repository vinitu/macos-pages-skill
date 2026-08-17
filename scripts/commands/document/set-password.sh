#!/usr/bin/env bash
# Output: JSON envelope.
# Example: scripts/commands/document/set-password.sh "secret"
#   {"success":true,"data":"set"}
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() { echo "Usage: $(basename "$0") <password>" >&2; }

main() {
  [[ $# -lt 1 ]] && { usage >&2; json_fail "missing password"; }
  run_backend document set-password "$@"
}

main "$@"